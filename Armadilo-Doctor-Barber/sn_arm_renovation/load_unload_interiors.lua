Citizen.CreateThread(function()

    local ipls = {{
        hash = GetHashKey("arm_doctor_ymap"),
        coords = vector3(-3660.6355, -2598.2192, -11.927169)
    },}
    local ipls = {{
        hash = GetHashKey("arm_barber_ymap"),
        coords = vector3(-3668.1404, -2597.9895, -10.719719)
    }}

    while true do

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        for k, v in pairs(ipls) do

            local distance = #(coords - v.coords)

            if distance < 125 and not IsImapActive(v.hash) then
                RequestImap(v.hash)
                print("LOADING: sn_arm_renovation_active")
            end

            if distance > 150 and IsImapActive(v.hash) then
                RemoveImap(v.hash)
                print("UNLOADING: sn_arm_renovation_inactive")
            end
            Wait(100)
        end

        Citizen.Wait(1000)

    end
end)