local parts = {}
parts.experimental = settings.startup["ifnickel-experimental-intermediates"].value
parts.zinc = mods["BrassTacks"]
parts.steelValve = settings.startup["ifnickel-steel-valve"].value
if parts.zinc then
  parts.brassExperiment = settings.startup["brasstacks-experimental-intermediates"].value
else
  parts.brassExperiment = false
end
parts.aai = mods["aai-industry"]

parts.invartech = mods["galdocs-manufacturing"] and "gm-nickel-and-invar-machined-part-processing" or "invar-processing"

parts.motor = "motor"
if parts.aai then
  parts.motor = "electric-motor"
end

function parts.preferred(ingredients, quantities)
  for k, v in ipairs(ingredients) do
    if data.raw.item[v] then
      return {v, quantities[k]}
    end
  end
end

function parts.optionalIngredient(item, amount)
  if data.raw.item[item] then
    return {item, amount}
  end
end

if mods["bzfoundry"] and not settings.startup["bzfoundry-minimal"].value then
  parts.foundryEnabled = true
else
  parts.foundryEnabled = false
end

parts.nitinol = false
if parts.experimental and mods["space-exploration"] and mods["bztitanium"] then
  parts.nitinol = true
end

return parts
