-- Pandoc filter that turns the report's markdown conventions into styled HTML:
--   * a paragraph of only inline code is either the masthead kicker, a row of
--     status badges (all-caps), or a card's location/req line
--   * the first table is the stat row
--   * links to sibling .md files point at the rendered .html pages

local seen_kicker = false
local seen_stats = false

local BADGE_TONE = {
  ["LIVE"] = "go", ["ROLLING"] = "go", ["ROLLING REVIEW"] = "go",
  ["HARD DEADLINE"] = "urgent",
  ["NOT YET POSTED"] = "later",
  ["LIKELY CLOSED"] = "closed", ["RETURNERS ONLY"] = "closed",
}

local function only_code(inlines)
  local codes = {}
  for _, el in ipairs(inlines) do
    if el.t == "Code" then
      table.insert(codes, el)
    elseif el.t ~= "Space" and el.t ~= "SoftBreak" then
      return nil
    end
  end
  if #codes == 0 then return nil end
  return codes
end

local function is_caps(s)
  return s:upper() == s and s:match("%u") ~= nil
end

function Para(p)
  local codes = only_code(p.content)
  if not codes then return nil end

  if not seen_kicker then
    seen_kicker = true
    return pandoc.Div(pandoc.Plain(codes[1].text), {class = "kicker"})
  end

  local all_caps = true
  for _, c in ipairs(codes) do
    if not is_caps(c.text) then all_caps = false end
  end

  if all_caps then
    local spans = {}
    for _, c in ipairs(codes) do
      local tone = BADGE_TONE[c.text] or "caution"
      table.insert(spans, pandoc.Span(c.text, {class = "badge badge-" .. tone}))
      table.insert(spans, pandoc.Space())
    end
    return pandoc.Div(pandoc.Plain(spans), {class = "badges"})
  end

  return pandoc.Div(pandoc.Plain(codes[1].text), {class = "meta"})
end

function Table(t)
  if not seen_stats then
    seen_stats = true
    t.classes:insert("stats")
  else
    t.classes:insert("facts")
  end
  return t
end

function Link(l)
  l.target = l.target:gsub("^([^:/#]+)%.md(#?)", "%1.html%2")
  return l
end

-- Run Para before Table so the kicker is the first code-only paragraph.
return {
  {Para = Para},
  {Table = Table, Link = Link},
}
