

getgenv().whitelisted = true
--[[                        warn("Wait 7 Seconds Script Is Loading!")
                            wait(0.1)
                            repeat
                                wait(0.1)
                            until game:IsLoaded()

                            wait(7)
                            
                            local Crash = function()
                                while true do end
                            end
                            local Kick = clonefunction(game.Players.LocalPlayer.Kick);
                            --
                            local HookedCheck = function(func)
                                if islclosure(func) then
                                    return true;
                                end
                                local info = debug.getinfo(func)
                                if info.source ~= "=[C]" or info.short_src ~= "[C]" or info.what ~= "C" then
                                    return true;
                                end
                                return false;
                            end
                            --
                            local success, error = pcall(function()
                                loadstring("\t\t")()
                                loadstring("getgenv().whitelisted = true")();
                            end)
                            if not success then
                                Kick(Codes["Check"]["TamperingDetected"]); Crash();
                            end
                            if not getgenv().whitelisted then Kick(Codes["Check"]["TamperingDetected"]) end
                            if game:GetService("RunService"):IsStudio() then Kick(Codes["Check"]["TamperingDetected"]); Crash(); end
                            --
                            if pcall(islclosure) then
                                if debugeverything then
                                    print("islclosure"); return;
                                end
                                Crash();
                            end;
                            if not request or HookedCheck(islclosure) or HookedCheck(debug.getinfo) or HookedCheck(request) then
                                if debugeverything then
                                    print("http spy"); return;
                                end
                                    Crash();
                                end
                            --
                            local CheckAllThese = {math.random, os.clock, string.char, string.byte, pcall, setfenv, iscclosure, loadstring, math.floor, string.sub}
                            for i = 1, #CheckAllThese do
                                if (pcall(setfenv, CheckAllThese[i], {})) or (HookedCheck(CheckAllThese[i])) then
                                    if debugeverything then
                                        print("checkallthese"); return;
                                    end
                                    Crash();
                                end
                            end
                        --- dont mess with above ---
]]
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/SWIMHUBISWIMMING/cracked/refs/heads/main/surge.gg/assets/drawing"))()

local function getCustomAsset(path)
    if not isfile(path) then
        writefile(path, crypt.base64.decode(path))
    end
    return getcustomasset(path)
end

local os_clock = os.clock();
local FPS = string.split(game.Stats.Workspace.Heartbeat:GetValueString(), ".");
local camera = game:GetService("Workspace").Camera;
local Camera = game:GetService("Workspace").Camera
local Camera = game:GetService("Workspace").CurrentCamera
local Cam = game:GetService("Workspace").Camera
local CharcaterMiddle = game:GetService("Workspace").Ignore.LocalCharacter.Middle
local Mouse = game.Players.LocalPlayer:GetMouse()
local lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local Decimals = 2
local Clock = os.clock()
local OsClock = os.clock()
local Camera = game:GetService("Workspace").Camera
local CameraPred = game:GetService("Workspace").CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local CharcaterMiddle = game:GetService("Workspace").Ignore.LocalCharacter.Middle

if not LPH_OBFUSCATED then
LPH_JIT = function(...) return ... end
LPH_JIT_MAX = function(...) return ... end
LPH_JIT_ULTRA = function(...) return ... end
LPH_NO_VIRTUALIZE = function(...) return ... end
LPH_ENCSTR = function(...) return ... end
LPH_STRENC = function(...) return ... end
LPH_HOOK_FIX = function(...) return ... end
LPH_CRASH = function() return print(debug.traceback()) end
end;

