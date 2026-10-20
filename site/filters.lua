-- Pandoc filter that turns the report's markdown conventions into styled HTML:
--   * a paragraph of only inline code is either the masthead kicker, a row of
--     status badges (all-caps), or a card's location/req line
--   * the first table is the stat row, other tables with a header row are
--     grids (the job board's degree x sector jump table), headerless ones are
--     a card's fact block
--   * links to sibling .md files point at the rendered .html pages

local seen_kicker = false
local seen_stats = false

local BADGE_TONE = {
  ["LIVE"] = "go", ["ROLLING"] = "go", ["ROLLING REVIEW"] = "go",
  ["HARD DEADLINE"] = "urgent",
  ["NOT YET POSTED"] = "later",
  ["LIKELY CLOSED"] = "closed", ["RETURNERS ONLY"] = "closed",
  -- job board
  ["NEW GRAD"] = "go", ["REVIEW BEGINS"] = "urgent",
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

local function has_header(t)
  for _, row in ipairs(t.head.rows) do
    for _, cell in ipairs(row.cells) do
      if #cell.contents > 0 then return true end
    end
  end
  return false
end

function Table(t)
  if not seen_stats then
    seen_stats = true
    t.classes:insert("stats")
    -- The numbers normally sit in the header row; flag tables written the
    -- other way round so the CSS can enlarge the body row instead.
    local first = t.head.rows[1] and t.head.rows[1].cells[1]
    if first and not pandoc.utils.stringify(first.contents):match("^%s*%d") then
      t.classes:insert("stats-labels-first")
    end
  elseif has_header(t) then
    t.classes:insert("grid")
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
