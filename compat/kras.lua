local rm = require("recipe-modify")
local tf = require("techfuncs")
local parts = require("variable-parts")

if mods["advanced-chemical-plant"] and not mods["Krastorio2"] then
  if mods["space-exploration"] then
    rm.AddIngredient("kr-advanced-chemical-plant", "bioscrubber", 4) --they use valves/flowcontrollers and also why tf not
    if parts.experimental then
      rm.AddIngredient("kr-advanced-chemical-plant", "advanced-flow-controller", 8)
    else
      rm.AddIngredient("kr-advanced-chemical-plant", "invar-valve", 32)
    end
  else
    if parts.experimental then
      rm.AddIngredient("kr-advanced-chemical-plant", "flow-controller", 32)
    else
      rm.AddIngredient("kr-advanced-chemical-plant", "invar-valve", 32)
    end
  end
  if not mods["BrassTacks"] then
    rm.AddIngredient("kr-advanced-chemical-plant", "electric-engine-unit", 4) --nobody can escape my insistence on shoving this item in every high end recipe. nobody!
  end
end

if mods["AdvancedAssemblyMachineStandalone"] and not mods["Krastorio2"] then
  rm.RemoveIngredient("assembling-machine-3", "electric-engine-unit", 99999) -- :O
  if parts.experimental then
    rm.AddIngredient("kr-advanced-assembling-machine", "cooling-fan", 6)
  end
end

if mods["Krastorio2"] then
  if parts.experimental then
    if not mods["space-exploration"] then
      --unreasonable for something that can only be placed in space
      rm.AddIngredient("kr-research-server", "cooling-fan", 10)
      rm.AddIngredient("kr-advanced-research-server", "cooling-fan", 20)
      rm.AddIngredient("ai-core", "cooling-fan", 2)
    end
    tf.addPrereq("advanced-radar", "injection-molding")
    rm.AddIngredient("kr-advanced-radar", "cooling-fan", 1)
    rm.AddIngredient("energy-control-unit", "cooling-fan", 2)
    rm.AddIngredient("biusart-lab", "cooling-fan", 5)

    rm.AddIngredient("kr-big-passive-provider-container", "motorized-articulator", 5)
    rm.AddIngredient("kr-big-active-provider-container", "motorized-articulator", 5)
    rm.AddIngredient("kr-big-requester-container", "motorized-articulator", 5)
    rm.AddIngredient("kr-big-buffer-container", "motorized-articulator", 5)
    rm.AddIngredient("kr-big-storage-container", "motorized-articulator", 5)

    rm.ReplaceIngredient("kr-steel-pump", "kr-steel-pipe", "flow-controller", 1)

    rm.AddIngredient("kr-electrolysis-plant", "flow-controller", 5)
    rm.AddIngredient("kr-filtration-plant", "flow-controller", 5)
    rm.ReplaceIngredient("kr-atmospheric-condenser", "electronic-circuit", "flow-controller", 4)
    rm.ReplaceIngredient("kr-fuel-refinery", "electronic-circuit", "flow-controller", 5)

    rm.AddIngredient("kr-air-purifier", "cooling-fan", 5)
    tf.addPrereq("kr-air-purification", "injection-molding")

    if mods["space-exploration"] then
      rm.AddIngredient("kr-advanced-chemical-plant", "advanced-flow-controller", 10)
    else
      rm.AddIngredient("kr-advanced-chemical-plant", "flow-controller", 25)
    end

    rm.AddIngredient("kr-atmospheric-condenser", "cooling-fan", 10)
    tf.addPrereq("kr-atmosphere-condensation", "injection-molding")
  else
    rm.AddIngredient("kr-big-passive-provider-container", parts.motor, 10)
    rm.AddIngredient("kr-big-active-provider-container", parts.motor, 10)
    rm.AddIngredient("kr-big-requester-container", parts.motor, 10)
    rm.AddIngredient("kr-big-buffer-container", parts.motor, 10)
    rm.AddIngredient("kr-big-storage-container", parts.motor, 10)

    rm.ReplaceIngredient("kr-steel-pump", "kr-steel-pipe", "invar-valve", 1)

    rm.AddIngredient("kr-electrolysis-plant", "invar-valve", 5)
    rm.AddIngredient("kr-filtration-plant", "invar-valve", 5)
    rm.AddIngredient("kr-atmospheric-condenser", "invar-valve", 4)
    rm.AddIngredient("kr-fuel-refinery", "invar-valve", 5)

    rm.AddIngredient("kr-atmospheric-condenser", parts.motor, 10)

    rm.AddIngredient("kr-advanced-chemical-plant", "invar-valve", 25)
  end
  tf.addPrereq("valves", "kr-basic-fluid-handling")
  tf.addPrereq("kr-fluids-chemistry", "valves")
  rm.AddIngredient("kr-fluid-burner", "invar-valve", 2)

  rm.AddIngredient("kr-medium-passive-provider-container", parts.motor, 2)
  rm.AddIngredient("kr-medium-active-provider-container", parts.motor, 2)
  rm.AddIngredient("kr-medium-requester-container", parts.motor, 2)
  rm.AddIngredient("kr-medium-buffer-container", parts.motor, 2)
  rm.AddIngredient("kr-medium-storage-container", parts.motor, 2)

  if not mods["aai-industry"] then
    rm.AddIngredient("kr-superior-inserter", "electric-engine-unit", 1)
    rm.AddIngredient("kr-superior-long-inserter", "electric-engine-unit", 1)
    rm.AddIngredient("kr-superior-filter-inserter", "electric-engine-unit", 1)
    rm.AddIngredient("kr-superior-long-filter-inserter", "electric-engine-unit", 1)
  end

  rm.ReplaceIngredient("kr-fuel-refinery", "iron-gear-wheel", parts.motor, 5)
  rm.ReplaceIngredient("kr-gas-power-station", "electronic-circuit", parts.motor, 5)

  rm.ReplaceIngredient("armor-piercing-rifle-magazine", "steel-plate", "invar-plate", 2)
  rm.ReplaceIngredient("armor-piercing-anti-material-rifle-magazine", "steel-plate", "invar-plate", 3)

  tf.addRecipeUnlock("kr-enriched-ores", "enriched-nickel")
  tf.addRecipeUnlock("kr-enriched-ores", "enriched-nickel-plate")
  tf.addRecipeUnlock("kr-enriched-ores", "dirty-water-filtration-nickel")