do
    local Library = loadstring(request({Url='https://raw.githubusercontent.com/SWIMHUBISWIMMING/cracked/refs/heads/main/surge.gg/assets/ui',Method='GET'}).Body)();--loadstring(request({Url='https://scriptguardv1.vercel.app/api/Combined.js?pathname=/UIV2',Method='POST'}).Body)()
    
    local Tabs = {
    main = Library:addTab("main", ""),
    visuals = Library:addTab("visuals", ""),
    misc = Library:addTab("misc", ""), 
    world = Library:addTab("world", ""), 
    private = Library:addTab("private", ""),
    settings = Library:addTab("settings", "")
    }
    
    local trident = {
        loaded = false,
        gc = {
            isgrounded = nil,
            camera = nil
        },
            lastpos = nil,
            middlepart = nil,
            tcp = nil,
        }
            
    local RunService = game:GetService("RunService")

    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
    FOVCircle.Radius = 80
    FOVCircle.Color = Color3.fromRGB(45, 116, 202)
    FOVCircle.Visible = false

    local Line = Drawing.new("Line")
    Line.Color = Color3.fromRGB(255, 255, 255)
    Line.From = Vector2.new(game.Workspace.CurrentCamera.ViewportSize.X / 2, game.Workspace.CurrentCamera.ViewportSize.Y / 2)
    Line.Thickness = 1
    Line.Visible = true
    Line.ZIndex = 1

    local Decode = base64.decode

    local workspace = game.Workspace
    local playerListCache = {}
    local lastUpdated = 0
    local snaplineTarget = nil
    getgenv().SilentEnabled = false

    Config = {
        Manipulation = {
            Enabled = false,
            Angles = 30,
            Radius = 6,
            Direction = "Normal",
            Vector = Vector3.new(0, 0, 0)
        },
    } 

    local modules = {
        ["PlayerClient"] = {},
        ["Character"] = {},
        ["BowClient"] = {},
        ["Camera"] = {},
        ["RangedWeaponClient"] = {},
        ["GetEquippedItem"] = {},
        ["FPS"] = {},
    }

    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and islclosure(v) then
            local info = debug.getinfo(v)
            local name = string.match(info.short_src, "%.([%w_]+)$")

            if name and modules[name] and info.name ~= nil then
                modules[name][info.name] = info.func
            end
        end
    end

    local playerListCache = {}
    local snaplineTarget = nil

    local PlayerList = debug.getupvalue(modules.PlayerClient.updatePlayers, 1);

    if not PlayerList then
        error("PlayerList function not found.")
    end

    local function GetPlayer()
        local closest, playerTable = nil, nil
        local closestMagnitude = math.huge
        for _, v in pairs(debug.getupvalue(modules.PlayerClient.updatePlayers, 1) or {}) do
            if v.type == "Player" and v.model:FindFirstChild("Head") and not v.sleeping then
                local PartPos, OnScreen = Camera:WorldToViewportPoint(v.model:GetPivot().Position)
                local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                local PlayerDistance = (workspace.Ignore.LocalCharacter.Middle:GetPivot().Position - v.model:GetPivot().Position).Magnitude

                if Magnitude < FOVCircle.Radius and PlayerDistance <= 9999 and Magnitude < closestMagnitude and OnScreen then
                    closestMagnitude = Magnitude
                    closest = v.model
                    playerTable = v
                end
            end
        end
        return closest, playerTable
    end

    local function updateTarget()
        local target = snaplineTarget
        if target then
            getgenv().Target = target
        end
    end

    getgenv().PlayersVelocity = nil
    local function updateSnapline()
        local Target, playerData = GetPlayer()
        if Target and Target:FindFirstChild("Head") then
            local headPos, onScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(Target.Head.Position)
            Line.Visible = onScreen

            if onScreen then
                Line.To = Vector2.new(headPos.X, headPos.Y)
                snaplineTarget = Target
                getgenv().PlayersVelocity = playerData.velocityVector
            else
                snaplineTarget = nil
                getgenv().PlayersVelocity = nil
            end
        else
            Line.Visible = false
            snaplineTarget = nil
            getgenv().PlayersVelocity = nil
        end
    end

    local CharacterList = debug.getupvalues(modules.Character.getGroundCastResult)

    local function GetProjectileInfo()
        local equippedItem = CharacterList[2].GetEquippedItem()
        
        if equippedItem == nil then
            return 0, 0
        else
            local projectileSpeed = equippedItem.ProjectileSpeed
            local projectileDrop = equippedItem.ProjectileDrop
            if projectileSpeed == nil or projectileDrop == nil then
                return 0, 0
            else
                return projectileSpeed, projectileDrop
            end
        end
    end

    local Cam = workspace.CurrentCamera

    getgenv().Predict = function(Player, Velocity)
        local PSpeed, PDrop = GetProjectileInfo()

        if PSpeed and PDrop then
            while true do
                if Player.Position then
                    local Dist = (Player.Position - Cam.CFrame.Position).Magnitude
                    
                    if Dist > 0 then
                        local TimeToHit = Dist / PSpeed 
                        
                        local PPos1 = Player.Position + (Velocity * TimeToHit * 3.4)
                        
                        local Drop = -PDrop ^ (TimeToHit * PDrop) + 1.1
                        local PPos = PPos1 - Vector3.new(0, Drop, 0)
                        
                        return PPos, TimeToHit
                    end
                end
                
                wait()
            end
        end
        
        return Vector3.new(0, 0, 0), nil
    end

    local OldHook
    local StackLVL = nil

    OldHook = hookmetamethod(Random.new(), "__namecall", newcclosure(function(self, ...) -- swimhub moment
        if StackLVL == nil then
            local Executor = identifyexecutor()

            if Executor == "Nihon" then
                StackLVL = 5
            elseif Executor == "Delta" then
                StackLVL = 4
            elseif Executor == "Wave" then
                StackLVL = 3
            elseif Executor == "Arceus X" then
                StackLVL = 3
            elseif Executor == "Codex" then
                StackLVL = 3
            else
                StackLVL = 3
            end
        end

        local stack = debug.getstack(StackLVL, 4)

        if stack and getgenv().SilentEnabled and getgenv().Target and getgenv().PlayersVelocity and Config.Manipulation.Enabled then
            local targetHead = getgenv().Target.Head
            local predictedPos = getgenv().Predict(targetHead, getgenv().PlayersVelocity)

            if predictedPos then
                local targetPos = CFrame.lookAt(workspace.CurrentCamera.CFrame.p, predictedPos) * CFrame.new(Config.Manipulation.Vector)
                setstack(StackLVL, 4, targetPos)
            end
        end

        return OldHook(self, ...)
    end))

    local RunService = game:GetService("RunService")
    local GuiService = game:GetService("GuiService")
    local workspace = game:GetService("Workspace")

    local drawingObjects = {
        background = Drawing.new('Square'),
        inside = Drawing.new('Square')
    }

    local barBackground = drawingObjects.background
    local barInside = drawingObjects.inside

    barBackground.Size = Vector2.new(115, 11)
    barInside.Size = Vector2.new(0, 11)
    barBackground.Color = Color3.fromRGB(24, 24, 24)
    barInside.Color = Color3.fromHSV(0.5, 1, 1)
    barBackground.Filled = true
    barInside.Filled = true

    local manipBarVisible = false
    local speed = 1
    local timeCounter = 0

    local function updateVisibility()
        barBackground.Visible = manipBarVisible
        barInside.Visible = manipBarVisible
    end

    local function updateManipulationBar()
        if not getgenv().SilentEnabled then
            speed = 1
        else
            if Config.Manipulation.Direction ~= "Normal" and Config.Manipulation.Enabled then
                speed = 3
            else
                speed = 1
            end
        end

        timeCounter = (timeCounter + RunService.Heartbeat:Wait() * speed) % 1
        local barWidth = barBackground.Size.X
        local screenCenter = GuiService:GetScreenResolution() / 2
        local barCenter = screenCenter + Vector2.new(-barWidth / 2, 70)

        barBackground.Position = barCenter
        barInside.Position = barCenter - Vector2.new(timeCounter * barWidth / 2, 0) + Vector2.new(barWidth / 2, 1.6)
        barInside.Size = Vector2.new(timeCounter * barWidth, 5.7)
        barInside.Color = Color3.fromHSV(0.28 - (timeCounter / 4), 1, 1)
        updateVisibility()
    end

    local function isPartVisibleFromPosition(part, observerPosition)
        local direction = (part.Position - observerPosition).unit
        local ray = Ray.new(observerPosition, direction * (part.Position - observerPosition).magnitude)
        local ignore = workspace.Ignore:GetDescendants()
        local hit = workspace:FindPartOnRayWithIgnoreList(ray, ignore)
        return hit and hit.Name == part.Name
    end

    local function isAnyPartVisibleFromPosition(Target, partNames, observerPosition)
        for _, partName in ipairs(partNames) do
            local part = Target:FindFirstChild(partName)
            if part and isPartVisibleFromPosition(part, observerPosition) then
                return true
            end
        end
        return false
    end

    local function calculateBestOffset(Target)
        local bestDirection = "Normal"
        local bestOffset = Vector3.new()

        for angle = 0, 360, 15 do
            local radianAngle = math.rad(angle)
            for xOffset = 1, 3 do
                for yOffset = -4, 4 do
                    local x = math.cos(radianAngle) * xOffset
                    local offset = Vector3.new(x, yOffset, 0)

                    if isAnyPartVisibleFromPosition(Target, {"Head", "Torso"}, game.Workspace.CurrentCamera.CFrame.Position + offset) then
                        bestDirection = angle
                        bestOffset = offset
                        return bestDirection, bestOffset
                    end
                end
            end
        end

        return bestDirection, bestOffset
    end

    local function canHitTargetDirectly(Target)
        local targetHead = Target:FindFirstChild("Head")
        if targetHead then
            return isAnyPartVisibleFromPosition(Target, {"Head", "Torso"}, game.Workspace.CurrentCamera.CFrame.Position)
        end
        return false
    end

    task.spawn(function()
        while task.wait(0.3) do
            if getgenv().SilentEnabled and Config.Manipulation then
                local Target = GetPlayer()
                if Target and Target:FindFirstChild("Head") then
                    if canHitTargetDirectly(Target) then
                        Config.Manipulation.Direction = "Normal"
                        Config.Manipulation.Vector = Vector3.new()
                        manipBarVisible = false
                    else
                        local bestDirection, bestOffset = calculateBestOffset(Target)
                        if Target == nil then
                            manipBarVisible = false
                        end
                        Config.Manipulation.Direction = bestDirection
                        Config.Manipulation.Vector = bestDirection == "Normal" and Vector3.new() or bestOffset

                        manipBarVisible = bestDirection ~= "Normal"
                    end
                end
            end
        end
    end)

    --RunService.Heartbeat:Connect(updateManipulationBar)

    local function onRenderStepped()
        updateSnapline()
        updateTarget()
    end

    RunService.RenderStepped:Connect(onRenderStepped)

    local Silent = Tabs.main:createGroup('left', 'Rage')
    
    Silent:addToggle({text = "Silent Aim",default = false,flag = "Silent Aim",callback = function(state)
        getgenv().SilentEnabled = state
    end})
    --- Manipulation --
    Silent:addToggle({text = "Manipulation",default = false,flag = "Manipulation",callback = function(state)
        Config.Manipulation.Enabled = state
    end})
    Silent:addSlider({text = "Angles", min = 1, max = 15, suffix = "%", float = 1, default = 1, flag = "angles",callback = function(Value)
        Config.Manipulation.Angles = Value
    end})
    Silent:addSlider({text = "Radius", min = 1, max = 6, suffix = "%", float = 1, default = 1, flag = "radius",callback = function(Value)
        Config.Manipulation.Radius = Value
    end})
    --- Fov Circle --- 
    Silent:addToggle({text = "Fov Circle",default = false,flag = "Fov Circle",callback = function(Value)
        FOVCircle.Visible = Value
    end}):addColorpicker({text = "Fov Color", ontop = false, flag = "FOVCircleColor", color = Color3.fromRGB(45, 116, 202), callback = function(Value)
        FOVCircle.Color = Value
    end}) 
    Silent:addSlider({text = "Fov Circle:", min = 0, max = 200, suffix = "%", float = 1, default = 50, flag = "FOVCircle.Radius",callback = function(Value)
        FOVCircle.Radius = Value
    end})
    Silent:addToggle({text = "SnapLine",default = false,flag = "SnapLine",callback = function(Value)
        Line.Visible = Value
    end}):addColorpicker({text = "SnapLine Color", ontop = false, flag = "SnapLineColor", color = Color3.fromRGB(255, 255, 255), callback = function(Value)
        Line.Color = Value
    end}) 
    Silent:addSlider({text = "SnapLine Thickness:", min = 1, max = 1.5, suffix = "%", float = 0.1, default = 1.5, flag = "Line.Thickness",callback = function(Value)
        Line.Thickness = Value
    end})

    local rep = cloneref(game:GetService("ReplicatedStorage"))
    local ogmod = rep.Shared.entities.Player.Model

    local oldindex1
    oldindex1 = hookmetamethod(game, "__index", newcclosure(function(self, index)
    if not checkcaller() and (index == "CanCollide" or index == "Transparency" or index == "Size") and (self.Name == "Torso" or self.Name == "Head") then
            return ogmod[self.Name][index]
        end
        return oldindex1(self,index)
    end))

    local HBE = Tabs.main:createGroup('right', 'Hitbox | Etc')
   
    local char = {}
    local h = { enabled = false, sizeX = 1, sizeY = 1, sizeZ = 1 }
    local maxSize = 50
    local processedCache = {}

    function char:updatehitbox()
        for _, v in pairs(PlayerList) do
            if not processedCache[v] then
                if v.type == "Player" and v.model:FindFirstChild("HumanoidRootPart") and not v.sleeping then
                    local t = v.model:FindFirstChild("Torso")
                    if t then
                        t.Size = h.enabled and Vector3.new(h.sizeX, h.sizeY, h.sizeZ) or Vector3.new(0.6530659198760986, 2.220424175262451, 1.4367451667785645)
                        t.CanCollide = false
                        t.Transparency = h.enabled and 0.8 or 0
                    end
                    processedCache[v] = true
                end
            end
        end
    end

    local function checkSizes()
        local naughty = false
        if h.sizeX > maxSize then
            h.sizeX = maxSize
            naughty = true
        end
        if h.sizeY > maxSize then
            h.sizeY = maxSize
            naughty = true
        end
        if h.sizeZ > maxSize then
            h.sizeZ = maxSize
            naughty = true
        end
        if naughty then
            local Player = game:GetService("Players").LocalPlayer
            -- bro
            --Player:Kick("Reason Expected You Overided A Check In Script")
        end
    end

    workspace.ChildAdded:Connect(function(v)
        task.delay(1, function()
            if v:FindFirstChild("Head") and v:FindFirstChild("Torso") then
                processedCache[v] = nil
                char:updatehitbox()
            end
        end)
    end)

    game:GetService("Players").PlayerRemoving:Connect(function(player)
        for _, v in pairs(PlayerList) do
            if v == player then
                processedCache[v] = nil
            end
        end
    end)
    
    HBE:addToggle({text = "Hitbox", default = false, flag = "Hitbox", callback = function(state)
        h.enabled = state
    end})  
    
    HBE:addSlider({text = "Hitbox X", min = 1, max = 50, suffix = "%", float = 1, default = 1, flag = "_G.Torsox", callback = function(Value)
        h.sizeX = Value
        checkSizes()
        char:updatehitbox()
    end})
    
    HBE:addSlider({text = "Hitbox Y", min = 1, max = 50, suffix = "%", float = 1, default = 1, flag = "_G.Torsoy", callback = function(Value)
        h.sizeY = Value
        checkSizes()
        char:updatehitbox()
    end})
    
    HBE:addSlider({text = "Hitbox Z", min = 1, max = 50, suffix = "%", float = 1, default = 1, flag = "_G.Torsoz", callback = function(Value)
        h.sizeZ = Value
        checkSizes()
        char:updatehitbox()
    end})
    
    HBE:addSlider({text = "Transparency:", min = 0.1, max = 1, suffix = "%", float = 0.1, default = 1, flag = "Tranps",callback = function(Value)
        for _, v in pairs(PlayerList) do
            local t = v.model.Torso
            if t then
                t.Transparency = Value
            end
        end
    end})
    
    local hitboxOverrider = false
    
    local function generateScaleFactors()
        local scaleFactors = {}
        local baseScales = {0.008, 0.009, 0.008}
        local decrement = 0.0003
    
        for pitch = 30, -10, -5 do
            local scales = {}
            if pitch >= 0 then
                scales = {baseScales[1] - (30 - pitch) * decrement, baseScales[2] - (30 - pitch) * decrement, baseScales[3] - (30 - pitch) * decrement}
            else
                scales = {baseScales[1] - (30 + pitch) * decrement, baseScales[2] - (30 + pitch) * decrement, baseScales[3] - (30 + pitch) * decrement}
            end
            table.insert(scaleFactors, {threshold = pitch, scales = scales})
        end
    
        table.insert(scaleFactors, {threshold = -math.huge, scales = {0.006, 0.005, 0.006}})
    
        return scaleFactors
    end
    
    local scaleFactors = generateScaleFactors()
    
    function char:GenVector(targetPos)
        local direction = (targetPos - Camera.CFrame.Position).unit
        local lookDirection = Camera.CFrame.LookVector
    
        local pitch = math.deg(math.asin(lookDirection.Y))
    
        local scaleValues = {0, 0, 0}
    
        for _, entry in ipairs(scaleFactors) do
            if pitch > entry.threshold then
                scaleValues = entry.scales
                break
            end
        end
    
        local magnitude = (targetPos - Camera.CFrame.Position).Magnitude
    
        return Vector3.new(
            direction.X * (magnitude * scaleValues[1]),
            direction.Y * (magnitude * scaleValues[2]),
            direction.Z * (magnitude * scaleValues[3])
        )
    end
    
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    
    local oldIndex = mt.__namecall
    mt.__namecall = function(...)
        local method = getnamecallmethod()
        local args = {...}
    
        if method == "FireServer" then
            local eventId, eventType, hitPart = args[2], args[3], args[7]
    
            if eventId == 10 and eventType == "Hit" and hitPart == "Torso" or hitPart == "Head" then
                local genVector = char:GenVector(args[9])
                args[8] = Vector3.new(genVector.X, genVector.Y, genVector.Z)
            end
        end
    
        return oldIndex(table.unpack(args))
    end

    local meta = getrawmetatable(game)
    setreadonly(meta, false)
    
    local oldIndex = meta.__namecall
    meta.__namecall = function(...)
        local method = getnamecallmethod()
        local args = {...}
        if args[2] == 10 and args[3] == "Hit" and args[7] == "Torso" and hitboxoverrider then
            args[7] = "Head"
        end
        return oldIndex(table.unpack(args))
    end
    
    setreadonly(meta, true)
    
    HBE:addToggle({text = "HitboxOverRider",default = false,flag = "hitboxoverrider",callback = function(state)
        hitboxoverrider = state
    end})

    ------ Ambient ------  
    local Lighting = game:GetService("Lighting")

    local DesiredColor = Color3.fromRGB(255, 255, 255)
    local ambientenabled = false
    local color = ambientenabled and DesiredColor or Lighting.Ambient 


    if ambientenabled then 
        color = DesiredColor
    end

    local ambientFunc = {
        TimeOfDay = Lighting.TimeOfDay,
        Ambient = Lighting.Ambient,
        GlobalShadows = Lighting.GlobalShadows,
        ColorShift_Top = Lighting.ColorShift_Top,
        ColorShift_Bottom = Lighting.ColorShift_Bottom,
        FogEnd = Lighting.FogEnd,
        FogStart = Lighting.FogStart,
        FogColor = Lighting.FogColor,
    }

    local SpoofedAmbient2; SpoofedAmbient2 = hookmetamethod(game, "__index", newcclosure(function(self, string)
        if checkcaller() then 
            return SpoofedAmbient2(self, string, value)
        end
        if self == Lighting and ambientFunc[string] then
            return ambientFunc[string]
        end
        return SpoofedAmbient2(self, string)
    end))

    local SpoofedAmbient1; SpoofedAmbient1 = hookmetamethod(game, "__newindex", newcclosure(function(self, string, value)
        if checkcaller() then 
            return SpoofedAmbient1(self, string, value)
        end
        if self == Lighting then
            ambientFunc[string] = value
            if string == "Ambient" then
                color = ambientenabled and DesiredColor or value
                return SpoofedAmbient1(self, string, color)
            end
        end
        return SpoofedAmbient1(self, string, value)
    end))

    local WorldVisuals = Tabs.world:createGroup('left', 'World')

    WorldVisuals:addToggle({text = "Ambient",default = false,flag = "Ambient",callback = function(state)
        ambientenabled = state
    end}) 

    WorldVisuals:addColorpicker({text = "Ambient Color", ontop = false, flag = "DesiredColor", color = Color3.fromRGB(255, 255, 255), callback = function(Value)
        DesiredColor = Value
    end})

    ------ FieldOfView ------
    local Camera = game.Workspace.CurrentCamera
    local default_fov = 70
    local zoom = 120
    local zoom_enabled = false
    local zoom_amount = 30
    local fovFunc = {
        FieldOfView = Camera.FieldOfView
    }

    local SpoofedFov2; SpoofedFov2 = hookmetamethod(game, "__index", newcclosure(function(self, string)
        if checkcaller() then
            return SpoofedFov2(self, string)
        end
        if self == Camera and fovFunc[string] then
            return fovFunc[string]
        end
        return SpoofedFov2(self, string)
    end))

    local SpoofedFov1; SpoofedFov1 = hookmetamethod(game, "__newindex", newcclosure(function(self, string, value)
        if checkcaller() then
            return SpoofedFov1(self, string, value)
        end
        if self == Camera then
            fovFunc[string] = value
            if string == "FieldOfView" then
                return SpoofedFov1(self, string, default_fov)
            end
        end
        return SpoofedFov1(self, string, value)
    end))

    local FeildOfView = Tabs.visuals:createGroup('right', 'FeildOfView | Zoom')

    FeildOfView:addSlider({text = "FeildOfView", min = 1, max = 120, suffix = "%", float = 1, default = 70, flag = "view",callback = function(Value)
        default_fov = Value
    end})

    local ExploitsTab = Tabs.misc:createGroup('left', 'Exploits')

    local trident = { -- swimhub moment start
        loaded = false,
        gc = {
            isgrounded = nil,
            character = nil,
            camera = nil
        },
    }

    LPH_JIT_MAX(function()
        for i, v in pairs(getgc(true)) do
            if type(v) == "table" then
                if type(rawget(v, "updateCharacter")) == "function" then
                    trident.gc.character = v
                end
                
                if type(rawget(v, "SetMaxRelativeLookExtentsY")) == "function" then
                    trident.gc.camera = v
                end
            end
        end
    end)()   

    local noatvrestriction = false

    task.spawn(function()
        local thing = trident.gc.camera.SetMaxRelativeLookExtentsY
        while wait() do
            if noatvrestriction then thing(10000) end
        end
    end) -- swimhub moment end

    ExploitsTab:addToggle({text = "NoLookRestriction",default = false,flag = "NoLookRestriction",callback = function(state)
        noatvrestriction = state
    end})

    --> Player Visuals // Esp <--

    wait(0.1)
    repeat
        wait(0.1)
    until game:IsLoaded()

    wait(0.5)

    local Cache = {}
    local Cache2 = {}
    local CornerBoxes = false
    local WeaponType = true
    local Names = true
    local Bar = false
    local MaxDistance = 700

    local modules = {
        ["PlayerClient"] = {},
    }
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and islclosure(v) then
            local info = debug.getinfo(v)
            local name = string.match(info.short_src, "%.([%w_]+)$")
            if name and modules[name] and info.name then
                modules[name][info.name] = info.func
            end
        end
    end

    local PlayerList = debug.getupvalue(modules.PlayerClient.updatePlayers, 1)
    if not PlayerList then
        error("PlayerList function not found.")
    end

    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    if playerGui:FindFirstChild("XDEDEADEDE") then
        playerGui.XDEDEADEDE:Destroy()
    end

    local Beamed = {
        Varis = {
            RunService = game:GetService("RunService"),
            Camera = game:GetService("Workspace").CurrentCamera,
            Lighting = game:GetService("Lighting"),
            UserInput = game:GetService("UserInputService"),
            LogService = game:GetService("LogService"),
        },
    }

    local BeamVar = Beamed.Varis
    local VisibilityState = {}
    local BarValue = 100 

    local function CreateClass(Class, Properties)
        local ClassInt = typeof(Class) == "string" and Instance.new(Class) or Class
        for Property, Value in next, Properties do
            ClassInt[Property] = Value
        end
        return ClassInt
    end

    local XDEDEADEDE = CreateClass("ScreenGui", {
        Parent = playerGui,
        Name = "XDEDEADEDE",
    })

    local function DupeCheck(name)
        local existingESP = XDEDEADEDE:FindFirstChild(name)
        if existingESP then
            existingESP:Destroy()
        end
    end

    local function IsSleeping(model)
        if model and model:FindFirstChild("AnimationController") and model.AnimationController:FindFirstChild("Animator") then
            for _, v in pairs(model.AnimationController.Animator:GetPlayingAnimationTracks()) do
                if v.Animation.AnimationId == "rbxassetid://13280887764" then
                    return true
                end
            end
        end
        return false
    end

    local function Calc(distance)
        local maxBarWidth = 4
        local minBarWidth = 1
        local distanceThreshold = 200

        if distance > distanceThreshold then
            return minBarWidth
        else
            local scaleFactor = (distanceThreshold - distance) / distanceThreshold
            return maxBarWidth * scaleFactor + minBarWidth
        end
    end

    local function IsVisible(model)
        local humanoidRootPart = model:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then return false end

        local cameraPos = BeamVar.Camera.CFrame.Position
        local targetPos = humanoidRootPart.Position
        local direction = (targetPos - cameraPos).unit
        local distance = (targetPos - cameraPos).magnitude

        if distance > MaxDistance then
            return false
        end

        local rays = {
            Ray.new(cameraPos, direction * distance * 0.5),
            Ray.new(cameraPos, direction * distance * 0.75),
            Ray.new(cameraPos, direction * distance),
            Ray.new(cameraPos, direction * distance * 1.25),
            Ray.new(cameraPos, direction * distance * 1.5)
        }

        for _, ray in pairs(rays) do
            local hitPart, _ = workspace:FindPartOnRay(ray, game.Players.LocalPlayer.Character, false, true)
            if hitPart and hitPart:IsDescendantOf(model) then
                return true
            end
        end

        return false
    end

    local function ESP(playertable)
        if not playertable then return end
        local model = playertable.model
        local humanoidRootPart = model:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then
            return
        end

        DupeCheck(model.Name)

        local function CreateCornerBox(name, position, size, anchorPoint)
            return CreateClass("Frame", {
                Parent = XDEDEADEDE,
                Name = name,
                BackgroundColor3 = Color3.new(1.000000, 0.000000, 0.984314),
                Position = position,
                Size = size,
                AnchorPoint = anchorPoint,
                Visible = CornerBoxes,
                ZIndex = 10,
            })
        end

        local function CreateBar(name, position, size)
            return CreateClass("Frame", {
                Parent = XDEDEADEDE,
                Name = name,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = position,
                Size = size,
                Visible = Bar,
                ZIndex = 11,
            })
        end

        local function CreateBarBackRound(name, position, size)
            return CreateClass("Frame", {
                Parent = XDEDEADEDE,
                Name = name,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                Position = position,
                Size = size,
                Visible = Bar,
                ZIndex = 9,
            })
        end

        local LeftTop = CreateCornerBox("LeftTop", UDim2.new(0, 0, 0, 0), UDim2.new(0, 0, 0, 1), Vector2.new(0, 0))
        local LeftSide = CreateCornerBox("LeftSide", UDim2.new(0, 0, 0, 0), UDim2.new(0, 1, 0, 0), Vector2.new(0, 0))
        local RightTop = CreateCornerBox("RightTop", UDim2.new(0, 0, 0, 0), UDim2.new(0, 0, 0, 1), Vector2.new(0, 0))
        local RightSide = CreateCornerBox("RightSide", UDim2.new(0, 0, 0, 0), UDim2.new(0, 1, 0, 0), Vector2.new(0, 0))
        local BottomSide = CreateCornerBox("BottomSide", UDim2.new(0, 0, 0, 0), UDim2.new(0, 1, 0, 0), Vector2.new(0, 0))
        local BottomDown = CreateCornerBox("BottomDown", UDim2.new(0, 0, 0, 0), UDim2.new(0, 0, 0, 1), Vector2.new(0, 0))
        local BottomRightSide = CreateCornerBox("BottomRightSide", UDim2.new(0, 0, 0, 0), UDim2.new(0, 1, 0, 0), Vector2.new(0, 0))
        local BottomRightDown = CreateCornerBox("BottomRightDown", UDim2.new(0, 0, 0, 0), UDim2.new(0, 0, 0, 1), Vector2.new(0, 0))

        local NameTag = CreateClass("TextLabel", {
            Parent = XDEDEADEDE,
            Name = "NameTag",
            BackgroundTransparency = 1,
            Font = Enum.Font.Code,
            TextColor3 = Color3.fromRGB(161,0,219),
            TextStrokeTransparency = 0,
            TextSize = 11,
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(0, 100, 0, 20),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0, 0),
            Visible = Names,  
        })
        local WeaponText = CreateClass("TextLabel", {
            Parent = XDEDEADEDE,
            Name = "WeaponText",
            BackgroundTransparency = 1,
            Font = Enum.Font.Code,
            TextColor3 = Color3.fromRGB(161,0,219),
            TextStrokeTransparency = 0,
            TextSize = 11,
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(0, 100, 0, 20),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0, 20),
            Visible = WeaponType,  
        })

        local BarBackRound = CreateBarBackRound("BarBackRound", UDim2.new(0, 0, 0, 0), UDim2.new(0, 8, 0, 100))
        local Bar = CreateBar("Bar", UDim2.new(0, 0, 0, 0), UDim2.new(0, 0, 0, 0))

        local UIGradient = CreateClass("UIGradient", {
            Parent = Bar,
            Name = "UIGradient",
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(9, 255, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 238, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 4)),
            }),
            Rotation = 90,
        })

        local Connection
        Connection = BeamVar.RunService.RenderStepped:Connect(function()
            if model and model.Parent and humanoidRootPart and humanoidRootPart.Parent then
                local visible = IsVisible(model)
                VisibilityState[model] = visible

                if IsSleeping(model) then
                    LeftTop.Visible = false
                    LeftSide.Visible = false
                    BottomSide.Visible = false
                    BottomDown.Visible = false
                    RightTop.Visible = false
                    RightSide.Visible = false
                    BottomRightSide.Visible = false
                    BottomRightDown.Visible = false
                    NameTag.Visible = false
                    WeaponText.Visible = false
                    BarBackRound.Visible = false
                    Bar.Visible = false
                    return
                end

                local Pos, OnScreen = BeamVar.Camera:WorldToScreenPoint(humanoidRootPart.Position)
                local Size = humanoidRootPart.Size.Y
                local distance = math.floor((BeamVar.Camera.CFrame.Position - humanoidRootPart.Position).magnitude)
                local scaleFactor = 12 / (Pos.Z * math.tan(math.rad(BeamVar.Camera.FieldOfView * 0.5)) * 2) * 100
                local w, h = 3 * scaleFactor, 4.5 * scaleFactor
                local HealthWidth = Calc(distance)
                local WeaponFound = playertable.equippedItem and playertable.equippedItem.type or "None"

                if OnScreen then
                    LeftTop.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                    LeftTop.Size = UDim2.new(0, w / 5, 0, 1)

                    LeftSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                    LeftSide.Size = UDim2.new(0, 1, 0, h / 5)

                    BottomSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 2 - h / 5)
                    BottomSide.Size = UDim2.new(0, 1, 0, h / 5)

                    BottomDown.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 2)
                    BottomDown.Size = UDim2.new(0, w / 5, 0, 1)

                    RightTop.Position = UDim2.new(0, Pos.X + w / 2 - w / 5, 0, Pos.Y - h / 2)
                    RightTop.Size = UDim2.new(0, w / 5, 0, 1)

                    RightSide.Position = UDim2.new(0, Pos.X + w / 2 - 1, 0, Pos.Y - h / 2)
                    RightSide.Size = UDim2.new(0, 1, 0, h / 5)

                    BottomRightSide.Position = UDim2.new(0, Pos.X + w / 2 - 1, 0, Pos.Y + h / 2 - h / 5)
                    BottomRightSide.Size = UDim2.new(0, 1, 0, h / 5)

                    BottomRightDown.Position = UDim2.new(0, Pos.X + w / 2 - w / 5, 0, Pos.Y + h / 2)
                    BottomRightDown.Size = UDim2.new(0, w / 5, 0, 1)

                    NameTag.Position = UDim2.new(0, Pos.X, 0, Pos.Y - h / 2 - 20)
                    WeaponText.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 3)

                    BarBackRound.Position = UDim2.new(0, Pos.X - w / 2 - 10, 0, Pos.Y - h / 2)
                    BarBackRound.Size = UDim2.new(0, HealthWidth, 0, h)

                    local barHeight = (BarValue / 100) * h
                    Bar.Position = UDim2.new(0, Pos.X - w / 2 - 10, 0, Pos.Y + h / 2 - barHeight)
                    Bar.Size = UDim2.new(0, HealthWidth, 0, barHeight)

                    local username = model:FindFirstChild("Head") and model.Head:FindFirstChild("Nametag") and model.Head.Nametag.tag.Text or "Player"
                    NameTag.Text = username .. " [" .. distance .. "s]"

                    WeaponText.Text = "[" .. (WeaponFound:upper() or "NONE") .. "]"

                    local color = VisibilityState[model] and Color3.fromRGB(255, 0, 0) or Color3.new(0.968627, 0.000000, 1.000000)

                    LeftTop.BackgroundColor3 = color
                    LeftSide.BackgroundColor3 = color
                    RightTop.BackgroundColor3 = color
                    RightSide.BackgroundColor3 = color
                    BottomSide.BackgroundColor3 = color
                    BottomDown.BackgroundColor3 = color
                    BottomRightSide.BackgroundColor3 = color
                    BottomRightDown.BackgroundColor3 = color
                    NameTag.TextColor3 = color
                    WeaponText.TextColor3 = color

                    LeftTop.Visible = CornerBoxes
                    LeftSide.Visible = CornerBoxes
                    RightTop.Visible = CornerBoxes
                    RightSide.Visible = CornerBoxes
                    BottomSide.Visible = CornerBoxes
                    BottomDown.Visible = CornerBoxes
                    BottomRightSide.Visible = CornerBoxes
                    BottomRightDown.Visible = CornerBoxes
                    NameTag.Visible = Names
                    WeaponText.Visible = WeaponType
                    BarBackRound.Visible = Bar
                    Bar.Visible = Bar
                else
                    LeftTop.Visible = false
                    LeftSide.Visible = false
                    BottomSide.Visible = false
                    BottomDown.Visible = false
                    RightTop.Visible = false
                    RightSide.Visible = false
                    BottomRightSide.Visible = false
                    BottomRightDown.Visible = false
                    NameTag.Visible = false
                    WeaponText.Visible = false
                    BarBackRound.Visible = false
                    Bar.Visible = false
                end
            else
                LeftTop.Visible = false
                LeftSide.Visible = false
                RightTop.Visible = false
                RightSide.Visible = false
                BottomSide.Visible = false
                BottomDown.Visible = false
                BottomRightSide.Visible = false
                BottomRightDown.Visible = false
                NameTag.Visible = false
                WeaponText.Visible = false
                BarBackRound.Visible = false
                Bar.Visible = false
            end

            if not model then
                LeftTop:Destroy()
                LeftSide:Destroy()
                RightTop:Destroy()
                RightSide:Destroy()
                BottomSide:Destroy()
                BottomDown:Destroy()
                BottomRightSide:Destroy()
                BottomRightDown:Destroy()
                NameTag:Destroy()
                WeaponText:Destroy()
                BarBackRound:Destroy()
                Bar:Destroy()
                if Connection then
                    Connection:Disconnect()
                end
            end
        end)
    end

    local function IncrementBarValue()
        while true do
            if BarValue < 100 then
                wait(5) 
                BarValue = math.min(BarValue + 1, 100)  
            end
            wait(5) 
        end
    end

    coroutine.wrap(IncrementBarValue)()

    local function ResetLowBarValue()
        while true do
            if BarValue <= 1 then
                wait(1)
                BarValue = 100 
            end
            wait(1)
        end
    end

    coroutine.wrap(ResetLowBarValue)()

    local function onLogMessage(message)
        local HealthAfr = message:match("->(%d+%.?%d*)hp")
        HealthAfr = tonumber(HealthAfr)
        if HealthAfr then
            BarValue = math.floor(HealthAfr) 
        end
    end

    BeamVar.LogService.MessageOut:Connect(onLogMessage)

    local Cache = {}
    for i,v in pairs(PlayerList) do
        if v.type == "Player" and v.model:FindFirstChild("HumanoidRootPart") and not table.find(Cache, v) then
            table.insert(Cache, v)
            ESP(v)
        end
    end

    game:GetService("Workspace").ChildAdded:Connect(function()
        task.delay(1.5, function()
            for i,v in pairs(PlayerList) do
                if v.type == "Player" and v.model:FindFirstChild("HumanoidRootPart") and not table.find(Cache, v) then
                    table.insert(Cache, v)
                    ESP(v)
                end
            end
        end)
    end)

    local Esp3 = Tabs.visuals:createGroup('left', 'Esp')

    Esp3:addToggle({text = "Corner Boxes",default = false,flag = "CornerBoxes",callback = function(state)
        CornerBoxes = state
    end})

    Esp3:addToggle({text = "Names",default = false,flag = "Names",callback = function(state)
        Names = state
    end})

    Esp3:addToggle({text = "Weapon Type",default = false,flag = "WeaponType",callback = function(state)
        WeaponType = state
    end})

    Esp3:addToggle({text = "Health Bar",default = false,flag = "Bar",callback = function(state)
        Bar = state
    end})

    Esp3:addToggle({text = "Corner Boxes",default = false,flag = "CornerBoxes",callback = function(state)
        CornerBoxes = state
    end})

    Esp3:addSlider({text = "Max Distance", min = 0, max = 1500, suffix = "%", float = 1, default = 0, flag = "MaxDistance",callback = function(Value)
        MaxDistance = Value
    end})

    local Aura = Tabs.misc:createGroup('left', 'Kill Aura')

    local modules = {
        ["PlayerClient"] = {},
        ["Character"] = {},
        ["Camera"] = {},
        ["RangedWeaponClient"] = {},
        ["GetEquippedItem"] = {},
        ["FPS"] = {},
    }

    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and islclosure(v) then
            local info = debug.getinfo(v)
            local name = string.match(info.short_src, "%.([%w_]+)$")
            if name and modules[name] and info.name then
                modules[name][info.name] = info.func
            end
        end
    end

    local lamae = debug.getupvalues(modules.Character.updateCharacter);
    local RunService, Camera = game:GetService("RunService"), workspace.CurrentCamera
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local Color3_fromRGB, Drawing_new, pairs, Vector2_new = Color3.fromRGB, Drawing.new, pairs, Vector2.new

    local settings = {
        killAura = {
            enabled = false,
            distance = 8,
            validWeapons = {
                ["Hammer"] = true,
                ["Crowbar"] = true,
                ["StoneHammer"] = true,
                ["SteelHammer"] = true,
                ["MiningDrill"] = true,
                ["IronHammer"] = true
            },
            hitPart = "Head"
        },
        silentFarm = {
            enabled = false,
            speed = 0.05,
            distance = 10,
            entities = {"Cactus", "Tree", "Nitrate", "Stone", "Iron"}
        },
        corpseESP = {
            enabled = false,
            textColor = Color3_fromRGB(255, 0, 0),
            outlineColor = Color3_fromRGB(0, 0, 0),
            unionColor = Color3_fromRGB(205, 205, 205)
        },
        atvESP = {
            enabled = false,
            textColor = Color3_fromRGB(0, 255, 0),
            outlineColor = Color3_fromRGB(0, 0, 0)
        }
    }

    local function GetLocalToolName()
        if not CharacterList or not CharacterList[2] or not CharacterList[2].GetEquippedItem then
            return "nothing you pooron"
        end
        local equippedItem = CharacterList[2].GetEquippedItem()
        return equippedItem and equippedItem.type or "nothing you pooron"
    end

    local function GetClosestPlayer()
        local closest, playerTable, closestMagnitude = nil, nil, math.huge
        local localCharPos = workspace.Ignore.LocalCharacter.Middle.Position

        for _, v in pairs(PlayerList or {}) do
            if v.type == "Player" and v.model then
                local humanoidRootPart = v.model:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart and not v.sleeping then
                    local partPos, onScreen = Camera:WorldToViewportPoint(humanoidRootPart.Position)
                    local playerDistance = (localCharPos - humanoidRootPart.Position).Magnitude
                    if playerDistance <= settings.killAura.distance and onScreen then
                        local magnitude = (Vector2.new(partPos.X, partPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                        if magnitude < closestMagnitude then
                            closestMagnitude = magnitude
                            closest = v.model
                            playerTable = v
                        end
                    end
                end
            end
        end
        return closest, playerTable
    end

    task.spawn(function()
        while task.wait(0.01) do
            if settings.killAura.enabled then
                local player, fr = GetClosestPlayer()
                local Weapon = GetLocalToolName()
                if player and fr and settings.killAura.validWeapons[Weapon] then
                    localPlayer.TCP:FireServer(10, "Swing")
                    localPlayer.TCP:FireServer(10, "Hit", fr.id, player.HumanoidRootPart.Position, settings.killAura.hitPart, Vector3.new(0, 0, 0))
                    task.wait(Weapon == "MiningDrill" and 0.01 or 0.95)
                else
                    task.wait(0.1)
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait(0.01) do
            if settings.silentFarm.enabled then
                local playerPosition = workspace.Ignore.LocalCharacter.Middle and workspace.Ignore.LocalCharacter.Middle.Position
                if not playerPosition then continue end

                for id, entity in pairs(lamae[14].EntityMap or {}) do
                    if type(entity) == "table" and type(entity.type) == "string" then
                        for _, entityType in ipairs(settings.silentFarm.entities) do
                            if string.match(entity.type, entityType) then
                                local entityPosition = entity.pos
                                if not entityPosition then continue end

                                local distanceToEntity = (playerPosition - entityPosition).Magnitude
                                if distanceToEntity <= settings.silentFarm.distance then
                                    local Weapon = GetLocalToolName()
                                    local waitTime = Weapon == "MiningDrill" and 0.01 or settings.silentFarm.speed

                                    localPlayer.TCP:FireServer(10, "Swing")
                                    local hitType = (entity.type == "Tree") and "default" or "Part"
                                    local hitPosition = Vector3.new(0, 0, 0)
                                    localPlayer.TCP:FireServer(10, "Hit", id, entityPosition, hitType, hitPosition)

                                    task.wait(waitTime)
                                    break
                                end
                            end
                        end
                    end
                end
            else
                task.wait(0.5)
            end
        end
    end)

    local CorpseCaches, ATVCache = {}, {}

    workspace.ChildAdded:Connect(function(child)
        if settings.corpseESP.enabled then
            local unionOp = child:FindFirstChildOfClass("UnionOperation")
            if unionOp and unionOp.Color == settings.corpseESP.unionColor then
                local corpseCache = Drawing.new("Text")
                corpseCache.Size = 10
                corpseCache.Color = settings.corpseESP.textColor
                corpseCache.Outline = true
                corpseCache.OutlineColor = settings.corpseESP.outlineColor
                CorpseCaches[child] = corpseCache
            end
        end
    end)

    workspace.ChildRemoved:Connect(function(child)
        local corpseCache = CorpseCaches[child]
        if corpseCache then
            corpseCache:Remove()
            CorpseCaches[child] = nil
        end
    end)

    workspace.ChildAdded:Connect(function(child)
        if settings.atvESP.enabled then
            local seat = child:FindFirstChild("Seat")
            local plastics = child:FindFirstChild("Plastics")
            if seat and plastics then
                local atvHighlight = Drawing.new("Text")
                atvHighlight.Size = 10
                atvHighlight.Color = settings.atvESP.textColor
                atvHighlight.Outline = true
                atvHighlight.OutlineColor = settings.atvESP.outlineColor
                ATVCache[child] = atvHighlight
            end
        end
    end)

    workspace.ChildRemoved:Connect(function(child)
        local atvHighlight = ATVCache[child]
        if atvHighlight then
            atvHighlight:Remove()
            ATVCache[child] = nil
        end
    end)

    RunService.Heartbeat:Connect(function()
        if settings.corpseESP.enabled then
            for corpse, corpseCache in pairs(CorpseCaches) do
                local primaryPart = corpse.PrimaryPart
                if primaryPart then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(primaryPart.Position)
                    local distance = (Camera.CFrame.Position - primaryPart.Position).Magnitude
                    corpseCache.Visible = onScreen
                    if corpseCache.Visible then
                        corpseCache.Text = "Corpse [" .. math.floor(distance) .. "]"
                        corpseCache.Position = Vector2.new(screenPos.X, screenPos.Y)
                    end
                end
            end
        end

        if settings.atvESP.enabled then
            for atv, atvHighlight in pairs(ATVCache) do
                local primaryPart = atv.PrimaryPart
                if primaryPart then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(primaryPart.Position)
                    local distance = (Camera.CFrame.Position - primaryPart.Position).Magnitude
                    atvHighlight.Visible = onScreen
                    if atvHighlight.Visible then
                        atvHighlight.Text = "ATV [" .. math.floor(distance) .. "]"
                        atvHighlight.Position = Vector2.new(screenPos.X, screenPos.Y)
                    end
                end
            end
        end
    end)

    local esps = Tabs.misc:createGroup('right', 'esps')

    esps:addToggle({text = "Body Bag",default = false,flag = "BodyBag",callback = function(state)
        settings.corpseESP.enabled = state
    end})  

    esps:addToggle({text = "Atv Esp",default = false,flag = "ShowATV",callback = function(state)
        settings.atvESP.enabled = state
    end})

    Aura:addToggle({text = "Kill Aura",default = false,flag = "AuraGoodToUse",callback = function(state)
        settings.killAura.enabled = state
    end})   

    Aura:addSlider({text = "Distance:", min = 1, max = 10, suffix = "%", float = 1, default = 1, flag = "killauradistance",callback = function(Value)
        settings.killAura.distance = Value
    end})

    local Farm = Tabs.misc:createGroup('right', 'Auto Farm | Etc')

    Farm:addToggle({text = "Enabled",default = false,flag = "silent_farm.enabled",callback = function(state)
        settings.silentFarm.enabled = state
    end})  

    Farm:addSlider({text = "Speed", min = 1, max = 1.3, suffix = "%", float = 0.1, default = 1, flag = "silent_farm.speed",callback = function(Value)
        settings.silentFarm.speed = Value
    end})

    Farm:addSlider({text = "distance", min = 1, max = 10, suffix = "%", float = 1, default = 1, flag = "silent_farm.distance",callback = function(Value)
        settings.silentFarm.distance = Value
    end})
    local AtvFly = Tabs.misc:createGroup('left', 'Atv Fly | Skibidi')

    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")

    local MAX_SPEED = 1000
    local MIN_SPEED = 0
    local speed = 115
    local isSpeedToggled = false
    local previousSpeed = speed
    local collisionToggle = false
    local ClosestATV = nil
    local Enabled = false
    local atvbypass = true

    local function clampSpeed(value, min, max)
        return math.max(min, math.min(max, value))
    end

    local function adjustSpeed(amount)
        speed = clampSpeed(speed + amount, MIN_SPEED, MAX_SPEED)
    end

    local function toggleSpeed()
        if isSpeedToggled then
            speed = previousSpeed
        else
            previousSpeed = speed
            speed = 28
        end
        isSpeedToggled = not isSpeedToggled
    end

    local function GetClosestATV()
        local closestATV, closestDistance = nil, math.huge

        for _, v in ipairs(Workspace:GetChildren()) do
            if v:FindFirstChild("Seat") and v:FindFirstChild("Plastics") then
                local distance = (v.Plastics.Position - Workspace.Ignore.LocalCharacter.Middle.Position).Magnitude
                if distance < closestDistance then
                    closestATV = v
                    closestDistance = distance
                end
            end
        end

        return closestATV
    end

    local function toggleATVCollision()
        if not ClosestATV then return end

        collisionToggle = not collisionToggle
        for _, part in ipairs(ClosestATV:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = collisionToggle
            end
        end
    end

    local function FlyHack()
        RunService.RenderStepped:Connect(function()
            ClosestATV = GetClosestATV()
            if Enabled and ClosestATV then
                local plastics = ClosestATV.Plastics
                plastics.Velocity = Vector3.zero

                local flip2 = ClosestATV.Frame:FindFirstChild("Flip2")
                if not flip2 then
                    local newFlip = ClosestATV.Frame.Flip:Clone()
                    newFlip.Name = "Flip2"
                    newFlip.Enabled = true
                    newFlip.Parent = ClosestATV.Frame
                else
                    flip2.Enabled = true
                end

                local travel = Vector3.zero
                local cameraCFrame = Workspace.CurrentCamera.CFrame

                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    travel += cameraCFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    travel -= cameraCFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    travel += cameraCFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    travel -= cameraCFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.X) then
                    travel += cameraCFrame.UpVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    travel -= cameraCFrame.UpVector
                end

                if travel.Magnitude > 0 then
                    plastics.Anchored = false
                    plastics.Velocity = travel.Unit * speed
                else
                    plastics.Velocity = Vector3.zero
                    plastics.Anchored = false
                end
            else
                local flip2 = ClosestATV and ClosestATV.Frame:FindFirstChild("Flip2")
                if flip2 then
                    flip2.Enabled = false
                end
            end
        end)
    end

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.V then
            adjustSpeed(5)
        elseif input.KeyCode == Enum.KeyCode.N then
            adjustSpeed(-5)
        elseif input.KeyCode == Enum.KeyCode.Q then
            toggleSpeed()
        elseif input.KeyCode == Enum.KeyCode.Z then
            Enabled = not Enabled
        elseif input.KeyCode == Enum.KeyCode.F then
            toggleATVCollision()
        elseif input.KeyCode == Enum.KeyCode.A and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            if ClosestATV then
                ClosestATV:SetPrimaryPartCFrame(ClosestATV.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(-5), 0))
            end
        elseif input.KeyCode == Enum.KeyCode.D and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            if ClosestATV then
                ClosestATV:SetPrimaryPartCFrame(ClosestATV.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(5), 0))
            end
        end
    end)

    FlyHack()

    RunService.RenderStepped:Connect(function()
        for _, v in ipairs(Workspace:GetChildren()) do
            local frame = v:FindFirstChild("Frame")
            if frame then
                local flip = frame:FindFirstChild("Flip")
                if flip and atvbypass then
                    flip.Enabled = true
                    flip.RigidityEnabled = true
                    flip.Responsiveness = math.huge
                end
            end
        end
    end)

    AtvFly:addSlider({text = "Atv Speed", min = 1, max = 300, suffix = "%", float = 1, default = 25, flag = "speed",callback = function(Value)
        speed = Value
    end})

    for i,v in getgc(true) do
    if typeof(v) == "function" and debug.getinfo(v).name == "fire" then
        local old; old = hookfunction(v, function(...)
            local args = {...}
            
            --// AimRecoil <--
            args[1].AimRecoil.camerX = 0
            args[1].AimRecoil.cameraY = 0
            args[1].AimRecoil.push = 0

            --// HipRecoil <--
            args[1].HipRecoil.camerX = 0
            args[1].HipRecoil.cameraY = 0
            args[1].HipRecoil.push = 0
            
            --// NoSpread <--
            args[1].Accuracy = math.huge

            --// NoReload <--
            args[1].ReloadTime = 0

            args[1].FireAction = "auto"

            local mt = getmetatable(args[1]) --// <- Table right here
            if mt then
                if mt.__index then
                    for key, value in pairs(mt.__index) do
                    end
                end
            end
            return old(unpack(args))
        end)
    end
    end

    --// UI Settings \\--
    local gameTab = Tabs.settings:createGroup('left', 'Game')

    --// Game \\-- 
    do
    gameTab:addToggle({text = "Menu Bind",default = true,flag = "MenuBind_Toggle",callback = function(state)
    end}):addKeybind({text = "Menu Bind",type = "toggle",key = Enum.KeyCode.K,flag = "menubindkeybind_toggle",callback = function(state)
    Library.keybind = state
    end})
    gameTab:addButton({text = "Copy Join Code",callback = function(state)
    setclipboard(("game:GetService('TeleportService'):TeleportToPlaceInstance(%s, '%s')"):format(game.PlaceId, game.JobId))
    Library:Notify("surge.gg - succesfully copied join code!", 5)
    end})
    gameTab:addButton({text = "rejoin",callback = function(Value)
    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    library:Notify("surge.gg - succesfully rejoining server!", 5)
    end})
    end

    local createConfigs = Tabs.settings:createGroup('right', 'Configs')

    do --// Configs \\--
    createConfigs:addTextbox({text = "Name:",flag = "config_name"})
    createConfigs:addButton({text = "Create",callback = Library.createConfig})
    createConfigs:addConfigbox({flag = 'config_box',values = {}})
    createConfigs:addButton({text = "Load",callback = Library.loadConfig})
    createConfigs:addButton({text = "Overwrite",callback = Library.saveConfig})
    createConfigs:addButton({text = "Refresh",callback = function(refresh) Library:refreshConfigs(refresh) Library:Notify("Succesfully: refreshed all cfg's!", 5) end})
    createConfigs:addButton({text = "Delete",callback = Library.deleteConfig})
    end; 

    Library:refreshConfigs()
    Library:Notify(string.format("Success: script loaded in %.2fs", os.clock() - OsClock),15)
    end
