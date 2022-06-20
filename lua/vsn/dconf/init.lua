local C = {}

function C:load()

  require ("vsn.dconf.defaultConfig")

  require ("vsn.dconf.settings").load_options()

end

return C
