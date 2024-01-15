-- utils to create table of specs for lazy loading
-- this comes from the official GitHub repo (see below)
-- https://github.com/folke/lazy.nvim#-structuring-your-plugins
LAZY_PLUGIN_SPEC = {}

function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
