local parts = require("variable-parts")

local allowed_recipes = {
  "nickel-plate",
  "invar-plate",
  "motor", --aai electric motor already prodmoddable
  "invar-valve",
  parts.motor .. "-silver",

  "motorized-articulator",
  "flow-controller",
  "cooling-fan",
  "gimbaled-thruster",
  "nickel-electromagnet",
  "advanced-flow-controller",

  "enriched-nickel",
  "enriched-nickel-plate",
  "molten-nickel",

  "flow-controller-biological",
  "advanced-flow-controller-biological",

  "nitinol-plate",
  "nitinol-plate-helium",
  "nitinol-mesh",
  "nitinol-mesh-beryllium",
  "self-regulating-valve"
}

for k, v in pairs(allowed_recipes) do
  if data.raw.recipe[v] then
    local va = data.raw.recipe[v].allowed_module_categories or {}
    table.insert(va, "productivity")
    data.raw.recipe[v].allowed_module_categories = va
  end
end

for k, v in pairs(data.raw["map-gen-presets"]["default"]) do
  if type(v) == "table" and v.basic_settings and v.basic_settings.autoplace_controls and v.basic_settings.autoplace_controls["copper-ore"] then
    v.basic_settings.autoplace_controls["nickel-ore"] = table.deepcopy(v.basic_settings.autoplace_controls["copper-ore"])
  end
end

require("deadlock")
require("compat.final")