--[[ -- wtf is that indicing bro??
                        --- dont mess with below thx ---
                        
                        local original_warn = warn
                        local original_print = print
                        local original_error = error
                        local original_loadstring = loadstring
                        local original_getrenv = gerenv
                        local original_getsenv = getsenv
                        local original_debug_getupvalues = debug.getupvalues
                        local original_debug_setupvalue = debug.setupvalue
                        local original_debug_getconstant = debug.getconstant
                        local original_debug_getconstants = debug.getconstants
                        local original_debug_setconstant = debug.setconstant
                        local original_debug_getproto = debug.getproto
                        local original_debug_getprotos = debug.getprotos
                        local original_debug_setname = debug.setname
                        local original_debug_isvalidlevel = debug.isvalidlevel
                        local original_debug_getregistry = debug.getregistry
                        local original_getallthreads = getallthreads
                        local original_getthreadcontext = getthreadcontext
                        local original_getscriptfromthread = getscriptfromthread
                        local original_gettenv = gettenv
                        local original_getscripthash = getscripthash
                        local original_getscriptfunction = getscriptfunction
                        local original_getscriptbytecode = getscriptbytecode
                        local original_newtable = newtable
                        local original_getobjects = getobjects
                        local original_compareinstances = compareinstances
                        local original_getreg = getreg
                        local original_setclipboard = setclipboard
                        local original_queue_on_teleport = queue_on_teleport
                        local original_iswindowactive = iswindowactive
                        local original_http_request = http.request
                        local original_request = request
                        local original_httppost = httppost
                        local original_httpget = httpget
                        local original_delfile = delfile
                        local original_delfolder = delfolder
                        local original_makefolder = makefolder
                        local original_appendfile = appendfile
                        local original_writefile = writefile

                        loadstring = function(...)
                            print("Executed a script: loadstring")
                            return original_loadstring(...)
                        end

                        getrenv = function(...)
                            print("Executed a script: gerenv")
                            return original_getrenv(...)
                        end

                        getsenv = function(...)
                            print("Executed a script: getsenv")
                            return original_getsenv(...)
                        end

                        debug.getupvalues = function(...)
                            print("Executed a script: debug.getupvalues")
                            return original_debug_getupvalues(...)
                        end

                        debug.setupvalue = function(...)
                            print("Executed a script: debug.setupvalue")
                            return original_debug_setupvalue(...)
                        end

                        debug.getconstant = function(...)
                            print("Executed a script: debug.getconstant")
                            return original_debug_getconstant(...)
                        end

                        debug.getconstants = function(...)
                            print("Executed a script: debug.getconstants")
                            return original_debug_getconstants(...)
                        end

                        debug.setconstant = function(...)
                            print("Executed a script: debug.setconstant")
                            return original_debug_setconstant(...)
                        end

                        debug.getproto = function(...)
                            print("Executed a script: debug.getproto")
                            return original_debug_getproto(...)
                        end

                        debug.getprotos = function(...)
                            print("Executed a script: debug.getprotos")
                            return original_debug_getprotos(...)
                        end

                        debug.setname = function(...)
                            print("Executed a script: debug.setname")
                            return original_debug_setname(...)
                        end

                        debug.isvalidlevel = function(...)
                            print("Executed a script: debug.isvalidlevel")
                            return original_debug_isvalidlevel(...)
                        end

                        debug.getregistry = function(...)
                            print("Executed a script: debug.getregistry")
                            return original_debug_getregistry(...)
                        end

                        getallthreads = function(...)
                            print("Executed a script: getallthreads")
                            return original_getallthreads(...)
                        end

                        getthreadcontext = function(...)
                            print("Executed a script: getthreadcontext")
                            return original_getthreadcontext(...)
                        end

                        getscriptfromthread = function(...)
                            print("Executed a script: getscriptfromthread")
                            return original_getscriptfromthread(...)
                        end

                        gettenv = function(...)
                            print("Executed a script: gettenv")
                            return original_gettenv(...)
                        end

                        getscripthash = function(...)
                            print("Executed a script: getscripthash")
                            return original_getscripthash(...)
                        end

                        getscriptfunction = function(...)
                            print("Executed a script: getscriptfunction")
                            return original_getscriptfunction(...)
                        end

                        getscriptbytecode = function(...)
                            print("Executed a script: getscriptbytecode")
                            return original_getscriptbytecode(...)
                        end

                        newtable = function(...)
                            print("Executed a script: newtable")
                            return original_newtable(...)
                        end

                        getobjects = function(...)
                            print("Executed a script: getobjects")
                            return original_getobjects(...)
                        end

                        compareinstances = function(...)
                            print("Executed a script: compareinstances")
                            return original_compareinstances(...)
                        end

                        getreg = function(...)
                            print("Executed a script: getreg")
                            return original_getreg(...)
                        end

                        setclipboard = function(...)
                            print("Executed a script: setclipboard")
                            return original_setclipboard(...)
                        end

                        queue_on_teleport = function(...)
                            print("Executed a script: queue_on_teleport")
                            return original_queue_on_teleport(...)
                        end

                        iswindowactive = function(...)
                            print("Executed a script: iswindowactive")
                            return original_iswindowactive(...)
                        end

                        http.request = function(...)
                            print("Executed a script: http.request")
                            return original_http_request(...)
                        end

                        request = function(...)
                            print("Executed a script: request")
                            return original_request(...)
                        end

                        httppost = function(...)
                            print("Executed a script: httppost")
                            return original_httppost(...)
                        end

                        httpget = function(...)
                            print("Executed a script: httpget")
                            return original_httpget(...)
                        end

                        delfile = function(...)
                            print("Executed a script: delfile")
                            return original_delfile(...)
                        end

                        delfolder = function(...)
                            print("Executed a script: delfolder")
                            return original_delfolder(...)
                        end

                        makefolder = function(...)
                            print("Executed a script: makefolder")
                            return original_makefolder(...)
                        end

                        appendfile = function(...)
                            print("Executed a script: appendfile")
                            return original_appendfile(...)
                        end

                        writefile = function(...)
                            print("Executed a script: writefile")
                            return original_writefile(...)
                        end

                        print = function(...)
                            print("Executed a script")
                            original_print(...)
                        end

                        warn = function(...)
                            print("Executed a script")
                            original_warn(...)
                        end

                        error = function(msg)
                            print("Executed a script")
                            original_error(msg)
                        end
]]
