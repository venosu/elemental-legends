local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()

local MainTab = Library:CreateTab('Main')
local EggTab = Library:CreateTab('Hatch')
local MiscTab = Library:CreateTab('Misc')

MainTab:CreateToggle('Auto Tap', function(tap)
    if tap then 
        _G.Tap = true
        while wait() do 
        if _G.Tap then
        game.ReplicatedStorage.Main.Remotes.ClientRequest:FireServer('klikniecie')
        end 
        end 
    else 
        _G.Tap = false    
    end 
end)

MainTab:CreateToggle('Auto Sell', function(sell)
    if sell then 
        local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart
        _G.Sell = true 
        while wait(1) do 
        if _G.Sell then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Sell.Sell.TouchPartSell.CFrame + Vector3.new(0,3,0)
        end 
        end 
    else 
        _G.Sell = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe.CFrame
    end 
end)

MainTab:CreateToggle('Auto Rebirth', function(rebirth)
    if rebirth then 
        _G.Rebirth = true 
        while wait() do 
        if _G.Rebirth then 
        game.ReplicatedStorage.Main.Remotes.ClientRequest:FireServer(_G.RebirthSelected)
        end 
        end 
    else 
        _G.Rebirth = false 
    end 
end) 

MainTab:CreateDropDown('Rebirth Select', {'Rebirth Fire', 'Rebirth Earth', 'Rebirth Water'}, function(rebirtht)
    _G.RebirthSelected = rebirtht 
end) 

--[[MainTab:CreateToggle('Auto Farm Diamonds', function(t)
if t then 
_G.Farm1 = true
while true do 
if _G.Farm1 then
for i,v in pairs(game.Workspace.Storage.Diamonds:GetChildren()) do 
    if v.Transparency ~= 1 then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame 
        wait(5.5)
    end 
end 
end
end
else 
_G.Farm1 = false 
end
end)]]

EggTab:CreateToggle('Auto Hatch', function(hatch)
    if hatch then
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
        tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(workspace.Eggs[_G.EggSelected].UIanchor.Position)})
        tween:Play()
        _G.Hatch = true 
        while wait() do 
        if _G.Hatch then 
        game.ReplicatedStorage.Main.Remotes.ActionRequest:InvokeServer('EggOpen', {EggName=_G.EggSelected,Type=_G.TypeSelected})
        end 
        end 
    else 
        _G.Hatch = false 
    end 
end) 

local Eggs = {}
for i,v in pairs(game.Workspace.Eggs:GetChildren()) do 
    table.insert(Eggs, v.Name)
end 

EggTab:CreateDropDown('Egg Select', Eggs, function(egg)
    _G.EggSelected = egg 
end)

EggTab:CreateDropDown('Egg Type', {'Single', 'Triple'}, function(eggt)
    _G.TypeSelected = eggt 
end) 

MiscTab:CreateButton('Redeem Codes', function()
for i,v in pairs(game.Players.LocalPlayer.Codes:GetChildren()) do 
    game.ReplicatedStorage.Main.Remotes.CodeActivated:InvokeServer(v.Name)
end 
end)

local Chests = {} 

for i,v in pairs(game.Workspace.Chests:GetChildren()) do 
    table.insert(Chests, v.Name)
end 

MiscTab:CreateToggle('Auto Collect Chests', function(t)
if t then 
_G.Chests = true 
while wait() do
if _G.Chests then
for i,v in pairs(Chests) do 
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.Chests[v].BillboardPart.TouchPart, 0)
    wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.Chests[v].BillboardPart.TouchPart, 0)
end
end 
end
else 
_G.Chests = false
end
end)
