local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
	PlayerData.job = job
end)

RegisterCommand("mekanikücret", function()
  local ped = PlayerPedId()
  local job = QBCore.Functions.GetPlayerData().job.name
        if Config.vehiclepayjob[job] then
        for k,v in pairs(Config.vehiclepay) do
          local vehicle = GetVehiclePedIsIn(ped, false) 
          local car = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)) 
          if car == v.name then
          local cars = math.floor(v.price / 3)
          QBCore.Functions.Notify("Bu arabayı "..cars.." dolara fulleyebilirsin", 'error')
        end
      end
    else 
      QBCore.Functions.Notify("Mekanik Değilsin", 'error')

    end
end)



RegisterCommand("arabaname", function()
  local me = PlayerPedId()
  local car = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(me)))                    -- GetEntityModel  Arabanın Modelini çeker  -- GetDisplayNameFromVehicleModel arabanın ismini çeker
  print (car)
end)