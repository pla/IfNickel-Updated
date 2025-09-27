local function trainArrive(event)
  local train = event.train
  if train.valid then
    if train.state == defines.train_state.wait_station and event.old_state == defines.train_state.arrive_station then
      if (train.get_item_count("nickel-ore") and train.get_item_count("nickel-ore") > 0) or (train.get_item_count("nickel-plate") and train.get_item_count("nickel-plate") > 0) then
        local car = train.carriages[1]
        if car and car.valid then
          if car.force and car.force.valid then
            for k, v in pairs(car.force.players) do
              v.unlock_achievement("bring-us-a-shrubbery")
            end
          end
        end
      end
    end
  end
end

--script.on_event(
--  {defines.events.on_train_changed_state},
--  trainArrive
--)

script.on_configuration_changed(
  function()
    for redacted, theForce in pairs(game.forces) do
      for k, v in pairs(theForce.technologies) do
        if v.researched then
          for k2, v2 in pairs(v.effects) do
            if v2.recipe then
              theForce.recipes[v2.recipe].enabled = true
            end
          end
        end
      end
    end
  end
)