end

if mods["FluidMustFlow"] then
  if mods["Expensive_Fluid_Must_Flow_Recipes"] then
    rm.ReplaceIngredient("non-return-duct", "iron-gear-wheel", "invar-valve", 4)
    rm.RemoveIngredient("non-return-duct", "kr-steel-gear-wheel", 4)
  else
    rm.RemoveIngredient("non-return-duct", "iron-gear-wheel", 4)
    rm.AddIngredient("non-return-duct", "invar-valve", 2)
  end

  if parts.experimental then
    if mods["space-exploration"] then
      tf.addPrereq("Ducts", "advanced-flow-controller")

      rm.AddIngredient("duct-end-point-intake", "advanced-flow-controller", 1)
      rm.RemoveIngredient("duct-end-point-intake", "pipe", 6)
      rm.RemoveIngredient("duct-end-point-intake", "kr-steel-pipe", 6)

      rm.AddIngredient("duct-end-point-outtake", "advanced-flow-controller", 1)
      rm.RemoveIngredient("duct-end-point-outtake", "pipe", 6)
      rm.RemoveIngredient("duct-end-point-outtake", "kr-steel-pipe", 6)
    else
      rm.ReplaceIngredient("duct-end-point-intake", "pipe", "flow-controller", 6)
      rm.RemoveIngredient("duct-end-point-intake", "kr-steel-pipe", 6)

      rm.ReplaceIngredient("duct-end-point-outtake", "pipe", "flow-controller", 6)
      rm.RemoveIngredient("duct-end-point-outtake", "kr-steel-pipe", 6)
    end
  else
    rm.ReplaceIngredient("duct-end-point-intake", "pipe", "invar-valve", 6)
    rm.RemoveIngredient("duct-end-point-intake", "kr-steel-pipe", 6)

    rm.ReplaceIngredient("duct-end-point-outtake", "pipe", "invar-valve", 6)
    rm.RemoveIngredient("duct-end-point-outtake", "kr-steel-pipe", 6)
  end

  if not rm.CheckIngredient("duct-end-point-intake", "electric-engine-unit") then
    --don't worry electric engine unit. i still love you
    tf.addPrereq("Ducts", "electric-engine")
    rm.AddIngredient("duct-end-point-intake", "electric-engine-unit", 1)
    rm.AddIngredient("duct-end-point-outtake", "electric-engine-unit", 1)
  end
end
