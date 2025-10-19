local rm = require("recipe-modify")
local tf = require("techfuncs")
local parts = require("variable-parts")
local cu = require("category-utils")

if mods["248k-Redux"] then
  --electronic era
  if parts.experimental then
    rm.ReplaceIngredient("fu_burner_recipe", "electronic-circuit", "flow-controller", 5)
    rm.ReplaceIngredient("el_grower_recipe", "iron-gear-wheel", "invar-valve", 10)
    rm.RemoveIngredient("el_grower_recipe", "electronic-circuit", 10)
  else
    rm.AddIngredient("fu_burner_recipe", "invar-valve", 5)
    rm.ReplaceIngredient("el_grower_recipe", "iron-gear-wheel", "invar-valve", 10)
  end

  rm.ReplaceIngredient("el_burner_recipe", "electronic-circuit", parts.motor, 10)
  rm.RemoveIngredient("el_burner_kerosene_recipe", "pipe", 10)
  rm.AddIngredient("el_burner_kerosene_recipe", "invar-valve", 5)
  if not mods["BrassTacks-Updated"] then
    rm.ReplaceProportional("el_burner_kerosene_recipe", "pipe", "engine-unit", 0.5)
  end
  rm.RemoveIngredient("fu_burner_recipe", "pipe", 10)

  rm.ReplaceIngredient("el_arc_furnace_recipe", "steel-plate", "invar-plate", 5)
  rm.ReplaceIngredient("el_caster_recipe", "steel-plate", "invar-plate", 5)
  rm.ReplaceIngredient("el_caster_recipe", "electronic-circuit", parts.motor, 10)

  rm.ReplaceIngredient("el_pressurizer_recipe", "electronic-circuit", parts.motor, 10)
  rm.ReplaceIngredient("el_pressurizer_recipe", "iron-gear-wheel", "invar-valve", 10)

  if parts.brassExperiment then
    rm.ReplaceIngredient("el_purifier_recipe", "electronic-circuit", parts.motor, 5)
  else
    rm.ReplaceIngredient("el_purifier_recipe", "iron-gear-wheel", parts.motor, 10)
  end

  rm.ReplaceIngredient("el_water_generator_recipe", "electronic-circuit", parts.motor, 20)

  --fission era
  if not mods["space-exploration"] then
    --who allowed a mixture of hyphens and underscores. killing and biting
    rm.AddIngredient("fi_low-density-structure_recipe", "invar-plate", 2)
  end
  if not parts.brassExperiment then
    rm.ReplaceIngredient("fi_solid_reactor_recipe", "steel-plate", "invar-plate", 100)
  end

  if parts.experimental then
    rm.RemoveIngredient("fi_crafter_recipe", "iron-gear-wheel", 10)
    rm.AddIngredient("fi_crafter_recipe", "machining-tool", 2)
    if mods["space-exploration"] then
      rm.AddIngredient("fi_refinery_recipe", "advanced-flow-controller", 10)
    else
      rm.AddIngredient("fi_refinery_recipe", "flow-controller", 20)
    end
  else
    rm.AddIngredient("fi_refinery_recipe", "invar-valve", 20)
  end

  if (mods["aai-industry"] or mods["ThemTharHills-Updated"]) and not mods["BrassTacks-Updated"] then
    rm.ReplaceProportional("fi_crusher_recipe", "engine-unit", "electric-engine-unit", 0.67)
    rm.ReplaceProportional("fi_fiberer_recipe", "engine-unit", "electric-engine-unit", 0.67)
    rm.ReplaceProportional("fi_compound_machine_recipe", "engine-unit", "electric-engine-unit", 0.67)
    tf.removePrereq("electric-engine", "fi_caster_tech")
    tf.addPrereq("fi_crusher_tech", "electric-engine")
  end

  --fusion era
  if data.raw.item["nickel-electromagnet"] then
    rm.AddIngredient("fu_activator_recipe", "nickel-electromagnet", 10)
    rm.AddIngredient("fu_magnet_recipe", "nickel-electromagnet", 50)
    rm.AddIngredient("fu_plasma_recipe", "nickel-electromagnet", 50)
    rm.AddIngredient("fu_magnet_1_recipe", "nickel-electromagnet", 1)
    rm.AddProductRaw("fu_magnet_1_recipe", {type="item", name="nickel-electromagnet", amount=1, probability=0.75, ignored_by_productivity=1, ignored_by_stats=1})
    if data.raw["assembling-machine"]["fu_magnet_entity"] then
      data.raw["assembling-machine"]["fu_magnet_entity"].ingredient_count = nil
    end
  end

  if parts.experimental then
    if mods["space-exploration"] then
      if parts.bz.titanium then
        rm.AddIngredient("fu_turbine_recipe", "self-regulating-valve", 20)
        rm.AddIngredient("fu_boiler_recipe", "self-regulating-valve", 20)
        rm.AddIngredient("fu_exchanger_item_recipe", "self-regulating-valve", 20)
      else
        rm.AddIngredient("fu_turbine_recipe", "advanced-flow-controller", 1)
        rm.AddIngredient("fu_boiler_recipe", "advanced-flow-controller", 1)
        rm.AddIngredient("fu_exchanger_item_recipe", "advanced-flow-controller", 1)
      end
    else
      rm.AddIngredient("fu_turbine_recipe", "invar-valve", 20)
      rm.AddIngredient("fu_boiler_recipe", "flow-controller", 20)
      rm.AddIngredient("fu_exchanger_item_recipe", "flow-controller", 20)
    end
    rm.AddIngredient("fu_space_probe_probe_recipe", "gimbaled-thruster", 25)
    rm.AddIngredient("fu_space_probe_deep_probe_recipe", "gimbaled-thruster", 50)

    rm.AddIngredient("gr_crafter_recipe", "advanced-machining-tool", 10)
  else
    rm.AddIngredient("fu_turbine_recipe", "invar-valve", 20)
    rm.AddIngredient("fu_boiler_recipe", "invar-valve", 20)
    rm.AddIngredient("fu_exchanger_item_recipe", "invar-valve", 20)
  end
end
