
local rentalnpc
local starterpackpoint = lib.points.new({
   coords = vec3(882.1019, -1573.2881, 29.8214),
   distance = 30.0,
})

function starterpackpoint:onEnter()
   local npc = `mp_m_shopkeep_01`
   local loadnpc = lib.requestModel(npc, 2000)

   if not loadnpc then return end
   rentalnpc = CreatePed(4, npc, 882.1019, -1573.2881, 29.8214, 352.1116, false, true)
   FreezeEntityPosition(rentalnpc, true)
   SetEntityInvincible(rentalnpc, true)
   SetBlockingOfNonTemporaryEvents(rentalnpc, true)
   SetModelAsNoLongerNeeded(npc)
   exports.ox_target:addLocalEntity(rentalnpc, { {
      label = 'Claim Starter Pack',
      name = 'rentalsystem',
      icon = 'fa-solid fa-sack-dollar',
      distance = 2.0,
      onSelect = function()
         lib.callback('ClaimStarterPack', 5000, function(success, message)
            if success then
               lib.notify({ type = 'success', description = message })
               return
            end

            lib.notify({ type = 'error', description = message })
         end)
      end
   } })
end

function starterpackpoint:onExit()
   DeleteEntity(rentalnpc)
end
