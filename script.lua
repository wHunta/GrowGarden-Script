-- Grow a Garden Script (GitHub Hosted)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local Window = Library:CreateWindow({Title = "Grow a Garden", Center = true})

-- 1. Sheckle Generator
Window:AddButton({
    Text = "Get 999,999 Sheckles",
    Func = function()
        game:GetService("ReplicatedStorage").Events.AddCurrency:FireServer("Sheckles", 999999)
    end
})

-- 2. Auto-Collect Seeds
Window:AddToggle({
    Text = "Auto Farm Seeds",
    Callback = function(state)
        getgenv().AutoFarm = state
        while AutoFarm do
            for _,v in pairs(game:GetService("Workspace").Seeds:GetChildren()) do
                if v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector)
                end
            end
            task.wait(0.5)
        end
    end
})

-- 3. Pet Spawner
Window:AddDropdown({
    Text = "Spawn Pet",
    Values = {"Raccoon", "Cat", "Dog"},
    Callback = function(pet)
        game:GetService("ReplicatedStorage").Events.SpawnPet:FireServer(pet)
    end
})

Library:Init()
