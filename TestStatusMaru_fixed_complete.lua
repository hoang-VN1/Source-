-- ══════════════════════════════════════════
--   MARU HUB PREMIUM - Fixed by Brody
-- ══════════════════════════════════════════

-- Startup loader removed: do not block on LoadingScreen/DataLoaded/ChooseTeam/Team.
local Players = game:GetService("Players")
local plr_init = Players.LocalPlayer

-- GLOBAL INIT (non-blocking; safe before character/data fully exists)
do
  ply = Players
  plr = ply.LocalPlayer
  replicated = game:GetService("ReplicatedStorage")
  TeleportService = game:GetService("TeleportService")
  TW = game:GetService("TweenService")
  Lighting = game:GetService("Lighting")
  vim1 = game:GetService("VirtualInputManager")
  vim2 = game:GetService("VirtualUser")
  TeamSelf = plr and plr.Team or nil
  RunSer = game:GetService("RunService")
  Stats = game:GetService("Stats")
  Root = nil
  Lv = 0
  Enemies = workspace:FindFirstChild("Enemies")
  Energy = 0
  if plr then
    local char = plr.Character
    if char then
      Root = char:FindFirstChild("HumanoidRootPart")
      local energyObj = char:FindFirstChild("Energy")
      if energyObj and energyObj:IsA("NumberValue") then Energy = energyObj.Value end
    end
    local data = plr:FindFirstChild("Data")
    local level = data and data:FindFirstChild("Level")
    if level and level:IsA("NumberValue") then Lv = level.Value end
  end
  Boss = {}
  BringConnections = {}
  MaterialList = {}
  NPCList = {}
  shouldTween = false
  SoulGuitar = false
  KenTest = true
  debug = false
  Brazier1 = false
  Brazier2 = false
  Brazier3 = false
  Sec = 0.1
  ClickState = 0
  Num_self = 25
end

-- Non-blocking reference refresh for respawns/data loading.
local function __refreshMaruRefs()
    if not plr then return end
    local char = plr.Character
    if char then
        Root = char:FindFirstChild("HumanoidRootPart") or Root
        local energyObj = char:FindFirstChild("Energy")
        if energyObj and typeof(energyObj.Value) == "number" then Energy = energyObj.Value end
    end
    local data = plr:FindFirstChild("Data")
    local level = data and data:FindFirstChild("Level")
    if level and typeof(level.Value) == "number" then Lv = level.Value end
    Enemies = workspace:FindFirstChild("Enemies") or Enemies
    TeamSelf = plr.Team
end

__refreshMaruRefs()
if plr then
    plr.CharacterAdded:Connect(function(char)
        Root = char:WaitForChild("HumanoidRootPart", 10) or char:FindFirstChild("HumanoidRootPart")
        __refreshMaruRefs()
    end)
    plr.ChildAdded:Connect(function(child)
        if child.Name == "Data" then task.defer(__refreshMaruRefs) end
    end)
end
workspace.ChildAdded:Connect(function(child)
    if child.Name == "Enemies" then Enemies = child end
end)

-- Embedded combat helper (wTNqqh25). No external loader/network dependency.
task.spawn(function()
    local ok, err = pcall(function()
        local __wtn_loader = function()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")

local Player = Players.LocalPlayer
local Character

local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")

local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")
local ShootGunEvent = Net:WaitForChild("RE/ShootGunEvent")
local GunValidator = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Validator2")

local CombatUtil = require(Modules.CombatUtil)

local Config = {
    AttackDistance = 80,
    AttackMobs = true,
    AttackPlayers = true,
    AttackCooldown = 0.05,
    ComboResetTime = 0.3,
    MaxCombo = 4,
    AutoClickEnabled = true,
    HitboxLimbs = {
        "RightLowerArm",
        "RightUpperArm",
        "LeftLowerArm",
        "LeftUpperArm",
        "RightHand",
        "LeftHand"
    }
}

local ValidLimbs = {
    RightUpperArm = true,
    RightLowerArm = true,
    RightHand = true,
    RightUpperLeg = true,
    RightLowerLeg = true,
    RightFoot = true,
    LeftUpperArm = true,
    LeftLowerArm = true,
    LeftHand = true,
    LeftUpperLeg = true,
    LeftLowerLeg = true,
    LeftFoot = true,
    UpperTorso = true,
    LowerTorso = true,
    Head = true
}

local function UpdateCharacter()
    Character = Player.Character
    return Character
end

UpdateCharacter()

Player.CharacterAdded:Connect(function(char)
    Character = char
end)

local function IsAlive(Model)
    local Humanoid = Model and Model:FindFirstChildOfClass("Humanoid")
    return Humanoid and Humanoid.Health > 0
end

local function GetDistance(Position)
    if not Character then return math.huge end

    local Root = Character:FindFirstChild("HumanoidRootPart")
    if not Root then return math.huge end

    return (Position - Root.Position).Magnitude
end

local function GetAllTargets()
    local Targets = {}

    for _, Folder in ipairs({
        Workspace:FindFirstChild("Enemies"),
        Workspace:FindFirstChild("Characters")
    }) do
        if Folder then
            for _, Model in ipairs(Folder:GetChildren()) do
                if Model ~= Character and IsAlive(Model) then
                    local Root = Model:FindFirstChild("HumanoidRootPart")
                    local Head = Model:FindFirstChild("Head")

                    if Root and Head and GetDistance(Root.Position) <= Config.AttackDistance then
                        table.insert(Targets, Model)
                    end
                end
            end
        end
    end

    return Targets
end

local function GetBladeHits()
    local Targets = {}

    for _, Model in ipairs(GetAllTargets()) do
        local Part

        for _, Limb in ipairs(Config.HitboxLimbs) do
            Part = Model:FindFirstChild(Limb)
            if Part then
                break
            end
        end

        Part = Part or Model:FindFirstChild("HumanoidRootPart")

        if Part then
            table.insert(Targets, {
                Model,
                Part
            })
        end
    end

    return Targets
end

local function GetClosestTarget(Distance)
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")
    if not Root then return nil end

    local Closest
    local ClosestDistance = Distance or Config.AttackDistance

    for _, Target in ipairs(GetAllTargets()) do
        local TargetRoot = Target:FindFirstChild("HumanoidRootPart")

        if TargetRoot then
            local Dist = (Root.Position - TargetRoot.Position).Magnitude

            if Dist <= ClosestDistance then
                ClosestDistance = Dist
                Closest = TargetRoot
            end
        end
    end

    return Closest
end

local function GetAOEHits(Distance)
    local Results = {}
    local AlreadyHit = {}

    if not Character then
        return Results
    end

    local Root = Character:FindFirstChild("HumanoidRootPart")
    if not Root then
        return Results
    end

    local Position = Root.Position

    for _, Model in ipairs(GetAllTargets()) do
        if not AlreadyHit[Model] then
            local TargetRoot = Model:FindFirstChild("HumanoidRootPart")

            if TargetRoot then
                local TargetDistance = (TargetRoot.Position - Position).Magnitude

                if TargetDistance <= (Distance or Config.AttackDistance) then
                    local HitPart

                    for _, Limb in ipairs(Config.HitboxLimbs) do
                        local Part = Model:FindFirstChild(Limb)

                        if Part then
                            HitPart = Part
                            break
                        end
                    end

                    HitPart = HitPart or TargetRoot

                    if HitPart and ValidLimbs[HitPart.Name] then
                        local Rig = CombatUtil:GetRigOfHitPart(HitPart)

                        if Rig and CombatUtil:IsVulnerable(Rig) then
                            if Rig ~= Character then
                                table.insert(Results, {
                                    Rig,
                                    HitPart
                                })

                                AlreadyHit[Rig] = true
                            end
                        end
                    end
                end
            end
        end
    end

    return Results
end

local FastAttack = {}
FastAttack.__index = FastAttack

function FastAttack.new()
    local self = setmetatable({
        Debounce = 0,
        ComboDebounce = 0,
        ShootDebounce = 0,
        M1Combo = 0,
        EnemyRootPart = nil,
        Connections = {},
        CombatFlags = nil,
        ShootFunction = nil,
        HitFunction = nil,
        SpecialShoots = {
            ["Skull Guitar"] = "TAP",
            ["Bazooka"] = "Position",
            ["Cannon"] = "Position",
            ["Dragonstorm"] = "Overheat"
        }
    }, FastAttack)

    pcall(function()
        self.CombatFlags = require(Modules.Flags).COMBAT_REMOTE_THREAD
        self.ShootFunction = getupvalue(
            require(ReplicatedStorage.Controllers.CombatController).Attack,
            9
        )

        local LocalScript = Player:WaitForChild("PlayerScripts"):FindFirstChildOfClass("LocalScript")

        if LocalScript and getsenv then
            self.HitFunction = getsenv(LocalScript)._G.SendHitsToServer
        end
    end)

    return self
end

function FastAttack:IsEntityAlive(Entity)
    local Humanoid = Entity and Entity:FindFirstChildOfClass("Humanoid")
    return Humanoid and Humanoid.Health > 0
end

function FastAttack:CheckStun(CharacterModel, Humanoid, ToolTip)
    local Stun = CharacterModel:FindFirstChild("Stun")
    local Busy = CharacterModel:FindFirstChild("Busy")

    if Humanoid.Sit and (
        ToolTip == "Sword"
        or ToolTip == "Melee"
        or ToolTip == "Blox Fruit"
    ) then
        return false
    end

    if Stun and Stun.Value > 0 then
        return false
    end

    if Busy and Busy.Value then
        return false
    end

    return true
end

function FastAttack:GetCombo()
    local Combo

    if tick() - self.ComboDebounce <= Config.ComboResetTime then
        Combo = self.M1Combo
    else
        Combo = 0
    end

    Combo = Combo >= Config.MaxCombo and 1 or Combo + 1

    self.ComboDebounce = tick()
    self.M1Combo = Combo

    return Combo
end

function FastAttack:GetValidator2()
    if not self.ShootFunction then
        return 0, 0
    end

    local v1 = getupvalue(self.ShootFunction, 15)
    local v2 = getupvalue(self.ShootFunction, 13)
    local v3 = getupvalue(self.ShootFunction, 16)
    local v4 = getupvalue(self.ShootFunction, 17)
    local v5 = getupvalue(self.ShootFunction, 14)
    local v6 = getupvalue(self.ShootFunction, 12)
    local v7 = getupvalue(self.ShootFunction, 18)

    if not v1 or not v2 or not v3 or not v4 then
        return 0, 0
    end

    local v8 = v6 * v2
    local v9 = (v5 * v2 + v6 * v1) % v3

    v9 = (v9 * v3 + v8) % v4

    v5 = math.floor(v9 / v3)
    v6 = v9 - v5 * v3
    v7 = v7 + 1

    setupvalue(self.ShootFunction, 15, v1)
    setupvalue(self.ShootFunction, 13, v2)
    setupvalue(self.ShootFunction, 16, v3)
    setupvalue(self.ShootFunction, 17, v4)
    setupvalue(self.ShootFunction, 14, v5)
    setupvalue(self.ShootFunction, 12, v6)
    setupvalue(self.ShootFunction, 18, v7)

    return math.floor(v9 / v4 * 16777215), v7
end

function FastAttack:UseNormalClick()
    self.EnemyRootPart = nil

    local Hits = GetBladeHits()

    if #Hits == 0 then
        return
    end

    self.EnemyRootPart = Hits[1][2]

    local TargetData = {}

    for _, Hit in ipairs(Hits) do
        table.insert(TargetData, {
            Hit[1],
            Hit[2]
        })
    end

    RegisterAttack:FireServer(0)

    if self.CombatFlags and self.HitFunction then
        self.HitFunction(self.EnemyRootPart, TargetData)
    else
        RegisterHit:FireServer(self.EnemyRootPart, TargetData)
    end
end

function FastAttack:UseFruitM1(Equipped, Combo)
    local Hits = GetBladeHits()

    if not Hits[1] then
        return
    end

    local Root = Character:FindFirstChild("HumanoidRootPart")
    if not Root then
        return
    end

    local Direction = (
        Hits[1][2].Position - Root.Position
    ).Unit

    local Remote = Equipped:FindFirstChild("LeftClickRemote")

    if Remote then
        Remote:FireServer(Direction, Combo)
    end
end

function FastAttack:ShootInTarget(TargetPosition)
    local Equipped = Character and Character:FindFirstChildOfClass("Tool")

    if not Equipped or Equipped.ToolTip ~= "Gun" then
        return
    end

    local CooldownObject = Equipped:FindFirstChild("Cooldown")
    local Cooldown = CooldownObject and CooldownObject.Value or 0.3

    if tick() - self.ShootDebounce < Cooldown then
        return
    end

    local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"

    if ShootType == "Position" or (
        ShootType == "TAP"
        and Equipped:FindFirstChild("RemoteEvent")
    ) then
        Equipped:SetAttribute(
            "LocalTotalShots",
            (Equipped:GetAttribute("LocalTotalShots") or 0) + 1
        )

        local Validator1, Validator2 = self:GetValidator2()

        GunValidator:FireServer(Validator1, Validator2)

        if ShootType == "TAP" then
            Equipped.RemoteEvent:FireServer("TAP", TargetPosition)
        else
            ShootGunEvent:FireServer(TargetPosition)
        end

        self.ShootDebounce = tick()
    else
        VirtualInputManager:SendMouseButtonEvent(
            0,
            0,
            0,
            true,
            game,
            1
        )

        task.wait(0.05)

        VirtualInputManager:SendMouseButtonEvent(
            0,
            0,
            0,
            false,
            game,
            1
        )

        self.ShootDebounce = tick()
    end
end

function FastAttack:Attack()
    if not Config.AutoClickEnabled then
        return
    end

    if tick() - self.Debounce < Config.AttackCooldown then
        return
    end

    if not Character or not self:IsEntityAlive(Character) then
        return
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local Equipped = Character:FindFirstChildOfClass("Tool")

    if not Humanoid or not Equipped then
        return
    end

    local ToolTip = Equipped.ToolTip

    if not table.find({
        "Melee",
        "Blox Fruit",
        "Sword",
        "Gun"
    }, ToolTip) then
        return
    end

    if not self:CheckStun(Character, Humanoid, ToolTip) then
        return
    end

    local Combo = self:GetCombo()

    self.Debounce = tick()

    if ToolTip == "Blox Fruit"
        and Equipped:FindFirstChild("LeftClickRemote") then

        self:UseFruitM1(Equipped, Combo)

    elseif ToolTip == "Gun" then

        local Target = GetClosestTarget(120)

        if Target then
            self:ShootInTarget(Target.Position)
        end

    else
        self:UseNormalClick()
    end
end

local AttackInstance = FastAttack.new()

table.insert(
    AttackInstance.Connections,
    RunService.Stepped:Connect(function()
        pcall(function()
            AttackInstance:Attack()
        end)
    end)
)

pcall(function()
    for _, Func in pairs(getgc(true)) do
        if typeof(Func) == "function" and iscclosure(Func) then
            local Info = debug.getinfo(Func)

            if Info and (
                Info.name == "Attack"
                or Info.name == "attack"
                or Info.name == "RegisterHit"
            ) then
                hookfunction(Func, function(...)
                    pcall(function()
                        AttackInstance:Attack()
                    end)

                    return Func(...)
                end)
            end
        end
    end
end)

getgenv().getBladeHits = function(Target, Positions, Distance)
    local Results = {}

    pcall(function()
        for _, Enemy in ipairs(GetAllTargets()) do
            if Enemy ~= Target then
                local Root = Enemy:FindFirstChild("HumanoidRootPart")

                if Root then
                    for _, Position in ipairs(Positions) do
                        if (Root.Position - Position.Position).Magnitude
                            <= Distance + Root.Size.X / 2 then

                            for _, Part in ipairs(Enemy:GetChildren()) do
                                if Part:IsA("BasePart")
                                    and (Part.Position - Position.Position).Magnitude
                                    <= Distance + Root.Size.X / 2 then

                                    table.insert(Results, Part)
                                end
                            end

                            break
                        end
                    end
                end
            end
        end
    end)

    return Results
end

getgenv().ClickM1 = function(Target, IsLongRange)
    if not Target
        or not Character
        or not Character:FindFirstChild("HumanoidRootPart")
        or not Target:FindFirstChild("HumanoidRootPart")
        or not Target:FindFirstChildOfClass("Humanoid") then
        return
    end

    local TargetHumanoid = Target:FindFirstChildOfClass("Humanoid")

    if TargetHumanoid.Health <= 0 then
        return
    end

    local Distance = (
        Character.HumanoidRootPart.Position
        - Target.HumanoidRootPart.Position
    ).Magnitude

    if Distance >= 70 then
        return
    end

    pcall(function()
        AttackInstance:Attack()
    end)
end

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            local Enemies = Workspace:FindFirstChild("Enemies")

            if not Enemies then
                return
            end

            for _, Enemy in ipairs(Enemies:GetChildren()) do
                local Humanoid = Enemy:FindFirstChildOfClass("Humanoid")
                local Root = Enemy:FindFirstChild("HumanoidRootPart")

                if Humanoid
                    and Root
                    and Humanoid.Health > 0 then

                    ClickM1(Enemy, false)
                end
            end
        end)
    end
end)
        end
        __wtn_loader()
    end)
    if not ok then warn("[MaruHub] Combat helper failed:", err) end
end)

World1 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715

World2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657

World3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089

Sea = World1 or World2 or World3
Marines = function() replicated.Remotes.CommF_:InvokeServer("SetTeam","Marines") end

Pirates = function() replicated.Remotes.CommF_:InvokeServer("SetTeam","Pirates") end

if World1 then Boss = {"The Gorilla King","Bobby","The Saw","Yeti","Mob Leader","Vice Admiral","Saber Expert","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Ice Admiral","Greybeard"}

elseif World2 then Boss = {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Awakened Ice Admiral","Tide Keeper","Darkbeard","Cursed Captain","Order"}

elseif World3 then Boss = {"Stone","Hydra Leader","Kilo Admiral","Captain Elephant","Beautiful Pirate","Cake Queen","Longma","Soul Reaper"}

end

if World1 then MaterialList = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail"}

elseif World2 then MaterialList = {"Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang"}

elseif World3 then MaterialList = {"Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk"}

end

local DungeonTables = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"}

local RenMon = {"Snow Lurker","Arctic Warrior","Hidden Key","Awakened Ice Admiral"}

local CursedTables = {["Mob"] = "Mythological Pirate",["Mob2"] = "Cursed Skeleton","Hell's Messenger",["Mob3"] = "Cursed Skeleton","Heaven's Guardian"}

local Past = {"Part","SpawnLocation","Terrain","WedgePart","MeshPart"}

local BartMon = {"Swan Pirate","Jeremy"}

local CitizenTable = {"Forest Pirate","Captain Elephant"}

local Human_v3_Mob = {"Fajita","Jeremy","Diamond"}

local AllBoats = {"Beast Hunter","Lantern","Guardian","Grand Brigade","Dinghy","Sloop","The Sentinel"}

local mastery1 = {"Cookie Crafter"}

local mastery2 = {"Reborn Skeleton"}

local PosMsList = {["Pirate Millionaire"] = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625),["Pistol Billionaire"] = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625),["Dragon Crew Warrior"] = CFrame.new(7021.50439453125, 55.76270294189453, -730.1290893554688),["Dragon Crew Archer"] = CFrame.new(6625, 378, 244),["Female Islander"] = CFrame.new(4692.7939453125, 797.9766845703125, 858.8480224609375),["Venomous Assailant"] = CFrame.new(4902, 670, 39), ["Marine Commodore"] = CFrame.new(2401, 123, -7589),["Marine Rear Admiral"] = CFrame.new(3588, 229, -7085),["Fishman Raider"] = CFrame.new(-10941, 332, -8760),["Fishman Captain"] = CFrame.new(-11035, 332, -9087),["Forest Pirate"] = CFrame.new(-13446, 413, -7760),["Mythological Pirate"] = CFrame.new(-13510, 584, -6987),["Jungle Pirate"] = CFrame.new(-11778, 426, -10592),["Musketeer Pirate"] = CFrame.new(-13282, 496, -9565),["Reborn Skeleton"] = CFrame.new(-8764, 142, 5963),["Living Zombie"] = CFrame.new(-10227, 421, 6161),["Demonic Soul"] = CFrame.new(-9579, 6, 6194),["Posessed Mummy"] = CFrame.new(-9579, 6, 6194),["Peanut Scout"] = CFrame.new(-1993, 187, -10103),["Peanut President"] = CFrame.new(-2215, 159, -10474),["Ice Cream Chef"] = CFrame.new(-877, 118, -11032),["Ice Cream Commander"] = CFrame.new(-877, 118, -11032),["Cookie Crafter"] = CFrame.new(-2021, 38, -12028),["Cake Guard"] = CFrame.new(-2024, 38, -12026),["Baking Staff"] = CFrame.new(-1932, 38, -12848),["Head Baker"] = CFrame.new(-1932, 38, -12848),["Cocoa Warrior"] = CFrame.new(95, 73, -12309),["Chocolate Bar Battler"] = CFrame.new(647, 42, -12401),["Sweet Thief"] = CFrame.new(116, 36, -12478),["Candy Rebel"] = CFrame.new(47, 61, -12889),["Ghost"] = CFrame.new(5251, 5, 1111)}

EquipWeapon = function(text)

  if not text then return end

  if plr.Backpack:FindFirstChild(text) then

	plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(text))

  end

end

weaponSc = function(weapon)

  for __in, v in pairs(plr.Backpack:GetChildren()) do

    if v:IsA("Tool") then

      if v.ToolTip == weapon then EquipWeapon(v.Name) end

    end

  end

end

-- Optional executor hooks removed to keep startup portable and diagnostics visible.

local Rock = workspace:FindFirstChild("Rocks")

if Rock then Rock:Destroy()end

gay = (function()

  local lighting = game:GetService("Lighting")

  local lightingLayers = lighting:FindFirstChild("LightingLayers")

  if lightingLayers and game:GetService("Lighting") and game:GetService("Lighting") then

    local darkFog = lightingLayers:FindFirstChild("DarkFog")

    if darkFog then darkFog:Destroy() end

  end
end)()

local Attack = {}

Attack.__index = Attack

local BehindDistance = 5

Attack.Alive = function(model)
    if not model then return end
    local Humanoid = model:FindFirstChild("Humanoid")
    return Humanoid and Humanoid.Health > 0
end

Attack.Pos = function(model, dist)
    return (Root.Position - model.Position).Magnitude <= dist
end

Attack.Dist = function(model, dist)
    local HRP = model and model:FindFirstChild("HumanoidRootPart")
    if not HRP then return false end
    return (Root.Position - HRP.Position).Magnitude <= dist
end

Attack.DistH = function(model, dist)
    local HRP = model and model:FindFirstChild("HumanoidRootPart")
    if not HRP then return false end
    return (Root.Position - HRP.Position).Magnitude > dist
end

Attack.Kill = function(model, Succes)
    if model and Succes then
        local HRP = model:FindFirstChild("HumanoidRootPart")
        if not HRP then return end

        getgenv().CurrentFarmTarget = model
        getgenv().CurrentBringMob = model.Name
        BringEnemy()

        EquipWeapon(_G.SelectWeapon)

        local Character = game.Players.LocalPlayer.Character
        local Equipped = Character and Character:FindFirstChildOfClass("Tool")
        if not Equipped then return end

        local ToolTip = Equipped.ToolTip

        local height = (ToolTip == "Blox Fruit") and 5 or 15

        if ToolTip == "Blox Fruit" then
            _tp(
                HRP.CFrame
                * CFrame.new(0, height, BehindDistance)
                * CFrame.Angles(0, math.rad(90), 0)
            )
        else
            _tp(
                HRP.CFrame
                * CFrame.new(0, height, BehindDistance)
                * CFrame.Angles(0, math.rad(180), 0)
            )
        end

        for i = 1, 3 do
            if not model or not model.Parent then break end
            HRP = model:FindFirstChild("HumanoidRootPart")
            if not HRP then break end

            _tp(
                HRP.CFrame
                * CFrame.new(0, height, BehindDistance)
            )

            task.wait(0.1)
        end

        if RandomCFrame then
            task.wait(0.5)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(0, height, 25))
            end

            task.wait(0.5)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(25, height, 0))
            end

            task.wait(0.5)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(-25, height, 0))
            end

            task.wait(0.5)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(0, height, 25))
            end

            task.wait(0.5)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(-25, height, 0))
            end
        end
    end
end

Attack.Kill2 = function(model, Succes)
    if model and Succes then
        local HRP = model:FindFirstChild("HumanoidRootPart")
        if not HRP then return end

        getgenv().CurrentFarmTarget = model
        getgenv().CurrentBringMob = model.Name
        BringEnemy()

        EquipWeapon(_G.SelectWeapon)

        local Character = game.Players.LocalPlayer.Character
        local Equipped = Character and Character:FindFirstChildOfClass("Tool")
        if not Equipped then return end

        local ToolTip = Equipped.ToolTip

        local height2 = (ToolTip == "Blox Fruit") and 10 or 25

        if ToolTip == "Blox Fruit" then
            _tp(
                HRP.CFrame
                * CFrame.new(0, height2, BehindDistance)
                * CFrame.Angles(0, math.rad(90), 0)
            )
        else
            _tp(
                HRP.CFrame
                * CFrame.new(0, height2, BehindDistance)
                * CFrame.Angles(0, math.rad(180), 0)
            )
        end

        if RandomCFrame then
            task.wait(0.1)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(0, height2, 25))
            end

            task.wait(0.1)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(25, height2, 0))
            end

            task.wait(0.1)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(-25, height2, 0))
            end

            task.wait(0.1)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(0, height2, 25))
            end

            task.wait(0.1)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(-25, height2, 0))
            end
        end
    end
end

Attack.KillSea = function(model, Succes)
    if model and Succes then
        local HRP = model:FindFirstChild("HumanoidRootPart")
        if not HRP then return end

        getgenv().CurrentFarmTarget = model
        getgenv().CurrentBringMob = model.Name
        BringEnemy()

        EquipWeapon(_G.SelectWeapon)

        local Character = game.Players.LocalPlayer.Character
        local Equipped = Character and Character:FindFirstChildOfClass("Tool")
        if not Equipped then return end

        local ToolTip = Equipped.ToolTip

        if ToolTip == "Blox Fruit" then
            _tp(
                HRP.CFrame
                * CFrame.new(0, 10, BehindDistance)
                * CFrame.Angles(0, math.rad(90), 0)
            )
        else
            notween(
                HRP.CFrame
                * CFrame.new(0, 50, BehindDistance)
            )

            task.wait(0.85)

            notween(
                HRP.CFrame
                * CFrame.new(0, 400, 0)
            )

            task.wait(1)
        end
    end
end

Attack.Sword = function(model, Succes)
    if model and Succes then
        local HRP = model:FindFirstChild("HumanoidRootPart")
        if not HRP then return end

        getgenv().CurrentFarmTarget = model
        getgenv().CurrentBringMob = model.Name
        BringEnemy()

        weaponSc("Sword")

        _tp(
            HRP.CFrame
            * CFrame.new(0, 30, BehindDistance)
        )

        if RandomCFrame then
            task.wait(0.1)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(0, 30, 25))
            end

            task.wait(0.1)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(25, 30, 0))
            end

            task.wait(0.1)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(-25, 30, 0))
            end

            task.wait(0.1)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(0, 30, 25))
            end

            task.wait(0.1)

            HRP = model:FindFirstChild("HumanoidRootPart")
            if HRP then
                _tp(HRP.CFrame * CFrame.new(-25, 30, 0))
            end
        end
    end
end

Attack.Mas = function(model, Succes)
    if model and Succes then
        local HRP = model:FindFirstChild("HumanoidRootPart")
        local Humanoid = model:FindFirstChild("Humanoid")
        if not HRP or not Humanoid then return end

        getgenv().CurrentFarmTarget = model
        getgenv().CurrentBringMob = model.Name
        BringEnemy()

        if Humanoid.Health <= HealthM then
            _tp(
                HRP.CFrame
                * CFrame.new(0, 20, BehindDistance)
            )

            Useskills("Blox Fruit", "Z")
            Useskills("Blox Fruit", "X")
            Useskills("Blox Fruit", "C")
        else
            weaponSc("Melee")

            _tp(
                HRP.CFrame
                * CFrame.new(0, 30, BehindDistance)
            )
        end
    end
end

Attack.Masgun = function(model, Succes)
    if model and Succes then
        local HRP = model:FindFirstChild("HumanoidRootPart")
        local Humanoid = model:FindFirstChild("Humanoid")
        if not HRP or not Humanoid then return end

        getgenv().CurrentFarmTarget = model
        getgenv().CurrentBringMob = model.Name
        BringEnemy()

        if Humanoid.Health <= HealthM then
            _tp(
                HRP.CFrame
                * CFrame.new(0, 35, BehindDistance)
            )

            Useskills("Gun", "Z")
            Useskills("Gun", "X")
        else
            weaponSc("Melee")

            _tp(
                HRP.CFrame
                * CFrame.new(0, 30, BehindDistance)
            )
        end
    end
end

statsSetings = function(Num, value)

  if Num == "Melee" then

    if plr.Data.Points.Value ~= 0 then

      replicated.Remotes.CommF_:InvokeServer("AddPoint","Melee",value)

    end

  elseif Num == "Defense" then

    if plr.Data.Points.Value ~= 0 then

      replicated.Remotes.CommF_:InvokeServer("AddPoint","Defense",value)

    end

  elseif Num == "Sword" then

    if plr.Data.Points.Value ~= 0 then

      replicated.Remotes.CommF_:InvokeServer("AddPoint","Sword",value)

    end

  elseif Num == "Gun" then

    if plr.Data.Points.Value ~= 0 then

      replicated.Remotes.CommF_:InvokeServer("AddPoint","Gun",value)

    end

  elseif Num == "Devil" then

    if plr.Data.Points.Value ~= 0 then

      replicated.Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit",value)

    end

  end

end

function BringEnemy()
    if not _B then return end

    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return end

    local MobName = getgenv().CurrentBringMob
    local Target = getgenv().CurrentFarmTarget

    local BringStuds = 250

    if _G.AutoFarm_Bone
        or _G.Auto_Cake_Prince
        or _G.Auto_Spawn_Boss
        or _G.Farm_Cake_Quest then
        BringStuds = 300
    end

    if not Target
        or not Target.Parent
        or not Target:FindFirstChild("Humanoid")
        or not Target:FindFirstChild("HumanoidRootPart")
        or Target.Humanoid.Health <= 0 then

        Target = nil

        if MobName then
            for _, v in ipairs(enemies:GetChildren()) do
                local Humanoid = v:FindFirstChildOfClass("Humanoid")
                local RootPart = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart

                if v.Name == MobName
                    and Humanoid
                    and RootPart
                    and Humanoid.Health > 0 then

                    Target = v
                    break
                end
            end
        end

        getgenv().CurrentFarmTarget = Target
    end

    if not Target then return end

    local TargetRoot = Target:FindFirstChild("HumanoidRootPart")
    if not TargetRoot then return end

    local CenterPos = TargetRoot.Position

    pcall(function()
        sethiddenproperty(plr, "SimulationRadius", math.huge)
    end)

    for _, v in ipairs(enemies:GetChildren()) do
        if v ~= Target and (not MobName or v.Name == MobName) then

            local Humanoid = v:FindFirstChildOfClass("Humanoid")
            local RootPart = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart

            if Humanoid and RootPart and Humanoid.Health > 0 then

                local dist = (RootPart.Position - CenterPos).Magnitude

                if dist <= BringStuds and dist > 4 then
                    local moveStep = math.min(dist, 25)

                    RootPart.CFrame =
                        RootPart.CFrame:Lerp(
                            CFrame.new(CenterPos),
                            moveStep / dist
                        )

                    RootPart.CanCollide = false
                    Humanoid.WalkSpeed = 0
                    Humanoid.JumpPower = 0
                    Humanoid.AutoRotate = false

                elseif dist <= 4 then
                    RootPart.CFrame = CFrame.new(CenterPos)
                    RootPart.CanCollide = false
                    Humanoid.WalkSpeed = 0
                    Humanoid.JumpPower = 0
                    Humanoid.AutoRotate = false
                end
            end
        end
    end
end

task.spawn(function()
    while task.wait() do
        if _B then
            BringEnemy()
        else
            getgenv().CurrentFarmTarget = nil
        end
    end
end)

Useskills = function(weapon, skill)

  if weapon == "Melee" then

    weaponSc("Melee")

    if skill == "Z" then

      vim1:SendKeyEvent(true, "Z", false, game);

      vim1:SendKeyEvent(false, "Z", false, game);

    elseif skill == "X" then

      vim1:SendKeyEvent(true, "X", false, game);

      vim1:SendKeyEvent(false, "X", false, game);

    elseif skill == "C" then

      vim1:SendKeyEvent(true, "C", false, game);

      vim1:SendKeyEvent(false, "C", false, game);

    end

  elseif weapon == "Sword" then

    weaponSc("Sword")

    if skill == "Z" then

      vim1:SendKeyEvent(true, "Z", false, game);

      vim1:SendKeyEvent(false, "Z", false, game);

    elseif skill == "X" then

      vim1:SendKeyEvent(true, "X", false, game);

      vim1:SendKeyEvent(false, "X", false, game);

    end

  elseif weapon == "Blox Fruit" then

    weaponSc("Blox Fruit")

    if skill == "Z" then

      vim1:SendKeyEvent(true, "Z", false, game);

      vim1:SendKeyEvent(false, "Z", false, game);

    elseif skill == "X" then

      vim1:SendKeyEvent(true, "X", false, game);

      vim1:SendKeyEvent(false, "X", false, game);

    elseif skill == "C" then

      vim1:SendKeyEvent(true, "C", false, game);

      vim1:SendKeyEvent(false, "C", false, game);        

    elseif skill == "V" then

      vim1:SendKeyEvent(true, "V", false, game);

      vim1:SendKeyEvent(false, "V", false, game);

    end

  elseif weapon == "Gun" then

    weaponSc("Gun")

    if skill == "Z" then

      vim1:SendKeyEvent(true, "Z", false, game);

      vim1:SendKeyEvent(false, "Z", false, game);

    elseif skill == "X" then

      vim1:SendKeyEvent(true, "X", false, game);

      vim1:SendKeyEvent(false, "X", false, game);

    end

  end

  if weapon == "nil" and skill == "Y" then

    vim1:SendKeyEvent(true, "Y", false, game);

    vim1:SendKeyEvent(false, "Y", false, game);

  end

end

-- FIX: wrap metatable hook in pcall - crashes on unsupported executors
pcall(function()
local gg = getrawmetatable(game)

local old = gg.__namecall

setreadonly(gg, false)

gg.__namecall = newcclosure(function(...)

  local method = getnamecallmethod()

  local args = {...}    

    if tostring(method) == "FireServer" then

      if tostring(args[1]) == "RemoteEvent" then

        if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then

          if (_G.FarmMastery_G and not SoulGuitar) or (_G.FarmMastery_Dev) or (_G.FarmBlazeEM) or (_G.Prehis_Skills) or (_G.SeaBeast1 or _G.FishBoat or _G.PGB or _G.Leviathan1 or _G.Complete_Trials) or (_G.AimMethod and ABmethod == "AimBots Skill") or (_G.AimMethod and ABmethod == "Auto Aimbots") then

            args[2] = MousePos

            return old(unpack(args))

          end

        end

      end

    end

  return old(...)

end)
end) -- end pcall for getrawmetatable

GetConnectionEnemies = function(a)

  for i,v in pairs(replicated:GetChildren()) do

    if v:IsA("Model") and  ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then

      return v

    end

  end

  for i,v in next,game.Workspace.Enemies:GetChildren() do

    if v:IsA("Model") and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a)  and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then

      return v

    end

  end

end

LowCpu = function()

  local decalsyeeted = true

  local g = game

  local w = g.Workspace

  local l = g.Lighting

  local t = w.Terrain

  t.WaterWaveSize = 0

  t.WaterWaveSpeed = 0

  t.WaterReflectance = 0

  t.WaterTransparency = 0

  l.GlobalShadows = false

  l.FogEnd = 9e9

  l.Brightness = 0

  settings().Rendering.QualityLevel = "Level01"

  for i, v in pairs(g:GetDescendants()) do

    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then

      v.Material = "Plastic"

      v.Reflectance = 0

    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then

      v.Transparency = 1

    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then

      v.Lifetime = NumberRange.new(0)

    elseif v:IsA("Explosion") then

      v.BlastPressure = 1

      v.BlastRadius = 1

    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then

      v.Enabled = false

    elseif v:IsA("MeshPart") then

      v.Material = "Plastic"

      v.Reflectance = 0

      v.TextureID = 10385902758728957

    end

  end

  for i, e in pairs(l:GetChildren()) do

    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then

      e.Enabled = false

    end

  end

end

CheckF = function()

  if GetBP("Dragon-Dragon") or GetBP("Gas-Gas") or GetBP("Yeti-Yeti") or GetBP("Kitsune-Kitsune") or GetBP("T-Rex-T-Rex") then return true end

end

CheckBoat = function()

  for i, v in pairs(workspace.Boats:GetChildren()) do

    if tostring(v.Owner.Value) == tostring(plr.Name) then

      return v    

end;

  end;

  return false

end;

CheckEnemiesBoat = function()

  for _,v in pairs(workspace.Enemies:GetChildren()) do

    if (v.Name == "FishBoat") and v:FindFirstChild("Health").Value > 0 then

      return true    

end;

  end;

  return false

end;

CheckPirateGrandBrigade = function()

  for _,v in pairs(workspace.Enemies:GetChildren()) do

    if (v.Name == "PirateGrandBrigade" or v.Name == "PirateBrigade") and v:FindFirstChild("Health").Value > 0 then

      return true

    end

  end

  return false

end

CheckShark = function()

  for _,v in pairs(workspace.Enemies:GetChildren()) do

    if v.Name == "Shark" and Attack.Alive(v) then

      return true    

end;

  end;

  return false

end;

CheckTerrorShark = function()

  for _,v in pairs(workspace.Enemies:GetChildren()) do

    if v.Name == "Terrorshark" and Attack.Alive(v) then

      return true    

end;

  end;

  return false

end;

CheckPiranha = function()

  for _,v in pairs(workspace.Enemies:GetChildren()) do

    if v.Name == "Piranha" and Attack.Alive(v) then

      return true    

end;

  end;

  return false

end;

CheckFishCrew = function()

  for _,v in pairs(workspace.Enemies:GetChildren()) do

    if (v.Name == "Fish Crew Member" or v.Name == "Haunted Crew Member") and Attack.Alive(v) then

      return true    

end;

  end;

  return false

end;

CheckHauntedCrew = function()

  for _,v in pairs(workspace.Enemies:GetChildren()) do

    if (v.Name == "Haunted Crew Member") and Attack.Alive(v) then

      return true    

end;

  end;

  return false

end;

CheckSeaBeast = function()

  if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then

    return true  

end;

  return false

end;

CheckLeviathan = function()

  if workspace.SeaBeasts:FindFirstChild("Leviathan") then

    return true  

end;

  return false

end;

UpdStFruit = function()
    local function StoreFruit(container)
        if not container then
            return
        end

        for _, fruit in pairs(container:GetChildren()) do
            if fruit:IsA("Tool") and string.find(fruit.Name, "Fruit") then
                if not fruit:FindFirstChild("Ignored") then
                    local fruitName = string.gsub(fruit.Name, " Fruit", "")
                    local originalName = fruit:GetAttribute("OriginalName")

                    if not originalName then
                        originalName = fruitName .. "-" .. fruitName
                    end

                    pcall(function()
                        replicated.Remotes.CommF_:InvokeServer(
                            "StoreFruit",
                            originalName,
                            fruit
                        )
                    end)

                    local ignored = Instance.new("IntValue")
                    ignored.Name = "Ignored"
                    ignored.Parent = fruit
                end
            end
        end
    end

    StoreFruit(plr.Backpack)
    StoreFruit(plr.Character)
end

collectFruits = function(Succes)

  if Succes then

    local Character = plr.Character

    for _,v1 in pairs(workspace:GetChildren()) do

    if string.find(v1.Name, "Fruit") then v1.Handle.CFrame = Character.HumanoidRootPart.CFrame end

    end

  end

end

Getmoon = function()

  if World1 then

    return Lighting.FantasySky.MoonTextureId

  elseif World2 then

    return Lighting.FantasySky.MoonTextureId

  elseif World3 then

    return Lighting.Sky.MoonTextureId

  end

end

DropFruits = function()

  for _,v3 in next, plr.Backpack:GetChildren() do

    if string.find(v3.Name, "Fruit") then

      EquipWeapon(v3.Name) wait(.1)

      if plr.PlayerGui.Main.Dialogue.Visible == true then plr.PlayerGui.Main.Dialogue.Visible = false end EquipWeapon(v3.Name) plr.Character:FindFirstChild(v3.Name).EatRemote:InvokeServer("Drop")

    end

  end

  for a,b2 in pairs(plr.Character:GetChildren()) do

    if string.find(b2.Name, "Fruit") then EquipWeapon(b2.Name) wait(.1)

    if plr.PlayerGui.Main.Dialogue.Visible == true then plr.PlayerGui.Main.Dialogue.Visible = false end EquipWeapon(b2.Name) plr.Character:FindFirstChild(b2.Name).EatRemote:InvokeServer("Drop")

    end

  end

end

GetBP = function(v)

  return plr.Backpack:FindFirstChild(v) or plr.Character:FindFirstChild(v)

end

GetIn = function(Name)

  for _ ,v1 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do

    if type(v1) == "table" then

      if v1.Name == Name or plr.Character:FindFirstChild(Name) or plr.Backpack:FindFirstChild(Name) then

        return true

	 end

    end

  end

  return false

end

GetM = function(Name)

  for _,tab in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do

    if type(tab) == "table" then

	  if tab.Type == "Material" then

	    if tab.Name == Name then

		  return tab.Count

	    end

	  end

    end

  end

return 0

end

GetWP = function(nametool)

  for _,v4 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do

    if type(v4) == "table" then

      if v4.Type == "Sword" then

        if v4.Name == nametool or plr.Character:FindFirstChild(nametool) or plr.Backpack:FindFirstChild(nametool) then

	     return true

	     end

	   end

      end

    end

  return false

end 

getInfinity_Ability = function(Method, Var)

  if not Root then return end

  if Method == "Soru" and Var then

    for _,gc in next, getgc() do

      if plr.Character.Soru then

        if ((typeof(gc) == "function") and (getfenv(gc).script == plr.Character.Soru)) then

          for _, v in next, getupvalues(gc) do

            if (typeof(v) == "table") then

              repeat wait(Sec) v.LastUse = 0 until not Var or (plr.Character.Humanoid.Health <= 0)

            end

          end

        end

      end

    end    

  elseif Method == "Energy" and Var then

    plr.Character.Energy.Changed:connect(function()

      if Var then plr.Character.Energy.Value = Energy end 

    end)

  elseif Method == "Observation" and Var then

    local VisionRadius = plr.VisionRadius

    VisionRadius.Value = math.huge

  end

end

Hop = function()

  pcall(function()

    for count = math.random(1, math.random(40, 75)), 100 do

      local remote = replicated.__ServerBrowser:InvokeServer(count)

	  for _, v in next, remote do

	  if tonumber(v['Count']) < 12 then TeleportService:TeleportToPlaceInstance(game.PlaceId, _) end

	  end    

    end

  end)

end
local TweenService = game:GetService("TweenService")
local CurrentTween

local DC_DISTANCE = 12000
local InstantTeleportDistance = 200
local BoostDistance = 400
local BoostSpeed = 425

if not getgenv().TweenSpeed then
    getgenv().TweenSpeed = 190
end

_tp = function(target)
    local character = plr.Character
    if not character then
        return
    end

    local hum = character:FindFirstChildOfClass("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")

    if not hum or not hrp then
        return
    end

    local distance = (target.Position - hrp.Position).Magnitude

    if distance >= DC_DISTANCE and IslandCF and DC_FastHopTo then
        local nearestIsland
        local nearestDist = math.huge

        for name, cf in pairs(IslandCF) do
            local dist = (cf.Position - target.Position).Magnitude

            if dist < nearestDist then
                nearestDist = dist
                nearestIsland = name
            end
        end

        if nearestIsland then
            pcall(function()
                DC_FastHopTo(nearestIsland)
            end)

            task.wait(1)

            character = plr.Character
            if not character then
                return
            end

            hum = character:FindFirstChildOfClass("Humanoid")
            hrp = character:FindFirstChild("HumanoidRootPart")

            if not hum or not hrp then
                return
            end
        end
    end

    if CurrentTween then
        pcall(function()
            CurrentTween:Cancel()
        end)
        CurrentTween = nil
    end

    if hum.Sit and hum.SeatPart and hum.SeatPart:IsA("VehicleSeat") then
        local seat = hum.SeatPart
        local boatDistance = (target.Position - seat.Position).Magnitude

        if boatDistance <= InstantTeleportDistance then
            seat.CFrame = target
            return
        end

        local currentSpeed = getgenv().TweenSpeed

        if boatDistance <= BoostDistance then
            currentSpeed = BoostSpeed
        end

        CurrentTween = TweenService:Create(
            seat,
            TweenInfo.new(
                boatDistance / currentSpeed,
                Enum.EasingStyle.Linear
            ),
            {
                CFrame = target
            }
        )

        CurrentTween:Play()

        while CurrentTween
            and CurrentTween.PlaybackState == Enum.PlaybackState.Playing do

            if not shouldTween then
                CurrentTween:Cancel()
                break
            end

            if not seat.Parent then
                CurrentTween:Cancel()
                break
            end

            local remaining = (target.Position - seat.Position).Magnitude

            if remaining <= InstantTeleportDistance then
                CurrentTween:Cancel()
                seat.CFrame = target
                break
            end

            task.wait()
        end

        CurrentTween = nil
        return
    end

    distance = (target.Position - hrp.Position).Magnitude

    if distance <= InstantTeleportDistance then
        hrp.CFrame = target
        return
    end

    local currentSpeed = getgenv().TweenSpeed

    if distance <= BoostDistance then
        currentSpeed = BoostSpeed
    end

    CurrentTween = TweenService:Create(
        hrp,
        TweenInfo.new(
            distance / currentSpeed,
            Enum.EasingStyle.Linear
        ),
        {
            CFrame = target
        }
    )

    CurrentTween:Play()

    while CurrentTween
        and CurrentTween.PlaybackState == Enum.PlaybackState.Playing do

        if not shouldTween then
            CurrentTween:Cancel()
            break
        end

        if not hrp.Parent then
            CurrentTween:Cancel()
            break
        end

        local remaining = (target.Position - hrp.Position).Magnitude

        if remaining <= InstantTeleportDistance then
            CurrentTween:Cancel()
            hrp.CFrame = target
            break
        end

        task.wait()
    end

    CurrentTween = nil
end

TeleportToTarget = function(targetCFrame)
    _tp(targetCFrame)
end

notween = function(p)
    plr.Character.HumanoidRootPart.CFrame = p
end

function BTP(p)
    local player = game.Players.LocalPlayer
    local humanoidRootPart = player.Character.HumanoidRootPart
    local humanoid = player.Character.Humanoid
    local playerGui = player.PlayerGui.Main
    local targetPosition = p.Position
    local lastPosition = humanoidRootPart.Position

    repeat
        humanoid.Health = 0
        humanoidRootPart.CFrame = p
        playerGui.Quest.Visible = false

        if (humanoidRootPart.Position - lastPosition).Magnitude > 1 then
            lastPosition = humanoidRootPart.Position
            humanoidRootPart.CFrame = p
        end

        task.wait(0.5)
    until (p.Position - humanoidRootPart.Position).Magnitude <= 2000
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.SailBoat_Hydra
                or _G.WardenBoss
                or _G.AutoFactory
                or _G.HighestMirage
                or _G.HCM
                or _G.PGB
                or _G.Leviathan1
                or _G.UPGDrago
                or _G.Complete_Trials
                or _G.TpDrago_Prehis
                or _G.BuyDrago
                or _G.AutoFireFlowers
                or _G.DT_Uzoth
                or _G.AutoBerry
                or _G.Prehis_Find
                or _G.Prehis_Skills
                or _G.Prehis_DB
                or _G.Prehis_DE
                or _G.FarmBlazeEM
                or _G.Dojoo
                or _G.CollectPresent
                or _G.AutoLawKak
                or _G.TpLab
                or _G.AutoPhoenixF
                or _G.AutoFarmChest
                or _G.AutoHytHallow
                or _G.LongsWord
                or _G.BlackSpikey
                or _G.AutoHolyTorch
                or _G.TrainDrago
                or _G.AutoSaber
                or _G.FarmMastery_Dev
                or _G.CitizenQuest
                or _G.AutoEctoplasm
                or _G.KeysRen
                or _G.Auto_Rainbow_Haki
                or _G.obsFarm
                or _G.AutoBigmom
                or _G.Doughv2
                or _G.AuraBoss
                or _G.Raiding
                or _G.Auto_Cavender
                or _G.TpPly
                or _G.Bartilo_Quest
                or _G.Level
                or _G.FarmEliteHunt
                or _G.AutoZou
                or _G.AutoFarm_Bone
                or getgenv().AutoMaterial
                or _G.CraftVM
                or _G.FrozenTP
                or _G.TPDoor
                or _G.AcientOne
                or _G.AutoFarmNear
                or _G.AutoRaidCastle
                or _G.DarkBladev3
                or _G.AutoFarmRaid
                or _G.Auto_Cake_Prince
                or _G.Addealer
                or _G.TPNpc
                or _G.TwinHook
                or _G.FindMirage
                or _G.FarmChestM
                or _G.Shark
                or _G.TerrorShark
                or _G.Piranha
                or _G.MobCrew
                or _G.SeaBeast1
                or _G.FishBoat
                or _G.AutoPole
                or _G.AutoPoleV2
                or _G.Auto_SuperHuman
                or _G.AutoDeathStep
                or _G.Auto_SharkMan_Karate
                or _G.Auto_Electric_Claw
                or _G.AutoDragonTalon
                or _G.Auto_Def_DarkCoat
                or _G.Auto_God_Human
                or _G.Auto_Tushita
                or _G.AutoMatSoul
                or _G.AutoKenVTWO
                or _G.AutoSerpentBow
                or _G.AutoFMon
                or _G.Auto_Soul_Guitar
                or _G.TPGEAR
                or _G.AutoSaw
                or _G.AutoTridentW2
                or _G.Auto_StartRaid
                or _G.AutoEvoRace
                or _G.AutoGetQuestBounty
                or _G.MarinesCoat
                or _G.TravelDres
                or _G.Defeating
                or _G.DummyMan
                or _G.Auto_Yama
                or _G.Auto_SwanGG
                or _G.SwanCoat
                or _G.AutoEcBoss
                or _G.Auto_Mink
                or _G.Auto_Human
                or _G.Auto_Skypiea
                or _G.Auto_Fish
                or _G.CDK_TS
                or _G.CDK_YM
                or _G.CDK
                or _G.AutoFarmGodChalice
                or _G.AutoFistDarkness
                or _G.AutoMiror
                or _G.Teleport
                or _G.AutoKilo
                or _G.AutoGetUsoap
                or _G.Praying
                or _G.TryLucky
                or _G.AutoColShad
                or _G.AutoUnHaki
                or _G.Auto_DonAcces
                or _G.AutoRipIngay
                or _G.DragoV3
                or _G.DragoV1
                or _G.SailBoats
                or NextIs
                or _G.FarmGodChalice
                or _G.IceBossRen
                or senth
                or senth2
                or _G.Lvthan
                or _G.beasthunter
                or _G.DangerLV
                or _G.Relic123
                or _G.tweenKitsune
                or _G.Collect_Ember
                or _G.AutofindKitIs
                or _G.snaguine
                or _G.TwFruits
                or _G.tweenKitShrine
                or _G.Tp_LgS
                or _G.Tp_MasterA
                or _G.tweenShrine
                or _G.FarmMastery_G
                or _G_Trade_Chalice
                or _G.FarmTyrant
                or _G.Farm_Cake_Quest
                or _G.Auto_Spawn_Boss
                or _G.Auto_FindChest_Darkbeard
                or _G.Auto_Rau_Den
                or _G.AutoFarmChest
                or _G.FarmMastery_S then

                shouldTween = true

                local character = plr.Character
                local hrp = character and character:FindFirstChild("HumanoidRootPart")

                if hrp and not hrp:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = hrp
                    Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                    Noclip.Velocity = Vector3.new(0, 0, 0)
                end

                if character and not character:FindFirstChild("highlight") then
                    local Test = Instance.new("Highlight")
                    Test.Name = "highlight"
                    Test.Enabled = true
                    Test.FillColor = Color3.fromRGB(0, 255, 255)
                    Test.FillTransparency = 0.5
                    Test.OutlineColor = Color3.fromRGB(230, 255, 255)
                    Test.OutlineTransparency = 0.01
                    Test.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    Test.Parent = character
                end

                if character then
                    for _, no in pairs(character:GetDescendants()) do
                        if no:IsA("BasePart") then
                            no.CanCollide = false
                        end
                    end
                end

            else
                shouldTween = false

                local character = plr.Character

                if character then
                    local hrp = character:FindFirstChild("HumanoidRootPart")

                    if hrp then
                        local bodyClip = hrp:FindFirstChild("BodyClip")

                        if bodyClip then
                            bodyClip:Destroy()
                        end
                    end

                    local highlight = character:FindFirstChild("highlight")

                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end)
    end
end)

QuestB=function()if World1 then if _G.FindBoss=="The Gorilla King"then bMon="The Gorilla King"Qname="JungleQuest"Qdata=3;PosQBoss=CFrame.new(-1601.6553955078,36.85213470459,153.38809204102)PosB=CFrame.new(-1088.75977,8.13463783,-488.559906,-0.707134247,0,0.707079291,0,1,0,-0.707079291,0,-0.707134247)elseif _G.FindBoss=="Bobby"then bMon="Bobby"Qname="BuggyQuest1"Qdata=3;PosQBoss=CFrame.new(-1140.1761474609,4.752049446106,3827.4057617188)PosB=CFrame.new(-1087.3760986328,46.949409484863,4040.1462402344)elseif _G.FindBoss=="The Saw"then bMon="The Saw"PosB=CFrame.new(-784.89715576172,72.427383422852,1603.5822753906)elseif _G.FindBoss=="Yeti"then bMon="Yeti"Qname="SnowQuest"Qdata=3;PosQBoss=CFrame.new(1386.8073730469,87.272789001465,-1298.3576660156)PosB=CFrame.new(1218.7956542969,138.01184082031,-1488.0262451172)elseif _G.FindBoss=="Mob Leader"then bMon="Mob Leader"PosB=CFrame.new(-2844.7307128906,7.4180502891541,5356.6723632813)elseif _G.FindBoss=="Vice Admiral"then bMon="Vice Admiral"Qname="MarineQuest2"Qdata=2;PosQBoss=CFrame.new(-5036.2465820313,28.677835464478,4324.56640625)PosB=CFrame.new(-5006.5454101563,88.032081604004,4353.162109375)elseif _G.FindBoss=="Saber Expert"then bMon="Saber Expert"PosB=CFrame.new(-1458.89502,29.8870335,-50.633564)elseif _G.FindBoss=="Warden"then bMon="Warden"Qname="ImpelQuest"Qdata=1;PosB=CFrame.new(5278.04932,2.15167475,944.101929,0.220546961,-4.49946401e-06,0.975376427,-1.95412576e-05,1,9.03162072e-06,-0.975376427,-2.10519756e-05,0.220546961)PosQBoss=CFrame.new(5191.86133,2.84020686,686.438721,-0.731384635,0,0.681965172,0,1,0,-0.681965172,0,-0.731384635)elseif _G.FindBoss=="Chief Warden"then bMon="Chief Warden"Qname="ImpelQuest"Qdata=2;PosB=CFrame.new(5206.92578,0.997753382,814.976746,0.342041343,-0.00062915677,0.939684749,0.00191645394,0.999998152,-2.80422337e-05,-0.939682961,0.00181045406,0.342041939)PosQBoss=CFrame.new(5191.86133,2.84020686,686.438721,-0.731384635,0,0.681965172,0,1,0,-0.681965172,0,-0.731384635)elseif _G.FindBoss=="Swan"then bMon="Swan"Qname="ImpelQuest"Qdata=3;PosB=CFrame.new(5325.09619,7.03906584,719.570679,-0.309060812,0,0.951042235,0,1,0,-0.951042235,0,-0.309060812)PosQBoss=CFrame.new(5191.86133,2.84020686,686.438721,-0.731384635,0,0.681965172,0,1,0,-0.681965172,0,-0.731384635)elseif _G.FindBoss=="Magma Admiral"then bMon="Magma Admiral"Qname="MagmaQuest"Qdata=3;PosQBoss=CFrame.new(-5314.6220703125,12.262420654297,8517.279296875)PosB=CFrame.new(-5765.8969726563,82.92064666748,8718.3046875)elseif _G.FindBoss=="Fishman Lord"then bMon="Fishman Lord"Qname="FishmanQuest"Qdata=3;PosQBoss=CFrame.new(61122.65234375,18.497442245483,1569.3997802734)PosB=CFrame.new(61260.15234375,30.950881958008,1193.4329833984)elseif _G.FindBoss=="Wysper"then bMon="Wysper"Qname="SkyExp1Quest"Qdata=3;PosQBoss=CFrame.new(-7861.947265625,5545.517578125,-379.85974121094)PosB=CFrame.new(-7866.1333007813,5576.4311523438,-546.74816894531)elseif _G.FindBoss=="Thunder God"then bMon="Thunder God"Qname="SkyExp2Quest"Qdata=3;PosQBoss=CFrame.new(-7903.3828125,5635.9897460938,-1410.923828125)PosB=CFrame.new(-7994.984375,5761.025390625,-2088.6479492188)elseif _G.FindBoss=="Cyborg"then bMon="Cyborg"Qname="FountainQuest"Qdata=3;PosQBoss=CFrame.new(5258.2788085938,38.526931762695,4050.044921875)PosB=CFrame.new(6094.0249023438,73.770050048828,3825.7348632813)elseif _G.FindBoss=="Ice Admiral"then bMon="Ice Admiral"Qdata=nil;PosQBoss=CFrame.new(1266.08948,26.1757946,-1399.57678,-0.573599219,0,-0.81913656,0,1,0,0.81913656,0,-0.573599219)PosB=CFrame.new(1266.08948,26.1757946,-1399.57678,-0.573599219,0,-0.81913656,0,1,0,0.81913656,0,-0.573599219)elseif _G.FindBoss=="Greybeard"then bMon="Greybeard"Qdata=nil;PosQBoss=CFrame.new(-5081.3452148438,85.221641540527,4257.3588867188)PosB=CFrame.new(-5081.3452148438,85.221641540527,4257.3588867188)end end;if World2 then if _G.FindBoss=="Diamond"then bMon="Diamond"Qname="Area1Quest"Qdata=3;PosQBoss=CFrame.new(-427.5666809082,73.313781738281,1835.4208984375)PosB=CFrame.new(-1576.7166748047,198.59265136719,13.724286079407)elseif _G.FindBoss=="Jeremy"then bMon="Jeremy"Qname="Area2Quest"Qdata=3;PosQBoss=CFrame.new(636.79943847656,73.413787841797,918.00415039063)PosB=CFrame.new(2006.9261474609,448.95666503906,853.98284912109)elseif _G.FindBoss=="Fajita"then bMon="Fajita"Qname="MarineQuest3"Qdata=3;PosQBoss=CFrame.new(-2441.986328125,73.359344482422,-3217.5324707031)PosB=CFrame.new(-2172.7399902344,103.32216644287,-4015.025390625)elseif _G.FindBoss=="Don Swan"then bMon="Don Swan"PosB=CFrame.new(2286.2004394531,15.177839279175,863.8388671875)elseif _G.FindBoss=="Smoke Admiral"then bMon="Smoke Admiral"Qname="IceSideQuest"Qdata=3;PosQBoss=CFrame.new(-5429.0473632813,15.977565765381,-5297.9614257813)PosB=CFrame.new(-5275.1987304688,20.757257461548,-5260.6669921875)elseif _G.FindBoss=="Awakened Ice Admiral"then bMon="Awakened Ice Admiral"Qname="FrostQuest"Qdata=3;PosQBoss=CFrame.new(5668.9780273438,28.519989013672,-6483.3520507813)PosB=CFrame.new(6403.5439453125,340.29766845703,-6894.5595703125)elseif _G.FindBoss=="Tide Keeper"then bMon="Tide Keeper"Qname="ForgottenQuest"Qdata=3;PosQBoss=CFrame.new(-3053.9814453125,237.18954467773,-10145.0390625)PosB=CFrame.new(-3795.6423339844,105.88877105713,-11421.307617188)elseif _G.FindBoss=="Darkbeard"then bMon="Darkbeard"Qdata=nil;PosQBoss=CFrame.new(3677.08203125,62.751937866211,-3144.8332519531)PosB=CFrame.new(3677.08203125,62.751937866211,-3144.8332519531)elseif _G.FindBoss=="Cursed Captaim"then bMon="Cursed Captain"Qdata=nil;PosQBoss=CFrame.new(916.928589,181.092773,33422)PosB=CFrame.new(916.928589,181.092773,33422)elseif _G.FindBoss=="Order"then bMon="Order"Qdata=nil;PosQBoss=CFrame.new(-6217.2021484375,28.047645568848,-5053.1357421875)PosB=CFrame.new(-6217.2021484375,28.047645568848,-5053.1357421875)end end;if World3 then if _G.FindBoss=="Stone"then bMon="Stone"Qname="PiratePortQuest"Qdata=3;PosQBoss=CFrame.new(-289.76705932617,43.819011688232,5579.9384765625)PosB=CFrame.new(-1027.6512451172,92.404174804688,6578.8530273438)elseif _G.FindBoss=="Hydra Leader"then bMon="Hydra Leader"Qname="AmazonQuest2"Qdata=3;PosQBoss=CFrame.new(5821.89794921875,1019.0950927734375,-73.71923065185547)PosB=CFrame.new(5821.89794921875,1019.0950927734375,-73.71923065185547)elseif _G.FindBoss=="Kilo Admiral"then bMon="Kilo Admiral"Qname="MarineTreeIsland"Qdata=3;PosQBoss=CFrame.new(2179.3010253906,28.731239318848,-6739.9741210938)PosB=CFrame.new(2764.2233886719,432.46154785156,-7144.4580078125)elseif _G.FindBoss=="Captain Elephant"then bMon="Captain Elephant"Qname="DeepForestIsland"Qdata=3;PosQBoss=CFrame.new(-13232.682617188,332.40396118164,-7626.01171875)PosB=CFrame.new(-13376.7578125,433.28689575195,-8071.392578125)elseif _G.FindBoss=="Beautiful Pirate"then bMon="Beautiful Pirate"Qname="DeepForestIsland2"Qdata=3;PosQBoss=CFrame.new(-12682.096679688,390.88653564453,-9902.1240234375)PosB=CFrame.new(5283.609375,22.56223487854,-110.78285217285)elseif _G.FindBoss=="Cake Queen"then bMon="Cake Queen"Qname="IceCreamIslandQuest"Qdata=3;PosQBoss=CFrame.new(-819.376709,64.9259796,-10967.2832,-0.766061664,0,0.642767608,0,1,0,-0.642767608,0,-0.766061664)PosB=CFrame.new(-678.648804,381.353943,-11114.2012,-0.908641815,0.00149294338,0.41757378,0.00837114919,0.999857843,0.0146408929,-0.417492568,0.0167988986,-0.90852499)elseif _G.FindBoss=="Longma"then bMon="Longma"Qdata=nil;PosQBoss=CFrame.new(-10238.875976563,389.7912902832,-9549.7939453125)PosB=CFrame.new(-10238.875976563,389.7912902832,-9549.7939453125)elseif _G.FindBoss=="Soul Reaper"then bMon="Soul Reaper"Qdata=nil;PosQBoss=CFrame.new(-9524.7890625,315.80429077148,6655.7192382813)PosB=CFrame.new(-9524.7890625,315.80429077148,6655.7192382813)end end end

QuestBeta = function()

  local Neta = QuestB()

  return {

    [0] = _G.FindBoss,

    [1] = bMon,

    [2] = Qdata,

    [3] = Qname,

    [4] = PosB

    }  

end

QuestCheck = function()
    MyLevel = plr.Data.Level.Value
    Mon = ""
    Qdata = 0
    Qname = ""
    NameMon = ""
    PosQ = CFrame.new()
    PosM = CFrame.new()

    if World1 then
        if MyLevel >= 1 and MyLevel <= 9 then
            if tostring(TeamSelf) == "Marines" then
                Mon = "Trainee"
                Qdata = 1
                Qname = "MarineQuest"
                NameMon = "Trainee"
                PosQ = CFrame.new(-2709.67944,24.5206585,2104.24585,-0.744724929,0,-0.667371571,0,1,0,0.667371571,0,-0.744724929)
                PosM = PosQ
            else
                Mon = "Bandit"
                Qdata = 1
                Qname = "BanditQuest1"
                NameMon = "Bandit"
                PosQ = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, 0, -0.341998369, 0, 1, 0, 0.341998369, 0, 0.939700544)
                PosM = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
            end
        elseif MyLevel >= 10 and MyLevel <= 14 then
            Mon = "Monkey"
            Qdata = 1
            Qname = "JungleQuest"
            NameMon = "Monkey"
            PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, 0, -1, 0, 0)
            PosM = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif MyLevel >= 15 and MyLevel <= 29 then
            Mon = "Gorilla"
            Qdata = 2
            Qname = "JungleQuest"
            NameMon = "Gorilla"
            PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, 0, -1, 0, 0)
            PosM = CFrame.new(-1129.8836669921875, 40.46354675296875, -525.4237060546875)
        elseif MyLevel >= 30 and MyLevel <= 39 then
            Mon = "Pirate"
            Qdata = 1
            Qname = "BuggyQuest1"
            NameMon = "Pirate"
            PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, 0, -0.258804798, 0, 1, 0, 0.258804798, 0, 0.965929627)
            PosM = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif MyLevel >= 40 and MyLevel <= 59 then
            Mon = "Brute"
            Qdata = 2
            Qname = "BuggyQuest1"
            NameMon = "Brute"
            PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, 0, -0.258804798, 0, 1, 0, 0.258804798, 0, 0.965929627)
            PosM = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif MyLevel >= 60 and MyLevel <= 74 then
            Mon = "Desert Bandit"
            Qdata = 1
            Qname = "DesertQuest"
            NameMon = "Desert Bandit"
            PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, 0.819155693)
            PosM = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif MyLevel >= 75 and MyLevel <= 89 then
            Mon = "Desert Officer"
            Qdata = 2
            Qname = "DesertQuest"
            NameMon = "Desert Officer"
            PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, 0.819155693)
            PosM = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif MyLevel >= 90 and MyLevel <= 99 then
            Mon = "Snow Bandit"
            Qdata = 1
            Qname = "SnowQuest"
            NameMon = "Snow Bandit"
            PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            PosM = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif MyLevel >= 100 and MyLevel <= 119 then
            Mon = "Snowman"
            Qdata = 2
            Qname = "SnowQuest"
            NameMon = "Snowman"
            PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            PosM = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif MyLevel >= 120 and MyLevel <= 149 then
            Mon = "Chief Petty Officer"
            Qdata = 1
            Qname = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            PosQ = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            PosM = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif MyLevel >= 150 and MyLevel <= 174 then
            Mon = "Sky Bandit"
            Qdata = 1
            Qname = "SkyQuest"
            NameMon = "Sky Bandit"
            PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            PosM = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif MyLevel >= 175 and MyLevel <= 189 then
            Mon = "Dark Master"
            Qdata = 2
            Qname = "SkyQuest"
            NameMon = "Dark Master"
            PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            PosM = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif MyLevel >= 190 and MyLevel <= 209 then
            Mon = "Prisoner"
            Qdata = 1
            Qname = "PrisonerQuest"
            NameMon = "Prisoner"
            PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, 0, -0.995993316, 0, 1, 0, 0.995993316, 0, -0.0894274712)
            PosM = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif MyLevel >= 210 and MyLevel <= 249 then
            Mon = "Dangerous Prisoner"
            Qdata = 2
            Qname = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, 0, -0.995993316, 0, 1, 0, 0.995993316, 0, -0.0894274712)
            PosM = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif MyLevel >= 250 and MyLevel <= 274 then
            Mon = "Toga Warrior"
            Qdata = 1
            Qname = "ColosseumQuest"
            NameMon = "Toga Warrior"
            PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            PosM = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif MyLevel >= 275 and MyLevel <= 299 then
            Mon = "Gladiator"
            Qdata = 2
            Qname = "ColosseumQuest"
            NameMon = "Gladiator"
            PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            PosM = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif MyLevel >= 300 and MyLevel <= 324 then
            Mon = "Military Soldier"
            Qdata = 1
            Qname = "MagmaQuest"
            NameMon = "Military Soldier"
            PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            PosM = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif MyLevel >= 325 and MyLevel <= 374 then
            Mon = "Military Spy"
            Qdata = 2
            Qname = "MagmaQuest"
            NameMon = "Military Spy"
            PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            PosM = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif MyLevel >= 375 and MyLevel <= 399 then
            Mon = "Fishman Warrior"
            Qdata = 1
            Qname = "FishmanQuest"
            NameMon = "Fishman Warrior"
            PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosM = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
        elseif MyLevel >= 400 and MyLevel <= 449 then
            Mon = "Fishman Commando"
            Qdata = 2
            Qname = "FishmanQuest"
            NameMon = "Fishman Commando"
            PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosM = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
        elseif MyLevel >= 450 and MyLevel <= 474 then
            Mon = "God's Guard"
            Qdata = 1
            Qname = "SkyExp1Quest"
            NameMon = "God's Guard"
            PosQ = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, 0, -0.0871884301, 0, 1, 0, 0.0871884301, 0, 0.996191859)
            PosM = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
        elseif MyLevel >= 475 and MyLevel <= 524 then
            Mon = "Shanda"
            Qdata = 2
            Qname = "SkyExp1Quest"
            NameMon = "Shanda"
            PosQ = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
            PosM = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
        elseif MyLevel >= 525 and MyLevel <= 549 then
            Mon = "Royal Squad"
            Qdata = 1
            Qname = "SkyExp2Quest"
            NameMon = "Royal Squad"
            PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            PosM = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif MyLevel >= 550 and MyLevel <= 624 then
            Mon = "Royal Soldier"
            Qdata = 2
            Qname = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            PosM = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif MyLevel >= 625 and MyLevel <= 649 then
            Mon = "Galley Pirate"
            Qdata = 1
            Qname = "FountainQuest"
            NameMon = "Galley Pirate"
            PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            PosM = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif MyLevel >= 650 then
            Mon = "Galley Captain"
            Qdata = 2
            Qname = "FountainQuest"
            NameMon = "Galley Captain"
            PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            PosM = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif World2 then
        if MyLevel >= 700 and MyLevel <= 724 then
            Mon = "Raider"
            Qdata = 1
            Qname = "Area1Quest"
            NameMon = "Raider"
            PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            PosM = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif MyLevel >= 725 and MyLevel <= 774 then
            Mon = "Mercenary"
            Qdata = 2
            Qname = "Area1Quest"
            NameMon = "Mercenary"
            PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            PosM = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif MyLevel >= 775 and MyLevel <= 799 then
            Mon = "Swan Pirate"
            Qdata = 1
            Qname = "Area2Quest"
            NameMon = "Swan Pirate"
            PosQ = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
            PosM = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif MyLevel >= 800 and MyLevel <= 874 then
            Mon = "Factory Staff"
            Qdata = 2
            Qname = "Area2Quest"
            NameMon = "Factory Staff"
            PosQ = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 0, -0.999488771, 0, 1, 0, 0.999488771, 0, -0.0319722369)
            PosM = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
        elseif MyLevel >= 875 and MyLevel <= 899 then
            Mon = "Marine Lieutenant"
            Qdata = 1
            Qname = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            PosM = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif MyLevel >= 900 and MyLevel <= 949 then
            Mon = "Marine Captain"
            Qdata = 2
            Qname = "MarineQuest3"
            NameMon = "Marine Captain"
            PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            PosM = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
        elseif MyLevel >= 950 and MyLevel <= 974 then
            Mon = "Zombie"
            Qdata = 1
            Qname = "ZombieQuest"
            NameMon = "Zombie"
            PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            PosM = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
        elseif MyLevel >= 975 and MyLevel <= 999 then
            Mon = "Vampire"
            Qdata = 2
            Qname = "ZombieQuest"
            NameMon = "Vampire"
            PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            PosM = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
        elseif MyLevel >= 1000 and MyLevel <= 1049 then
            Mon = "Snow Trooper"
            Qdata = 1
            Qname = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            PosQ = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            PosM = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
        elseif MyLevel >= 1050 and MyLevel <= 1099 then
            Mon = "Winter Warrior"
            Qdata = 2
            Qname = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            PosQ = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            PosM = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
        elseif MyLevel >= 1100 and MyLevel <= 1124 then
            Mon = "Lab Subordinate"
            Qdata = 1
            Qname = "IceSideQuest"
            NameMon = "Lab Subordinate"
            PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, 0, -0.891015649, 0, 1, 0, 0.891015649, 0, 0.453972578)
            PosM = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
        elseif MyLevel >= 1125 and MyLevel <= 1174 then
            Mon = "Horned Warrior"
            Qdata = 2
            Qname = "IceSideQuest"
            NameMon = "Horned Warrior"
            PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, 0, -0.891015649, 0, 1, 0, 0.891015649, 0, 0.453972578)
            PosM = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
        elseif MyLevel >= 1175 and MyLevel <= 1199 then
            Mon = "Magma Ninja"
            Qdata = 1
            Qname = "FireSideQuest"
            NameMon = "Magma Ninja"
            PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            PosM = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
        elseif MyLevel >= 1200 and MyLevel <= 1249 then
            Mon = "Lava Pirate"
            Qdata = 2
            Qname = "FireSideQuest"
            NameMon = "Lava Pirate"
            PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            PosM = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif MyLevel >= 1250 and MyLevel <= 1274 then
            Mon = "Ship Deckhand"
            Qdata = 1
            Qname = "ShipQuest1"
            NameMon = "Ship Deckhand"
            PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016)         
            PosM = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)    
        elseif MyLevel >= 1275 and MyLevel <= 1299 then
            Mon = "Ship Engineer"
            Qdata = 2
            Qname = "ShipQuest1"
            NameMon = "Ship Engineer"
            PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016)   
            PosM = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)                
        elseif MyLevel >= 1300 and MyLevel <= 1324 then
            Mon = "Ship Steward"
            Qdata = 1
            Qname = "ShipQuest2"
            NameMon = "Ship Steward"
            PosQ = CFrame.new(968.80957, 125.092171, 33244.125)         
            PosM = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)      
        elseif MyLevel >= 1325 and MyLevel <= 1349 then
            Mon = "Ship Officer"
            Qdata = 2
            Qname = "ShipQuest2"
            NameMon = "Ship Officer"
            PosQ = CFrame.new(968.80957, 125.092171, 33244.125)
            PosM = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
        elseif MyLevel >= 1350 and MyLevel <= 1374 then
            Mon = "Arctic Warrior"
            Qdata = 1
            Qname = "FrostQuest"
            NameMon = "Arctic Warrior"
            PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            PosM = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
        elseif MyLevel >= 1375 and MyLevel <= 1424 then
            Mon = "Snow Lurker"
            Qdata = 2
            Qname = "FrostQuest"
            NameMon = "Snow Lurker"
            PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            PosM = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
        elseif MyLevel >= 1425 and MyLevel <= 1449 then
            Mon = "Sea Soldier"
            Qdata = 1
            Qname = "ForgottenQuest"
            NameMon = "Sea Soldier"
            PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, 0, -0.13915664, 0, 1, 0, 0.13915664, 0, 0.990270376)
            PosM = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        elseif MyLevel >= 1450 and MyLevel <= 1499 then
            Mon = "Water Fighter"
            Qdata = 2
            Qname = "ForgottenQuest"
            NameMon = "Water Fighter"
            PosQ = CFrame.new(-3054, 240, -10146)
            PosM = CFrame.new(-3291, 252, -10501)
        end
    elseif World3 then
    if MyLevel >= 1500 and MyLevel <= 1524 then
        Mon = "Pirate Millionaire"
        Qdata = 1
        Qname = "PiratePortQuest"
        NameMon = "Pirate Millionaire"
        PosQ = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        PosM = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
    elseif MyLevel >= 1525 and MyLevel <= 1574 then
        Mon = "Pistol Billionaire"
        Qdata = 2
        Qname = "PiratePortQuest"
        NameMon = "Pistol Billionaire"
        PosQ = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        PosM = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
    elseif MyLevel >= 1575 and MyLevel <= 1599 then
        Mon = "Dragon Crew Warrior"
        Qdata = 1
        Qname = "DragonCrewQuest"
        NameMon = "Dragon Crew Warrior"
        PosQ = CFrame.new(6738.96142578125, 127.81645965576172, -713.511474609375)
        PosM = CFrame.new(6920.71435546875, 56.15597152709961, -942.5044555664062)
    elseif MyLevel >= 1600 and MyLevel <= 1624 then
        Mon = "Dragon Crew Archer"
        Qdata = 2
        Qname = "DragonCrewQuest"
        NameMon = "Dragon Crew Archer"
        PosQ = CFrame.new(6738.96142578125, 127.81645965576172, -713.511474609375)
        PosM = CFrame.new(6817.91259765625, 484.804443359375, 513.4141235351562)
    elseif MyLevel >= 1625 and MyLevel <= 1649 then
        Mon = "Hydra Enforcer"
        Qdata = 1
        Qname = "VenomCrewQuest"
        NameMon = "Hydra Enforcer"
        PosQ = CFrame.new(5213.8740234375, 1004.5042724609375, 758.6944580078125)
        PosM = CFrame.new(4584.69287109375, 1002.6435546875, 705.7958984375)
    elseif MyLevel >= 1650 and MyLevel <= 1699 then 
        Mon = "Venomous Assailant"
        Qdata = 2
        Qname = "VenomCrewQuest"
        NameMon = "Venomous Assailant"
        PosQ = CFrame.new(5213.8740234375, 1004.5042724609375, 758.6944580078125)
        PosM = CFrame.new(4638.78564453125, 1078.94091796875, 881.8002319335938)        
    elseif MyLevel >= 1700 and MyLevel <= 1724 then
        Mon = "Marine Commodore"
        Qdata = 1
        Qname = "MarineTreeIsland"
        NameMon = "Marine Commodore"
        PosQ = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
        PosM = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
    elseif MyLevel >= 1725 and MyLevel <= 1774 then
        Mon = "Marine Rear Admiral"
        Qdata = 2
        Qname = "MarineTreeIsland"
        NameMon = "Marine Rear Admiral"
        PosQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
        PosM = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
    elseif MyLevel >= 1775 and MyLevel <= 1799 then
        Mon = "Fishman Raider"
        Qdata = 2
        Qname = "DeepForestIsland3"
        NameMon = "Fishman Raider"
        PosQ = CFrame.new(3142.67822, 108.42981, 7482.37988, 0.34205412, 0, 0.939680243, 0, 1, 0, -0.939680243, 0, 0.34205412)
        PosM = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
    elseif MyLevel >= 1800 and MyLevel <= 1824 then
        Mon = "Fishman Captain"
        Qdata = 1
        Qname = "DeepForestIsland3"
        NameMon = "Fishman Captain"
        PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
        PosM = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
    elseif MyLevel >= 1825 and MyLevel <= 1849 then
        Mon = "Forest Pirate"
        Qdata = 2
        Qname = "DeepForestIsland"
        NameMon = "Forest Pirate"
        PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
        PosM = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
    elseif MyLevel >= 1850 and MyLevel <= 1899 then
        Mon = "Forest Pirate"
        Qdata = 1
        Qname = "DeepForestIsland"
        NameMon = "Forest Pirate"
        PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
        PosM = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
    elseif MyLevel >= 1900 and MyLevel <= 1924 then
        Mon = "Jungle Pirate"
        Qdata = 2
        Qname = "DeepForestIsland"
        NameMon = "Jungle Pirate"
        PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        PosM = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
    elseif MyLevel >= 1925 and MyLevel <= 1974 then
        Mon = "Musketeer Pirate"
        Qdata = 2
        Qname = "DeepForestIsland2"
        NameMon = "Musketeer Pirate"
        PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        PosM = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
    elseif MyLevel >= 1975 and MyLevel <= 1999 then
        Mon = "Reborn Skeleton"
        Qdata = 1
        Qname = "HauntedQuest1"
        NameMon = "Reborn Skeleton"
        PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        PosM = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
    elseif MyLevel >= 2000 and MyLevel <= 2024 then
        Mon = "Living Zombie"
        Qdata = 2
        Qname = "HauntedQuest1"
        NameMon = "Living Zombie"
        PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        PosM = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
    elseif MyLevel >= 2025 and MyLevel <= 2049 then
        Mon = "Demonic Soul"
        Qdata = 1
        Qname = "HauntedQuest2"
        NameMon = "Demonic Soul"
        PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
        PosM = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
    elseif MyLevel >= 2050 and MyLevel <= 2074 then
        Mon = "Posessed Mummy"
        Qdata = 2
        Qname = "HauntedQuest2"
        NameMon = "Posessed Mummy"
        PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        PosM = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
    elseif MyLevel >= 2075 and MyLevel <= 2099 then
        Mon = "Peanut Scout"
        Qdata = 1
        Qname = "NutsIslandQuest"
        NameMon = "Peanut Scout"
        PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        PosM = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
    elseif MyLevel >= 2100 and MyLevel <= 2124 then
        Mon = "Peanut President"
        Qdata = 1
        Qname = "NutsIslandQuest"
        NameMon = "Peanut President"
        PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        PosM = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
    elseif MyLevel >= 2125 and MyLevel <= 2149 then
        Mon = "Ice Cream Chef"
        Qdata = 1
        Qname = "IceCreamIslandQuest"
        NameMon = "Ice Cream Chef"
        PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        PosM = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
    elseif MyLevel >= 2150 and MyLevel <= 2199 then
        Mon = "Ice Cream Commander"
        Qdata = 2
        Qname = "IceCreamIslandQuest"
        NameMon = "Ice Cream Commander"
        PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        PosM = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
    elseif MyLevel >= 2200 and MyLevel <= 2224 then
        Mon = "Cookie Crafter"
        Qdata = 1
        Qname = "CakeQuest1"
        NameMon = "Cookie Crafter"
        PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
        PosM = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
    elseif MyLevel >= 2225 and MyLevel <= 2249 then
        Mon = "Cake Guard"
        Qdata = 2
        Qname = "CakeQuest1"
        NameMon = "Cake Guard"
        PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
        PosM = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
    elseif MyLevel >= 2250 and MyLevel <= 2274 then
        Mon = "Baking Staff"
        Qdata = 1
        Qname = "CakeQuest2"
        NameMon = "Baking Staff"
        PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
        PosM = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
    elseif MyLevel >= 2275 and MyLevel <= 2299 then
        Mon = "Head Baker"
        Qdata = 2
        Qname = "CakeQuest2"
        NameMon = "Head Baker"
        PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
        PosM = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
    elseif MyLevel >= 2300 and MyLevel <= 2324 then
        Mon = "Cocoa Warrior"
        Qdata = 1
        Qname = "ChocQuest1"
        NameMon = "Cocoa Warrior"
        PosQ = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
        PosM = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
    elseif MyLevel >= 2325 and MyLevel <= 2349 then
        Mon = "Chocolate Bar Battler"
        Qdata = 2
        Qname = "ChocQuest1"
        NameMon = "Chocolate Bar Battler"
        PosQ = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
        PosM = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
    elseif MyLevel >= 2350 and MyLevel <= 2374 then
        Mon = "Sweet Thief"
        Qdata = 1
        Qname = "ChocQuest2"
        NameMon = "Sweet Thief"
        PosQ = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
        PosM = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
    elseif MyLevel >= 2375 and MyLevel <= 2399 then
        Mon = "Candy Rebel"
        Qdata = 2
        Qname = "ChocQuest2"
        NameMon = "Candy Rebel"
        PosQ = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
        PosM = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
    elseif MyLevel >= 2400 and MyLevel <= 2424 then
        Mon = "Candy Pirate"
        Qdata = 1
        Qname = "CandyQuest1"
        NameMon = "Candy Pirate"
        PosQ = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
        PosM = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
     elseif MyLevel >= 2425 and MyLevel <= 2449 then
        Mon = "Snow Demon"
        Qdata = 2
        Qname = "CandyQuest1"
        NameMon = "Snow Demon"
        PosQ = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
        PosM = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)            
     elseif MyLevel >= 2450 and MyLevel <= 2474 then
        Mon = "Isle Outlaw"
        Qdata = 1
        Qname = "TikiQuest1"
        NameMon = "Isle Outlaw"
        PosQ = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
        PosM = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
    elseif MyLevel >= 2475 and MyLevel <= 2524 then
        Mon = "Island Boy"
        Qdata = 2
        Qname = "TikiQuest1"
        NameMon = "Island Boy"
        PosQ = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
        PosM = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562)
    elseif MyLevel >= 2525 and MyLevel <= 2550 then
        Mon = "Isle Champion"
        Qdata = 1
        Qname = "TikiQuest2"
        NameMon = "Isle Champion"
        PosQ = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
        PosM = CFrame.new(-16641.6796875, 235.7825469970703, 1031.282958984375)
    elseif MyLevel >= 2575 and MyLevel <= 2599 then
        Mon = "Skull Slayer"
        Qdata = 2
        Qname = "TikiQuest3"
        NameMon = "Skull Slayer"
        PosQ = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
        PosM = CFrame.new(-16887.7305, 113.074638, 1629.97778, -0.559032857, 1.2313353e-08, -0.829145491, 1.05618814e-09, 1, 1.41385428e-08, 0.829145491, 7.02817626e-09, -0.559032857)           
    elseif MyLevel >= 2600 and MyLevel <= 2624 then
        Mon = "Reef Bandit"
        Qdata = 1
        Qname = "SubmergedQuest1"
        NameMon = "Reef Bandit"
        PosQ = CFrame.new(10778.875, -2087.72437, 9265.18359, 0.934615612, -9.33109447e-08, -0.355659455, 9.17655143e-08, 1, -2.12154276e-08, 0.355659455, -1.28090019e-08, 0.934615612)
        PosM = CFrame.new(11019.1318, -2146.06812, 9342.3916, -0.719955266, -1.74275385e-08, 0.69402045, 5.76556367e-08, 1, 8.49211546e-08, -0.69402045, 1.01153624e-07, -0.719955266)
    elseif MyLevel >= 2625 and MyLevel <= 2649 then
        Mon = "Coral Pirate"
        Qdata = 2
        Qname = "SubmergedQuest1"
        NameMon = "Coral Pirate"
        PosQ = CFrame.new(10778.875, -2087.72437, 9265.18359, 0.934615612, -9.33109447e-08, -0.355659455, 9.17655143e-08, 1, -2.12154276e-08, 0.355659455, -1.28090019e-08, 0.934615612)
        PosM = CFrame.new(10808.6006, -2030.36145, 9364.2334, -0.775185347, -0.0359364748, 0.6307109, 0.0615428537, 0.989336014, 0.132010356, -0.628728986, 0.141148239, -0.764707148)
    elseif MyLevel >= 2650 and MyLevel <= 2674 then
        Mon = "Sea Chanter"
        Qdata = 1
        Qname = "SubmergedQuest2"
        NameMon = "Sea Chanter"
        PosQ = CFrame.new(10880.6855, -2086.20044, 10032.624, -0.321384728, 9.87648434e-08, -0.946948707, 7.13271007e-08, 1, 8.00902953e-08, 0.946948707, -4.18033075e-08, -0.321384728)
        PosM = CFrame.new(10671.2715, -2057.59155, 10047.2588, -0.846484065, -3.11045447e-08, 0.532414079, -5.55383117e-08, 1, -2.98785316e-08, -0.532414079, -5.48610757e-08, -0.846484065)
    elseif MyLevel >= 2675 and MyLevel <= 2699 then
        Mon = "Ocean Prophet"
        Qdata = 2
        Qname = "SubmergedQuest2"
        NameMon = "Ocean Prophet"
        PosQ = CFrame.new(10880.6855, -2086.20044, 10032.624, -0.321384728, 9.87648434e-08, -0.946948707, 7.13271007e-08, 1, 8.00902953e-08, 0.946948707, -4.18033075e-08, -0.321384728)
        PosM = CFrame.new(11008.5195, -2007.72839, 10223.0791, -0.688615739, 2.33523378e-09, -0.725126445, 2.99292546e-09, 1, 3.78221315e-10, 0.725126445, -1.90980032e-09, -0.688615739)
    elseif MyLevel >= 2700 and MyLevel <= 2724 then
        Mon = "High Disciple"
        Qdata = 1
        Qname = "SubmergedQuest3"
        NameMon = "High Disciple"
        PosQ = CFrame.new(9640.08789, -1992.44507, 9613.65234, -0.957327187, 4.11991223e-08, 0.289006323, 1.5775445e-08, 1, -9.02985846e-08, -0.289006323, -8.18860855e-08, -0.957327187)
        PosM = CFrame.new(9750.41602, -1966.93884, 9753.36035, -0.749824047, 5.57797613e-08, -0.661637306, 2.03500754e-08, 1, 6.1243199e-08, 0.661637306, 3.24572511e-08, -0.749824047)
    elseif MyLevel >= 2725 then
        Mon = "Grand Devotee"
        Qdata = 2
        Qname = "SubmergedQuest3"
        NameMon = "Grand Devotee"
        PosQ = CFrame.new(9640.08789, -1992.44507, 9613.65234, -0.957327187, 4.11991223e-08, 0.289006323, 1.5775445e-08, 1, -9.02985846e-08, -0.289006323, -8.18860855e-08, -0.957327187)
        PosM = CFrame.new(9611.70508, -1993.47119, 9882.68848, -0.591375351, 4.14332426e-08, -0.806396425, 4.73774868e-08, 1, 1.66361875e-08, 0.806396425, -2.83668058e-08, -0.591375351)
        
end end end




MaterialMon=function()local a=game.Players.LocalPlayer;local b=a.Character and a.Character:FindFirstChild("HumanoidRootPart")if not b then return end;shouldRequestEntrance=function(c,d)local e=(b.Position-c).Magnitude;if e>=d then replicated.Remotes.CommF_:InvokeServer("requestEntrance",c)end end;if World1 then if SelectMaterial=="Angel Wings"then MMon={"Shanda","Royal Squad","Royal Soldier","Wysper","Thunder God"}MPos=CFrame.new(-4698,845,-1912)SP="Default"local c=Vector3.new(-4607.82275,872.54248,-1667.55688)shouldRequestEntrance(c,10000)elseif SelectMaterial=="Leather + Scrap Metal"then MMon={"Brute","Pirate"}MPos=CFrame.new(-1145,15,4350)SP="Default"elseif SelectMaterial=="Magma Ore"then MMon={"Military Soldier","Military Spy","Magma Admiral"}MPos=CFrame.new(-5815,84,8820)SP="Default"elseif SelectMaterial=="Fish Tail"then MMon={"Fishman Warrior","Fishman Commando","Fishman Lord"}MPos=CFrame.new(61123,19,1569)SP="Default"local c=Vector3.new(61163.8515625,5.342342376708984,1819.7841796875)shouldRequestEntrance(c,17000)end elseif World2 then if SelectMaterial=="Leather + Scrap Metal"then MMon={"Marine Captain"}MPos=CFrame.new(-2010.5059814453125,73.00115966796875,-3326.620849609375)SP="Default"elseif SelectMaterial=="Magma Ore"then MMon={"Magma Ninja","Lava Pirate"}MPos=CFrame.new(-5428,78,-5959)SP="Default"elseif SelectMaterial=="Ectoplasm"then MMon={"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer"}MPos=CFrame.new(911.35827636719,125.95812988281,33159.5390625)SP="Default"local c=Vector3.new(61163.8515625,5.342342376708984,1819.7841796875)shouldRequestEntrance(c,18000)elseif SelectMaterial=="Mystic Droplet"then MMon={"Water Fighter"}MPos=CFrame.new(-3385,239,-10542)SP="Default"elseif SelectMaterial=="Radioactive Material"then MMon={"Factory Staff"}MPos=CFrame.new(295,73,-56)SP="Default"elseif SelectMaterial=="Vampire Fang"then MMon={"Vampire"}MPos=CFrame.new(-6033,7,-1317)SP="Default"end elseif World3 then if SelectMaterial=="Scrap Metal"then MMon={"Jungle Pirate","Forest Pirate"}MPos=CFrame.new(-11975.78515625,331.7734069824219,-10620.0302734375)SP="Default"elseif SelectMaterial=="Fish Tail"then MMon={"Fishman Raider","Fishman Captain"}MPos=CFrame.new(-10993,332,-8940)SP="Default"elseif SelectMaterial=="Conjured Cocoa"then MMon={"Chocolate Bar Battler","Cocoa Warrior"}MPos=CFrame.new(620.6344604492188,78.93644714355469,-12581.369140625)SP="Default"elseif SelectMaterial=="Dragon Scale"then MMon={"Dragon Crew Archer","Dragon Crew Warrior"}MPos=CFrame.new(6594,383,139)SP="Default"elseif SelectMaterial=="Gunpowder"then MMon={"Pistol Billionaire"}MPos=CFrame.new(-84.8556900024414, 85.62061309814453, 6132.0087890625)SP="Default"elseif SelectMaterial=="Mini Tusk"then MMon={"Mythological Pirate"}MPos=CFrame.new(-13545,470,-6917)SP="Default"elseif SelectMaterial=="Demonic Wisp"then MMon={"Demonic Soul"}MPos=CFrame.new(-9495.6806640625,453.58624267578125,5977.3486328125)SP="Default"end end end

QuestNeta = function()

  local Neta = QuestCheck()

  return {

    [1] = Mon,

    [2] = Qdata,

    [3] = Qname,

    [4] = PosM,

    [5] = NameMon,

    [6] = PosQ

  }

end

task.wait(1)

local Fluent, SaveManager, InterfaceManager
do
    local ok, a, b, c = pcall(function()
        local __fluent_loader = function()
--[[
	Credit:
	Original Fluent : https://github.com/dawid-scripts/Fluent
	Themes : https://github.com/ActualMasterOogway/Fluent-Renewed/
]]

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local httpService = game:GetService("HttpService")

local RenderStepped = RunService.RenderStepped

local ProtectGui = protectgui or (syn and syn.protect_gui) or function() end

local Themes = {
	Names = {
		"Midnight Blue",
		"Amethyst Maru",
		"Crimson Dark",
		"Ember",
		"Neon Crimson",
		"Neon Orange",
		"Dark Typewriter",
		"VSC Dark High Contrast",
		"Dark",
		"Darker",
		"Light",
		"Aqua",
		"Amethyst",
		"Amethyst Dark",
		"Rose",
		"Sakura"
	},

	["VSC Dark High Contrast"] = {
		Accent = Color3.fromHex("#569cd6"),

		AcrylicMain = Color3.fromHex("#000000"),
		AcrylicBorder = Color3.fromHex("#FFFFFF"),
		AcrylicGradient = ColorSequence.new(Color3.fromHex("#000000"), Color3.fromHex("#000000")),
		AcrylicNoise = 1,

		TitleBarLine = Color3.fromHex("#FFFFFF"),
		Tab = Color3.fromHex("#FFFFFF"),

		Element = Color3.fromHex("#000000"),
		ElementBorder = Color3.fromHex("#FFFFFF"),
		InElementBorder = Color3.fromHex("#569cd6"),
		ElementTransparency = 0,

		ToggleSlider = Color3.fromHex("#569cd6"),
		ToggleToggled = Color3.fromHex("#569cd6"),

		SliderRail = Color3.fromHex("#569cd6"),

		DropdownFrame = Color3.fromHex("#000000"),
		DropdownHolder = Color3.fromHex("#000000"),
		DropdownBorder = Color3.fromHex("#FFFFFF"),
		DropdownOption = Color3.fromHex("#FFFFFF"),

		Keybind = Color3.fromHex("#000000"),

		Input = Color3.fromHex("#000000"),
		InputFocused = Color3.fromHex("#000000"),
		InputIndicator = Color3.fromHex("#7c7c7c"),

		Dialog = Color3.fromHex("#000000"),
		DialogHolder = Color3.fromHex("#000000"),
		DialogHolderLine = Color3.fromHex("#FFFFFF"),
		DialogButton = Color3.fromHex("#000000"),
		SearchTabColor = Color3.fromHex("#000000"),
		DialogButtonBorder = Color3.fromHex("#FFFFFF"),
		DialogBorder = Color3.fromHex("#FFFFFF"),
		DialogInput = Color3.fromHex("#000000"),
		DialogInputLine = Color3.fromHex("#569cd6"),

		Text = Color3.fromHex("#FFFFFF"),
		SubText = Color3.fromHex("#9D9D9D"),
		Hover = Color3.fromHex("#383a49"),
		HoverChange = 0.1
	},

	["Dark Typewriter"] = {
		Accent = Color3.fromRGB(109, 180, 120),

		AcrylicMain = Color3.fromRGB(38, 38, 38),
		AcrylicBorder = Color3.fromRGB(85, 85, 85),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(38, 38, 38), Color3.fromRGB(38, 38, 38)),
		AcrylicNoise = 1,

		TitleBarLine = Color3.fromRGB(189, 189, 189),
		Tab = Color3.fromRGB(109, 180, 120),

		Element = Color3.fromRGB(42, 42, 42),
		ElementBorder = Color3.fromRGB(51, 51, 51),
		InElementBorder = Color3.fromRGB(51, 51, 51),
		ElementTransparency = 0,

		ToggleSlider = Color3.fromRGB(103, 169, 113),
		ToggleToggled = Color3.fromRGB(109, 180, 120),

		SliderRail = Color3.fromRGB(51, 51, 51),

		DropdownFrame = Color3.fromRGB(38, 38, 46),
		DropdownHolder = Color3.fromRGB(32, 32, 40),
		DropdownBorder = Color3.fromRGB(70, 70, 85),
		DropdownOption = Color3.fromRGB(153, 200, 255),

		Keybind = Color3.fromRGB(54, 54, 54),

		Input = Color3.fromRGB(27, 27, 27),
		InputFocused = Color3.fromRGB(51, 51, 51),
		InputIndicator = Color3.fromRGB(197, 184, 161),

		Dialog = Color3.fromRGB(38, 38, 38),
		DialogHolder = Color3.fromRGB(58, 52, 46),
		DialogHolderLine = Color3.fromRGB(40, 40, 40),
		DialogButton = Color3.fromRGB(42, 42, 42),
		SearchTabColor = Color3.fromRGB(42, 42, 42),
		DialogButtonBorder = Color3.fromRGB(51, 51, 51),
		DialogBorder = Color3.fromRGB(189, 189, 189),
		DialogInput = Color3.fromRGB(27, 27, 27),
		DialogInputLine = Color3.fromRGB(197, 184, 161),

		Text = Color3.fromRGB(197, 184, 161),
		SubText = Color3.fromRGB(158, 158, 158),
		Hover = Color3.fromRGB(149, 149, 149),
		HoverChange = 0.04
	},

	["Midnight Blue"] = {
		Name = "Midnight Blue",
		Accent = Color3.fromRGB(100, 180, 220),

		AcrylicMain = Color3.fromRGB(18, 18, 22),
		AcrylicBorder = Color3.fromRGB(45, 45, 52),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(22, 22, 26), Color3.fromRGB(22, 22, 26)),
		AcrylicNoise = 0.94,

		TitleBarLine = Color3.fromRGB(45, 45, 52),
		Tab = Color3.fromRGB(130, 130, 140),

		Element = Color3.fromRGB(38, 38, 46),
		ElementBorder = Color3.fromRGB(55, 55, 65),
		InElementBorder = Color3.fromRGB(75, 75, 88),
		ElementTransparency = 0.1,

		ToggleSlider = Color3.fromRGB(100, 180, 220),
		ToggleToggled = Color3.fromRGB(100, 180, 220),

		SliderRail = Color3.fromRGB(55, 55, 65),

		DropdownFrame = Color3.fromRGB(32, 32, 38),
		DropdownHolder = Color3.fromRGB(28, 28, 34),
		DropdownBorder = Color3.fromRGB(45, 45, 52),
		DropdownOption = Color3.fromRGB(150, 150, 160),

		Keybind = Color3.fromRGB(32, 32, 38),

		Input = Color3.fromRGB(26, 26, 32),
		InputFocused = Color3.fromRGB(32, 32, 40),
		InputIndicator = Color3.fromRGB(100, 180, 220),
		InputIndicatorFocus = Color3.fromRGB(100, 180, 220),

		Dialog = Color3.fromRGB(32, 32, 38),
		DialogHolder = Color3.fromRGB(26, 26, 32),
		DialogHolderLine = Color3.fromRGB(45, 45, 52),
		DialogButton = Color3.fromRGB(32, 32, 38),
		SearchTabColor = Color3.fromRGB(32, 32, 38),
		DialogButtonBorder = Color3.fromRGB(45, 45, 52),
		DialogBorder = Color3.fromRGB(45, 45, 52),
		DialogInput = Color3.fromRGB(26, 26, 32),
		DialogInputLine = Color3.fromRGB(100, 180, 220),

		Text = Color3.fromRGB(195, 195, 205),
		SubText = Color3.fromRGB(125, 125, 135),
		Hover = Color3.fromRGB(45, 45, 55),
		HoverChange = 0.04,
	},

	["Amethyst Maru"] = {
		Name = "Amethyst Maru",
		Accent = Color3.fromHex("#1e6dbf"),

		AcrylicMain = Color3.fromHex("#001a33"),
		AcrylicBorder = Color3.fromHex("#004080"),
		AcrylicGradient = ColorSequence.new(Color3.fromHex("#001a33"), Color3.fromHex("#001a33")),
		AcrylicNoise = 0.92,

		TitleBarLine = Color3.fromHex("#004080"),
		Tab = Color3.fromHex("#a1c4e6"),

		Element = Color3.fromHex("#00264d"),
		ElementBorder = Color3.fromHex("#004080"),
		InElementBorder = Color3.fromHex("#1e6dbf"),
		ElementTransparency = 0.85,

		ToggleSlider = Color3.fromHex("#0055a3"),
		ToggleToggled = Color3.fromHex("#1e6dbf"),

		SliderRail = Color3.fromHex("#0055a3"),

		DropdownFrame = Color3.fromHex("#00264d"),
		DropdownHolder = Color3.fromHex("#00264d"),
		DropdownBorder = Color3.fromHex("#004080"),
		DropdownOption = Color3.fromHex("#a1c4e6"),

		Keybind = Color3.fromHex("#00264d"),

		Input = Color3.fromHex("#001933"),
		InputFocused = Color3.fromHex("#001933"),
		InputIndicator = Color3.fromHex("#7fa1bf"),

		Dialog = Color3.fromHex("#00264d"),
		DialogHolder = Color3.fromHex("#001a33"),
		DialogHolderLine = Color3.fromHex("#004080"),
		DialogButton = Color3.fromHex("#00264d"),
		SearchTabColor = Color3.fromHex("#00264d"),
		DialogButtonBorder = Color3.fromHex("#004080"),
		DialogBorder = Color3.fromHex("#004080"),
		DialogInput = Color3.fromHex("#001933"),
		DialogInputLine = Color3.fromHex("#1e6dbf"),

		Text = Color3.fromHex("#a1c4e6"),
		SubText = Color3.fromHex("#7fa1bf"),
		Hover = Color3.fromHex("#004080"),
		HoverChange = 0.1
	},

	["Amethyst Dark"] = {
		Name = "Amethyst Dark",
		Accent = Color3.fromHex("#b133ff"),

		AcrylicMain = Color3.fromHex("#120024"),
		AcrylicBorder = Color3.fromHex("#4d057b"),
		AcrylicGradient = ColorSequence.new(Color3.fromHex("#120024"), Color3.fromHex("#120024")),
		AcrylicNoise = 0.92,

		TitleBarLine = Color3.fromHex("#4d057b"),
		Tab = Color3.fromHex("#e9d9f2"),

		Element = Color3.fromHex("#25013c"),
		ElementBorder = Color3.fromHex("#4d057b"),
		InElementBorder = Color3.fromHex("#b133ff"),
		ElementTransparency = 0.85,

		ToggleSlider = Color3.fromHex("#7d16bf"),
		ToggleToggled = Color3.fromHex("#b133ff"),

		SliderRail = Color3.fromHex("#7d16bf"),

		DropdownFrame = Color3.fromHex("#25013c"),
		DropdownHolder = Color3.fromHex("#25013c"),
		DropdownBorder = Color3.fromHex("#4d057b"),
		DropdownOption = Color3.fromHex("#e9d9f2"),

		Keybind = Color3.fromHex("#25013c"),

		Input = Color3.fromHex("#180030"),
		InputFocused = Color3.fromHex("#180030"),
		InputIndicator = Color3.fromHex("#9e85ad"),

		Dialog = Color3.fromHex("#25013c"),
		DialogHolder = Color3.fromHex("#120024"),
		DialogHolderLine = Color3.fromHex("#4d057b"),
		DialogButton = Color3.fromHex("#25013c"),
		SearchTabColor = Color3.fromHex("#25013c"),
		DialogButtonBorder = Color3.fromHex("#4d057b"),
		DialogBorder = Color3.fromHex("#4d057b"),
		DialogInput = Color3.fromHex("#180030"),
		DialogInputLine = Color3.fromHex("#b133ff"),

		Text = Color3.fromHex("#e9d9f2"),
		SubText = Color3.fromHex("#9e85ad"),
		Hover = Color3.fromHex("#4d057b"),
		HoverChange = 0.1
	},

	["Crimson Dark"] = {
		Name = "Crimson Dark",
		Accent = Color3.fromHex("#ff3333"),

		AcrylicMain = Color3.fromHex("#240000"),
		AcrylicBorder = Color3.fromHex("#7b0505"),
		AcrylicGradient = ColorSequence.new(Color3.fromHex("#240000"), Color3.fromHex("#240000")),
		AcrylicNoise = 0.92,

		TitleBarLine = Color3.fromHex("#7b0505"),
		Tab = Color3.fromHex("#f2d9d9"),

		Element = Color3.fromHex("#3c0101"),
		ElementBorder = Color3.fromHex("#7b0505"),
		InElementBorder = Color3.fromHex("#ff3333"),
		ElementTransparency = 0.85,

		ToggleSlider = Color3.fromHex("#bf1616"),
		ToggleToggled = Color3.fromHex("#ff3333"),

		SliderRail = Color3.fromHex("#bf1616"),

		DropdownFrame = Color3.fromHex("#3c0101"),
		DropdownHolder = Color3.fromHex("#3c0101"),
		DropdownBorder = Color3.fromHex("#7b0505"),
		DropdownOption = Color3.fromHex("#f2d9d9"),

		Keybind = Color3.fromHex("#3c0101"),

		Input = Color3.fromHex("#300000"),
		InputFocused = Color3.fromHex("#300000"),
		InputIndicator = Color3.fromHex("#ad8585"),

		Dialog = Color3.fromHex("#3c0101"),
		DialogHolder = Color3.fromHex("#240000"),
		DialogHolderLine = Color3.fromHex("#7b0505"),
		DialogButton = Color3.fromHex("#3c0101"),
		SearchTabColor = Color3.fromHex("#3c0101"),
		DialogButtonBorder = Color3.fromHex("#7b0505"),
		DialogBorder = Color3.fromHex("#7b0505"),
		DialogInput = Color3.fromHex("#300000"),
		DialogInputLine = Color3.fromHex("#ff3333"),

		Text = Color3.fromHex("#f2d9d9"),
		SubText = Color3.fromHex("#ad8585"),
		Hover = Color3.fromHex("#7b0505"),
		HoverChange = 0.1
	},

	["Neon Crimson"] = {
		Name = "Neon Crimson",
		Accent = Color3.fromHex("#ff0055"),

		AcrylicMain = Color3.fromHex("#0a0005"),
		AcrylicBorder = Color3.fromHex("#910027"),
		AcrylicGradient = ColorSequence.new(Color3.fromHex("#0a0005"), Color3.fromHex("#0a0005")),
		AcrylicNoise = 0.92,

		TitleBarLine = Color3.fromHex("#910027"),
		Tab = Color3.fromHex("#ffccd9"),

		Element = Color3.fromHex("#220007"),
		ElementBorder = Color3.fromHex("#910027"),
		InElementBorder = Color3.fromHex("#ff0055"),
		ElementTransparency = 0.85,

		ToggleSlider = Color3.fromHex("#d40040"),
		ToggleToggled = Color3.fromHex("#ff0055"),

		SliderRail = Color3.fromHex("#d40040"),

		DropdownFrame = Color3.fromHex("#220007"),
		DropdownHolder = Color3.fromHex("#220007"),
		DropdownBorder = Color3.fromHex("#910027"),
		DropdownOption = Color3.fromHex("#ffccd9"),

		Keybind = Color3.fromHex("#220007"),

		Input = Color3.fromHex("#140005"),
		InputFocused = Color3.fromHex("#140005"),
		InputIndicator = Color3.fromHex("#ff8099"),

		Dialog = Color3.fromHex("#220007"),
		DialogHolder = Color3.fromHex("#0a0005"),
		DialogHolderLine = Color3.fromHex("#910027"),
		DialogButton = Color3.fromHex("#220007"),
		SearchTabColor = Color3.fromHex("#220007"),
		DialogButtonBorder = Color3.fromHex("#910027"),
		DialogBorder = Color3.fromHex("#910027"),
		DialogInput = Color3.fromHex("#140005"),
		DialogInputLine = Color3.fromHex("#ff0055"),

		Text = Color3.fromHex("#ffccd9"),
		SubText = Color3.fromHex("#ff8099"),
		Hover = Color3.fromHex("#910027"),
		HoverChange = 0.1
	},

	["Neon Orange"] = {
		Name = "Neon Orange",
		Accent = Color3.fromHex("#ff6a00"),

		AcrylicMain = Color3.fromHex("#0a0500"),
		AcrylicBorder = Color3.fromHex("#913200"),
		AcrylicGradient = ColorSequence.new(Color3.fromHex("#0a0500"), Color3.fromHex("#0a0500")),
		AcrylicNoise = 0.92,

		TitleBarLine = Color3.fromHex("#913200"),
		Tab = Color3.fromHex("#ffd9cc"),

		Element = Color3.fromHex("#220e00"),
		ElementBorder = Color3.fromHex("#913200"),
		InElementBorder = Color3.fromHex("#ff6a00"),
		ElementTransparency = 0.85,

		ToggleSlider = Color3.fromHex("#d45500"),
		ToggleToggled = Color3.fromHex("#ff6a00"),

		SliderRail = Color3.fromHex("#d45500"),

		DropdownFrame = Color3.fromHex("#220e00"),
		DropdownHolder = Color3.fromHex("#220e00"),
		DropdownBorder = Color3.fromHex("#913200"),
		DropdownOption = Color3.fromHex("#ffd9cc"),

		Keybind = Color3.fromHex("#220e00"),

		Input = Color3.fromHex("#140800"),
		InputFocused = Color3.fromHex("#140800"),
		InputIndicator = Color3.fromHex("#ffa280"),

		Dialog = Color3.fromHex("#220e00"),
		DialogHolder = Color3.fromHex("#0a0500"),
		DialogHolderLine = Color3.fromHex("#913200"),
		DialogButton = Color3.fromHex("#220e00"),
		SearchTabColor = Color3.fromHex("#220e00"),
		DialogButtonBorder = Color3.fromHex("#913200"),
		DialogBorder = Color3.fromHex("#913200"),
		DialogInput = Color3.fromHex("#140800"),
		DialogInputLine = Color3.fromHex("#ff6a00"),

		Text = Color3.fromHex("#ffd9cc"),
		SubText = Color3.fromHex("#ffa280"),
		Hover = Color3.fromHex("#913200"),
		HoverChange = 0.1
	},

	Ember = {
		Name = "Ember",
		Accent = Color3.fromRGB(217, 87, 0),

		AcrylicMain = Color3.fromRGB(20, 20, 20),
		AcrylicBorder = Color3.fromRGB(130, 100, 70),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(180, 100, 40), Color3.fromRGB(90, 40, 15)),
		AcrylicNoise = 0.92,

		TitleBarLine = Color3.fromRGB(120, 90, 60),
		Tab = Color3.fromRGB(180, 150, 120),

		Element = Color3.fromRGB(160, 130, 100),
		ElementBorder = Color3.fromRGB(80, 60, 40),
		InElementBorder = Color3.fromRGB(120, 100, 80),
		ElementTransparency = 0.87,

		ToggleSlider = Color3.fromRGB(160, 130, 100),
		ToggleToggled = Color3.fromRGB(217, 87, 0),

		SliderRail = Color3.fromRGB(160, 130, 100),

		DropdownFrame = Color3.fromRGB(200, 170, 140),
		DropdownHolder = Color3.fromRGB(90, 60, 30),
		DropdownBorder = Color3.fromRGB(75, 50, 25),
		DropdownOption = Color3.fromRGB(160, 130, 100),

		Keybind = Color3.fromRGB(160, 130, 100),

		Input = Color3.fromRGB(90, 60, 30),
		InputFocused = Color3.fromRGB(90, 60, 30),
		InputIndicator = Color3.fromRGB(190, 160, 130),
		InputIndicatorFocus = Color3.fromRGB(217, 87, 0),

		Dialog = Color3.fromRGB(90, 60, 30),
		DialogHolder = Color3.fromRGB(75, 45, 20),
		DialogHolderLine = Color3.fromRGB(65, 40, 15),
		DialogButton = Color3.fromRGB(90, 60, 30),
		SearchTabColor = Color3.fromRGB(90, 60, 30),
		DialogButtonBorder = Color3.fromRGB(120, 90, 60),
		DialogBorder = Color3.fromRGB(110, 80, 50),
		DialogInput = Color3.fromRGB(100, 70, 40),
		DialogInputLine = Color3.fromRGB(200, 170, 140),

		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(160, 130, 100),
		HoverChange = 0.04,
	},

	Dark = {
		Name = "Dark",
		Accent = Color3.fromRGB(96, 205, 255),

		AcrylicMain = Color3.fromRGB(60, 60, 60),
		AcrylicBorder = Color3.fromRGB(90, 90, 90),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(40, 40, 40)),
		AcrylicNoise = 0.9,

		TitleBarLine = Color3.fromRGB(75, 75, 75),
		Tab = Color3.fromRGB(120, 120, 120),

		Element = Color3.fromRGB(120, 120, 120),
		ElementBorder = Color3.fromRGB(35, 35, 35),
		InElementBorder = Color3.fromRGB(90, 90, 90),
		ElementTransparency = 0.87,

		ToggleSlider = Color3.fromRGB(120, 120, 120),
		ToggleToggled = Color3.fromRGB(96, 205, 255),

		SliderRail = Color3.fromRGB(120, 120, 120),

		DropdownFrame = Color3.fromRGB(160, 160, 160),
		DropdownHolder = Color3.fromRGB(45, 45, 45),
		DropdownBorder = Color3.fromRGB(35, 35, 35),
		DropdownOption = Color3.fromRGB(120, 120, 120),

		Keybind = Color3.fromRGB(120, 120, 120),

		Input = Color3.fromRGB(30, 30, 30),
		InputFocused = Color3.fromRGB(30, 30, 30),
		InputIndicator = Color3.fromRGB(150, 150, 150),

		Dialog = Color3.fromRGB(45, 45, 45),
		DialogHolder = Color3.fromRGB(35, 35, 35),
		DialogHolderLine = Color3.fromRGB(30, 30, 30),
		DialogButton = Color3.fromRGB(120, 120, 120),
		SearchTabColor = Color3.fromRGB(90, 90, 90),
		DialogButtonBorder = Color3.fromRGB(80, 80, 80),
		DialogBorder = Color3.fromRGB(70, 70, 70),
		DialogInput = Color3.fromRGB(55, 55, 55),
		DialogInputLine = Color3.fromRGB(160, 160, 160),

		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(120, 120, 120),
		HoverChange = 0.07,
	},

	Darker = {
		Name = "Darker",
		Accent = Color3.fromRGB(72, 138, 182),

		AcrylicMain = Color3.fromRGB(30, 30, 30),
		AcrylicBorder = Color3.fromRGB(60, 60, 60),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(25, 25, 25), Color3.fromRGB(15, 15, 15)),
		AcrylicNoise = 0.94,

		TitleBarLine = Color3.fromRGB(65, 65, 65),
		Tab = Color3.fromRGB(100, 100, 100),

		Element = Color3.fromRGB(70, 70, 70),
		ElementBorder = Color3.fromRGB(25, 25, 25),
		InElementBorder = Color3.fromRGB(55, 55, 55),
		ElementTransparency = 0.82,

		ToggleToggled = Color3.fromRGB(72, 138, 182),

		DropdownFrame = Color3.fromRGB(120, 120, 120),
		DropdownHolder = Color3.fromRGB(35, 35, 35),
		DropdownBorder = Color3.fromRGB(25, 25, 25),

		Dialog = Color3.fromRGB(35, 35, 35),
		DialogHolder = Color3.fromRGB(25, 25, 25),
		DialogHolderLine = Color3.fromRGB(20, 20, 20),
		DialogButton = Color3.fromRGB(35, 35, 35),
		SearchTabColor = Color3.fromRGB(35, 35, 35),
		DialogButtonBorder = Color3.fromRGB(55, 55, 55),
		DialogBorder = Color3.fromRGB(50, 50, 50),
		DialogInput = Color3.fromRGB(45, 45, 45),
		DialogInputLine = Color3.fromRGB(120, 120, 120),
	},

	Light = {
		Name = "Light",
		Accent = Color3.fromRGB(0, 103, 192),

		AcrylicMain = Color3.fromRGB(200, 200, 200),
		AcrylicBorder = Color3.fromRGB(120, 120, 120),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)),
		AcrylicNoise = 0.96,

		TitleBarLine = Color3.fromRGB(160, 160, 160),
		Tab = Color3.fromRGB(90, 90, 90),

		Element = Color3.fromRGB(255, 255, 255),
		ElementBorder = Color3.fromRGB(180, 180, 180),
		InElementBorder = Color3.fromRGB(150, 150, 150),
		ElementTransparency = 0.65,

		ToggleSlider = Color3.fromRGB(40, 40, 40),
		ToggleToggled = Color3.fromRGB(0, 103, 192),

		SliderRail = Color3.fromRGB(40, 40, 40),

		DropdownFrame = Color3.fromRGB(200, 200, 200),
		DropdownHolder = Color3.fromRGB(240, 240, 240),
		DropdownBorder = Color3.fromRGB(200, 200, 200),
		DropdownOption = Color3.fromRGB(150, 150, 150),

		Keybind = Color3.fromRGB(120, 120, 120),

		Input = Color3.fromRGB(200, 200, 200),
		InputFocused = Color3.fromRGB(100, 100, 100),
		InputIndicator = Color3.fromRGB(80, 80, 80),
		InputIndicatorFocus = Color3.fromRGB(0, 103, 192),

		Dialog = Color3.fromRGB(255, 255, 255),
		DialogHolder = Color3.fromRGB(240, 240, 240),
		DialogHolderLine = Color3.fromRGB(228, 228, 228),
		DialogButton = Color3.fromRGB(255, 255, 255),
		SearchTabColor = Color3.fromRGB(255, 255, 255),
		DialogButtonBorder = Color3.fromRGB(190, 190, 190),
		DialogBorder = Color3.fromRGB(140, 140, 140),
		DialogInput = Color3.fromRGB(250, 250, 250),
		DialogInputLine = Color3.fromRGB(160, 160, 160),

		Text = Color3.fromRGB(0, 0, 0),
		SubText = Color3.fromRGB(40, 40, 40),
		Hover = Color3.fromRGB(50, 50, 50),
		HoverChange = 0.16,
	},

	Aqua = {
		Name = "Aqua",
		Accent = Color3.fromRGB(60, 165, 165),

		AcrylicMain = Color3.fromRGB(20, 20, 20),
		AcrylicBorder = Color3.fromRGB(50, 100, 100),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(60, 140, 140), Color3.fromRGB(40, 80, 80)),
		AcrylicNoise = 0.92,

		TitleBarLine = Color3.fromRGB(60, 120, 120),
		Tab = Color3.fromRGB(140, 180, 180),

		Element = Color3.fromRGB(110, 160, 160),
		ElementBorder = Color3.fromRGB(40, 70, 70),
		InElementBorder = Color3.fromRGB(80, 110, 110),
		ElementTransparency = 0.84,

		ToggleSlider = Color3.fromRGB(110, 160, 160),
		ToggleToggled = Color3.fromRGB(60, 165, 165),

		SliderRail = Color3.fromRGB(110, 160, 160),

		DropdownFrame = Color3.fromRGB(160, 200, 200),
		DropdownHolder = Color3.fromRGB(40, 80, 80),
		DropdownBorder = Color3.fromRGB(40, 65, 65),
		DropdownOption = Color3.fromRGB(110, 160, 160),

		Keybind = Color3.fromRGB(110, 160, 160),

		Input = Color3.fromRGB(110, 160, 160),
		InputFocused = Color3.fromRGB(20, 10, 30),
		InputIndicator = Color3.fromRGB(130, 170, 170),
		InputIndicatorFocus = Color3.fromRGB(60, 165, 165),

		Dialog = Color3.fromRGB(40, 80, 80),
		DialogHolder = Color3.fromRGB(30, 60, 60),
		DialogHolderLine = Color3.fromRGB(25, 50, 50),
		DialogButton = Color3.fromRGB(40, 80, 80),
		SearchTabColor = Color3.fromRGB(40, 80, 80),
		DialogButtonBorder = Color3.fromRGB(80, 110, 110),
		DialogBorder = Color3.fromRGB(50, 100, 100),
		DialogInput = Color3.fromRGB(45, 90, 90),
		DialogInputLine = Color3.fromRGB(130, 170, 170),

		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(110, 160, 160),
		HoverChange = 0.04,
	},

	Amethyst = {
		Name = "Amethyst",
		Accent = Color3.fromRGB(97, 62, 167),

		AcrylicMain = Color3.fromRGB(20, 20, 20),
		AcrylicBorder = Color3.fromRGB(110, 90, 130),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(85, 57, 139), Color3.fromRGB(40, 25, 65)),
		AcrylicNoise = 0.92,

		TitleBarLine = Color3.fromRGB(95, 75, 110),
		Tab = Color3.fromRGB(160, 140, 180),

		Element = Color3.fromRGB(140, 120, 160),
		ElementBorder = Color3.fromRGB(60, 50, 70),
		InElementBorder = Color3.fromRGB(100, 90, 110),
		ElementTransparency = 0.87,

		ToggleSlider = Color3.fromRGB(140, 120, 160),
		ToggleToggled = Color3.fromRGB(97, 62, 167),

		SliderRail = Color3.fromRGB(140, 120, 160),

		DropdownFrame = Color3.fromRGB(170, 160, 200),
		DropdownHolder = Color3.fromRGB(60, 45, 80),
		DropdownBorder = Color3.fromRGB(50, 40, 65),
		DropdownOption = Color3.fromRGB(140, 120, 160),

		Keybind = Color3.fromRGB(140, 120, 160),

		Input = Color3.fromRGB(140, 120, 160),
		InputFocused = Color3.fromRGB(20, 10, 30),
		InputIndicator = Color3.fromRGB(170, 150, 190),
		InputIndicatorFocus = Color3.fromRGB(97, 62, 167),

		Dialog = Color3.fromRGB(60, 45, 80),
		DialogHolder = Color3.fromRGB(45, 30, 65),
		DialogHolderLine = Color3.fromRGB(40, 25, 60),
		DialogButton = Color3.fromRGB(60, 45, 80),
		SearchTabColor = Color3.fromRGB(60, 45, 80),
		DialogButtonBorder = Color3.fromRGB(95, 80, 110),
		DialogBorder = Color3.fromRGB(85, 70, 100),
		DialogInput = Color3.fromRGB(70, 55, 85),
		DialogInputLine = Color3.fromRGB(175, 160, 190),

		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(140, 120, 160),
		HoverChange = 0.04,
	},

	Rose = {
		Name = "Rose",
		Accent = Color3.fromRGB(180, 55, 90),

		AcrylicMain = Color3.fromRGB(40, 40, 40),
		AcrylicBorder = Color3.fromRGB(130, 90, 110),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(190, 60, 135), Color3.fromRGB(165, 50, 70)),
		AcrylicNoise = 0.92,

		TitleBarLine = Color3.fromRGB(140, 85, 105),
		Tab = Color3.fromRGB(180, 140, 160),

		Element = Color3.fromRGB(200, 120, 170),
		ElementBorder = Color3.fromRGB(110, 70, 85),
		InElementBorder = Color3.fromRGB(120, 90, 90),
		ElementTransparency = 0.86,

		ToggleSlider = Color3.fromRGB(200, 120, 170),
		ToggleToggled = Color3.fromRGB(180, 55, 90),

		SliderRail = Color3.fromRGB(200, 120, 170),

		DropdownFrame = Color3.fromRGB(200, 160, 180),
		DropdownHolder = Color3.fromRGB(120, 50, 75),
		DropdownBorder = Color3.fromRGB(90, 40, 55),
		DropdownOption = Color3.fromRGB(200, 120, 170),

		Keybind = Color3.fromRGB(200, 120, 170),

		Input = Color3.fromRGB(200, 120, 170),
		InputFocused = Color3.fromRGB(20, 10, 30),
		InputIndicator = Color3.fromRGB(170, 150, 190),
		InputIndicatorFocus = Color3.fromRGB(180, 55, 90),

		Dialog = Color3.fromRGB(120, 50, 75),
		DialogHolder = Color3.fromRGB(95, 40, 60),
		DialogHolderLine = Color3.fromRGB(90, 35, 55),
		DialogButton = Color3.fromRGB(120, 50, 75),
		SearchTabColor = Color3.fromRGB(120, 50, 75),
		DialogButtonBorder = Color3.fromRGB(155, 90, 115),
		DialogBorder = Color3.fromRGB(100, 70, 90),
		DialogInput = Color3.fromRGB(135, 55, 80),
		DialogInputLine = Color3.fromRGB(190, 160, 180),

		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(200, 120, 170),
		HoverChange = 0.04,
	},

	Sakura = {
		Name = "Sakura",
		Accent = Color3.fromRGB(252, 209, 215),

		AcrylicMain = Color3.fromRGB(40, 40, 40),
		AcrylicBorder = Color3.fromRGB(130, 90, 110),
		AcrylicGradient = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(252, 209, 215)),
			ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 231, 222)),
			ColorSequenceKeypoint.new(0.50, Color3.fromRGB(233, 177, 205)),
			ColorSequenceKeypoint.new(0.75, Color3.fromRGB(195, 130, 158)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(86, 33, 53)),
		},
		AcrylicNoise = 0.92,

		TitleBarLine = Color3.fromRGB(140, 85, 105),
		Tab = Color3.fromRGB(132, 89, 95),

		Element = Color3.fromRGB(220, 140, 190),
		ElementBorder = Color3.fromRGB(110, 70, 85),
		InElementBorder = Color3.fromRGB(120, 90, 90),
		ElementTransparency = 0.86,

		ToggleSlider = Color3.fromRGB(252, 209, 215),
		ToggleToggled = Color3.fromRGB(252, 209, 215),
		TransparenToggle = 0.5,

		SliderRail = Color3.fromRGB(252, 209, 215),

		DropdownFrame = Color3.fromRGB(252, 209, 215),
		DropdownHolder = Color3.fromRGB(156, 103, 123),
		DropdownBorder = Color3.fromRGB(90, 40, 55),
		DropdownOption = Color3.fromRGB(252, 209, 215),

		Keybind = Color3.fromRGB(200, 120, 170),

		Input = Color3.fromRGB(200, 120, 170),
		InputFocused = Color3.fromRGB(200, 200, 200),
		InputIndicator = Color3.fromRGB(170, 150, 190),
		InputIndicatorFocus = Color3.fromRGB(252, 209, 215),

		Dialog = Color3.fromRGB(120, 50, 75),
		DialogHolder = Color3.fromRGB(95, 40, 60),
		DialogHolderLine = Color3.fromRGB(90, 35, 55),
		DialogButton = Color3.fromRGB(120, 50, 75),
		SearchTabColor = Color3.fromRGB(120, 50, 75),
		DialogButtonBorder = Color3.fromRGB(155, 90, 115),
		DialogBorder = Color3.fromRGB(100, 70, 90),
		DialogInput = Color3.fromRGB(135, 55, 80),
		DialogInputLine = Color3.fromRGB(190, 160, 180),

		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(220, 220, 220),
		Hover = Color3.fromRGB(200, 120, 170),
		HoverChange = 0.04
	}
}

local Library = {
	Version = "1.1.0",

	OpenFrames = {},
	Options = {},
	Themes = Themes.Names,

	Window = nil,
	WindowFrame = nil,
	Unloaded = false,

	Creator = nil,

	DialogOpen = false,
	UseAcrylic = false,
	Acrylic = false,
	Transparency = true,
	MinimizeKeybind = nil,
	MinimizerIcon = nil,
	MinimizeKey = Enum.KeyCode.LeftControl,
}

local function isMotor(value)
	local motorType = tostring(value):match("^Motor%((.+)%)$")

	if motorType then
		return true, motorType
	else
		return false
	end
end

local Connection = {}

Connection.__index = Connection

function Connection.new(signal, handler)
	return setmetatable({
		signal = signal,
		connected = true,
		_handler = handler,
	}, Connection)
end

function Connection:disconnect()
	if self.connected then
		self.connected = false

		for index, connection in pairs(self.signal._connections) do
			if connection == self then
				table.remove(self.signal._connections, index)
				return
			end
		end
	end
end

local Signal = {}
Signal.__index = Signal

function Signal.new()
	return setmetatable({
		_connections = {},
		_threads = {},
	}, Signal)
end

function Signal:fire(...)
	for _, connection in pairs(self._connections) do
		connection._handler(...)
	end

	for _, thread in pairs(self._threads) do
		coroutine.resume(thread, ...)
	end

	self._threads = {}
end

function Signal:connect(handler)
	local connection = Connection.new(self, handler)
	table.insert(self._connections, connection)
	return connection
end

function Signal:wait()
	table.insert(self._threads, coroutine.running())
	return coroutine.yield()
end

local Linear = {}
Linear.__index = Linear

function Linear.new(targetValue, options)
	assert(targetValue, "Missing argument #1: targetValue")

	options = options or {}

	return setmetatable({
		_targetValue = targetValue,
		_velocity = options.velocity or 1,
	}, Linear)
end

function Linear:step(state, dt)
	local position = state.value
	local velocity = self._velocity -- Linear motion ignores the state's velocity
	local goal = self._targetValue

	local dPos = dt * velocity

	local complete = dPos >= math.abs(goal - position)
	position = position + dPos * (goal > position and 1 or -1)
	if complete then
		position = self._targetValue
		velocity = 0
	end

	return {
		complete = complete,
		value = position,
		velocity = velocity,
	}
end

local Instant = {}
Instant.__index = Instant

function Instant.new(targetValue)
	return setmetatable({
		_targetValue = targetValue,
	}, Instant)
end

function Instant:step()
	return {
		complete = true,
		value = self._targetValue,
	}
end

local VELOCITY_THRESHOLD = 0.001
local POSITION_THRESHOLD = 0.001

local EPS = 0.0001

local Spring = {}
Spring.__index = Spring

function Spring.new(targetValue, options)
	assert(targetValue, "Missing argument #1: targetValue")
	options = options or {}

	return setmetatable({
		_targetValue = targetValue,
		_frequency = options.frequency or 4,
		_dampingRatio = options.dampingRatio or 1,
	}, Spring)
end

function Spring:step(state, dt)
	-- Cache frequently used values and operations
	local d = self._dampingRatio
	local f = self._frequency * 2 * math.pi
	local g = self._targetValue
	local p0 = state.value
	local v0 = state.velocity or 0
	local offset = p0 - g
	local decay = math.exp(-d * f * dt)
	local p1, v1

	-- Pre-calculate common products
	local f_dt = f * dt
	local f_squared = f * f

	-- Move conditional branches outside for better prediction
	if d == 1 then -- Critically damped
		p1 = (offset * (1 + f_dt) + v0 * dt) * decay + g
		v1 = (v0 * (1 - f_dt) - offset * (f_squared * dt)) * decay
	elseif d < 1 then -- Underdamped
		local c = math.sqrt(1 - d * d)
		local c_squared = c * c
		local f_c = f * c
		local f_c_dt = f_c * dt

		local i = math.cos(f_c_dt)
		local j = math.sin(f_c_dt)

		-- Optimize z calculation
		local z
		if c > EPS then
			z = j / c
		else
			local a = dt * f
			local a_squared = a * a
			local a_cubed = a_squared * a
			local c_squared_squared = c_squared * c_squared
			z = a + ((a_squared * c_squared_squared / 20 - c_squared) * a_cubed) / 6
		end

		-- Optimize y calculation
		local y
		if f_c > EPS then
			y = j / f_c
		else
			local b = f_c
			local b_squared = b * b
			local dt_squared = dt * dt
			local dt_cubed = dt_squared * dt
			y = dt + ((dt_squared * b_squared * b_squared / 20 - b_squared) * dt_cubed) / 6
		end

		p1 = (offset * (i + d * z) + v0 * y) * decay + g
		v1 = (v0 * (i - z * d) - offset * (z * f)) * decay
	else -- Overdamped
		local c = math.sqrt(d * d - 1)
		local r1 = -f * (d - c)
		local r2 = -f * (d + c)
		local co2 = (v0 - offset * r1) / (2 * f * c)
		local co1 = offset - co2
		local e1 = co1 * math.exp(r1 * dt)
		local e2 = co2 * math.exp(r2 * dt)
		p1 = e1 + e2 + g
		v1 = e1 * r1 + e2 * r2
	end

	-- Combine the threshold check for early returns
	if math.abs(v1) < VELOCITY_THRESHOLD and math.abs(p1 - g) < POSITION_THRESHOLD then
		return {
			complete = true,
			value = g,
			velocity = v1,
		}
	end

	return {
		complete = false,
		value = p1,
		velocity = v1,
	}
end

local noop = function() end

local BaseMotor = {}
BaseMotor.__index = BaseMotor

function BaseMotor.new()
	return setmetatable({
		_onStep = Signal.new(),
		_onStart = Signal.new(),
		_onComplete = Signal.new(),
	}, BaseMotor)
end

function BaseMotor:onStep(handler)
	return self._onStep:connect(handler)
end

function BaseMotor:onStart(handler)
	return self._onStart:connect(handler)
end

function BaseMotor:onComplete(handler)
	return self._onComplete:connect(handler)
end

function BaseMotor:start()
	if not self._connection then
		self._connection = RunService.RenderStepped:Connect(function(deltaTime)
			self:step(deltaTime)
		end)
	end
end

function BaseMotor:stop()
	if self._connection then
		self._connection:Disconnect()
		self._connection = nil
	end
end

BaseMotor.destroy = BaseMotor.stop

BaseMotor.step = noop
BaseMotor.getValue = noop
BaseMotor.setGoal = noop

function BaseMotor:__tostring()
	return "Motor"
end

local SingleMotor = setmetatable({}, BaseMotor)
SingleMotor.__index = SingleMotor

function SingleMotor.new(initialValue, useImplicitConnections)
	assert(initialValue, "Missing argument #1: initialValue")
	assert(typeof(initialValue) == "number", "initialValue must be a number!")

	local self = setmetatable(BaseMotor.new(), SingleMotor)

	if useImplicitConnections ~= nil then
		self._useImplicitConnections = useImplicitConnections
	else
		self._useImplicitConnections = true
	end

	self._goal = nil
	self._state = {
		complete = true,
		value = initialValue,
	}

	return self
end

function SingleMotor:step(deltaTime)
	if self._state.complete then
		return true
	end

	local newState = self._goal:step(self._state, deltaTime)

	self._state = newState
	self._onStep:fire(newState.value)

	if newState.complete then
		if self._useImplicitConnections then
			self:stop()
		end

		self._onComplete:fire()
	end

	return newState.complete
end

function SingleMotor:getValue()
	return self._state.value
end

function SingleMotor:setGoal(goal)
	self._state.complete = false
	self._goal = goal

	self._onStart:fire()

	if self._useImplicitConnections then
		self:start()
	end
end

function SingleMotor:__tostring()
	return "Motor(Single)"
end

local GroupMotor = setmetatable({}, BaseMotor)
GroupMotor.__index = GroupMotor

local function toMotor(value)
	if isMotor(value) then
		return value
	end

	local valueType = typeof(value)

	if valueType == "number" then
		return SingleMotor.new(value, false)
	elseif valueType == "table" then
		return GroupMotor.new(value, false)
	end

	error(("Unable to convert %q to motor; type %s is unsupported"):format(value, valueType), 2)
end

function GroupMotor.new(initialValues, useImplicitConnections)
	assert(initialValues, "Missing argument #1: initialValues")
	assert(typeof(initialValues) == "table", "initialValues must be a table!")
	assert(
		not initialValues.step,
		'initialValues contains disallowed property "step". Did you mean to put a table of values here?'
	)

	local self = setmetatable(BaseMotor.new(), GroupMotor)

	if useImplicitConnections ~= nil then
		self._useImplicitConnections = useImplicitConnections
	else
		self._useImplicitConnections = true
	end

	self._complete = true
	self._motors = {}

	for key, value in pairs(initialValues) do
		self._motors[key] = toMotor(value)
	end

	return self
end

function GroupMotor:step(deltaTime)
	if self._complete then
		return true
	end

	local allMotorsComplete = true

	for _, motor in pairs(self._motors) do
		local complete = motor:step(deltaTime)
		if not complete then
			-- If any of the sub-motors are incomplete, the group motor will not be complete either
			allMotorsComplete = false
		end
	end

	self._onStep:fire(self:getValue())

	if allMotorsComplete then
		if self._useImplicitConnections then
			self:stop()
		end

		self._complete = true
		self._onComplete:fire()
	end

	return allMotorsComplete
end

function GroupMotor:setGoal(goals)
	assert(not goals.step, 'goals contains disallowed property "step". Did you mean to put a table of goals here?')

	self._complete = false
	self._onStart:fire()

	for key, goal in pairs(goals) do
		local motor = assert(self._motors[key], ("Unknown motor for key %s"):format(key))
		motor:setGoal(goal)
	end

	if self._useImplicitConnections then
		self:start()
	end
end

function GroupMotor:getValue()
	local values = {}

	for key, motor in pairs(self._motors) do
		values[key] = motor:getValue()
	end

	return values
end

function GroupMotor:__tostring()
	return "Motor(Group)"
end

local Flipper = {
	SingleMotor = SingleMotor,
	GroupMotor = GroupMotor,

	Instant = Instant,
	Linear = Linear,
	Spring = Spring,

	isMotor = isMotor,
}

local Creator = {
	Registry = {},
	Signals = {},
	TransparencyMotors = {},
	DefaultProperties = {
		ScreenGui = {
			ResetOnSpawn = false,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		},
		Frame = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
		},
		ScrollingFrame = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			ScrollBarImageColor3 = Color3.new(0, 0, 0),
		},
		TextLabel = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			TextSize = 14,
			AutoLocalize = false,
		},
		TextButton = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			AutoButtonColor = false,
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			TextSize = 14,
		},
		TextBox = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			ClearTextOnFocus = false,
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			TextSize = 14,
		},
		ImageLabel = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
		},
		ImageButton = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			AutoButtonColor = false,
		},
		CanvasGroup = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
		},
	},
}

local function ApplyCustomProps(Object, Props)
	if Props.ThemeTag then
		Creator.AddThemeObject(Object, Props.ThemeTag)
	end
end

function Creator.AddSignal(Signal, Function)
	local Connected = Signal:Connect(Function)
	table.insert(Creator.Signals, Connected)
	return Connected
end

function Creator.Disconnect()
	for Idx = #Creator.Signals, 1, -1 do
		local Connection = table.remove(Creator.Signals, Idx)
		if Connection.Disconnect then
			Connection:Disconnect()
		end
	end
end

function Creator.UpdateTheme()
	for Instance, Object in next, Creator.Registry do
		for Property, ColorIdx in next, Object.Properties do
			local Theme_Property = Creator.GetThemeProperty(ColorIdx)
			if Theme_Property then
				Instance[Property] = Theme_Property
			end
		end
	end

	for _, Motor in next, Creator.TransparencyMotors do
		Motor:setGoal(Flipper.Instant.new(Creator.GetThemeProperty("ElementTransparency")))
	end
end

function Creator.AddThemeObject(Object, Properties)
	local Idx = #Creator.Registry + 1
	local Data = {
		Object = Object,
		Properties = Properties,
		Idx = Idx,
	}

	Creator.Registry[Object] = Data
	Creator.UpdateTheme()
	return Object
end

function Creator.OverrideTag(Object, Properties)
	Creator.Registry[Object].Properties = Properties
	Creator.UpdateTheme()
end

function Creator.GetThemeProperty(Property)
	if Themes[Library.Theme][Property] then
		return Themes[Library.Theme][Property]
	end
	return Themes["Dark"][Property]
end

function Creator.New(Name, Properties, Children)
	local Object = Instance.new(Name)

	-- Default properties
	for Name, Value in next, Creator.DefaultProperties[Name] or {} do
		Object[Name] = Value
	end

	-- Properties
	for Name, Value in next, Properties or {} do
		if Name ~= "ThemeTag" then
			Object[Name] = Value
		end
	end

	-- Children
	for _, Child in next, Children or {} do
		Child.Parent = Object
	end

	ApplyCustomProps(Object, Properties)
	return Object
end

function Creator.SpringMotor(Initial, Instance, Prop, IgnoreDialogCheck, ResetOnThemeChange)
	IgnoreDialogCheck = IgnoreDialogCheck or false
	ResetOnThemeChange = ResetOnThemeChange or false
	local Motor = Flipper.SingleMotor.new(Initial)
	Motor:onStep(function(value)
		Instance[Prop] = value
	end)

	if ResetOnThemeChange then
		table.insert(Creator.TransparencyMotors, Motor)
	end

	local function SetValue(Value, Ignore)
		Ignore = Ignore or false
		if not IgnoreDialogCheck then
			if not Ignore then
				if Prop == "BackgroundTransparency" and Library.DialogOpen then
					return
				end
			end
		end
		Motor:setGoal(Flipper.Spring.new(Value, { frequency = 8 }))
	end

	return Motor, SetValue
end

Library.Creator = Creator

local New = Creator.New


local LibraryID = "Roblox/Ui"

local PanelParent = game:GetService("CoreGui")
local Panel = PanelParent:FindFirstChild(LibraryID)
if Panel then
	Panel:Destroy()
end

local GUI = New("ScreenGui", {
	Parent = PanelParent,
	Name = LibraryID,
})

Library.GUI = GUI
ProtectGui(GUI)

function Library:SafeCallbackToggles(Title, Function, ...)
	if not Function then
		return
	end

	local Success, Event = pcall(Function, ...)
	if not Success then
		local _, i = Event:find(":%d+: ")

		if not i then
			return Library:Notify({
				Title = "Interface",
				Content = "Callback error",
				SubContent = Title,
				Duration = 5,
			})
		end

		return Library:Notify({
			Title = "Interface",
			Content = "Callback error",
			SubContent = Title,
			Duration = 5,
		})
	end
end
function Library:SafeCallback(Function, ...)
	if not Function then
		return
	end

	local Success, Event = pcall(Function, ...)
	if not Success then
		local _, i = Event:find(":%d+: ")

		if not i then
			return Library:Notify({
				Title = "Interface",
				Content = "Callback error",
				SubContent = Event,
				Duration = 5,
			})
		end

		return Library:Notify({
			Title = "Interface",
			Content = "Callback error",
			SubContent = Event:sub(i + 1),
			Duration = 5,
		})
	end
end

function Library:Round(Number, Factor)
	if Factor == 0 then
		return math.floor(Number)
	end
	Number = tostring(Number)
	return Number:find("%.") and tonumber(Number:sub(1, Number:find("%.") + Factor)) or Number
end

local function map(value, inMin, inMax, outMin, outMax)
	return (value - inMin) * (outMax - outMin) / (inMax - inMin) + outMin
end

local function viewportPointToWorld(location, distance)
	local unitRay = game:GetService("Workspace").CurrentCamera:ScreenPointToRay(location.X, location.Y)
	return unitRay.Origin + unitRay.Direction * distance
end

local function getOffset()
	local viewportSizeY = game:GetService("Workspace").CurrentCamera.ViewportSize.Y
	return map(viewportSizeY, 0, 2560, 8, 56)
end

local viewportPointToWorld, getOffset = unpack({ viewportPointToWorld, getOffset })

local BlurFolder = Instance.new("Folder", game:GetService("Workspace").CurrentCamera)

local function createAcrylic()
	local Part = Creator.New("Part", {
		Name = "Body",
		Color = Color3.new(0, 0, 0),
		Material = Enum.Material.Glass,
		Size = Vector3.new(1, 1, 0),
		Anchored = true,
		CanCollide = false,
		Locked = true,
		CastShadow = false,
		Transparency = 0.98,
	}, {
		Creator.New("SpecialMesh", {
			MeshType = Enum.MeshType.Brick,
			Offset = Vector3.new(0, 0, -0.000001),
		}),
	})

	return Part
end

function AcrylicBlur()
	local function createAcrylicBlur(distance)
		local cleanups = {}

		distance = distance or 0.001
		local positions = {
			topLeft = Vector2.new(),
			topRight = Vector2.new(),
			bottomRight = Vector2.new(),
		}
		local model = createAcrylic()
		model.Parent = BlurFolder

		local function updatePositions(size, position)
			positions.topLeft = position
			positions.topRight = position + Vector2.new(size.X, 0)
			positions.bottomRight = position + size
		end

		local function render()
			local res = game:GetService("Workspace").CurrentCamera
			if res then
				res = res.CFrame
			end
			local cond = res
			if not cond then
				cond = CFrame.new()
			end

			local camera = cond
			local topLeft = positions.topLeft
			local topRight = positions.topRight
			local bottomRight = positions.bottomRight

			local topLeft3D = viewportPointToWorld(topLeft, distance)
			local topRight3D = viewportPointToWorld(topRight, distance)
			local bottomRight3D = viewportPointToWorld(bottomRight, distance)

			local width = (topRight3D - topLeft3D).Magnitude
			local height = (topRight3D - bottomRight3D).Magnitude

			model.CFrame =
				CFrame.fromMatrix((topLeft3D + bottomRight3D) / 2, camera.XVector, camera.YVector, camera.ZVector)
			model.Mesh.Scale = Vector3.new(width, height, 0)
		end

		local function onChange(rbx)
			local offset = getOffset()
			local size = rbx.AbsoluteSize - Vector2.new(offset, offset)
			local position = rbx.AbsolutePosition + Vector2.new(offset / 2, offset / 2)

			updatePositions(size, position)
			task.spawn(render)
		end

		local function renderOnChange()
			local camera = game:GetService("Workspace").CurrentCamera
			if not camera then
				return
			end

			table.insert(cleanups, camera:GetPropertyChangedSignal("CFrame"):Connect(render))
			table.insert(cleanups, camera:GetPropertyChangedSignal("ViewportSize"):Connect(render))
			table.insert(cleanups, camera:GetPropertyChangedSignal("FieldOfView"):Connect(render))
			task.spawn(render)
		end

		model.Destroying:Connect(function()
			for _, item in cleanups do
				pcall(function()
					item:Disconnect()
				end)
			end
		end)

		renderOnChange()

		return onChange, model
	end

	return function(distance)
		local Blur = {}
		local onChange, model = createAcrylicBlur(distance)

		local comp = Creator.New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
		})

		Creator.AddSignal(comp:GetPropertyChangedSignal("AbsolutePosition"), function()
			onChange(comp)
		end)

		Creator.AddSignal(comp:GetPropertyChangedSignal("AbsoluteSize"), function()
			onChange(comp)
		end)

		Blur.AddParent = function(Parent)
			Creator.AddSignal(Parent:GetPropertyChangedSignal("Visible"), function()
				Blur.SetVisibility(Parent.Visible)
			end)
		end

		Blur.SetVisibility = function(Value)
			model.Transparency = Value and 0.98 or 1
		end

		Blur.Frame = comp
		Blur.Model = model

		return Blur
	end
end

function AcrylicPaint()
	local New = Creator.New
	local AcrylicBlur = AcrylicBlur()

	return function(props)
		local AcrylicPaint = {}

		AcrylicPaint.Frame = New("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 0.9,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
		}, {
			New("ImageLabel", {
				Image = "rbxassetid://8992230677",
				ScaleType = "Slice",
				SliceCenter = Rect.new(Vector2.new(99, 99), Vector2.new(99, 99)),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 120, 1, 116),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundTransparency = 1,
				ImageColor3 = Color3.fromRGB(0, 0, 0),
				ImageTransparency = 0.7,
			}),

			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),

			New("Frame", {
				BackgroundTransparency = 0.45,
				Size = UDim2.fromScale(1, 1),
				Name = "Background",
				ThemeTag = {
					BackgroundColor3 = "AcrylicMain",
				},
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			}),

			New("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0.4,
				Size = UDim2.fromScale(1, 1),
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),

				New("UIGradient", {
					Rotation = 90,
					ThemeTag = {
						Color = "AcrylicGradient",
					},
				}),
			}),

			New("ImageLabel", {
				Image = "rbxassetid://9968344105",
				ImageTransparency = 0.98,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.new(0, 128, 0, 128),
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			}),

			New("ImageLabel", {
				Image = "rbxassetid://9968344227",
				ImageTransparency = 0.9,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.new(0, 128, 0, 128),
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageTransparency = "AcrylicNoise",
				},
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			}),

			New("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				ZIndex = 2,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
				New("UIStroke", {
					Transparency = 0.5,
					Thickness = 1,
					ThemeTag = {
						Color = "AcrylicBorder",
					},
				}),
			}),
		})

		local Blur

		if Library.UseAcrylic then
			Blur = AcrylicBlur()
			Blur.Frame.Parent = AcrylicPaint.Frame
			AcrylicPaint.Model = Blur.Model
			AcrylicPaint.AddParent = Blur.AddParent
			AcrylicPaint.SetVisibility = Blur.SetVisibility
		end

		return AcrylicPaint
	end
end

local Acrylic = {
	AcrylicBlur = AcrylicBlur(),
	CreateAcrylic = createAcrylic,
	AcrylicPaint = AcrylicPaint(),
}

function Acrylic.init()
	local baseEffect = Instance.new("DepthOfFieldEffect")
	baseEffect.FarIntensity = 0
	baseEffect.InFocusRadius = 0.1
	baseEffect.NearIntensity = 1

	local depthOfFieldDefaults = {}

	function Acrylic.Enable()
		for _, effect in pairs(depthOfFieldDefaults) do
			effect.Enabled = false
		end
		baseEffect.Parent = game:GetService("Lighting")
	end

	function Acrylic.Disable()
		for _, effect in pairs(depthOfFieldDefaults) do
			effect.Enabled = effect.enabled
		end
		baseEffect.Parent = nil
	end

	local function registerDefaults()
		local function register(object)
			if object:IsA("DepthOfFieldEffect") then
				depthOfFieldDefaults[object] = { enabled = object.Enabled }
			end
		end

		for _, child in pairs(game:GetService("Lighting"):GetChildren()) do
			register(child)
		end

		if game:GetService("Workspace").CurrentCamera then
			for _, child in pairs(game:GetService("Workspace").CurrentCamera:GetChildren()) do
				register(child)
			end
		end
	end

	registerDefaults()
	Acrylic.Enable()
end

local Components = {
	Assets = {
		Close = "rbxassetid://9886659671",
		Min = "rbxassetid://9886659276",
		Max = "rbxassetid://9886659406",
		Restore = "rbxassetid://9886659001",
	},
}

local New = Creator.New
local Spring = Flipper.Spring.new
local Instant = Flipper.Instant.new
local AddSignal = Creator.AddSignal

Components.Element = function(Title, Desc, Parent, Hover, Options)
	local Element = { Original = { Text = "" } }
	local Options = Options or {}

	Element.TitleLabel = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		Text = Title,
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, 0, 0, 14),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		AutoLocalize = false,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	Element.DescLabel = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		Text = Desc,
		TextColor3 = Color3.fromRGB(200, 200, 200),
		TextSize = 12,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 14),
		AutoLocalize = false,
		ThemeTag = {
			TextColor3 = "SubText",
		},
	})

	Element.LabelHolder = New("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(10, 0),
		Size = UDim2.new(1, -28, 0, 0),
	}, {
		New("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		New("UIPadding", {
			PaddingBottom = UDim.new(0, 13),
			PaddingTop = UDim.new(0, 13),
		}),
		Element.TitleLabel,
		Element.DescLabel,
	})

	Element.Border = New("UIStroke", {
		Transparency = 0.5,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.fromRGB(0, 0, 0),
		ThemeTag = {
			Color = "ElementBorder",
		},
	})

	Element.Frame = New("TextButton", {
		Visible = Options.Visible and Options.Visible or true,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 0.89,
		BackgroundColor3 = Color3.fromRGB(130, 130, 130),
		Parent = Parent,
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = "",
		LayoutOrder = 7,
		ThemeTag = {
			BackgroundColor3 = "Element",
			BackgroundTransparency = "ElementTransparency",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),
		Element.Border,
		Element.LabelHolder,
	})

	function Element:SetTitle(Set)
		Element.TitleLabel.Text = Set
	end

	function Element:Visible(Bool)
		Element.Frame.Visible = Bool
	end

	function Element:SetDesc(Set)
		if Set == nil then
			Set = ""
		end
		if Set == "" then
			Element.DescLabel.Visible = false
		else
			Element.DescLabel.Visible = true
		end
		Element.DescLabel.Text = Set
	end

	function Element:AddText(Add)
		if not string.find(Element.TitleLabel.Text, Add, 1, true) then
			Element.TitleLabel.Text = Element.TitleLabel.Text .. "" .. Add
		end
	end

	function Element:GetOriginalText()
		return Element.Original.Text
	end

	function Element:GetTitle()
		return Element.TitleLabel.Text
	end

	function Element:GetDesc()
		return Element.DescLabel.Text
	end

	function Element:Destroy()
		Element.Frame:Destroy()
	end

	Element:SetTitle(Title)
	Element:SetDesc(Desc)

	Element.Original.Text = Title

	if Hover then
		local Themes = Library.Themes
		local Motor, SetTransparency = Creator.SpringMotor(
			Creator.GetThemeProperty("ElementTransparency"),
			Element.Frame,
			"BackgroundTransparency",
			false,
			true
		)

		Creator.AddSignal(Element.Frame.MouseEnter, function()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
		end)
		Creator.AddSignal(Element.Frame.MouseLeave, function()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency"))
		end)
		Creator.AddSignal(Element.Frame.MouseButton1Down, function()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency") + Creator.GetThemeProperty("HoverChange"))
		end)
		Creator.AddSignal(Element.Frame.MouseButton1Up, function()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
		end)
	end

	return Element
end

Components.Section = function(Title, Parent)
	local Section = {}

	Section.Layout = New("UIListLayout", {
		Padding = UDim.new(0, 5),
	})

	Section.Container = New("Frame", {
		Size = UDim2.new(1, 0, 0, 26),
		Position = UDim2.fromOffset(0, 24),
		BackgroundTransparency = 1,
	}, {
		Section.Layout,
	})

	Section.Root = New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 26),
		LayoutOrder = 7,
		Parent = Parent,
	}, {
		New("TextLabel", {
			RichText = true,
			Text = Title,
			TextTransparency = 0,
			FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
			TextSize = 22,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			Size = UDim2.new(1, -16, 0, 18),
			Position = UDim2.fromOffset(0, 2),
			AutoLocalize = false,
			ThemeTag = {
				TextColor3 = "Text",
			},
		}),
		Section.Container,
	})

	Creator.AddSignal(Section.Layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
		Section.Container.Size = UDim2.new(1, 0, 0, Section.Layout.AbsoluteContentSize.Y)
		Section.Root.Size = UDim2.new(1, 0, 0, Section.Layout.AbsoluteContentSize.Y + 25)
	end)
	
	return Section
end
Components.Tab = (function()
	local Components = Components

	local TabModule = {
		Window      = nil,
		Tabs        = {},
		Containers  = {},
		SelectedTab = 0,
		TabCount    = 0,
		Callback    = function() end,
	}

	function TabModule:Init(Window)
		TabModule.Window = Window
		return TabModule
	end

	function TabModule:GetCurrentTabPos()
		local TabHolderPos = TabModule.Window.TabHolder.AbsolutePosition.Y
		local TabPos       = TabModule.Tabs[TabModule.SelectedTab].Frame.AbsolutePosition.Y
		return TabPos - TabHolderPos
	end

	function TabModule:New(Title, Icon, Parent)
		local Window   = TabModule.Window
		local Elements = Library.Elements

		TabModule.TabCount = TabModule.TabCount + 1
		local TabIndex = TabModule.TabCount

		local Tab = {
			Selected = false,
			Name     = Title,
			Type     = "Tab",
		}

		if Library:GetIcon(Icon) then
			Icon = Library:GetIcon(Icon)
		end
		if Icon == "" or Icon == nil then
			Icon = nil
		end

		-- ── Pill background (hidden when unselected) ──────────
		local PillBg = New("Frame", {
			Size             = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			ThemeTag         = { BackgroundColor3 = "Accent" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 8) }),
		})

		-- ── Left accent bar ───────────────────────────────────
		local AccentBar = New("Frame", {
			Size             = UDim2.new(0, 3, 0, 0),   -- height animated
			AnchorPoint      = Vector2.new(0, 0.5),
			Position         = UDim2.new(0, 0, 0.5, 0),
			BackgroundColor3 = Color3.fromRGB(96, 205, 255),
			BackgroundTransparency = 1,
			ThemeTag         = { BackgroundColor3 = "Accent" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 2) }),
		})

		-- ── Icon ──────────────────────────────────────────────
		local IconLabel = New("ImageLabel", {
			AnchorPoint      = Vector2.new(0, 0.5),
			Size             = UDim2.fromOffset(16, 16),
			Position         = UDim2.new(0, 8, 0.5, 0),
			BackgroundTransparency = 1,
			Image            = Icon or "",
			ImageTransparency = 0.35,
			ThemeTag         = { ImageColor3 = "Text" },
		})

		-- ── Title label ───────────────────────────────────────
		local TitleLabel = New("TextLabel", {
			AnchorPoint      = Vector2.new(0, 0.5),
			Position         = Icon and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 12, 0.5, 0),
			Text             = Title,
			RichText         = true,
			TextTransparency = 0.35,
			FontFace         = Font.new(
				"rbxasset://fonts/families/GothamSSm.json",
				Enum.FontWeight.Regular,
				Enum.FontStyle.Normal
			),
			TextSize         = 12,
			TextXAlignment   = Enum.TextXAlignment.Left,
			TextYAlignment   = Enum.TextYAlignment.Center,
			Size             = UDim2.new(1, -12, 1, 0),
			BackgroundTransparency = 1,
			AutoLocalize     = false,
			ThemeTag         = { TextColor3 = "Text" },
		})

		-- ── Tab frame ─────────────────────────────────────────
		Tab.Frame = New("TextButton", {
			Size             = UDim2.new(1, 0, 0, 34),
			BackgroundTransparency = 1,
			Parent           = Parent,
			ThemeTag         = { BackgroundColor3 = "Tab" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 8) }),
			PillBg,
			AccentBar,
			IconLabel,
			TitleLabel,
		})

		-- ── Container scroll frame (unchanged) ───────────────
		local ContainerLayout = New("UIListLayout", {
			Padding      = UDim.new(0, 5),
			SortOrder    = Enum.SortOrder.LayoutOrder,
		})

		Tab.ContainerFrame = New("ScrollingFrame", {
			Size                   = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Parent                 = Window.ContainerHolder,
			Visible                = false,
			BottomImage            = "rbxassetid://6889812791",
			MidImage               = "rbxassetid://6889812721",
			TopImage               = "rbxassetid://6276641225",
			ScrollBarImageColor3   = Color3.fromRGB(255, 255, 255),
			ScrollBarImageTransparency = 0.95,
			ScrollBarThickness     = 3,
			BorderSizePixel        = 0,
			CanvasSize             = UDim2.fromScale(0, 0),
			ScrollingDirection     = Enum.ScrollingDirection.Y,
		}, {
			ContainerLayout,
			New("UIPadding", {
				PaddingRight  = UDim.new(0, 10),
				PaddingLeft   = UDim.new(0, 1),
				PaddingTop    = UDim.new(0, 1),
				PaddingBottom = UDim.new(0, 1),
			}),
		})

		Creator.AddSignal(ContainerLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
			Tab.ContainerFrame.CanvasSize =
				UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 2)
		end)

		-- ── Easing presets ────────────────────────────────────
		local TI_NORM = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		local TI_BACK = TweenInfo.new(0.25, Enum.EasingStyle.Back,  Enum.EasingDirection.Out)

		-- ── State appliers ────────────────────────────────────
		local function applySelected()
			-- pill fades in
			TweenService:Create(PillBg, TI_NORM, {
				BackgroundTransparency = 0.88,
			}):Play()
			-- accent bar grows
			TweenService:Create(AccentBar, TI_BACK, {
				Size                   = UDim2.new(0, 3, 0.55, 0),
				BackgroundTransparency = 0,
			}):Play()
			-- text & icon become fully opaque
			TweenService:Create(TitleLabel, TI_NORM, { TextTransparency  = 0    }):Play()
			TweenService:Create(IconLabel,  TI_NORM, { ImageTransparency = 0    }):Play()
		end

		local function applyUnselected()
			TweenService:Create(PillBg, TI_NORM, {
				BackgroundTransparency = 1,
			}):Play()
			TweenService:Create(AccentBar, TI_NORM, {
				Size                   = UDim2.new(0, 3, 0, 0),
				BackgroundTransparency = 1,
			}):Play()
			TweenService:Create(TitleLabel, TI_NORM, { TextTransparency  = 0.35 }):Play()
			TweenService:Create(IconLabel,  TI_NORM, { ImageTransparency = 0.35 }):Play()
		end

		-- ── Hover (only when not selected) ───────────────────
		Creator.AddSignal(Tab.Frame.MouseEnter, function()
			if not Tab.Selected then
				TweenService:Create(PillBg, TI_NORM, { BackgroundTransparency = 0.94 }):Play()
				TweenService:Create(TitleLabel, TI_NORM, { TextTransparency = 0.15 }):Play()
				TweenService:Create(IconLabel,  TI_NORM, { ImageTransparency = 0.15 }):Play()
			end
		end)
		Creator.AddSignal(Tab.Frame.MouseLeave, function()
			if not Tab.Selected then
				TweenService:Create(PillBg, TI_NORM, { BackgroundTransparency = 1 }):Play()
				TweenService:Create(TitleLabel, TI_NORM, { TextTransparency = 0.35 }):Play()
				TweenService:Create(IconLabel,  TI_NORM, { ImageTransparency = 0.35 }):Play()
			end
		end)
		Creator.AddSignal(Tab.Frame.MouseButton1Down, function()
			TweenService:Create(PillBg, TI_NORM, { BackgroundTransparency = 0.82 }):Play()
		end)
		Creator.AddSignal(Tab.Frame.MouseButton1Up, function()
			local t = Tab.Selected and 0.88 or 0.94
			TweenService:Create(PillBg, TI_NORM, { BackgroundTransparency = t }):Play()
		end)

		-- ── SetTransparency shim (SelectTab still calls this) ─
		Tab.Motor, Tab.SetTransparency = Creator.SpringMotor(1, Tab.Frame, "BackgroundTransparency")

		-- ── Click ─────────────────────────────────────────────
		Creator.AddSignal(Tab.Frame.MouseButton1Click, function()
			TabModule:SelectTab(TabIndex)
			TabModule.Callback(TabIndex)
		end)

		TabModule.Containers[TabIndex] = Tab.ContainerFrame
		TabModule.Tabs[TabIndex]       = Tab

		-- store appliers so SelectTab can call them
		Tab._applySelected   = applySelected
		Tab._applyUnselected = applyUnselected

		Tab.Container   = Tab.ContainerFrame
		Tab.ScrollFrame = Tab.Container

		function Tab:AddSection(SectionTitle)
			local Section = { Type = "Section" }
			local SectionFrame  = Components.Section(SectionTitle, Tab.Container)
			Section.Container   = SectionFrame.Container
			Section.ScrollFrame = Tab.Container
			setmetatable(Section, Elements)
			return Section
		end

		setmetatable(Tab, Elements)
		return Tab
	end

	function TabModule:GetCurrentTab()
		return self.SelectedTab
	end

	function TabModule:SelectTab(Tab)
		local Window = TabModule.Window

		TabModule.SelectedTab = Tab

		-- deselect all
		for _, TabObject in next, TabModule.Tabs do
			TabObject.Selected = false
			if TabObject._applyUnselected then
				TabObject._applyUnselected()
			else
				TabObject.SetTransparency(1)
			end
		end

		-- select target
		local target = TabModule.Tabs[Tab]
		target.Selected = true
		if target._applySelected then
			target._applySelected()
		else
			target.SetTransparency(0.89)
		end

		-- update header text + selector bar (existing window logic)
		Window.TabDisplay.Text = target.Name
		Window.SelectorPosMotor:setGoal(
			Flipper.Spring.new(TabModule:GetCurrentTabPos(), { frequency = 6 })
		)

		-- container swap animation (unchanged)
		task.spawn(function()
			Window.ContainerHolder.Parent = Window.ContainerAnim
			Window.ContainerPosMotor:setGoal(Flipper.Spring.new(15, { frequency = 10 }))
			Window.ContainerBackMotor:setGoal(Flipper.Spring.new(1,  { frequency = 10 }))
			task.wait(0.12)
			for _, Container in next, TabModule.Containers do
				Container.Visible = false
			end
			TabModule.Containers[Tab].Visible = true
			Window.ContainerPosMotor:setGoal(Flipper.Spring.new(0, { frequency = 5 }))
			Window.ContainerBackMotor:setGoal(Flipper.Spring.new(0, { frequency = 8 }))
			task.wait(0.12)
			Window.ContainerHolder.Parent = Window.ContainerCanvas
		end)
	end

	return TabModule
end)()
local Button = {}
Button.__index = Button

function Button.new(Config, Parent, Theme)
    local self = setmetatable({}, Button)
    
    self.Frame = New("TextButton", {
        Size = UDim2.new(1, 0, 0, 46),
        Parent = Parent,
        Text = "",
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(90, 90, 90),
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(0, 4),
        }),
        New("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Transparency = 0.65,
            Color = Color3.fromRGB(110, 110, 110),
        }),
        New("TextLabel", {
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
            Text = Config.Title or "Button",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Bottom,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0.5, 0),
            Position = UDim2.fromScale(0, 0),
        }),
        New("TextLabel", {
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
            Text = Config.Description or "",
            TextColor3 = Color3.fromRGB(200, 200, 200),
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Top,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0.5, 0),
            Position = UDim2.new(0, 0, 0.5, 2),
        })
    })

    self.Frame.MouseButton1Click:Connect(function()
        if Config.Callback then
            Config.Callback()
        end
    end)

    return self
end
Components.Dialog = (function()
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New

	local Dialog = {
		Window = nil,
	}

	function Dialog:Init(Window)
		Dialog.Window = Window
		return Dialog
	end

	function Dialog:Create()
		local NewDialog = {
			Buttons = 0,
		}

		NewDialog.TintFrame = New("TextButton", {
			Text = "",
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			Parent = Dialog.Window.Root,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
		})

		local TintMotor, TintTransparency = Creator.SpringMotor(1, NewDialog.TintFrame, "BackgroundTransparency", true)

		NewDialog.ButtonHolder = New("Frame", {
			Size = UDim2.new(1, -40, 1, -40),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundTransparency = 1,
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 10),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
			}),
		})

		NewDialog.ButtonHolderFrame = New("Frame", {
			Size = UDim2.new(1, 0, 0, 70),
			Position = UDim2.new(0, 0, 1, -70),
			ThemeTag = {
				BackgroundColor3 = "DialogHolder",
			},
		}, {
			New("Frame", {
				Size = UDim2.new(1, 0, 0, 1),
				ThemeTag = {
					BackgroundColor3 = "DialogHolderLine",
				},
			}),
			NewDialog.ButtonHolder,
		})

		NewDialog.Title = New("TextLabel", {
			FontFace = Font.new(
				"rbxasset://fonts/families/GothamSSm.json",
				Enum.FontWeight.SemiBold,
				Enum.FontStyle.Normal
			),
			Text = "Dialog",
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 22,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 22),
			Position = UDim2.fromOffset(20, 25),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			AutoLocalize = false,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		NewDialog.Scale = New("UIScale", {
			Scale = 1,
		})

		local ScaleMotor, Scale = Creator.SpringMotor(1.1, NewDialog.Scale, "Scale")

		NewDialog.Root = New("CanvasGroup", {
			Size = UDim2.fromOffset(300, 165),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			GroupTransparency = 1,
			Parent = NewDialog.TintFrame,
			ThemeTag = {
				BackgroundColor3 = "Dialog",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
			New("UIStroke", {
				Transparency = 0.5,
				ThemeTag = {
					Color = "DialogBorder",
				},
			}),
			NewDialog.Scale,
			NewDialog.Title,
			NewDialog.ButtonHolderFrame,
		})

		local RootMotor, RootTransparency = Creator.SpringMotor(1, NewDialog.Root, "GroupTransparency")

		function NewDialog:Open()
			Library.DialogOpen = true
			NewDialog.Scale.Scale = 1.1
			TintTransparency(0.75)
			RootTransparency(0)
			Scale(1)
		end

		function NewDialog:Close()
			Library.DialogOpen = false
			TintTransparency(1)
			RootTransparency(1)
			Scale(1.1)
			NewDialog.Root.UIStroke:Destroy()
			task.wait(0.15)
			NewDialog.TintFrame:Destroy()
		end

		function NewDialog:Button(Title, Callback)
			NewDialog.Buttons = NewDialog.Buttons + 1
			Title = Title or "Button"
			Callback = Callback or function() end

			local Button = Components.Button("", NewDialog.ButtonHolder, false)
			Button.Title.Text = Title

			for _, Btn in next, NewDialog.ButtonHolder:GetChildren() do
				if Btn:IsA("TextButton") then
					Btn.Size =
						UDim2.new(1 / NewDialog.Buttons, -(((NewDialog.Buttons - 1) * 10) / NewDialog.Buttons), 0, 32)
				end
			end

			Creator.AddSignal(Button.Frame.MouseButton1Click, function()
				Library:SafeCallback(Callback)
				pcall(function()
					NewDialog:Close()
				end)
			end)

			return Button
		end

		return NewDialog
	end

	return Dialog
end)()
Components.Notification = (function()
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New

	local Notification = {}

	function Notification:Init(GUI)
		Notification.Holder = New("Frame", {
			Position = UDim2.new(1, -30, 1, -30),
			Size = UDim2.new(0, 310, 1, -30),
			AnchorPoint = Vector2.new(1, 1),
			BackgroundTransparency = 1,
			Parent = GUI,
		}, {
			New("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, 20),
			}),
		})
	end

	function Notification:New(Config)
		Config.Title = Config.Title or "Title"
		Config.Content = Config.Content or "Content"
		Config.SubContent = Config.SubContent or ""
		Config.Duration = Config.Duration or nil
		Config.Buttons = Config.Buttons or {}
		local NewNotification = {
			Closed = false,
		}

		--NewNotification.AcrylicPaint = Acrylic.AcrylicPaint()

		NewNotification.Title = New("TextLabel", {
			Position = UDim2.new(0, 14, 0, 17),
			Text = Config.Title,
			RichText = true,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextTransparency = 0,
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			TextSize = 13,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			Size = UDim2.new(1, -12, 0, 12),
			TextWrapped = true,
			BackgroundTransparency = 1,
			AutoLocalize = false,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		NewNotification.ContentLabel = New("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			Text = Config.Content,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 14),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutoLocalize = false,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		NewNotification.SubContentLabel = New("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			Text = Config.SubContent,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 14),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutoLocalize = false,
			ThemeTag = {
				TextColor3 = "SubText",
			},
		})

		NewNotification.LabelHolder = New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(14, 40),
			Size = UDim2.new(1, -28, 0, 0),
		}, {
			New("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 3),
			}),
			NewNotification.ContentLabel,
			NewNotification.SubContentLabel,
		})

		NewNotification.CloseButton = New("TextButton", {
			Text = "",
			Position = UDim2.new(1, -14, 0, 13),
			Size = UDim2.fromOffset(20, 20),
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
		}, {
			New("ImageLabel", {
				Image = Components.Close,
				Size = UDim2.fromOffset(16, 16),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}),
		})

		NewNotification.Root = New("Frame", {
		    BackgroundTransparency = 0,
		    Size = UDim2.new(1, 0, 1, 0),
		    Position = UDim2.fromScale(1, 0),
		    ThemeTag = { BackgroundColor3 = "AcrylicMain" },
		}, {
		    New("UICorner", { CornerRadius = UDim.new(0, 8) }),
		    New("UIStroke", {
		        Transparency = 0.5,
		        ThemeTag = { Color = "AcrylicBorder" },
		    }),
		    NewNotification.Title,
		    NewNotification.CloseButton,
		    NewNotification.LabelHolder,
		})

		if Config.Content == "" then
			NewNotification.ContentLabel.Visible = false
		end

		if Config.SubContent == "" then
			NewNotification.SubContentLabel.Visible = false
		end

		NewNotification.Holder = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 200),
			Parent = Notification.Holder,
		}, {
			NewNotification.Root,
		})

		local RootMotor = Flipper.GroupMotor.new({
			Scale = 1,
			Offset = 60,
		})

		RootMotor:onStep(function(Values)
			NewNotification.Root.Position = UDim2.new(Values.Scale, Values.Offset, 0, 0)
		end)

		Creator.AddSignal(NewNotification.CloseButton.MouseButton1Click, function()
			NewNotification:Close()
		end)

		function NewNotification:Open()
			local ContentSize = NewNotification.LabelHolder.AbsoluteSize.Y
			NewNotification.Holder.Size = UDim2.new(1, 0, 0, 58 + ContentSize)

			RootMotor:setGoal({
				Scale = Spring(0, { frequency = 5 }),
				Offset = Spring(0, { frequency = 5 }),
			})
		end

		function NewNotification:Close()
			if not NewNotification.Closed then
				NewNotification.Closed = true
				task.spawn(function()
					RootMotor:setGoal({
						Scale = Spring(1, { frequency = 5 }),
						Offset = Spring(60, { frequency = 5 }),
					})
					task.wait(0.4)
					-- if Library.UseAcrylic then
					-- 	NewNotification.AcrylicPaint.Model:Destroy()
					-- end
					NewNotification.Holder:Destroy()
				end)
			end
		end

		NewNotification:Open()
		if Config.Duration then
			task.delay(Config.Duration, function()
				NewNotification:Close()
			end)
		end
		return NewNotification
	end

	return Notification
end)()
Components.Textbox = function(Parent, Acrylic)
	Acrylic = Acrylic or false
	local Textbox = {}

	Textbox.Input = New("TextBox", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		TextColor3 = Color3.fromRGB(200, 200, 200),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromOffset(10, 0),
		ThemeTag = {
			TextColor3 = "Text",
			PlaceholderColor3 = "SubText",
		},
	})

	Textbox.Container = New("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Position = UDim2.new(0, 6, 0, 0),
		Size = UDim2.new(1, -12, 1, 0),
	}, {
		Textbox.Input,
	})

	Textbox.Indicator = New("Frame", {
		Size = UDim2.new(1, -4, 0, 1),
		Position = UDim2.new(0, 2, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		BackgroundTransparency = Acrylic and 0.5 or 0,
		ThemeTag = {
			BackgroundColor3 = Acrylic and "InputIndicator" or "DialogInputLine",
		},
	})

	Textbox.Frame = New("Frame", {
		Size = UDim2.new(0, 0, 0, 30),
		BackgroundTransparency = 0,
		Parent = Parent,
		ThemeTag = {
			BackgroundColor3 = Acrylic and "Input" or "DialogInput",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),
		New("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Transparency = Acrylic and 0.5 or 0.65,
			ThemeTag = {
				Color = Acrylic and "InElementBorder" or "DialogButtonBorder",
			},
		}),
		Textbox.Indicator,
		Textbox.Container,
	})

	local function Update()
		local PADDING = 2
		local Reveal = Textbox.Container.AbsoluteSize.X

		if not Textbox.Input:IsFocused() or Textbox.Input.TextBounds.X <= Reveal - 2 * PADDING then
			Textbox.Input.Position = UDim2.new(0, PADDING, 0, 0)
		else
			local Cursor = Textbox.Input.CursorPosition
			if Cursor ~= -1 then
				local subtext = string.sub(Textbox.Input.Text, 1, Cursor - 1)
				local width = TextService:GetTextSize(
					subtext,
					Textbox.Input.TextSize,
					Textbox.Input.Font,
					Vector2.new(math.huge, math.huge)
				).X

				local CurrentCursorPos = Textbox.Input.Position.X.Offset + width
				if CurrentCursorPos < PADDING then
					Textbox.Input.Position = UDim2.fromOffset(PADDING - width, 0)
				elseif CurrentCursorPos > Reveal - PADDING - 1 then
					Textbox.Input.Position = UDim2.fromOffset(Reveal - width - PADDING - 1, 0)
				end
			end
		end
	end

	task.spawn(Update)

	Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("Text"), Update)
	Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("CursorPosition"), Update)

	Creator.AddSignal(Textbox.Input.Focused, function()
		Update()
		Textbox.Indicator.Size = UDim2.new(1, -2, 0, 2)
		Textbox.Indicator.Position = UDim2.new(0, 1, 1, 0)
		Textbox.Indicator.BackgroundTransparency = 0
		Creator.OverrideTag(Textbox.Frame, { BackgroundColor3 = Acrylic and "InputFocused" or "DialogHolder" })
		Creator.OverrideTag(Textbox.Indicator, { BackgroundColor3 = "InputIndicatorFocus" })
	end)

	Creator.AddSignal(Textbox.Input.FocusLost, function()
		Update()
		Textbox.Indicator.Size = UDim2.new(1, -4, 0, 1)
		Textbox.Indicator.Position = UDim2.new(0, 2, 1, 0)
		Textbox.Indicator.BackgroundTransparency = 0.5
		Creator.OverrideTag(Textbox.Frame, { BackgroundColor3 = Acrylic and "Input" or "DialogInput" })
		Creator.OverrideTag(Textbox.Indicator, { BackgroundColor3 = Acrylic and "InputIndicator" or "DialogInputLine" })
	end)

	return Textbox
end
Components.TitleBar = function(Config)
	local TitleBar = {}

	local function BarButton(TitleText, SubTitleText, Parent, Callback)
		local Button = { Callback = Callback or function() end }

		Button.Frame = New("TextButton", {
			Size             = UDim2.new(1, -20, 0, 46),
			AnchorPoint      = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 0.8,
			Parent           = Parent,
			Position         = UDim2.new(0.5, 0, 0.5, 0),
			Text             = "",
			ThemeTag         = { BackgroundColor3 = "Text" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 6) }),
			New("UIListLayout", {
				FillDirection       = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment   = Enum.VerticalAlignment.Center,
				SortOrder           = Enum.SortOrder.LayoutOrder,
				Padding             = UDim.new(0, 2),
			}),
			New("TextLabel", {
				Name                  = "Title",
				RichText              = true,
				Text                  = TitleText,
				FontFace              = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
				TextSize              = 13,
				TextXAlignment        = Enum.TextXAlignment.Center,
				TextYAlignment        = Enum.TextYAlignment.Center,
				Size                  = UDim2.new(1, 0, 0, 16),
				BackgroundTransparency = 1,
				AutoLocalize          = false,
				ThemeTag              = { TextColor3 = "Text" },
			}),
			New("TextLabel", {
				Name                  = "SubTitle",
				RichText              = true,
				Text                  = SubTitleText or "",
				FontFace              = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				TextSize              = 11,
				TextXAlignment        = Enum.TextXAlignment.Center,
				TextYAlignment        = Enum.TextYAlignment.Center,
				Size                  = UDim2.new(1, 0, 0, 14),
				BackgroundTransparency = 1,
				AutoLocalize          = false,
				ThemeTag              = { TextColor3 = "SubText" },
			}),
		})

		local Motor, SetTransparency = Creator.SpringMotor(1, Button.Frame, "BackgroundTransparency")
		AddSignal(Button.Frame.MouseEnter,        function() SetTransparency(0.92) end)
		AddSignal(Button.Frame.MouseLeave,        function() SetTransparency(1, true) end)
		AddSignal(Button.Frame.MouseButton1Down,  function() SetTransparency(0.95) end)
		AddSignal(Button.Frame.MouseButton1Up,    function() SetTransparency(0.92) end)
		AddSignal(Button.Frame.MouseButton1Click, Button.Callback)

		Button.SetCallback = function(Func) Button.Callback = Func end
		return Button
	end

	-- ── TitleBar frame (height 40) ────────────────────────────
	TitleBar.Frame = New("Frame", {
		Size             = UDim2.new(1, 0, 0, 40),
		BackgroundTransparency = 1,
		Parent           = Config.Parent,
	}, {
		-- ── Logo (20×20, vertically centered, left) ──────────
		New("ImageLabel", {
			Image            = "rbxassetid://9681970193",
			Size             = UDim2.fromOffset(20, 20),
			AnchorPoint      = Vector2.new(0, 0.5),
			Position         = UDim2.new(0, 14, 0.5, 0),    -- 14px from left, vcenter
			BackgroundTransparency = 1,
		}, {
			New("UIAspectRatioConstraint", {
				AspectRatio = 1,
				AspectType  = Enum.AspectType.FitWithinMaxSize,
			}),
		}),

		-- ── Title text (vcenter, after logo) ─────────────────
		New("TextLabel", {
			RichText         = true,
			Text             = Config.Title,
			FontFace         = Font.new(
				"rbxasset://fonts/families/GothamSSm.json",
				Enum.FontWeight.SemiBold,
				Enum.FontStyle.Normal
			),
			TextSize         = 13,
			TextXAlignment   = Enum.TextXAlignment.Left,
			TextYAlignment   = Enum.TextYAlignment.Center,
			-- ตำแหน่ง: logo 20px + gap 8px = offset 42
			Position         = UDim2.new(0, 42, 0, 0),
			Size             = UDim2.fromScale(0, 1),
			AutomaticSize    = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			AutoLocalize     = false,
			ThemeTag         = { TextColor3 = "Text" },
		}),

		-- ── Subtitle text (vcenter, after title) ─────────────
		-- เราคำนวณ offset ไม่ได้ตอน runtime เพราะ TextBounds
		-- ใช้ Frame ครอบแทน แล้วจัดใน UIListLayout แนวนอน
		New("Frame", {
			-- Frame นี้ใช้แค่จัด subtitle ให้อยู่หลัง title
			-- วางไว้ใน inner container ด้านล่าง
			Size             = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
		}),

		-- ── divider ───────────────────────────────────────────
		New("Frame", {
			BackgroundTransparency = 0.5,
			Size             = UDim2.new(1, 0, 0, 1),
			Position         = UDim2.new(0, 0, 1, 0),
			ThemeTag         = { BackgroundColor3 = "TitleBarLine" },
		}),

		-- ── Text row container (logo + title + subtitle inline) 
		-- ใช้ Frame + UIListLayout แทนที่จะวาง absolute
		-- (override frame ด้านบน — ใช้วิธีนี้แทน)
	})

	-- ── สร้าง text row ใหม่ใน TitleBar.Frame โดยใช้ UIListLayout ─
	-- ลบ children เดิมที่ไม่ใช้ออก แล้ว rebuild ด้วย approach นี้:
	--
	-- TitleBar.Frame structure จริง:
	--   [ImageLabel logo 25x25, vcenter absolute]
	--   [Frame textRow: UIListLayout horizontal, vcenter]
	--     [TextLabel title]
	--     [TextLabel subtitle dim]
	--   [Frame divider bottom]
	--   [BarButtons close/max/min]

	-- rebuild ด้วย clean approach
	TitleBar.Frame:ClearAllChildren()

	-- logo
	New("ImageLabel", {
		Image            = "rbxassetid://9681970193",
		Size             = UDim2.fromOffset(25, 25),
		AnchorPoint      = Vector2.new(0, 0.5),
		Position         = UDim2.new(0, 14, 0.5, 0),
		BackgroundTransparency = 1,
		Parent           = TitleBar.Frame,
	}, {
		New("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType  = Enum.AspectType.FitWithinMaxSize,
		}),
	})

	-- text row (title + subtitle horizontal, vcenter)
	New("Frame", {
		AnchorPoint      = Vector2.new(0, 0.5),
		Position         = UDim2.new(0, 42, 0.5, 0),   -- logo 20 + gap 8 + left 14 = 42
		Size             = UDim2.new(1, -160, 0, 16),   -- ลบพื้นที่ปุ่ม 3 อัน
		BackgroundTransparency = 1,
		Parent           = TitleBar.Frame,
	}, {
		New("UIListLayout", {
			Padding           = UDim.new(0, 6),
			FillDirection     = Enum.FillDirection.Horizontal,
			SortOrder         = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		New("TextLabel", {
			RichText         = true,
			Text             = Config.Title,
			FontFace         = Font.new(
				"rbxasset://fonts/families/GothamSSm.json",
				Enum.FontWeight.SemiBold,
				Enum.FontStyle.Normal
			),
			TextSize         = 13,
			TextXAlignment   = Enum.TextXAlignment.Left,
			TextYAlignment   = Enum.TextYAlignment.Center,
			Size             = UDim2.fromScale(0, 1),
			AutomaticSize    = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			AutoLocalize     = false,
			LayoutOrder      = 1,
			ThemeTag         = { TextColor3 = "Text" },
		}),
		New("TextLabel", {
			RichText         = true,
			Text             = Config.SubTitle or "",
			TextTransparency = 0.5,
			FontFace         = Font.new(
				"rbxasset://fonts/families/GothamSSm.json",
				Enum.FontWeight.SemiBold,
				Enum.FontStyle.Normal
			),
			TextSize         = 13,
			TextXAlignment   = Enum.TextXAlignment.Left,
			TextYAlignment   = Enum.TextYAlignment.Center,
			Size             = UDim2.fromScale(0, 1),
			AutomaticSize    = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			AutoLocalize     = false,
			LayoutOrder      = 2,
			ThemeTag         = { TextColor3 = "SubText" },
		}),
	})

	-- divider
	New("Frame", {
		BackgroundTransparency = 0.5,
		Size             = UDim2.new(1, 0, 0, 1),
		Position         = UDim2.new(0, 0, 1, 0),
		Parent           = TitleBar.Frame,
		ThemeTag         = { BackgroundColor3 = "TitleBarLine" },
	})

	return TitleBar
end

Components.Window = (function()
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New

	return function(Config)
		local Window = {
			Minimized = false,
			Maximized = false,
			Size = Config.Size,
			CurrentPos = 0,
			TabWidth = 0,
			Position = UDim2.fromOffset(
				Camera.ViewportSize.X / 2 - Config.Size.X.Offset / 2,
				Camera.ViewportSize.Y / 2 - Config.Size.Y.Offset / 2
			),
		}

		local Dragging, DragInput, MousePos, StartPos = false
		local Resizing, ResizePos = false
		local MinimizeNotif = false

		--Window.AcrylicPaint = Acrylic.AcrylicPaint()
		Window.TabWidth = Config.TabWidth

		local Selector = New("Frame", {
			Size = UDim2.fromOffset(4, 0),
			BackgroundColor3 = Color3.fromRGB(76, 194, 255),
			Position = UDim2.fromOffset(0, 17),
			AnchorPoint = Vector2.new(0, 0.5),
			ThemeTag = {
				BackgroundColor3 = "Accent",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 2),
			}),
		})

		local OFFSETY = 120

		local ResizeStartFrame = New("Frame", {
			Size = UDim2.fromOffset(20, 20),
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -20, 1, -20),
		})

		Window.TabHolder = New("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			CanvasSize = UDim2.fromScale(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 4),
			}),
		})

		local Icon = New("TextButton", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, Window.TabWidth, 0, Window.TabWidth),
			Position = UDim2.new(0, 12, 0, (Window.TabWidth/4)- 20),
			BorderSizePixel = 0
		}, {
			New("UIPadding", {
				PaddingBottom = UDim.new(0, 2),
				PaddingLeft = UDim.new(0, 2),
				PaddingRight = UDim.new(0, 2),
				PaddingTop = UDim.new(0, 2),
			}),
			New("ImageLabel", {
				Image = "rbxassetid://9681970193",
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
			}, {
				New("UIAspectRatioConstraint", {
					AspectRatio = 1,
					AspectType = Enum.AspectType.FitWithinMaxSize,
				})
			})
		})

		local OFFSETY = 0  -- tab list เริ่มใต้ titlebar ทันที

-- =========================
-- SEARCH TAB
-- =========================

Window.TabSearch = New("TextBox", {
Size = UDim2.new(0, Window.TabWidth, 0, 31),
Position = UDim2.new(0, 12, 0, 54),

BackgroundTransparency = 0,
BorderSizePixel = 0,

PlaceholderText = "",
Text = "",

TextColor3 = Color3.fromRGB(235, 235, 235),
TextSize = 12,

Font = Enum.Font.Gotham,
ClearTextOnFocus = false,
TextXAlignment = Enum.TextXAlignment.Left,
TextYAlignment = Enum.TextYAlignment.Center,

ZIndex = 20,

ThemeTag = {
BackgroundColor3 = "SearchTabColor",
},

}, {
New("UICorner", {
CornerRadius = UDim.new(0, 7),
}),

New("UIPadding", {
PaddingLeft = UDim.new(0, 28),
PaddingRight = UDim.new(0, 8),
}),

New("ImageLabel", {
Size = UDim2.new(0, 14, 0, 14),
Position = UDim2.new(0, -18, 0.5, -7),

BackgroundTransparency = 1,    
Image = "rbxassetid://8154282545",    
ImageColor3 = Color3.fromRGB(200, 200, 200),    
ImageTransparency = 0.5,    

ZIndex = 21,    
Active = false,

}),

New("TextLabel", {
Name = "SearchPlaceholder",

Size = UDim2.new(1, 0, 1, 0),    
Position = UDim2.new(0, 0, 0, 0),    

BackgroundTransparency = 1,    

Text = "Search...",    
TextColor3 = Color3.fromRGB(155, 155, 155),    
TextTransparency = 0.15,    
TextSize = 12,    
Font = Enum.Font.Gotham,    

TextXAlignment = Enum.TextXAlignment.Left,    
TextYAlignment = Enum.TextYAlignment.Center,    

ZIndex = 21,    
Active = false,

}),

})

local SearchPlaceholder = Window.TabSearch:FindFirstChild("SearchPlaceholder")

local function UpdateSearchPlaceholder()
if SearchPlaceholder then
SearchPlaceholder.Visible =
Window.TabSearch.Text == "" and
not Window.TabSearch:IsFocused()
end
end

local function GetTabText(Tab)
local Texts = {}

if Tab:IsA("TextButton")
or Tab:IsA("TextLabel")
or Tab:IsA("TextBox") then

if Tab.Text and Tab.Text ~= "" then    
    table.insert(Texts, Tab.Text)    
end

end

for _, Object in ipairs(Tab:GetDescendants()) do
if Object:IsA("TextButton")
or Object:IsA("TextLabel")
or Object:IsA("TextBox") then

if Object.Text and Object.Text ~= "" then    
        table.insert(Texts, Object.Text)    
    end    
end

end

return table.concat(Texts, " ")

end

local function SearchTabs()
if not Window.TabHolder then
return
end

local Query = string.lower(
tostring(Window.TabSearch.Text or "")
)

for _, Tab in ipairs(Window.TabHolder:GetChildren()) do
if Tab:IsA("GuiObject") then
if Query == "" then
Tab.Visible = true
else
local Text = string.lower(
GetTabText(Tab)
)

local Match =    
            string.find(    
                Text,    
                Query,    
                1,    
                true    
            ) ~= nil    

        Tab.Visible = Match    
    end    
end

end

end

Window.TabSearch.Focused:Connect(function()
if SearchPlaceholder then
SearchPlaceholder.Visible = false
end
end)

Window.TabSearch.FocusLost:Connect(function()
UpdateSearchPlaceholder()
end)

Window.TabSearch:GetPropertyChangedSignal("Text"):Connect(function()
UpdateSearchPlaceholder()
SearchTabs()
end)

UpdateSearchPlaceholder()

-- =========================
-- TAB FRAME
-- =========================

local TabFrame = New("Frame", {
Size = UDim2.new(0, Window.TabWidth, 1, -102),
Position = UDim2.new(0, 12, 0, 92),

BackgroundTransparency = 1,
ClipsDescendants = true,

}, {
Window.TabHolder,
Selector,
})

		Window.TabDisplay = New("TextLabel", {
			RichText         = true,
			Text             = "Tab",
			TextTransparency = 0,
			FontFace         = Font.new("rbxassetid://12187365364",
			                   Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
			TextSize         = 22,
			TextXAlignment   = Enum.TextXAlignment.Left,
			TextYAlignment   = Enum.TextYAlignment.Center,
			Size             = UDim2.new(1, -16, 0, 22),
			Position         = UDim2.fromOffset(Window.TabWidth + 26, 56),
			BackgroundTransparency = 1,
			AutoLocalize     = false,
			ThemeTag         = { TextColor3 = "Text" },
		})

		Window.ContainerHolder = New("Frame", {
			Size             = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
		})

		Window.ContainerAnim = New("CanvasGroup", {
			Size             = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
		})

		Window.ContainerCanvas = New("Frame", {
			Size             = UDim2.new(1, -Window.TabWidth - 32, 1, -102),
			Position         = UDim2.fromOffset(Window.TabWidth + 26, 90),
			BackgroundTransparency = 1,
		}, {
			Window.ContainerAnim,
			Window.ContainerHolder,
		})

		local AcrylicFrame = New("Frame", {
		    Size = UDim2.fromScale(1, 1),
		    ThemeTag = { BackgroundColor3 = "AcrylicMain" },
		}, {
		    New("UICorner", { CornerRadius = UDim.new(0, 8) }),
		})
		
		Window.AcrylicPaint = {
		    Frame = AcrylicFrame,
		    Model = nil,
		    AddParent = function() end,
		    SetVisibility = function() end,
		}
		
		Window.Root = New("Frame", {
    BackgroundTransparency = 1,
    Size = Window.Size,
    Position = Window.Position,
    Parent = Config.Parent,
}, {
    AcrylicFrame,

    Window.TabDisplay,
    Window.ContainerCanvas,

    Window.TabSearch,

    TabFrame,
    ResizeStartFrame,
})

		Window.TitleBar = Components.TitleBar({
			Title = Config.Title,
			SubTitle = Config.SubTitle,
			Parent = Window.Root,
			Window = Window,
		})

		if Library.UseAcrylic then
			Window.AcrylicPaint.AddParent(Window.Root)
		end

		local SizeMotor = Flipper.GroupMotor.new({
			X = Window.Size.X.Offset,
			Y = Window.Size.Y.Offset,
		})

		local PosMotor = Flipper.GroupMotor.new({
			X = Window.Position.X.Offset,
			Y = Window.Position.Y.Offset,
		})

		Window.SelectorPosMotor = Flipper.SingleMotor.new(17)
		Window.SelectorSizeMotor = Flipper.SingleMotor.new(0)
		Window.ContainerBackMotor = Flipper.SingleMotor.new(0)
		Window.ContainerPosMotor = Flipper.SingleMotor.new(94)

		SizeMotor:onStep(function(values)
			Window.Root.Size = UDim2.new(0, values.X, 0, values.Y)
		end)

		PosMotor:onStep(function(values)
			Window.Root.Position = UDim2.new(0, values.X, 0, values.Y)
		end)

		local LastValue = 0
		local LastTime = 0
		Window.SelectorPosMotor:onStep(function(Value)
			Selector.Position = UDim2.new(0, 0, 0, Value + 17)
			local Now = tick()
			local DeltaTime = Now - LastTime

			if LastValue ~= nil then
				Window.SelectorSizeMotor:setGoal(Spring((math.abs(Value - LastValue) / (DeltaTime * 60)) + 16))
				LastValue = Value
			end
			LastTime = Now
		end)

		Window.SelectorSizeMotor:onStep(function(Value)
			Selector.Size = UDim2.new(0, 4, 0, Value)
		end)

		Window.ContainerBackMotor:onStep(function(Value)
			Window.ContainerAnim.GroupTransparency = Value
		end)

		Window.ContainerPosMotor:onStep(function(Value)
			Window.ContainerAnim.Position = UDim2.fromOffset(0, Value)
		end)

		local OldSizeX
		local OldSizeY
		Window.Maximize = function(Value, NoPos, Instant)
			Window.Maximized = Value
			Window.TitleBar.MaxButton.Frame.Icon.Image = Value and Components.Assets.Restore or Components.Assets.Max

			if Value then
				OldSizeX = Window.Size.X.Offset
				OldSizeY = Window.Size.Y.Offset
			end
			local SizeX = Value and Camera.ViewportSize.X or OldSizeX
			local SizeY = Value and Camera.ViewportSize.Y or OldSizeY
			SizeMotor:setGoal({
				X = Flipper[Instant and "Instant" or "Spring"].new(SizeX, { frequency = 6 }),
				Y = Flipper[Instant and "Instant" or "Spring"].new(SizeY, { frequency = 6 }),
			})
			Window.Size = UDim2.fromOffset(SizeX, SizeY)

			if not NoPos then
				PosMotor:setGoal({
					X = Spring(Value and 0 or Window.Position.X.Offset, { frequency = 6 }),
					Y = Spring(Value and 0 or Window.Position.Y.Offset, { frequency = 6 }),
				})
			end
		end

		Creator.AddSignal(Window.TitleBar.Frame.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Dragging = true
				MousePos = Input.Position
				StartPos = Window.Root.Position

				if Window.Maximized then
					StartPos = UDim2.fromOffset(
						Mouse.X - (Mouse.X * ((OldSizeX - 100) / Window.Root.AbsoluteSize.X)),
						Mouse.Y - (Mouse.Y * (OldSizeY / Window.Root.AbsoluteSize.Y))
					)
				end

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)

		Creator.AddSignal(Window.TitleBar.Frame.InputChanged, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseMovement
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = Input
			end
		end)

		Creator.AddSignal(ResizeStartFrame.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Resizing = true
				ResizePos = Input.Position
			end
		end)

		Creator.AddSignal(UserInputService.InputChanged, function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				Window.Position = UDim2.fromOffset(StartPos.X.Offset + Delta.X, StartPos.Y.Offset + Delta.Y)
				PosMotor:setGoal({
					X = Instant(Window.Position.X.Offset),
					Y = Instant(Window.Position.Y.Offset),
				})

				if Window.Maximized then
					Window.Maximize(false, true, true)
				end
			end

			if
				(Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)
				and Resizing
			then
				local Delta = Input.Position - ResizePos
				local StartSize = Window.Size

				local TargetSize = Vector3.new(StartSize.X.Offset, StartSize.Y.Offset, 0) + Vector3.new(1, 1, 0) * Delta
				local TargetSizeClamped =
					Vector2.new(math.clamp(TargetSize.X, 470, 2048), math.clamp(TargetSize.Y, 380, 2048))

				SizeMotor:setGoal({
					X = Flipper.Instant.new(TargetSizeClamped.X),
					Y = Flipper.Instant.new(TargetSizeClamped.Y),
				})
			end
		end)

		Creator.AddSignal(UserInputService.InputEnded, function(Input)
			if Resizing == true or Input.UserInputType == Enum.UserInputType.Touch then
				Resizing = false
				Window.Size = UDim2.fromOffset(SizeMotor:getValue().X, SizeMotor:getValue().Y)
			end
		end)

		Creator.AddSignal(Window.TabHolder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
			Window.TabHolder.CanvasSize = UDim2.new(0, 0, 0, Window.TabHolder.UIListLayout.AbsoluteContentSize.Y)
		end)

		Creator.AddSignal(UserInputService.InputBegan, function(Input)
			if
				type(Library.MinimizeKeybind) == "table"
				and Library.MinimizeKeybind.Type == "Keybind"
				and not UserInputService:GetFocusedTextBox()
			then
				if Input.KeyCode.Name == Library.MinimizeKeybind.Value then
					Window:Minimize()
				end
			elseif Input.KeyCode == Library.MinimizeKey and not UserInputService:GetFocusedTextBox() then
				Window:Minimize()
			end
		end)

		function Window:ToggleInterface()
			Window.Minimized = not Window.Minimized
			Window.Root.Visible = not Window.Minimized
		end

		function Window:Minimize()
			Window.Minimized = not Window.Minimized
			Window.Root.Visible = not Window.Minimized
			if not MinimizeNotif then
				MinimizeNotif = true
				local Key = Library.MinimizeKeybind and Library.MinimizeKeybind.Value or Library.MinimizeKey.Name
				Library:Notify({
					Title = "Interface",
					Content = "Press " .. Key .. " to toggle the interface.",
					Duration = 6
				})
			end
			--pcall(SwapIco)
		end

		function Window:Destroy()
			-- if Library.UseAcrylic then
			-- 	Window.AcrylicPaint.Model:Destroy()
			-- end
			Window.Root:Destroy()
		end

		local DialogModule = Components.Dialog:Init(Window)
		function Window:Dialog(Config)
			local Dialog = DialogModule:Create()
			Dialog.Title.Text = Config.Title

			local Content = New("TextLabel", {
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
				Text = Config.Content,
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				Size = UDim2.new(1, -40, 1, 0),
				Position = UDim2.fromOffset(20, 60),
				BackgroundTransparency = 1,
				Parent = Dialog.Root,
				ClipsDescendants = false,
				AutoLocalize = false,
				ThemeTag = {
					TextColor3 = "Text",
				},
			})

			New("UISizeConstraint", {
				MinSize = Vector2.new(300, 165),
				MaxSize = Vector2.new(620, math.huge),
				Parent = Dialog.Root,
			})

			Dialog.Root.Size = UDim2.fromOffset(Content.TextBounds.X + 40, 165)
			if Content.TextBounds.X + 40 > Window.Size.X.Offset - 120 then
				Dialog.Root.Size = UDim2.fromOffset(Window.Size.X.Offset - 120, 165)
				Content.TextWrapped = true
				Dialog.Root.Size = UDim2.fromOffset(Window.Size.X.Offset - 120, Content.TextBounds.Y + 150)
			end

			for _, Button in next, Config.Buttons do
				Dialog:Button(Button.Title, Button.Callback)
			end

			Dialog:Open()
		end

		local TabModule = Components.Tab:Init(Window)
Window._SearchTabs = {}
		function Window:AddTab(TabConfig)
    local Tab = TabModule:New(
        TabConfig.Title,
        TabConfig.Icon,
        Window.TabHolder
    )

    table.insert(Window._SearchTabs, {
        Object = Tab,
        Name = string.lower(tostring(TabConfig.Title or "")),
    })

    return Tab
end

		function Window:GetCurrentTab()
			return TabModule:GetCurrentTab()
		end

		function Window:TabChanged(func)
			TabModule.Callback = func
		end

		function Window:SelectTab(Tab)
			TabModule:SelectTab(Tab)
		end

		Creator.AddSignal(Window.TabHolder:GetPropertyChangedSignal("CanvasPosition"), function()
			LastValue = TabModule:GetCurrentTabPos() + 16
			LastTime = 0
			Window.SelectorPosMotor:setGoal(Instant(TabModule:GetCurrentTabPos()))
		end)

		return Window
	end
end)()

local ElementsTable = {}

ElementsTable.Button = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Button"

	function Element:New(Config)
		assert(Config.Title, "Button - Missing Title")
		Config.Callback = Config.Callback or function() end

		local Button = {
			Callback = Config.Callback,
		}

		local FlashTween

		Button.Title = New("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			Text = Config.Title,
			TextColor3 = Color3.fromRGB(200, 200, 200),
			TextSize = 14,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -20, 0, 18),
			Position = UDim2.new(0, 10, 0, 2),
			AutoLocalize = false,
			ZIndex = 3,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		Button.Desc = New("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			Text = Config.Description or "",
			TextColor3 = Color3.fromRGB(160, 160, 160),
			TextSize = 11,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -20, 0, 14),
			Position = UDim2.new(0, 10, 0, 20),
			AutoLocalize = false,
			ZIndex = 3,
			ThemeTag = {
				TextColor3 = "SubText",
			},
		})

		Button.HoverFrame = New("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			ThemeTag = {
				BackgroundColor3 = "Hover",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		Button.Frame = New("TextButton", {
			Size = UDim2.new(1, 0, 0, 36),
			Parent = self.Container,
			LayoutOrder = 7,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 1,
			ThemeTag = {
				BackgroundColor3 = "DialogButton",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),

			New("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Transparency = 0.65,
				ThemeTag = {
					Color = "DialogButtonBorder",
				},
			}),

			Button.HoverFrame,
			Button.Title,
			Button.Desc,
		})

		Creator.AddSignal(Button.Frame.MouseEnter, function()
			if FlashTween then
				FlashTween:Cancel()
				FlashTween = nil
			end

			Button.HoverFrame.BackgroundTransparency = 0.9
		end)

		Creator.AddSignal(Button.Frame.MouseLeave, function()
			if FlashTween then
				FlashTween:Cancel()
			end

			FlashTween = TweenService:Create(
				Button.HoverFrame,
				TweenInfo.new(
					0.12,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundTransparency = 1
				}
			)

			FlashTween:Play()
		end)

		Creator.AddSignal(Button.Frame.MouseButton1Click, function()
			Library:SafeCallback(Button.Callback)
		end)

		Button.SetCallback = function(Func)
			Button.Callback = Func
		end

		Button.SetTitle = function(Text)
			Button.Title.Text = Text
		end

		Button.SetDesc = function(Text)
			Button.Desc.Text = Text or ""
		end

		return Button
	end

	return Element
end)()
ElementsTable.Toggle = (function()
local Element = {}
Element.__index = Element
Element.__type = "Toggle"

function Element:New(Idx, Config)  
	assert(Config.Title, "Toggle - Missing Title")  

	local Toggle = {  
		OriginalTitle = Config.Title,  
		OriginalDesc = Config.Description,  
		Value = Config.Default or false,  
		Callback = Config.Callback or function(Value) end,  
		Type = "Toggle",  
	}  

	local ToggleFrame = Components.Element(  
		Config.Title,  
		Config.Description,  
		self.Container,  
		true,  
		Config  
	)  

	ToggleFrame.DescLabel.Size = UDim2.new(1, -54, 0, 14)  

	Toggle.SetTitle = ToggleFrame.SetTitle  
	Toggle.AddText = ToggleFrame.AddText  
	Toggle.SetDesc = ToggleFrame.SetDesc  
	Toggle.Visible = ToggleFrame.Visible  
	Toggle.GetOriginalText = ToggleFrame.GetOriginalText  
	Toggle.Elements = ToggleFrame  

	local Check = New("Frame", {  
		Size = UDim2.fromOffset(21, 21),  
		AnchorPoint = Vector2.new(1, 0.5),  
		Position = UDim2.new(1, -10, 0.5, 0),  
		BackgroundColor3 = Color3.fromRGB(75, 75, 75),  
		BackgroundTransparency = 0,  
		BorderSizePixel = 0,  
		Parent = ToggleFrame.Frame,  
	}, {  
		New("UICorner", {  
			CornerRadius = UDim.new(1, 0)  
		})  
	})  

	local CheckFill = New("Frame", {  
		AnchorPoint = Vector2.new(0.5, 0.5),  
		Position = UDim2.new(0.5, 0, 0.5, 0),  
		Size = UDim2.fromOffset(0, 0),  
		BackgroundColor3 = Color3.fromRGB(80, 210, 255),  
		BackgroundTransparency = 0,  
		BorderSizePixel = 0,  
		Parent = Check,  
		ThemeTag = {  
			BackgroundColor3 = "ToggleToggled",  
		},  
	}, {  
		New("UICorner", {  
			CornerRadius = UDim.new(1, 0)  
		})  
	})  

	local Icon = New("ImageLabel", {  
		AnchorPoint = Vector2.new(0.5, 0.5),  
		Position = UDim2.new(0.5, 0, 0.5, 0),  
		Size = UDim2.fromOffset(0, 0),  
		BackgroundTransparency = 1,  
		Image = "rbxassetid://73386528985648",  
		ImageColor3 = Color3.fromRGB(75, 75, 75),  
		ImageTransparency = 0,  
		Parent = CheckFill,  
	}, {})  

	Check.ZIndex = 100  
	CheckFill.ZIndex = 101  
	Icon.ZIndex = 102  

	local TI = TweenInfo.new(  
		0.08,  
		Enum.EasingStyle.Quad,  
		Enum.EasingDirection.Out  
	)  

	local PressTI = TweenInfo.new(  
		0.04,  
		Enum.EasingStyle.Quad,  
		Enum.EasingDirection.Out  
	)  

	local CurrentPressTween  
	local Pressed = false  

	local function applyOff()  
		if CurrentPressTween then  
			CurrentPressTween:Cancel()  
			CurrentPressTween = nil  
		end  

		TweenService:Create(  
			CheckFill,  
			TI,  
			{  
				Size = UDim2.fromOffset(0, 0)  
			}  
		):Play()  

		TweenService:Create(  
			Icon,  
			TI,  
			{  
				Size = UDim2.fromOffset(0, 0)  
			}  
		):Play()  

		TweenService:Create(  
			Check,  
			TI,  
			{  
				Size = UDim2.fromOffset(21, 21)  
			}  
		):Play()  
	end  

	local function applyOn()  
		if CurrentPressTween then  
			CurrentPressTween:Cancel()  
			CurrentPressTween = nil  
		end  

		TweenService:Create(  
			Check,  
			TI,  
			{  
				Size = UDim2.fromOffset(21, 21)  
			}  
		):Play()  

		TweenService:Create(  
			CheckFill,  
			TI,  
			{  
				Size = UDim2.fromOffset(18, 18)  
			}  
		):Play()  

		TweenService:Create(  
			Icon,  
			TI,  
			{  
				Size = UDim2.new(1, -5, 1, -5)  
			}  
		):Play()  
	end  

	local function pressAnimation()  
		if Toggle.Value then  
			return  
		end  

		if CurrentPressTween then  
			CurrentPressTween:Cancel()  
			CurrentPressTween = nil  
		end  

		Pressed = true  

		CurrentPressTween = TweenService:Create(  
			Check,  
			PressTI,  
			{  
				Size = UDim2.fromOffset(18, 18)  
			}  
		)  

		CurrentPressTween:Play()  
	end  

	local function releaseAnimation()  
		if CurrentPressTween then  
			CurrentPressTween:Cancel()  
			CurrentPressTween = nil  
		end  

		Pressed = false  

		if Toggle.Value then  
			return  
		end  

		TweenService:Create(  
			Check,  
			PressTI,  
			{  
				Size = UDim2.fromOffset(21, 21)  
			}  
		):Play()  
	end  

	function Toggle:OnChanged(Func)  
		Toggle.Changed = Func  
		Func(Toggle.Value)  
	end  

	function Toggle:SetValue(Value)  
		Value = not not Value  
		Toggle.Value = Value  

		if Value then  
			applyOn()  
		else  
			if CurrentPressTween then  
				CurrentPressTween:Cancel()  
				CurrentPressTween = nil  
			end  

			CurrentPressTween = TweenService:Create(  
				Check,  
				PressTI,  
				{  
					Size = UDim2.fromOffset(18, 18)  
				}  
			)  
			CurrentPressTween:Play()  

			task.delay(0.04, function()  
				if not Toggle.Value then  
					applyOff()  
				end  
			end)  
		end  

		Library:SafeCallbackToggles(  
			Config.Title,  
			Toggle.Callback,  
			Toggle.Value  
		)  

		Library:SafeCallbackToggles(  
			Config.Title,  
			Toggle.Changed,  
			Toggle.Value  
		)  
	end  

	function Toggle:GetValue()  
		return self.Value  
	end  

	function Toggle:Destroy()  
		ToggleFrame:Destroy()  
		Library.Options[Idx] = nil  
	end  

	Creator.AddSignal(  
		ToggleFrame.Frame.MouseButton1Down,  
		function()  
			pressAnimation()  
		end  
	)  

	Creator.AddSignal(  
		ToggleFrame.Frame.MouseButton1Up,  
		function()  
			releaseAnimation()  
		end  
	)  

	Creator.AddSignal(  
		ToggleFrame.Frame.MouseButton1Click,  
		function()  
			Toggle:SetValue(not Toggle.Value)  
		end  
	)  

	Toggle:SetValue(Toggle.Value)  

	Library.Options[Idx] = Toggle  

	return Toggle  
end  

return Element

end)()
ElementsTable.Dropdown = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Dropdown"

	function Element:New(Idx, Config)

		local Dropdown = {
			Values = Config.Values,
			Value = Config.Default,
			Multi = Config.Multi,
			Buttons = {},
			Opened = false,
			Type = "Dropdown",
			Callback = Config.Callback or function() end,
			Searchable = Config.Searchable or false,
			-- Lazy loading properties
			LoadedItems = 0,
			BatchSize = 20, -- จำนวน items ที่โหลดต่อครั้ง
			IsLoadingBatch = false
		}

		if Dropdown.Multi and Config.AllowNull then
			Dropdown.Value = {}
		end

		local DropdownFrame = Components.Element(Config.Title, Config.Description, self.Container, false, Config)
		DropdownFrame.DescLabel.Size = UDim2.new(1, -170, 0, 14)

		Dropdown.SetTitle = DropdownFrame.SetTitle
		Dropdown.SetDesc = DropdownFrame.SetDesc
		Dropdown.Visible = DropdownFrame.Visible
		Dropdown.Elements = DropdownFrame

				local DropdownDisplay = New("TextBox", {
			FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json",
			                           Enum.FontWeight.Regular, Enum.FontStyle.Normal),
			Text            = "",
			PlaceholderText = "...",
			PlaceholderColor3 = Color3.fromRGB(200, 200, 200),
			TextColor3      = Color3.fromRGB(240, 240, 240),
			TextSize        = 13,
			AutomaticSize   = Enum.AutomaticSize.Y,
			TextYAlignment  = Enum.TextYAlignment.Center,
			TextXAlignment  = Enum.TextXAlignment.Left,
			Size            = UDim2.new(1, Dropdown.Multi and -26 or -20, 0.5, 0),
			Position        = UDim2.new(0, 6, 0.5, 0),
			AnchorPoint     = Vector2.new(0, 0.5),
			BackgroundTransparency = 1,
			TextTruncate    = Enum.TextTruncate.AtEnd,
			Interactable    = false,
			AutoLocalize    = false,
			ThemeTag        = { TextColor3 = "Text", PlaceholderColor3 = "SubText" },
		})

		-- chevron icon (right side)
		local DropdownIco = New("ImageLabel", {
			Image           = "rbxassetid://10709790948",
			Size            = UDim2.fromOffset(14, 14),
			AnchorPoint     = Vector2.new(1, 0.5),
			Position        = UDim2.new(1, -4, 0.5, 0),
			BackgroundTransparency = 1,
			Rotation        = 90,
			ThemeTag        = { ImageColor3 = "SubText" },
		})

		-- underline (bottom border only — no box)
		local DropdownUnderline = New("Frame", {
			Size            = UDim2.new(1, 0, 0, 1),
			AnchorPoint     = Vector2.new(0, 1),
			Position        = UDim2.new(0, 0, 1, 0),
			BackgroundTransparency = 0.5,
			ThemeTag        = { BackgroundColor3 = "InElementBorder" },
		})

		local DropdownInner = New("TextButton", {
			Size            = UDim2.fromOffset(160, 28),
			Position        = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint     = Vector2.new(1, 0.5),
			BackgroundTransparency = 0.9,
			Parent          = DropdownFrame.Frame,
			AutoLocalize    = false,
			ThemeTag        = { BackgroundColor3 = "DropdownFrame" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 10) }),
			DropdownIco,
			DropdownDisplay,
		})

		-- focus/open: underline brightens
		local TI_UL = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		Creator.AddSignal(DropdownInner.MouseEnter, function()
			TweenService:Create(DropdownUnderline, TI_UL, { BackgroundTransparency = 0.2 }):Play()
		end)
		Creator.AddSignal(DropdownInner.MouseLeave, function()
			TweenService:Create(DropdownUnderline, TI_UL, {
				BackgroundTransparency = Dropdown.Opened and 0 or 0.5
			}):Play()
		end)

		-- เพิ่ม hover effect สำหรับ dropdown
		local DropdownHoverMotor, SetDropdownHover = Creator.SpringMotor(0.9, DropdownInner, "BackgroundTransparency")
		Creator.AddSignal(DropdownInner.MouseEnter, function()
			SetDropdownHover(0.8)
		end)
		Creator.AddSignal(DropdownInner.MouseLeave, function()
			SetDropdownHover(0.9)
		end)

		-- เพิ่ม hover effect สำหรับ clear button
		if ClearButton then
			local ClearHoverMotor, SetClearHover = Creator.SpringMotor(0.15, ClearButton, "BackgroundTransparency")
			Creator.AddSignal(ClearButton.MouseEnter, function()
				SetClearHover(0.05)
				-- เพิ่ม scale effect
				TweenService:Create(ClearButton, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
					Size = UDim2.fromOffset(32, 32)
				}):Play()
			end)
			Creator.AddSignal(ClearButton.MouseLeave, function()
				SetClearHover(0.15)
				-- คืนขนาดเดิม
				TweenService:Create(ClearButton, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
					Size = UDim2.fromOffset(30, 30)
				}):Play()
			end)
			Creator.AddSignal(ClearButton.MouseButton1Down, function()
				SetClearHover(0.0)
				-- เพิ่ม press effect
				TweenService:Create(ClearButton, TweenInfo.new(0.1, Enum.EasingStyle.Quart), {
					Size = UDim2.fromOffset(28, 28)
				}):Play()
			end)
			Creator.AddSignal(ClearButton.MouseButton1Up, function()
				SetClearHover(0.05)
				TweenService:Create(ClearButton, TweenInfo.new(0.1, Enum.EasingStyle.Quart), {
					Size = UDim2.fromOffset(32, 32)
				}):Play()
			end)

			-- ฟังก์ชันล้างค่าทั้งหมด
			Creator.AddSignal(ClearButton.MouseButton1Click, function()
				if Dropdown.Multi then
					Dropdown.Value = {}
					for _, Button in next, Dropdown.Buttons do
						Button:UpdateButton()
					end
					Dropdown:Display()
					-- ปิด dropdown หลังล้างค่า
					Dropdown:Close()
					Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
					Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
				end
			end)
		end

		local DropdownListLayout = New("UIListLayout", {
			Padding = UDim.new(0, 10), -- เพิ่ม padding
		})

		local DropdownScrollFrame = New("ScrollingFrame", {
			Size = UDim2.new(1, -8, 1, -12), -- ปรับขนาด
			Position = UDim2.fromOffset(6, 6), -- ปรับตำแหน่ง
			BackgroundTransparency = 1,
			BottomImage = "rbxassetid://6889812791",
			MidImage = "rbxassetid://6889812721",
			TopImage = "rbxassetid://6276641225",
			ScrollBarImageColor3 = Color3.fromRGB(120, 120, 120),
			ScrollBarImageTransparency = 0.6,
			ScrollBarThickness = 6,
			BorderSizePixel = 0,
			CanvasSize = UDim2.fromScale(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
		}, {
			DropdownListLayout,
		})

		local DropdownHolderFrame = New("Frame", {
		    Size             = UDim2.fromScale(1, 0.6),
		    ThemeTag         = { BackgroundColor3 = "DropdownHolder" },
		}, {
		    New("UICorner", {
		        CornerRadius = UDim.new(0, 20),
		    }),
		    New("UIStroke", {
		        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		        Transparency    = 0.5,
		        ThemeTag        = { Color = "InElementBorder" },
		    }),
		    DropdownScrollFrame,
		})

		local DropdownHolderCanvas = New("Frame", {
		    BackgroundTransparency = 1,
		    Size             = UDim2.fromOffset(170, 300),
		    Parent           = Library.GUI,
		    Visible          = false,
		}, {
			DropdownHolderFrame,
			New("UISizeConstraint", {
				MinSize = Vector2.new(170, 0),
			}),
		})

		-- Loading indicator frame with better styling
		local LoadingIndicator = New("Frame", {
			Size = UDim2.new(1, -5, 0, 35),
			BackgroundColor3 = Color3.fromRGB(50, 50, 60),
			BackgroundTransparency = 0.7,
			Parent = DropdownScrollFrame,
			Name = "LoadingIndicator",
			Visible = false,
		}, {
			New("TextLabel", {
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
				Text = "📦 Loading more items...",
				TextColor3 = Color3.fromRGB(150, 150, 150),
				TextSize = 12,
				TextXAlignment = Enum.TextXAlignment.Center,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AutoLocalize = false,
			}),
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
		})
 
		-- SEARCHABLE BOX with enhanced styling --

		local Border = New("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(100, 100, 120),
			Transparency = 0.3,
			Thickness = 1.5,
			ThemeTag = {
				Color = "ElementBorder",
			},
		})

		local searchIcon = New("ImageLabel", {
			Image = "rbxassetid://10734943674",
			Size = UDim2.fromOffset(18, 18),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 8, 0.5, 0),
			BackgroundTransparency = 1,
			Rotation = 0,
			ThemeTag = {
				ImageColor3 = "SubText",
			},
		})

		local SearchBase = New("Frame", {
			Visible = false,
			Size = UDim2.new(0, 170, 0, 35), -- เพิ่มความสูง
			Parent = Library.GUI,
			AutomaticSize = Enum.AutomaticSize.Y,
			ThemeTag = {
				BackgroundColor3 = "DropdownHolder",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8), -- เพิ่มขนาด corner
			}),
			searchIcon,
			Border,
		})

		-- เพิ่ม gradient effect สำหรับ search box
		local SearchGradient = New("UIGradient", {
			Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(1.0, Color3.fromRGB(240, 240, 250))
			},
			Rotation = 45,
			Transparency = NumberSequence.new{
				NumberSequenceKeypoint.new(0.0, 0.95),
				NumberSequenceKeypoint.new(1.0, 0.98)
			},
			Parent = SearchBase,
		})

        local DropdownSearch = New("TextBox", {
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
			Text = "",
			PlaceholderText = "🔍 Search...",
			PlaceholderColor3 = Color3.fromRGB(180, 180, 190),
            Parent = SearchBase,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 14,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, -30, 1, -4),
			Position = UDim2.new(0, 30, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			LayoutOrder = 7,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Interactable = true,
			AutoLocalize = false,
			ThemeTag = {
				TextColor3 = "Text",
				PlaceholderColor3 = "SubText"
			},
		})

		-- เพิ่ม focus effect สำหรับ search box
		local SearchFocusMotor, SetSearchFocus = Creator.SpringMotor(0.3, Border, "Transparency")
		Creator.AddSignal(DropdownSearch.Focused, function()
			SetSearchFocus(0.1)
		end)
		Creator.AddSignal(DropdownSearch.FocusLost, function()
			SetSearchFocus(0.3)
		end)

		table.insert(Library.OpenFrames, DropdownHolderCanvas)

        local XADD = 195
        local DEFAULT_Y_OFFSET_WITH_OBJ = -5
        local DEFAULT_Y_OFFSET_WITHOUT_OBJ = 18
        local MAX_DROPDOWN_ITEMS = 5

        local MoveList = {
            { Instance = DropdownHolderCanvas, YOffset = 35}, -- no custom offset
            { Instance = SearchBase, YOffset = 0 }, -- custom Y offset
            { Instance = ClearButton, YOffset = 0, XOffset = 175 }, -- Clear button ข้างๆ search
        }

        local function RecalculateListPosition()
            local Add = 0
            local availableSpace = Camera.ViewportSize.Y - DropdownInner.AbsolutePosition.Y
            local neededSpace = DropdownHolderCanvas.AbsoluteSize.Y - 5

            if availableSpace < neededSpace then
                Add = neededSpace - availableSpace + 40
            end

            local defaultYOffset = (DEFAULT_Y_OFFSET_WITH_OBJ - Add) or DEFAULT_Y_OFFSET_WITHOUT_OBJ
            local baseX = DropdownInner.AbsolutePosition.X - 1 + XADD
            local baseY = DropdownInner.AbsolutePosition.Y + defaultYOffset

            for _, entry in ipairs(MoveList) do
                local inst = entry.Instance
                if inst then -- เช็คว่า instance มีอยู่จริง
                    local xOffset = entry.XOffset or 0
                    local yOffset = entry.YOffset or 0

                    inst.Position = UDim2.fromOffset(baseX + xOffset, baseY + yOffset)
                end
            end
        end

		local ListSizeX = 0
		local function RecalculateListSize()
			if #Dropdown.Values > MAX_DROPDOWN_ITEMS then
				DropdownHolderCanvas.Size = UDim2.fromOffset(ListSizeX, (42 * MAX_DROPDOWN_ITEMS) - 10) -- ปรับขนาดตาม item ที่ใหญ่ขึ้น
			else
				DropdownHolderCanvas.Size = UDim2.fromOffset(ListSizeX, DropdownListLayout.AbsoluteContentSize.Y + 30)
			end
		end

		local function RecalculateCanvasSize()
			-- คำนวณ canvas size จากจำนวน items ที่โหลดแล้ว + พื้นที่สำหรับ loading indicator
			local loadedItems = Dropdown.LoadedItems
			local totalItems = #Dropdown.Values
			local itemHeight = 36 -- เพิ่มขนาด item
			local itemPadding = 4
			
			-- ขนาดของ items ที่โหลดแล้ว
			local loadedHeight = loadedItems * itemHeight + math.max(0, loadedItems - 1) * itemPadding
			
			-- เพิ่มพื้นที่สำหรับ loading indicator ถ้ายังโหลดไม่หมด
			if loadedItems < totalItems then
				loadedHeight = loadedHeight + 45 -- พื้นที่สำหรับ loading indicator + trigger zone
			end
			
			DropdownScrollFrame.CanvasSize = UDim2.fromOffset(0, loadedHeight)
		end

		RecalculateListPosition()
		RecalculateListSize()

		Creator.AddSignal(DropdownInner:GetPropertyChangedSignal("AbsolutePosition"), RecalculateListPosition)

		-- Scroll detection for lazy loading
		Creator.AddSignal(DropdownScrollFrame:GetPropertyChangedSignal("CanvasPosition"), function()
			if not Dropdown.Opened or Dropdown.IsLoadingBatch then return end
			
			local scrollFrame = DropdownScrollFrame
			local scrollPosition = scrollFrame.CanvasPosition.Y
			local scrollFrameHeight = scrollFrame.AbsoluteSize.Y
			local canvasHeight = scrollFrame.CanvasSize.Y.Offset
			
			-- เช็คว่า scroll ถึงใกล้ท้ายแล้วมั้ย (เหลือ 50 pixels จาก content จริง)
			if scrollPosition + scrollFrameHeight >= canvasHeight - 50 and Dropdown.LoadedItems < #Dropdown.Values then
				Dropdown:LoadNextBatch()
			end
		end)

		Creator.AddSignal(DropdownSearch:GetPropertyChangedSignal("Text"), function()
			local Text = DropdownSearch.Text
			if #Text == 0 then
				for _, Element in next, DropdownScrollFrame:GetChildren() do
					if not Element:IsA("UIListLayout") and Element.Name ~= "LoadingIndicator" then
						local Value = Element.ButtonLabel.Text
						local Similar = Value:lower():match(Text:lower()) or Value:lower() == Text:lower()
						Element.Visible = true
					end
				end
			end
			for _, Element in next, DropdownScrollFrame:GetChildren() do
				if not Element:IsA("UIListLayout") and Element.Name ~= "LoadingIndicator" then
					local Value = Element.ButtonLabel.Text
					local Similar = Value:lower():match(Text:lower()) or Value:lower() == Text:lower()
					Element.Visible = Similar and true or false
				end
			end

			RecalculateListPosition()
			RecalculateListSize()
		end)

		Creator.AddSignal(DropdownSearch.Focused, function()
			DropdownSearch.Text = ""
		end)

		Creator.AddSignal(DropdownSearch.FocusLost, function(Enter, Input)
			if #DropdownSearch.Text > 0 then
				local Tick = tick()
				repeat wait() until tick() - Tick > 5 or DropdownSearch:IsFocused()
				if not DropdownSearch:IsFocused() then
					DropdownSearch.Text = ""
				end
			end
		end)

		Creator.AddSignal(UserInputService.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then

                if not Dropdown.Opened then return end

                local pos = input.Position
                local inDropdownInner = DropdownInner.AbsolutePosition.X <= pos.X
                    and pos.X <= DropdownInner.AbsolutePosition.X + DropdownInner.AbsoluteSize.X
                    and DropdownInner.AbsolutePosition.Y <= pos.Y
                    and pos.Y <= DropdownInner.AbsolutePosition.Y + DropdownInner.AbsoluteSize.Y

                local inDropdownHolder = DropdownHolderFrame.AbsolutePosition.X <= pos.X
                    and pos.X <= DropdownHolderFrame.AbsolutePosition.X + DropdownHolderFrame.AbsoluteSize.X
                    and (DropdownHolderFrame.AbsolutePosition.Y - 21) <= pos.Y
                    and pos.Y <= DropdownHolderFrame.AbsolutePosition.Y + DropdownHolderFrame.AbsoluteSize.Y

                local inSearchBox = false
                if SearchBase.Visible then
                    inSearchBox = SearchBase.AbsolutePosition.X <= pos.X
                        and pos.X <= SearchBase.AbsolutePosition.X + SearchBase.AbsoluteSize.X
                        and SearchBase.AbsolutePosition.Y <= pos.Y
                        and pos.Y <= SearchBase.AbsolutePosition.Y + SearchBase.AbsoluteSize.Y
                end

                local inClearButton = false
                if ClearButton and ClearButton.Visible then
                    inClearButton = ClearButton.AbsolutePosition.X <= pos.X
                        and pos.X <= ClearButton.AbsolutePosition.X + ClearButton.AbsoluteSize.X
                        and ClearButton.AbsolutePosition.Y <= pos.Y
                        and pos.Y <= ClearButton.AbsolutePosition.Y + ClearButton.AbsoluteSize.Y
                end

                if not inDropdownInner and not inDropdownHolder and not inSearchBox and not inClearButton then
                    Dropdown:Close() -- เรียกใช้ Close() ที่จะซ่อนปุ่มกากบาท
                end
            end
        end)

        Creator.AddSignal(DropdownInner.MouseButton1Click, function()
			if Dropdown.Opened then
				Dropdown:Close()
				return
			end
			Dropdown:Open()
		end)

		local ScrollFrame = self.ScrollFrame
		function Dropdown:Open()    
			Dropdown.Opened = true
			if Dropdown.Searchable then
				SearchBase.Visible = true
			end
			if ClearButton and Dropdown.Multi then
				local has = false
				for _ in pairs(Dropdown.Value) do has = true break end
				ClearButton.Visible = has
			end
			ScrollFrame.ScrollingEnabled = false
			DropdownHolderCanvas.Visible = true

			if Dropdown.LoadedItems == 0 and #Dropdown.Values > 0 then
				Dropdown:LoadNextBatch()
			end

			-- minimal: fade in + slight scale from 0.97 → 1
			DropdownHolderFrame.Size = UDim2.fromScale(1, 0)
			TweenService:Create(DropdownHolderFrame,
				TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ Size = UDim2.fromScale(1, 1) }
			):Play()
			TweenService:Create(DropdownIco,
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ Rotation = -90 }
			):Play()
		end

		function Dropdown:Close()
			Dropdown.Opened = false
			SearchBase.Visible = false
			if ClearButton then
				ClearButton.Visible = false -- บังคับซ่อนเมื่อปิด dropdown
			end
			ScrollFrame.ScrollingEnabled = true
			DropdownDisplay.Interactable = false
			DropdownHolderFrame.Size = UDim2.fromScale(1, 0.6)
			DropdownHolderCanvas.Visible = false
			TweenService:Create(
				DropdownIco,
				TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{ Rotation = 90 }
			):Play()
			DropdownSearch:ReleaseFocus(false)
			Dropdown:Display()
		end

		function Dropdown:Display()
			local Values = Dropdown.Values
			local Str = ""

			if Config.Multi then
				local count = 0
				for Idx, Value in next,Values do
					if Dropdown.Value[Value] then
						count = count + 1
						if count <= 3 then
							Str = Str .. Value .. ", "
						elseif count == 4 then
							Str = Str .. "and " .. (count - 3) .. " more..."
							break
						end
					end
				end
				if count <= 3 then
					Str = Str:sub(1, #Str - 2)
				end
				
				-- แสดง/ซ่อนปุ่มกากบาท
				if ClearButton then
					-- แสดงเฉพาะเมื่อ dropdown เปิดอยู่ และมีรายการที่เลือก
					ClearButton.Visible = Dropdown.Opened and count > 0
				end
			else
				Str = Dropdown.Value or ""
			end

			DropdownDisplay.PlaceholderText = (Str == "" and "..." or Str)
		end

		function Dropdown:GetActiveValues()
			if Config.Multi then
				local T = {}

				for Value, Bool in next, Dropdown.Value do
					table.insert(T, Value)
				end

				return T
			else
				return Dropdown.Value and 1 or 0
			end
		end

		function Dropdown:SetActiveValues(Value)
			Dropdown.Value = Value

			Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
			Library:SafeCallback(Dropdown.Changed, Dropdown.Value)

			Dropdown:BuildDropdownList()
		end

		-- ฟังก์ชันสำหรับโหลด item แต่ละตัว with enhanced styling
		local function LoadItem(Idx, Value)
			local Table = {}

			-- accent bar ซ้าย
			local ButtonAccent = New("Frame", {
				Size             = UDim2.new(0, 3, 0, 0),
				AnchorPoint      = Vector2.new(0, 0.5),
				Position         = UDim2.new(0, 0, 0.5, 0),
				BackgroundTransparency = 1,
				ThemeTag         = { BackgroundColor3 = "Accent" },
			}, {
				New("UICorner", { CornerRadius = UDim.new(0, 2) }),
			})

			local ButtonLabel = New("TextLabel", {
				FontFace         = Font.new("rbxasset://fonts/families/GothamSSm.json"),
				Text             = tostring(Value),
				TextColor3       = Color3.fromRGB(200, 200, 200),
				TextSize         = 13,
				TextXAlignment   = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				AutomaticSize    = Enum.AutomaticSize.Y,
				Size             = UDim2.new(1, -28, 1, 0),
				Position         = UDim2.fromOffset(14, 0),
				Name             = "ButtonLabel",
				AutoLocalize     = false,
				ThemeTag         = { TextColor3 = "Text" },
			})

			local SelectDot = New("Frame", {
				Size             = UDim2.fromOffset(6, 6),
				AnchorPoint      = Vector2.new(1, 0.5),
				Position         = UDim2.new(1, -10, 0.5, 0),
				BackgroundTransparency = 1,
				ThemeTag         = { BackgroundColor3 = "Accent" },
			}, {
				New("UICorner", { CornerRadius = UDim.new(1, 0) }),
			})

			local Button = New("TextButton", {
				Size             = UDim2.new(1, -10, 0, 34),   -- padding กว้างขึ้น
				BackgroundTransparency = 1,
				ZIndex           = 23,
				Text             = "",
				Parent           = DropdownScrollFrame,
				LayoutOrder      = Idx,
				ThemeTag         = { BackgroundColor3 = "DropdownOption" },
			}, {
				New("UICorner", { CornerRadius = UDim.new(0, 14) }),  -- มนขึ้นจาก 6
				ButtonAccent,
				ButtonLabel,
				SelectDot,
			})

			local Selected
			if Config.Multi then
				Selected = Dropdown.Value[Value] == true
			else
				Selected = Dropdown.Value == Value
			end

			local TI = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

			local function applyState(sel)
				TweenService:Create(Button, TI, {
					BackgroundTransparency = sel and 0.82 or 1,
				}):Play()
				TweenService:Create(ButtonAccent, TI, {
					BackgroundTransparency = sel and 0 or 1,
					Size = sel and UDim2.new(0, 3, 0.5, 0) or UDim2.new(0, 3, 0, 0),
				}):Play()
				TweenService:Create(SelectDot, TI, {
					BackgroundTransparency = sel and 0 or 1,
				}):Play()
				TweenService:Create(ButtonLabel, TI, {
					TextTransparency = sel and 0 or 0.15,
				}):Play()
			end

			Creator.AddSignal(Button.MouseEnter, function()
				if not Selected then
					TweenService:Create(Button, TI, { BackgroundTransparency = 0.90 }):Play()
					TweenService:Create(ButtonLabel, TI, { TextTransparency = 0 }):Play()
				end
			end)
			Creator.AddSignal(Button.MouseLeave, function()
				TweenService:Create(Button, TI, {
					BackgroundTransparency = Selected and 0.82 or 1,
				}):Play()
				TweenService:Create(ButtonLabel, TI, {
					TextTransparency = Selected and 0 or 0.15,
				}):Play()
			end)
			Creator.AddSignal(Button.MouseButton1Down, function()
				TweenService:Create(Button, TI, { BackgroundTransparency = 0.72 }):Play()
			end)
			Creator.AddSignal(Button.MouseButton1Up, function()
				TweenService:Create(Button, TI, {
					BackgroundTransparency = Selected and 0.82 or 0.90,
				}):Play()
			end)

			function Table:UpdateButton()
				if Config.Multi then
					Selected = Dropdown.Value[Value] == true
				else
					Selected = Dropdown.Value == Value
				end
				applyState(Selected)
			end

			AddSignal(Button.Activated, function()
				local Try = not Selected
				if Dropdown:GetActiveValues() == 1 and not Try and not Config.AllowNull then
					-- block deselect last
				else
					if Config.Multi then
						Selected = Try
						Dropdown.Value[Value] = Selected and true or nil
					else
						Selected = Try
						Dropdown.Value = Selected and Value or nil
						for _, OtherButton in next, Dropdown.Buttons do
							OtherButton:UpdateButton()
						end
					end
					Table:UpdateButton()
					if not (Dropdown.Searchable and #DropdownDisplay.Text > 0) then
						Dropdown:Display()
					end
					Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
					Library:SafeCallback(Dropdown.Changed,  Dropdown.Value)
				end
			end)

			Table:UpdateButton()
			Dropdown.Buttons[Button] = Table
			return Button
		end

		-- ฟังก์ชันโหลดเฉพาะ items ที่จำเป็น (สำหรับ SetValue)
		function Dropdown:LoadRequiredItems(targetValues)
			task.spawn(function()
				-- เคลียร์ items เก่า
				for _, Element in next, DropdownScrollFrame:GetChildren() do
					if not Element:IsA("UIListLayout") and Element.Name ~= "LoadingIndicator" then
						Element:Destroy()
					end
				end

				Dropdown.Buttons = {}
				Dropdown.LoadedItems = 0
				ListSizeX = 0

				-- โหลดเฉพาะ items ที่มีใน targetValues และ items รอบๆ
				local indicesToLoad = {}
				local loadRadius = 10 -- โหลด 10 items รอบๆ ค่าที่ต้องการ
				
				for _, targetValue in ipairs(targetValues) do
					local targetIndex = table.find(Dropdown.Values, targetValue)
					if targetIndex then
						-- เพิ่ม index หลักและ index รอบๆ
						for i = math.max(1, targetIndex - loadRadius), math.min(#Dropdown.Values, targetIndex + loadRadius) do
							indicesToLoad[i] = true
						end
					end
				end

				-- โหลด items ที่จำเป็น
				local loadedCount = 0
				for i = 1, #Dropdown.Values do
					if indicesToLoad[i] then
						LoadItem(i, Dropdown.Values[i])
						loadedCount = loadedCount + 1
						
						-- อัพเดท text bounds สำหรับขนาด
						if ListSizeX == 0 then
							for Button, Table in next, Dropdown.Buttons do
								if Button and Button.ButtonLabel and Button.ButtonLabel.TextBounds then
									if Button.ButtonLabel.TextBounds.X > ListSizeX then
										ListSizeX = Button.ButtonLabel.TextBounds.X
									end
								end
							end
							ListSizeX = ListSizeX + 40
						end
					end
				end

				Dropdown.LoadedItems = loadedCount

				-- อัพเดท canvas size
				RecalculateCanvasSize()
				RecalculateListSize()
				Dropdown:Display()
			end)
		end

		-- ฟังก์ชันโหลด batch ถัดไป
		function Dropdown:LoadNextBatch()
			if Dropdown.IsLoadingBatch or Dropdown.LoadedItems >= #Dropdown.Values then
				return
			end

			Dropdown.IsLoadingBatch = true
			LoadingIndicator.Visible = true
			LoadingIndicator.LayoutOrder = 9999 -- ให้อยู่ล่างสุด

			task.spawn(function()
				local startIdx = Dropdown.LoadedItems + 1
				local endIdx = math.min(startIdx + Dropdown.BatchSize - 1, #Dropdown.Values)

				for i = startIdx, endIdx do
					if Dropdown.Values[i] then
						LoadItem(i, Dropdown.Values[i])
						
						-- อัพเดท text bounds สำหรับขนาด
						if ListSizeX == 0 then
							for Button, Table in next, Dropdown.Buttons do
								if Button and Button.ButtonLabel and Button.ButtonLabel.TextBounds then
									if Button.ButtonLabel.TextBounds.X > ListSizeX then
										ListSizeX = Button.ButtonLabel.TextBounds.X
									end
								end
							end
							ListSizeX = ListSizeX + 40 -- เพิ่มขนาดสำหรับ padding
						end
						
						-- หยุดเล็กน้อยเพื่อไม่ให้แลค (ถ้าจำเป็น)
						if i % 10 == 0 then
							task.wait()
						end
					end
				end

				Dropdown.LoadedItems = endIdx
				Dropdown.IsLoadingBatch = false
				
				-- อัพเดท canvas size ตามจำนวน items ที่โหลดแล้ว
				RecalculateCanvasSize()
				
				-- ซ่อน loading indicator ถ้าโหลดครบแล้ว
				if Dropdown.LoadedItems >= #Dropdown.Values then
					LoadingIndicator.Visible = false
				else
					LoadingIndicator.Visible = false -- ซ่อนชั่วคราว จะแสดงอีกครั้งเมื่อ scroll
				end

				RecalculateListSize()
				Dropdown:Display()
			end)
		end

		function Dropdown:BuildDropdownList()
			task.spawn(function()
				-- เคลียร์ items เก่า
				for _, Element in next, DropdownScrollFrame:GetChildren() do
					if not Element:IsA("UIListLayout") and Element.Name ~= "LoadingIndicator" then
						Element:Destroy()
					end
				end

				Dropdown.Buttons = {}
				Dropdown.LoadedItems = 0
				ListSizeX = 0

				-- รีเซ็ต canvas size ให้เล็กก่อน
				DropdownScrollFrame.CanvasSize = UDim2.fromOffset(0, 0)
				
				-- ไม่โหลดทันที รอให้เปิด dropdown ก่อน
				-- Dropdown:LoadNextBatch() -- ลบบรรทัดนี้
			end)
		end

		function Dropdown:SetValues(NewValues)
			if NewValues then
				Dropdown.Values = NewValues
			end

			Dropdown:BuildDropdownList()
		end

		function Dropdown:OnChanged(Func)
			Dropdown.Changed = Func
			Func(Dropdown.Value)
		end

		function Dropdown:SetValue(Val)
			local needsLoading = false
			local targetValues = {}
			
			if Dropdown.Multi then
				local nTable = {}

				for Value, Bool in next, Val do
					if table.find(Dropdown.Values, Value) then
						nTable[Value] = true
						table.insert(targetValues, Value)
					end
				end

				Dropdown.Value = nTable
				needsLoading = next(nTable) ~= nil
			else
				if not Val then
					Dropdown.Value = nil
				elseif table.find(Dropdown.Values, Val) then
					Dropdown.Value = Val
					table.insert(targetValues, Val)
					needsLoading = true
				end
			end

			-- ถ้ามีการ set ค่าใหม่ ให้โหลดเฉพาะ items ที่จำเป็น
			if needsLoading and #targetValues > 0 then
				Dropdown:LoadRequiredItems(targetValues)
			else
				Dropdown:BuildDropdownList()
			end

			Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
			Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
			wait(.2)
		end

		function Dropdown:GetValue()
			return self.Value
		end

		function Dropdown:Destroy()
			DropdownFrame:Destroy()
			Library.Options[Idx] = nil
		end

		-- ฟังก์ชันเช็คว่า value ถูกโหลดแล้วหรือยัง
		function Dropdown:IsValueLoaded(value)
			for Button, Table in next, Dropdown.Buttons do
				if Button and Button.ButtonLabel and Button.ButtonLabel.Text == tostring(value) then
					return true
				end
			end
			return false
		end

		-- ฟังก์ชันโหลด value เฉพาะตัว (ถ้ายังไม่ถูกโหลด)
		function Dropdown:EnsureValueLoaded(value)
			if not Dropdown:IsValueLoaded(value) then
				local index = table.find(Dropdown.Values, value)
				if index then
					LoadItem(index, value)
					Dropdown.LoadedItems = Dropdown.LoadedItems + 1
					RecalculateCanvasSize()
					RecalculateListSize()
				end
			end
		end

		-- ฟังก์ชันปรับแต่ง batch size
		function Dropdown:SetBatchSize(size)
			Dropdown.BatchSize = math.max(1, size or 20)
		end

		-- ฟังก์ชันโหลดทั้งหมดทันที (สำหรับกรณีพิเศษ)
		function Dropdown:LoadAllItems()
			while Dropdown.LoadedItems < #Dropdown.Values do
				Dropdown:LoadNextBatch()
				task.wait()
			end
		end

		-- ฟังก์ชันล้างค่าทั้งหมด (สำหรับ Multi dropdown)
		function Dropdown:ClearAll()
			if Dropdown.Multi then
				Dropdown.Value = {}
				for _, Button in next, Dropdown.Buttons do
					Button:UpdateButton()
				end
				Dropdown:Display()
				Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
				Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
			end
		end

		Dropdown:BuildDropdownList()
		Dropdown:Display()

		-- ไม่เรียก BuildDropdownList ซ้ำ เพราะมันจะไม่โหลด items แล้ว

		local Defaults = {}

		if type(Config.Default) == "string" then
			local Idx = table.find(Dropdown.Values, Config.Default)
			if Idx then
				table.insert(Defaults, Idx)
			end
		elseif type(Config.Default) == "table" then
			for _, Value in next, Config.Default do
				local Idx = table.find(Dropdown.Values, Value)
				if Idx then
					table.insert(Defaults, Idx)
				end
			end
		elseif type(Config.Default) == "number" and Dropdown.Values[Config.Default] ~= nil then
			table.insert(Defaults, Config.Default)
		end

		if next(Defaults) then
			for i = 1, #Defaults do
				local Index = Defaults[i]
				if Config.Multi then
					Dropdown.Value[Dropdown.Values[Index]] = true
				else
					Dropdown.Value = Dropdown.Values[Index]
				end

				if not Config.Multi then
					break
				end
			end

			-- โหลดเฉพาะ items ที่จำเป็นสำหรับ default values
			local targetValues = {}
			if Config.Multi then
				for value, _ in pairs(Dropdown.Value) do
					table.insert(targetValues, value)
				end
			else
				if Dropdown.Value then
					table.insert(targetValues, Dropdown.Value)
				end
			end
			
			if #targetValues > 0 then
				Dropdown:LoadRequiredItems(targetValues)
			else
				Dropdown:BuildDropdownList()
			end
			
			Dropdown:Display()
		else
			-- ถ้าไม่มี default values ก็แค่ build list ธรรมดา (ไม่โหลด items)
			Dropdown:BuildDropdownList()
			Dropdown:Display()
		end

		Library.Options[Idx] = Dropdown

		return Dropdown
	
	
	end

	return Element
end)()
ElementsTable.Paragraph = (function()
	local Paragraph = {}
	Paragraph.__index = Paragraph
	Paragraph.__type = "Paragraph"

	function Paragraph:New(Config)
		assert(Config.Title, "Paragraph - Missing Title")
		Config.Content = Config.Content or ""

		local Paragraph = Components.Element(Config.Title, Config.Content, Paragraph.Container, false, Config)
		Paragraph.Frame.BackgroundTransparency = 0.92
		Paragraph.Border.Transparency = 0.6

		Paragraph.SetTitle = Paragraph.SetTitle
		Paragraph.SetDesc = Paragraph.SetDesc
		Paragraph.Visible = Paragraph.Visible
		Paragraph.Elements = Paragraph

		return Paragraph
	end

	return Paragraph
end)()
ElementsTable.Slider = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Slider"

	function Element:New(Idx, Config)
		assert(Config.Title,    "Slider - Missing Title.")
		assert(Config.Default,  "Slider - Missing default value.")
		assert(Config.Min,      "Slider - Missing minimum value.")
		assert(Config.Max,      "Slider - Missing maximum value.")
		assert(Config.Rounding, "Slider - Missing rounding value.")

		local Slider = {
			Value    = nil,
			Min      = Config.Min,
			Max      = Config.Max,
			Rounding = Config.Rounding,
			Callback = Config.Callback or function(Value) end,
			Type     = "Slider",
		}

		local Dragging = false

		local SliderFrame = Components.Element(Config.Title, Config.Description, self.Container, false, Config)

		SliderFrame.TitleLabel.Size = UDim2.new(1, -60, 0, 14)
		SliderFrame.DescLabel.Size  = UDim2.new(1, -60, 0, 14)

		Slider.Elements  = SliderFrame
		Slider.SetTitle  = SliderFrame.SetTitle
		Slider.SetDesc   = SliderFrame.SetDesc
		Slider.Visible   = SliderFrame.Visible

		-- ── Value display box (ขวาบน) ────────────────────────
		local SliderDisplay = New("TextBox", {
			FontFace         = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			Text             = tostring(Config.Default),
			PlaceholderText  = "",
			TextSize         = 12,
			TextWrapped      = false,
			TextXAlignment   = Enum.TextXAlignment.Center,
			BackgroundTransparency = 0.85,
			Size             = UDim2.new(0, 48, 0, 20),
			Position         = UDim2.new(1, -10, 0, 8),
			AnchorPoint      = Vector2.new(1, 0),
			ZIndex           = 4,
			Parent           = SliderFrame.Frame,
			ThemeTag         = { TextColor3 = "SubText", BackgroundColor3 = "Element" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 4) }),
			New("UIStroke", {
				Thickness       = 1,
				Transparency    = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag        = { Color = "InElementBorder" },
			}),
		})

		-- ── Rail container ────────────────────────────────────
		local SliderRail = New("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(7, 0),
			Size     = UDim2.new(1, -14, 1, 0),
		})

		-- ── Thin visual rail ──────────────────────────────────
		local RailBg = New("Frame", {
			Size             = UDim2.new(1, 0, 0, 3),
			AnchorPoint      = Vector2.new(0, 0.5),
			Position         = UDim2.fromScale(0, 0.5),
			BackgroundTransparency = 0.65,
			Parent           = SliderRail,
			ThemeTag         = { BackgroundColor3 = "SliderRail" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(1, 0) }),
		})

		-- ── Accent fill ───────────────────────────────────────
		local SliderFill = New("Frame", {
			Size     = UDim2.fromScale(0, 1),
			Parent   = RailBg,
			ThemeTag = { BackgroundColor3 = "Accent" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(1, 0) }),
		})

		-- ── Thumb ─────────────────────────────────────────────
		local SliderDot = New("Frame", {
			Size             = UDim2.fromOffset(14, 14),
			AnchorPoint      = Vector2.new(0, 0.5),
			Position         = UDim2.new(0, -7, 0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			ZIndex           = 5,
			Parent           = SliderRail,
		}, {
			New("UICorner", { CornerRadius = UDim.new(1, 0) }),
			New("UIStroke", {
				Thickness       = 1.5,
				Transparency    = 0.35,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag        = { Color = "Accent" },
			}),
		})

		-- ── Rail track อยู่ล่างสุดของ element ────────────────
		local SliderTrack = New("Frame", {
			Size        = UDim2.new(1, -20, 0, 4),
			AnchorPoint = Vector2.new(0, 1),
			Position    = UDim2.new(0, 10, 1, -8),
			BackgroundTransparency = 0.4,
			Parent      = SliderFrame.Frame,
			ThemeTag    = { BackgroundColor3 = "SliderRail" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(1, 0) }),
			RailBg,
			SliderRail,
		})

		-- padding ล่างให้ frame ขยายพอรับ rail
		New("UIPadding", {
			PaddingBottom = UDim.new(0, 28),
			Parent        = SliderFrame.LabelHolder,
		})

		-- ── Easing ────────────────────────────────────────────
		local TI_MOVE  = TweenInfo.new(0.08, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		local TI_THUMB = TweenInfo.new(0.12, Enum.EasingStyle.Back,  Enum.EasingDirection.Out)

		-- ── Input bindings ────────────────────────────────────
		AddSignal(SliderDisplay.FocusLost, function(enter)
			if not enter then return end
			Slider:SetValue(tonumber(SliderDisplay.Text))
		end)

		AddSignal(SliderDisplay:GetPropertyChangedSignal("Text"), function()
			if #SliderDisplay.Text > 0 and tonumber(SliderDisplay.Text) then
				Slider:SetValue(SliderDisplay.Text)
			end
		end)

		Creator.AddSignal(SliderDot.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Dragging = true
				TweenService:Create(SliderDot, TI_THUMB, { Size = UDim2.fromOffset(18, 18) }):Play()
			end
		end)

		Creator.AddSignal(SliderDot.InputEnded, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Dragging = false
				TweenService:Create(SliderDot, TI_THUMB, { Size = UDim2.fromOffset(14, 14) }):Play()
			end
		end)

		Creator.AddSignal(UserInputService.InputChanged, function(Input)
			if Dragging and (
				Input.UserInputType == Enum.UserInputType.MouseMovement
				or Input.UserInputType == Enum.UserInputType.Touch
			) then
				local SizeScale = math.clamp(
					(Input.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X,
					0, 1
				)
				Slider:SetValue(Slider.Min + (Slider.Max - Slider.Min) * SizeScale)
			end
		end)

		-- ── Public API ────────────────────────────────────────
		function Slider:OnChanged(Func)
			Slider.Changed = Func
			Func(Slider.Value)
		end

		function Slider:SetValue(Value)
			Value = Value or self.Value

			if (not tonumber(Value)) and tostring(Value):len() > 0 then
				Value = self.Value
			end

			self.Value = Library:Round(
				math.clamp(tonumber(Value), Slider.Min, Slider.Max),
				Slider.Rounding
			) or 0

			local pct = (self.Value - Slider.Min) / (Slider.Max - Slider.Min)

			TweenService:Create(SliderDot,  TI_MOVE, { Position = UDim2.new(pct, -7, 0.5, 0) }):Play()
			TweenService:Create(SliderFill, TI_MOVE, { Size     = UDim2.fromScale(pct, 1)      }):Play()

			SliderDisplay.Text = tostring(self.Value)

			Library:SafeCallback(Slider.Callback, self.Value)
			Library:SafeCallback(Slider.Changed,  self.Value)
		end

		function Slider:GetValue()
			return self.Value
		end

		function Slider:Destroy()
			SliderFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Slider:SetValue(Config.Default)

		Library.Options[Idx] = Slider
		return Slider
	end

	return Element
end)()
ElementsTable.Keybind = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Keybind"

	function Element:New(Idx, Config)
		assert(Config.Title, "KeyBind - Missing Title")
		assert(Config.Default, "KeyBind - Missing default value.")

		local Keybind = {
			Value = Config.Default,
			Toggled = false,
			Mode = Config.Mode or "Toggle",
			Type = "Keybind",
			Callback = Config.Callback or function(Value) end,
			ChangedCallback = Config.ChangedCallback or function(New) end,
		}

		local Picking = false

		local KeybindFrame = Components.Element(Config.Title, Config.Description, self.Container, true)

		Keybind.SetTitle = KeybindFrame.SetTitle
		Keybind.SetDesc = KeybindFrame.SetDesc
		Keybind.Visible = KeybindFrame.Visible
		Keybind.Elements = KeybindFrame

		local KeybindDisplayLabel = New("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
			Text = Config.Default,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Center,
			Size = UDim2.new(0, 0, 0, 14),
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			AutoLocalize = false,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		local KeybindDisplayFrame = New("TextButton", {
			Size = UDim2.fromOffset(0, 30),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 0.9,
			Parent = KeybindFrame.Frame,
			AutomaticSize = Enum.AutomaticSize.X,
			ThemeTag = {
				BackgroundColor3 = "Keybind",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 10),
			}),
			New("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8),
			}),
			New("UIStroke", {
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag = {
					Color = "InElementBorder",
				},
			}),
			KeybindDisplayLabel,
		})

		function Keybind:GetState()
			if UserInputService:GetFocusedTextBox() and Keybind.Mode ~= "Always" then
				return false
			end

			if Keybind.Mode == "Always" then
				return true
			elseif Keybind.Mode == "Hold" then
				if Keybind.Value == "None" then
					return false
				end

				local Key = Keybind.Value

				if Key == "MouseLeft" or Key == "MouseRight" then
					return Key == "MouseLeft" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
						or Key == "MouseRight"
						and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
				else
					return UserInputService:IsKeyDown(Enum.KeyCode[Keybind.Value])
				end
			else
				return Keybind.Toggled
			end
		end

		function Keybind:SetValue(Key, Mode)
			Key = Key or Keybind.Key
			Mode = Mode or Keybind.Mode

			KeybindDisplayLabel.Text = Key
			Keybind.Value = Key
			Keybind.Mode = Mode
		end

		function Keybind:GetValue()
			return self.Value
		end

		function Keybind:OnClick(Callback)
			Keybind.Clicked = Callback
		end

		function Keybind:OnChanged(Callback)
			Keybind.Changed = Callback
			Callback(Keybind.Value)
		end

		function Keybind:DoClick()
			Library:SafeCallback(Keybind.Callback, Keybind.Toggled)
			Library:SafeCallback(Keybind.Clicked, Keybind.Toggled)
		end

		function Keybind:Destroy()
			KeybindFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Creator.AddSignal(KeybindDisplayFrame.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Picking = true
				KeybindDisplayLabel.Text = "..."

				wait()

				local Event
				Event = UserInputService.InputBegan:Connect(function(Input)
					local Key

					if Input.UserInputType == Enum.UserInputType.Keyboard then
						Key = Input.KeyCode.Name
					elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then
						Key = "MouseLeft"
					elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
						Key = "MouseRight"
					end

					local EndedEvent
					EndedEvent = UserInputService.InputEnded:Connect(function(Input)
						if
							Input.KeyCode.Name == Key
							or Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1
							or Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2
						then
							Picking = false

							KeybindDisplayLabel.Text = Key
							Keybind.Value = Key

							Library:SafeCallback(Keybind.ChangedCallback, Input.KeyCode or Input.UserInputType)
							Library:SafeCallback(Keybind.Changed, Input.KeyCode or Input.UserInputType)

							Event:Disconnect()
							EndedEvent:Disconnect()
						end
					end)
				end)
			end
		end)

		Creator.AddSignal(UserInputService.InputBegan, function(Input)
			if not Picking and not UserInputService:GetFocusedTextBox() then
				if Keybind.Mode == "Toggle" then
					local Key = Keybind.Value

					if Key == "MouseLeft" or Key == "MouseRight" then
						if
							Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1
							or Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2
						then
							Keybind.Toggled = not Keybind.Toggled
							Keybind:DoClick()
						end
					elseif Input.UserInputType == Enum.UserInputType.Keyboard then
						if Input.KeyCode.Name == Key then
							Keybind.Toggled = not Keybind.Toggled
							Keybind:DoClick()
						end
					end
				end
			end
		end)

		Library.Options[Idx] = Keybind
		return Keybind
	end

	return Element
end)()
ElementsTable.Colorpicker = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Colorpicker"

	function Element:New(Idx, Config)
		assert(Config.Title, "Colorpicker - Missing Title")
		assert(Config.Default, "AddColorPicker: Missing default value.")

		local Colorpicker = {
			Value = Config.Default,
			Transparency = Config.Transparency or 0,
			Type = "Colorpicker",
			Title = type(Config.Title) == "string" and Config.Title or "Colorpicker",
			Callback = Config.Callback or function(Color) end,
		}

		function Colorpicker:SetHSVFromRGB(Color)
			local H, S, V = Color3.toHSV(Color)
			Colorpicker.Hue = H
			Colorpicker.Sat = S
			Colorpicker.Vib = V
		end

		Colorpicker:SetHSVFromRGB(Colorpicker.Value)

		local ColorpickerFrame = Components.Element(Config.Title, Config.Description, self.Container, true)

		Colorpicker.SetTitle = ColorpickerFrame.SetTitle
		Colorpicker.SetDesc = ColorpickerFrame.SetDesc
		Colorpicker.Visible = ColorpickerFrame.Visible
		Colorpicker.Elements = ColorpickerFrame

		local DisplayFrameColor = New("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Colorpicker.Value,
			Parent = ColorpickerFrame.Frame,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		local DisplayFrame = New("ImageLabel", {
			Size = UDim2.fromOffset(26, 26),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			Parent = ColorpickerFrame.Frame,
			Image = "http://www.roblox.com/asset/?id=14204231522",
			ImageTransparency = 0.45,
			ScaleType = Enum.ScaleType.Tile,
			TileSize = UDim2.fromOffset(40, 40),
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			DisplayFrameColor,
		})

		local function CreateColorDialog()
			local Dialog = Components.Dialog:Create()
			Dialog.Title.Text = Colorpicker.Title
			Dialog.Root.Size = UDim2.fromOffset(430, 330)

			local Hue, Sat, Vib = Colorpicker.Hue, Colorpicker.Sat, Colorpicker.Vib
			local Transparency = Colorpicker.Transparency

			local function CreateInput()
				local Box = Components.Textbox()
				Box.Frame.Parent = Dialog.Root
				Box.Frame.Size = UDim2.new(0, 90, 0, 32)

				return Box
			end

			local function CreateInputLabel(Text, Pos)
				return New("TextLabel", {
					FontFace = Font.new(
						"rbxasset://fonts/families/GothamSSm.json",
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					),
					Text = Text,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 32),
					Position = Pos,
					BackgroundTransparency = 1,
					Parent = Dialog.Root,
					AutoLocalize = false,
					ThemeTag = {
						TextColor3 = "Text",
					},
				})
			end

			local function GetRGB()
				local Value = Color3.fromHSV(Hue, Sat, Vib)
				return { R = math.floor(Value.r * 255), G = math.floor(Value.g * 255), B = math.floor(Value.b * 255) }
			end

			local SatCursor = New("ImageLabel", {
				Size = UDim2.new(0, 18, 0, 18),
				ScaleType = Enum.ScaleType.Fit,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Image = "http://www.roblox.com/asset/?id=4805639000",
			})

			local SatVibMap = New("ImageLabel", {
				Size = UDim2.fromOffset(180, 160),
				Position = UDim2.fromOffset(20, 55),
				Image = "rbxassetid://4155801252",
				BackgroundColor3 = Colorpicker.Value,
				BackgroundTransparency = 0,
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
				SatCursor,
			})

			local OldColorFrame = New("Frame", {
				BackgroundColor3 = Colorpicker.Value,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = Colorpicker.Transparency,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
			})

			local OldColorFrameChecker = New("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(112, 220),
				Size = UDim2.fromOffset(88, 24),
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
				New("UIStroke", {
					Thickness = 2,
					Transparency = 0.75,
				}),
				OldColorFrame,
			})

			local DialogDisplayFrame = New("Frame", {
				BackgroundColor3 = Colorpicker.Value,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 0,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
			})

			local DialogDisplayFrameChecker = New("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(20, 220),
				Size = UDim2.fromOffset(88, 24),
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
				New("UIStroke", {
					Thickness = 2,
					Transparency = 0.75,
				}),
				DialogDisplayFrame,
			})

			local SequenceTable = {}

			for Color = 0, 1, 0.1 do
				table.insert(SequenceTable, ColorSequenceKeypoint.new(Color, Color3.fromHSV(Color, 1, 1)))
			end

			local HueSliderGradient = New("UIGradient", {
				Color = ColorSequence.new(SequenceTable),
				Rotation = 90,
			})

			local HueDragHolder = New("Frame", {
				Size = UDim2.new(1, 0, 1, -10),
				Position = UDim2.fromOffset(0, 5),
				BackgroundTransparency = 1,
			})

			local HueDrag = New("ImageLabel", {
				Size = UDim2.fromOffset(14, 14),
				Image = "http://www.roblox.com/asset/?id=12266946128",
				Parent = HueDragHolder,
				ThemeTag = {
					ImageColor3 = "DialogInput",
				},
			})

			local HueSlider = New("Frame", {
				Size = UDim2.fromOffset(12, 190),
				Position = UDim2.fromOffset(210, 55),
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(1, 0),
				}),
				HueSliderGradient,
				HueDragHolder,
			})

			local HexInput = CreateInput()
			HexInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 55)
			CreateInputLabel("Hex", UDim2.fromOffset(Config.Transparency and 360 or 340, 55))

			local RedInput = CreateInput()
			RedInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 95)
			CreateInputLabel("Red", UDim2.fromOffset(Config.Transparency and 360 or 340, 95))

			local GreenInput = CreateInput()
			GreenInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 135)
			CreateInputLabel("Green", UDim2.fromOffset(Config.Transparency and 360 or 340, 135))

			local BlueInput = CreateInput()
			BlueInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 175)
			CreateInputLabel("Blue", UDim2.fromOffset(Config.Transparency and 360 or 340, 175))

			local AlphaInput
			if Config.Transparency then
				AlphaInput = CreateInput()
				AlphaInput.Frame.Position = UDim2.fromOffset(260, 215)
				CreateInputLabel("Alpha", UDim2.fromOffset(360, 215))
			end

			local TransparencySlider, TransparencyDrag, TransparencyColor
			if Config.Transparency then
				local TransparencyDragHolder = New("Frame", {
					Size = UDim2.new(1, 0, 1, -10),
					Position = UDim2.fromOffset(0, 5),
					BackgroundTransparency = 1,
				})

				TransparencyDrag = New("ImageLabel", {
					Size = UDim2.fromOffset(14, 14),
					Image = "http://www.roblox.com/asset/?id=12266946128",
					Parent = TransparencyDragHolder,
					ThemeTag = {
						ImageColor3 = "DialogInput",
					},
				})

				TransparencyColor = New("Frame", {
					Size = UDim2.fromScale(1, 1),
				}, {
					New("UIGradient", {
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}),
						Rotation = 270,
					}),
					New("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
				})

				TransparencySlider = New("Frame", {
					Size = UDim2.fromOffset(12, 190),
					Position = UDim2.fromOffset(230, 55),
					Parent = Dialog.Root,
					BackgroundTransparency = 1,
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
					New("ImageLabel", {
						Image = "http://www.roblox.com/asset/?id=14204231522",
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Parent = Dialog.Root,
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(1, 0),
						}),
					}),
					TransparencyColor,
					TransparencyDragHolder,
				})
			end

			local function Display()
				SatVibMap.BackgroundColor3 = Color3.fromHSV(Hue, 1, 1)
				HueDrag.Position = UDim2.new(0, -1, Hue, -6)
				SatCursor.Position = UDim2.new(Sat, 0, 1 - Vib, 0)
				DialogDisplayFrame.BackgroundColor3 = Color3.fromHSV(Hue, Sat, Vib)

				HexInput.Input.Text = "#" .. Color3.fromHSV(Hue, Sat, Vib):ToHex()
				RedInput.Input.Text = GetRGB()["R"]
				GreenInput.Input.Text = GetRGB()["G"]
				BlueInput.Input.Text = GetRGB()["B"]

				if Config.Transparency then
					TransparencyColor.BackgroundColor3 = Color3.fromHSV(Hue, Sat, Vib)
					DialogDisplayFrame.BackgroundTransparency = Transparency
					TransparencyDrag.Position = UDim2.new(0, -1, 1 - Transparency, -6)
					AlphaInput.Input.Text = Library:Round((1 - Transparency) * 100, 0) .. "%"
				end
			end

			Creator.AddSignal(HexInput.Input.FocusLost, function(Enter)
				if Enter then
					local Success, Result = pcall(Color3.fromHex, HexInput.Input.Text)
					if Success and typeof(Result) == "Color3" then
						Hue, Sat, Vib = Color3.toHSV(Result)
					end
				end
				Display()
			end)

			Creator.AddSignal(RedInput.Input.FocusLost, function(Enter)
				if Enter then
					local CurrentColor = GetRGB()
					local Success, Result = pcall(Color3.fromRGB, RedInput.Input.Text, CurrentColor["G"], CurrentColor["B"])
					if Success and typeof(Result) == "Color3" then
						if tonumber(RedInput.Input.Text) <= 255 then
							Hue, Sat, Vib = Color3.toHSV(Result)
						end
					end
				end
				Display()
			end)

			Creator.AddSignal(GreenInput.Input.FocusLost, function(Enter)
				if Enter then
					local CurrentColor = GetRGB()
					local Success, Result =
						pcall(Color3.fromRGB, CurrentColor["R"], GreenInput.Input.Text, CurrentColor["B"])
					if Success and typeof(Result) == "Color3" then
						if tonumber(GreenInput.Input.Text) <= 255 then
							Hue, Sat, Vib = Color3.toHSV(Result)
						end
					end
				end
				Display()
			end)

			Creator.AddSignal(BlueInput.Input.FocusLost, function(Enter)
				if Enter then
					local CurrentColor = GetRGB()
					local Success, Result =
						pcall(Color3.fromRGB, CurrentColor["R"], CurrentColor["G"], BlueInput.Input.Text)
					if Success and typeof(Result) == "Color3" then
						if tonumber(BlueInput.Input.Text) <= 255 then
							Hue, Sat, Vib = Color3.toHSV(Result)
						end
					end
				end
				Display()
			end)

			if Config.Transparency then
				Creator.AddSignal(AlphaInput.Input.FocusLost, function(Enter)
					if Enter then
						pcall(function()
							local Value = tonumber(AlphaInput.Input.Text)
							if Value >= 0 and Value <= 100 then
								Transparency = 1 - Value * 0.01
							end
						end)
					end
					Display()
				end)
			end

			Creator.AddSignal(SatVibMap.InputBegan, function(Input)
				if
					Input.UserInputType == Enum.UserInputType.MouseButton1
					or Input.UserInputType == Enum.UserInputType.Touch
				then
					while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local MinX = SatVibMap.AbsolutePosition.X
						local MaxX = MinX + SatVibMap.AbsoluteSize.X
						local MouseX = math.clamp(Mouse.X, MinX, MaxX)

						local MinY = SatVibMap.AbsolutePosition.Y
						local MaxY = MinY + SatVibMap.AbsoluteSize.Y
						local MouseY = math.clamp(Mouse.Y, MinY, MaxY)

						Sat = (MouseX - MinX) / (MaxX - MinX)
						Vib = 1 - ((MouseY - MinY) / (MaxY - MinY))
						Display()

						RenderStepped:Wait()
					end
				end
			end)

			Creator.AddSignal(HueSlider.InputBegan, function(Input)
				if
					Input.UserInputType == Enum.UserInputType.MouseButton1
					or Input.UserInputType == Enum.UserInputType.Touch
				then
					while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local MinY = HueSlider.AbsolutePosition.Y
						local MaxY = MinY + HueSlider.AbsoluteSize.Y
						local MouseY = math.clamp(Mouse.Y, MinY, MaxY)

						Hue = ((MouseY - MinY) / (MaxY - MinY))
						Display()

						RenderStepped:Wait()
					end
				end
			end)

			if Config.Transparency then
				Creator.AddSignal(TransparencySlider.InputBegan, function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local MinY = TransparencySlider.AbsolutePosition.Y
							local MaxY = MinY + TransparencySlider.AbsoluteSize.Y
							local MouseY = math.clamp(Mouse.Y, MinY, MaxY)

							Transparency = 1 - ((MouseY - MinY) / (MaxY - MinY))
							Display()

							RenderStepped:Wait()
						end
					end
				end)
			end

			Display()

			Dialog:Button("Done", function()
				Colorpicker:SetValue({ Hue, Sat, Vib }, Transparency)
			end)
			Dialog:Button("Cancel")
			Dialog:Open()
		end

		function Colorpicker:Display()
			Colorpicker.Value = Color3.fromHSV(Colorpicker.Hue, Colorpicker.Sat, Colorpicker.Vib)

			DisplayFrameColor.BackgroundColor3 = Colorpicker.Value
			DisplayFrameColor.BackgroundTransparency = Colorpicker.Transparency

			Element.Library:SafeCallback(Colorpicker.Callback, Colorpicker.Value)
			Element.Library:SafeCallback(Colorpicker.Changed, Colorpicker.Value)
		end

		function Colorpicker:SetValue(HSV, Transparency)
			local Color = Color3.fromHSV(HSV[1], HSV[2], HSV[3])

			Colorpicker.Transparency = Transparency or 0
			Colorpicker:SetHSVFromRGB(Color)
			Colorpicker:Display()
		end

		function Colorpicker:SetValueRGB(Color, Transparency)
			Colorpicker.Transparency = Transparency or 0
			Colorpicker:SetHSVFromRGB(Color)
			Colorpicker:Display()
		end

		function Colorpicker:OnChanged(Func)
			Colorpicker.Changed = Func
			Func(Colorpicker.Value)
		end

		function Colorpicker:Destroy()
			ColorpickerFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Creator.AddSignal(ColorpickerFrame.Frame.MouseButton1Click, function()
			CreateColorDialog()
		end)

		Colorpicker:Display()

		Library.Options[Idx] = Colorpicker
		return Colorpicker
	end

	return Element
end)()
ElementsTable.Input = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Input"

	function Element:New(Idx, Config)
		assert(Config.Title, "Input - Missing Title")

		Config.Callback = Config.Callback or function() end

		local Input = {
			Value = Config.Default or "",
			Numeric = Config.Numeric or false,
			Finished = Config.Finished or false,
			Callback = Config.Callback,
			Type = "Input",
		}

		local InputFrame = Components.Element(
			Config.Title,
			Config.Description,
			self.Container,
			false,
			Config
		)

		Input.SetTitle = InputFrame.SetTitle
		Input.SetDesc = InputFrame.SetDesc
		Input.Visible = InputFrame.Visible
		Input.Elements = InputFrame

		local MainFrame = InputFrame.Frame

		MainFrame.AutomaticSize = Enum.AutomaticSize.None
		MainFrame.Size = UDim2.new(1, 0, 0, 90)

		local Textbox = Components.Textbox(MainFrame, true)
		local TextboxFrame = Textbox.Frame
		local Box = Textbox.Input

		TextboxFrame.AnchorPoint = Vector2.new(0, 0)
		TextboxFrame.Position = UDim2.new(0, 10, 0, 49)
		TextboxFrame.Size = UDim2.new(1, -20, 0, 30)

		local Corner = TextboxFrame:FindFirstChildOfClass("UICorner")

		if Corner then
			Corner.CornerRadius = UDim.new(0, 8)
		else
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
				Parent = TextboxFrame,
			})
		end

		for _, Child in ipairs(TextboxFrame:GetDescendants()) do
			if Child:IsA("UIStroke") then
				Child:Destroy()
			elseif Child:IsA("Frame") then
				local Name = Child.Name:lower()

				if Name:find("line")
					or Name:find("underline")
					or Name:find("bottom")
					or Name:find("border") then
					Child:Destroy()
				elseif Child.Size.Y.Scale == 0
					and Child.Size.Y.Offset <= 2 then
					Child:Destroy()
				end
			end
		end

		Box.Text = tostring(Config.Default or "")
		Box.PlaceholderText = Config.Placeholder or ""
		Box.MultiLine = Config.MultiLine or false
		Box.ClearTextOnFocus = false

		Box.TextXAlignment = Enum.TextXAlignment.Left
		Box.TextYAlignment = Enum.TextYAlignment.Center
		Box.Size = UDim2.new(1, -8, 1, 0)
		Box.Position = UDim2.new(0, 1, 0, 0)
		Box.BackgroundTransparency = 1

		local Padding = TextboxFrame:FindFirstChildOfClass("UIPadding")

		if Padding then
			Padding.PaddingLeft = UDim.new(0, 1)
			Padding.PaddingRight = UDim.new(0, 1)
			Padding.PaddingTop = UDim.new(0, 0)
			Padding.PaddingBottom = UDim.new(0, 0)
		else
			New("UIPadding", {
				PaddingLeft = UDim.new(0, 1),
				PaddingRight = UDim.new(0, 1),
				PaddingTop = UDim.new(0, 0),
				PaddingBottom = UDim.new(0, 0),
				Parent = TextboxFrame,
			})
		end

		function Input:SetValue(Text)
			Text = tostring(Text or "")

			if Config.MaxLength and #Text > Config.MaxLength then
				Text = Text:sub(1, Config.MaxLength)
			end

			if Input.Numeric then
				local Number = tonumber(Text)

				if not Number and #Text > 0 then
					Text = Input.Value
				end
			end

			Input.Value = Text
			Box.Text = Text

			Library:SafeCallback(
				Input.Callback,
				Input.Value
			)

			Library:SafeCallback(
				Input.Changed,
				Input.Value
			)
		end

		function Input:GetValue()
			return self.Value
		end

		if Input.Finished then
			AddSignal(Box.FocusLost, function(Enter)
				if Enter then
					Input:SetValue(Box.Text)
				end
			end)
		else
			AddSignal(
				Box:GetPropertyChangedSignal("Text"),
				function()
					local Text = Box.Text

					if Config.MaxLength and #Text > Config.MaxLength then
						Text = Text:sub(1, Config.MaxLength)
						Box.Text = Text
						return
					end

					if Input.Numeric and #Text > 0 and not tonumber(Text) then
						Box.Text = Input.Value
						return
					end

					Input.Value = Text

					Library:SafeCallback(
						Input.Callback,
						Input.Value
					)

					Library:SafeCallback(
						Input.Changed,
						Input.Value
					)
				end
			)
		end

		function Input:OnChanged(Func)
			Input.Changed = Func
			Func(Input.Value)
		end

		function Input:Destroy()
			InputFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Library.Options[Idx] = Input

		return Input
	end

	return Element
end)()

local NotificationModule = Components.Notification
NotificationModule:Init(GUI)

local New = Creator.New

local Icons = {
	["lucide-accessibility"] = "rbxassetid://10709751939",
	["lucide-activity"] = "rbxassetid://10709752035",
	["lucide-air-vent"] = "rbxassetid://10709752131",
	["lucide-airplay"] = "rbxassetid://10709752254",
	["lucide-alarm-check"] = "rbxassetid://10709752405",
	["lucide-alarm-clock"] = "rbxassetid://10709752630",
	["lucide-alarm-clock-off"] = "rbxassetid://10709752508",
	["lucide-alarm-minus"] = "rbxassetid://10709752732",
	["lucide-alarm-plus"] = "rbxassetid://10709752825",
	["lucide-album"] = "rbxassetid://10709752906",
	["lucide-alert-circle"] = "rbxassetid://10709752996",
	["lucide-alert-octagon"] = "rbxassetid://10709753064",
	["lucide-alert-triangle"] = "rbxassetid://10709753149",
	["lucide-align-center"] = "rbxassetid://10709753570",
	["lucide-align-center-horizontal"] = "rbxassetid://10709753272",
	["lucide-align-center-vertical"] = "rbxassetid://10709753421",
	["lucide-align-end-horizontal"] = "rbxassetid://10709753692",
	["lucide-align-end-vertical"] = "rbxassetid://10709753808",
	["lucide-align-horizontal-distribute-center"] = "rbxassetid://10747779791",
	["lucide-align-horizontal-distribute-end"] = "rbxassetid://10747784534",
	["lucide-align-horizontal-distribute-start"] = "rbxassetid://10709754118",
	["lucide-align-horizontal-justify-center"] = "rbxassetid://10709754204",
	["lucide-align-horizontal-justify-end"] = "rbxassetid://10709754317",
	["lucide-align-horizontal-justify-start"] = "rbxassetid://10709754436",
	["lucide-align-horizontal-space-around"] = "rbxassetid://10709754590",
	["lucide-align-horizontal-space-between"] = "rbxassetid://10709754749",
	["lucide-align-justify"] = "rbxassetid://10709759610",
	["lucide-align-left"] = "rbxassetid://10709759764",
	["lucide-align-right"] = "rbxassetid://10709759895",
	["lucide-align-start-horizontal"] = "rbxassetid://10709760051",
	["lucide-align-start-vertical"] = "rbxassetid://10709760244",
	["lucide-align-vertical-distribute-center"] = "rbxassetid://10709760351",
	["lucide-align-vertical-distribute-end"] = "rbxassetid://10709760434",
	["lucide-align-vertical-distribute-start"] = "rbxassetid://10709760612",
	["lucide-align-vertical-justify-center"] = "rbxassetid://10709760814",
	["lucide-align-vertical-justify-end"] = "rbxassetid://10709761003",
	["lucide-align-vertical-justify-start"] = "rbxassetid://10709761176",
	["lucide-align-vertical-space-around"] = "rbxassetid://10709761324",
	["lucide-align-vertical-space-between"] = "rbxassetid://10709761434",
	["lucide-anchor"] = "rbxassetid://10709761530",
	["lucide-angry"] = "rbxassetid://10709761629",
	["lucide-annoyed"] = "rbxassetid://10709761722",
	["lucide-aperture"] = "rbxassetid://10709761813",
	["lucide-apple"] = "rbxassetid://10709761889",
	["lucide-archive"] = "rbxassetid://10709762233",
	["lucide-archive-restore"] = "rbxassetid://10709762058",
	["lucide-armchair"] = "rbxassetid://10709762327",
	["lucide-anvil"] = "rbxassetid://77943964625400",
	["lucide-arrow-big-down"] = "rbxassetid://10747796644",
	["lucide-arrow-big-left"] = "rbxassetid://10709762574",
	["lucide-arrow-big-right"] = "rbxassetid://10709762727",
	["lucide-arrow-big-up"] = "rbxassetid://10709762879",
	["lucide-arrow-down"] = "rbxassetid://10709767827",
	["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
	["lucide-arrow-down-left"] = "rbxassetid://10709767656",
	["lucide-arrow-down-right"] = "rbxassetid://10709767750",
	["lucide-arrow-left"] = "rbxassetid://10709768114",
	["lucide-arrow-left-circle"] = "rbxassetid://10709767936",
	["lucide-arrow-left-right"] = "rbxassetid://10709768019",
	["lucide-arrow-right"] = "rbxassetid://10709768347",
	["lucide-arrow-right-circle"] = "rbxassetid://10709768226",
	["lucide-arrow-up"] = "rbxassetid://10709768939",
	["lucide-arrow-up-circle"] = "rbxassetid://10709768432",
	["lucide-arrow-up-down"] = "rbxassetid://10709768538",
	["lucide-arrow-up-left"] = "rbxassetid://10709768661",
	["lucide-arrow-up-right"] = "rbxassetid://10709768787",
	["lucide-asterisk"] = "rbxassetid://10709769095",
	["lucide-at-sign"] = "rbxassetid://10709769286",
	["lucide-award"] = "rbxassetid://10709769406",
	["lucide-axe"] = "rbxassetid://10709769508",
	["lucide-axis-3d"] = "rbxassetid://10709769598",
	["lucide-baby"] = "rbxassetid://10709769732",
	["lucide-backpack"] = "rbxassetid://10709769841",
	["lucide-baggage-claim"] = "rbxassetid://10709769935",
	["lucide-banana"] = "rbxassetid://10709770005",
	["lucide-banknote"] = "rbxassetid://10709770178",
	["lucide-bar-chart"] = "rbxassetid://10709773755",
	["lucide-bar-chart-2"] = "rbxassetid://10709770317",
	["lucide-bar-chart-3"] = "rbxassetid://10709770431",
	["lucide-bar-chart-4"] = "rbxassetid://10709770560",
	["lucide-bar-chart-horizontal"] = "rbxassetid://10709773669",
	["lucide-barcode"] = "rbxassetid://10747360675",
	["lucide-baseline"] = "rbxassetid://10709773863",
	["lucide-bath"] = "rbxassetid://10709773963",
	["lucide-battery"] = "rbxassetid://10709774640",
	["lucide-battery-charging"] = "rbxassetid://10709774068",
	["lucide-battery-full"] = "rbxassetid://10709774206",
	["lucide-battery-low"] = "rbxassetid://10709774370",
	["lucide-battery-medium"] = "rbxassetid://10709774513",
	["lucide-beaker"] = "rbxassetid://10709774756",
	["lucide-bed"] = "rbxassetid://10709775036",
	["lucide-bed-double"] = "rbxassetid://10709774864",
	["lucide-bed-single"] = "rbxassetid://10709774968",
	["lucide-beer"] = "rbxassetid://10709775167",
	["lucide-bell"] = "rbxassetid://10709775704",
	["lucide-bell-minus"] = "rbxassetid://10709775241",
	["lucide-bell-off"] = "rbxassetid://10709775320",
	["lucide-bell-plus"] = "rbxassetid://10709775448",
	["lucide-bell-ring"] = "rbxassetid://10709775560",
	["lucide-bike"] = "rbxassetid://10709775894",
	["lucide-binary"] = "rbxassetid://10709776050",
	["lucide-bitcoin"] = "rbxassetid://10709776126",
	["lucide-bluetooth"] = "rbxassetid://10709776655",
	["lucide-bluetooth-connected"] = "rbxassetid://10709776240",
	["lucide-bluetooth-off"] = "rbxassetid://10709776344",
	["lucide-bluetooth-searching"] = "rbxassetid://10709776501",
	["lucide-bold"] = "rbxassetid://10747813908",
	["lucide-bomb"] = "rbxassetid://10709781460",
	["lucide-bone"] = "rbxassetid://10709781605",
	["lucide-book"] = "rbxassetid://10709781824",
	["lucide-book-open"] = "rbxassetid://10709781717",
	["lucide-bookmark"] = "rbxassetid://10709782154",
	["lucide-bookmark-minus"] = "rbxassetid://10709781919",
	["lucide-bookmark-plus"] = "rbxassetid://10709782044",
	["lucide-bot"] = "rbxassetid://10709782230",
	["lucide-box"] = "rbxassetid://10709782497",
	["lucide-box-select"] = "rbxassetid://10709782342",
	["lucide-boxes"] = "rbxassetid://10709782582",
	["lucide-briefcase"] = "rbxassetid://10709782662",
	["lucide-brush"] = "rbxassetid://10709782758",
	["lucide-bug"] = "rbxassetid://10709782845",
	["lucide-building"] = "rbxassetid://10709783051",
	["lucide-building-2"] = "rbxassetid://10709782939",
	["lucide-bus"] = "rbxassetid://10709783137",
	["lucide-cake"] = "rbxassetid://10709783217",
	["lucide-calculator"] = "rbxassetid://10709783311",
	["lucide-calendar"] = "rbxassetid://10709789505",
	["lucide-calendar-check"] = "rbxassetid://10709783474",
	["lucide-calendar-check-2"] = "rbxassetid://10709783392",
	["lucide-calendar-clock"] = "rbxassetid://10709783577",
	["lucide-calendar-days"] = "rbxassetid://10709783673",
	["lucide-calendar-heart"] = "rbxassetid://10709783835",
	["lucide-calendar-minus"] = "rbxassetid://10709783959",
	["lucide-calendar-off"] = "rbxassetid://10709788784",
	["lucide-calendar-plus"] = "rbxassetid://10709788937",
	["lucide-calendar-range"] = "rbxassetid://10709789053",
	["lucide-calendar-search"] = "rbxassetid://10709789200",
	["lucide-calendar-x"] = "rbxassetid://10709789407",
	["lucide-calendar-x-2"] = "rbxassetid://10709789329",
	["lucide-camera"] = "rbxassetid://10709789686",
	["lucide-camera-off"] = "rbxassetid://10747822677",
	["lucide-car"] = "rbxassetid://10709789810",
	["lucide-carrot"] = "rbxassetid://10709789960",
	["lucide-cast"] = "rbxassetid://10709790097",
	["lucide-charge"] = "rbxassetid://10709790202",
	["lucide-check"] = "rbxassetid://10709790644",
	["lucide-check-circle"] = "rbxassetid://10709790387",
	["lucide-check-circle-2"] = "rbxassetid://10709790298",
	["lucide-check-square"] = "rbxassetid://10709790537",
	["lucide-chef-hat"] = "rbxassetid://10709790757",
	["lucide-cherry"] = "rbxassetid://10709790875",
	["lucide-chevron-down"] = "rbxassetid://10709790948",
	["lucide-chevron-first"] = "rbxassetid://10709791015",
	["lucide-chevron-last"] = "rbxassetid://10709791130",
	["lucide-chevron-left"] = "rbxassetid://10709791281",
	["lucide-chevron-right"] = "rbxassetid://10709791437",
	["lucide-chevron-up"] = "rbxassetid://10709791523",
	["lucide-chevrons-down"] = "rbxassetid://10709796864",
	["lucide-chevrons-down-up"] = "rbxassetid://10709791632",
	["lucide-chevrons-left"] = "rbxassetid://10709797151",
	["lucide-chevrons-left-right"] = "rbxassetid://10709797006",
	["lucide-chevrons-right"] = "rbxassetid://10709797382",
	["lucide-chevrons-right-left"] = "rbxassetid://10709797274",
	["lucide-chevrons-up"] = "rbxassetid://10709797622",
	["lucide-chevrons-up-down"] = "rbxassetid://10709797508",
	["lucide-chrome"] = "rbxassetid://10709797725",
	["lucide-circle"] = "rbxassetid://10709798174",
	["lucide-circle-dot"] = "rbxassetid://10709797837",
	["lucide-circle-ellipsis"] = "rbxassetid://10709797985",
	["lucide-circle-slashed"] = "rbxassetid://10709798100",
	["lucide-citrus"] = "rbxassetid://10709798276",
	["lucide-clapperboard"] = "rbxassetid://10709798350",
	["lucide-clipboard"] = "rbxassetid://10709799288",
	["lucide-clipboard-check"] = "rbxassetid://10709798443",
	["lucide-clipboard-copy"] = "rbxassetid://10709798574",
	["lucide-clipboard-edit"] = "rbxassetid://10709798682",
	["lucide-clipboard-list"] = "rbxassetid://10709798792",
	["lucide-clipboard-signature"] = "rbxassetid://10709798890",
	["lucide-clipboard-type"] = "rbxassetid://10709798999",
	["lucide-clipboard-x"] = "rbxassetid://10709799124",
	["lucide-clock"] = "rbxassetid://10709805144",
	["lucide-clock-1"] = "rbxassetid://10709799535",
	["lucide-clock-10"] = "rbxassetid://10709799718",
	["lucide-clock-11"] = "rbxassetid://10709799818",
	["lucide-clock-12"] = "rbxassetid://10709799962",
	["lucide-clock-2"] = "rbxassetid://10709803876",
	["lucide-clock-3"] = "rbxassetid://10709803989",
	["lucide-clock-4"] = "rbxassetid://10709804164",
	["lucide-clock-5"] = "rbxassetid://10709804291",
	["lucide-clock-6"] = "rbxassetid://10709804435",
	["lucide-clock-7"] = "rbxassetid://10709804599",
	["lucide-clock-8"] = "rbxassetid://10709804784",
	["lucide-clock-9"] = "rbxassetid://10709804996",
	["lucide-cloud"] = "rbxassetid://10709806740",
	["lucide-cloud-cog"] = "rbxassetid://10709805262",
	["lucide-cloud-drizzle"] = "rbxassetid://10709805371",
	["lucide-cloud-fog"] = "rbxassetid://10709805477",
	["lucide-cloud-hail"] = "rbxassetid://10709805596",
	["lucide-cloud-lightning"] = "rbxassetid://10709805727",
	["lucide-cloud-moon"] = "rbxassetid://10709805942",
	["lucide-cloud-moon-rain"] = "rbxassetid://10709805838",
	["lucide-cloud-off"] = "rbxassetid://10709806060",
	["lucide-cloud-rain"] = "rbxassetid://10709806277",
	["lucide-cloud-rain-wind"] = "rbxassetid://10709806166",
	["lucide-cloud-snow"] = "rbxassetid://10709806374",
	["lucide-cloud-sun"] = "rbxassetid://10709806631",
	["lucide-cloud-sun-rain"] = "rbxassetid://10709806475",
	["lucide-cloudy"] = "rbxassetid://10709806859",
	["lucide-clover"] = "rbxassetid://10709806995",
	["lucide-code"] = "rbxassetid://10709810463",
	["lucide-code-2"] = "rbxassetid://10709807111",
	["lucide-codepen"] = "rbxassetid://10709810534",
	["lucide-codesandbox"] = "rbxassetid://10709810676",
	["lucide-coffee"] = "rbxassetid://10709810814",
	["lucide-cog"] = "rbxassetid://10709810948",
	["lucide-coins"] = "rbxassetid://10709811110",
	["lucide-columns"] = "rbxassetid://10709811261",
	["lucide-command"] = "rbxassetid://10709811365",
	["lucide-compass"] = "rbxassetid://10709811445",
	["lucide-component"] = "rbxassetid://10709811595",
	["lucide-concierge-bell"] = "rbxassetid://10709811706",
	["lucide-connection"] = "rbxassetid://10747361219",
	["lucide-contact"] = "rbxassetid://10709811834",
	["lucide-contrast"] = "rbxassetid://10709811939",
	["lucide-cookie"] = "rbxassetid://10709812067",
	["lucide-copy"] = "rbxassetid://10709812159",
	["lucide-copyleft"] = "rbxassetid://10709812251",
	["lucide-copyright"] = "rbxassetid://10709812311",
	["lucide-corner-down-left"] = "rbxassetid://10709812396",
	["lucide-corner-down-right"] = "rbxassetid://10709812485",
	["lucide-corner-left-down"] = "rbxassetid://10709812632",
	["lucide-corner-left-up"] = "rbxassetid://10709812784",
	["lucide-corner-right-down"] = "rbxassetid://10709812939",
	["lucide-corner-right-up"] = "rbxassetid://10709813094",
	["lucide-corner-up-left"] = "rbxassetid://10709813185",
	["lucide-corner-up-right"] = "rbxassetid://10709813281",
	["lucide-cpu"] = "rbxassetid://10709813383",
	["lucide-croissant"] = "rbxassetid://10709818125",
	["lucide-crop"] = "rbxassetid://10709818245",
	["lucide-cross"] = "rbxassetid://10709818399",
	["lucide-crosshair"] = "rbxassetid://10709818534",
	["lucide-crown"] = "rbxassetid://10709818626",
	["lucide-cup-soda"] = "rbxassetid://10709818763",
	["lucide-curly-braces"] = "rbxassetid://10709818847",
	["lucide-currency"] = "rbxassetid://10709818931",
	["lucide-container"] = "rbxassetid://17466205552",
	["lucide-database"] = "rbxassetid://10709818996",
	["lucide-delete"] = "rbxassetid://10709819059",
	["lucide-diamond"] = "rbxassetid://10709819149",
	["lucide-dice-1"] = "rbxassetid://10709819266",
	["lucide-dice-2"] = "rbxassetid://10709819361",
	["lucide-dice-3"] = "rbxassetid://10709819508",
	["lucide-dice-4"] = "rbxassetid://10709819670",
	["lucide-dice-5"] = "rbxassetid://10709819801",
	["lucide-dice-6"] = "rbxassetid://10709819896",
	["lucide-dices"] = "rbxassetid://10723343321",
	["lucide-diff"] = "rbxassetid://10723343416",
	["lucide-disc"] = "rbxassetid://10723343537",
	["lucide-divide"] = "rbxassetid://10723343805",
	["lucide-divide-circle"] = "rbxassetid://10723343636",
	["lucide-divide-square"] = "rbxassetid://10723343737",
	["lucide-dollar-sign"] = "rbxassetid://10723343958",
	["lucide-download"] = "rbxassetid://10723344270",
	["lucide-download-cloud"] = "rbxassetid://10723344088",
	["lucide-door-open"] = "rbxassetid://124179241653522",
	["lucide-droplet"] = "rbxassetid://10723344432",
	["lucide-droplets"] = "rbxassetid://10734883356",
	["lucide-drumstick"] = "rbxassetid://10723344737",
	["lucide-edit"] = "rbxassetid://10734883598",
	["lucide-edit-2"] = "rbxassetid://10723344885",
	["lucide-edit-3"] = "rbxassetid://10723345088",
	["lucide-egg"] = "rbxassetid://10723345518",
	["lucide-egg-fried"] = "rbxassetid://10723345347",
	["lucide-electricity"] = "rbxassetid://10723345749",
	["lucide-electricity-off"] = "rbxassetid://10723345643",
	["lucide-equal"] = "rbxassetid://10723345990",
	["lucide-equal-not"] = "rbxassetid://10723345866",
	["lucide-eraser"] = "rbxassetid://10723346158",
	["lucide-euro"] = "rbxassetid://10723346372",
	["lucide-expand"] = "rbxassetid://10723346553",
	["lucide-external-link"] = "rbxassetid://10723346684",
	["lucide-eye"] = "rbxassetid://10723346959",
	["lucide-eye-off"] = "rbxassetid://10723346871",
	["lucide-factory"] = "rbxassetid://10723347051",
	["lucide-fan"] = "rbxassetid://10723354359",
	["lucide-fast-forward"] = "rbxassetid://10723354521",
	["lucide-feather"] = "rbxassetid://10723354671",
	["lucide-figma"] = "rbxassetid://10723354801",
	["lucide-file"] = "rbxassetid://10723374641",
	["lucide-file-archive"] = "rbxassetid://10723354921",
	["lucide-file-audio"] = "rbxassetid://10723355148",
	["lucide-file-audio-2"] = "rbxassetid://10723355026",
	["lucide-file-axis-3d"] = "rbxassetid://10723355272",
	["lucide-file-badge"] = "rbxassetid://10723355622",
	["lucide-file-badge-2"] = "rbxassetid://10723355451",
	["lucide-file-bar-chart"] = "rbxassetid://10723355887",
	["lucide-file-bar-chart-2"] = "rbxassetid://10723355746",
	["lucide-file-box"] = "rbxassetid://10723355989",
	["lucide-file-check"] = "rbxassetid://10723356210",
	["lucide-file-check-2"] = "rbxassetid://10723356100",
	["lucide-file-clock"] = "rbxassetid://10723356329",
	["lucide-file-code"] = "rbxassetid://10723356507",
	["lucide-file-cog"] = "rbxassetid://10723356830",
	["lucide-file-cog-2"] = "rbxassetid://10723356676",
	["lucide-file-diff"] = "rbxassetid://10723357039",
	["lucide-file-digit"] = "rbxassetid://10723357151",
	["lucide-file-down"] = "rbxassetid://10723357322",
	["lucide-file-edit"] = "rbxassetid://10723357495",
	["lucide-file-heart"] = "rbxassetid://10723357637",
	["lucide-file-image"] = "rbxassetid://10723357790",
	["lucide-file-input"] = "rbxassetid://10723357933",
	["lucide-file-json"] = "rbxassetid://10723364435",
	["lucide-file-json-2"] = "rbxassetid://10723364361",
	["lucide-file-key"] = "rbxassetid://10723364605",
	["lucide-file-key-2"] = "rbxassetid://10723364515",
	["lucide-file-line-chart"] = "rbxassetid://10723364725",
	["lucide-file-lock"] = "rbxassetid://10723364957",
	["lucide-file-lock-2"] = "rbxassetid://10723364861",
	["lucide-file-minus"] = "rbxassetid://10723365254",
	["lucide-file-minus-2"] = "rbxassetid://10723365086",
	["lucide-file-output"] = "rbxassetid://10723365457",
	["lucide-file-pie-chart"] = "rbxassetid://10723365598",
	["lucide-file-plus"] = "rbxassetid://10723365877",
	["lucide-file-plus-2"] = "rbxassetid://10723365766",
	["lucide-file-question"] = "rbxassetid://10723365987",
	["lucide-file-scan"] = "rbxassetid://10723366167",
	["lucide-file-search"] = "rbxassetid://10723366550",
	["lucide-file-search-2"] = "rbxassetid://10723366340",
	["lucide-file-signature"] = "rbxassetid://10723366741",
	["lucide-file-spreadsheet"] = "rbxassetid://10723366962",
	["lucide-file-symlink"] = "rbxassetid://10723367098",
	["lucide-file-terminal"] = "rbxassetid://10723367244",
	["lucide-file-text"] = "rbxassetid://10723367380",
	["lucide-file-type"] = "rbxassetid://10723367606",
	["lucide-file-type-2"] = "rbxassetid://10723367509",
	["lucide-file-up"] = "rbxassetid://10723367734",
	["lucide-file-video"] = "rbxassetid://10723373884",
	["lucide-file-video-2"] = "rbxassetid://10723367834",
	["lucide-file-volume"] = "rbxassetid://10723374172",
	["lucide-file-volume-2"] = "rbxassetid://10723374030",
	["lucide-file-warning"] = "rbxassetid://10723374276",
	["lucide-file-x"] = "rbxassetid://10723374544",
	["lucide-file-x-2"] = "rbxassetid://10723374378",
	["lucide-files"] = "rbxassetid://10723374759",
	["lucide-film"] = "rbxassetid://10723374981",
	["lucide-filter"] = "rbxassetid://10723375128",
	["lucide-fingerprint"] = "rbxassetid://10723375250",
	["lucide-flag"] = "rbxassetid://10723375890",
	["lucide-flag-off"] = "rbxassetid://10723375443",
	["lucide-flag-triangle-left"] = "rbxassetid://10723375608",
	["lucide-flag-triangle-right"] = "rbxassetid://10723375727",
	["lucide-flame"] = "rbxassetid://10723376114",
	["lucide-flashlight"] = "rbxassetid://10723376471",
	["lucide-flashlight-off"] = "rbxassetid://10723376365",
	["lucide-flask-conical"] = "rbxassetid://10734883986",
	["lucide-flask-round"] = "rbxassetid://10723376614",
	["lucide-flip-horizontal"] = "rbxassetid://10723376884",
	["lucide-flip-horizontal-2"] = "rbxassetid://10723376745",
	["lucide-flip-vertical"] = "rbxassetid://10723377138",
	["lucide-flip-vertical-2"] = "rbxassetid://10723377026",
	["lucide-flower"] = "rbxassetid://10747830374",
	["lucide-flower-2"] = "rbxassetid://10723377305",
	["lucide-focus"] = "rbxassetid://10723377537",
	["lucide-folder"] = "rbxassetid://10723387563",
	["lucide-folder-archive"] = "rbxassetid://10723384478",
	["lucide-folder-check"] = "rbxassetid://10723384605",
	["lucide-folder-clock"] = "rbxassetid://10723384731",
	["lucide-folder-closed"] = "rbxassetid://10723384893",
	["lucide-folder-cog"] = "rbxassetid://10723385213",
	["lucide-folder-cog-2"] = "rbxassetid://10723385036",
	["lucide-folder-down"] = "rbxassetid://10723385338",
	["lucide-folder-edit"] = "rbxassetid://10723385445",
	["lucide-folder-heart"] = "rbxassetid://10723385545",
	["lucide-folder-input"] = "rbxassetid://10723385721",
	["lucide-folder-key"] = "rbxassetid://10723385848",
	["lucide-folder-lock"] = "rbxassetid://10723386005",
	["lucide-folder-minus"] = "rbxassetid://10723386127",
	["lucide-folder-open"] = "rbxassetid://10723386277",
	["lucide-folder-output"] = "rbxassetid://10723386386",
	["lucide-folder-plus"] = "rbxassetid://10723386531",
	["lucide-folder-search"] = "rbxassetid://10723386787",
	["lucide-folder-search-2"] = "rbxassetid://10723386674",
	["lucide-folder-symlink"] = "rbxassetid://10723386930",
	["lucide-folder-tree"] = "rbxassetid://10723387085",
	["lucide-folder-up"] = "rbxassetid://10723387265",
	["lucide-folder-x"] = "rbxassetid://10723387448",
	["lucide-folders"] = "rbxassetid://10723387721",
	["lucide-form-input"] = "rbxassetid://10723387841",
	["lucide-forward"] = "rbxassetid://10723388016",
	["lucide-frame"] = "rbxassetid://10723394389",
	["lucide-framer"] = "rbxassetid://10723394565",
	["lucide-frown"] = "rbxassetid://10723394681",
	["lucide-fuel"] = "rbxassetid://10723394846",
	["lucide-function-square"] = "rbxassetid://10723395041",
	["lucide-gamepad"] = "rbxassetid://10723395457",
	["lucide-gamepad-2"] = "rbxassetid://10723395215",
	["lucide-gauge"] = "rbxassetid://10723395708",
	["lucide-gavel"] = "rbxassetid://10723395896",
	["lucide-gem"] = "rbxassetid://10723396000",
	["lucide-ghost"] = "rbxassetid://10723396107",
	["lucide-gift"] = "rbxassetid://10723396402",
	["lucide-gift-card"] = "rbxassetid://10723396225",
	["lucide-git-branch"] = "rbxassetid://10723396676",
	["lucide-git-branch-plus"] = "rbxassetid://10723396542",
	["lucide-git-commit"] = "rbxassetid://10723396812",
	["lucide-git-compare"] = "rbxassetid://10723396954",
	["lucide-git-fork"] = "rbxassetid://10723397049",
	["lucide-git-merge"] = "rbxassetid://10723397165",
	["lucide-git-pull-request"] = "rbxassetid://10723397431",
	["lucide-git-pull-request-closed"] = "rbxassetid://10723397268",
	["lucide-git-pull-request-draft"] = "rbxassetid://10734884302",
	["lucide-glass"] = "rbxassetid://10723397788",
	["lucide-glass-2"] = "rbxassetid://10723397529",
	["lucide-glass-water"] = "rbxassetid://10723397678",
	["lucide-glasses"] = "rbxassetid://10723397895",
	["lucide-globe"] = "rbxassetid://10723404337",
	["lucide-globe-2"] = "rbxassetid://10723398002",
	["lucide-grab"] = "rbxassetid://10723404472",
	["lucide-graduation-cap"] = "rbxassetid://10723404691",
	["lucide-grape"] = "rbxassetid://10723404822",
	["lucide-grid"] = "rbxassetid://10723404936",
	["lucide-grip-horizontal"] = "rbxassetid://10723405089",
	["lucide-grip-vertical"] = "rbxassetid://10723405236",
	["lucide-hammer"] = "rbxassetid://10723405360",
	["lucide-hand"] = "rbxassetid://10723405649",
	["lucide-hand-metal"] = "rbxassetid://10723405508",
	["lucide-hard-drive"] = "rbxassetid://10723405749",
	["lucide-hard-hat"] = "rbxassetid://10723405859",
	["lucide-hash"] = "rbxassetid://10723405975",
	["lucide-haze"] = "rbxassetid://10723406078",
	["lucide-headphones"] = "rbxassetid://10723406165",
	["lucide-heart"] = "rbxassetid://10723406885",
	["lucide-heart-crack"] = "rbxassetid://10723406299",
	["lucide-heart-handshake"] = "rbxassetid://10723406480",
	["lucide-heart-off"] = "rbxassetid://10723406662",
	["lucide-heart-pulse"] = "rbxassetid://10723406795",
	["lucide-help-circle"] = "rbxassetid://10723406988",
	["lucide-hexagon"] = "rbxassetid://10723407092",
	["lucide-highlighter"] = "rbxassetid://10723407192",
	["lucide-history"] = "rbxassetid://10723407335",
	["lucide-home"] = "rbxassetid://10723407389",
	["lucide-hourglass"] = "rbxassetid://10723407498",
	["lucide-ice-cream"] = "rbxassetid://10723414308",
	["lucide-image"] = "rbxassetid://10723415040",
	["lucide-image-minus"] = "rbxassetid://10723414487",
	["lucide-image-off"] = "rbxassetid://10723414677",
	["lucide-image-plus"] = "rbxassetid://10723414827",
	["lucide-import"] = "rbxassetid://10723415205",
	["lucide-inbox"] = "rbxassetid://10723415335",
	["lucide-indent"] = "rbxassetid://10723415494",
	["lucide-indian-rupee"] = "rbxassetid://10723415642",
	["lucide-infinity"] = "rbxassetid://10723415766",
	["lucide-info"] = "rbxassetid://10723415903",
	["lucide-inspect"] = "rbxassetid://10723416057",
	["lucide-italic"] = "rbxassetid://10723416195",
	["lucide-japanese-yen"] = "rbxassetid://10723416363",
	["lucide-joystick"] = "rbxassetid://10723416527",
	["lucide-key"] = "rbxassetid://10723416652",
	["lucide-keyboard"] = "rbxassetid://10723416765",
	["lucide-lamp"] = "rbxassetid://10723417513",
	["lucide-lamp-ceiling"] = "rbxassetid://10723416922",
	["lucide-lamp-desk"] = "rbxassetid://10723417016",
	["lucide-lamp-floor"] = "rbxassetid://10723417131",
	["lucide-lamp-wall-down"] = "rbxassetid://10723417240",
	["lucide-lamp-wall-up"] = "rbxassetid://10723417356",
	["lucide-landmark"] = "rbxassetid://10723417608",
	["lucide-languages"] = "rbxassetid://10723417703",
	["lucide-laptop"] = "rbxassetid://10723423881",
	["lucide-laptop-2"] = "rbxassetid://10723417797",
	["lucide-lasso"] = "rbxassetid://10723424235",
	["lucide-lasso-select"] = "rbxassetid://10723424058",
	["lucide-laugh"] = "rbxassetid://10723424372",
	["lucide-layers"] = "rbxassetid://10723424505",
	["lucide-layout"] = "rbxassetid://10723425376",
	["lucide-layout-dashboard"] = "rbxassetid://10723424646",
	["lucide-layout-grid"] = "rbxassetid://10723424838",
	["lucide-layout-list"] = "rbxassetid://10723424963",
	["lucide-layout-template"] = "rbxassetid://10723425187",
	["lucide-leaf"] = "rbxassetid://10723425539",
	["lucide-library"] = "rbxassetid://10723425615",
	["lucide-life-buoy"] = "rbxassetid://10723425685",
	["lucide-lightbulb"] = "rbxassetid://10723425852",
	["lucide-lightbulb-off"] = "rbxassetid://10723425762",
	["lucide-line-chart"] = "rbxassetid://10723426393",
	["lucide-link"] = "rbxassetid://10723426722",
	["lucide-link-2"] = "rbxassetid://10723426595",
	["lucide-link-2-off"] = "rbxassetid://10723426513",
	["lucide-list"] = "rbxassetid://10723433811",
	["lucide-list-checks"] = "rbxassetid://10734884548",
	["lucide-list-end"] = "rbxassetid://10723426886",
	["lucide-list-minus"] = "rbxassetid://10723426986",
	["lucide-list-music"] = "rbxassetid://10723427081",
	["lucide-list-ordered"] = "rbxassetid://10723427199",
	["lucide-list-plus"] = "rbxassetid://10723427334",
	["lucide-list-start"] = "rbxassetid://10723427494",
	["lucide-list-video"] = "rbxassetid://10723427619",
	["lucide-list-todo"] = "rbxassetid://17376008003",
	["lucide-list-x"] = "rbxassetid://10723433655",
	["lucide-loader"] = "rbxassetid://10723434070",
	["lucide-loader-2"] = "rbxassetid://10723433935",
	["lucide-locate"] = "rbxassetid://10723434557",
	["lucide-locate-fixed"] = "rbxassetid://10723434236",
	["lucide-locate-off"] = "rbxassetid://10723434379",
	["lucide-lock"] = "rbxassetid://10723434711",
	["lucide-log-in"] = "rbxassetid://10723434830",
	["lucide-log-out"] = "rbxassetid://10723434906",
	["lucide-luggage"] = "rbxassetid://10723434993",
	["lucide-magnet"] = "rbxassetid://10723435069",
	["lucide-mail"] = "rbxassetid://10734885430",
	["lucide-mail-check"] = "rbxassetid://10723435182",
	["lucide-mail-minus"] = "rbxassetid://10723435261",
	["lucide-mail-open"] = "rbxassetid://10723435342",
	["lucide-mail-plus"] = "rbxassetid://10723435443",
	["lucide-mail-question"] = "rbxassetid://10723435515",
	["lucide-mail-search"] = "rbxassetid://10734884739",
	["lucide-mail-warning"] = "rbxassetid://10734885015",
	["lucide-mail-x"] = "rbxassetid://10734885247",
	["lucide-mails"] = "rbxassetid://10734885614",
	["lucide-map"] = "rbxassetid://10734886202",
	["lucide-map-pin"] = "rbxassetid://10734886004",
	["lucide-map-pin-off"] = "rbxassetid://10734885803",
	["lucide-maximize"] = "rbxassetid://10734886735",
	["lucide-maximize-2"] = "rbxassetid://10734886496",
	["lucide-medal"] = "rbxassetid://10734887072",
	["lucide-megaphone"] = "rbxassetid://10734887454",
	["lucide-megaphone-off"] = "rbxassetid://10734887311",
	["lucide-meh"] = "rbxassetid://10734887603",
	["lucide-menu"] = "rbxassetid://10734887784",
	["lucide-message-circle"] = "rbxassetid://10734888000",
	["lucide-message-square"] = "rbxassetid://10734888228",
	["lucide-mic"] = "rbxassetid://10734888864",
	["lucide-mic-2"] = "rbxassetid://10734888430",
	["lucide-mic-off"] = "rbxassetid://10734888646",
	["lucide-microscope"] = "rbxassetid://10734889106",
	["lucide-microwave"] = "rbxassetid://10734895076",
	["lucide-milestone"] = "rbxassetid://10734895310",
	["lucide-minimize"] = "rbxassetid://10734895698",
	["lucide-minimize-2"] = "rbxassetid://10734895530",
	["lucide-minus"] = "rbxassetid://10734896206",
	["lucide-minus-circle"] = "rbxassetid://10734895856",
	["lucide-minus-square"] = "rbxassetid://10734896029",
	["lucide-monitor"] = "rbxassetid://10734896881",
	["lucide-monitor-off"] = "rbxassetid://10734896360",
	["lucide-monitor-speaker"] = "rbxassetid://10734896512",
	["lucide-moon"] = "rbxassetid://10734897102",
	["lucide-more-horizontal"] = "rbxassetid://10734897250",
	["lucide-more-vertical"] = "rbxassetid://10734897387",
	["lucide-mountain"] = "rbxassetid://10734897956",
	["lucide-mountain-snow"] = "rbxassetid://10734897665",
	["lucide-mouse"] = "rbxassetid://10734898592",
	["lucide-mouse-pointer"] = "rbxassetid://10734898476",
	["lucide-mouse-pointer-2"] = "rbxassetid://10734898194",
	["lucide-mouse-pointer-click"] = "rbxassetid://10734898355",
	["lucide-move"] = "rbxassetid://10734900011",
	["lucide-move-3d"] = "rbxassetid://10734898756",
	["lucide-move-diagonal"] = "rbxassetid://10734899164",
	["lucide-move-diagonal-2"] = "rbxassetid://10734898934",
	["lucide-move-horizontal"] = "rbxassetid://10734899414",
	["lucide-move-vertical"] = "rbxassetid://10734899821",
	["lucide-music"] = "rbxassetid://10734905958",
	["lucide-music-2"] = "rbxassetid://10734900215",
	["lucide-music-3"] = "rbxassetid://10734905665",
	["lucide-music-4"] = "rbxassetid://10734905823",
	["lucide-navigation"] = "rbxassetid://10734906744",
	["lucide-navigation-2"] = "rbxassetid://10734906332",
	["lucide-navigation-2-off"] = "rbxassetid://10734906144",
	["lucide-navigation-off"] = "rbxassetid://10734906580",
	["lucide-network"] = "rbxassetid://10734906975",
	["lucide-newspaper"] = "rbxassetid://10734907168",
	["lucide-octagon"] = "rbxassetid://10734907361",
	["lucide-option"] = "rbxassetid://10734907649",
	["lucide-outdent"] = "rbxassetid://10734907933",
	["lucide-package"] = "rbxassetid://10734909540",
	["lucide-package-2"] = "rbxassetid://10734908151",
	["lucide-package-check"] = "rbxassetid://10734908384",
	["lucide-package-minus"] = "rbxassetid://10734908626",
	["lucide-package-open"] = "rbxassetid://10734908793",
	["lucide-package-plus"] = "rbxassetid://10734909016",
	["lucide-package-search"] = "rbxassetid://10734909196",
	["lucide-package-x"] = "rbxassetid://10734909375",
	["lucide-paint-bucket"] = "rbxassetid://10734909847",
	["lucide-paintbrush"] = "rbxassetid://10734910187",
	["lucide-paintbrush-2"] = "rbxassetid://10734910030",
	["lucide-palette"] = "rbxassetid://10734910430",
	["lucide-palmtree"] = "rbxassetid://10734910680",
	["lucide-paperclip"] = "rbxassetid://10734910927",
	["lucide-party-popper"] = "rbxassetid://10734918735",
	["lucide-pause"] = "rbxassetid://10734919336",
	["lucide-pause-circle"] = "rbxassetid://10735024209",
	["lucide-pause-octagon"] = "rbxassetid://10734919143",
	["lucide-pen-tool"] = "rbxassetid://10734919503",
	["lucide-pencil"] = "rbxassetid://10734919691",
	["lucide-percent"] = "rbxassetid://10734919919",
	["lucide-person-standing"] = "rbxassetid://10734920149",
	["lucide-phone"] = "rbxassetid://10734921524",
	["lucide-phone-call"] = "rbxassetid://10734920305",
	["lucide-phone-forwarded"] = "rbxassetid://10734920508",
	["lucide-phone-incoming"] = "rbxassetid://10734920694",
	["lucide-phone-missed"] = "rbxassetid://10734920845",
	["lucide-phone-off"] = "rbxassetid://10734921077",
	["lucide-phone-outgoing"] = "rbxassetid://10734921288",
	["lucide-pie-chart"] = "rbxassetid://10734921727",
	["lucide-piggy-bank"] = "rbxassetid://10734921935",
	["lucide-pin"] = "rbxassetid://10734922324",
	["lucide-pin-off"] = "rbxassetid://10734922180",
	["lucide-pipette"] = "rbxassetid://10734922497",
	["lucide-pizza"] = "rbxassetid://10734922774",
	["lucide-plane"] = "rbxassetid://10734922971",
	["lucide-plane-landing"] = "rbxassetid://17376029914",
	["lucide-play"] = "rbxassetid://10734923549",
	["lucide-play-circle"] = "rbxassetid://10734923214",
	["lucide-plus"] = "rbxassetid://10734924532",
	["lucide-plus-circle"] = "rbxassetid://10734923868",
	["lucide-plus-square"] = "rbxassetid://10734924219",
	["lucide-podcast"] = "rbxassetid://10734929553",
	["lucide-pointer"] = "rbxassetid://10734929723",
	["lucide-pound-sterling"] = "rbxassetid://10734929981",
	["lucide-power"] = "rbxassetid://10734930466",
	["lucide-power-off"] = "rbxassetid://10734930257",
	["lucide-printer"] = "rbxassetid://10734930632",
	["lucide-puzzle"] = "rbxassetid://10734930886",
	["lucide-quote"] = "rbxassetid://10734931234",
	["lucide-radio"] = "rbxassetid://10734931596",
	["lucide-radio-receiver"] = "rbxassetid://10734931402",
	["lucide-rectangle-horizontal"] = "rbxassetid://10734931777",
	["lucide-rectangle-vertical"] = "rbxassetid://10734932081",
	["lucide-recycle"] = "rbxassetid://10734932295",
	["lucide-redo"] = "rbxassetid://10734932822",
	["lucide-redo-2"] = "rbxassetid://10734932586",
	["lucide-refresh-ccw"] = "rbxassetid://10734933056",
	["lucide-refresh-cw"] = "rbxassetid://10734933222",
	["lucide-refrigerator"] = "rbxassetid://10734933465",
	["lucide-regex"] = "rbxassetid://10734933655",
	["lucide-repeat"] = "rbxassetid://10734933966",
	["lucide-repeat-1"] = "rbxassetid://10734933826",
	["lucide-reply"] = "rbxassetid://10734934252",
	["lucide-reply-all"] = "rbxassetid://10734934132",
	["lucide-rewind"] = "rbxassetid://10734934347",
	["lucide-rocket"] = "rbxassetid://10734934585",
	["lucide-rocking-chair"] = "rbxassetid://10734939942",
	["lucide-rotate-3d"] = "rbxassetid://10734940107",
	["lucide-rotate-ccw"] = "rbxassetid://10734940376",
	["lucide-rotate-cw"] = "rbxassetid://10734940654",
	["lucide-rss"] = "rbxassetid://10734940825",
	["lucide-ruler"] = "rbxassetid://10734941018",
	["lucide-russian-ruble"] = "rbxassetid://10734941199",
	["lucide-sailboat"] = "rbxassetid://10734941354",
	["lucide-save"] = "rbxassetid://10734941499",
	["lucide-scale"] = "rbxassetid://10734941912",
	["lucide-scale-3d"] = "rbxassetid://10734941739",
	["lucide-scaling"] = "rbxassetid://10734942072",
	["lucide-scan"] = "rbxassetid://10734942565",
	["lucide-scan-face"] = "rbxassetid://10734942198",
	["lucide-scan-line"] = "rbxassetid://10734942351",
	["lucide-scissors"] = "rbxassetid://10734942778",
	["lucide-screen-share"] = "rbxassetid://10734943193",
	["lucide-screen-share-off"] = "rbxassetid://10734942967",
	["lucide-shell"] = "rbxassetid://83825045910816",
	["lucide-scroll"] = "rbxassetid://10734943448",
	["lucide-search"] = "rbxassetid://10734943674",
	["lucide-send"] = "rbxassetid://10734943902",
	["lucide-separator-horizontal"] = "rbxassetid://10734944115",
	["lucide-separator-vertical"] = "rbxassetid://10734944326",
	["lucide-server"] = "rbxassetid://10734949856",
	["lucide-server-cog"] = "rbxassetid://10734944444",
	["lucide-server-crash"] = "rbxassetid://10734944554",
	["lucide-server-off"] = "rbxassetid://10734944668",
	["lucide-settings"] = "rbxassetid://10734950309",
	["lucide-settings-2"] = "rbxassetid://10734950020",
	["lucide-share"] = "rbxassetid://10734950813",
	["lucide-share-2"] = "rbxassetid://10734950553",
	["lucide-sheet"] = "rbxassetid://10734951038",
	["lucide-shield"] = "rbxassetid://10734951847",
	["lucide-shield-alert"] = "rbxassetid://10734951173",
	["lucide-shield-check"] = "rbxassetid://10734951367",
	["lucide-shield-close"] = "rbxassetid://10734951535",
	["lucide-shield-off"] = "rbxassetid://10734951684",
	["lucide-shirt"] = "rbxassetid://10734952036",
	["lucide-shopping-bag"] = "rbxassetid://10734952273",
	["lucide-shopping-cart"] = "rbxassetid://10734952479",
	["lucide-shovel"] = "rbxassetid://10734952773",
	["lucide-shower-head"] = "rbxassetid://10734952942",
	["lucide-shrink"] = "rbxassetid://10734953073",
	["lucide-shrub"] = "rbxassetid://10734953241",
	["lucide-shuffle"] = "rbxassetid://10734953451",
	["lucide-sidebar"] = "rbxassetid://10734954301",
	["lucide-sidebar-close"] = "rbxassetid://10734953715",
	["lucide-sidebar-open"] = "rbxassetid://10734954000",
	["lucide-sigma"] = "rbxassetid://10734954538",
	["lucide-signal"] = "rbxassetid://10734961133",
	["lucide-signal-high"] = "rbxassetid://10734954807",
	["lucide-signal-low"] = "rbxassetid://10734955080",
	["lucide-signal-medium"] = "rbxassetid://10734955336",
	["lucide-signal-zero"] = "rbxassetid://10734960878",
	["lucide-siren"] = "rbxassetid://10734961284",
	["lucide-skip-back"] = "rbxassetid://10734961526",
	["lucide-skip-forward"] = "rbxassetid://10734961809",
	["lucide-skull"] = "rbxassetid://10734962068",
	["lucide-slack"] = "rbxassetid://10734962339",
	["lucide-slash"] = "rbxassetid://10734962600",
	["lucide-slice"] = "rbxassetid://10734963024",
	["lucide-sliders"] = "rbxassetid://10734963400",
	["lucide-sliders-horizontal"] = "rbxassetid://10734963191",
	["lucide-smartphone"] = "rbxassetid://10734963940",
	["lucide-smartphone-charging"] = "rbxassetid://10734963671",
	["lucide-smile"] = "rbxassetid://10734964441",
	["lucide-smile-plus"] = "rbxassetid://10734964188",
	["lucide-snowflake"] = "rbxassetid://10734964600",
	["lucide-sofa"] = "rbxassetid://10734964852",
	["lucide-sort-asc"] = "rbxassetid://10734965115",
	["lucide-sort-desc"] = "rbxassetid://10734965287",
	["lucide-speaker"] = "rbxassetid://10734965419",
	["lucide-sprout"] = "rbxassetid://10734965572",
	["lucide-square"] = "rbxassetid://10734965702",
	["lucide-star"] = "rbxassetid://10734966248",
	["lucide-star-half"] = "rbxassetid://10734965897",
	["lucide-star-off"] = "rbxassetid://10734966097",
	["lucide-stethoscope"] = "rbxassetid://10734966384",
	["lucide-sticker"] = "rbxassetid://10734972234",
	["lucide-sticky-note"] = "rbxassetid://10734972463",
	["lucide-stop-circle"] = "rbxassetid://10734972621",
	["lucide-stretch-horizontal"] = "rbxassetid://10734972862",
	["lucide-stretch-vertical"] = "rbxassetid://10734973130",
	["lucide-strikethrough"] = "rbxassetid://10734973290",
	["lucide-subscript"] = "rbxassetid://10734973457",
	["lucide-sun"] = "rbxassetid://10734974297",
	["lucide-sun-dim"] = "rbxassetid://10734973645",
	["lucide-sun-medium"] = "rbxassetid://10734973778",
	["lucide-sun-moon"] = "rbxassetid://10734973999",
	["lucide-sun-snow"] = "rbxassetid://10734974130",
	["lucide-sunrise"] = "rbxassetid://10734974522",
	["lucide-sunset"] = "rbxassetid://10734974689",
	["lucide-superscript"] = "rbxassetid://10734974850",
	["lucide-swiss-franc"] = "rbxassetid://10734975024",
	["lucide-switch-camera"] = "rbxassetid://10734975214",
	["lucide-sword"] = "rbxassetid://10734975486",
	["lucide-swords"] = "rbxassetid://10734975692",
	["lucide-syringe"] = "rbxassetid://10734975932",
	["lucide-table"] = "rbxassetid://10734976230",
	["lucide-table-2"] = "rbxassetid://10734976097",
	["lucide-tablet"] = "rbxassetid://10734976394",
	["lucide-tag"] = "rbxassetid://10734976528",
	["lucide-tags"] = "rbxassetid://10734976739",
	["lucide-target"] = "rbxassetid://10734977012",
	["lucide-tent"] = "rbxassetid://10734981750",
	["lucide-terminal"] = "rbxassetid://10734982144",
	["lucide-terminal-square"] = "rbxassetid://10734981995",
	["lucide-text-cursor"] = "rbxassetid://10734982395",
	["lucide-text-cursor-input"] = "rbxassetid://10734982297",
	["lucide-thermometer"] = "rbxassetid://10734983134",
	["lucide-thermometer-snowflake"] = "rbxassetid://10734982571",
	["lucide-thermometer-sun"] = "rbxassetid://10734982771",
	["lucide-thumbs-down"] = "rbxassetid://10734983359",
	["lucide-thumbs-up"] = "rbxassetid://10734983629",
	["lucide-ticket"] = "rbxassetid://10734983868",
	["lucide-timer"] = "rbxassetid://10734984606",
	["lucide-timer-off"] = "rbxassetid://10734984138",
	["lucide-timer-reset"] = "rbxassetid://10734984355",
	["lucide-toggle-left"] = "rbxassetid://10734984834",
	["lucide-toggle-right"] = "rbxassetid://10734985040",
	["lucide-tornado"] = "rbxassetid://10734985247",
	["lucide-toy-brick"] = "rbxassetid://10747361919",
	["lucide-train"] = "rbxassetid://10747362105",
	["lucide-trash"] = "rbxassetid://10747362393",
	["lucide-trash-2"] = "rbxassetid://10747362241",
	["lucide-tree-deciduous"] = "rbxassetid://10747362534",
	["lucide-tree-pine"] = "rbxassetid://10747362748",
	["lucide-trees"] = "rbxassetid://10747363016",
	["lucide-trending-down"] = "rbxassetid://10747363205",
	["lucide-trending-up"] = "rbxassetid://10747363465",
	["lucide-triangle"] = "rbxassetid://10747363621",
	["lucide-trophy"] = "rbxassetid://10747363809",
	["lucide-truck"] = "rbxassetid://10747364031",
	["lucide-tv"] = "rbxassetid://10747364593",
	["lucide-tv-2"] = "rbxassetid://10747364302",
	["lucide-type"] = "rbxassetid://10747364761",
	["lucide-umbrella"] = "rbxassetid://10747364971",
	["lucide-underline"] = "rbxassetid://10747365191",
	["lucide-undo"] = "rbxassetid://10747365484",
	["lucide-undo-2"] = "rbxassetid://10747365359",
	["lucide-unlink"] = "rbxassetid://10747365771",
	["lucide-unlink-2"] = "rbxassetid://10747397871",
	["lucide-unlock"] = "rbxassetid://10747366027",
	["lucide-upload"] = "rbxassetid://10747366434",
	["lucide-upload-cloud"] = "rbxassetid://10747366266",
	["lucide-usb"] = "rbxassetid://10747366606",
	["lucide-user"] = "rbxassetid://10747373176",
	["lucide-user-check"] = "rbxassetid://10747371901",
	["lucide-user-cog"] = "rbxassetid://10747372167",
	["lucide-user-minus"] = "rbxassetid://10747372346",
	["lucide-user-plus"] = "rbxassetid://10747372702",
	["lucide-user-x"] = "rbxassetid://10747372992",
	["lucide-users"] = "rbxassetid://10747373426",
	["lucide-utensils"] = "rbxassetid://10747373821",
	["lucide-utensils-crossed"] = "rbxassetid://10747373629",
	["lucide-venetian-mask"] = "rbxassetid://10747374003",
	["lucide-verified"] = "rbxassetid://10747374131",
	["lucide-vibrate"] = "rbxassetid://10747374489",
	["lucide-vibrate-off"] = "rbxassetid://10747374269",
	["lucide-video"] = "rbxassetid://10747374938",
	["lucide-video-off"] = "rbxassetid://10747374721",
	["lucide-view"] = "rbxassetid://10747375132",
	["lucide-voicemail"] = "rbxassetid://10747375281",
	["lucide-volume"] = "rbxassetid://10747376008",
	["lucide-volume-1"] = "rbxassetid://10747375450",
	["lucide-volume-2"] = "rbxassetid://10747375679",
	["lucide-volume-x"] = "rbxassetid://10747375880",
	["lucide-wheat"] = "rbxassetid://80877624162595",
	["lucide-wallet"] = "rbxassetid://10747376205",
	["lucide-wand"] = "rbxassetid://10747376565",
	["lucide-wand-2"] = "rbxassetid://10747376349",
	["lucide-watch"] = "rbxassetid://10747376722",
	["lucide-waves"] = "rbxassetid://10747376931",
	["lucide-webcam"] = "rbxassetid://10747381992",
	["lucide-wifi"] = "rbxassetid://10747382504",
	["lucide-wifi-off"] = "rbxassetid://10747382268",
	["lucide-wind"] = "rbxassetid://10747382750",
	["lucide-wrap-text"] = "rbxassetid://10747383065",
	["lucide-wrench"] = "rbxassetid://10747383470",
	["lucide-x"] = "rbxassetid://10747384394",
	["lucide-x-circle"] = "rbxassetid://10747383819",
	["lucide-x-octagon"] = "rbxassetid://10747384037",
	["lucide-x-square"] = "rbxassetid://10747384217",
	["lucide-zoom-in"] = "rbxassetid://10747384552",
	["lucide-zoom-out"] = "rbxassetid://10747384679",
	["lucide-cat"] = "rbxassetid://16935650691",
	["lucide-message-circle-question"] = "rbxassetid://16970049192",
	["lucide-webhook"] = "rbxassetid://17320556264",
	["lucide-dumbbell"] = "rbxassetid://18273453053"
}

function Library:GetIcon(Name)
	if Name ~= nil and Icons["lucide-" .. Name] then
		return Icons["lucide-" .. Name]
	end
	return nil
end

local Elements = {}
Elements.__index = Elements
Elements.__namecall = function(Table, Key, ...)
	return Elements[Key](...)
end

for _, ElementComponent in pairs(ElementsTable) do
	Elements["Add" .. ElementComponent.__type] = function(self, Idx, Config)
		ElementComponent.Container = self.Container
		ElementComponent.Type = self.Type
		ElementComponent.ScrollFrame = self.ScrollFrame
		ElementComponent.Library = Library

		return ElementComponent:New(Idx, Config)
	end
end

Library.Elements = Elements

if RunService:IsStudio() then
	makefolder = function(...) return ... end;
	makefile = function(...) return ... end;
	isfile = function(...) return ... end;
	isfolder = function(...) return ... end;
	readfile = function(...) return ... end;
	writefile = function(...) return ... end;
	listfiles = function (...) return {...} end;
end

local SaveManager = {} do
	SaveManager.Folder = "FluentSettings"
	SaveManager.Ignore = {}
	SaveManager.Parser = {
		Toggle = {
			Save = function(idx, object) 
				return { type = "Toggle", idx = idx, value = object.Value } 
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] then 
					SaveManager.Options[idx]:SetValue(data.value)
				end
			end,
		},
		Slider = {
			Save = function(idx, object)
				return { type = "Slider", idx = idx, value = tostring(object.Value) }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] then 
					SaveManager.Options[idx]:SetValue(data.value)
				end
			end,
		},
		Dropdown = {
			Save = function(idx, object)
				return { type = "Dropdown", idx = idx, value = object.Value, mutli = object.Multi }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] then 
					SaveManager.Options[idx]:SetValue(data.value)
				end
			end,
		},
		Colorpicker = {
			Save = function(idx, object)
				return { type = "Colorpicker", idx = idx, value = object.Value:ToHex(), transparency = object.Transparency }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] then 
					SaveManager.Options[idx]:SetValueRGB(Color3.fromHex(data.value), data.transparency)
				end
			end,
		},
		Keybind = {
			Save = function(idx, object)
				return { type = "Keybind", idx = idx, mode = object.Mode, key = object.Value }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] then 
					SaveManager.Options[idx]:SetValue(data.key, data.mode)
				end
			end,
		},

		Input = {
			Save = function(idx, object)
				return { type = "Input", idx = idx, text = object.Value }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] and type(data.text) == "string" then
					SaveManager.Options[idx]:SetValue(data.text)
				end
			end,
		},
	}

	function SaveManager:SetIgnoreIndexes(list)
		for _, key in next, list do
			self.Ignore[key] = true
		end
	end

	function SaveManager:SetFolder(folder)
		self.Folder = folder;
		self:BuildFolderTree()
	end

	function SaveManager:Save(name)
		if (not name) then
			return false, "no config file is selected"
		end

		local fullPath = self.Folder .. "/" .. name .. ".json"

		local data = {
			objects = {}
		}

		for idx, option in next, SaveManager.Options do
			if not self.Parser[option.Type] then continue end
			if self.Ignore[idx] then continue end

			table.insert(data.objects, self.Parser[option.Type].Save(idx, option))
		end	

		local success, encoded = pcall(httpService.JSONEncode, httpService, data)
		if not success then
			return false, "failed to encode data"
		end

		writefile(fullPath, encoded)
		return true
	end

	function SaveManager:Load(name)
		if (not name) then
			return false, "no config file is selected"
		end

		local file = self.Folder .. "/" .. name .. ".json"
		if not isfile(file) then return false, "Create Config Save File" end

		local success, decoded = pcall(httpService.JSONDecode, httpService, readfile(file))
		if not success then return false, "decode error" end

		for _, option in next, decoded.objects do
			if self.Parser[option.type] and not self.Ignore[option.idx] then
				task.spawn(function() self.Parser[option.type].Load(option.idx, option) end) -- task.spawn() so the config loading wont get stuck.
			end
		end

		Fluent.SettingLoaded = true

		return true, decoded
	end

	function SaveManager:IgnoreThemeSettings()
		self:SetIgnoreIndexes({ 
			"InterfaceTheme", "AcrylicToggle", "TransparentToggle", "MenuKeybind"
		})
	end

	function SaveManager:BuildFolderTree()
		local paths = {
			self.Folder,
			self.Folder .. "/"
		}

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function SaveManager:RefreshConfigList()
		local list = listfiles(self.Folder .. "/")

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-5) == ".json" then
				local pos = file:find(".json", 1, true)
				local start = pos

				local char = file:sub(pos, pos)
				while char ~= "/" and char ~= "\\" and char ~= "" do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == "/" or char == "\\" then
					local name = file:sub(pos + 1, start - 1)
					if name ~= "options" then
						table.insert(out, name)
					end
				end
			end
		end

		return out
	end

	function SaveManager:SetLibrary(library)
		self.Library = library
		self.Options = library.Options
	end

	function SaveManager:LoadAutoloadConfig()
		if isfile(self.Folder .. "/autoload.txt") then
			local name = readfile(self.Folder .. "/autoload.txt")

			local success, err = self:Load(name)
			if not success then
				return self.Library:Notify({
					Title = "Interface",
					Content = "Config loader",
					SubContent = "Failed to load autoload config: " .. err,
					Duration = 7
				})
			end

			self.Library:Notify({
				Title = "Interface",
				Content = "Config loader",
				SubContent = string.format("Auto loaded config %q", name),
				Duration = 7
			})
		end
	end

	function SaveManager:BuildConfigSection(tab)
		assert(self.Library, "Must set SaveManager.Library")

		local section = tab:AddSection("Configuration")

		section:AddInput("SaveManager_ConfigName",    { Title = "Config name" })
		section:AddDropdown(" ", { Title = "Config list", Values = self:RefreshConfigList(), AllowNull = true })

		section:AddButton({
			Title = "Create config",
			Callback = function()
				local name = SaveManager.Options.SaveManager_ConfigName.Value

				if name:gsub(" ", "") == "" then 
					return self.Library:Notify({
						Title = "Interface",
						Content = "Config loader",
						SubContent = "Invalid config name (empty)",
						Duration = 7
					})
				end

				local success, err = self:Save(name)
				if not success then
					return self.Library:Notify({
						Title = "Interface",
						Content = "Config loader",
						SubContent = "Failed to save config: " .. err,
						Duration = 7
					})
				end

				self.Library:Notify({
					Title = "Interface",
					Content = "Config loader",
					SubContent = string.format("Created config %q", name),
					Duration = 7
				})

				SaveManager.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
				SaveManager.Options.SaveManager_ConfigList:SetValue(nil)
			end
		})

		section:AddButton({Title = "Load config", Callback = function()
			local name = SaveManager.Options.SaveManager_ConfigList.Value

			local success, err = self:Load(name)
			if not success then
				return self.Library:Notify({
					Title = "Interface",
					Content = "Config loader",
					SubContent = "Failed to load config: " .. err,
					Duration = 7
				})
			end

			self.Library:Notify({
				Title = "Interface",
				Content = "Config loader",
				SubContent = string.format("Loaded config %q", name),
				Duration = 7
			})
		end})

		section:AddButton({Title = "Save config", Callback = function()
			local name = SaveManager.Options.SaveManager_ConfigList.Value

			local success, err = self:Save(name)
			if not success then
				return self.Library:Notify({
					Title = "Interface",
					Content = "Config loader",
					SubContent = "Failed to overwrite config: " .. err,
					Duration = 7
				})
			end

			self.Library:Notify({
				Title = "Interface",
				Content = "Config loader",
				SubContent = string.format("Overwrote config %q", name),
				Duration = 7
			})
		end})

		section:AddButton({Title = "Refresh list", Callback = function()
			SaveManager.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
			SaveManager.Options.SaveManager_ConfigList:SetValue(nil)
		end})

		local AutoloadButton
		AutoloadButton = section:AddButton({Title = "Set as autoload", Description = "Current autoload config: none", Callback = function()
			local name = SaveManager.Options.SaveManager_ConfigList.Value
			writefile(self.Folder .. "/autoload.txt", name)
			AutoloadButton:SetDesc("Current autoload config: " .. name)
			self.Library:Notify({
				Title = "Interface",
				Content = "Config loader",
				SubContent = string.format("Set %q to auto load", name),
				Duration = 7
			})
		end})

		if isfile(self.Folder .. "/autoload.txt") then
			local name = readfile(self.Folder .. "/autoload.txt")
			AutoloadButton:SetDesc("Current autoload config: " .. name)
		end

		SaveManager:SetIgnoreIndexes({ "SaveManager_ConfigList", "SaveManager_ConfigName" })
	end

	-- SaveManager:BuildFolderTree()
end

local InterfaceManager = {} do
	InterfaceManager.Folder = "FluentSettings"
	InterfaceManager.Settings = {
		Acrylic = true,
		Transparency = true,
		MenuKeybind = "M"
	}

	function InterfaceManager:SetTheme(name)
		InterfaceManager.Settings.Theme = name
	end

	function InterfaceManager:SetFolder(folder)
		self.Folder = folder;
		self:BuildFolderTree()
	end

	function InterfaceManager:SetLibrary(library)
		self.Library = library
	end

	function InterfaceManager:BuildFolderTree()
		local paths = {}

		local parts = self.Folder:split("/")
		for idx = 1, #parts do
			paths[#paths + 1] = table.concat(parts, "/", 1, idx)
		end

		table.insert(paths, self.Folder)
		table.insert(paths, self.Folder .. "/")

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function InterfaceManager:SaveSettings()
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local FileName = LocalPlayer.Name .. ".phuocmaru_interface.json"

	writefile(
		self.Folder .. "/" .. FileName,
		httpService:JSONEncode(InterfaceManager.Settings)
	)
end

function InterfaceManager:LoadSettings()
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local FileName = LocalPlayer.Name .. ".phuocmaru_interface.json"

	local path = self.Folder .. "/" .. FileName

	if isfile(path) then
		local data = readfile(path)
		local success, decoded = pcall(httpService.JSONDecode, httpService, data)

		if success then
			for i, v in next, decoded do
				InterfaceManager.Settings[i] = v
			end
		end
	end
end

function InterfaceManager:BuildInterfaceSection(tab)
	assert(self.Library, "Must set InterfaceManager.Library")
	local Library = self.Library
	local Settings = InterfaceManager.Settings

		local section = tab:AddSection("Interface")
		local InterfaceTheme = section:AddDropdown("InterfaceTheme", {
			Title = "Theme",
			Description = "Changes the interface theme.",
			Values = Library.Themes,
			Default = self.Library.Theme,
			Callback = function(Value)
				Library:SetTheme(Value)
				Settings.Theme = Value
				InterfaceManager:SaveSettings()
			end
		})

		InterfaceTheme:SetValue(Settings.Theme)

		section:AddToggle("TransparentToggle", {
			Title = "Transparency",
			Description = "Makes the interface transparent.",
			Default = Library.Transparency,
			Callback = function(Value)
				Library:ToggleTransparency(Value)
				Settings.Transparency = Value
				InterfaceManager:SaveSettings()
			end
		})

		local MenuKeybind = section:AddKeybind("MenuKeybind", { Title = "Minimize Bind", Default = Library.MinimizeKey.Name or Settings.MenuKeybind })
		MenuKeybind:OnChanged(function()
			Settings.MenuKeybind = MenuKeybind.Value
			InterfaceManager:SaveSettings()
		end)
		Library.MinimizeKeybind = MenuKeybind

		InterfaceManager:LoadSettings()
	end
end

function Library:CreateWindow(Config)
	assert(Config.Title, "Window - Missing Title")

	if Library.Window then
		print("You cannot create more than one window.")
		return
	end

	Library.MinimizeKey = Config.MinimizeKey or Enum.KeyCode.RightControl
	Library.UseAcrylic = Config.Acrylic or false
	Library.Acrylic = Config.Acrylic or false
	Library.Theme = Config.Theme or "Darker"
	Library.Transparency = Config.Transparency or false
	if Config.Acrylic then
		Acrylic.init()
	end

	local Window = Components.Window({
		Parent = GUI,
		Size = Config.Size,
		Title = Config.Title,
		SubTitle = Config.SubTitle,
		TabWidth = Config.TabWidth,
	})

	Library.Window = Window
	InterfaceManager:SetTheme(Config.Theme)
	Library:SetTheme(Config.Theme)

	--local Dragging, DragInput, MousePos, StartPos = false

	-- if not Config.NoMinimize then
	-- 	local MinimizeButton = New("TextButton", {
	-- 		BackgroundTransparency = 1,
	-- 		Size = UDim2.new(1, 0, 1, 0),
	-- 		BorderSizePixel = 0
	-- 	}, {
	-- 		New("UIPadding", {
	-- 			PaddingBottom = UDim.new(0, 2),
	-- 			PaddingLeft = UDim.new(0, 2),
	-- 			PaddingRight = UDim.new(0, 2),
	-- 			PaddingTop = UDim.new(0, 2),
	-- 		}),
	-- 		New("ImageLabel", {
	-- 			Image = Config.MinimizerIcon or "rbxassetid://9681970193",
	-- 			Size = UDim2.new(1, 0, 1, 0),
	-- 			BackgroundTransparency = 1,
	-- 		}, {
	-- 			New("UIAspectRatioConstraint", {
	-- 				AspectRatio = 1,
	-- 				AspectType = Enum.AspectType.FitWithinMaxSize,
	-- 			})
	-- 		})
	-- 	})

	-- 	local Minimizer = New("Frame", {
	-- 		Parent = GUI,
	-- 		Size = UDim2.new(0, 60, 0, 60),
	-- 		Position = UDim2.new(0.45, 0, 0.025, 0),
	-- 		BackgroundTransparency = 1,
	-- 		ZIndex = 999999999,
	-- 	},
	-- 	{
	-- 		New("Frame", {
	-- 			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	-- 			Size = UDim2.new(1, 0, 1, 0),
	-- 			BackgroundTransparency = 0.5,
	-- 			BorderSizePixel = 0
	-- 		}, {
	-- 			New("UICorner", {
	-- 				CornerRadius = UDim.new(0.25, 0),
	-- 			}),
	-- 			MinimizeButton
	-- 		})
	-- 	})

	-- 	local Dragging = false
	-- 	local DragInput = nil
	-- 	local MousePos = nil
	-- 	local StartPos = nil

	-- 	local RunService = game:GetService("RunService")
	-- 	local updateConnection

	-- 	local TweenService = game:GetService("TweenService")
	-- 	local tweenInfo = TweenInfo.new(
	-- 		0.1,
	-- 		Enum.EasingStyle.Quad,
	-- 		Enum.EasingDirection.Out
	-- 	)

	-- 	local function ClampPosition(position)
	-- 		local screenSize = workspace.CurrentCamera.ViewportSize
	-- 		local frameSize = Minimizer.AbsoluteSize

	-- 		local minX = 0
	-- 		local maxX = screenSize.X - frameSize.X
	-- 		local minY = 0
	-- 		local maxY = screenSize.Y - frameSize.Y

	-- 		local newX = math.clamp(position.X.Offset, minX, maxX)
	-- 		local newY = math.clamp(position.Y.Offset, minY, maxY)

	-- 		return UDim2.new(position.X.Scale, newX, position.Y.Scale, newY)
	-- 	end

	-- 	local function UpdatePosition()
	-- 		if not Dragging or not DragInput or not MousePos then return end

	-- 		local Delta = DragInput.Position - MousePos
	-- 		local TargetPosition = UDim2.new(
	-- 			StartPos.X.Scale, 
	-- 			StartPos.X.Offset + Delta.X, 
	-- 			StartPos.Y.Scale, 
	-- 			StartPos.Y.Offset + Delta.Y
	-- 		)

	-- 		local tween = TweenService:Create(Minimizer, tweenInfo, {Position = TargetPosition})
	-- 		tween:Play()
	-- 	end

	-- 	Creator.AddSignal(Minimizer.InputBegan, function(Input)
	-- 		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
	-- 			Dragging = true
	-- 			MousePos = Input.Position
	-- 			StartPos = Minimizer.Position

	-- 			Input.Changed:Connect(function()
	-- 				if Input.UserInputState == Enum.UserInputState.End then
	-- 					Dragging = false
	-- 				end
	-- 			end)
	-- 		end
	-- 	end)

	-- 	Creator.AddSignal(MinimizeButton.InputBegan, function(Input)
	-- 		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
	-- 			Dragging = true
	-- 			MousePos = Input.Position
	-- 			StartPos = Minimizer.Position

	-- 			Input.Changed:Connect(function()
	-- 				if Input.UserInputState == Enum.UserInputState.End then
	-- 					Dragging = false
	-- 				end
	-- 			end)
	-- 		end
	-- 	end)

	-- 	Creator.AddSignal(MinimizeButton.InputChanged, function(Input)
	-- 		if (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
	-- 			DragInput = Input
	-- 			UpdatePosition()
	-- 		end
	-- 	end)

	-- 	Creator.AddSignal(Minimizer.InputChanged, function(Input)
	-- 		if (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
	-- 			DragInput = Input
	-- 			UpdatePosition()
	-- 		end
	-- 	end)

	-- 	Creator.AddSignal(RunService.Heartbeat, function()
	-- 		if Dragging and DragInput and MousePos then
	-- 			UpdatePosition()
	-- 		end
	-- 	end)

	-- 	AddSignal(MinimizeButton.MouseButton1Click, function()
	-- 		Window:Minimize()
	-- 	end)
	-- end

	-- Creator.AddSignal(UserInputService.InputChanged, function(Input)
	-- 	if Input == DragInput and Dragging then
	-- 		local GuiInset = game:GetService("GuiService"):GetGuiInset()
	-- 		local Delta = Input.Position - MousePos
	-- 		local ViewportSize = workspace.Camera.ViewportSize
	-- 		local CurrentX = StartPos.X.Scale + (Delta.X/ViewportSize.X)
	-- 		local CurrentY = StartPos.Y.Scale + (Delta.Y/ViewportSize.Y)

	-- 		if CurrentX<0 or CurrentX > (ViewportSize.X - Minimizer.AbsoluteSize.X)/ViewportSize.X then
	-- 			if CurrentX < 0 then
	-- 				CurrentX = 0
	-- 			else
	-- 				CurrentX = (ViewportSize.X - Minimizer.AbsoluteSize.X)/ViewportSize.X
	-- 			end
	-- 		end

	-- 		if CurrentY < 0 or CurrentY > ((ViewportSize.Y + GuiInset.Y) - Minimizer.AbsoluteSize.Y)/(ViewportSize.Y + GuiInset.Y) then
	-- 			if CurrentY < 0 then
	-- 				CurrentY = 0
	-- 			else
	-- 				CurrentY = ((ViewportSize.Y + GuiInset.Y) - Minimizer.AbsoluteSize.Y)/(ViewportSize.Y + GuiInset.Y)
	-- 			end
	-- 		end

	-- 		Minimizer.Position = UDim2.fromScale(CurrentX, CurrentY)
	-- 	end
	-- end)

	if game:GetService("CoreGui"):FindFirstChild("CoreScripts") then
		game:GetService("CoreGui"):FindFirstChild("CoreScripts"):Destroy()
	end
	
	local PidUi = Instance.new("ScreenGui")
	local Main = Instance.new("ImageButton")
	local UICorner = Instance.new("UICorner")
	PidUi.Name = "CoreScripts"
	PidUi.Parent = game:GetService("CoreGui")
	PidUi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Main.Name = "Main"
	Main.Parent = PidUi
	Main.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.081166774, 0, 0.0841463208, 0)
	Main.Size = UDim2.new(0, 50, 0, 50)
	Main.Image = "http://www.roblox.com/asset/?id=9681970193"
	local function MakeDraggable(topbarobject, object)
		local Dragging = nil
		local DragInput = nil
		local DragStart = nil
		local StartPosition = nil

		local function Update(input)
			local Delta = input.Position - DragStart
			local pos =
				UDim2.new(
					StartPosition.X.Scale,
					StartPosition.X.Offset + Delta.X,
					StartPosition.Y.Scale,
					StartPosition.Y.Offset + Delta.Y
				)
			local Tween = game:GetService("TweenService"):Create(object, TweenInfo.new(0.2), {Position = pos})
			Tween:Play()
		end

		topbarobject.InputBegan:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					Dragging = true
					DragStart = input.Position
					StartPosition = object.Position

					input.Changed:Connect(
						function()
							if input.UserInputState == Enum.UserInputState.End then
								Dragging = false
							end
						end
					)
				end
			end
		)

		topbarobject.InputChanged:Connect(
			function(input)
				if
					input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
				then
					DragInput = input
				end
			end
		)

		game:GetService("UserInputService").InputChanged:Connect(
			function(input)
				if input == DragInput and Dragging then
					Update(input)
				end
			end
		)
	end
	MakeDraggable(Main, Main)
	UICorner.CornerRadius = UDim.new(0, 12)
	UICorner.Parent = Main

	AddSignal(Main.MouseButton1Click, function()
		Window:Minimize()
	end)

	return Window
end

function Library:SetTheme(Value)
	-- accept both the theme name (string) and validate it exists
	if not Value then return end
	if not Themes[Value] then
		-- ลอง fallback ถ้าชื่อ case ไม่ตรง
		for k in pairs(Themes) do
			if type(k) == "string" and k:lower() == Value:lower() then
				Value = k
				break
			end
		end
	end
	if not Themes[Value] then return end  -- still not found

	Library.Theme = Value
	Creator.UpdateTheme()
end

function Library:Destroy()
	if Library.Window then
		Library.Unloaded = true
		-- if Library.UseAcrylic then
		-- 	Library.Window.AcrylicPaint.Model:Destroy()
		-- end
		Creator.Disconnect()
		Library.GUI:Destroy()
	end
end

function Library:ToggleAcrylic(Value)
	if Library.Window then
		if Library.UseAcrylic then
			Library.Acrylic = Value
			Library.Window.AcrylicPaint.Model.Transparency = Value and 0.98 or 1
			if Value then
				Acrylic.Enable()
			else
				Acrylic.Disable()
			end
		end
	end
end

function Library:ToggleTransparency(Value)
	-- if Library.Window then
	-- 	Library.Window.AcrylicPaint.Frame.Background.BackgroundTransparency = Value and 0.35 or 0
	-- end
end

function Library:Notify(Config)
	return NotificationModule:New(Config)
end

if getgenv then
	getgenv().Fluent = Library
else
	Fluent = Library
end

return Library, SaveManager, InterfaceManager
        end
        return __fluent_loader()
    end)
    if not ok then
        error("[MaruHub] Embedded Fluent UI failed: " .. tostring(a))
    end
    Fluent, SaveManager, InterfaceManager = a, b, c
    if type(Fluent) ~= "table" or type(Fluent.CreateWindow) ~= "function" then
        error("[MaruHub] Embedded Fluent UI returned an invalid library.")
    end
end

local title = "Maru Hub Premium"
local subtitle = "[ By Phuocdepzai ]"

local Window = Fluent:CreateWindow({
    Title = title,
    SubTitle = subtitle,
    Size = UDim2.fromOffset(550, 388),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl,
    TabWidth = 140
})

-- FIX: Anti-crack check (safe - only kicks if title is actually changed)
if title ~= "Maru Hub Premium" or subtitle ~= "[ By Phuocdepzai ]" then
    warn("[MaruHub] Title/subtitle mismatch - anti-crack triggered")
    -- game.Players.LocalPlayer:Kick("crack con mẹ mày") -- commented: prevent accidental kick during testing
end

local Tabs = {
    Status = Window:AddTab({
        Title = "Status",
        Icon = "bar-chart"
    }),

    Settings = Window:AddTab({
        Title = "Farm Settings",
        Icon = "wrench"
    }),

    Main = Window:AddTab({
        Title = "Main",
        Icon = "home"
    }),

    MultiFarm = Window:AddTab({
        Title = "Multi Farm",
        Icon = "component"
    }),

    Quest = Window:AddTab({
        Title = "Quests",
        Icon = "scroll"
    }),

    Quests = Window:AddTab({
        Title = "Items",
        Icon = "package"
    }),

    Mirage = Window:AddTab({
        Title = "Race",
        Icon = "star"
    }),

    SeaEvent = Window:AddTab({
        Title = "Sea Events",
        Icon = "waves"
    }),

    Raids = Window:AddTab({
        Title = "Raid",
        Icon = "swords"
    }),

    Dungeons = Window:AddTab({
        Title = "Dungeon",
        Icon = "door-open"
    }),

    Locations = Window:AddTab({
        Title = "Location",
        Icon = "compass"
    }),

    Fruit = Window:AddTab({
        Title = "Fruit",
        Icon = "apple"
    }),

    Shop = Window:AddTab({
        Title = "Shop",
        Icon = "shopping-cart"
    }),

    Combat = Window:AddTab({
        Title = "PVP",
        Icon = "users"
    }),

    Setting = Window:AddTab({
        Title = "Settings",
        Icon = "settings"
    })
}

Tabs.Status:AddSection("Server Stats")

Tabs.Status:AddParagraph({
    Title = "Place Id",
    Content = tostring(game.PlaceId)
})

local StatServer = Tabs.Status:AddParagraph({
    Title = "Server Time",
    Content = ""
})

Tabs.Status:AddSection("Local Stats")

local StatElite = Tabs.Status:AddParagraph({
    Title = "Elite Progress",
    Content = ""
})

local StatKen = Tabs.Status:AddParagraph({
    Title = "Ken Level",
    Content = ""
})

local StatCake = Tabs.Status:AddParagraph({
    Title = "Cake Prince",
    Content = ""
})

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local serverTime = math.floor(workspace.DistributedGameTime)
            local mins = math.floor(serverTime / 60)
            local secs = serverTime % 60

            if serverTime < 60 then
                StatServer:SetDesc(secs .. " Second(s)")
            else
                StatServer:SetDesc(
                    mins .. " Minute(s), " .. secs .. " Second(s)"
                )
            end
        end)

        pcall(function()
            if World3 then
                local eliteVal =
                    replicated.Remotes.CommF_:InvokeServer(
                        "EliteHunter",
                        "Progress"
                    )

                StatElite:SetDesc(
                    "Elite Progress: " .. tostring(eliteVal)
                )
            else
                StatElite:SetDesc("Elite Progress: N/A")
            end
        end)

        pcall(function()
            local kenValue = plr:FindFirstChild("VisionRadius")

            if kenValue then
                StatKen:SetDesc(
                    tostring(math.floor(kenValue.Value)) .. " / 5000"
                )
            else
                StatKen:SetDesc("N/A")
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(3) do
        pcall(function()
            local ok, result = pcall(function()
                return replicated.Remotes.CommF_:InvokeServer(
                    "CakePrinceSpawner"
                )
            end)

            if not ok or result == nil then
                StatCake:SetDesc("N/A")
                return
            end

            local resultText = tostring(result)
            local killed = string.match(resultText, "%d+")

            if killed then
                StatCake:SetDesc(
                    tostring(tonumber(killed)) .. " Mobs"
                )
            else
                StatCake:SetDesc("Mobs")
            end
        end)
    end
end)

local StatFullMoon = Tabs.Status:AddParagraph({
    Title = "FullMoon Status",
    Content = ""
})

task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            local moon8 = "http://www.roblox.com/asset/?id=9709150401"
            local moon7 = "http://www.roblox.com/asset/?id=9709150086"
            local moon6 = "http://www.roblox.com/asset/?id=9709149680"
            local moon5 = "http://www.roblox.com/asset/?id=9709149431"
            local moon4 = "http://www.roblox.com/asset/?id=9709149052"
            local moon3 = "http://www.roblox.com/asset/?id=9709143733"
            local moon2 = "http://www.roblox.com/asset/?id=9709139597"
            local moon1 = "http://www.roblox.com/asset/?id=9709135895"

            local moon = Getmoon()

            if moon == moon1 then
                StatFullMoon:SetDesc("Moon : 0 / 8")
            elseif moon == moon2 then
                StatFullMoon:SetDesc("Moon : 1 / 8")
            elseif moon == moon3 then
                StatFullMoon:SetDesc("Moon : 2 / 8")
            elseif moon == moon4 then
                StatFullMoon:SetDesc(
                    "Moon : 3 / 8 [ Next Night ]"
                )
            elseif moon == moon5 then
                StatFullMoon:SetDesc(
                    "Moon : 4 / 8 [ Full Moon ]"
                )
            elseif moon == moon6 then
                StatFullMoon:SetDesc(
                    "Moon : 5 / 8 [ Last Night ]"
                )
            elseif moon == moon7 then
                StatFullMoon:SetDesc("Moon : 6 / 8")
            elseif moon == moon8 then
                StatFullMoon:SetDesc("Moon : 7 / 8")
            end
        end)
    end
end)

local StatMirage = Tabs.Status:AddParagraph({
    Title = "Mystic Island",
    Content = ""
})

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local worldOrigin =
                workspace:FindFirstChild("_WorldOrigin")

            local locations =
                worldOrigin
                and worldOrigin:FindFirstChild("Locations")

            local mirage = false

            if locations then
                mirage =
                    locations:FindFirstChild(
                        "Mirage Island",
                        true
                    ) ~= nil
            end

            if mirage then
                StatMirage:SetDesc("✅")
            else
                StatMirage:SetDesc("❌")
            end
        end)
    end
end)

local StatKitsune = Tabs.Status:AddParagraph({
    Title = "Kitsune Island",
    Content = ""
})

local StatPrehistoric = Tabs.Status:AddParagraph({
    Title = "Prehistoric Island",
    Content = ""
})

local StatFrozen = Tabs.Status:AddParagraph({
    Title = "Frozen Dimension",
    Content = ""
})

local StatRip = Tabs.Status:AddParagraph({
    Title = "Rip_Indra",
    Content = ""
})

local StatLegendarySword = Tabs.Status:AddParagraph({
    Title = "Legendary Sword",
    Content = ""
})

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local map =
                workspace:FindFirstChild("Map")

            local worldOrigin =
                workspace:FindFirstChild("_WorldOrigin")

            local locations =
                worldOrigin
                and worldOrigin:FindFirstChild("Locations")

            local kitsune =
                map
                and map:FindFirstChild("KitsuneIsland")

            if kitsune then
                StatKitsune:SetDesc("✅")
            else
                StatKitsune:SetDesc("❌")
            end

            local prehistoric =
                locations
                and locations:FindFirstChild(
                    "Prehistoric Island"
                )

            if prehistoric then
                StatPrehistoric:SetDesc("✅")
            else
                StatPrehistoric:SetDesc("❌")
            end

            local frozen =
                locations
                and locations:FindFirstChild(
                    "Frozen Dimension"
                )

            if frozen then
                StatFrozen:SetDesc("✅")
            else
                StatFrozen:SetDesc("❌")
            end
        end)

        pcall(function()
            local enemies =
                workspace:FindFirstChild("Enemies")

            local rip =
                replicated:FindFirstChild(
                    "rip_indra True Form"
                )
                or (
                    enemies
                    and enemies:FindFirstChild(
                        "rip_indra"
                    )
                )

            if rip then
                StatRip:SetDesc("✅")
            else
                StatRip:SetDesc("❌")
            end
        end)

        pcall(function()
            local sword = "❌"

            local success1, result1 = pcall(function()
                return replicated.Remotes.CommF_:InvokeServer(
                    "LegendarySwordDealer",
                    "1"
                )
            end)

            if success1 and result1 then
                sword = "Shisui"
            else
                local success2, result2 = pcall(function()
                    return replicated.Remotes.CommF_:InvokeServer(
                        "LegendarySwordDealer",
                        "2"
                    )
                end)

                if success2 and result2 then
                    sword = "Wando"
                else
                    local success3, result3 = pcall(function()
                        return replicated.Remotes.CommF_:InvokeServer(
                            "LegendarySwordDealer",
                            "3"
                        )
                    end)

                    if success3 and result3 then
                        sword = "Saddi"
                    end
                end
            end

            StatLegendarySword:SetDesc(sword)
        end)
    end
end)
local Pullever = Tabs.Status:AddParagraph({
    Title = "Pull Level",
    Content = ""
})

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local result = game.ReplicatedStorage.Remotes.CommF_:InvokeServer(
                "CheckTempleDoor"
            )

            if result then
                Pullever:SetDesc("✅")
            else
                Pullever:SetDesc("❌")
            end
        end)
    end
end)
Tabs.Main:AddSection("Main")
local FarmLevel = Tabs.Main:AddToggle("FarmLevel", {
    Title = "Auto Farm Level",
    Description = "Automatically farms mobs to level up your character.",
    Default = false
})

FarmLevel:OnChanged(function(Value)
    _G.Level = Value
    getgenv().AutoFarmLevel = Value
    getgenv().AutoQuest = Value
    getgenv().AutoAcceptQuest = Value
end)

spawn(function()
    while task.wait(Sec) do
        if FarmLevel.Value then
            pcall(function()
                local player = game.Players.LocalPlayer
                local character = player.Character

                if not character
                or not character:FindFirstChild("HumanoidRootPart")
                or not character:FindFirstChild("Humanoid") then
                    return
                end

                if character.Humanoid.Health <= 0 then
                    return
                end

                local currentRoot = character.HumanoidRootPart

                if player.Data.Level.Value >= 2600
                and not IsInSubmergedIsland() then
                    GoSubmerged()
                    return
                end

                local mainGui = player.PlayerGui:FindFirstChild("Main")
                if not mainGui then
                    return
                end

                local quest = mainGui:FindFirstChild("Quest")
                if not quest then
                    return
                end

                local qData = QuestNeta()
                if not qData then
                    return
                end

                if quest.Visible then
                    local container = quest:FindFirstChild("Container")
                    local questTitleNode = container and container:FindFirstChild("QuestTitle")
                    local titleNode = questTitleNode and questTitleNode:FindFirstChild("Title")

                    if titleNode
                    and not string.find(titleNode.Text, qData[5]) then
                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                        task.wait(0.5)
                        return
                    end
                end

                if not quest.Visible then
                    if qData[6] then
                        _tp(qData[6])

                        if (currentRoot.Position - qData[6].Position).Magnitude <= 35 then
                            replicated.Remotes.CommF_:InvokeServer(
                                "StartQuest",
                                qData[3],
                                qData[2]
                            )

                            task.wait(0.8)
                        end
                    end

                    return
                end

                local Target = nil

                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == qData[1]
                    and v:FindFirstChild("Humanoid")
                    and v:FindFirstChild("HumanoidRootPart")
                    and v.Humanoid.Health > 0
                    and Attack.Alive(v) then
                        Target = v
                        break
                    end
                end

                if Target then
                    local targetRoot = Target:FindFirstChild("HumanoidRootPart")

                    if not targetRoot then
                        return
                    end

                    local oldCFrame = currentRoot.CFrame
                    local targetPosition = targetRoot.Position + Vector3.new(0, 30, 0)

                    local rotationOnly = oldCFrame - oldCFrame.Position

                    _tp(
                        CFrame.new(targetPosition)
                        * rotationOnly
                    )

                    local tickTime = tick()

                    repeat
                        task.wait()

                        if not FarmLevel.Value
                        or not player.Character
                        or not player.Character:FindFirstChild("Humanoid")
                        or player.Character.Humanoid.Health <= 0 then
                            break
                        end

                        if not Target
                        or not Target.Parent
                        or not Target:FindFirstChild("Humanoid")
                        or not Target:FindFirstChild("HumanoidRootPart")
                        or Target.Humanoid.Health <= 0 then
                            break
                        end

                        if not quest.Visible then
                            break
                        end

                        if tick() - tickTime > 15 then
                            break
                        end

                        Attack.Kill(Target, FarmLevel.Value)

                    until not FarmLevel.Value
                    or not Target
                    or not Target.Parent
                    or not Target:FindFirstChild("Humanoid")
                    or Target.Humanoid.Health <= 0
                    or not quest.Visible

                elseif qData[4] then
                    _tp(qData[4])
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(getgenv().QuestDelay or 1) do
        if not FarmLevel.Value then
            continue
        end

        local player = game.Players.LocalPlayer
        local character = player.Character

        if not character
        or not character:FindFirstChild("HumanoidRootPart")
        or not character:FindFirstChild("Humanoid") then
            continue
        end

        if character.Humanoid.Health <= 0 then
            continue
        end

        MyLevel = player.Data.Level.Value

        CheckQuest()

        if getgenv().AutoAcceptQuest then
            AcceptQuest()
        end

        if getgenv().AutoTurnInQuest then
            TurnInQuest()
        end
    end
end)

Tabs.Main:AddSection("World Quest")

local TravelDress = Tabs.Main:AddToggle("TravelDress", {Title = "Auto Dressrosa Quest", Description = "Automatically completes the Dressrosa (World 2) quest.", Default = false})

TravelDress:OnChanged(function(Value)

  _G.TravelDres = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.TravelDres then

        if plr.Data.Level.Value >= 700 then

          if workspace.Map.Ice.Door.CanCollide == true and workspace.Map.Ice.Door.Transparency == 0 then

            replicated.Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")

		    EquipWeapon("Key")

		    repeat wait() _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488)) until not _G.TravelDres or (Root.Position == CFrame.new(1347.7124, 37.3751602, -1325.6488).Position)

	      elseif workspace.Map.Ice.Door.CanCollide == false and workspace.Map.Ice.Door.Transparency == 1 then

            if Enemies:FindFirstChild("Ice Admiral") then

              for _,xz in pairs(Enemies:GetChildren()) do

                if xz.Name == "Ice Admiral" and Attack.Alive(xz) then

              	  repeat task.wait() Attack.Kill(xz,_G.TravelDres) until _G.TravelDres == false or xz.Humanoid.Health <= 0

                  replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")

                end

              end

            else

              _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488))

            end

	      else

		    replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")

	      end

        end

      end

    end)

  end

end)

local Zou = Tabs.Main:AddToggle("Zou", {Title = "Auto Zou Quest", Description = "Automatically completes the Zou (World 3) quest.", Default = false})

Zou:OnChanged(function(Value)

  _G.AutoZou = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.AutoZou then

   	    if plr.Data.Level.Value >= 1500 then

          if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then

            if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then

              replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")

              if replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then

                local v = GetConnectionEnemies("rip_indra")

                if v then

                  repeat wait() Attack.Kill(v,_G.AutoZou) until not _G.AutoZou or not v.Parent or v.Humanoid.Health <= 0

                  Check = 2

                  repeat wait()replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")until Check == 1                   

                else

                  replicated.Remotes.CommF_:InvokeServer("F_","ZQuestProgress","Check") wait(.1)

                  replicated.Remotes.CommF_:InvokeServer("F_","ZQuestProgress","Begin")

                end

              elseif replicated.Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then

                replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")

              else

                local v = GetConnectionEnemies("Don Swan")

                if v then

                  repeat wait() Attack.Kill(v,_G.AutoZou)until not _G.AutoZou or not v.Parent or v.Humanoid.Health<=0                  

                else

                  repeat wait() _tp(CFrame.new(2288.802, 15.1870775, 863.034607)) until not _G.AutoZou or (Root.Position == CFrame.new(2288.802, 15.1870775, 863.034607).Position)

                  if (Root.CFrame == CFrame.new(2288.802, 15.1870775, 863.034607)) then notween(CFrame.new(2288.802, 15.1870775, 863.034607)) end

                end

              end

            else

            if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then

              TabelDevilFruitStore = {}

              TabelDevilFruitOpen = {}

              for i,v in pairs(replicated.Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do

                for i1,v1 in pairs(v) do

                  if i1 == "Name" then table.insert(TabelDevilFruitStore,v1)end

                end

              end

              for i,v in next, game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do

                if v.Price >= 1000000 then table.insert(TabelDevilFruitOpen,v.Name) end

              end

              for i,DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do

                for i1,DevilFruitStore in pairs(TabelDevilFruitStore) do

                  if DevilFruitOpenDoor == DevilFruitStore and replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then

                    if not plr.Backpack:FindFirstChild(DevilFruitStore) then

                      replicated.Remotes.CommF_:InvokeServer("F_","LoadFruit",DevilFruitStore)

                    else

                      replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","1")

                      replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","2")

                      replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","3")

                    end

                  end

                end

              end

                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","1")

                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","2")

                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","3")

              end

            end

          else

            if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then

              if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then                

                local v = GetConnectionEnemies("Swan Pirate")

                if v then

                  pcall(function() repeat wait() Attack.Kill(v,_G.AutoZou) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoZou == false or plr.PlayerGui.Main.Quest.Visible == false end)                    

                else

                  _tp(CFrame.new(1057.92761, 137.614319, 1242.08069))

                end

              else

                _tp(CFrame.new(-456.28952, 73.0200958, 299.895966))

              end

            elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then

              local v = GetConnectionEnemies("Jeremy")

              if v then

                repeat wait() Attack.Kill(v,_G.AutoZou) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoZou == false

              else

                _tp(CFrame.new(2099.88159, 448.931, 648.997375))

              end

            elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then

              repeat wait() _tp(CFrame.new(-1836, 11, 1714)) until not _G.AutoZou or (Root.Position == CFrame.new(-1836, 11, 1714).Position)

              if (Root.CFrame == CFrame.new(-1836, 11, 1714)) then notween(CFrame.new(-1836, 11, 1714))end

              notween(CFrame.new(-1850.49329, 13.1789551, 1750.89685))

              wait(.1)

              notween(CFrame.new(-1858.87305, 19.3777466, 1712.01807))

              wait(.1)

              notween(CFrame.new(-1803.94324, 16.5789185, 1750.89685))

              wait(.1)

              notween(CFrame.new(-1858.55835, 16.8604317, 1724.79541))

              wait(.1)

              notween(CFrame.new(-1869.54224, 15.987854, 1681.00659))

              wait(.1)

              notween(CFrame.new(-1800.0979, 16.4978027, 1684.52368))

              wait(.1)

              notween(CFrame.new(-1819.26343, 14.795166, 1717.90625))

              wait(.1)

              notween(CFrame.new(-1813.51843, 14.8604736, 1724.79541))

            end

          end

        end

      end

    end)

  end

end)

Tabs.Main:AddSection("Arena")

local FishSlap = Tabs.Main:AddToggle("FishSlap", {
    Title = "Auto Fish Slap Minigame",
    Description = "Automatically plays the Fish Slap arena minigame.",
    Default = false
})

FishSlap:OnChanged(function(Value)

  _G.AutoFishSlap = Value

end)

local FishingSection = Tabs.Main:AddSection("Fishing")

local SelectedBait = nil
local AutoBuyBaitEnabled = false
local AutoSellFishEnabled = false

SelectBait = FishingSection:AddDropdown("SelectBait", {
    Title = "Select Bait",
    Description = "Selects which fishing bait\n to use.",
    Searchable = true,
    Values = {
        "Abyssal Bait",
        "Basic Bait",
        "Carnivore Bait",
        "Epic Bait",
        "Good Bait",
        "Kelp Bait",
        "Frozen Bait"
    },
    Multi = false,
    Default = nil
})

SelectBait:OnChanged(function(Value)
    SelectedBait = Value
end)

AutoBuyBait = FishingSection:AddToggle("AutoBuyBait", {
    Title = "Auto Buy Bait",
    Description = "Automatically buys fishing bait.",
    Default = false
})

AutoBuyBait:OnChanged(function(Value)
    AutoBuyBaitEnabled = Value
end)

AutoSellFish = FishingSection:AddToggle("AutoSellFish", {
    Title = "Auto Sell Fish",
    Description = "Automatically sells caught fish.",
    Default = false
})

AutoSellFish:OnChanged(function(Value)
    AutoSellFishEnabled = Value
end)

Tabs.Main:AddButton({
    Title = "Sell Fishing Position",
    Description = "Saves your current position as the auto-fishing spot.",
    Callback = function()
    end
})

Tabs.Main:AddSection("Tyrant")

local FarmTyrant = Tabs.Main:AddToggle("FarmTyrant", {
    Title = "Auto Farm Tyrant",
    Description = "Automatically farms the Tyrant (bird) boss.",
    Default = false
})

FarmTyrant:OnChanged(function(Value)
    _G.FarmTyrant = Value
end)

task.spawn(function()
    while task.wait(1) do
        if _G.FarmTyrant and World3 then
            pcall(function()
                local player = game.Players.LocalPlayer

                if not player or not player.Character then
                    return
                end

                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then
                    return
                end

                local enemiesFolder = Workspace:FindFirstChild("Enemies")

                local bossPos = Vector3.new(
                    -16268.287,
                    152.616,
                    1390.773
                )

                if (hrp.Position - bossPos).Magnitude > 5 then
                    _tp(CFrame.new(bossPos))

                    local attempts = 0

                    repeat
                        task.wait()

                        attempts = attempts + 1

                        hrp = player.Character
                            and player.Character:FindFirstChild("HumanoidRootPart")

                    until not _G.FarmTyrant
                        or not World3
                        or not hrp
                        or (hrp.Position - bossPos).Magnitude <= 5
                        or attempts > 100
                end

                if not _G.FarmTyrant or not World3 then
                    return
                end

                local boss = enemiesFolder
                    and enemiesFolder:FindFirstChild("Tyrant of the Skies")

                if boss
                    and boss:FindFirstChild("Humanoid")
                    and boss.Humanoid.Health > 0
                then
                    repeat
                        if not _G.FarmTyrant or not World3 then
                            break
                        end

                        if AutoHaki then
                            pcall(AutoHaki)
                        end

                        if SelectWeapon and EquipTool then
                            pcall(EquipTool, SelectWeapon)
                        end

                        if Attack and Attack.Kill then
                            pcall(function()
                                Attack.Kill(
                                    boss,
                                    _G.FarmTyrant
                                )
                            end)
                        end

                        task.wait()

                    until not _G.FarmTyrant
                        or not World3
                        or not boss.Parent
                        or not boss:FindFirstChild("Humanoid")
                        or boss.Humanoid.Health <= 0

                    return
                end

                local mobList = {
                    "Serpent Hunter",
                    "Skull Slayer",
                    "Isle Champion",
                    "Sun-kissed Warrior"
                }

                if enemiesFolder then
                    for _, mobName in ipairs(mobList) do
                        if not _G.FarmTyrant or not World3 then
                            break
                        end

                        for _, mob in ipairs(enemiesFolder:GetChildren()) do
                            if not _G.FarmTyrant or not World3 then
                                break
                            end

                            if mob
                                and mob.Name == mobName
                                and mob:FindFirstChild("HumanoidRootPart")
                                and mob:FindFirstChild("Humanoid")
                                and mob.Humanoid.Health > 0
                            then
                                hrp = player.Character
                                    and player.Character:FindFirstChild(
                                        "HumanoidRootPart"
                                    )

                                if not hrp then
                                    break
                                end

                                if (
                                    hrp.Position
                                    - mob.HumanoidRootPart.Position
                                ).Magnitude > 5000 then

                                    _tp(
                                        mob.HumanoidRootPart.CFrame
                                        * CFrame.new(0, 30, 0)
                                    )

                                    local t0 = tick()

                                    repeat
                                        task.wait()

                                        hrp = player.Character
                                            and player.Character:FindFirstChild(
                                                "HumanoidRootPart"
                                            )

                                    until not _G.FarmTyrant
                                        or not World3
                                        or not hrp
                                        or (
                                            hrp.Position
                                            - mob.HumanoidRootPart.Position
                                        ).Magnitude <= 6
                                        or tick() - t0 > 8
                                end

                                repeat
                                    if not _G.FarmTyrant or not World3 then
                                        break
                                    end

                                    if AutoHaki then
                                        pcall(AutoHaki)
                                    end

                                    if SelectWeapon and EquipTool then
                                        pcall(
                                            EquipTool,
                                            SelectWeapon
                                        )
                                    end

                                    if Attack and Attack.Kill then
                                        pcall(function()
                                            Attack.Kill(
                                                mob,
                                                _G.FarmTyrant
                                            )
                                        end)
                                    end

                                    task.wait()

                                until not _G.FarmTyrant
                                    or not World3
                                    or not mob.Parent
                                    or not mob:FindFirstChild("Humanoid")
                                    or mob.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

Tabs.Main:AddSection("Cake Prince")

FarmDoughBoss = Tabs.Main:AddToggle("FarmDoughBoss", {Title = "Auto Farm Dough Boss", Description = "Automatically farms the Dough boss.", Default = false})

FarmDoughBoss:OnChanged(function(Value)
  _G.Auto_Cake_Prince = Value
end)

spawn(function()
  while wait() do
    if _G.Auto_Cake_Prince then
      pcall(function()
        local player = game.Players.LocalPlayer
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        local questUI = player.PlayerGui.Main.Quest
        local enemies = workspace:FindFirstChild("Enemies")
        
        local mapCakeLoaf = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("CakeLoaf")
        local bigMirror = mapCakeLoaf and mapCakeLoaf:FindFirstChild("BigMirror")

        if not root then return end

        if not bigMirror then 
          _tp(CFrame.new(-2077, 252, -12373))
          return 
        end

        local otherPart = bigMirror:FindFirstChild("Other")

        if not otherPart then
          _tp(CFrame.new(-2077, 252, -12373))
          return
        end

        if otherPart.Transparency == 0 or (enemies and enemies:FindFirstChild("Cake Prince")) then
          local v = GetConnectionEnemies("Cake Prince")

          if v then
            repeat wait()
              Attack.Kill2(v, _G.Auto_Cake_Prince)
            until not _G.Auto_Cake_Prince 
            or not v.Parent 
            or v.Humanoid.Health <= 0
          else
            _tp(CFrame.new(-2151.82, 149.32, -12404.91))
          end

        else

          local CakePrince = {
            "Cookie Crafter",
            "Cake Guard",
            "Baking Staff",
            "Head Baker"
          }

          local v = GetConnectionEnemies(CakePrince)

          if v then

            if _G.AcceptQuestC and not questUI.Visible then

              local questPos = CFrame.new(-1927.92, 37.8, -12842.54)

              _tp(questPos)

              local timeout = 0

              while root and (questPos.Position - root.Position).Magnitude > 50 and timeout < 50 do
                wait(0.2)
                timeout = timeout + 1
              end

              local randomQuest = math.random(1, 4)

              local questData = {
                [1] = {"StartQuest", "CakeQuest2", 2},
                [2] = {"StartQuest", "CakeQuest2", 1},
                [3] = {"StartQuest", "CakeQuest1", 1},
                [4] = {"StartQuest", "CakeQuest1", 2}
              }

              pcall(function()
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(questData[randomQuest]))
              end)
            end

            repeat wait()
              Attack.Kill(v, _G.Auto_Cake_Prince)
            until not _G.Auto_Cake_Prince
            or not v.Parent
            or v.Humanoid.Health <= 0
            or otherPart.Transparency == 0
            or (_G.AcceptQuestC and not questUI.Visible)

          else

            local nearMob = false

            if enemies and root then
              for _,mob in pairs(enemies:GetChildren()) do
                local hum = mob:FindFirstChild("Humanoid")
                local mobRoot = mob:FindFirstChild("HumanoidRootPart")

                if hum and mobRoot and hum.Health > 0 then
                  if (mobRoot.Position - root.Position).Magnitude <= 50 then
                    nearMob = true
                    break
                  end
                end
              end
            end

            if not nearMob then
              _tp(CFrame.new(-2077, 252, -12373))
            end

          end
        end
      end)
    end
  end
end)

FarmKata = Tabs.Main:AddToggle("FarmKata", {
    Title = "Farm Cake Quest",
    Description = "Automatically farms the Cake Land quest.",
    Default = false
})

FarmKata:OnChanged(function(Value)
    _G.Farm_Cake_Quest = Value
end)

spawn(function()
  while wait() do
    if _G.Farm_Cake_Quest then
      pcall(function()
        local player = game.Players.LocalPlayer
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        local questUI = player.PlayerGui.Main.Quest
        local enemies = workspace:FindFirstChild("Enemies")

        local mapCakeLoaf = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("CakeLoaf")
        local bigMirror = mapCakeLoaf and mapCakeLoaf:FindFirstChild("BigMirror")

        if not root then return end

        if not bigMirror then
          _tp(CFrame.new(-2077,252,-12373))
          return
        end

        local otherPart = bigMirror:FindFirstChild("Other")

        if not otherPart then
          _tp(CFrame.new(-2077,252,-12373))
          return
        end

        getgenv().BringMonster = true

        local CakePrince = {
          "Cookie Crafter",
          "Cake Guard",
          "Baking Staff",
          "Head Baker"
        }

        local v = GetConnectionEnemies(CakePrince)

        if v then

          if _G.AcceptQuestC and not questUI.Visible then

            local questPos = CFrame.new(-1927.92,37.8,-12842.54)

            _tp(questPos)

            local timeout = 0

            while root and (questPos.Position - root.Position).Magnitude > 50 and timeout < 50 do
              wait(0.2)
              timeout = timeout + 1
            end

            local randomQuest = math.random(1,4)

            local questData = {
              [1] = {"StartQuest","CakeQuest2",2},
              [2] = {"StartQuest","CakeQuest2",1},
              [3] = {"StartQuest","CakeQuest1",1},
              [4] = {"StartQuest","CakeQuest1",2}
            }

            pcall(function()
              game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(questData[randomQuest]))
            end)
          end

          repeat wait()
            Attack.Kill(v,_G.Auto_Cake_Prince)
          until not _G.Auto_Cake_Prince
          or not v.Parent
          or v.Humanoid.Health <= 0

        else

          local nearMob = false

          if enemies and root then
            for _,mob in pairs(enemies:GetChildren()) do
              local hum = mob:FindFirstChild("Humanoid")
              local mobRoot = mob:FindFirstChild("HumanoidRootPart")

              if hum and mobRoot and hum.Health > 0 then
                if (mobRoot.Position - root.Position).Magnitude <= 50 then
                  nearMob = true
                  break
                end
              end
            end
          end

          if not nearMob then
            _tp(CFrame.new(-2077,252,-12373))
          end

        end
      end)
    end
  end
end)

local CakePrinceSpawned = false

SpawnBoss = Tabs.Main:AddToggle("SpawnBoss", {
    Title = "Auto Spawn Boss",
    Description = "Automatically spawns the Cake Prince boss.",
    Default = false
})

SpawnBoss:OnChanged(function(Value)
    _G.Auto_Spawn_Boss = Value

    if not Value then
        CakePrinceSpawned = false
        getgenv().BringMonster = false
    end
end)

task.spawn(function()
    while task.wait(1) do
        if _G.Auto_Spawn_Boss then
            pcall(function()
                local ok, result = pcall(function()
                    return replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                end)

                if ok and result then
                    local killed = string.match(tostring(result), "%d+")

                    if not killed then
                        CakePrinceSpawned = true
                        getgenv().BringMonster = false
                    else
                        CakePrinceSpawned = false
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Auto_Cake_Prince then
            pcall(function()
                local player = game.Players.LocalPlayer
                local root = player.Character
                    and player.Character:FindFirstChild("HumanoidRootPart")

                if not root then
                    return
                end

                if CakePrinceSpawned then
                    getgenv().BringMonster = false
                    return
                end

                local enemies = workspace:FindFirstChild("Enemies")

                local mapCakeLoaf = workspace:FindFirstChild("Map")
                    and workspace.Map:FindFirstChild("CakeLoaf")

                local bigMirror = mapCakeLoaf
                    and mapCakeLoaf:FindFirstChild("BigMirror")

                if not bigMirror then
                    _tp(CFrame.new(-2077,252,-12373))
                    return
                end

                local otherPart = bigMirror:FindFirstChild("Other")

                if not otherPart then
                    _tp(CFrame.new(-2077,252,-12373))
                    return
                end

                getgenv().BringMonster = true

                local CakePrince = {
                    "Cookie Crafter",
                    "Cake Guard",
                    "Baking Staff",
                    "Head Baker"
                }

                local v = GetConnectionEnemies(CakePrince)

                if v then
                    repeat
                        task.wait()

                        if not _G.Auto_Cake_Prince then
                            break
                        end

                        if CakePrinceSpawned then
                            getgenv().BringMonster = false
                            break
                        end

                        if not v.Parent then
                            break
                        end

                        local humanoid = v:FindFirstChild("Humanoid")

                        if not humanoid or humanoid.Health <= 0 then
                            break
                        end

                        Attack.Kill(v, _G.Auto_Cake_Prince)

                    until not _G.Auto_Cake_Prince
                        or CakePrinceSpawned
                        or not v.Parent
                        or not v:FindFirstChild("Humanoid")
                        or v.Humanoid.Health <= 0

                else
                    local nearMob = false

                    if enemies then
                        for _, mob in pairs(enemies:GetChildren()) do
                            local hum = mob:FindFirstChild("Humanoid")
                            local mobRoot = mob:FindFirstChild("HumanoidRootPart")

                            if hum and mobRoot and hum.Health > 0 then
                                if (mobRoot.Position - root.Position).Magnitude <= 50 then
                                    nearMob = true
                                    break
                                end
                            end
                        end
                    end

                    if not nearMob and not CakePrinceSpawned then
                        _tp(CFrame.new(-2077,252,-12373))
                    end
                end
            end)
        else
            getgenv().BringMonster = false
        end
    end
end)
TradeChalice = Tabs.Main:AddToggle("TradeChalice", {
    Title = "Auto Trade Sweet Chalice",
    Description = "Automatically frages in the Sweet Chalice.",
    Default = false
})

TradeChalice:OnChanged(function(Value)
    _G_Trade_Chalice = Value
end)

task.spawn(function()
    while task.wait() do
        if _G_Trade_Chalice then
            pcall(function()
                _tp(CFrame.new(
                    224.8719940185547,
                    24.856300354003906,
                    -12771.1025390625
                ))
            end)
        end
    end
end)
Tabs.Main:AddSection("Bone")

_G.AutoFarm_Bone = false
getgenv().CurrentBoneTarget = nil
getgenv().CurrentBoneName = nil

FarmBone = Tabs.Main:AddToggle("FarmBone", {
    Title = "Auto Farm Bone",
    Description = "Automatically farms Bones.",
    Default = false
})

FarmBone:OnChanged(function(Value)
    _G.AutoFarm_Bone = Value

    if not Value then
        getgenv().CurrentBoneTarget = nil
        getgenv().CurrentBoneName = nil
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.AutoFarm_Bone then
            pcall(function()

                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local root = character:FindFirstChild("HumanoidRootPart")
                local questUI = player.PlayerGui.Main.Quest

                if not root then
                    return
                end

                local BonesTable = {
                    "Reborn Skeleton",
                    "Living Zombie",
                    "Demonic Soul",
                    "Posessed Mummy"
                }

                local enemies = workspace:FindFirstChild("Enemies")
                local bone = nil

                if getgenv().CurrentBoneTarget and getgenv().CurrentBoneTarget.Parent then
                    local hum = getgenv().CurrentBoneTarget:FindFirstChild("Humanoid")

                    if hum and hum.Health > 0 then
                        bone = getgenv().CurrentBoneTarget
                    else
                        getgenv().CurrentBoneTarget = nil
                        getgenv().CurrentBoneName = nil
                    end
                end

                if not bone and enemies then
                    local closestDist = math.huge

                    for _, mob in pairs(enemies:GetChildren()) do
                        local hum = mob:FindFirstChild("Humanoid")
                        local mobRoot = mob:FindFirstChild("HumanoidRootPart")

                        local valid = false
                        for _, name in ipairs(BonesTable) do
                            if mob.Name == name then
                                valid = true
                                break
                            end
                        end

                        if valid and hum and mobRoot and hum.Health > 0 then
                            local dist = (mobRoot.Position - root.Position).Magnitude

                            if dist < closestDist then
                                closestDist = dist
                                bone = mob
                                getgenv().CurrentBoneTarget = mob
                                getgenv().CurrentBoneName = mob.Name
                            end
                        end
                    end
                end

                if bone then

                    if _G.AcceptQuestC and not questUI.Visible then

                        local questPos = CFrame.new(
                            -9516.99316,
                            172.017181,
                            6078.46533,
                            0,0,-1,
                            0,1,0,
                            1,0,0
                        )

                        _tp(questPos)

                        while (questPos.Position - root.Position).Magnitude > 50 do
                            wait(0.2)
                        end

                        local randomQuest = math.random(1,4)

                        local questData = {
                            [1] = {"StartQuest","HauntedQuest2",2},
                            [2] = {"StartQuest","HauntedQuest2",1},
                            [3] = {"StartQuest","HauntedQuest1",1},
                            [4] = {"StartQuest","HauntedQuest1",2}
                        }

                        pcall(function()
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer(
                                unpack(questData[randomQuest])
                            )
                        end)
                    end

                    repeat
                        task.wait()

                        if not bone.Parent
                        or not bone:FindFirstChild("Humanoid")
                        or bone.Humanoid.Health <= 0 then
                            getgenv().CurrentBoneTarget = nil
                            getgenv().CurrentBoneName = nil
                            break
                        end

                        if bone:FindFirstChild("HumanoidRootPart") then
                            _tp(bone.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                        end

                        Attack.Kill(bone, _G.AutoFarm_Bone)

                    until not _G.AutoFarm_Bone
                    or bone.Humanoid.Health <= 0
                    or not bone.Parent
                    or (_G.AcceptQuestC and not questUI.Visible)

                else

                    local nearMob = false

                    if enemies and root then
                        for _, mob in pairs(enemies:GetChildren()) do
                            local hum = mob:FindFirstChild("Humanoid")
                            local mobRoot = mob:FindFirstChild("HumanoidRootPart")

                            if hum and mobRoot and hum.Health > 0 then
                                if (mobRoot.Position - root.Position).Magnitude <= 50 then
                                    nearMob = true
                                    break
                                end
                            end
                        end
                    end

                    if not nearMob then
                        _tp(CFrame.new(
                            -9495.6806640625,
                            453.58624267578125,
                            5977.3486328125
                        ))
                    end
                end

            end)
        end
    end
end)
QuestBoneKata = Tabs.Main:AddToggle("QuestBoneKata", {Title = "Farm Bone Quest", Description = "Automatically farms the Bone quest.", Default = false})

QuestBoneKata:OnChanged(function(Value)

  _G.AcceptQuestC = Value

end)          

Tabs.Main:AddSection("Mastery")

local posMastery = {"Cake","Bone"}

local Mastery_Config = Tabs.Main:AddDropdown("Mastery_Config",{Title = "Select Method", Searchable = true, Description = "Selects the mastery farming\n method (Cake, Bone, or Level).", Values = posMastery,Multi = false,Default = 1})

Mastery_Config:OnChanged(function(Value)

  SelectIsland = Value

end)

local MasteryGun = Tabs.Main:AddToggle("MasteryGun", {Title = "Auto Farm Gun Mastery", Description = "Automatically farms gun mastery.", Default = false})

MasteryGun:OnChanged(function(Value)

  _G.FarmMastery_G = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.FarmMastery_G then

      pcall(function()

        if SelectIsland == "Cake" then

          local v = GetConnectionEnemies(mastery1)

		  if v then		      

		    HealthM = v.Humanoid.MaxHealth * 70 / 100

		    repeat wait()

		      MousePos = v.HumanoidRootPart.Position

		      Attack.Masgun(v,_G.FarmMastery_G)

		      local Modules = replicated:FindFirstChild("Modules")

              local Net = Modules:FindFirstChild("Net")

              local RE_ShootGunEvent = Net:FindFirstChild("RE/ShootGunEvent")    

              if plr.Character:FindFirstChildOfClass("Tool").ToolTip ~= "Gun" then return end

              if plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name == 'Skull Guitar' then

                SoulGuitar = true

		        plr.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)

		        if _G.FarmMastery_G then

		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)

                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)

                end

		      elseif plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name ~= 'Skull Guitar' then

		        SoulGuitar = false

		        RE_ShootGunEvent:FireServer(MousePos, { v.HumanoidRootPart })

		        if _G.FarmMastery_G then

		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)

                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)

                end

		      end		            		

		    until _G.FarmMastery_G == false or v.Humanoid.Health <= 0 or not v.Parent    

		    SoulGuitar = false     		         		        

		  else

		    _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 		    

	  	  end

		elseif SelectIsland == "Bone" then

          local v = GetConnectionEnemies(mastery2)

		  if v then		      

		    HealthM = v.Humanoid.MaxHealth * 70 / 100

		    repeat wait()

		      MousePos = v.HumanoidRootPart.Position

		      Attack.Masgun(v,_G.FarmMastery_G)

		      local Modules = replicated:FindFirstChild("Modules")

              local Net = Modules:FindFirstChild("Net")

              local RE_ShootGunEvent = Net:FindFirstChild("RE/ShootGunEvent")    

              if plr.Character:FindFirstChildOfClass("Tool").ToolTip ~= "Gun" then return end

              if plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name == 'Skull Guitar' then

                SoulGuitar = true

		        plr.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)

		        if _G.FarmMastery_G then

		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)

                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)

                end

		      elseif plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name ~= 'Skull Guitar' then

		        SoulGuitar = false

		        RE_ShootGunEvent:FireServer(MousePos, { v.HumanoidRootPart })

		        if _G.FarmMastery_G then

		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)

                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)

                end

		      end		            		

		    until _G.FarmMastery_G == false or v.Humanoid.Health <= 0 or not v.Parent    

		    SoulGuitar = false     		         		        

		  else

		    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 

	  	  end

        end

      end)

    end

  end

end)

local MasteryFruits = Tabs.Main:AddToggle("MasteryFruits", {Title = "Auto Farm Fruit Mastery", Description = "Automatically farms Devil Fruit mastery.", Default = false})

MasteryFruits:OnChanged(function(Value)

  _G.FarmMastery_Dev = Value

end)

spawn(function()RunSer.RenderStepped:Connect(function() pcall(function()if _G.FarmMastery_Dev or _G.FarmMastery_G or _G.FarmMastery_S then for a,b in pairs(plr.PlayerGui.Notifications:GetChildren())do if b.Name=="NotificationTemplate"then if string.find(b.Text,"Skill locked!")then b:Destroy()end end end end end)end) end)

spawn(function()

  while wait(Sec) do

    if _G.FarmMastery_Dev then

      pcall(function()

        if SelectIsland == "Cake" then         

          local v = GetConnectionEnemies(mastery1)

		  if v then		   

		    HealthM = v.Humanoid.MaxHealth * 70 / 100

		    repeat wait()

		      MousePos = v.HumanoidRootPart.Position

		      Attack.Mas(v,_G.FarmMastery_Dev)

		    until _G.FarmMastery_Dev == false or v.Humanoid.Health <= 0 or not v.Parent         		         		        

		  else

		    _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 

		  end

		elseif SelectIsland == "Bone" then

          local v = GetConnectionEnemies(mastery2)

		  if v then		

		    HealthM = v.Humanoid.MaxHealth * 70 / 100

		    repeat wait()

		      MousePos = v.HumanoidRootPart.Position

		      Attack.Mas(v,_G.FarmMastery_Dev)

		    until _G.FarmMastery_Dev == false or v.Humanoid.Health <= 0 or not v.Parent		        

		  else

		    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 		    

		  end

        end

      end)

    end

  end

end)

Tabs.Main:AddSection("Chest") 

local Chest = Tabs.Main:AddToggle("Chest", {Title = "Auto Farm Chest", Description = "Automatically collects chests around the map.", Default = false})

Chest:OnChanged(function(Value)

  _G.AutoFarmChest = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.AutoFarmChest then

      pcall(function()

        local CollectionService = game:GetService("CollectionService")

        local Players = game:GetService("Players")

        local Player = Players.LocalPlayer

        local Character = Player.Character or Player.CharacterAdded:Wait()                

        if not Character then return end                

        local Position = Character:GetPivot().Position

        local Chests = CollectionService:GetTagged("_ChestTagged")      

        local Distance, Nearest = math.huge, nil  

        for i = 1, #Chests do

          local Chest = Chests[i]

          local Magnitude = (Chest:GetPivot().Position - Position).Magnitude        

          if not SelectedIsland or Chest:IsDescendantOf(SelectedIsland) then

            if not Chest:GetAttribute("IsDisabled") and Magnitude < Distance then

              Distance = Magnitude

              Nearest = Chest

            end

          end

        end

      if Nearest then _tp(Nearest:GetPivot()) end

      end)

    end

  end

end)

local Chest = Tabs.Main:AddToggle("Chest", {
    Title = "Hop Farm Chest",
    Description = "Server-hops to farm chests continuously.",
    Default = false
})

Chest:OnChanged(function(Value)
    _G.AutoFarmChest = Value
end)

local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")

local function HopServer()
    local Success, Result = pcall(function()
        return game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
    end)

    if Success then
        local Data = HttpService:JSONDecode(Result)

        local Servers = {}
        for _, v in ipairs(Data.data) do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
                table.insert(Servers, v.id)
            end
        end

        if #Servers > 0 then
            TeleportService:TeleportToPlaceInstance(
                game.PlaceId,
                Servers[math.random(1, #Servers)],
                Players.LocalPlayer
            )
        end
    end
end

spawn(function()
    while task.wait(Sec) do
        if _G.AutoFarmChest then
            pcall(function()
                local Player = Players.LocalPlayer
                local Character = Player.Character or Player.CharacterAdded:Wait()
                if not Character then return end

                local Position = Character:GetPivot().Position
                local Chests = CollectionService:GetTagged("_ChestTagged")

                local Distance, Nearest = math.huge, nil

                for _, Chest in ipairs(Chests) do
                    local Magnitude = (Chest:GetPivot().Position - Position).Magnitude

                    if (not SelectedIsland or Chest:IsDescendantOf(SelectedIsland))
                        and not Chest:GetAttribute("IsDisabled")
                        and Magnitude < Distance then
                        Distance = Magnitude
                        Nearest = Chest
                    end
                end

                if Nearest then
                    _tp(Nearest:GetPivot())
                else
                    HopServer()
                end
            end)
        end
    end
end)

Tabs.Main:AddSection("Mob")

local ClosetMons = Tabs.Main:AddToggle("ClosetMons", {Title = "Mob Aura", Description = "Automatically attacks all nearby mobs.", Default = false})

ClosetMons:OnChanged(function(Value)

  _G.AutoFarmNear = Value

end)

spawn(function()

  while wait() do

    pcall(function()

      if _G.AutoFarmNear then

        for i,v in pairs(workspace.Enemies:GetChildren()) do

          if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") then

            if v.Humanoid.Health > 0 then

              repeat wait() Attack.Kill(v,_G.AutoFarmNear) until not _G.AutoFarmNear or not v.Parent or v.Humanoid.Health <= 0

            end

          end

        end

      end

    end)

  end

end)

Tabs.Quests:AddSection("Buso/Aura Colours")

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Teleport Barista Cousin", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Tp_MasterA = Value

end)

spawn(function()

  while wait() do

    if _G.Tp_MasterA then

	  pcall(function()

	    for _,v in pairs(replicated.NPCs:GetChildren()) do

	    if v.Name == "Barista Cousin" then _tp(v.HumanoidRootPart.CFrame) end

        end   	   

	 end)

    end

  end

end)

Tabs.Quests:AddButton({Title = "Buy Buso Colors", Description = "",

Callback = function()

  replicated.Remotes.CommF_:InvokeServer("ColorsDealer","2")

end})

Tabs.Mirage:AddSection("Upgrade Races V3")

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Upgrade Mink V3", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_Mink = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Auto_Mink then

        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= 2 then

          if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then

            replicated.Remotes.CommF_:InvokeServer("Alchemist","2")

          elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then

            if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then

              _tp(workspace.Flower1.CFrame)

            elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then

              _tp(workspace.Flower2.CFrame)

            elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then

              local v = GetConnectionEnemies("Swan Pirate")

              if v then repeat wait() Attack.Kill(v,_G.Auto_Mink) until GetBP("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Mink == false

              else _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))end            

            end        

          elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then

	        replicated.Remotes.CommF_:InvokeServer("Alchemist","3")

	      end

        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then

          replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")

        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then

		  _G.AutoFarmChest = true

	    else

	      _G.AutoFarmChest = false

        end

      end

    end)

  end

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Upgrade Human V3", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_Human = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Auto_Human then

        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then

	     if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then

		  replicated.Remotes.CommF_:InvokeServer("Alchemist","2")

		elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then

		  if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then

		    _tp(workspace.Flower1.CFrame)

		  elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then

		    _tp(workspace.Flower2.CFrame)

		  elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then

		    local v = GetConnectionEnemies("Swan Pirate")

            if v then repeat wait() Attack.Kill(v,_G.Auto_Human) until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Human == false

		    else _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))end

		  end

		  elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then

		    replicated.Remotes.CommF_:InvokeServer("Alchemist","3")

		  end

		  elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then

		    replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")

		  elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then

		  local v = GetConnectionEnemies(Human_v3_Mob[1])

          if v then repeat wait()Attack.Kill(v,_G.Auto_Human)until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human			           

	      else _tp(CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625))

		  end		      

		  local v = GetConnectionEnemies(Human_v3_Mob[2])

          if v then repeat wait()Attack.Kill(v,_G.Auto_Human)until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human			           

	      else _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))

		  end		      

		  local v = GetConnectionEnemies(Human_v3_Mob[3])

          if v then repeat wait()Attack.Kill(v,_G.Auto_Human)until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human			           

          else _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))

	      end		      		

        end

      end

    end)

  end

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Upgrade Skypiea V3", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_Skypiea = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Auto_Skypiea then

        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then

	      if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then

		    replicated.Remotes.CommF_:InvokeServer("Alchemist","2")

		  elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then

		    if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then

		      _tp(workspace.Flower1.CFrame)

		    elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then

		      _tp(workspace.Flower2.CFrame)

		    elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then

		      local v = GetConnectionEnemies("Swan Pirate")

		      if v then

			    repeat wait()Attack.Kill(v,_G.Auto_Skypiea)until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Skypiea == false

		      else

		        _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))

		      end

		    end

	      elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then

            replicated.Remotes.CommF_:InvokeServer("Alchemist","3")

          end

		  elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then

	        replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")

	    elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then

	      for i,v in pairs(game.Players:GetChildren()) do

            if v.Name ~= plr.Name and tostring(v.Data.Race.Value) == "Skypiea" then

		      repeat task.wait() _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,8,0) * CFrame.Angles(math.rad(-45),0,0))until v.Humanoid.Health <= 0 or _G.Auto_Skypiea == false

	        end

	      end

        end          

      end

    end)

  end

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Upgrade FishMan V3", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_Fish = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Auto_Fish then

        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then

	      if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then

		    replicated.Remotes.CommF_:InvokeServer("Alchemist","2")

		  elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then

	        if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then

		      _tp(workspace.Flower1.CFrame)

	        elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then

	          _tp(workspace.Flower2.CFrame)

	        elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then

	          local v = GetConnectionEnemies("Swan Pirate")

		      if v then

			    repeat wait()Attack.Kill(v,_G.Auto_Fish)until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Fish == false

	          else

		       _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))

	          end

            end

	      elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then

            replicated.Remotes.CommF_:InvokeServer("Alchemist","3")

          end

        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then

	      replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")

	    elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then

          warn("Sea Beast Soon")

        end

      end

    end)

  end

end)



Tabs.Quests:AddSection("Dark Dragger")

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Unlocked Puzzle", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoUnHaki = Value

end)

AuraSkin = function(HakiID)

  local args = {[1] = {["StorageName"] = HakiID,["Type"] = "AuraSkin",["Context"] = "Equip"}};

  replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/FruitCustomizerRF"):InvokeServer(unpack(args));

end;

VaildColor = function(Part)

  if Part and Part.BrickColor then return (tostring(Part.BrickColor) == "Lime green") end;

end;

HakiCalculate = function(Part)

  local ID = {["Really red"] = "Pure Red";["Oyster"] = "Snow White";["Hot pink"] = "Winter Sky";};

  if Part and Part.BrickColor then return (ID[tostring(Part.BrickColor)])end;

end;

spawn(function()

  while wait(Sec) do

    if _G.AutoUnHaki then

      pcall(function()

        local Summoner = workspace.Map["Boat Castle"]:FindFirstChild("Summoner");

        if Summoner and Summoner:FindFirstChild("Circle") then 

          for i,v in pairs(Summoner:FindFirstChild("Circle"):GetChildren()) do 

            if v.Name == "Part" then 

            local TogglesPart = v:FindFirstChild("Part");

              if VaildColor(TogglesPart) == false then 

                AuraSkin(HakiCalculate(v));

                repeat wait() _tp(v.CFrame) until VaildColor(TogglesPart) == true or not _G.AutoUnHaki;

              end

            end            

          end

        end        

      end)

    end

  end

end)

Tabs.MultiFarm:AddSection("Main World2")

local MF_FactoryRaid = Tabs.MultiFarm:AddToggle("MF_FactoryRaids", {Title = "Auto Factory Raid", Description = "Automatically farms the Factory.", Default = false})
MF_FactoryRaid:OnChanged(function(Value)
  _G.AutoFactory = Value
end)

spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoFactory then
        local v = GetConnectionEnemies("Core")
        if v then
          repeat wait()
            EquipWeapon(_G.SelectWeapon)
            _tp(CFrame.new(448.46756, 199.356781, -441.389252))
          until v.Humanoid.Health <= 0 or _G.AutoFactory == false
        else
          _tp(CFrame.new(448.46756, 199.356781, -441.389252))
        end
      end
    end)
  end
end)

Tabs.MultiFarm:AddSection("Darkbeard")

local MF_Darkbeard = Tabs.MultiFarm:AddToggle("MF_Darkbeard", {
    Title = "Auto Farm Darkbeard",
    Description = "Automatically farms the Darkbeard boss.",
    Default = false
})

MF_Darkbeard:OnChanged(function(Value)
    _G.Auto_Rau_Den = Value
end)

spawn(function()
    while task.wait(0.1) do
        if _G.Auto_Rau_Den then
            pcall(function()
                if GetBP("Fist of Darkness") and not workspace.Enemies:FindFirstChild("Darkbeard") then
                    _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
                elseif GetConnectionEnemies("Darkbeard") then
                    local v = GetConnectionEnemies("Darkbeard")

                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, _G.Auto_Rau_Den)
                        until not _G.Auto_Rau_Den
                            or not v.Parent
                            or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

local MF_FindChestDarkbeard = Tabs.MultiFarm:AddToggle("MF_FindChestDarkbeard", {
    Title = "Find Chest Farm Darkbeard",
    Description = "Farms chests to find where Darkbeard spawns.",
    Default = false
})

MF_FindChestDarkbeard:OnChanged(function(Value)
    _G.Auto_FindChest_Darkbeard = Value
end)

spawn(function()
    while task.wait(0.1) do
        if _G.Auto_FindChest_Darkbeard then
            pcall(function()
                if GetBP("Fist of Darkness") or GetConnectionEnemies("Darkbeard") then
                    _G.AutoFarmChest = false
                    return
                end

                _G.AutoFarmChest = true

                repeat
                    task.wait(0.1)
                until not _G.Auto_FindChest_Darkbeard
                    or GetBP("Fist of Darkness")
                    or GetConnectionEnemies("Darkbeard")

                _G.AutoFarmChest = false
            end)
        else
            _G.AutoFarmChest = false
        end
    end
end)

local HopFarmDarkbeard = Tabs.MultiFarm:AddToggle("HopFarmDarkbeard", {
    Title = "Hop Farm Darkbeard",
    Description = "Hops servers to keep farming Darkbeard.",
    Default = false
})

HopFarmDarkbeard:OnChanged(function(Value)
    _G.DarkbreadHop = Value
end)

spawn(function()
    while task.wait(0.1) do
        if _G.Auto_Def_DarkCoat and _G.DarkbreadHop then
            pcall(function()
                if not workspace.Enemies:FindFirstChild("Darkbeard") then
                    Hop()
                end
            end)
        end
    end
end)

Tabs.MultiFarm:AddSection("Main World3")

local MF_CastleRaid = Tabs.MultiFarm:AddToggle("MF_CastleRaids", {
    Title = "Auto Castle Raid",
    Description = "Automatically farms mobs at the Castle raid.",
    Default = false
})

MF_CastleRaid:OnChanged(function(Value)
    _G.AutoRaidCastle = Value
end)

task.spawn(function()
    while task.wait(Sec) do
        if not _G.AutoRaidCastle then
            continue
        end

        pcall(function()
            local CastlePos = CFrame.new(
                -5496.17432,
                313.768921,
                -2841.53027,
                0.924894512,
                7.37058015e-09,
                0.380223751,
                3.5881019e-08,
                1,
                -1.06665446e-07,
                -0.380223751,
                1.12297109e-07,
                0.924894512
            )

            if not Root or not Root.Parent then
                return
            end

            local NearCastle = (Root.Position - CastlePos.Position).Magnitude <= 800

            if not NearCastle then
                _tp(CastlePos)
                return
            end

            local Target = nil
            local Distance = math.huge

            for _,v in pairs(workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid")
                and v:FindFirstChild("HumanoidRootPart")
                and v.Humanoid.Health > 0 then

                    local Magnitude = (v.HumanoidRootPart.Position - Root.Position).Magnitude

                    if Magnitude < Distance and Magnitude <= 2500 then
                        Distance = Magnitude
                        Target = v
                    end
                end
            end

            if Target then
                repeat
                    task.wait()

                    if not _G.AutoRaidCastle then
                        break
                    end

                    if not Target.Parent
                    or not Target:FindFirstChild("Humanoid")
                    or not Target:FindFirstChild("HumanoidRootPart")
                    or Target.Humanoid.Health <= 0 then
                        break
                    end

                    local DistMob = (Target.HumanoidRootPart.Position - Root.Position).Magnitude

                    if DistMob > 300 then
                        _tp(Target.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                    end

                    Attack.Kill(Target, true)

                until not _G.AutoRaidCastle
                    or not Target.Parent
                    or Target.Humanoid.Health <= 0
            else
                _tp(CastlePos)
            end
        end)
    end
end)
Tabs.MultiFarm:AddSection("Elite Quest")

local MF_EliteHunt = Tabs.MultiFarm:AddToggle("MF_EliteHunt", {Title = "Auto Farm Elite Hunter", Description = "Automatically farms Elite enemies.", Default = false})
MF_EliteHunt:OnChanged(function(Value)
  _G.FarmEliteHunt = Value
end)

spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.FarmEliteHunt then
        if plr.PlayerGui.Main.Quest.Visible == true then
          if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") then
            for i,v in pairs(replicated:GetChildren()) do
              if string.find(v.Name,"Diablo") or string.find(v.Name,"Urban") or string.find(v.Name,"Deandre") then
                _tp(v.HumanoidRootPart.CFrame)
              end
            end
            for i,v in pairs(Enemies:GetChildren()) do
              if (string.find(v.Name,"Diablo") or string.find(v.Name,"Urban") or string.find(v.Name,"Deandre")) and Attack.Alive(v) then
                repeat wait() Attack.Kill(v, _G.FarmEliteHunt) until not _G.FarmEliteHunt or plr.PlayerGui.Main.Quest.Visible == false or not v.Parent or v.Humanoid.Health <= 0
              end
            end
          end
        else
          replicated.Remotes.CommF_:InvokeServer("EliteHunter")
        end
      end
    end)
  end
end)

local HopFarmEliteHunter = Tabs.MultiFarm:AddToggle("HopFarmEliteHunter", {
    Title = "Hop Farm Elite Hunter",
    Description = "Server-hops while farming Elite Hunters.",
    Default = false
})

HopFarmEliteHunter:OnChanged(function(Value)
    _G.EliteHop = Value
end)

spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if _G.FarmEliteHunt and _G.EliteHop then
                -- Có chalice hoặc Fist thì không hop
                if GetBP("God's Chalice") or GetBP("Sweet Chalice") or GetBP("Fist of Darkness") then
                    return
                end

                local questGUI = plr.PlayerGui.Main.Quest

                if questGUI.Visible then
                    local questText = questGUI.Container.QuestTitle.Title.Text

                    local hasEliteQuest =
                        string.find(questText, "Diablo") or
                        string.find(questText, "Urban") or
                        string.find(questText, "Deandre")

                    -- Chỉ hop khi có quest nhưng không phải quest Elite
                    if not hasEliteQuest then
                        Hop()
                    end
                end
            end
        end)
    end
end)

local MF_StopChalice = Tabs.MultiFarm:AddToggle("MF_StopChalice", {Title = "Stop Hop While Have God's Chalice", Description = "Stops server hopping once you have the God's Chalice.", Default = false})
MF_StopChalice:OnChanged(function(Value)
  _G.StopWhenChalice = Value
end)

spawn(function()
  while wait(.2) do
    if _G.StopWhenChalice and _G.FarmEliteHunt then
      pcall(function()
        if GetBP("God's Chalice") or GetBP("Sweet Chalice") or GetBP("Fist of Darkness") then
          _G.FarmEliteHunt = false
        end
      end)
    end
  end
end)

Tabs.MultiFarm:AddSection("Soul Reaper")

local MF_SoulReaper = Tabs.MultiFarm:AddToggle("MF_SoulReaper", {
    Title = "Auto Farm Soul Reaper",
    Description = "Automatically farms the Soul Reaper boss.",
    Default = false
})

MF_SoulReaper:OnChanged(function(Value)
    _G.AutoHytHallow = Value
end)

spawn(function()
    while wait(Sec) do
        if _G.AutoHytHallow then
            pcall(function()
                local v = GetConnectionEnemies("Soul Reaper")
                if v then
                    repeat
                        task.wait()
                        Attack.Kill(v, _G.AutoHytHallow)
                    until v.Humanoid.Health <= 0 or not _G.AutoHytHallow
                end
            end)
        end
    end
end)

local AutoSpawnSoulReaper = Tabs.MultiFarm:AddToggle("AutoSpawnSoulReaper", {
    Title = "Auto Spawn Soul Reaper",
    Description = "Automatically spawns the Soul Reaper boss.",
    Default = false
})

AutoSpawnSoulReaper:OnChanged(function(Value)
    _G.AutoSpawnSoulReaper = Value
end)

_G.AutoSpawnSoulReaper = false

spawn(function()
    while task.wait(Sec) do
        if _G.AutoSpawnSoulReaper then
            pcall(function()
                if not GetConnectionEnemies("Soul Reaper") then
                    if not GetBP("Hallow Essence") then
                        repeat
                            task.wait(0.1)
                            replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                        until not _G.AutoSpawnSoulReaper or GetBP("Hallow Essence")
                    else
                        repeat
                            task.wait(0.1)
                            _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                        until not _G.AutoSpawnSoulReaper
                            or (plr.Character.HumanoidRootPart.Position - Vector3.new(-8932.322265625, 146.83154296875, 6062.55078125)).Magnitude <= 8

                        EquipWeapon("Hallow Essence")

                        repeat
                            task.wait(0.2)
                        until not _G.AutoSpawnSoulReaper
                            or GetConnectionEnemies("Soul Reaper")
                    end
                end
            end)
        end
    end
end)

local HopFarmSoulReaper = Tabs.MultiFarm:AddToggle("HopFarmSoulReaper", {
    Title = "Hop Farm Soul Reaper",
    Description = "Hops servers to keep farming Soul Reaper.",
    Default = false
})

HopFarmSoulReaper:OnChanged(function(Value)
    _G.SoulHopR = Value
end)

spawn(function()
    while task.wait(Sec) do
        if _G.AutoHytHallow and _G.SoulHopR then
            pcall(function()
                if not GetConnectionEnemies("Soul Reaper") then
                    Hop()
                end
            end)
        end
    end
end)

Tabs.MultiFarm:AddSection("Fighting Styles")

local MF_SuperHuman = Tabs.MultiFarm:AddToggle("MF_SuperHuman", {Title = "Auto Get Superhuman", Description = "Automatically unlocks the Superhuman fighting style.", Default = false})
MF_SuperHuman:OnChanged(function(Value)
  _G.Auto_SuperHuman = Value
end)

spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_SuperHuman then
        local M_Beli = plr.Data.Beli.Value
        local M_Frag = plr.Data.Fragments.Value
        if plr:FindFirstChild("WeaponAssetCache") then
          if not GetBP("Superhuman") then
            if not GetBP("Black Leg") then
              if (M_Beli >= 150000) then replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg") end
            elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 299 then _G.Level = true elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 300 then _G.Level = false end
            if not GetBP("Electro") then
              if (M_Beli >= 500000) then replicated.Remotes.CommF_:InvokeServer("BuyElectro") end
            elseif GetBP("Electro") and GetBP("Electro").Level.Value < 299 then _G.Level = true elseif GetBP("Electro") and GetBP("Electro").Level.Value >= 300 then _G.Level = false end
            if not GetBP("Fishman Karate") then
              if (M_Beli >= 750000) then replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate") end
            elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 299 then _G.Level = true elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 300 then _G.Level = false end
            if not GetBP("Dragon Claw") then
              if (M_Frag >= 1500) then replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") end
            elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 299 then _G.Level = true elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 300 then _G.Level = false end
            replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
          end
        end
      end
    end)
  end
end)

local MF_DeathStep = Tabs.MultiFarm:AddToggle("MF_DeathStep", {Title = "Auto Get DeathStep", Description = "Automatically unlocks the Death Step fighting style.", Default = false})
MF_DeathStep:OnChanged(function(Value)
  _G.AutoDeathStep = Value
end)

spawn(function()
  while wait(Sec) do
    if _G.AutoDeathStep then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then
          if not GetBP("Death Step") then
            if not GetBP("Black Leg") then replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg") end
            if GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("BuyDeathStep") _G.Level = false elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 399 then _G.Level = true end
            if GetBP("Black Leg") or GetBP("Black Leg").Level.Value >= 400 then
              if workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then
                if GetBP("Library Key") then
                  repeat wait() _tp(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) until not _G.AutoDeathStep or (Root.Position == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position)
                  if (Root.CFrame == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) then replicated.Remotes.CommF_:InvokeServer("BuyDeathStep") end
                elseif not GetBP("Library Key") then
                  local v = GetConnectionEnemies("Awakened Ice Admiral")
                  if v then repeat wait() Attack.Kill(v,_G.AutoDeathStep) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoDeathStep == false or GetBP("Library Key") or GetBP("Death Step")
                  else _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
                  end
                end
              end
            end
          end
        end
      end)
    end
  end
end)

local MF_SharkMan = Tabs.MultiFarm:AddToggle("MF_SharkMan", {Title = "Auto Get Sharkman Karate", Description = "Automatically unlocks the Sharkman Karate fighting style.", Default = false})
MF_SharkMan:OnChanged(function(Value)
  _G.Auto_SharkMan_Karate = Value
end)

spawn(function()
  while wait(Sec) do
    if _G.Auto_SharkMan_Karate then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then
          if not GetBP("Sharkman Karate") then
            if not GetBP("Fishman Karate") then replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate") end
            if GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate") _G.Level = false elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 399 then _G.Level = true end
            if GetBP("Fishman Karate") or GetBP("Fishman Karate").Level.Value >= 400 then
              if GetBP("Water Key") then
                if string.find(replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then
                  if GetBP("Water Key") then
                    repeat wait() _tp(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)) until not _G.Auto_SharkMan_Karate or (Root.Position == CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position)
                    replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                  end
                end
              elseif not GetBP("Water Key") then
                local v = GetConnectionEnemies("Tide Keeper")
                if v then repeat wait() Attack.Kill(v,_G.Auto_SharkMan_Karate) until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_SharkMan_Karate == false or GetBP("Water Key") or GetBP("Sharkman Karate")
                else _tp(CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625))
                end
              end
            end
          end
        end
      end)
    end
  end
end)

local MF_ElectricClaw = Tabs.MultiFarm:AddToggle("MF_ElectricClaw", {Title = "Auto Get ElectricClaw", Description = "Automatically unlocks the Electric Claw fighting style.", Default = false})
MF_ElectricClaw:OnChanged(function(Value)
  _G.Auto_Electric_Claw = Value
end)

spawn(function()
  while wait(Sec) do
    if _G.Auto_Electric_Claw then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then
          if not GetBP("Electro") then replicated.Remotes.CommF_:InvokeServer("BuyElectro") end
          if GetBP("Electro") and GetBP("Electro").Level.Value >= 400 then
            if replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then notween(CFrame.new(-12548, 337, -7481)) end
            replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
          elseif GetBP("Electro") and GetBP("Electro").Level.Value < 400 then
            repeat _G.AutoFarm_Bone = true wait() until not _G.Auto_Electric_Claw or GetBP("Electric Claw") _G.AutoFarm_Bone = false
          end
        end
      end)
    end
  end
end)

local MF_DragonTalon = Tabs.MultiFarm:AddToggle("MF_DragonTalon", {Title = "Auto Get DragonTalon", Description = "Automatically unlocks the Dragon Talon fighting style.", Default = false})
MF_DragonTalon:OnChanged(function(Value)
  _G.AutoDragonTalon = Value
end)

spawn(function()
  while wait(Sec) do
    if _G.AutoDragonTalon then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then
          if not GetBP("Dragon Claw") then replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") end
          if GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 400 then
            replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
          elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 400 then
            repeat _G.AutoFarm_Bone = true wait() until not _G.AutoDragonTalon or GetBP("Dragon Talon") _G.AutoFarm_Bone = false
          end
        end
      end)
    end
  end
end)

local MF_Godhuman = Tabs.MultiFarm:AddToggle("MF_Godhuman", {Title = "Auto Get Godhuman", Description = "Automatically unlocks the Godhuman fighting style.", Default = false})
MF_Godhuman:OnChanged(function(Value)
  _G.Auto_God_Human = Value
end)

spawn(function()
  while wait() do
    pcall(function()
      if _G.Auto_God_Human then
        if replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true) == "Bring me 20 Fish Tails, 20 Magma Ore, 10 Dragon Scales and 10 Mystic Droplets." then
          if GetM("Dragon Scale") == false or GetM("Dragon Scale") < 10 then
            if World3 then Lv = 1575 _G.Level = true
            else replicated.Remotes.CommF_:InvokeServer("TravelZou") end
          elseif GetM("Fish Tail") == false or GetM("Fish Tail") < 20 then
            if World3 then Lv = 1775 _G.Level = true
            else replicated.Remotes.CommF_:InvokeServer("TravelZou") end
          elseif GetM("Mystic Droplet") == false or GetM("Mystic Droplet") < 10 then
            if World2 then Lv = 1425 _G.Level = true
            else replicated.Remotes.CommF_:InvokeServer("TravelDressrosa") end
          elseif GetM("Magma Ore") == false or GetM("Magma Ore") < 20 then
            if World2 then Lv = 1175 _G.Level = true
            else replicated.Remotes.CommF_:InvokeServer("TravelDressrosa") end
          end
        elseif replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true) == 3 then
          return nil
        else
          replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
        end
      end
    end)
  end
end)
local StatsSection = Tabs.MultiFarm:AddSection("Stats")

local SelectedStats = {}
local AutoStatsEnabled = false

local SelectStats = StatsSection:AddDropdown("SelectStats", {
    Title = "Select Stats",
    Searchable = true,
    Description = "Selects which stats to\n auto-upgrade.",
    Values = {
        "Melee",
        "Defense",
        "Sword",
        "Gun",
        "Demon Fruit"
    },
    Multi = true,
    Default = {}
})

SelectStats:OnChanged(function(Value)
    SelectedStats = Value
end)

local AutoStats = StatsSection:AddToggle("AutoStats", {
    Title = "Auto Stats",
    Description = "Automatically spends points on the selected stats.",
    Default = false
})

AutoStats:OnChanged(function(Value)
    AutoStatsEnabled = Value
end)

task.spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if AutoStatsEnabled and plr.Data.Points.Value > 0 then
                for StatName, Enabled in pairs(SelectedStats) do
                    if Enabled then
                        local CurrentStat = StatName

                        if CurrentStat == "Demon Fruit" then
                            CurrentStat = "Devil"
                        end

                        statsSetings(CurrentStat, pSats)
                    end
                end
            end
        end)
    end
end)

Tabs.Quest:AddSection("Bartilo Quest")

local Bartilo = Tabs.Quest:AddToggle("Bartilo", {Title = "Auto Bartilo Quest", Description = "Automatically completes the Bartilo quest.", Default = false})

Bartilo:OnChanged(function(Value)

  _G.Bartilo_Quest = Value

end)

spawn(function()

  while wait(.1) do    

    pcall(function()

      if _G.Bartilo_Quest and Lv >= 850 then

      local Qbart = plr.PlayerGui.Main.Quest

        if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then

          _G.Level = false

          if Qbart.Visible == true then

            local v = GetConnectionEnemies("Swan Pirate")

            if v then

              local x = GetConnectionEnemies(BartMon)

              if x then

                repeat task.wait()

                  if not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate")then replicated.Remotes.CommF_:InvokeServer("AbandonQuest")

                  else Attack.Kill(x,_G.Bartilo_Quest)end

                until _G.Bartilo_Quest == false or not x.Parent or x.Humanoid.Health <= 0 or Qbart.Visible == false or not x:FindFirstChild("HumanoidRootPart")                  

              end

            else

              _tp(CFrame.nee(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468))

            end

          else

            repeat wait() 

              _tp(CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312))

            until (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 20 or _G.Bartilo_Quest == false

            if (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 then

              replicated.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest",1)

            end

          end

          elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then

            _G.Level = false

            local je = GetConnectionEnemies("Jeremy")

            if je then

              repeat task.wait() Attack.Kill(je,_G.Bartilo_Quest) until _G.Bartilo_Quest == false or not je.Parent or je.Humanoid.Health <= 0 or Qbart.Visible == false or not je:FindFirstChild("HumanoidRootPart")                  

            else

              _tp(CFrame.new(2158.97412, 449.056244, 705.411682, -0.754199564, -4.17389057e-09, -0.656645238, -4.47752875e-08, 1, 4.50709301e-08, 0.656645238, 6.3393955e-08, -0.754199564))

            end

          elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then

          repeat wait() _tp(CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456))until (CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 or _G.Bartilo_Quest == false

          wait(0.5)

          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate1.CFrame

          wait(0.5)

          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate2.CFrame

          wait(0.5)

          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate3.CFrame

          wait(0.5)

          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate4.CFrame

          wait(0.5)

          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate5.CFrame

          wait(0.5)

          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate6.CFrame

          wait(0.5)

          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate7.CFrame

          wait(0.5)

          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate8.CFrame

          wait(2.5)

        end

      end

    end)

  end

end)


Tabs.Quest:AddSection("Dragon Quest")

local DojoQ = Tabs.Quest:AddToggle("DojoQ", {Title = "Auto Dojo Quest", Description = "Automatically completes the Dojo quest.", Default = false})

DojoQ:OnChanged(function(Value)

  _G.Dojoo = Value

end)

function printBeltName(data) if type(data) == "table" and data.Quest["BeltName"] then return data.Quest["BeltName"] end end

spawn(function()

  while wait(Sec) do

    if _G.Dojoo then

      pcall(function()

        local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "RequestQuest"}}        

        local progress = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))

        local NameBelt = printBeltName(progress)

        if debug == false and not progress and not NameBelt then

          _tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))

          debug = true

        elseif debug == true and (CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then

          if NameBelt == "White" then

            local v = GetConnectionEnemies("Skull Slayer")

            if v then repeat task.wait() Attack.Kill(v, _G.Dojoo) until not progress or not _G.Dojoo or not Attack.Alive(v)

            else _tp(CFrame.new(-16759.58984375, 71.28376770019531, 1595.3399658203125))

            end

          elseif NameBelt == "Yellow" then

            repeat task.wait()

              _G.SeaBeast1 = true

              _G.TerrorShark = true

              _G.Shark = true

              _G.Piranha = true

              _G.MobCrew = true

              _G.FishBoat = true

              _G.SailBoats = true

            until not _G.Dojoo or not progress

            _G.SeaBeast1 = false

            _G.TerrorShark = false

            _G.Shark = false

            _G.Piranha = false

            _G.MobCrew = false

            _G.FishBoat = false

            _G.SailBoats = false               

          elseif NameBelt == "Green" then

            repeat task.wait()

              _G.SailBoats = true

            until not _G.Dojoo or not progress

            _G.SailBoats = false

          elseif NameBelt == "Purple" then

            repeat task.wait()

              _G.FarmEliteHunt = true

            until not _G.Dojoo or not progress

            _G.FarmEliteHunt = false

          elseif NameBelt == "Red" then

            repeat task.wait()

              _G.SailBoats = true

              _G.FishBoat = true

            until not _G.Dojoo or not progress

            _G.SailBoats = false

            _G.FishBoat = false                      

          elseif NameBelt == "Black" then

            repeat task.wait()              

              if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then    

                _G.Prehis_Find = true                   

                if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt",true) then

                  _G.Prehis_Skills = false

                  _G.Prehis_Find = true

                else

                  _G.Prehis_Skills = true

                  _G.Prehis_Find = false

                end

              else

                _G.Prehis_Find = true

                _G.Prehis_Skills = false

              end

            until not _G.Dojoo or not progress

            _G.Prehis_Find = false

            _G.Prehis_Skills = false                        

          elseif NameBelt == "Orange" or NameBelt == "Blue" then

            return nil

          end

        end

        if not progress then

          debug = false

          local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "ClaimQuest"}}

          replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))

        end

      end)

    end

  end

end)


local BlazeEM = Tabs.Quest:AddToggle("BlazeEM", {Title = "Auto Dragon Hunter", Description = "Automatically farms fireballs for the Dragon Hunter.", Default = false})

BlazeEM:OnChanged(function(Value)

  _G.FarmBlazeEM = Value

end)

checkQuesta=function()local a={[1]={["Context"]="Check"}}local b=nil;pcall(function()local c={[1]={["Context"]="RequestQuest"}}game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(c))end)local d,e=pcall(function()b=game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(a))end)local f=false;local g;local h;local i;if b then if b.Text then f=true;local j=b.Text;if string.find(tostring(j),"Defeat")then i=1;g=string.sub(tostring(j),8,9)g=tonumber(g)local k={"Hydra Enforcer","Venomous Assailant"}for l,m in pairs(k)do if string.find(j,m)then h=m;break end end elseif string.find(tostring(j),"Destroy")then g=10;i=2;h=nil end end end;return f,h,g,i end

BackTODoJo=function()for a,b in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren())do if b.Name=="NotificationTemplate"then if string.find(b.Text,"Head back to the Dojo to complete more tasks")then return true end end end;return false end

DragonMobClear=function(a,b,c)if workspace.Enemies:FindFirstChild(b)then for d,e in pairs(workspace.Enemies:GetChildren())do if e.Name==b and Attack.Alive(e)then if a then Attack.Kill(e,a)end end end else _tp(c)end end

spawn(function()

  while wait() do 

    if _G.FarmBlazeEM then

      pcall(function()              

        local a,v,h,x = checkQuesta()                  

        if a == true and not BackTODoJo() then

          if x == 1 then

            if v == "Hydra Enforcer" or v == "Venomous Assailant" then            

              repeat wait()

                DragonMobClear(true, v, CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))

              until not _G.FarmBlazeEM or not a or BackTODoJo()                            

            end      

          elseif x == 2 then

            if workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true) then

              repeat wait()                

                spawn(function() _tp(workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).CFrame * CFrame.new(4,0,0)) end)

                if (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position - Root.Position).Magnitude <= 200 then

                MousePos = workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position

                Useskills("Melee","Z")

	            Useskills("Melee","X")

	            Useskills("Melee","C")

                wait(.5)

                Useskills("Sword","Z")

                Useskills("Sword","X")

                wait(.5)

                Useskills("Blox Fruit","Z")

                Useskills("Blox Fruit","X")

                Useskills("Blox Fruit","C")

                wait(.5)

                Useskills("Gun","Z")

                Useskills("Gun","X")

                end

              until not _G.FarmBlazeEM or not a or BackTODoJo()

            end

          end

        else

          _tp(CFrame.new(5813, 1208, 884))

          DragonMobClear(false, nil, nil) 

        end

      end)

    end

  end

end)

spawn(function()

  while wait(.1) do 

    if _G.FarmBlazeEM then

      pcall(function()              

        if workspace.EmberTemplate:FindFirstChild("Part") then

          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.EmberTemplate.Part.CFrame        

        end

      end)

    end

  end

end)


local Section = Tabs.Quest:AddSection("Ken")

Section:AddToggle("UpgradeObserV2", {
    Title = "Auto Upgrade Ken V2",
    Description = "Automatically upgrades Observation Haki (Ken) V2.",
    Default = false,
    Callback = function(Value)
        _G.AutoKenVTWO = Value
    end
})

spawn(function()
  while wait(Sec) do
    if _G.AutoKenVTWO then
      pcall(function()
      local Kv2Pos1 = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
      local Kv2Pos2 = "Kuy"
      local Kv2Pos3 = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
      local Kv2Pos4 = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
      local Kv2Pos5 = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)
	  if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat 50 Forest Pirates") then
	    local v = GetConnectionEnemies("Forest Pirate")
        if v then
	      repeat wait() Attack.Kill(v,_G.AutoKenVTWO) until not _G.AutoKenVTWO or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
	    else
	      _tp(Kv2Pos4)
	    end
	  elseif plr.PlayerGui.Main.Quest.Visible == true then 
	    local v = GetConnectionEnemies("Captain Elephant")
	    if v then
          repeat wait() Attack.Kill(v,_G.AutoKenVTWO) until not _G.AutoKenVTWO or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
	    else
	      _tp(Kv2Pos5)
	    end
	  elseif plr.PlayerGui.Main.Quest.Visible == false then
	    replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") wait(.1)
	    replicated.Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
	  end
	  if replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
	    _tp(CFrame.new(-12513.51953125, 340.1137390136719, -9873.048828125))
	  end
	  if not plr.Backpack:FindFirstChild("Fruit Bowl") or not plr.Character:FindFirstChild("Fruit Bowl") then
	  if not GetBP("Fruit Bowl") then   	    
	    if not GetBP("Apple") then
	      replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
	      for i,v in pairs(workspace:GetDescendants()) do
	        if v.Name == "Apple" then
	          v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
		      firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()		    
	        end
	      end
	    elseif not GetBP("Banana") then
	      _tp(CFrame.new(2286.0078125,73.13391876220703,-7159.80908203125))
	      for i,v in pairs(workspace:GetDescendants()) do
	        if v.Name == "Banana" then
	          v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
		      firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()		    
	        end
	      end	    
	    elseif not GetBP("Pineapple") then
	      _tp(CFrame.new(-712.8272705078125,98.5770492553711,5711.9541015625))
	      for i,v in pairs(workspace:GetDescendants()) do
	        if v.Name == "Pineapple" then
	          v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
		      firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()		    
	        end
	      end	    
	    end	  
	  end  	    	    
	    if plr.Backpack:FindFirstChild("Banana") and plr.Backpack:FindFirstChild("Apple") and plr.Backpack:FindFirstChild("Pineapple") or plr:FindFirstChild("Banana") and plr:FindFirstChild("Apple") and plr:FindFirstChild("Pineapple") then
	      repeat wait() _tp(Kv2Pos1) until _G.AutoKenVTWO or plr.Character.HumanoidRootPart.CFrame == Kv2Pos1
		  replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")	    			 
	    end
	      if plr.Backpack:FindFirstChild("Fruit Bowl") or plr.Character:FindFirstChild("Fruit Bowl") then
	        if plr.Character.HumanoidRootPart.CFrame ~= Kv2Pos3 then _tp(Kv2Pos3)
		    elseif plr.Character.HumanoidRootPart.CFrame == Kv2Pos3 then
		      replicated.Remotes.CommF_:InvokeServer("KenTalk2","Start") wait(.1)
		      replicated.Remotes.CommF_:InvokeServer("KenTalk2","Buy")
	        end			 		    
	      end
	    end
      end)
    end
  end
end)

Section:AddToggle("ObservationNormal", {
    Title = "Auto Farm Ken",
    Description = "Automatically farms Observation Haki (Ken).",
    Default = false,
    Callback = function(Value)
        _G.obsFarm = Value
    end
})

spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.obsFarm then        
        replicated.Remotes.CommE:FireServer("Ken",true)
        if plr:GetAttribute("KenDodgesLeft") == 0 then
          KenTest = false
        elseif plr:GetAttribute("KenDodgesLeft") > 0 then
          replicated.Remotes.CommE:FireServer("Ken",true)
          KenTest = true
        end        
      end
    end)
  end
end)    
spawn(function()      
  while wait(.2) do
    pcall(function()
      if _G.obsFarm then
        if World1 then
          if workspace.Enemies:FindFirstChild("Galley Captain") then
            if KenTest then
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
              until _G.obsFarm == false or KenTest == false
            else
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
              until _G.obsFarm == false or KenTest
            end
          else
            _tp(CFrame.new(5533.29785, 88.1079102, 4852.3916))
          end
        elseif World2 then
          if workspace.Enemies:FindFirstChild("Lava Pirate") then
            if KenTest then
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
              until _G.obsFarm == false or KenTest == false
            else
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
              until _G.obsFarm == false or KenTest
            end
          else
            _tp(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
          end
        elseif World3 then
          if workspace.Enemies:FindFirstChild("Venomous Assailant") then
            if KenTest then
              repeat wait()
                _tp(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(3,0,0))
              until _G.obsFarm == false or KenTest == false
            else
              repeat wait()
                _tp(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(0,50,0))
              until _G.obsFarm == false or KenTest
            end
          else
            _tp(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
          end
        end        
      end
    end)
  end
end)

Section:AddToggle("ObservationRejoin", {
    Title = "Rejoin Farm Ken",
    Description = "Rejoins the server to keep farming Ken.",
    Default = false,
    Callback = function(Value)
        _G.ObservationRejoin = Value
    end
})

spawn(function()
    while task.wait(2) do
        pcall(function()
            if _G.obsFarm and _G.ObservationRejoin then
                game:GetService("TeleportService"):TeleportToPlaceInstance(
                    game.PlaceId,
                    game.JobId,
                    game.Players.LocalPlayer
                )
            end
        end)
    end
end)


Tabs.Quest:AddSection("Rainbow Haki")

local Q = Tabs.Quest:AddToggle("Q", {
    Title = "Auto Rainbow Haki Quest",
    Description = "Automatically completes the Rainbow Haki quest.",
    Default = false
})

Q:OnChanged(function(Value)
    _G.Auto_Rainbow_Haki = Value
    _G.GetQFast = Value
end)

spawn(function()
    pcall(function()
        while wait(Sec) do
            if _G.Auto_Rainbow_Haki then
                if plr.PlayerGui.Main.Quest.Visible == false then
                    replicated.Remotes.CommF_:InvokeServer("HornedMan","Bet")

                elseif string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                    local v = GetConnectionEnemies("Stone")
                    if v then
                        repeat
                            wait()
                            Attack.Kill(v, _G.Auto_Rainbow_Haki)
                        until not _G.Auto_Rainbow_Haki or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        _tp(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                    end

                elseif string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
                    local v = GetConnectionEnemies("Hydra Leader")
                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, _G.Auto_Rainbow_Haki)
                        until not _G.Auto_Rainbow_Haki or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5643.45263671875,1013.0858154296875,-340.51025390625))
                        local framelong1 = Vector3.new(5643.45263671875,1013.0858154296875,-340.51025390625)
                        local framelong2 = CFrame.new(5821.89794921875,1019.0950927734375,-73.71923065185547)
                        if plr.Character.HumanoidRootPart.CFrame.Position == framelong1 then
                            _tp(framelong2)
                        end
                    end

                elseif string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                    local v = GetConnectionEnemies("Kilo Admiral")
                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, _G.Auto_Rainbow_Haki)
                        until not _G.Auto_Rainbow_Haki or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        _tp(CFrame.new(2877.61743,423.558685,-7207.31006,-0.989591599,0,-0.143904909,0,1,0,0.143904924,0,-0.989591479))
                    end

                elseif string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                    local v = GetConnectionEnemies("Captain Elephant")
                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, _G.Auto_Rainbow_Haki)
                        until not _G.Auto_Rainbow_Haki or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        local pos1 = Vector3.new(-12471.169921875,374.94024658203,-7551.677734375)
                        local pos2 = CFrame.new(-13376.7578125,433.28689575195,-8071.392578125)
                        if plr.Character.HumanoidRootPart.CFrame.Position ~= pos1 then
                            replicated.Remotes.CommF_:InvokeServer("requestEntrance", pos1)
                        else
                            _tp(pos2)
                        end
                    end

                elseif string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                    local v = GetConnectionEnemies("Beautiful Pirate")
                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, _G.Auto_Rainbow_Haki)
                        until not _G.Auto_Rainbow_Haki or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5314.54638671875,22.562219619750977,-127.06755065917969))
                    end
                end
            end
        end
    end)
end)

Tabs.Quest:AddSection("Citizen Quest")

local CitizenQ = Tabs.Quest:AddToggle("CitizenQ", {Title = "Auto Citizen Quest", Description = "Automatically completes the Citizen quest for the Musketeer Hat.", Default = false})

CitizenQ:OnChanged(function(Value)

  _G.CitizenQuest = Value

end)

spawn(function()	

  while wait(Sec) do

    pcall(function()

      if _G.CitizenQuest then

        if Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then

          if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then

            local v = GetConnectionEnemies("Forest Pirate")

            if v then

              repeat task.wait() Attack.Kill(v,_G.CitizenQuest)until _G.CitizenQuest == false or not v.Parent or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false

            else

              _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))

            end

          else

            _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))

            if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - plr.Character.HumanoidRootPart.Position).Magnitude <= 30 then

              wait(1.5) replicated.Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)

            end

          end

        elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then

          local v = GetConnectionEnemies("Captain Elephant")

          if plr.PlayerGui.Main.Quest.Visible and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and plr.PlayerGui.Main.Quest.Visible == true then

            if v then

              repeat task.wait() Attack.Kill(v,_G.CitizenQuest) until _G.CitizenQuest == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false

            else

              _tp(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))

            end

          else

            _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))

            if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 4 then

              wait(1.5)

              replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")

            end

          end

        elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then

          _tp(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))

        end

      end

    end)

  end

end)


Tabs.Settings:AddSection("Weapon Settings")

local _Weapon = {"Melee","Sword","Blox Fruit","Gun"}

_G.ChooseWP = nil
_G.SelectWeapon = nil

local Weapon_Config = Tabs.Settings:AddDropdown("Weapon_Config", {
    Title = "Select Weapon",
    Searchable = true,
    Description = "Choose which weapon type\n (Melee/Sword/Gun/Fruit) to farm with.",
    Values = _Weapon,
    Multi = false
})

Weapon_Config:OnChanged(function(Value)
    if Value and Value ~= "" then
        _G.ChooseWP = Value
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()

            if _G.ChooseWP == nil then

                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                            break
                        end
                    end
                end

            elseif _G.ChooseWP == "Melee" then

                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                            break
                        end
                    end
                end

            elseif _G.ChooseWP == "Sword" then

                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                            break
                        end
                    end
                end

            elseif _G.ChooseWP == "Gun" then

                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                            break
                        end
                    end
                end

            elseif _G.ChooseWP == "Blox Fruit" then

                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                            break
                        end
                    end
                end

            end

        end)
    end
end)
Tabs.Settings:AddSection("Character Settings")

local BusuAura = Tabs.Settings:AddToggle("BusuAura", {
    Title = "Auto Use Buso",
    Description = "Auto-activates Buso (Armament) Haki.",
    Default = true
})

Boud = true

BusuAura:OnChanged(function(Value)
    Boud = Value
end)

local ObservationTurnOn = Tabs.Settings:AddToggle("ObservationTurnOn", {
    Title = "Auto Use Ken",
    Description = "Auto-activates Ken (Observation) Haki to dodge hits.",
    Default = false
})

getgenv().Observation = false

ObservationTurnOn:OnChanged(function(Value)
    getgenv().Observation = Value
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if Boud then
                local _HasBuso = {"HasBuso", "Buso"}
                if not plr.Character:FindFirstChild(_HasBuso[1]) then
                    replicated.Remotes.CommF_:InvokeServer(_HasBuso[2])
                end
            end

            if getgenv().Observation then
                replicated.Remotes.CommE:FireServer("Ken", true)
            end
        end)
    end
end)

Tabs.Settings:AddSection("Race Ability Settings")

local RaceV3Aura = Tabs.Settings:AddToggle("RaceV3Aura", {Title = "Auto Turn on Race V3", Description = "Auto-activates your V3 race ability.", Default = false})

RaceV3Aura:OnChanged(function(Value)

  _G.RaceClickAutov3 = Value

end)

spawn(function()

  while wait(.2) do

    pcall(function()

      if _G.RaceClickAutov3 then

        repeat

          replicated.Remotes.CommE:FireServer("ActivateAbility") 

          wait(30)

        until not _G.RaceClickAutov3   

      end 

    end)

  end

end)

local RaceV4Aura = Tabs.Settings:AddToggle("RaceV4Aura", {Title = "Auto Turn on Race V4", Description = "Auto-activates your V4 race transformation when energy is full.", Default = false})

RaceV4Aura:OnChanged(function(Value)

  _G.RaceClickAutov4 = Value

end)

spawn(function()

  while wait(.2) do

    pcall(function()

      if _G.RaceClickAutov4 then

  	    if plr.Character:FindFirstChild("RaceEnergy") then

        if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then Useskills("nil","Y") end

        end        

      end 

    end)

  end

end)


Tabs.Settings:AddSection("Farm Settings")

local DisblesVFX = Tabs.Settings:AddToggle("DisblesVFX", {Title = "Remove Notify Text", Description = "Hides the game's in-game notification popups.", Default = false})

DisblesVFX:OnChanged(function(Value)

  RemoveDamage = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if RemoveDamage then

        replicated.Assets.GUI.DamageCounter.Enabled = false

        plr.PlayerGui.Notifications.Enabled = false

	  else

        replicated.Assets.GUI.DamageCounter.Enabled = true

        plr.PlayerGui.Notifications.Enabled = true

      end

    end)

  end

end)

local Bringmob = Tabs.Settings:AddToggle("Bringmob", {
    Title = "Bring Mob",
    Description = "Pulls nearby mobs to you while farming.",
    Default = true
})

Bringmob:OnChanged(function(Value)
    _B = Value
end)

local Initialize = Tabs.Settings:AddToggle("Initialize", {
    Title = "Allow Attack M1 Fruits",
    Description = "Uses you Blox Fruits M1 (left-click) to attack requires a fruit.",
    Default = false
})

Initialize:OnChanged(function(Value)
    _G.Seriality = Value
end)

AllowDragonStorm = Tabs.Settings:AddToggle("AllowDragonStorm", {
    Title = "Dragon Storm (All NPCs + SeaBeast + Leviathan)",
    Description = "Equips Dragonstorm gun and attacks ALL nearby enemies including SeaBeast and Leviathan. Requires Dragonstorm.",
    Default = false
})

AllowDragonStorm:OnChanged(function(Value)
    getgenv().AllowDragonStorm = Value
end)

-- ── DRAGON STORM: find closest valid target from ALL sources ──
GetDragonStormTarget = function()
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end

    local closestPos = nil
    local closestDist = math.huge

    local function checkTarget(pos, health)
        if health and health <= 0 then return end
        local dist = (hrp.Position - pos).Magnitude
        if dist < closestDist and dist <= 600 then
            closestDist = dist
            closestPos = pos
        end
    end

    -- Workspace Enemies (NPCs)
    pcall(function()
        for _, v in pairs(workspace.Enemies:GetChildren()) do
            local vHRP = v:FindFirstChild("HumanoidRootPart")
            local vHum = v:FindFirstChild("Humanoid")
            if vHRP and vHum and vHum.Health > 0 then
                checkTarget(vHRP.Position, vHum.Health)
            end
        end
    end)

    -- SeaBeasts (SeaBeast1 + Leviathan)
    pcall(function()
        for _, v in pairs(workspace.SeaBeasts:GetChildren()) do
            local vHRP = v:FindFirstChild("HumanoidRootPart")
            local vHealth = v:FindFirstChild("Health")
            if vHRP and vHealth and vHealth.Value > 0 then
                -- Prefer Leviathan Segment for accuracy
                local seg = v:FindFirstChild("Leviathan Segment")
                checkTarget(seg and seg.Position or vHRP.Position, vHealth.Value)
            end
        end
    end)

    return closestPos
end

task.spawn(function()
    while task.wait(0.05) do
        if getgenv().AllowDragonStorm then
            pcall(function()
                local char = plr.Character
                if not char then return end

                -- Dragonstorm = Gun type weapon, check by name
                local dsInBag   = plr.Backpack:FindFirstChild("Dragonstorm")
                local dsEquip   = char:FindFirstChild("Dragonstorm")

                if not dsInBag and not dsEquip then return end

                -- Equip Dragonstorm specifically (not just any Gun)
                if dsInBag and not dsEquip then
                    char.Humanoid:EquipTool(dsInBag)
                    task.wait(0.08)
                end

                local targetPos = GetDragonStormTarget()
                if targetPos then
                    MousePos = targetPos
                    -- Send key directly (already equipped Dragonstorm)
                    vim1:SendKeyEvent(true,  "Z", false, game)
                    vim1:SendKeyEvent(false, "Z", false, game)
                    task.wait(0.05)
                    vim1:SendKeyEvent(true,  "X", false, game)
                    vim1:SendKeyEvent(false, "X", false, game)
                end
            end)
        end
    end
end)

AllowSoulGuitar = Tabs.Settings:AddToggle("AllowSoulGuitar", {
    Title = "Allow Soul Guitar Attack",
    Description = "Shoots with the Skull Guitar, needs the guitar and Buso Haki.",
    Default = false
})

AllowSoulGuitar:OnChanged(function(Value)
    getgenv().AllowSoulGuitar = Value
end)

AllowAttackPlayers = Tabs.Settings:AddToggle("AllowAttackPlayers", {
    Title = "Allow Attack Players",
    Description = "Also attacks nearby players while farming.",
    Default = false
})

AllowAttackPlayers:OnChanged(function(Value)
    getgenv().AllowAttackPlayers = Value

    if Value then
        task.spawn(function()
            while getgenv().AllowAttackPlayers do
                task.wait(0.5)

                pcall(function()
                    local player = game.Players.LocalPlayer
                    local character = player.Character
                    if not character then return end

                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character:FindFirstChildOfClass("Humanoid")

                    if not hrp or not humanoid or humanoid.Health <= 0 then
                        return
                    end

                    local targetPlayer = nil
                    local shortestDist = 100

                    for _, p in ipairs(game.Players:GetPlayers()) do
                        if p ~= player and p.Character then
                            if not p.Team or p.Team ~= player.Team then
                                local targetHrp = p.Character:FindFirstChild("HumanoidRootPart")
                                local targetHum = p.Character:FindFirstChildOfClass("Humanoid")

                                if targetHrp and targetHum and targetHum.Health > 0 then
                                    local isPvpEnabled = true

                                    if p.Character:GetAttribute("SafeZone") == true
                                        or p:GetAttribute("PvP") == false then
                                        isPvpEnabled = false
                                    end

                                    if isPvpEnabled then
                                        local dist = (targetHrp.Position - hrp.Position).Magnitude

                                        if dist >= 50 and dist <= shortestDist then
                                            shortestDist = dist
                                            targetPlayer = p
                                        end
                                    end
                                end
                            end
                        end
                    end

                    if targetPlayer and targetPlayer.Character then
                        local targetHrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local targetHum = targetPlayer.Character:FindFirstChildOfClass("Humanoid")

                        if targetHrp and targetHum then
                            shouldTween = true

                            while getgenv().AllowAttackPlayers
                                and targetPlayer.Character
                                and targetHum.Health > 0
                                and humanoid.Health > 0 do

                                local stillValid = true

                                if targetPlayer.Character:GetAttribute("SafeZone") == true
                                    or targetPlayer:GetAttribute("PvP") == false then
                                    stillValid = false
                                end

                                if not stillValid then
                                    shouldTween = false

                                    if CurrentTween then
                                        pcall(function()
                                            CurrentTween:Cancel()
                                        end)
                                    end

                                    break
                                end

                                _tp(targetHrp.CFrame)
                                task.wait()
                            end
                        end
                    end
                end)
            end
        end)
    else
        shouldTween = false

        if CurrentTween then
            pcall(function()
                CurrentTween:Cancel()
            end)
        end
    end
end)

getgenv().TweenSpeed = 190

Tabs.Settings:AddSlider("TweenSpeed", {
    Title = "Tween Speed",
    Description = "Travel speed of the farm tween (studs/sec). Lower = slower and safer.\n",
    Default = 190,
    Min = 0,
    Max = 250,
    Rounding = 0,
    Callback = function(Value)
        getgenv().TweenSpeed = Value
    end
})
local Byp = Tabs.Settings:AddToggle("Byp", {Title = "Bypass Teleport", Description = "Crosses the map by setting your spawn point\n and resetting, instead of flying. Only fires when it\n genuinely saves a long trip.", Default = false})

Byp:OnChanged(function(Value)

  _G.Bypass = Value

end)
FastTele = Tabs.Settings:AddToggle("FastTele", {Title = "Fast Teleport", Description = "Warp across the map through island entrances.\n Turn off if the bot keeps getting yanked to the\n wrong island.", Default = false})

FastTele:OnChanged(function(Value)

  _G.FastTeleport = Value

end)
MasterySkillSection = Tabs.Settings:AddSection("Mastery Skill Settings")

local SelectedSkills = {}
local HoldingEnabled = false

SelectSkill = MasterySkillSection:AddDropdown("SelectSkill", {
    Title = "Select Skill",
    Searchable = true,
    Description = "Pick which skill keys\n (Z/X/C/V) to use in the\n Prehistoric event.",
    Searchable = false,
    Values = {
        "Z",
        "X",
        "C",
        "V"
    },
    Multi = true,
    Default = {}
})

SelectSkill:OnChanged(function(Value)
    SelectedSkills = Value
end)

Holding = MasterySkillSection:AddToggle("Holding", {
    Title = "Holding",
    Description = "Holds skill keys for the set duration instead of\n tapping.",
    Default = false
})

Holding:OnChanged(function(Value)
    HoldingEnabled = Value
end)

HoldZ = MasterySkillSection:AddSlider("HoldZ", {
    Title = "Hold Z",
    Description = "Seconds to hold skill Z (0 = tap).\n",
    Min = 0,
    Max = 10,
    Default = 0,
    Rounding = 1
})

HoldX = MasterySkillSection:AddSlider("HoldX", {
    Title = "Hold X",
    Description = "Seconds to hold skill X (0 = tap).\n",
    Min = 0,
    Max = 10,
    Default = 0,
    Rounding = 1
})

HoldC = MasterySkillSection:AddSlider("HoldC", {
    Title = "Hold C",
    Description = "Seconds to hold skill C (0 = tap).\n",
    Min = 0,
    Max = 10,
    Default = 0,
    Rounding = 1
})

HoldV = MasterySkillSection:AddSlider("HoldV", {
    Title = "Hold V",
    Description = "Seconds to hold skill V (0 = tap).\n",
    Min = 0,
    Max = 10,
    Default = 0,
    Rounding = 1
})

DistanceSection = Tabs.Settings:AddSection("Distance Settings")

DistanceX = DistanceSection:AddSlider("DistanceX", {
    Title = "Distance X",
    Description = "X-axis offset from the target while farming.\n",
    Min = -100,
    Max = 100,
    Default = 0,
    Rounding = 0
})

DistanceY = DistanceSection:AddSlider("DistanceY", {
    Title = "Distance Y",
    Description = "Y-axis (height) offset from the target while\n farming.\n",
    Min = -100,
    Max = 100,
    Default = 15,
    Rounding = 0
})

DistanceZ = DistanceSection:AddSlider("DistanceZ", {
    Title = "Distance Z",
    Description = "Z-axis offset from the target while farming.\n",
    Min = -100,
    Max = 100,
    Default = 0,
    Rounding = 0
})

Tabs.Quests:AddSection("Tushita + Yama")

local Process = Tabs.Quests:AddParagraph({Title = "Elites Process ",Content = ""})

spawn(function()

  while wait(Sec) do

    pcall(function()    

      Process:SetDesc("Elite Procress :  " ..replicated.Remotes.CommF_:InvokeServer("EliteHunter","Progress"))

    end)

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Tushita Sword", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_Tushita = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Auto_Tushita then

        if workspace.Map.Turtle:FindFirstChild("TushitaGate") then

          if not GetBP("Holy Torch") then

            _tp(CFrame.new(5148.03613, 162.352493, 910.548218))

            wait(0.7)

          else

            EquipWeapon("Holy Torch")

            task.wait(1)

            repeat task.wait() _tp(CFrame.new(-10752, 417, -9366)) until not _G.Auto_Tushita or (CFrame.new(-10752, 417, -9366).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

            wait(.7)

            repeat task.wait() _tp(CFrame.new(-11672, 334, -9474)) until not _G.Auto_Tushita or (CFrame.new(-11672, 334, -9474).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

            wait(.7)

            repeat task.wait() _tp(CFrame.new(-12132, 521, -10655)) until not _G.Auto_Tushita or (CFrame.new(-12132, 521, -10655).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

            wait(.7)

            repeat task.wait() _tp(CFrame.new(-13336, 486, -6985)) until not _G.Auto_Tushita or (CFrame.new(-13336, 486, -6985).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

            wait(.7)

            repeat task.wait() _tp(CFrame.new(-13489, 332, -7925)) until not _G.Auto_Tushita or (CFrame.new(-13489, 332, -7925).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

          end

        else

          local v = GetConnectionEnemies("Longma")

          if v then repeat task.wait() Attack.Kill(v,_G.Auto_Tushita) until v.Humanoid.Health <= 0 or not _G.Auto_Tushita or not v.Parent

          else 

          if replicated:FindFirstChild("Longma") then _tp(replicated:FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(0,40,0)) end

          end                     

        end

      end

    end)

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Yama Sword", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_Yama = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Auto_Yama then

	    if replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then

	      _G.FarmEliteHunt = true

	    elseif replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") > 30 then

	      _G.FarmEliteHunt = false

	      if (workspace.Map.Waterfall.SealedKatana.Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 20 then

            _tp(workspace.Map.Waterfall.SealedKatana.Handle.CFrame)

            local zx = GetConnectionEnemies("Ghost")

            if zx then

              repeat wait() Attack.Kill(zx,_G.Auto_Yama) until zx.Humanoid.Health <= 0 or not zx.Parent or not _G.Auto_Yama               

			  fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)

            end

          end

	    end

      end

    end)

  end

end)



Tabs.Quests:AddSection("Cursed Dual Katana")

local CheckCDK = Tabs.Quests:AddParagraph({Title = " Number Cursed dual katana quests ",Content = "Quest Numbers :"})

spawn(function()  

  while wait(.2) do 

    if QuestYama_1 == true then 

	 CheckCDK:SetDesc(" Quest Numbers : yama quest 1") 

    elseif QuestYama_2 == true then

	  CheckCDK:SetDesc(" Quest Numbers : yama quest 2") 

    elseif QuestYama_3 == true then

	  CheckCDK:SetDesc(" Quest Numbers : yama quest 3") 

    elseif QuestTushita_1 == true then

	  CheckCDK:SetDesc(" Quest Numbers : tushita quest 1") 

    elseif QuestTushita_2 == true then

	  CheckCDK:SetDesc(" Quest Numbers : tushita quest 2") 

    elseif QuestTushita_1 == true then

	  CheckCDK:SetDesc(" Quest Numbers: tushita quest 2") 

	elseif GetWP("Cursed Dual Katana") then

	  CheckCDK:SetDesc(" Quest Numbers: CDK done!!")

    end 

  end

end) 

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Get CDK [ Last Quest ]", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.CDK = Value

end)

spawn(function()    

  while wait(Sec) do

    pcall(function()

      if _G.CDK then

        replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")

        replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")

        replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Boss")

        local v = GetConnectionEnemies("Cursed Skeleton Boss")

        if v then

          repeat wait()

            if plr.Character:FindFirstChild("Yama") or plr.Backpack:FindFirstChild("Yama") then EquipWeapon("Yama")

            elseif plr.Character:FindFirstChild("Tushita") or plr.Backpack:FindFirstChild("Tushita") then EquipWeapon("Tushita")                                    

            end _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))

          until not _G.CDK or not v.Parent or v.Humanoid.Health <= 0                                

        else

          _tp(CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375)) wait(.5)

          _tp(workspace.Map.Turtle.Cursed.BossDoor.CFrame)

        end

      end

    end)

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Yama CDK", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.CDK_YM = Value

end)

spawn(function()

  while wait() do

    pcall(function()

      if _G.CDK_YM then

        if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then                  

          replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")

          replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)

        else

          if replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == nil then

            replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")

            replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")

          elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == false then                        

            if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -3 then

              QuestYama_1 = true QuestYama_2 = false QuestYama_3 = false

              repeat task.wait()

                if not workspace.Enemies:FindFirstChild("Forest Pirate") then

                  _tp(CFrame.new(-13223.521484375, 428.1938171386719, -7766.06787109375))

                else

                  local v = GetConnectionEnemies("Forest Pirate")

                  if v then _tp(workspace.Enemies:FindFirstChild("Forest Pirate").HumanoidRootPart.CFrame)end

                end

              until tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 1 or not _G.CDK_YM

            elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -4 then

              QuestYama_1 = false QuestYama_2 = true QuestYama_3 = false

              for ix,HitMon in pairs(game:GetService("Players").LocalPlayer.QuestHaze:GetChildren()) do

                for NameMonHaze, CFramePos in pairs(PosMsList) do

                  if string.find(NameMonHaze,HitMon.Name) and HitMon.Value > 0 then

                    if (CFramePos.Position - Root.Position).Magnitude <= 1000 and workspace.Enemies:FindFirstChild(NameMonHaze) then

                      for i,v in pairs(workspace.Enemies:GetChildren()) do

                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HazeESP") then

                          repeat wait() Attack.Kill(v, _G.CDK_YM) until not _G.CDK_YM or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 2 or not v:FindFirstChild("HazeESP") or v.Humanoid.Health <= 0

                        end

                      end

                    else   

                      _tp(CFramePos)                               

                    end

                  end

                end

              end

            elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then

              QuestYama_1 = false QuestYama_2 = false QuestYama_3 = true

              if workspace.Map:FindFirstChild("HellDimension") then

                if (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000 then

                  for gg,ez in pairs(workspace.Map.HellDimension.Exit:GetChildren()) do

                    if tonumber(gg) == 2 then

                      repeat task.wait() Root.CFrame = workspace.Map.HellDimension.Exit.CFrame until not _G.CDK_YM or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3

                    end

                  end

                  EquipWeapon(_G.SelectWeapon)

                  if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) ~= 3 then

                  repeat task.wait()

                    repeat task.wait() 

                      _tp(workspace.Map.HellDimension.Torch1.Particles.CFrame) 

                      for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do

                        if v:IsA("ProximityPrompt") then fireproximityprompt(v) end

                      end

                    until (workspace.Map.HellDimension.Torch1.Particles.Position - Root.Position).Magnitude < 5

                    wait(2) _G.T1Yama = true

                  until not _G.CDK_YM or _G.T1Yama or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3

                  repeat task.wait()

                    repeat task.wait()

                      _tp(workspace.Map.HellDimension.Torch2.Particles.CFrame) 

                      for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do

                        if v:IsA("ProximityPrompt") then fireproximityprompt(v)end

                      end

                    until (workspace.Map.HellDimension.Torch2.Particles.Position - Root.Position).Magnitude < 5

                    wait(2) _G.T2Yama = true

                  until _G.T2Yama or _G.CDK_YM == false or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3

                    repeat wait()

                      repeat task.wait() 

                        _tp(workspace.Map.HellDimension.Torch3.Particles.CFrame) 

                        for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do

                          if v:IsA("ProximityPrompt") then fireproximityprompt(v)end

                        end

                      until (workspace.Map.HellDimension.Torch3.Particles.Position - Root.Position).Magnitude < 5 

                      wait(2) _G.T3Yama = true

                    until _G.T3Yama or _G.CDK_YM == false or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3

                  end

                  for i,v in pairs(workspace.Enemies:GetChildren()) do

                    if (v:FindFirstChild("HumanoidRootPart").Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 300 then

                      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then

                        repeat task.wait() Attack.Kill(v,_G.CDK_YM) until not _G.CDK_YM or v.Humanoid.Health <= 0 or not v.Parent or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3

                      end

                    end

                  end

                end

              end

            end

          end

        end

      end

    end)

  end

end)

spawn(function()

  while wait() do

    pcall(function()

      if _G.CDK_YM then

        if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then

          if not workspace.Map:FindFirstChild("HellDimension") or (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000 then

            local v = GetConnectionEnemies("Soul Reaper")

            if v then repeat task.wait()_tp(v.HumanoidRootPart.CFrame) until v.Humanoid.Health <= 0 or not _G.CDK_YM or not v.Parent or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3 or (workspace.Map:FindFirstChild("HellDimension") and (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000)

            elseif plr.Backpack:FindFirstChild("Hallow Essence") or plr.Character:FindFirstChild("Hallow Essence") then

            repeat _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) task.wait() until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - Root.Position).Magnitude <= 8

            EquipWeapon("Hallow Essence")

            elseif replicated:FindFirstChild("Soul Reaper") and replicated:FindFirstChild("Soul Reaper").Humanoid.Health > 0 then

              _tp(replicated:FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame)

            else

              if replicated.Remotes.CommF_:InvokeServer("Bones","Check") < 50 and not workspace.Enemies:FindFirstChild("Soul Reaper") and not replicated:FindFirstChild("Soul Reaper") and not workspace.Map:FindFirstChild("HellDimension") then

                if workspace.Enemies:FindFirstChild("Reborn Skeleton") or workspace.Enemies:FindFirstChild("Living Zombie") or workspace.Enemies:FindFirstChild("Domenic Soul") or workspace.Enemies:FindFirstChild("Posessed Mummy") then

                  for i,v in pairs(workspace.Enemies:GetChildren()) do

                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then

                      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then

                        repeat task.wait() Attack.Kill(v,_G.CDK_YM)until not _G.CDK_YM or v.Humanoid.Health <= 0 or not v.Parent

                      end

                    end

                  end

                else

                  _tp(CFrame.new(-9515.2255859375, 164.0062255859375, 5785.38330078125))

                end

              else

                replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)

              end

            end

          end

        end

      end

    end)

  end

end)



local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Tushita CDK", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.CDK_TS = Value

end)

spawn(function()

  while wait() do

    pcall(function()

      if _G.CDK_TS then

        if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then

          wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")

          wait(.3) replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)

        else

          if replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == nil then

            replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")

          elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == false then

            if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -3 then

              QuestTushita_1 = true

              QuestTushita_2 = false

              QuestTushita_3 = false

              repeat wait() _tp(CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875)) until (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1

              if (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then

                wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")

                wait(.5) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))

              end

                wait(1) repeat wait() _tp(CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125)) until (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1

                if (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then

                wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")

                wait(.5) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))

                end

                  wait(1) repeat wait() _tp(CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625)) until (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1

                  if (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then

                    wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")

                    wait(.5) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))

                  end

                  wait(1)

                  elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -4 then

                    QuestTushita_1 = false

                    QuestTushita_2 = true

                    QuestTushita_3 = false

                    repeat wait()

                      _G.AutoRaidCastle = true

                    until not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 2 

                      _G.AutoRaidCastle = false         

                  elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -5 then

                    QuestTushita_1 = false

                    QuestTushita_2 = false

                    QuestTushita_3 = true

                    if workspace.Enemies:FindFirstChild("Cake Queen") then

                      for i,v in pairs(workspace.Enemies:GetChildren()) do

                        if v.Name == "Cake Queen" then

                          if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then

                            repeat wait()

                              Attack.Kill(v, _G.CDK_TS)

                            until not _G.CDK_TS or not v.Parent or v.Humanoid.Health <= 0 or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 3

                          end

                        end

                      end

                     elseif replicated:FindFirstChild("Cake Queen") and replicated:FindFirstChild("Cake Queen").Humanoid.Health > 0 then

                       _tp(replicated:FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(0,30,0))

                     else

                   if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000 then

                     for i,v in pairs(workspace.Map.HeavenlyDimension.Exit:GetChildren()) do

                       Ex = i

                     end

                     if Ex == 2 then

                       repeat wait()

                         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.HeavenlyDimension.Exit.CFrame

                       until not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 3

                    end

                   repeat wait()

                     repeat wait() 

                       _tp(CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625)) 

                       for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do

                         if v:IsA("ProximityPrompt") then fireproximityprompt(v) end

                       end

                     until (CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5

                     wait(2)

                    _G.DoneT1 = true

                  until not _G.CDK_TS or _G.DoneT1

                  repeat wait()

                    repeat wait()

                      _tp(CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875)) 

                       for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do

                         if v:IsA("ProximityPrompt") then fireproximityprompt(v) end

                       end

                    until (CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5

                    wait(2) _G.DoneT2 = true

                  until _G.DoneT2 or _G.CDK_TS == false

                  repeat wait()

                    repeat task.wait() 

                      _tp(CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375)) 

                      for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do

                        if v:IsA("ProximityPrompt") then fireproximityprompt(v) end

                      end

                    until (CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5

                    wait(2) _G.DoneT3 = true

                  until _G.DoneT3 or _G.CDK_TS == false

                  for i,v in pairs(workspace.Enemies:GetChildren()) do

                    if (v:FindFirstChild("HumanoidRootPart").Position - CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.32185834e-08, 0.99301964, -8.73070718e-08, 1, -2.30819008e-08, -0.99301964, -8.3975138e-08, 0.11794927).Position).Magnitude <= 300 then

                      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then

                        repeat wait()

                          Attack.Kill(v, _G.CDK_TS)

                        until not _G.CDK_TS or v.Humanoid.Health <= 0 or not v.Parent                      

                      end

                    end

                  end

                end

              end

            end

          end

        end

      end

    end)

  end

end)


Tabs.Quests:AddSection("Dragon Talon V3")

local UpTalon = Tabs.Quests:AddToggle("UpTalon", {Title = "Upgrade Dragon Talon With Uzoth", Description = "", Default = false})

UpTalon:OnChanged(function(Value)

  _G.DT_Uzoth = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.DT_Uzoth then

      local Uz_POS = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838e-08, -0.584473014, 4.75227395e-08, 1, 4.25682458e-08, 0.584473014, -6.23161966e-08, 0.811413169)

      _tp(Uz_POS)

      if (Uz_POS.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 25 then

        local ohTable1 = {["NPC"] = "Uzoth",["Command"] = "Upgrade"}

        replicated.Modules.Net["RF/InteractDragonQuest"]:InvokeServer(ohTable1)

      end

    end

  end

end)

Tabs.Quests:AddSection("True Triple Katana Sword")

Tabs.Quests:AddButton({Title = "Buy Legendary Sword", Description = "",

Callback = function()

  replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")

  replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")

  replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer","3")

end})

Tabs.Quests:AddButton({Title = "Buy True Triple Katana Sword", Description = "",

Callback = function()

  replicated.Remotes.CommF_:InvokeServer("MysteriousMan","2")

end})

local Q = Tabs.Quests:AddToggle("Q", {Title = "Tween to Legendary Sword Dealer", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Tp_LgS = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.Tp_LgS then

	  pcall(function()

	    for _,v in pairs(replicated.NPCs:GetChildren()) do

	      if v.Name == "Legendary Sword Dealer " then _tp(v.HumanoidRootPart.CFrame) end

        end   	   

	  end)

    end

  end

end)



Tabs.Quests:AddSection("Pole / God Enal's")

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Pole V1", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoPole = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.AutoPole then

      pcall(function()

        local v = GetConnectionEnemies("Thunder God")

	    if v then

          repeat task.wait() Attack.Kill(v, _G.AutoPole) until not _G.AutoPole or not v.Parent or v.Humanoid.Health <= 0

        else

          _tp(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))

        end

      end)

    end

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Pole V2 [Patched]", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoPoleV2 = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.AutoPoleV2 then        

	   if not GetBP("Pole (1st Form)") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Pole (1st Form)") end

	   if not GetBP("Pole (2nd Form)") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Pole (2nd Form)") end      

	   if GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value <= 179 then _G.Level = true elseif GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value >= 180 then _G.Level = false end	   

	   if not GetBP("Rumble Fruit") then return end

	   if GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("Z") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("X") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("C") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("V") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("F") then

	     _G.SelectChip = nil

		 _G.Raiding = false

		 _G.Auto_Awakener = false

		if plr.Data.Fragments.Value >= 5000 then

          replicated.Remotes.CommF_:InvokeServer("Thunder God", "Talk") wait(Sec)

          replicated.Remotes.CommF_:InvokeServer("Thunder God", "Sure")

        end

        elseif replicated.Remotes.CommF_:InvokeServer("Awakener","Check") == nil or replicated.Remotes.CommF_:InvokeServer("Awakener","Check") == 0 then

          _G.SelectChip = "Rumble"

          local Buying = replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)

          if Buying then Buying:Stop() end

          _G.Raiding = true

          _G.Auto_Awakener = true

	    end	   

      end

    end)

  end

end)



Tabs.Quests:AddSection("Items Law/Order Sword")

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Law Sword", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoLawKak = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.AutoLawKak then

      pcall(function()

        local v = GetConnectionEnemies("Order")

        if v then repeat task.wait() Attack.Kill(v, _G.AutoLawKak) until _G.AutoLawKak == false or not v.Parent or v.Humanoid.Health <= 0

        else _tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))

        end

      end)

    end

  end

end)

Tabs.Quests:AddButton({Title = "Buy Microchip Law", Description = "",

Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")

end})

Tabs.Quests:AddButton({Title = "Start Law Raids", Description = "",

Callback = function()

  fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)

end})



Tabs.Quests:AddSection("East Blue Misc")

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Saw Sword", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoSaw = Value

end)

spawn(function()

  while wait(.2) do

    pcall(function()

      if _G.AutoSaw then

        local v = GetConnectionEnemies("The Saw")

        if v then repeat task.wait() Attack.Kill(v, _G.AutoSaw)until _G.AutoSaw == false or v.Humanoid.Health <= 0

        else _tp(CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906))

        end

      end

    end)

  end

end)

Tabs.Quests:AddSection("World 1")

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Get Saber", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoSaber = Value

end)

spawn(function()

  while wait(.2) do

    pcall(function()

      if _G.AutoSaber and plr.Data.Level.Value >= 200 and not plr.Backpack:FindFirstChild("Saber") and not plr.Character:FindFirstChild("Saber") then

        if workspace.Map.Jungle.Final.Part.Transparency == 0 then

	      if workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then

		    if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 100 then

		      _tp(plr.Character.HumanoidRootPart.CFrame)

		      wait(0.5)

		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame

		      wait(0.5)

		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame

		      wait(0.5)

		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame

	    	  wait(0.5)

		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame

		      wait(0.5)

		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame

		      wait(0.5) 

		    else

		      _tp(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))

		    end

	      else

		    if workspace.Map.Desert.Burn.Part.Transparency == 0 then

		      if plr.Backpack:FindFirstChild("Torch") or plr.Character:FindFirstChild("Torch") then

		        EquipWeapon("Torch")

		        firetouchinterest(plr.Character.Torch.Handle,workspace.Map.Desert.Burn.Fire,0)

			    firetouchinterest(plr.Character.Torch.Handle,workspace.Map.Desert.Burn.Fire,1)

		   	    _tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))

		      else

		        _tp(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))                    end

		      else

		        if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then

		          replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")

			      wait(0.5)

			      EquipWeapon("Cup")

			      wait(0.5)

			      replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",plr.Character.Cup)

			      wait(Sec)

			      replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") 

		        else

		 	      if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then

			        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")

		          elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then

			        if workspace.Enemies:FindFirstChild("Mob Leader") or replicated:FindFirstChild("Mob Leader") then

			          _tp(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))

			         for i,v in pairs(workspace.Enemies:GetChildren()) do

				       if v.Name == "Mob Leader" and Attack.Alive(v) then

				       repeat task.wait() Attack.Kill(v, _G.AutoSaber)until v.Humanoid.Health <= 0 or _G.AutoSaber == false

				       end

				     end

			       end

			     elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then

			       replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")

				   EquipWeapon("Relic")

				  _tp(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))

				 end

			   end

			 end

		   end

		 else

	     if workspace.Enemies:FindFirstChild("Saber Expert") or replicated:FindFirstChild("Saber Expert") then

	       for _,v in pairs(workspace.Enemies:GetChildren()) do

		     if v.Name == "Saber Expert" and Attack.Alive(v) then

			   repeat task.wait() Attack.Kill(v, _G.AutoSaber) until v.Humanoid.Health <= 0 or _G.AutoSaber == false

		       if v.Humanoid.Health <= 0 then replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic") end		      

		      end

		    end

		  else

		    _tp(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-08, 0.513301849, -8.55007443e-08, 1, -2.77243419e-08, -0.513301849, -2.00944328e-08, 0.85820812))

	      end

	    end

      end

    end)

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Cybrog", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoColShad = Value

end)

spawn(function()

  while wait(.2) do

    if _G.AutoColShad then

      pcall(function()

        local v = GetConnectionEnemies("Cyborg")

	    if v then repeat task.wait()Attack.Kill(v, _G.AutoColShad)until _G.AutoColShad == false or not v.Parent or v.Humanoid.Health <= 0

        else _tp(CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813))

        end

      end)

    end

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Usoap's Hat", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoGetUsoap = Value

end)

spawn(function()

  while task.wait(Sec) do

    pcall(function()

      if _G.AutoGetUsoap then

	   for _, v in pairs(workspace.Characters:GetChildren()) do

          if v.Name ~= plr.Name then

            if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (Root.Position - v.HumanoidRootPart.Position).Magnitude <= 230 then

              repeat task.wait() EquipWeapon(_G.SelectWeapon) _tp(v.HumanoidRootPart.CFrame * CFrame.new(1, 1, 2)) until _G.AutoGetUsoap == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")

            end

          end

        end

      end

    end)

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Bisento V2", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Greybeard = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.Greybeard then

      pcall(function()

        if not GetWP("Bisento") then

          replicated.Remotes.CommF_:InvokeServer("BuyItem","Bisento")

        elseif GetWP("Bisento") then

          replicated.Remotes.CommF_:InvokeServer("LoadItem","Bisento")

          local v = GetConnectionEnemies("Greybeard")

          if v then repeat wait() Attack.Kill(v,_G.Greybeard)until _G.Greybeard == false or not v.Parent or v.Humanoid.Health <= 0

          else _tp(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))

          end

        end

      end)

    end

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Warden Sword", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.WardenBoss = Value

end)

spawn(function()

  while wait(.1) do

    if _G.WardenBoss then

      pcall(function()

        local v = GetConnectionEnemies("Chief Warden")

        if v then repeat wait() Attack.Kill(v,_G.WardenBoss) until _G.WardenBoss == false or not v.Parent or v.Humanoid.Health <= 0 

        else _tp(CFrame.new(5206.92578,0.997753382,814.976746,0.342041343,-0.00062915677,0.939684749,0.00191645394,0.999998152,-2.80422337e-05,-0.939682961,0.00181045406,0.342041939))

        end

      end)

    end

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Marine Coat", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.MarinesCoat = Value

end)

spawn(function()

  while wait(.1) do

    if _G.MarinesCoat then

      pcall(function()

        local v = GetConnectionEnemies("Vice Admiral")

        if v then repeat wait() Attack.Kill(v, _G.MarinesCoat) until _G.MarinesCoat == false or not v.Parent or v.Humanoid.Health <= 0

        else _tp(CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375))

        end

      end)

    end

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Swan Coat", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.SwanCoat = Value

end)

spawn(function()

  while wait(.1) do

    if _G.SwanCoat then

      pcall(function()

        local v = GetConnectionEnemies("Swan")

        if v then repeat wait()Attack.Kill(v, _G.SwanCoat)until _G.SwanCoat == false or not v.Parent or v.Humanoid.Health <= 0

        else _tp(CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812))

        end

      end)

    end

  end

end)


Tabs.Quests:AddSection("World 2")

local Q = Tabs.Quests:AddToggle("Q", {
    Title = "Auto Rengoku",
    Description = "",
    Default = false
})

Q:OnChanged(function(Value)
    _G.IceBossRen = Value
end)

spawn(function()
    while wait(.1) do
        pcall(function()
            if _G.IceBossRen then

                -- Chưa có Hidden Key thì đi farm Key
                if not plr.Backpack:FindFirstChild(RenMon[3]) and not plr.Character:FindFirstChild(RenMon[3]) then
                    local v = GetConnectionEnemies(RenMon)

                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, _G.IceBossRen)
                        until not _G.IceBossRen
                            or plr.Backpack:FindFirstChild(RenMon[3])
                            or not v.Parent
                            or v.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                    end

                -- Có Hidden Key thì đi mở Rengoku
                elseif plr.Backpack:FindFirstChild(RenMon[3]) or plr.Character:FindFirstChild(RenMon[3]) then
                    EquipWeapon(RenMon[3])
                    task.wait(.1)
                    _tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))

                -- Sau đó farm Awakened Ice Admiral
                else
                    local v = GetConnectionEnemies("Awakened Ice Admiral")

                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, _G.IceBossRen)
                        until not _G.IceBossRen
                            or not v.Parent
                            or v.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
                    end
                end

            end
        end)
    end
end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Midnight Blade", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoEcBoss = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.AutoEcBoss then

	    if GetM("Ectoplasm") >= 99 then

	      replicated.Remotes.CommF_:InvokeServer("Ectoplasm","Buy", 3)	   

	    elseif GetM("Ectoplasm") <= 99 then

	      local v = GetConnectionEnemies("Cursed Captain")

	      if v then repeat wait()Attack.Kill(v, _G.AutoEcBoss) until not _G.AutoEcBoss or not v.Parent or v.Humanoid.Health <= 0

	      else

	        replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)) wait(.5)

	        _tp(CFrame.new(916.928589, 181.092773, 33422))

	      end

	    end	

      end

    end)

  end

end)

Tabs.Quests:AddSection("Indra Boss")

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Rip Indra", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoRipIngay = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.AutoRipIngay then

        local v = GetConnectionEnemies("rip_indra")

	    if not GetWP("Dark Dagger") or not GetIn("Valkyrie") and v then

	      repeat wait() Attack.Kill(v,_G.AutoRipIngay)until not _G.AutoRipIngay or not v.Parent or v.Humanoid.Health <= 0

        else

          replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))

		  wait(.1)_tp(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))

	    end

      end

    end)

  end

end)


Tabs.Quests:AddSection("Pay")

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Random Bones", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_Random_Bone = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Auto_Random_Bone then    

  	    repeat task.wait() replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1) until not _G.Auto_Random_Bone

      end

    end)

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Try Luck Gravestone", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.TryLucky = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.TryLucky then

    local try_bones_luck = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)

      if (plr.Character.HumanoidRootPart.CFrame ~= try_bones_luck) then

        _tp(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))

	 elseif (plr.Character.HumanoidRootPart.CFrame == try_bones_luck) then

	   replicated.Remotes.CommF_:InvokeServer("gravestoneEvent",1)

      end

    end

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Pray Gravestone", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Praying = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.Praying then

    local try_bones_luck = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)

      if (plr.Character.HumanoidRootPart.CFrame ~= try_bones_luck) then

	   _tp(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))

      elseif (plr.Character.HumanoidRootPart.CFrame == try_bones_luck) then

	   replicated.Remotes.CommF_:InvokeServer("gravestoneEvent",2)

      end

    end

  end

end)


Tabs.Quests:AddSection("Sword")

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Black Spikey", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.BlackSpikey = Value

end)

spawn(function()

  while wait(.1) do

    if _G.BlackSpikey then

      pcall(function()

        local v = GetConnectionEnemies("Jeremy")

        if v then repeat wait() Attack.Kill(v, _G.BlackSpikey)until _G.BlackSpikey == false or not v.Parent or v.Humanoid.Health <= 0

        else _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))

        end

      end)

    end

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Dark Blade V3", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.DarkBladev3 = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.DarkBladev3 and World2 then

      if not GetBP("Dark Blade") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Dark Blade") end

        if GetBP("Fist of Darkness") > 1 then

          if not workspace.Enemies:FindFirstChild("Darkbeard") then

            _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))

          elseif GetConnectionEnemies("Darkbeard") and GetBP("Fist of Darkness") >= 1 then

            repeat wait() _tp(CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375)) until not _G.DarkBladev3 or (Root.Position == CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375).Position)

            fireclickdetector(workspace.Map.GraveIsland.Mountain.Rocks.Button.ClickDetector)

          end         

        else

          _G.AutoFarmChest = true;

        end        

      end

    end)

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Unlocked DonSwan", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_DonAcces = Value

end)

spawn(function()

  while wait(.1) do

    if _G.Auto_DonAcces then

      pcall(function()

        if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil and plr.Data.Level.Value >= 1500 then

          FruitPrice = {}

	      FruitStore = {}

		  for i,v in next,replicated:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do

		    if v.Price >= 1000000 then  

		     table.insert(FruitPrice,v.Name)

		    end

		  end

		  for i,v in pairs(replicated.Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do

		    for _,x in pairs(v) do

		      if _ == "Name" then 

		        table.insert(FruitStore,x)

		      end

	        end

	          replicated.Remotes.CommF_:InvokeServer("Cousin","Buy")

	          for _,y in pairs(FruitPrice) do

		        for _,z in pairs(FruitStore) do

		          if y == z and replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then

		            _G.StoreF = false

			      if not plr.Backpack:FindFirstChild(FruitStore) then

			        replicated.Remotes.CommF_:InvokeServer("LoadFruit",tostring(y))

			      else

			        replicated.Remotes.CommF_:InvokeServer("TalkTrevor","1")

			        replicated.Remotes.CommF_:InvokeServer("TalkTrevor","2")

			        replicated.Remotes.CommF_:InvokeServer("TalkTrevor","3")

			      end

			    end

		      end 

		    end

		    if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then

		      _G.StoreF = true

		      _G.Auto_DonAcces = false

		    end

	      end

        end

      end)

    end

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Swan Glasses", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_SwanGG = Value

end)

spawn(function()

  while wait(.2) do

    if _G.Auto_SwanGG then

      pcall(function()

        local v = GetConnectionEnemies("Don Swan")

        if v then repeat wait() Attack.Kill(v,_G.Auto_SwanGG)until _G.Auto_SwanGG == false or not v.Parent or v.Humanoid.Health <= 0

	    else _tp(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))

        end

      end)

    end

  end

end)



Tabs.Quests:AddSection("Cavender + Twin Hooks + Bigmom")

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Bigmom", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoBigmom = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.AutoBigmom then

      pcall(function()

        local bx = GetConnectionEnemies("Cake Queen")

        if bx then repeat task.wait() Attack.Kill(bx, _G.AutoBigmom) until not _G.AutoBigmom or not bx.Parent or bx.Humanoid.Health <= 0

        else _tp(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))

        end

      end)

    end

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Canvendish Sword", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_Cavender = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Auto_Cavender then

        local v = GetConnectionEnemies("Beautiful Pirate")

	    if v then repeat wait() Attack.Kill(v,_G.Auto_Cavender)until not _G.Auto_Cavender or v.Humanoid.Health <= 0

	    else _tp(CFrame.new(5283.609375,22.56223487854,-110.78285217285))

	    end

      end

    end)

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Twin Hooks", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.TwinHook = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.TwinHook then

        local v = GetConnectionEnemies("Captain Elephant")

	    if v then repeat wait()Attack.Kill(v,_G.TwinHook)until not _G.TwinHook or v.Humanoid.Health <= 0

	    else

          replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)) wait(.2)

          _tp(CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125))

	    end

      end

    end)

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Serpent Bow", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoSerpentBow = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.AutoSerpentBow then

      local v = GetConnectionEnemies("Hydra Leader")

      if v then	repeat wait() Attack.Kill(v,_G.AutoSerpentBow)until not _G.AutoSerpentBow or not v.Parent or v.Humanoid.Health <= 0

	  else _tp(CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547))

      end

    end

  end

end)

local Q = Tabs.Quests:AddToggle("Q", {Title = "Auto Lei Accessory", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoKilo = Value

end)

spawn(function()

  while wait(.2) do

    if _G.AutoKilo then

      pcall(function()

        local v = GetConnectionEnemies("Kilo Admiral")

        if v then repeat task.wait()Attack.Kill(v,_G.AutoKilo)until not _G.AutoKilo or not v.Parent or v.Humanoid.Health <= 0

        else _tp(CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125))

        end

      end)

    end

  end

end)


Tabs.Mirage:AddSection("Drago Trial")

GetQuestDracoLevel = function()

  local v371 = {[1] = {NPC = "Dragon Wizard",Command = "Upgrade"}};

  return replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371))

end

Toggle = Tabs.Mirage:AddToggle("Toggle", {Title = "Tween To Upgrade Droco Trial", Description = "", Default = false})

Toggle:OnChanged(function(Value)

  _G.UPGDrago = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.UPGDrago then     

        if GetQuestDracoLevel() == false then

          return nil

        elseif GetQuestDracoLevel() == true then

          if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then

            _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));

          else

            _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));

            local v371 = {[1] = {NPC = "Dragon Wizard",Command = "Upgrade"}};

            replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371));

          end

        end

      end

    end)

  end

end)

Toggle = Tabs.Mirage:AddToggle("Toggle", {Title = "Auto Drago (V1)", Description = "turn on for auto quest1 auto prehistoric event + collect dragon eggs", Default = false})

Toggle:OnChanged(function(Value)

  _G.DragoV1 = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.DragoV1 then     

        if GetM("Dragon Egg") <= 0 then

        repeat wait()

          _G.Prehis_Find = true

          _G.Prehis_Skills = true

          _G.Prehis_DE = true

        until not _G.DragoV1 or GetM("Dragon Egg") >= 1

          _G.Prehis_Find = false

          _G.Prehis_Skills = false

          _G.Prehis_DE = false

        end

      end

    end)

  end

end)

local fireflower = Tabs.Mirage:AddToggle("fireflower", {Title = "Auto Drago (V2)", Description = "turn on for auto kill Forest Pirate & Collect fireflower", Default = false})

fireflower:OnChanged(function(Value)

  _G.AutoFireFlowers = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.AutoFireFlowers then

      local FireFlower = workspace:FindFirstChild("FireFlowers")

      local v = GetConnectionEnemies("Forest Pirate")

      if v then repeat wait() Attack.Kill(v,_G.AutoFireFlowers) until not _G.AutoFireFlowers or not v.Parent or v.Humanoid.Health <= 0 or FireFlower

      else _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))

      end      

      if FireFlower then

        for i, v in pairs(FireFlower:GetChildren()) do

          if (v:IsA("Model") and v.PrimaryPart) then

            local FlowerPos = v.PrimaryPart.Position;

            local playerRoot = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;

            local Magnited = (FlowerPos - playerRoot).Magnitude;

            if (Magnited <= 100) then

              vim1:SendKeyEvent(true, "E", false, game) wait(1.5) vim1:SendKeyEvent(false, "E", false, game)

            else

              _tp(CFrame.new(FlowerPos));

            end

          end

        end

      end

    end

  end

end)

Toggle = Tabs.Mirage:AddToggle("Toggle", {Title = "Auto Drago (V3)", Description = "turn on for sea event kill terror shark", Default = false})

Toggle:OnChanged(function(Value)

  _G.DragoV3 = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.DragoV3 then     

        repeat wait()

          _G.DangerSc = "Lv Infinite"

          _G.SailBoats = true

          _G.TerrorShark = true

        until not _G.DragoV3

        _G.DangerSc = "Lv 1"

        _G.SailBoats = false

        _G.TerrorShark = false

      end

    end)

  end

end)

Toggle = Tabs.Mirage:AddToggle("Toggle", {Title = "Auto Relic Drago Trial", Description = "turn on for auto trial v4 you have to COLLECT RELIC by your self", Default = false})

Toggle:OnChanged(function(Value)

  _G.Relic123 = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.Relic123 then

      pcall(function()

        if workspace.Map:FindFirstChild("DracoTrial") then

          replicated.Remotes.DracoTrial:InvokeServer()                  

          wait(.5)

          repeat wait() _tp(CFrame.new(-39934.9765625, 10685.359375, 22999.34375)) until not _G.Relic123 or (Root.Position == CFrame.new(-39934.9765625, 10685.359375, 22999.34375).Position)

          repeat wait() _tp(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625)) until not _G.Relic123 or (Root.Position == CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625).Position)

          wait(2.5)

          repeat wait() _tp(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375)) until not _G.Relic123 or (Root.Position == CFrame.new(-39914.65625, 10685.384765625, 23000.177734375).Position)

          repeat wait() _tp(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375)) until not _G.Relic123 or (Root.Position == CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375).Position)

          wait(2.5)

          repeat wait() _tp(CFrame.new(-39908.5, 10685.4052734375, 22990.04296875)) until not _G.Relic123 or (Root.Position == CFrame.new(-39908.5, 10685.4052734375, 22990.04296875).Position)

          repeat wait() _tp(CFrame.new(-39609.5, 9376.400390625, 23472.94335975)) until not _G.Relic123 or (Root.Position == CFrame.new(-39609.5, 9376.400390625, 23472.94335975).Position) 

        else

          local drago = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")

          if drago and drago:IsA("Part") then _tp(CFrame.new(drago.Position)) end        

        end

      end)

    end

  end

end)

Toggle = Tabs.Mirage:AddToggle("Toggle", {Title = "Auto Train Drago v4", Description = "turn on for training Drago race v4 + auto upgrade tier", Default = false})

Toggle:OnChanged(function(Value)

  _G.TrainDrago = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.TrainDrago then

        local DragoM = {"Venomous Assailant","Hydra Enforcer"}

	    for i=1,#DragoM do

          if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then

            vim1:SendKeyEvent(true, "Y", false, game)

            replicated.Remotes.CommF_:InvokeServer("UpgradeRace","Buy",2)

            _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))

	      elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then

	        local v = GetConnectionEnemies(DragoM)

	        if v then repeat wait() Attack.Kill(v, _G.TrainDrago) until _G.TrainDrago == false or v.Humanoid.Health <= 0 or not v.Parent                    		

		    else _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))

		    end

	      end

        end

      end

    end)

  end

end)

local dragoTpVolcano = Tabs.Mirage:AddToggle("dragoTpVolcano", {Title = "Tween to Drago Trials", Description = "", Default = false})

dragoTpVolcano:OnChanged(function(Value)

  _G.TpDrago_Prehis = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.TpDrago_Prehis then

      local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport");

      if (v748 and v748:IsA("Part")) then _tp(CFrame.new(v748.Position)) end

    end

  end

end)

local bdrago = Tabs.Mirage:AddToggle("bdrago", {Title = "Swap Drago Race", Description = "", Default = false})

bdrago:OnChanged(function(Value)

  _G.BuyDrago = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.BuyDrago then

      pcall(function()

        if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then

          _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));

        else

          _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));

          local v371 = {[1] = {NPC = "Dragon Wizard",Command = "DragonRace"}};

          replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371));

        end

      end)

    end

  end

end)

Tabs.Mirage:AddSection("Mystic Island")

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Find Mirage Island", Description = "turn on for finding & tween mirage island", Default = false})

Q:OnChanged(function(Value)

  _G.FindMirage = Value

end)

spawn(function()

  while wait() do

    if _G.FindMirage then 

      pcall(function()

        if not workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island", true) then                

          local myBoat = CheckBoat()

          if not myBoat then

            local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)

            TeleportToTarget(buyBoatCFrame)

            if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end

          else

            if plr.Character.Humanoid.Sit == false then

              local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)

              _tp(boatSeatCFrame)

            else            

              repeat wait()

                local targetDestination = CFrame.new(-10000000, 31, 37016.25)

                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then

                  _tp(CFrame.new(-10000000, 150, 37016.25))

                else

                  _tp(CFrame.new(-10000000, 31, 37016.25))

                end

              until not _G.FindMirage or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island") or plr.Character.Humanoid.Sit == false plr.Character.Humanoid.Sit = false

            end

          end

        else

          _tp(workspace.Map.MysticIsland.Center.CFrame*CFrame.new(0,300,0))

        end

      end)

    end

  end

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Tween To Highest Point", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.HighestMirage = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.HighestMirage then 

      pcall(function()

      if workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island",true) then _tp(workspace.Map.MysticIsland.Center.CFrame*CFrame.new(0,400,0))end

      end)

    end

  end

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Collect Gear", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.TPGEAR = Value

end)

spawn(function()

  pcall(function()

    while wait(0.1) do

      if _G.TPGEAR then

        for i,v in pairs(workspace.Map:FindFirstChild('MysticIsland'):GetChildren()) do

          if v.Name == "Part" then

            if v.ClassName == "MeshPart" then _tp(v.CFrame) end

          end

        end

      end

    end

  end)

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Change Transparency can see", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.can = Value

end)

spawn(function()

  pcall(function()

    while wait(Sec) do

      if _G.can then

        for i,v in pairs(workspace.Map:FindFirstChild('MysticIsland'):GetChildren()) do

          if v.Name == "Part" then

            if v.ClassName == "MeshPart" then

              v.Transparency = 0

            else 

              v.Transparency = 1

            end

          end

        end

      end

    end

  end)

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Tween Advanced Fruit Dealer", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Addealer = Value

end)

spawn(function()

  while wait() do

    if _G.Addealer then

	  pcall(function()

	    for _,v in pairs(replicated.NPCs:GetChildren()) do

	    if v.Name == "Advanced Fruit Dealer" then _tp(v.HumanoidRootPart.CFrame) end

        end   	   

	 end)

    end

  end

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Collect Mirage Chest", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.FarmChestM = Value

end)

spawn(function()

  while wait(.2) do

    if _G.FarmChestM then

      pcall(function()

        if workspace.Map.MysticIsland.Chests:FindFirstChild("DiamondChest") or workspace.Map.MysticIsland.Chests:FindFirstChild("FragChest") then

          local CollectionService = game:GetService("CollectionService")

          local Players = game:GetService("Players")

          local Player = Players.LocalPlayer

          local Character = Player.Character or Player.CharacterAdded:Wait()                

          if not Character then return end                

          local Position = Character:GetPivot().Position

          local Chests = CollectionService:GetTagged("_ChestTagged")      

          local Distance, Nearest = math.huge, nil  

          for i = 1, #Chests do

            local Chest = Chests[i]

            local Magnitude = (Chest:GetPivot().Position - Position).Magnitude        

            if not SelectedIsland or Chest:IsDescendantOf(SelectedIsland) then

              if not Chest:GetAttribute("IsDisabled") and Magnitude < Distance then

                Distance = Magnitude

                Nearest = Chest

              end

            end

          end

        if Nearest then _tp(Nearest:GetPivot()) end

        end

      end)

    end

  end

end)



Tabs.Mirage:AddSection("Skull Guitars / Misc")

local CheckSoul = Tabs.Mirage:AddParagraph({Title = " Skull Guitar Quests ",Content = ""})

spawn(function()

  while wait(.2) do

    pcall(function()

      if Quest1 == true then CheckSoul:SetDesc(" Quest Number : Quest1")

	  elseif Quest2 == true then CheckSoul:SetDesc(" Quest Number : Quest2")

	  elseif Quest3 == true then CheckSoul:SetDesc(" Quest Number : Quest3")

	  elseif Quest4 == true then CheckSoul:SetDesc(" Quest Number : Quest4")

	  elseif GetWP("Skull Guitar") then CheckSoul:SetDesc(" Quest Number : Collect!!")

	  else CheckSoul:SetDesc(" Quest Number : No Quest!!")

      end

    end)

  end

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Skull Guitar", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_Soul_Guitar = Value

end)

task.spawn(function()

  while wait() do

    if _G.Auto_Soul_Guitar then 

      pcall(function() 

        local v = GetConnectionEnemies("Living Zombie")

        if v then 

          v.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)

          v.Head.CanCollide = false

          v.Humanoid.Sit = false

          v.HumanoidRootPart.CanCollide = false

          v.Humanoid.JumpPower = 0

          v.Humanoid.WalkSpeed = 0

          if v.Humanoid:FindFirstChild('Animator') then v.Humanoid:FindFirstChild('Animator'):Destroy() end

        end    

      end)

    end

  end

end)

function getT(num)

    local rotation

    if num == 1 then

        rotation = workspace.Map["Haunted Castle"].Tablet.Segment1.Line.Rotation

    elseif num == 3 then

        rotation = workspace.Map["Haunted Castle"].Tablet.Segment3.Line.Rotation

    elseif num == 4 then

        rotation = workspace.Map["Haunted Castle"].Tablet.Segment4.Line.Rotation

    elseif num == 7 then

        rotation = workspace.Map["Haunted Castle"].Tablet.Segment7.Line.Rotation

    elseif num == 10 then

        rotation = workspace.Map["Haunted Castle"].Tablet.Segment10.Line.Rotation

    end

    if rotation then

        return rotation.Z

    end

end

function getRT(num)

    local Trophy_Q = workspace.Map["Haunted Castle"].Trophies.Quest

    local Trophy_Pos

    for _, v in pairs(Trophy_Q:GetChildren()) do

        if num == 1 and v.Name == "Trophy1" and v:FindFirstChild("Handle") then

            Trophy_Pos = v.Handle.Rotation

        elseif num == 2 and v.Name == "Trophy2" and v:FindFirstChild("Handle") then

            Trophy_Pos = v.Handle.Rotation         

        elseif num == 3 and v.Name == "Trophy3" and v:FindFirstChild("Handle") then

            Trophy_Pos = v.Handle.Rotation       

        elseif num == 4 and v.Name == "Trophy4" and v:FindFirstChild("Handle") then

            Trophy_Pos = v.Handle.Rotation  

        elseif num == 5 and v.Name == "Trophy5" and v:FindFirstChild("Handle") then

            Trophy_Pos = v.Handle.Rotation     

        end          

        if Trophy_Pos then

            return Trophy_Pos.Z   

        end

    end

end

GetFirePlacard = function(Number,Side)

  if tostring(workspace.Map["Haunted Castle"]["Placard"..Number][Side].Indicator.BrickColor) ~= "Pearl" then

    fireclickdetector(workspace.Map["Haunted Castle"]["Placard"..Number][Side].ClickDetector)

  end

end

spawn(function()

  repeat task.wait() until _G.Auto_Soul_Guitar

  while wait(Sec) do

    pcall(function()

      if _G.Auto_Soul_Guitar then

        if World3 then

          replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)

          replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)

          if replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check") == nil then

            _tp(CFrame.new(-8655.0166015625, 141.3166961669922, 6160.0224609375))

            replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)

            replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)

           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Swamp == false then

             Quest1 = true;

             Quest2 = false;

             Quest3 = false;

             Quest4 = false;

             local v = GetConnectionEnemies("Living Zombie")

             if v then repeat task.wait() Attack.Kill(v,_G.Auto_Soul_Guitar) until not _G.Auto_Soul_Guitar or v.Humanoid.Health <= 0 or not v.Parent or workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0)

             else _tp(CFrame.new(-10170.7275390625, 138.6524658203125, 5934.26513671875))

             end

           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Gravestones == false then

             Quest1 = false;

             Quest2 = true;

             Quest3 = false;

             Quest4 = false;

             GetFirePlacard("7","Left")

             GetFirePlacard("6","Left")

             GetFirePlacard("5","Left")

             GetFirePlacard("4","Right")

             GetFirePlacard("3","Left")

             GetFirePlacard("2","Right")

             GetFirePlacard("1","Right")

           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Ghost == false then

             replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")

             replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)

           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Trophies == false then

             Quest1 = false;

             Quest2 = false;

             Quest3 = true;

             Quest4 = false;             

             _tp(CFrame.new(-9532.8232421875, 6.471667766571045, 6078.068359375))

             repeat wait()

               local z1 = getRT(1)

               local _z1 = getT(1)

               if z1 and _z1 then

                 fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))

               end

             until z1 == _z1

            repeat wait()

              local z2 = getRT(2)

              local _z2 = getT(3)

              if z2 and _z2 then

                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))

              end

            until z2 == _z2

          repeat wait()

            local z3 = getRT(3)

            local _z3 = getT(4)

            if z3 and _z3 then

              fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))

            end

          until z3 == _z3

          repeat wait()

            local z4 = getRT(4)

            local _z4 = getT(7)

            if z4 and _z4 then

              fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))

            end

          until z4 == _z4

        repeat wait()

          local z5 = getRT(5)

          local _z5 = getT(10)

          if z5 and _z5 then

            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))    

          end

        until z5 == _z5

        repeat wait()    

          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))

          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))

          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))

          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))

          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))       

        until workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0

          elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Pipes == false then

            Quest1 = false;

            Quest2 = false;

            Quest3 = false;

            Quest4 = true;

           _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)

		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)

		   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)

		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)

		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)

		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)

		   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)

		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)

		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)

		   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)

		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)

	   	   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)

		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)

	       fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)

	       fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)

          end

        end

      end

    end)

  end

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Farm Material Skull Guitar", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoMatSoul = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.AutoMatSoul and GetWP("Skull Guitar") == false then

	    if GetM("Bones") >= 500 and GetM("Ectoplasm") >= 250 and GetM("Dark Fragment") >= 1 then

	      replicated.Remotes.CommF_:InvokeServer("soulGuitarBuy",true)

		else

		  if GetM("Ectoplasm") <= 250 then

		    if _G.AutoMatSoul and World2 then

		      local EctoTable = {"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior"}    

		      local xz = GetConnectionEnemies(EctoTable)

              if xz then repeat task.wait() Attack.Kill(xz, _G.AutoMatSoul)until not _G.AutoMatSoul or not xz.Parent or xz.Humanoid.Health <= 0

			  else replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))

			  end

		    else replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")

		    end

		  elseif GetM("Dark Fragment") < 1 then

		    if _G.AutoMatSoul and World2 then

		      local black = GetConnectionEnemies("Darkbeard")

		      if black then repeat task.wait()Attack.Kill(black, _G.AutoMatSoul)until _G.AutoMatSoul or black.Humanoid.Health <= 0

		      else _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))

		      end

		    else replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")

			end

		     if not GetConnectionEnemies("Darkbeard") then Hop() end

	         elseif GetM("Bones") <= 500 then

		       if _G.AutoMatSoul and World3 then

			     local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}

			     local zx = GetConnectionEnemies(BonesTable)			   

	             if zx then repeat task.wait()Attack.Kill(zx, _G.AutoMatSoul)until not _G.AutoMatSoul or zx.Humanoid.Health <= 0 or not zx.Parent or zx.Humanoid.Health <= 0

				 else _tp(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))

			   end

		     else

		       replicated.Remotes.CommF_:InvokeServer("TravelZou")

		     end

		   end

	     end

	   end

    end)

  end

end)

Tabs.Mirage:AddButton({Title = "Talk With Stone", Description = "",

Callback = function()

  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Begin")

  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Check")

  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Teleport")

  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Continue")

end})

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Look At Moon", Description = "", Default = false})

Q:OnChanged(function(Value)

  LookM = Value

end)

function MoveCamtoMoon()

workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,Lighting:GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)

plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position,Lighting:GetMoonDirection() + plr.Character.HumanoidRootPart.CFrame.Position)

end

task.spawn(function()

  while task.wait() do

    if LookM then

      MoveCamtoMoon()

      wait(.1)

      replicated.Remotes.CommE:FireServer("ActivateAbility")

    end

  end

end)



Tabs.Mirage:AddSection("Trials Quests / Misc V4")

local CheckTier = Tabs.Mirage:AddParagraph({Title = " Tiers V4 Status ",Content = ""})

spawn(function()

  pcall(function()

    while wait(.2) do

      CheckTier:SetDesc(" Tiers - V4  :" .." "..plr.Data.Race.C.Value)

    end

  end)

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Pull Lever", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Lver = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.Lver then

      pcall(function()

        for x,c in pairs(workspace.Map["Temple of Time"]:GetDescendants()) do

        if c.Name == "ProximityPrompt" then fireproximityprompt(c,math.huge)end

        end

      end)

    end

  end

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Train V4", Description = "turn on for farm tier + auto upgrade your tier level", Default = false})

Q:OnChanged(function(Value)

  _G.AcientOne = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.AcientOne then

        local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}

	    for i=1,#BonesTable do

          if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then

            vim1:SendKeyEvent(true, "Y", false, game)

            replicated.Remotes.CommF_:InvokeServer("UpgradeRace","Buy")

            _tp(CFrame.new(-8987.041015625, 215.862060546875, 5886.71044921875))

	      elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then

	        local v = GetConnectionEnemies(BonesTable)

	        if v then repeat wait() Attack.Kill(v, _G.AcientOne) until _G.AcientOne == false or v.Humanoid.Health <= 0 or not v.Parent

		    else _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 

		    end

	      end

        end

      end

    end)

  end

end)

getgenv().TempleOfTime = false

Tabs.Mirage:AddToggle("TempleOfTime", {
    Title = "Teleport to Temple of Time",
    Default = false
}):OnChanged(function(Value)
    getgenv().TempleOfTime = Value
end)

task.spawn(function()
    while task.wait(1) do
        if getgenv().TempleOfTime then
            local plr = game:GetService("Players").LocalPlayer
            local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

            if not workspace.Map:FindFirstChild("Temple of Time") then
                local stash = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")
                if stash and stash:FindFirstChild("Temple of Time") then
                    stash["Temple of Time"].Parent = workspace.Map
                end
            end

            if hrp then
                hrp.CFrame = CFrame.new(
                    28286.35546875,
                    14895.3017578125,
                    102.62469482421875
                )
            end
        end
    end
end)
Tabs.Mirage:AddButton({Title = "Teleport to Ancient tree", Description = "",

Callback = function()

  notween(CFrame.new(28603.7305, 14896.5352, 105.38382))

end})

Tabs.Mirage:AddButton({Title = "Teleport to Ancient Clock", Description = "",

Callback = function()

  getgenv().TeleportAcientClock = Value
        StopTween(getgenv().TeleportAcientClock)
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().TeleportAcientClock then
                topos(CFrame.new(29549, 15069, -88))
            end
        end)
    end
end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Teleport to Race Doors", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.TPDoor = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.TPDoor then

	    if tostring(plr.Data.Race.Value) == "Mink" then

          _tp(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))

	    elseif tostring(plr.Data.Race.Value) == "Fishman" then

          _tp(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))

	    elseif tostring(plr.Data.Race.Value) == "Cyborg" then

          _tp(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))

	    elseif tostring(plr.Data.Race.Value) == "Skypiea" then

          _tp(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))

	    elseif tostring(plr.Data.Race.Value) == "Ghoul" then

          _tp(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))

	    elseif tostring(plr.Data.Race.Value) == "Human" then

          _tp(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))

	    end

      end

    end)

  end

end)                   

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Complete Trial Race", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Complete_Trials = Value

end)

GetSeaBeastTrial = function()

  if not workspace.Map:FindFirstChild("FishmanTrial") then return nil end

  if workspace["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then FishmanTrial = workspace["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") end

  if FishmanTrial then

    for _,v in next, workspace.SeaBeasts:GetChildren() do

      if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 then

      if v.Health.Value > 0 then return v end

      end

    end

  end

end

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Complete_Trials then

        if tostring(plr.Data.Race.Value) == "Mink" then

          notween(workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0,-20,0))

	   end

      end

    end)

  end

end)

spawn(function()

  while wait(Sec) do

    pcall(function() 

      if _G.Complete_Trials then

	    if tostring(plr.Data.Race.Value) == "Fishman" then

	      if GetSeaBeastTrial() then            

            repeat task.wait()

              spawn(function()_tp(CFrame.new(GetSeaBeastTrial().HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 300,GetSeaBeastTrial().HumanoidRootPart.Position.Z))end)

		      MousePos = GetSeaBeastTrial().HumanoidRootPart.Position

              Useskills("Melee","Z")

	          Useskills("Melee","X")

	          Useskills("Melee","C")

              wait(.1)

              Useskills("Sword","Z")

              Useskills("Sword","X")

              wait(.1)

              Useskills("Blox Fruit","Z")

              Useskills("Blox Fruit","X")

              Useskills("Blox Fruit","C")

              wait(.1)

              Useskills("Gun","Z")

              Useskills("Gun","X")

            until _G.Complete_Trials == false or not GetSeaBeastTrial()

          end          

	    end

      end

    end)

  end

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Complete_Trials then

        if tostring(plr.Data.Race.Value) == "Cyborg" then

         _tp(workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0,500,0))

   	   end

      end

    end)

  end

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Complete_Trials then

        if tostring(plr.Data.Race.Value) == "Skypiea" then

          notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)

  	   end

      end

    end)

  end

end)

spawn(function()

  while wait(.1) do   

    pcall(function()

      if _G.Complete_Trials then

	    if tostring(plr.Data.Race.Value) == "Human" or tostring(plr.Data.Race.Value) == "Ghoul" then	      

	      local TrialsTables = {"Ancient Vampire","Ancient Zombie"}

	      local v = GetConnectionEnemies(TrialsTables)

          if v then repeat wait() Attack.Kill(v, _G.Complete_Trials)until _G.Complete_Trials == false or not v.Parent or v.Humanoid.Health <= 0 end		

        end

      end

    end)

  end

end)

local Q = Tabs.Mirage:AddToggle("Q", {Title = "Auto Kill Player After Trial", Description = "turn on for kill player after the race trials", Default = false})

Q:OnChanged(function(Value)

  _G.Defeating = Value

end)

spawn(function()

  while task.wait(Sec) do

    pcall(function()

      if _G.Defeating then

	    for _, v in pairs(workspace.Characters:GetChildren()) do

          if v.Name ~= plr.Name then

            if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (Root.Position - v.HumanoidRootPart.Position).Magnitude <= 250 then

              repeat task.wait() EquipWeapon(_G.SelectWeapon) _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,0,15)) sethiddenproperty(plr, "SimulationRadius", math.huge)until _G.Defeating == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")

            end

          end

        end

      end

    end)

  end

end)


Tabs.SeaEvent:AddSection("Prehistoric")

Toggle = Tabs.SeaEvent:AddToggle("Toggle", {Title = "Auto Craft Volcanic Magnet", Description = "turn on for auto farm material and craft volcanic magnet & stop when you have 1 volcanic magnet", Default = false})

Toggle:OnChanged(function(Value)

  _G.CraftVM = Value

end)

Tabs.SeaEvent:AddButton({Title = "Craft Volcanic Magnet", Description = "",

Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","Volcanic Magnet")

end})

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.CraftVM then     

        if GetM("Volcanic Magnet") < 1 then

          if GetM("Scrap Metal") >= 10 and GetM("Blaze Ember") >= 15 then

            replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","Volcanic Magnet")

          elseif GetM("Scrap Metal") < 10 then

            local v = GetConnectionEnemies("Forest Pirate")

            if v then repeat wait() Attack.Kill(v,_G.CraftVM) until not _G.CraftVM or not v.Parent or v.Humanoid.Health <= 0 or GetM("Scrap Metal") >= 10

            else _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))

            end     

          elseif GetM("Blaze Ember") < 15 then

            repeat wait() _G.FarmBlazeEM = true until not _G.CraftVM or GetM("Blaze Ember") >= 15 _G.FarmBlazeEM = false

          end   

        end            

      end

    end)

  end

end)


Tabs.SeaEvent:AddSection("Prehistoric")

local Check_Volcano = Tabs.SeaEvent:AddParagraph({Title = " Prehistoric Island Status ",Content = ""})

spawn(function()

  while wait(.2) do

    if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then

      Check_Volcano:SetDesc(" Prehistoric Island : True")

    else

      Check_Volcano:SetDesc(" Prehistoric Island : False")

    end

  end

end)

Vocan = Tabs.SeaEvent:AddToggle("Vocan", {Title = "Auto Find Prehistoric Island", Description = "turn on for finding & tween & start prehistoric island", Default = false})

Vocan:OnChanged(function(Value)

  _G.Prehis_Find = Value

end)

local targetDestination = nil

spawn(function()

  while wait() do

    if _G.Prehis_Find then 

      pcall(function()

        if not workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true) then                

          local myBoat = CheckBoat()

          if not myBoat then

            local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)

            TeleportToTarget(buyBoatCFrame)

            if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end

          else

            if plr.Character.Humanoid.Sit == false then

              local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)

              _tp(boatSeatCFrame)

            else                            

              repeat wait() 

                local targetDestination = CFrame.new(-10000000, 31, 37016.25)

                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then

                  _tp(CFrame.new(-10000000, 150, 37016.25))

                else

                  _tp(CFrame.new(-10000000, 31, 37016.25))

                end

              until not _G.Prehis_Find or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island") or plr.Character.Humanoid.Sit == false plr.Character.Humanoid.Sit = false

            end

          end

        else

          if (workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island").CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then _tp(workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island").CFrame)end

          if workspace.Map:FindFirstChild("PrehistoricIsland", true) or workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true) then            

            if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true) then

              if plr:DistanceFromCharacter(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame.Position) <= 150 then

                fireproximityprompt(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt, math.huge)

                vim1:SendKeyEvent(true, "E", false, game) wait(1.5) vim1:SendKeyEvent(false, "E", false, game)

              end

              _tp(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame)              

            end

          end

        end

      end)

    end

  end

end)

getgenv().DoneVolcanoLava = false

local Vocan = Tabs.SeaEvent:AddToggle("Vocan", {
    Title = "Auto Complete Prehistoric",
    Description = "turn on for auto patch volcano + kill aura lava golems + auto remove lava",
    Default = false
})

Vocan:OnChanged(function(Value)
    _G.Prehis_Skills = Value
    getgenv().AutoDefendVolcano = Value
end)

function CheckVolcanoLavaDone()
    local island = workspace.Map:FindFirstChild("PrehistoricIsland")

    if not island
    or not island:FindFirstChild("Core")
    or not island.Core:FindFirstChild("VolcanoRocks") then
        return false
    end

    for _,v in pairs(island.Core.VolcanoRocks:GetChildren()) do
        local glow = v:FindFirstChild("VFXLayer")
        and v.VFXLayer:FindFirstChild("At0")
        and v.VFXLayer.At0:FindFirstChild("Glow")

        if glow and glow.Enabled then
            return false
        end
    end

    return true
end


function UseSoulGuitarSkills()

    local backpack = game.Players.LocalPlayer.Backpack
    local char = game.Players.LocalPlayer.Character
    local tool = (char and char:FindFirstChild("Soul Guitar"))
    or backpack:FindFirstChild("Soul Guitar")

    if tool then

        local mastery = 0

        pcall(function()
            mastery = game.Players.LocalPlayer.Data.Mastery["Soul Guitar"].Level.Value
        end)

        if mastery >= 150 then

            char.Humanoid:EquipTool(tool)

            task.wait(.2)

            Useskills("Gun","Z")
            task.wait(.4)

            if mastery >= 300 then
                Useskills("Gun","X")
                task.wait(.4)
            end
        end
    end
end


function KillAuraGolem()

    if not _G.Prehis_Skills then
        return
    end

    local golem = GetConnectionEnemies("Lava Golem")

    if golem
    and golem:FindFirstChild("Humanoid")
    and golem.Humanoid.Health > 0 then

        repeat
            task.wait()

            pcall(function()

                sethiddenproperty(
                    game.Players.LocalPlayer,
                    "SimulationRadius",
                    math.huge
                )

                golem.Humanoid:ChangeState(15)

                Attack.Kill(golem,true)

            end)

        until not _G.Prehis_Skills
        or not golem.Parent
        or golem.Humanoid.Health <= 0

    end
end


spawn(function()
while task.wait() do

if _G.Prehis_Skills then

pcall(function()

local island = workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island",true)

if island then

local map = workspace.Map:FindFirstChild("PrehistoricIsland")

if map then

local prompt = map.Core:FindFirstChild("ActivationPrompt",true)

if prompt and prompt:FindFirstChild("ProximityPrompt") then

topos(prompt.CFrame)

if plr:DistanceFromCharacter(prompt.Position) <= 150 then

fireproximityprompt(prompt.ProximityPrompt,math.huge)

vim1:SendKeyEvent(true,"E",false,game)
task.wait(1.5)
vim1:SendKeyEvent(false,"E",false,game)

end

end
end

end

end)

end

end
end)



spawn(function()
while task.wait(1) do

if _G.Prehis_Skills then

pcall(function()

local island = workspace.Map:FindFirstChild("PrehistoricIsland")

if island then

for _,obj in pairs(island:GetDescendants()) do

if (obj:IsA("Part") or obj:IsA("MeshPart"))
and obj.Name:lower():find("lava") then

obj:Destroy()

end

end


local lava = island.Core:FindFirstChild("InteriorLava")

if lava then
lava:Destroy()
end


local trial = island:FindFirstChild("TrialTeleport",true)


for _,v in pairs(island:GetDescendants()) do

if v.Name == "TouchInterest" then

if not (trial and v:IsDescendantOf(trial)) then

pcall(function()
v.Parent:Destroy()
end)

end

end

end

end

end)

end

end

end)



spawn(function()

while task.wait() do

if _G.Prehis_Skills then

pcall(function()

local golem = GetConnectionEnemies("Lava Golem")

if golem
and golem:FindFirstChild("Humanoid")
and golem.Humanoid.Health > 0 then

KillAuraGolem()
return

end


local island = workspace.Map:FindFirstChild("PrehistoricIsland")

if island
and island.Core
and island.Core:FindFirstChild("VolcanoRocks") then


if not CheckVolcanoLavaDone() then


for _,v in pairs(island.Core.VolcanoRocks:GetChildren()) do


local glow = v:FindFirstChild("VFXLayer")
and v.VFXLayer:FindFirstChild("At0")
and v.VFXLayer.At0:FindFirstChild("Glow")


if glow and glow.Enabled then


repeat task.wait()


local golem2 = GetConnectionEnemies("Lava Golem")

if golem2
and golem2:FindFirstChild("Humanoid")
and golem2.Humanoid.Health > 0 then

KillAuraGolem()
break

end


topos(v.VFXLayer.CFrame)


if glow.Enabled
and plr:DistanceFromCharacter(v.VFXLayer.Position)<=150 then


MousePos = v.VFXLayer.Position


Useskills("Melee","Z")
task.wait(.4)

Useskills("Melee","X")
task.wait(.4)

Useskills("Melee","C")
task.wait(.4)


UseSoulGuitarSkills()


Useskills("Blox Fruit","Z")
task.wait(.4)

Useskills("Blox Fruit","X")
task.wait(.4)

Useskills("Blox Fruit","C")


end


until not _G.Prehis_Skills
or not glow.Enabled


end

end


else

KillAuraGolem()

end

end

end)

end

end

end)

local Vocan = Tabs.SeaEvent:AddToggle("Vocan", {Title = "Auto Collect Dino Bones", Description = "", Default = false})

Vocan:OnChanged(function(Value)

  _G.Prehis_DB = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Prehis_DB then

        if workspace:FindFirstChild("DinoBone") then

          for i,v in pairs(workspace:GetChildren()) do

            if v.Name == "DinoBone" then _tp(v.CFrame) end

          end

        end

      end

    end)

  end

end)

local Vocan = Tabs.SeaEvent:AddToggle("Vocan", {Title = "Auto Collect Dragon Eggs", Description = "", Default = false})

Vocan:OnChanged(function(Value)

  _G.Prehis_DE = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Prehis_DE then

      if workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg") then _tp(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg").Molten.CFrame) fireproximityprompt(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs.DragonEgg.Molten.ProximityPrompt, 30) end        

      end

    end)

  end

end)

Toggle = Tabs.SeaEvent:AddToggle("Toggle", {Title = "Auto Reset When Complete Volcano", Description = "Reset When Complete Volcano not collect dino bones and else..", Default = false})

Toggle:OnChanged(function(Value)

  _G.ResetPH = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.ResetPH then

        local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport");

        if (v748 and v748:FindFirstChild("TouchInterest")) then

          plr.Character.Humanoid.Health = 0 

        else

          if workspace:FindFirstChild("DinoBone") then

            for i,v in pairs(workspace:GetChildren()) do

              if v.Name == "DinoBone" then _tp(v.CFrame) end

            end

          end

        end

      end

    end)

  end

end)

Tabs.SeaEvent:AddSection("Sea Event / Setting Sail")

local ListSeaBoat={"Guardian","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade","PirateSloop","MarineSloop","Beast Hunter"}

local ListSeaZone={"Lv 1","Lv 2","Lv 3","Lv 4","Lv 5","Lv 6","Lv Infinite"}

local SPYING = Tabs.SeaEvent:AddParagraph({Title = " Spy Status ",Content = ""})

spawn(function()

  while wait(.2) do

    pcall(function()

      local spycheck = string.match(replicated.Remotes.CommF_:InvokeServer("InfoLeviathan","1"),"%d+")

      if spycheck then SPYING:SetDesc(" Spy Leviathan  : "..tostring(spycheck))

        if tostring(spycheck) == 5 then

          SPYING:SetDesc(" Spy Leviathan : Already Done!!")

        end

      end

    end)

  end

end)

Tabs.SeaEvent:AddButton({Title = "Buy Fracments with Spy", Description = "Buy the spy for finding leviathan",

Callback = function()

  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("InfoLeviathan","2")

end})

local FloD = Tabs.SeaEvent:AddParagraph({Title = " FlozenDimension Status ",Content = ""})

spawn(function()

  pcall(function()

    while wait(.2) do

      if workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then

        FloD:SetDesc(' Flozen Dimension : True')

      else

        FloD:SetDesc(' Flozen Dimension : False')

      end

    end

  end)

end)

local Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Teleport Frozen Dimension", Description = "turn on for teleport to frozen dimension and start the leviathan gate", Default = false})

Q:OnChanged(function(Value)

  _G.FrozenTP = Value

end)

spawn(function()

  while wait(.1) do

    if _G.FrozenTP then

      pcall(function()

      if workspace.Map:FindFirstChild("LeviathanGate") then _tp(workspace.Map.LeviathanGate.CFrame) replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("OpenLeviathanGate") end

      end)

    end

  end

end)

local Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Drive To Hydra Island", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.SailBoat_Hydra = Value

end)

spawn(function()

  while wait() do

    if _G.SailBoat_Hydra then 

      pcall(function()        

        local myBoat = CheckBoat()

        if not myBoat then

          local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)

          TeleportToTarget(buyBoatCFrame)

          if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end

        elseif myBoat then

          if plr.Character.Humanoid.Sit == false then

            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)

            _tp(boatSeatCFrame)

          else                         

            repeat wait() 

              if CheckEnemiesBoat() or CheckPirateGrandBrigade() or CheckTerrorShark() then

                _tp(CFrame.new(5433, 150, 290))

              else

                _tp(CFrame.new(5433, 35, 290))

              end           

            until _G.SailBoat_Hydra==false or plr.Character:WaitForChild("Humanoid").Sit==false
            plr.Character.Humanoid.Sit = false

          end

        end

      end)

    end

  end

end)

local Q = Tabs.SeaEvent:AddDropdown("Q",{Title = "Choose Boats", Searchable = true, Values = ListSeaBoat,Multi = false,Default = 1})

Q:OnChanged(function(Value)

  _G.SelectedBoat = Value

end)

Tabs.SeaEvent:AddButton({Title = "Buy Boats", Description = "Buy the select boats",

Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyBoat",_G.SelectedBoat)

end})

local Q = Tabs.SeaEvent:AddDropdown("Q",{Title = "Choose Sea Level", Searchable = true, Values = ListSeaZone,Multi = false,Default = 1})

Q:OnChanged(function(Value)

  _G.DangerSc = Value

end)

local Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Sail Boat", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.SailBoats = Value

end)

spawn(function()

  while wait() do

    if _G.SailBoats then 

      pcall(function()        

        local myBoat = CheckBoat()

        if not myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then

          local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)

          TeleportToTarget(buyBoatCFrame)

          if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end

        elseif myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then

          if plr.Character.Humanoid.Sit == false then

            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)

            _tp(boatSeatCFrame)

          else                         

            if _G.DangerSc == "Lv 1" then CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)

            elseif _G.DangerSc == "Lv 2" then CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)

            elseif _G.DangerSc == "Lv 3" then CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)

            elseif _G.DangerSc == "Lv 4" then CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)

            elseif _G.DangerSc == "Lv 5" then CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)

            elseif _G.DangerSc == "Lv 6" then CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)

            elseif _G.DangerSc == "Lv Infinite" then CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)

            end           

            repeat wait() 

              if (not _G.FishBoat and CheckEnemiesBoat()) or (not _G.PGB and CheckPirateGrandBrigade()) or (not _G.TerrorShark and CheckTerrorShark()) then

                _tp(CFrameSelectedZone * CFrame.new(0,150,0))

              else

                _tp(CFrameSelectedZone)

              end           

            until _G.SailBoats==false or(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)or CheckSeaBeast()and _G.SeaBeast1 or CheckEnemiesBoat()and _G.FishBoat or _G.Leviathan1 and CheckLeviathan() or _G.HCM and CheckHauntedCrew() or _G.PGB and CheckPirateGrandBrigade() or plr.Character:WaitForChild("Humanoid").Sit==false
            plr.Character.Humanoid.Sit = false

          end

        end

      end)

    end

  end

end)

spawn(function()while wait(Sec)do pcall(function()for a,b in pairs(workspace.Boats:GetChildren())do for c,d in pairs(workspace.Boats[b.Name]:GetDescendants())do if d:IsA("BasePart")then if _G.SailBoats or _G.Prehis_Find or _G.FindMirage or _G.SailBoat_Hydra or _G.AutofindKitIs then d.CanCollide=false else d.CanCollide=true end end end end end)end end)

Tabs.SeaEvent:AddSection("Entity Sea Event")

Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Shark", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Shark = Value

end)

Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Piranha", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Piranha = Value

end)

Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Terror Shark", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.TerrorShark = Value

end)

Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Fish Crew Member", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.MobCrew = Value

end)

Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Haunted Crew Member", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.HCM = Value

end)

Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Attack PirateGrandBrigade", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.PGB = Value

end)

Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Attack Fish Boat", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.FishBoat = Value

end)

Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Attack Sea Beast", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.SeaBeast1 = Value

end)

-- ══════════════════════════════════════════
--   LEVIATHAN ATTACK - Fixed + New Features
-- ══════════════════════════════════════════

-- Helper: detect if current fruit is a transform-type (Buddha, Kitsune, T-Rex, etc.)
-- These fruits use F to transform - we MUST NOT spam F/V on them
local TransformFruits = {
    ["Human-Human: Buddha Fruit"] = true,
    ["Human-Human: Buddha"] = true,
    ["Kitsune-Kitsune"] = true,
    ["T-Rex-T-Rex"] = true,
    ["Snake-Snake"] = true,
    ["Bird-Bird: Falcon"] = true,
    ["Dragon-Dragon"] = true, -- Dragon uses F for flight, not transform spam
    ["Gas-Gas"] = true,
    ["Yeti-Yeti"] = true,
}

IsTransformFruit = function()
    for fruitName, _ in pairs(TransformFruits) do
        if GetBP(fruitName) then return true, fruitName end
    end
    return false
end

-- Helper: spam all skills SAFELY (skip V/F for transform fruits)
SafeSpamSkills = function(targetPos)
    MousePos = targetPos
    local isTransform, fname = IsTransformFruit()

    -- Melee Z X C
    Useskills("Melee","Z") task.wait(0.05)
    Useskills("Melee","X") task.wait(0.05)
    Useskills("Melee","C") task.wait(0.05)

    -- Sword Z X
    Useskills("Sword","Z") task.wait(0.05)
    Useskills("Sword","X") task.wait(0.05)

    -- Blox Fruit Z X C — always safe
    weaponSc("Blox Fruit")
    Useskills("Blox Fruit","Z") task.wait(0.05)
    Useskills("Blox Fruit","X") task.wait(0.05)
    Useskills("Blox Fruit","C") task.wait(0.05)

    -- V skill: ONLY if NOT a transform fruit (V = transform on Buddha/Kitsune etc.)
    if not isTransform then
        Useskills("Blox Fruit","V") task.wait(0.05)
    end

    -- Gun Z X
    Useskills("Gun","Z") task.wait(0.05)
    Useskills("Gun","X") task.wait(0.05)
end

-- Helper: DragonStorm attack on a target position
-- Dragonstorm is a GUN (ToolTip = "Gun") — use weaponSc("Gun") like the rest of the script
DragonStormAttack = function(targetPos)
    local char = plr.Character
    if not char then return end
    -- Check Dragonstorm exists anywhere (backpack or equipped)
    local ds = plr.Backpack:FindFirstChild("Dragonstorm") or char:FindFirstChild("Dragonstorm")
    if not ds then return end
    MousePos = targetPos
    -- weaponSc("Gun") will equip the Gun with matching ToolTip (Dragonstorm = Gun ToolTip)
    -- If player has another gun equipped, temporarily switch to Dragonstorm specifically
    if plr.Backpack:FindFirstChild("Dragonstorm") then
        char.Humanoid:EquipTool(plr.Backpack:FindFirstChild("Dragonstorm"))
        task.wait(0.08)
    end
    -- Fire gun skills Z + X
    vim1:SendKeyEvent(true,  "Z", false, game)
    vim1:SendKeyEvent(false, "Z", false, game)
    task.wait(0.05)
    vim1:SendKeyEvent(true,  "X", false, game)
    vim1:SendKeyEvent(false, "X", false, game)
end

-- ── LEVIATHAN ATTACK MODE TOGGLE (default: Spam Skills) ──
_G.LeviathanMode = "spam" -- "spam" or "dragonstorm"

Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Attack Leviathan [Spam Skills]", Description = "Fly to Leviathan and spam all skills (safe - no transform spam)", Default = false})
Q:OnChanged(function(Value)
    if Value then
        _G.LeviathanMode = "spam"
        _G.LeviathanDS = false
    end
    _G.Leviathan1 = Value
end)

local QDS = Tabs.SeaEvent:AddToggle("QDS", {Title = "Auto Attack Leviathan [Dragon Storm]", Description = "Fly to Leviathan and attack with Dragonstorm gun (requires Dragonstorm)", Default = false})
QDS:OnChanged(function(Value)
    if Value then
        _G.LeviathanMode = "dragonstorm"
        _G.LeviathanDS = true
        _G.Leviathan1 = true
    else
        _G.LeviathanDS = false
        if _G.LeviathanMode == "dragonstorm" then
            _G.Leviathan1 = false
        end
    end
end)

spawn(function()

  while wait() do

    pcall(function()	

      if _G.Shark then local a={"Shark"}if CheckShark()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.Shark)until _G.Shark==false or not c.Parent or c.Humanoid.Health<=0 end end end end end

      if _G.TerrorShark then local a={"Terrorshark"}if CheckTerrorShark()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.KillSea(c,_G.TerrorShark)until _G.TerrorShark==false or not c.Parent or c.Humanoid.Health<=0 end end end end end

      if _G.Piranha then local a={"Piranha"}if CheckPiranha()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.Piranha)until _G.Piranha==false or not c.Parent or c.Humanoid.Health<=0 end end end end end

      if _G.MobCrew then local a={"Fish Crew Member"}if CheckFishCrew()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.MobCrew)until _G.MobCrew==false or not c.Parent or c.Humanoid.Health<=0 end end end end end                 

      if _G.HCM then local a={"Haunted Crew Member"}if CheckHauntedCrew()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.HCM)until _G.HCM==false or not c.Parent or c.Humanoid.Health<=0 end end end end end

      -- ── SEABEAST ATTACK (Fixed: transform-safe skills) ──
      if _G.SeaBeast1 then
          if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
              for a, b in pairs(workspace.SeaBeasts:GetChildren()) do
                  if b:FindFirstChild("HumanoidRootPart")
                      and b:FindFirstChild("Health")
                      and b.Health.Value > 0
                  then
                      local WaterBase = game:GetService("Workspace").Map["WaterBase-Plane"]
                      repeat
                          task.wait()
                          pcall(function()
                              if not b or not b.Parent then return end
                              local HRP = b:FindFirstChild("HumanoidRootPart")
                              if not HRP then return end
                              _tp(CFrame.new(HRP.Position.X, WaterBase.Position.Y + 200, HRP.Position.Z))
                              if plr:DistanceFromCharacter(HRP.Position) <= 500 then
                                  AitSeaSkill_Custom = HRP.CFrame
                                  SafeSpamSkills(HRP.Position) -- transform-safe
                              end
                          end)
                      until _G.SeaBeast1 == false
                          or not b:FindFirstChild("HumanoidRootPart")
                          or not b.Parent
                          or b.Health.Value <= 0
                  end
              end
          end
      end

      -- ── LEVIATHAN ATTACK (Fixed: transform-safe + DragonStorm mode) ──
      if _G.Leviathan1 then
          if workspace.SeaBeasts:FindFirstChild("Leviathan") then
              for a, b in pairs(workspace.SeaBeasts:GetChildren()) do
                  if b.Name == "Leviathan"
                      and b:FindFirstChild("HumanoidRootPart")
                      and b:FindFirstChild("Health")
                      and b.Health.Value > 0
                  then
                      local WaterBase = game:GetService("Workspace").Map["WaterBase-Plane"]
                      repeat
                          task.wait()
                          pcall(function()
                              if not b or not b.Parent then return end
                              local HRP = b:FindFirstChild("HumanoidRootPart")
                              if not HRP then return end

                              -- Fly above Leviathan
                              local flyHeight = WaterBase.Position.Y + 250
                              _tp(CFrame.new(HRP.Position.X, flyHeight, HRP.Position.Z))

                              if plr:DistanceFromCharacter(HRP.Position) <= 600 then
                                  -- Target segment if available for better accuracy
                                  local seg = b:FindFirstChild("Leviathan Segment")
                                  local targetPos = seg and seg.Position or HRP.Position
                                  MousePos = targetPos

                                  if _G.LeviathanMode == "dragonstorm" then
                                      -- Dragon Storm mode
                                      DragonStormAttack(targetPos)
                                  else
                                      -- Spam skills mode (transform-safe)
                                      SafeSpamSkills(targetPos)
                                  end
                              end
                          end)
                      until _G.Leviathan1 == false
                          or not b or not b.Parent
                          or not b:FindFirstChild("Health")
                          or b.Health.Value <= 0
                  end
              end
          end
      end

      if _G.FishBoat then if CheckEnemiesBoat()then for a,b in pairs(workspace.Enemies:GetChildren())do if b:FindFirstChild("Health")and b.Health.Value>0 and b:FindFirstChild("VehicleSeat")then repeat task.wait()spawn(function()if b.Name=="FishBoat"then _tp(b.Engine.CFrame*CFrame.new(0,-50,-25))end end)if plr:DistanceFromCharacter(b.Engine.CFrame.Position)<=150 then AitSeaSkill_Custom=b.Engine.CFrame;MousePos=AitSeaSkill_Custom.Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.FishBoat==false or not b:FindFirstChild("VehicleSeat")or b.Health.Value<=0 end end end end

      if _G.PGB then if CheckPirateGrandBrigade()then for a,b in pairs(workspace.Enemies:GetChildren())do if b:FindFirstChild("Health")and b.Health.Value>0 and b:FindFirstChild("VehicleSeat")then repeat task.wait()spawn(function()if b.Name=="PirateBrigade"then _tp(b.Engine.CFrame*CFrame.new(0,-30,-10))elseif b.Name=="PirateGrandBrigade"then _tp(b.Engine.CFrame*CFrame.new(0,-50,-50))end end)if plr:DistanceFromCharacter(b.Engine.CFrame.Position)<=150 then AitSeaSkill_Custom=b.Engine.CFrame;MousePos=AitSeaSkill_Custom.Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.PGB==false or not b:FindFirstChild("VehicleSeat")or b.Health.Value<=0 end end end end

    end)

  end

end)



Tabs.SeaEvent:AddSection("Kitsune Island / Event")

local Check_Kitsu = Tabs.SeaEvent:AddParagraph({Title = " Kitsune Island Status ",Content = ""})

spawn(function()

  while wait(.2) do

    if workspace.Map:FindFirstChild("KitsuneIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then

      Check_Kitsu:SetDesc(" Kitsune Island : True")

    else

      Check_Kitsu:SetDesc(" Kitsune Island : False")

    end

  end

end)

local Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Find Kitsune Island", Description = "turn on for finding & tween kitsune island", Default = false})

Q:OnChanged(function(Value)

  _G.AutofindKitIs = Value

end)

spawn(function()

  while wait() do

    if _G.AutofindKitIs then 

      pcall(function()

        if not workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island", true) then                

          local myBoat = CheckBoat()

          if not myBoat then

            local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)

            TeleportToTarget(buyBoatCFrame)

            if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end

          else

            if plr.Character.Humanoid.Sit == false then

              local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)

              _tp(boatSeatCFrame)

            else

              local targetDestination = CFrame.new(-10000000, 31, 37016.25)              

              repeat wait() 

                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then

                  _tp(CFrame.new(-10000000, 150, 37016.25))

                else

                  _tp(CFrame.new(-10000000, 31, 37016.25))

                end

              until not _G.AutofindKitIs or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island") or plr.Character.Humanoid.Sit == false plr.Character.Humanoid.Sit = false

            end

          end

        else

          _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame*CFrame.new(0,500,0))

        end

      end)

    end

  end

end)

local Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Teleport to Shrine Actived", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.tweenShrine = Value

end)

spawn(function()

  while wait(.1) do

    if _G.tweenShrine then

      pcall(function()

      local kit_is = workspace.Map:FindFirstChild("KitsuneIsland") or game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")

      local shrineActive = kit_is:FindFirstChild("ShrineActive")

        if shrineActive then

          for _, v in next, shrineActive:GetDescendants() do

            if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then

              replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()

              repeat wait() _tp(v.CFrame * CFrame.new(0,2,0)) until _G.tweenShrine == false or not kit_is

            end

          end

        else

          _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0,500,0))        

        end

      end)

    end

  end

end)

local Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Collect Azure Ember", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Collect_Ember = Value

end)

spawn(function()

  while wait(.1) do

    if _G.Collect_Ember then

      pcall(function()

        if workspace:WaitForChild("AttachedAzureEmber") or workspace:WaitForChild("EmberTemplate") then

        notween(workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)

        else

          _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0,500,0))        

          replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()

        end

      end)

    end

  end

end)

local Q = Tabs.SeaEvent:AddToggle("Q", {Title = "Auto Trade Azure Ember", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Trade_Ember = Value

end)

spawn(function()

  while wait(.1) do

    if _G.Trade_Ember then

      pcall(function()

        if workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island",true) then

          replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()

        end

      end)

    end

  end

end)

Tabs.SeaEvent:AddButton({Title = "Trade Items Azure", Description = "",

Callback = function()

  replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()

end})

Tabs.SeaEvent:AddButton({Title = "Talk with kitsune statue", Description = "",

Callback = function()

  replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()

end})



Tabs.Raids:AddSection("Dungeon Event / Raiding")

local RaidS = Tabs.Raids:AddParagraph({Title = " Raiding Status ",Content = ""})

spawn(function()

  while wait(.2) do

    pcall(function()      

      if plr.PlayerGui.Main.Timer.Visible == true then

        RaidS:SetDesc(" Raiding Statud : True")

      else

        RaidS:SetDesc(" Raiding Statud : False")

      end      

    end)

  end

end)
   

local Q = Tabs.Raids:AddToggle("Q", {Title = "Teleport To Lab", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.TpLab = Value

  while _G.TpLab do wait(Sec)

   if _G.TpLab then

     if World2 and _G.TpLab then _tp(CFrame.new(-6438.73535, 250.645355, -4501.50684))

     elseif World3 and _G.TpLab then _tp(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818)) end

   end

  end

end)

function IsIslandRaid(cu)
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then
        return
    end

    local nearest, min = nil, math.huge

    for _, v in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
        if v.Name == "Island " .. cu then
            local dist = (v.Position - hrp.Position).Magnitude

            if dist < min then
                min = dist
                nearest = v
            end
        end
    end

    return nearest
end

function getNextIsland()
    local TableIslandsRaid = {5,4,3,2,1}
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

    if not hrp then
        return
    end

    for _, num in pairs(TableIslandsRaid) do
        local island = IsIslandRaid(num)

        if island and (island.Position - hrp.Position).Magnitude <= 4500 then
            return island
        end
    end
end

function KillAuraRaid()
    local island = getNextIsland()

    if not island then
        return
    end

    if island.Name ~= "Island 4" and island.Name ~= "Island 5" then
        return
    end

    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if Attack.Alive(v) then
            pcall(function()
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)

                if v:FindFirstChild("HumanoidRootPart") then
                    v.HumanoidRootPart.CanCollide = false
                end

                v:BreakJoints()
                v.Humanoid.Health = 0
            end)
        end
    end
end

function IsIslandRaid(cu)
    local player = game.Players.LocalPlayer
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    if not hrp then
        return nil
    end

    local nearest = nil
    local min = math.huge

    for _, v in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
        if v.Name == "Island " .. cu then
            local dist = (v.Position - hrp.Position).Magnitude

            if dist < min then
                min = dist
                nearest = v
            end
        end
    end

    return nearest
end

function getNextIsland()
    local TableIslandsRaid = {5, 4, 3, 2, 1}
    local player = game.Players.LocalPlayer
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    if not hrp then
        return nil
    end

    for _, num in pairs(TableIslandsRaid) do
        local island = IsIslandRaid(num)

        if island and (island.Position - hrp.Position).Magnitude <= 4500 then
            return island
        end
    end

    return nil
end

function KillAuraRaid()
    local island = getNextIsland()

    if not island then
        return
    end

    if island.Name ~= "Island 4" and island.Name ~= "Island 5" then
        return
    end

    pcall(function()
        sethiddenproperty(
            game.Players.LocalPlayer,
            "SimulationRadius",
            math.huge
        )
    end)

    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if Attack.Alive(v) then
            pcall(function()
                local hrp = v:FindFirstChild("HumanoidRootPart")
                local hum = v:FindFirstChild("Humanoid")

                if hrp then
                    hrp.CanCollide = false
                end

                if hum then
                    v:BreakJoints()
                    hum.Health = 0
                end
            end)
        end
    end
end

function attackNearbyEnemies()
    local player = game.Players.LocalPlayer
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    if not hrp then
        return false
    end

    local found = false

    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
        local enemyHRP = enemy:FindFirstChild("HumanoidRootPart")
        local humanoid = enemy:FindFirstChild("Humanoid")

        if enemyHRP
        and humanoid
        and humanoid.Health > 0 then

            local dist = (enemyHRP.Position - hrp.Position).Magnitude

            if dist <= 1000 then
                found = true

                repeat
                    task.wait(0.1)

                    if not _G.Raiding then
                        break
                    end

                    pcall(function()
                        Attack.Kill(enemy, true)
                    end)

                until not _G.Raiding
                    or not enemy.Parent
                    or not enemy:FindFirstChild("Humanoid")
                    or enemy.Humanoid.Health <= 0
            end
        end
    end

    return found
end

Q = Tabs.Raids:AddToggle("Q", {
    Title = "Auto Complete Raid [Safety]",
    Description = "",
    Default = false
})

Q:OnChanged(function(Value)
    _G.Raiding = Value

    if not Value then
        NextIs = false
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if not _G.Raiding then
                NextIs = false
                return
            end

            local player = game.Players.LocalPlayer
            local playerGui = player:FindFirstChild("PlayerGui")

            if not playerGui then
                return
            end

            local main = playerGui:FindFirstChild("Main")
            local topHUD = main and main:FindFirstChild("TopHUDList")
            local raidTimer = topHUD and topHUD:FindFirstChild("RaidTimer")

            if not raidTimer or not raidTimer.Visible then
                NextIs = false
                return
            end

            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            if not hrp then
                return
            end

            KillAuraRaid()

            local HasEnemy = attackNearbyEnemies()

            if not _G.Raiding then
                return
            end

            if not HasEnemy then
                local island = getNextIsland()

                if island then
                    NextIs = true

                    _tp(
                        island.CFrame
                        * CFrame.new(0, 60, 0)
                    )
                else
                    NextIs = false
                end
            else
                NextIs = false
            end
        end)
    end
end)
local Q = Tabs.Raids:AddToggle("Q", {Title = "Kill Aura", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.KillH = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.KillH then

      for _, v in pairs(workspace.Enemies:GetChildren()) do

        if Attack.Alive(v) then

          pcall(function()

            repeat wait(Sec)

              sethiddenproperty(plr, "SimulationRadius", math.huge)

              v:BreakJoints()

              v.Humanoid.Health = 0

              v.HumanoidRootPart.CanCollide = false

            until not _G.KillH or not v.Parent or v.Humanoid.Health <= 0

          end)

        end

      end

    end

  end

end)

local Q = Tabs.Raids:AddToggle("Q", {Title = "Auto Next Island", Description = "", Default = false})

Q:OnChanged(function(Value)

  NextIs = Value

end)

spawn(function()

  while wait(Sec) do

    if NextIs then

      if plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then

        if workspace["_WorldOrigin"].Locations:FindFirstChild("Island 5") then _tp(workspace["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,50,100))

        elseif workspace["_WorldOrigin"].Locations:FindFirstChild("Island 4") then _tp(workspace["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,50,100))

        elseif workspace["_WorldOrigin"].Locations:FindFirstChild("Island 3") then _tp(workspace["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,50,100))

        elseif workspace["_WorldOrigin"].Locations:FindFirstChild("Island 2") then _tp(workspace["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,50,100))

        elseif workspace["_WorldOrigin"].Locations:FindFirstChild("Island 1") then _tp(workspace["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0,50,100))

        end

      end

    end

  end

end)

local Q = Tabs.Raids:AddToggle("Q", {Title = "Auto Awakening", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_Awakener = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Auto_Awakener then

        replicated.Remotes.CommF_:InvokeServer("Awakener","Check")

        replicated.Remotes.CommF_:InvokeServer("Awakener","Awaken")

      end

    end)

  end

end)	

Tabs.Combat:AddSection("Combat / Aimbot")

__indexPlayer = Tabs.Combat:AddParagraph({Title = "All Players On Server :",Content = ""})

spawn(function()

  while wait(Sec) do

    pcall(function()

      for i,v in pairs(game:GetService("Players"):GetPlayers()) do

        if i == 12 then

          __indexPlayer:SetDesc("All Players :".." "..i.." ".."/".." ".."12".." ".."[Max]")

        elseif i == 1 then

          __indexPlayer:SetDesc("All Players  :".." "..i.." ".."/".." ".."12")

        else

          __indexPlayer:SetDesc("All Players  :".." "..i.." ".."/".." ".."12")

        end

      end

    end)

  end

end)

__AimBotTurn = Tabs.Combat:AddParagraph({Title = "Aimbot Status :",Content = ""})

local AimbotMethod = {"AimBots Skill","Auto Aimbots"}

Checking_AimStatus = function()

  if _G.AimCam then

    return "Aimbot Camera"

  else

    return ""

  end 

  if _G.AimbotGun then

    return "Aimbot Guns"

  else

    return ""  

  end 

end

spawn(function() 

  while wait(.2) do 

    pcall(function()      

      if _G.AimMethod then 

	   __AimBotTurn:SetDesc("Aimbot - Skills : True") 

	 elseif (_G.AimCam or _G.AimbotGun) and _G.AimMethod then

	   __AimBotTurn:SetDesc("Aimbot - Skills |" ..Checking_AimStatus() .." :" .."True")

	 else

        __AimBotTurn:SetDesc("Aimbot - Skills : False") 

      end 

    end)

  end

end)

local PlrList = {}   

for _,v in pairs(game:GetService("Players"):GetChildren()) do table.insert(PlrList, v.Name) end

local SelectedPly = Tabs.Combat:AddDropdown("SelectedPly",{Title = "Choose Players", Searchable = true, Values = PlrList,Multi = false,Default = 1})

SelectedPly:OnChanged(function(Value)

  _G.PlayersList = Value

end)

Q = Tabs.Combat:AddToggle("Q", {Title = "Teleport to choose players", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.TpPly = Value

  pcall(function()

    if _G.TpPly then

      repeat wait()

        _tp(game:GetService("Players")[_G.PlayersList].Character.HumanoidRootPart.CFrame) 

      until not _G.TpPly

    end

  end)

end)

Q = Tabs.Combat:AddToggle("Q", {Title = "Spectate Choose Players", Description = "", Default = false})

Q:OnChanged(function(Value)

  SpectatePlys = Value

  repeat task.wait(.1)

    workspace.Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.PlayersList).Character.Humanoid

  until SpectatePlys == false 

    workspace.Camera.CameraSubject = plr.Character.Humanoid

end)



Q = Tabs.Combat:AddDropdown("Q",{Title = "Choose Aim Method", Searchable = true, Values = AimbotMethod,Multi = false,Default = 1})

Q:OnChanged(function(Value)

  ABmethod = Value

end)



Q = Tabs.Combat:AddToggle("Q", {Title = "Aimbot Method Skills", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AimMethod = Value

end)

task.spawn(function()

  while task.wait() do

    pcall(function()

      if _G.AimMethod and ABmethod == "AimBots Skill" then

        for i,v in pairs(game:GetService("Players"):GetPlayers()) do

          if v.Name == _G.PlayersList and v.Team ~= game.Players.LocalPlayer.Team then

            MousePos = v.Character:FindFirstChild("HumanoidRootPart").Position       	  

          end

        end

      end

    end)

  end

end)

task.spawn(function()

  while task.wait() do

    pcall(function()

      if _G.AimMethod and ABmethod == "Auto Aimbots" then

        local MaxDistance = math.huge

        for i,v in pairs(game:GetService("Players"):GetPlayers()) do

          if v.Name ~= plr.Name and v.Team ~= game.Players.LocalPlayer.Team then

            local Distance = v:DistanceFromCharacter(plr.Character.HumanoidRootPart.Position)

            if Distance < MaxDistance then

              MaxDistance = Distance

              MousePos = v.Character:FindFirstChild("HumanoidRootPart").Position

       	    end

          end

        end

      end

    end)

  end

end)

Q = Tabs.Combat:AddToggle("Q", {Title = "Aimbot Camera Closet Players", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AimCam = Value

end)

task.spawn(function()

  while task.wait(Sec) do

    pcall(function()

      if _G.AimCam then

      local camera = workspace.CurrentCamera

	  closestplayer = function()

	  local dist = math.huge

	  local target = nil 

	    for _, v in next, ply:GetPlayers() do

	      if v ~= plr then

		    if v.Character and v.Character:FindFirstChild("Head") and _G.AimCam and v.Character.Humanoid.Health > 0 then

            local Mag = (v.Character.Head.Position - plr.Character.Head.Position).Magnitude

	          if Mag < dist then

		        dist = Mag

			    target = v

		      end

		    end

		  end

        end

        return target

      end

        repeat task.wait()

          camera.CFrame = CFrame.new(camera.CFrame.Position,closestplayer().Character.HumanoidRootPart.Position)

        until _G.AimCam == false or Mag > dist

      end

    end)

  end

end)



Tabs.Combat:AddSection("LocalPlayer Settings / Misc")

Q = Tabs.Combat:AddToggle("Q", {Title = "Instance Mink V3 [ INF ]", Description = "turn on for make mink v3 infinity", Default = false})

Q:OnChanged(function(Value)

  InfAblities = Value

end)

spawn(function()

  while wait(.2) do

    pcall(function()

      if InfAblities then

        if not plr.Character.HumanoidRootPart:FindFirstChild("Agility") then

          local agility = replicated.FX["Agility"]:Clone()

          agility.Name = "Agility"

          agility.Parent = plr.Character.HumanoidRootPart

        end

      else

        plr.Character.HumanoidRootPart["Agility"]:Destroy()

      end

    end)

  end

end)

Q = Tabs.Combat:AddToggle("Q", {Title = "Instance Energy [ INF ]", Description = "turn on for make energy infinity", Default = false})

Q:OnChanged(function(Value)

  infEnergy = Value

  if Value then getInfinity_Ability("Energy", infEnergy) end

end)

Q = Tabs.Combat:AddToggle("Q", {Title = "Instance Soru [ INF ]", Description = "turn on for make soru infinity", Default = false})

Q:OnChanged(function(Value)

  _G.InfSoru = Value

  if Value then getInfinity_Ability("Soru", _G.InfSoru) end

end)

Q = Tabs.Combat:AddToggle("Q", {Title = "Instance Observation Range [ INF ]", Description = "turn on for make observation range infinity", Default = false})

Q:OnChanged(function(Value)

  _G.InfiniteObRange = Value

  if Value then getInfinity_Ability("Observation", _G.InfiniteObRange) end

end)



Tabs.Combat:AddSection("Settings Combat / Aimbot Settings")



Q = Tabs.Combat:AddToggle("Q", {Title = "Ignore Same Teams", Description = "turn on for ignore not aimbot same team", Default = false})

Q:OnChanged(function(Value)

  _G.NoAimTeam = Value

end)

Q = Tabs.Combat:AddToggle("Q", {Title = "Accept Allies", Description = "turn on for auto accept ally", Default = false})

Q:OnChanged(function(Value)

  _G.AcceptAlly = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.AcceptAlly then

      pcall(function()

        for _, v in pairs(ply:GetChildren()) do 

          if v.Name ~= plr.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then

            replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AcceptAlly", v.Name)

          end

        end

      end)

    end

  end

end)



Tabs.Combat:AddSection("Esp Items / Entity / Island")



function isnil(thing)

  return (thing == nil)

end

local function round(n)

  return math.floor(tonumber(n) + 0.5)

end

Number = math.random(1, 1000000)

EspPly = function()
    for _, v in next, game.Players:GetChildren() do
        pcall(function()
            if v == game.Players.LocalPlayer then
                return
            end

            if not isnil(v.Character) then
                local Head = v.Character:FindFirstChild("Head")

                if Head then
                    if PlayerEsp then
                        local Bill = Head:FindFirstChild("NameEsp" .. Number)

                        if not Bill then
                            Bill = Instance.new("BillboardGui")
                            Bill.Name = "NameEsp" .. Number
                            Bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            Bill.Size = UDim2.new(0, 140, 0, 55)
                            Bill.Adornee = Head
                            Bill.AlwaysOnTop = true
                            Bill.Parent = Head

                            local Name = Instance.new("TextLabel")
                            Name.Name = "TextLabel"
                            Name.Size = UDim2.new(1, 0, 1, 0)
                            Name.BackgroundTransparency = 1
                            Name.TextWrapped = true
                            Name.TextYAlignment = Enum.TextYAlignment.Top
                            Name.TextXAlignment = Enum.TextXAlignment.Center
                            Name.TextStrokeTransparency = 0.5
                            Name.TextSize = 16
                            Name.FontFace = Font.new(
                                "rbxasset://fonts/families/GothamSSm.json",
                                Enum.FontWeight.Medium,
                                Enum.FontStyle.Normal
                            )
                            Name.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Name.Parent = Bill
                        end

                        local Name = Bill:FindFirstChild("TextLabel")

                        if Name then
                            local TeamName = "Unknown"

                            if v.Team then
                                TeamName = v.Team.Name
                            end

                            local Distance = 0
                            local LocalHead = game.Players.LocalPlayer.Character and
                                game.Players.LocalPlayer.Character:FindFirstChild("Head")

                            if LocalHead then
                                Distance = round(
                                    (LocalHead.Position - Head.Position).Magnitude / 3
                                )
                            end

                            Name.Text =
                                v.Name ..
                                "\n" ..
                                TeamName ..
                                "\n" ..
                                tostring(Distance) ..
                                " M."
                        end
                    else
                        local Bill = Head:FindFirstChild("NameEsp" .. Number)

                        if Bill then
                            Bill:Destroy()
                        end
                    end
                end
            end
        end)
    end
end

LocationEsp = function() 

  for _,v in next, workspace["_WorldOrigin"].Locations:GetChildren() do

    pcall(function()

      if IslandESP then 

        if (v.Name ~= "Sea") then

          if not v:FindFirstChild('NameEsp') then

            local bill = Instance.new('BillboardGui',v)

            bill.Name = 'NameEsp'

            bill.ExtentsOffset = Vector3.new(0, 1, 0)

            bill.Size = UDim2.new(1,200,1,30)

            bill.Adornee = v

            bill.AlwaysOnTop = true

            local name = Instance.new('TextLabel',bill)

            name.Font = Enum.Font.GothamBold

            name.FontSize = "Size14"

            name.TextWrapped = true

            name.Size = UDim2.new(1,0,1,0)

            name.TextYAlignment = 'Top'

            name.BackgroundTransparency = 1

            name.TextStrokeTransparency = 0.5

            name.TextColor3 = Color3.fromRGB(255,255,255)

            else

            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')

             end

           end

         else

        if v:FindFirstChild('NameEsp') then

          v:FindFirstChild('NameEsp'):Destroy()

        end

      end

    end)

  end

end

DevEsp = function()

  for i,v in next, workspace:GetChildren() do

    pcall(function()

      if DevilFruitESP then

        if string.find(v.Name, "Fruit") then   

          if not v.Handle:FindFirstChild('NameEsp'..Number) then

            local bill = Instance.new('BillboardGui',v.Handle)

            bill.Name = 'NameEsp'..Number

            bill.ExtentsOffset = Vector3.new(0, 1, 0)

            bill.Size = UDim2.new(1,200,1,30)

            bill.Adornee = v.Handle

            bill.AlwaysOnTop = true

            local name = Instance.new('TextLabel',bill)

            name.Font = Enum.Font.GothamBold

            name.FontSize = "Size14"

            name.TextWrapped = true

            name.Size = UDim2.new(1,0,1,0)

            name.TextYAlignment = 'Top'

            name.BackgroundTransparency = 1

            name.TextStrokeTransparency = 0.5

            name.TextColor3 = Color3.fromRGB(255,255,255)

            name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')

              else

                v.Handle['NameEsp'..Number].TextLabel.Text = ('[' ..v.Name ..']' ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')

               end

             end

           else

         if v.Handle:FindFirstChild('NameEsp'..Number) then

          v.Handle:FindFirstChild('NameEsp'..Number):Destroy()

        end

      end

    end)

  end

end

flowerEsp = function()

  for i,v in pairs(workspace:GetChildren()) do

    pcall(function()

      if v.Name == "Flower2" or v.Name == "Flower1" then

        if FlowerESP then 

          if not v:FindFirstChild('NameEsp'..Number) then

            local bill = Instance.new('BillboardGui',v)

            bill.Name = 'NameEsp'..Number

            bill.ExtentsOffset = Vector3.new(0, 1, 0)

            bill.Size = UDim2.new(1,200,1,30)

            bill.Adornee = v

            bill.AlwaysOnTop = true

            local name = Instance.new('TextLabel',bill)

            name.Font = Enum.Font.GothamBold
            name.FontSize = "Size14"

            name.TextWrapped = true

            name.Size = UDim2.new(1,0,1,0)

            name.TextYAlignment = 'Top'

            name.BackgroundTransparency = 1

            name.TextStrokeTransparency = 0.5

            name.TextColor3 = Color3.fromRGB(88, 214, 252)

            if v.Name == "Flower1" then 

              name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')

              name.TextColor3 = Color3.fromRGB(88, 214, 252)

            end

              if v.Name == "Flower2" then

                name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')

                name.TextColor3 = Color3.fromRGB(88, 214, 252)

              end

          else

            v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')

          end

        else

          if v:FindFirstChild('NameEsp'..Number) then

            v:FindFirstChild('NameEsp'..Number):Destroy()

          end

        end

      end   

    end)

  end

end

EventIslandEsp = function()

  for i, v in pairs(workspace._WorldOrigin.Locations:GetChildren()) do

    pcall(function()

      if EspEventIsland then

	    if (v.Name == "Mirage Island" or v.Name =="Prehistoric Island" or v.Name =="Kitsune Island") then

	      if not v:FindFirstChild("NameEsp") then

		    local bill = Instance.new("BillboardGui", v);

	   	    bill.Name = "NameEsp";

		    bill.ExtentsOffset = Vector3.new(0, 1, 0);

		    bill.Size = UDim2.new(1, 200, 1, 30);

		    bill.Adornee = v;

		    bill.AlwaysOnTop = true;

		    local name = Instance.new("TextLabel", bill);

		    name.Font = Enum.Font.GothamBold;

		    name.FontSize = "Size14";

		    name.TextWrapped = true;

		    name.Size = UDim2.new(1, 0, 1, 0);

    	    name.TextYAlignment = "Top";

	        name.BackgroundTransparency = 1;

    	    name.TextStrokeTransparency = 0.5;

		    name.TextColor3 = Color3.fromRGB(80, 245, 245);

	     else

	 	    v.NameEsp.TextLabel.Text = v.Name .. "   \n" .. round((plr.Character.Head.Position - v.Position).Magnitude / 3) .. " M";

		  end

        end

	  elseif v:FindFirstChild("NameEsp") then

	    v:FindFirstChild("NameEsp"):Destroy()

      end

    end)

  end

end

gearEsp = function()

  for _,v in pairs(workspace.Map.MysticIsland:GetDescendants()) do

    pcall(function()

      if ESPGear then

        if v.Name == "Part" and v.Material == Enum.Material.Neon then

          if not v:FindFirstChild("NameEsp") then

          local bill = Instance.new("BillboardGui", v)

          bill.Name = "NameEsp"

          bill.ExtentsOffset = Vector3.new(0, 1, 0)

          bill.Size = UDim2.new(1, 200, 1, 30)

          bill.Adornee = v

          bill.AlwaysOnTop = true

          local name = Instance.new("TextLabel", bill)

          name.Font = Enum.Font.GothamBold

          name.FontSize = "Size14"

          name.TextWrapped = true

          name.Size = UDim2.new(1, 0, 1, 0)

          name.TextYAlignment = "Top"

          name.BackgroundTransparency = 1

          name.TextStrokeTransparency = 0.5

          name.TextColor3 = Color3.fromRGB(80, 245, 245)

            else

            v["NameEsp"].TextLabel.Text =("Gear" .."   \n" .. round((plr.Character.Head.Position - v.Position).Magnitude / 3).. " M")

                end

              end

            else

          if v:FindFirstChild("NameEsp") then

            v:FindFirstChild("NameEsp"):Destroy()

          end

      end

    end)

  end

end

AdvanFruitEsp = function()

if advanEsp == true then     

for _,v in pairs(replicated.NPCs:GetChildren()) do

  if v.Name == "Advanced Fruit Dealer" then

    if not workspace:FindFirstChild("Adv") then

     Adv = Instance.new("Part")

     Adv.Name = "Adv"

     Adv.Transparency = 1

     Adv.Size = Vector3.new(1,1,1)

     Adv.Anchored = true

     Adv.CanCollide = false

     Adv.Parent = workspace

     Adv.CFrame = v.HumanoidRootPart.CFrame    

     elseif workspace:FindFirstChild("Adv") then

      if not Adv:FindFirstChild("NameEsp") then

        local bill = Instance.new("BillboardGui", Adv)

        bill.Name = "NameEsp"

        bill.ExtentsOffset = Vector3.new(0, 1, 0)

        bill.Size = UDim2.new(1, 200, 1, 30)

        bill.Adornee = Adv

        bill.AlwaysOnTop = true

        local name = Instance.new("TextLabel", bill)

        name.Font = Enum.Font.GothamBold

        name.FontSize = "Size14"

        name.TextWrapped = true

        name.Size = UDim2.new(1, 0, 1, 0)

        name.TextYAlignment = "Top"

        name.BackgroundTransparency = 1

        name.TextStrokeTransparency = 0.5

        name.TextColor3 = Color3.fromRGB(80, 245, 245)        

        else

          Adv["NameEsp"].TextLabel.Text = (v.Name .."   \n" ..round((plr.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude /3) .." M")    

          end                              

        end

      end

    end

    else

      if workspace:FindFirstChild("Adv") then

        workspace:FindFirstChild("Adv"):Destroy()

    end    

  end

end

HakiClorEsp = function()

if ColorEsp == true then     

for _,v in pairs(replicated.NPCs:GetChildren()) do

  if v.Name == "Barista Cousin" then

    if not workspace:FindFirstChild("Gay") then

     Gay = Instance.new("Part")

     Gay.Name = "Gay"

     Gay.Transparency = 1

     Gay.Size = Vector3.new(1,1,1)

     Gay.Anchored = true

     Gay.CanCollide = false

     Gay.Parent = workspace

     Gay.CFrame = v.HumanoidRootPart.CFrame    

     elseif workspace:FindFirstChild("Gay") then

      if not Gay:FindFirstChild("NameEsp") then

        local bill = Instance.new("BillboardGui", Gay)

        bill.Name = "NameEsp"

        bill.ExtentsOffset = Vector3.new(0, 1, 0)

        bill.Size = UDim2.new(1, 200, 1, 30)

        bill.Adornee = Gay

        bill.AlwaysOnTop = true

        local name = Instance.new("TextLabel", bill)

        name.Font = Enum.Font.GothamBold
        name.FontSize = "Size14"

        name.TextWrapped = true

        name.Size = UDim2.new(1, 0, 1, 0)

        name.TextYAlignment = "Top"

        name.BackgroundTransparency = 1

        name.TextStrokeTransparency = 0.5

        name.TextColor3 = Color3.fromRGB(80, 245, 245)        

        else

          Gay["NameEsp"].TextLabel.Text = (v.Name .."   \n" ..round((plr.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude /3) .." M")    

          end                              

        end

      end

    end

    else

      if workspace:FindFirstChild("Gay") then

        workspace:FindFirstChild("Gay"):Destroy()

    end    

  end

end

LegenSword = function()

if LegenS == true then     

for _,v in pairs(replicated.NPCs:GetChildren()) do

  if v.Name == "Legendary Sword Dealer " then

    if not workspace:FindFirstChild("Lgd") then

     Lgd = Instance.new("Part")

     Lgd.Name = "Lgd"

     Lgd.Transparency = 1

     Lgd.Size = Vector3.new(1,1,1)

     Lgd.Anchored = true

     Lgd.CanCollide = false

     Lgd.Parent = workspace

     Lgd.CFrame = v.HumanoidRootPart.CFrame    

     elseif workspace:FindFirstChild("Lgd") then

      if not Lgd:FindFirstChild("NameEsp") then

        local bill = Instance.new("BillboardGui", Lgd)

        bill.Name = "NameEsp"

        bill.ExtentsOffset = Vector3.new(0, 1, 0)

        bill.Size = UDim2.new(1, 200, 1, 30)

        bill.Adornee = Lgd

        bill.AlwaysOnTop = true

        local name = Instance.new("TextLabel", bill)

        name.Font = Enum.Font.GothamBold

        name.FontSize = "Size14"

        name.TextWrapped = true

        name.Size = UDim2.new(1, 0, 1, 0)

        name.TextYAlignment = "Top"

        name.BackgroundTransparency = 1

        name.TextStrokeTransparency = 0.5

        name.TextColor3 = Color3.fromRGB(255, 255, 255)        

        else

          Lgd["NameEsp"].TextLabel.Text = (v.Name .."   \n" ..round((plr.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude /3) .." M")    

          end                              

        end

      end

    end

    else

      if workspace:FindFirstChild("Lgd") then

        workspace:FindFirstChild("Lgd"):Destroy()

    end    

  end

end

ChestEsp = function()

    if ChestESP then

        local CollectionService = game:GetService("CollectionService")

        local Players = game:GetService("Players")

        local Player = Players.LocalPlayer

        local Character = Player.Character or Player.CharacterAdded:Wait()

        local playerPos = Character:GetPivot().Position

        local Chests = CollectionService:GetTagged("_ChestTagged")        

        for _, Chest in ipairs(Chests) do

local __DARKLUA_CONTINUE_507=false repeat            if not SelectedIsland or Chest:IsDescendantOf(SelectedIsland) then

                if not Chest:GetAttribute("IsDisabled") then

                    local chestPos

                    local success, result = pcall(function() return Chest:GetPivot().Position end)

                    if success then

                        chestPos = result

                    elseif Chest:IsA("BasePart") then

                        chestPos = Chest.Position

                    else

__DARKLUA_CONTINUE_507=true                        break  

                    end                  

                    local distanceMagnitude = (chestPos - playerPos).Magnitude

                    local sanitizedFullName = Chest:GetFullName():gsub("[^%w_]", "_")

                    local existingEsp = Chest:FindFirstChild("ChestEspAttachment")                    

                    if not existingEsp then

                        local attachment = Instance.new("Attachment")

                        attachment.Name = "ChestEspAttachment"

                        attachment.Parent = Chest

                        attachment.Position = Vector3.new(0, 3, 0)                     

                        local nameEsp = Instance.new("BillboardGui")

                        nameEsp.Name = "NameEsp"

                        nameEsp.Size = UDim2.new(0, 200, 0, 30)

                        nameEsp.Adornee = attachment

                        nameEsp.ExtentsOffset = Vector3.new(0, 1, 0)

                        nameEsp.AlwaysOnTop = true

                        nameEsp.Parent = attachment                        

                        local nameLabel = Instance.new("TextLabel")

                        nameLabel.Font = Enum.Font.Code

                        nameLabel.TextSize = 14

                        nameLabel.TextWrapped = true

                        nameLabel.Size = UDim2.new(1, 0, 1, 0)

                        nameLabel.TextYAlignment = Enum.TextYAlignment.Top

                        nameLabel.BackgroundTransparency = 1

                        nameLabel.TextStrokeTransparency = 0.5

                        nameLabel.TextColor3 = Color3.fromRGB(80, 245, 245)

                        nameLabel.Parent = nameEsp

                    end

                    local nameEsp = existingEsp and existingEsp:FindFirstChild("NameEsp")

                    if nameEsp then

                        local displayDistance = math.floor(distanceMagnitude / 3)

                        local chestName = Chest.Name:gsub("Label", "")

                        nameEsp.TextLabel.Text = string.format("[%s] %d M", chestName, displayDistance)

                    end

                    if _G_AutoFarmChest and distanceMagnitude <= 20 then

                        if existingEsp then

                            existingEsp:Destroy()

                        end

                    end

                end

            end

__DARKLUA_CONTINUE_507=true until true if not __DARKLUA_CONTINUE_507 then break end        end

    else

        for _, Chest in ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do

            local espAttachment = Chest:FindFirstChild("ChestEspAttachment")

            if espAttachment then

                espAttachment:Destroy()

            end

        end

    end

end

berriesEsp = function()

    if BerryEsp then

        local CollectionService = game:GetService("CollectionService")

        local Players = game:GetService("Players")

        local Player = Players.LocalPlayer

        local BerryBushes = CollectionService:GetTagged("BerryBush")

        for _, Bush in ipairs(BerryBushes) do

            local bushPosition = Bush.Parent:GetPivot().Position

            for _, BerryName in pairs(Bush:GetAttributes()) do

                if BerryName and (not BerryArray or table.find(BerryArray, BerryName)) then

                    local espPartName = "BerryEspPart_" .. BerryName .. "_" .. tostring(bushPosition)

                    local existingEsp = workspace:FindFirstChild(espPartName)

                    if not existingEsp then

                        existingEsp = Instance.new("Part")

                        existingEsp.Name = espPartName

                        existingEsp.Transparency = 1

                        existingEsp.Size = Vector3.new(1, 1, 1)

                        existingEsp.Anchored = true

                        existingEsp.CanCollide = false

                        existingEsp.Parent = workspace

                        existingEsp.CFrame = CFrame.new(bushPosition)

                    end

                    if not existingEsp:FindFirstChild("NameEsp") then

                        local nameEsp = Instance.new("BillboardGui", existingEsp)

                        nameEsp.Name = "NameEsp"

                        nameEsp.ExtentsOffset = Vector3.new(0, 1, 0)

                        nameEsp.Size = UDim2.new(0, 200, 0, 30)

                        nameEsp.Adornee = existingEsp

                        nameEsp.AlwaysOnTop = true

                        local nameLabel = Instance.new("TextLabel", nameEsp)

                        nameLabel.Font = Enum.Font.Code

                        nameLabel.TextSize = 14

                        nameLabel.TextWrapped = true

                        nameLabel.Size = UDim2.new(1, 0, 1, 0)

                        nameLabel.TextYAlignment = Enum.TextYAlignment.Top

                        nameLabel.BackgroundTransparency = 1

                        nameLabel.TextStrokeTransparency = 0.5

                        nameLabel.TextColor3 = Color3.fromRGB(80, 245, 245)

                        nameLabel.Parent = nameEsp

                    end

                    local nameEsp = existingEsp:FindFirstChild("NameEsp")

                    local distance = (Player.Character.Head.Position - bushPosition).Magnitude / 3

                    nameEsp.TextLabel.Text = ('[' .. BerryName .. ']' .. " " .. math.round(distance) .. " M")

                    if _G.AutoBerry and math.round(distance) <= 20 then

                        existingEsp:Destroy()

                    end

                end

            end

        end

    else

        for _, v in ipairs(workspace:GetChildren()) do

            if v:IsA("Part") and v.Name:match("BerryEspPart_.*") then

                v:Destroy()

            end

        end

    end

end



BerrisEsp = Tabs.Combat:AddToggle("BerriesEsp", {Title = "Esp Berries", Description = "", Default = false})

BerrisEsp:OnChanged(function(Value)

  BerryEsp = Value

  while BerryEsp do wait()

    berriesEsp() 

  end

end)



PlayerEsp = Tabs.Combat:AddToggle("PlayerEsp", {Title = "Esp Players", Description = "", Default = false})

PlayerEsp:OnChanged(function(Value)

  PlayerEsp = Value

  while PlayerEsp do wait()

    EspPly()

  end

end)



ChestEsp = Tabs.Combat:AddToggle("ChestEsp", {Title = "Esp Chests", Description = "", Default = false})

ChestEsp:OnChanged(function(Value)

  ChestESP = Value

  while ChestESP do wait()

    ChestEsp() 

  end

end)



FruitEsp = Tabs.Combat:AddToggle("FruitEsp", {Title = "Esp Fruits", Description = "", Default = false})

FruitEsp:OnChanged(function(Value)

  DevilFruitESP = Value

  while DevilFruitESP do wait()

    DevEsp() 

  end

end)



IslandEsp = Tabs.Combat:AddToggle("IslandEsp", {Title = "Esp Island Location", Description = "", Default = false})

IslandEsp:OnChanged(function(Value)

  IslandESP = Value

  while IslandESP do wait()

    LocationEsp() 

  end

end)



if World2 then

FlowerEsp = Tabs.Combat:AddToggle("FlowerEsp", {Title = "Esp Flower", Description = "", Default = false})

FlowerEsp:OnChanged(function(Value)

  FlowerESP = Value

  while FlowerESP do wait()

    flowerEsp() 

  end

end)

LegenEsp = Tabs.Combat:AddToggle("LegenEsp", {Title = "Esp Legendary Sword", Description = "", Default = false})

LegenEsp:OnChanged(function(Value)

  LegenS = Value

  while LegenS do wait()

    LegenSword()

  end

end)

end



if World2 or World3 then

HakiEsp = Tabs.Combat:AddToggle("HakiEsp", {Title = "Esp Aura Colour Dealers", Description = "", Default = false})

HakiEsp:OnChanged(function(Value)

  ColorEsp = Value

  while ColorEsp do wait()

    HakiClorEsp()

  end

end)

end



if World3 then

GearEsp = Tabs.Combat:AddToggle("GearEsp", {Title = "Esp Gears", Description = "", Default = false})

GearEsp:OnChanged(function(Value)

  ESPGear = Value

  while ESPGear do wait()

    gearEsp()

  end

end)

SeaEventEsp = Tabs.Combat:AddToggle("SeaEventEsp", {Title = "Esp SeaEvent Island", Description = "", Default = false})

SeaEventEsp:OnChanged(function(Value)

  EspEventIsland = Value

  while EspEventIsland do wait()

    EventIslandEsp()

  end

end)

AdvancedFruitEsp = Tabs.Combat:AddToggle("AdvancedFruitEsp", {Title = "Esp Advanced Fruits Dealer", Description = "", Default = false})

AdvancedFruitEsp:OnChanged(function(Value)

  advanEsp = Value

  while advanEsp do wait()

    AdvanFruitEsp()

  end

end)

end

Tabs.Locations:AddSection("Server Teleport")

Tabs.Locations:AddButton({Title = "Rejoin Server", Description = "Rejoin the current server",Callback = function()

  game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)

end})

Tabs.Locations:AddButton({Title = "Server Hop", Description = "Hops to a different server.",Callback = function()

  Hop()

end})

Tabs.Locations:AddSection("Sea Teleport")

Tabs.Locations:AddButton({Title = "Teleport To Sea 1", Description = "Teleports you to Sea 1",

Callback = function()

  replicated.Remotes.CommF_:InvokeServer("TravelMain")

end})

Tabs.Locations:AddButton({Title = "Teleport To Sea 2", Description = "Teleports you to Sea 2",

Callback = function()

  replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")

end})

Tabs.Locations:AddButton({Title = "Teleport To Sea 3", Description = "Teleports you to Sea 3",

Callback = function()

  replicated.Remotes.CommF_:InvokeServer("TravelZou")

end})

Tabs.Locations:AddSection("Island Teleport")

Location = {}

for i,v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do  

  table.insert(Location ,v.Name)

end

Travelllll = Tabs.Locations:AddDropdown("Travelllll",{Title = "Select Island", Searchable = true, Values = Location,Multi = false,Default = 1})

Travelllll:OnChanged(function(Value)

  _G.Island = Value

end)

GoIsland = Tabs.Locations:AddToggle("GoIsland", {Title = "Teleport Island", Description = "Teleports you to the selected island.", Default = false})

GoIsland:OnChanged(function(Value)

  _G.Teleport = Value

  if Value then

    for i,v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do

      if v.Name == _G.Island then

        repeat wait()

	     _tp(v.CFrame * CFrame.new(0, 30, 0)) 

        until not _G.Teleport or Root.CFrame == v.CFrame

      end

    end

  end

end)



Tabs.Locations:AddSection("Travel - Portal")

if World1 then

  Location_Portal = {

    "Sky",

    "UnderWater"

  }

elseif World2 then

  Location_Portal = {

    "SwanRoom",

    "Cursed Ship"

  }

elseif World3 then

  Location_Portal = {

    "Castle On The Sea",

    "Mansion Cafe",

    "Hydra Teleport",

    "Canvendish Room",

    "Temple of Time"

  }

end



PortalTP = Tabs.Locations:AddDropdown("PortalTP",{Title = "Select Portal", Searchable = true, Values = Location_Portal,Multi = false,Default = 1})

PortalTP:OnChanged(function(Value)

  _G.Island_PT = Value

end)

Tabs.Locations:AddButton({Title = "requestEntrance", Description = "",Callback = function()

  if _G.Island_PT == "Sky" then

    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894, 5547, -380))

  elseif _G.Island_PT == "UnderWater" then

    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163, 11, 1819))

  elseif _G.Island_PT == "SwanRoom" then

    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2285, 15, 905))

  elseif _G.Island_PT == "Cursed Ship" then

    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923, 126, 32852))

  elseif _G.Island_PT == "Castle On The Sea" then

    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))

  elseif _G.Island_PT == "Mansion Cafe" then

    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))

  elseif _G.Island_PT == "Hydra Teleport" then

    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))

  elseif _G.Island_PT == "Canvendish Room" then

    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))

  elseif _G.Island_PT == "Temple of Time" then

    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28310.0234, 14895.1123, 109.456741, -0.469690144, -2.85620132e-08, -0.882831335, -3.23509219e-08, 1, -1.51411736e-08, 0.882831335, 2.14487486e-08, -0.469690144))

  end

end})



Tabs.Locations:AddSection("Travel - NPCs")

for _, v in pairs(replicated.NPCs:GetChildren()) do table.insert(NPCList, v.Name)end

NPCsPos = Tabs.Locations:AddDropdown("NPCsPos",{Title = "Select NPCs", Searchable = true, Values = NPCList,Multi = false,Default = 1})

NPCsPos:OnChanged(function(Value)

  NPClist = Value

end)

GoNPCs = Tabs.Locations:AddToggle("GoNPCs", {Title = "Auto Tween to NPCs", Description = "Automatic teleport to pos Npcs", Default = false})

GoNPCs:OnChanged(function(Value)

  _G.TPNpc = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.TPNpc then

	 pcall(function()

       for __, v in pairs(replicated.NPCs:GetChildren()) do

       if v.Name == NPClist then _tp(v.HumanoidRootPart.CFrame) end

       end                	   	   

	 end)

    end

  end

end)



Tabs.Fruit:AddSection("Fruits Options")

local fruitsOnSale = {}

local function addCommas(number)

    local formatted = tostring(number)

    while true do  

        formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", '%1,%2')

        if k == 0 then break end

    end

    return formatted

end

for _, fruitData in pairs(replicated.Remotes.CommF_:InvokeServer("GetFruits",true)) do

    if fruitData["OnSale"] == true then

        local priceWithCommas = addCommas(fruitData["Price"])

        local fruitInfo = fruitData["Name"]

        table.insert(fruitsOnSale, fruitInfo)

    end

end

local Nms = {}

for _, fruitData in pairs(replicated.Remotes.CommF_:InvokeServer("GetFruits",false)) do

    if fruitData["OnSale"] == true then

        local price = addCommas(fruitData["Price"])

        local NormalInFO = fruitData["Name"]

        table.insert(Nms, NormalInFO)

    end

end

Sel_NFruit = Tabs.Fruit:AddDropdown("Sel_NFruit",{Title = "Select Fruit Stock", Searchable = true, Values = Nms,Multi = false,Default = 1})

Sel_NFruit:OnChanged(function(Value)

  _G.SelectFruit = Value

end)

Tabs.Fruit:AddButton({Title = "Buy Basic Stock", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("PurchaseRawFruit",_G.SelectFruit)

end})

Sel_MFruit = Tabs.Fruit:AddDropdown("Sel_MFruit",{Title = "Select Mirage Fruit", Searchable = true, Values = fruitsOnSale,Multi = false,Default = 1})

Sel_MFruit:OnChanged(function(Value)

  SelectF_Adv = Value

end)

local Nms = {}

for _, fruitData in pairs(replicated.Remotes.CommF_:InvokeServer("GetFruits",false)) do

    if fruitData["OnSale"] == true then

        local price = addCommas(fruitData["Price"])

        local NormalInFO = fruitData["Name"]

        table.insert(Nms, NormalInFO)

    end

end

Tabs.Fruit:AddButton({Title = "Buy Mirage Stock", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("PurchaseRawFruit",SelectF_Adv)

end})

RandomFF = Tabs.Fruit:AddToggle("RandomFF", {
    Title = "Auto Random Fruit",
    Description = "Automatic random devil fruit",
    Default = false
})

RandomFF:OnChanged(function(Value)
    _G.Random_Auto = Value
end)

task.spawn(function()
    while task.wait(1) do
        if _G.Random_Auto then
            game:GetService("ReplicatedStorage")
                :WaitForChild("Remotes")
                :WaitForChild("CommF_")
                :InvokeServer("Cousin", "DLCBoxData")
        end
    end
end)

DropF = Tabs.Fruit:AddToggle("DropF", {Title = "Auto Drop Fruit", Description = "Automatic drop devil fruit", Default = false})

DropF:OnChanged(function(Value)

  _G.DropFruit = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.DropFruit then

      pcall(function() DropFruits() end)

    end

  end

end)

StoredF = Tabs.Fruit:AddToggle("StoredF", {Title = "Auto Store Fruit", Description = "Automatic store devil fruit", Default = false})

StoredF:OnChanged(function(Value)

  _G.StoreF = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.StoreF then

      pcall(function() UpdStFruit() end)

    end

  end

end)

TwF = Tabs.Fruit:AddToggle("TwF", {Title = "Auto Tween to Fruit", Description = "Automatic tween to get devil fruit", Default = false})

TwF:OnChanged(function(Value)

  _G.TwFruits = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.TwFruits then

      pcall(function()

        for _,x1 in pairs(workspace:GetChildren()) do

	    if string.find(x1.Name, "Fruit") then _tp(x1.Handle.CFrame) end

	    end

      end)

    end

  end

end)

BringF = Tabs.Fruit:AddToggle("BringF", {Title = "Auto Collect Fruit", Description = "Automatic bring devil fruit", Default = false})

BringF:OnChanged(function(Value)

  _G.InstanceF = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.InstanceF then

      pcall(function() collectFruits(_G.InstanceF) end)

    end

  end

end)

Tabs.Shop:AddSection("Code")
code = {
    "LIGHTNINGABUSE",
    "1LOSTADMIN",
    "ADMINFIGHT",
    "NOMOREHACK",
    "BANEXPLOIT",
    "krazydares",
    "TRIPLEABUSE",
    "24NOADMIN",
    "REWARDFUN",
    "Chandler",
    "NEWTROLL",
    "KITT_RESET",
    "Magicbus",
    "Starcodeheo",
    "fudd10_v2",
    "Sub2UncleKizaru",
    "Fudd10",
    "Bignews",
    "SECRET_ADMIN",
    "SUB2GAMERROBOT_RESET1",
    "SUB2OFFICIALNOOBIE",
    "AXIORE",
    "BIGNEWS",
    "BLUXXY",
    "CHANDLER",
    "ENYU_IS_PRO",
    "FUDD10",
    "FUDD10_V2",
    "KITTGAMING",
    "MAGICBUS",
    "STARCODEHEO",
    "STRAWHATMAINE",
    "SUB2CAPTAINMAUI",
    "SUB2DAIGROCK",
    "SUB2FER999",
    "SUB2NOOBMASTER123",
    "SUB2UNCLEKIZARU",
    "TANTAIGAMING",
    "THEGREATACE",
    "WildDares",
    "BossBuild",
    "GetPranked",
    "FIGHT4FRUIT",
    "EARN_FRUITS",
    "Sub2OfficialNoobie",
    "Sub2Daigrock",
    "Sub2NoobMaster123",
    "Bluxxy",
    "JCWK",
    "Enyu_is_Pro",
    "Sub2Fer999",
    "kittgaming",
    "TheGreatAce",
    "StrawHatMaine",
    "TantaiGaming",
    "Axiore",
    "SUB2GAMERROBOT_EXP1",
    "MagicBus",
    "StarcodeHEO",
    "Sub2CaptainMaui"
}
Tabs.Shop:AddButton({
    Title = "Redeem All Codes",
    Description = "Redeems every available code for free rewards.",
    Callback = function()
        for _, v in ipairs(code) do
            task.spawn(function()
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v)
                end)
            end)
        end
    end
})
Tabs.Shop:AddSection("Abilities")

Tabs.Shop:AddButton({Title = "Geppo (10,000)", Description = "Buys the Geppo ability for 10,000 Beli.",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyHaki","Geppo")

end})

Tabs.Shop:AddButton({Title = "Buso (25,000)", Description = "Buys Buso (Armament) Haki for 25,000 Beli.",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyHaki","Buso")

end})

Tabs.Shop:AddButton({Title = "Soru (100,000)", Description = "Buys the Soru ability for 100,000 Beli.",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyHaki","Soru")

end})

Tabs.Shop:AddButton({Title = "Observation Haki (750,000)", Description = "Buys Observation Haki for 750.000 Beli.",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("KenTalk","Buy")

end})

Tabs.Shop:AddSection("Races")
Tabs.Shop:AddButton({Title = "Ghoul Race", Description = "Changes your race to Ghoul",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("Ectoplasm"," Change", 4)

end})	

Tabs.Shop:AddButton({Title = "Cyborg Race", Description = "Changes your race to Cyborg",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CyborgTrainer"," Buy")

end})

Tabs.Shop:AddSection("Fragments")

Tabs.Shop:AddButton({Title = "Refund Stats (2,500)", Description = "Refunds your stat points for 2,500 Fragments.",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")

end})

Tabs.Shop:AddButton({Title = "Reroll Race (3,000)", Description = "Rerolls your race for 3,000 Fragments.",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")

end})

Tabs.Shop:AddSection("Fighting Styles")

Tabs.Shop:AddButton({
    Title = "Black Leg",
    Description = "Buys the Black Leg fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
})

Tabs.Shop:AddButton({
    Title = "Electro",
    Description = "Buys the Electro fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuyElectro")
    end
})

Tabs.Shop:AddButton({
    Title = "Fishman Karate",
    Description = "Buys the Fishman Karate fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end
})

Tabs.Shop:AddButton({
    Title = "Dragon Claw",
    Description = "Buys Dragon Claw fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end
})

Tabs.Shop:AddButton({
    Title = "Superhuman",
    Description = "Buys Superhuman fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
    end
})

Tabs.Shop:AddButton({
    Title = "Death Step",
    Description = "Buys Death Step fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
    end
})

Tabs.Shop:AddButton({
    Title = "Sharkman Karate",
    Description = "Buys Sharkman Karate fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
})

Tabs.Shop:AddButton({
    Title = "Electric Claw",
    Description = "Buys Electric Claw fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end
})

Tabs.Shop:AddButton({
    Title = "Dragon Talon",
    Description = "Buys Dragon Talon fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end
})

Tabs.Shop:AddButton({
    Title = "God Human",
    Description = "Buys God Human fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
    end
})

Tabs.Shop:AddButton({
    Title = "Sanguine Art",
    Description = "Buys Sanguine Art fighting style.",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
})

Tabs.Shop:AddSection("Accessory SeaEvent")

Tabs.Shop:AddButton({Title = "Craft Dragonheart", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","Dragonheart");

end})

Tabs.Shop:AddButton({Title = "Craft Dragonstorm", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","Dragonstorm");

end})

Tabs.Shop:AddButton({Title = "Craft DinoHood", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","DinoHood");

end})   

Tabs.Shop:AddButton({Title = "Craft SharkTooth", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","SharkTooth");

end})   

Tabs.Shop:AddButton({Title = "Craft TerrorJaw", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","TerrorJaw");

end})   

Tabs.Shop:AddButton({Title = "Craft SharkAnchor", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","SharkAnchor");

end})   

Tabs.Shop:AddButton({Title = "Craft LeviathanCrown", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LeviathanCrown");

end})   

Tabs.Shop:AddButton({Title = "Craft LeviathanShield", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LeviathanShield");

end})   

Tabs.Shop:AddButton({Title = "Craft LeviathanBoat", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LeviathanBoat");

end})   

Tabs.Shop:AddButton({Title = "Craft LegendaryScroll", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LegendaryScroll");

end})   

Tabs.Shop:AddButton({Title = "Craft MythicalScroll", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","MythicalScroll");

end})   



Tabs.Shop:AddSection("Weapon World1")

Tabs.Shop:AddButton({Title = "Buy Cutlass", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Cutlass")

end})

Tabs.Shop:AddButton({Title = "Buy Katana", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Katana")

end})

Tabs.Shop:AddButton({Title = "Buy Iron Mace", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")

end})   

Tabs.Shop:AddButton({Title = "Buy Duel Katana", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")

end})   

Tabs.Shop:AddButton({Title = "Buy Triple Katana", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")

end})  

Tabs.Shop:AddButton({Title = "Buy Pipe", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Pipe")

end})  

Tabs.Shop:AddButton({Title = "Buy Dual-Headed Blade", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")

end})   

Tabs.Shop:AddButton({Title = "Buy Bisento", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Bisento")

end})  

Tabs.Shop:AddButton({Title = "Buy Soul Cane", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")

end})

Tabs.Shop:AddButton({Title = "Buy Slingshot", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Slingshot")

end})

Tabs.Shop:AddButton({Title = "Buy Musket", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Musket")

end})    

Tabs.Shop:AddButton({Title = "Buy Dual Flintlock", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Dual Flintlock")

end})   

Tabs.Shop:AddButton({Title = "Buy Flintlock", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Flintlock")

end})   

Tabs.Shop:AddButton({Title = "Buy Refined Flintlock", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")

end})   

Tabs.Shop:AddButton({Title = "Buy Cannon", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BuyItem","Cannon")

end}) 

Tabs.Shop:AddButton({Title = "Buy Kabucha", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")

end})
Tabs.Locations:AddSection("Player Gui / Others")

Tabs.Locations:AddButton({Title = "Open Awakenings Expert", Description = "",Callback = function()

  plr.PlayerGui.Main.AwakeningToggler.Visible = true

end})

Tabs.Locations:AddButton({Title = "Open Title Selection", Description = "",Callback = function()

  replicated.Remotes.CommF_:InvokeServer("getTitles",true)

  plr.PlayerGui.Main.Titles.Visible = true

end})

DisbleChat = Tabs.Locations:AddToggle("DisbleChat", {Title = "Disable Chat GUI", Description = "", Default = false})

DisbleChat:OnChanged(function(Value)

  _G.Rechat = Value

  if  _G.Rechat == true then

    local StarterGui = game:GetService('StarterGui')

    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)    

  elseif _G.chat == false then

    local StarterGui = game:GetService('StarterGui')

    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)    

  end

end)

DisbleLeaderB = Tabs.Locations:AddToggle("DisbleLeaderB", {Title = "Disable Leader Board GUI", Description = "", Default = false})

DisbleLeaderB:OnChanged(function(Value)

  ReLeader = Value

  if ReLeader == true then

    local StarterGui = game:GetService('StarterGui')

    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)   

  elseif ReLeader == false then

    local StarterGui = game:GetService('StarterGui')

    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)   

  end

end)

Tabs.Locations:AddButton({Title = "Set Pirate Team", Description = "",Callback = function()

  Pirates()

end})  

Tabs.Locations:AddButton({Title = "Set Marine Team", Description = "",Callback = function()

  Marines()

end})

UnPortal = Tabs.Locations:AddToggle("UnPortal", {Title = "Unlock All Portals", Description = "unlocked portal for who doesn't defeat rip_indra", Default = false})

UnPortal:OnChanged(function(Value)

  _G.PortalUnLock = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.PortalUnLock then        

         if Attack.Pos(CstlePos_Miti,8) then

           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))

         elseif Attack.Pos(Man3Pos_Miti,8) then

           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))

         elseif Attack.Pos(HydraPos_Miti,8) then                    

           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))

         elseif Attack.Pos(HydratoCastle,8) then                   

           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))

        end

      end

    end)

  end

end)



Tabs.Locations:AddSection("Graphics / Haki Stats")



HakiSt = {"State 0","State 1","State 2","State 3","State 4","State 5"}

HakiStat = Tabs.Locations:AddDropdown("HakiStat",{Title = "Select Haki States", Searchable = true, Values = HakiSt,Multi = false,Default = 1})

HakiStat:OnChanged(function(Value)

  _G.SelectStateHaki = Value

end)

Tabs.Locations:AddButton({Title = "ChangeBusoStage", Description = "",Callback = function()

  if _G.SelectStateHaki == "State 0" then

    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",0)

  elseif _G.SelectStateHaki == "State 1" then

    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",1)

  elseif _G.SelectStateHaki == "State 2" then

    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",2)

  elseif _G.SelectStateHaki == "State 3" then

    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",3)

  elseif _G.SelectStateHaki == "State 4" then

    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",4)

  elseif _G.SelectStateHaki == "State 5" then

    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",5)

  end

end})

rtxM = Tabs.Locations:AddToggle("rtxM", {Title = "Turn on RTX Mode", Description = "", Default = false})

rtxM:OnChanged(function(Value)

  _G.RTXMode = Value

  local a = game.Lighting

  local c = Instance.new("ColorCorrectionEffect", a)

  local e = Instance.new("ColorCorrectionEffect", a)

  OldAmbient = a.Ambient

  OldBrightness = a.Brightness

  OldColorShift_Top = a.ColorShift_Top

  OldBrightnessc = c.Brightness

  OldContrastc = c.Contrast

  OldTintColorc = c.TintColor

  OldTintColore = e.TintColor    

  if not _G.RTXMode then return end

  while _G.RTXMode do wait()

    a.Ambient = Color3.fromRGB(33, 33, 33)

    a.Brightness = 0.3

    c.Brightness = 0.176

    c.Contrast = 0.39

    c.TintColor = Color3.fromRGB(217, 145, 57)

    game.Lighting.FogEnd = 999

    if not plr.Character.HumanoidRootPart:FindFirstChild("PointLight") then

      local a2 = Instance.new("PointLight")

      a2.Parent = plr.Character.HumanoidRootPart

      a2.Range = 15

      a2.Color = Color3.fromRGB(217, 145, 57)

    end

    if not _G.RTXMode then

      a.Ambient = OldAmbient

      a.Brightness = OldBrightness

      a.ColorShift_Top = OldColorShift_Top

      c.Contrast = OldContrastc

      c.Brightness = OldBrightnessc

      c.TintColor = OldTintColorc

      e.TintColor = OldTintColore

      game.Lighting.FogEnd = 2500

      plr.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()

    end

  end

end)

Tabs.Locations:AddButton({Title = "Turn on Fast Mode", Description = "",Callback = function()

  for _,zx in next, workspace:GetDescendants() do

  if table.find(Past, zx.ClassName) then  zx.Material = "Plastic" end

  end

end})

Tabs.Locations:AddButton({Title = "FPS Booster [New Version]", Description = "",Callback = function()

  FPSBooster()

end})

function FPSBooster()

-- ===== SERVICES =====

local g = game

local w = g:GetService("Workspace")

local l = g:GetService("Lighting")

local t = w.Terrain



-- ===== DISABLE GRAPHICS SETTINGS =====

sethiddenproperty(l, "Technology", 2)

sethiddenproperty(t, "Decoration", false)



t.WaterWaveSize = 0

t.WaterWaveSpeed = 0

t.WaterReflectance = 0

t.WaterTransparency = 1



l.GlobalShadows = false

l.FogEnd = 9e9

l.FogStart = 0

l.Brightness = 1.5

l.Ambient = Color3.new(1, 1, 1)

l.OutdoorAmbient = Color3.new(1, 1, 1)

l.ColorShift_Bottom = Color3.new(1, 1, 1)

l.ColorShift_Top = Color3.new(1, 1, 1)

l.ClockTime = 12

l.GeographicLatitude = 0

l.ExposureCompensation = 0.5



-- ===== GRAPHICS QUALITY =====

settings().Rendering.QualityLevel = "Level01"



-- ===== REMOVE EFFECTS FUNCTION =====

local function removeEffects(obj)

    if not obj or not obj.Parent then return end

    

    local class = obj.ClassName

    

    if class == "Decal" or class == "Texture" then

        obj:Destroy()

        

    elseif class == "Part" or class == "Union" or class == "CornerWedgePart" or class == "TrussPart" or class == "MeshPart" then

        obj.Material = Enum.Material.SmoothPlastic

        obj.Reflectance = 0

        obj.Transparency = 0

        if class == "MeshPart" then

            obj.TextureID = ""

        end

        

    elseif class == "ParticleEmitter" or class == "Trail" or class == "Fire" or class == "Smoke" or class == "Sparkles" then

        obj.Enabled = false

        obj:Destroy()

        

    elseif class == "SpotLight" or class == "PointLight" or class == "SurfaceLight" then

        obj.Enabled = false

        obj:Destroy()

        

    elseif class == "Beam" then

        obj.Enabled = false

        obj:Destroy()

        

    elseif class == "Explosion" then

        obj.BlastPressure = 0

        obj.BlastRadius = 0

        obj.Visible = false

        obj:Destroy()

        

    elseif class == "Sound" then

        obj:Stop()

        obj:Destroy()

    end

end



-- ===== REMOVE POST FX =====

local atmosphere = l:FindFirstChild("Atmosphere")

if atmosphere then

    atmosphere:Destroy()

end



for _, e in ipairs(l:GetChildren()) do

    if e:IsA("PostEffect") or e:IsA("BloomEffect") or e:IsA("BlurEffect") or 

       e:IsA("ColorCorrectionEffect") or e:IsA("DepthOfFieldEffect") or 

       e:IsA("SunRaysEffect") then

        e.Enabled = false

        e:Destroy()

    end

end



-- ===== SCAN WORKSPACE =====

for _, v in ipairs(w:GetDescendants()) do

    removeEffects(v)

end



-- ===== MEMORY CLEANUP =====

wait(1)

collectgarbage()

collectgarbage()

end

Tabs.Locations:AddButton({Title = "Turn on increase Boats", Description = "",Callback = function()

  for _, v in pairs(workspace.Boats:GetDescendants()) do

    if table.find(ListSeaBoat, v.Name) and tostring(v.Owner.Value) == tostring(plr.Name) then              

      v.VehicleSeat.MaxSpeed = 350

      v.VehicleSeat.Torque = 0.2

      v.VehicleSeat.TurnSpeed = 5

      v.VehicleSeat.HeadsUpDisplay = true

    end

  end

end})

Tabs.Locations:AddButton({Title = "Remove Sky Fog", Description = "",Callback = function()

  if Lighting:FindFirstChild("LightingLayers") then Lighting.LightingLayers:Destroy() end

  if Lighting:FindFirstChild("SeaTerrorCC") then Lighting.SeaTerrorCC:Destroy() end

  if Lighting:FindFirstChild("FantasySky") then Lighting.FantasySky:Destroy() end

end})

Tabs.Setting:AddSection("Server Manager")

local JobID = Tabs.Setting:AddInput("JobID", {
    Title = "Job Id",
    Description = "Enter a server Job ID to join.",
    Default = "",
    Placeholder = "Enter Job Id",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        _G.JobId = Value
    end
})

spawn(function()
    while wait(Sec) do
        if _G.JobId then
            pcall(function()
                local Connection

                Connection = plr.OnTeleport:Connect(function(br)
                    if br == Enum.TeleportState.Failed then
                        Connection:Disconnect()

                        if workspace:FindFirstChild("Message") then
                            workspace.Message:Destroy()
                        end
                    end
                end)
            end)
        end
    end
end)

Tabs.Setting:AddButton({
    Title = "Join Server",
    Description = "Teleports you to the server with the entered Job ID.",
    Callback = function()
        if _G.JobId and _G.JobId ~= "" then
            pcall(function()
                replicated["__ServerBrowser"]:InvokeServer("teleport", _G.JobId)
            end)
        end
    end
})

Tabs.Setting:AddButton({
    Title = "Spam Join Server",
    Description = "Repeatedly tries to join the server with the entered Job ID.",
    Callback = function()
        if _G.JobId and _G.JobId ~= "" then
            task.spawn(function()
                while _G.JobId and _G.JobId ~= "" do
                    pcall(function()
                        replicated["__ServerBrowser"]:InvokeServer("teleport", _G.JobId)
                    end)

                    task.wait(2)
                end
            end)
        end
    end
})

Tabs.Setting:AddButton({
    Title = "Copy JobID",
    Description = "Copies the current server's Job ID to your clipboard.",
    Callback = function()
        setclipboard(tostring(game.JobId))
    end
})

Tabs.Locations:AddButton({Title = "Rain Fruits (Client)", Description = "",Callback = function()

  for i, v in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do

    v.Parent = game.Workspace.Map

    v:MoveTo(plr.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))

    if v.Fruit:FindFirstChild("AnimationController") then

      v.Fruit:FindFirstChild("AnimationController"):LoadAnimation(v.Fruit:FindFirstChild("Idle")):Play()

    end

    v.Handle.Touched:Connect(function(otherPart)

      if otherPart.Parent == plr.Character then

        v.Parent = plr.Backpack

        plr.Character.Humanoid:EquipTool(v)

      end

    end)

  end

end})
Tabs.Setting:AddSection("Settings Manage")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local AutoConfigName = "Phuocmaru_" .. tostring(LocalPlayer.UserId)

Tabs.Setting:AddButton({
    Title = "Reset Settings",
    Description = "Resets all settings to their default values.",
    Callback = function()
        for _, Option in pairs(SaveManager.Options) do
            pcall(function()
                if Option.Default ~= nil then
                    Option:SetValue(Option.Default)
                end
            end)
        end

        pcall(function()
            SaveManager:Save(AutoConfigName)
        end)
    end
})
local LanguageSection = Tabs.Setting:AddSection("Language / ภาษา / Ngôn ngữ")

Tabs.Setting:AddDropdown("LanguageDropdown", {
    Title = "Language / ภาษา / Ngôn ngữ",
    Values = {"English", "ไทย", "Tiếng Việt"},
    Multi = false,
    Default = 1,
    Callback = function(Value)
        
    end
})
Tabs.Setting:AddSection("Configs")

Tabs.Setting:AddButton({
    Title = "Copy Configs",
    Description = "Copy your current settings as a getgenv().Configs table to the clipboard.",
    Callback = function()
        local Configs = {}

        for Index, Option in pairs(SaveManager.Options) do
            pcall(function()
                if Option.Type == "Toggle"
                    or Option.Type == "Slider"
                    or Option.Type == "Dropdown"
                    or Option.Type == "Input"
                    or Option.Type == "Keybind" then

                    Configs[Index] = Option.Value
                elseif Option.Type == "Colorpicker" then
                    Configs[Index] = Option.Value:ToHex()
                end
            end)
        end

        local Output = "getgenv().Configs = {\n"

        for Index, Value in pairs(Configs) do
            local Key = string.format("[%q]", tostring(Index))

            if type(Value) == "string" then
                Output = Output .. "    " .. Key .. " = " .. string.format("%q", Value) .. ",\n"
            elseif type(Value) == "boolean" or type(Value) == "number" then
                Output = Output .. "    " .. Key .. " = " .. tostring(Value) .. ",\n"
            elseif type(Value) == "table" then
                Output = Output .. "    " .. Key .. " = {\n"

                for _, Item in pairs(Value) do
                    Output = Output .. "        " .. string.format("%q", tostring(Item)) .. ",\n"
                end

                Output = Output .. "    },\n"
            end
        end

        Output = Output .. "}"

        pcall(function()
            setclipboard(Output)
        end)
    end
})
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("MaruConfig")
InterfaceManager:BuildInterfaceSection(Tabs.Setting)
briggt1 = Tabs.Locations:AddToggle("briggt1", {Title = "Turn on Full Bright", Description = "", Default = false})

briggt1:OnChanged(function(Value)

  bright = Value

  if Value == true then

    Lighting.Ambient = Color3.new(1, 1, 1)

    Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)

    Lighting.ColorShift_Top = Color3.new(1, 1, 1)

  else

    Lighting.Ambient = Color3.new(0, 0, 0)

    Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)

    Lighting.ColorShift_Top = Color3.new(0, 0, 0)

  end  

end)



Cheat_DayNight = {"Day", "Night"}

DayN = Tabs.Locations:AddDropdown("DayN",{Title = "Select Time", Searchable = true, Values = Cheat_DayNight,Multi = false,Default = 1})

DayN:OnChanged(function(Value)

  _G.SelectDN = Value

end)

dayornight = Tabs.Locations:AddToggle("dayornight", {Title = "Turn on Time", Description = "", Default = false})

dayornight:OnChanged(function(Value)

  _G.daylightN = Value

end)

task.spawn(function()

  while task.wait() do

    if _G.daylightN then

      if _G.SelectDN == "Day" then

        Lighting.ClockTime = 12

      elseif _G.SelectDN == "Night" then

        Lighting.ClockTime = 0

      end

    end

  end

end)

walkWater = Tabs.Locations:AddToggle("walkWater", {Title = "Turn on Walk on Water", Description = "walk on water", Default = true})

walkWater:OnChanged(function(Value)

  _G.WalkWater_Part = Value

  if _G.WalkWater_Part then

    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)

  else

    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)

  end

end)

iceWalk = Tabs.Locations:AddToggle("iceWalk", {Title = "Turn on Ice Walk", Description = "Ice walk just like walk on water but have ice effect", Default = false})

iceWalk:OnChanged(function(Value)

  _G.WalkWater = Value

end)

spawn(function()

  while task.wait() do

    if _G.WalkWater then

      pcall(function()

	   if plr.Character and plr.Character:FindFirstChild("LeftFoot") then

	   local upval0 = replicated.Assets.Models.IceSpikes4:Clone()

        upval0.Parent = workspace

        upval0.Size = Vector3.new(3+math.random(10,12),1.7,3+math.random(10,12))

        upval0.Color = Color3.fromRGB(128,187,219)

        upval0.CFrame = CFrame.new(plr.Character.Head.Position.X,-3.8,plr.Character.Head.Position.Z)*CFrame.Angles((math.random()-0.5)*0.06, math.random()*7,(math.random()-0.5)*0.07)

        local var85={};

        var85.Size=Vector3.new(0,0.3,0)

        local var3=TW:Create(upval0,TweenInfo.new(2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),var85)

        var3.Completed:Connect(function()

          upval0:Destroy()

        end)

          var3:Play()

	    end	

      end)

    end

  end

end)

local player = game.Players.LocalPlayer

local function IsEntityAlive(entity)

    if not entity then return false end

    local humanoid = entity:FindFirstChild("Humanoid")

    return humanoid and humanoid.Health > 0

end

local function GetEnemiesInRange(character, range)

    local enemies = game:GetService("Workspace").Enemies:GetChildren()

    local players = game:GetService("Players"):GetPlayers()

    local targets = {}

    local playerPos = character:GetPivot().Position

    for _, enemy in ipairs(enemies) do

        local rootPart = enemy:FindFirstChild("HumanoidRootPart")

        if rootPart and IsEntityAlive(enemy) then

            local distance = (rootPart.Position - playerPos).Magnitude

            if distance <= range then

                table.insert(targets, enemy)

            end

        end

    end

    for _, otherPlayer in ipairs(players) do

        if otherPlayer ~= player and otherPlayer.Character then

            local rootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")

            if rootPart and IsEntityAlive(otherPlayer.Character) then

                local distance = (rootPart.Position - playerPos).Magnitude

                if distance <= range then

                    table.insert(targets, otherPlayer.Character)

                end

            end

        end

    end

    return targets

end


Tabs.Locations:AddSection("Configure - God")

function AttackNoCoolDown()

    local player = game:GetService("Players").LocalPlayer

    local character = player.Character

    if not character then return end

    local equippedWeapon = nil

    for _, item in ipairs(character:GetChildren()) do

        if item:IsA("Tool") then

            equippedWeapon = item

            break

        end

    end

    if not equippedWeapon then return end

    local enemiesInRange = GetEnemiesInRange(character, 60)

    if #enemiesInRange == 0 then return end

    local storage = game:GetService("ReplicatedStorage")

    local modules = storage:FindFirstChild("Modules")

    if not modules then return end

    local attackEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")

    local hitEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")

    if not attackEvent or not hitEvent then return end

    local targets, mainTarget = {}, nil

    for _, enemy in ipairs(enemiesInRange) do

        if not enemy:GetAttribute("IsBoat") then

            local HitboxLimbs = {"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand"}

            local head = enemy:FindFirstChild(HitboxLimbs[math.random(#HitboxLimbs)]) or enemy.PrimaryPart

            if head then

                table.insert(targets, { enemy, head })

                mainTarget = head

            end

        end

    end

    if not mainTarget then return end

    attackEvent:FireServer(0)

    local playerScripts = player:FindFirstChild("PlayerScripts")

    if not playerScripts then return end

    local localScript = playerScripts:FindFirstChildOfClass("LocalScript")

    while not localScript do

        playerScripts.ChildAdded:Wait()

        localScript = playerScripts:FindFirstChildOfClass("LocalScript")

    end

    local hitFunction

    if getsenv then

        local success, scriptEnv = pcall(getsenv, localScript)

        if success and scriptEnv then

            hitFunction = scriptEnv._G.SendHitsToServer

        end

    end

    local successFlags, combatRemoteThread = pcall(function()

        return require(modules.Flags).COMBAT_REMOTE_THREAD or false

    end)

    if successFlags and combatRemoteThread and hitFunction then

        hitFunction(mainTarget, targets)

    elseif successFlags and not combatRemoteThread then

        hitEvent:FireServer(mainTarget, targets)

    end

end

do
    local ok, shaker = pcall(function()
        local util = game:GetService("ReplicatedStorage"):FindFirstChild("Util")
        local module = util and util:FindFirstChild("CameraShaker")
        return module and require(module)
    end)
    if ok and shaker and type(shaker.Stop) == "function" then
        CameraShakerR = shaker
        pcall(function() shaker:Stop() end)
    end
end

get_Monster=function()for a,b in pairs(workspace.Enemies:GetChildren())do local c=b:FindFirstChild("UpperTorso")or b:FindFirstChild("Head")if b:FindFirstChild("HumanoidRootPart",true)and c then if(b.Head.Position-plr.Character.HumanoidRootPart.Position).Magnitude<=50 then return true,c.Position end end end;for a,d in pairs(workspace.SeaBeasts:GetChildren())do if d:FindFirstChild("HumanoidRootPart")and d:FindFirstChild("Health")and d.Health.Value>0 then return true,d.HumanoidRootPart.Position end end;for a,d in pairs(workspace.Enemies:GetChildren())do if d:FindFirstChild("Health")and d.Health.Value>0 and d:FindFirstChild("VehicleSeat")then return true,d.Engine.Position end end end

Actived=function()local a=game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")for b,c in next,getconnections(a.Activated)do if typeof(c.Function)=='function'then getupvalues(c.Function)end end end

task.spawn(function()

  RunSer.Heartbeat:Connect(function()

    pcall(function()      

      if not _G.Seriality then return end      

      AttackNoCoolDown() 

      local Pretool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

      local ToolTip = Pretool.ToolTip

      local MobAura, Mon = get_Monster()      

      if ToolTip == "Blox Fruit" then

        if MobAura then           

          local LeftClickRemote = Pretool:FindFirstChild('LeftClickRemote');

          if LeftClickRemote then Actived() LeftClickRemote:FireServer(Vector3.new(0.01,-500,0.01),1,true);LeftClickRemote:FireServer(false)end

        end     		                         

      end      

    end)

  end)

end)


Tabs.Dungeons:AddSection("Farm")

local Q = Tabs.Dungeons:AddToggle("Q", {Title = "Auto Unlock Dough dungeon", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Doughv2 = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.Doughv2 then

      pcall(function()

	    if not workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then

	      if GetBP("Red Key") then

	        replicated.Remotes.CommF_:InvokeServer("CakeScientist","Check")

	        replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Check")

		  end

	    elseif workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then

          if GetBP("Red Key") then

		    repeat wait() _tp(CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)) until not _G.Doughv2 or (plr.Character.HumanoidRootPart.CFrame - CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)).Magnitude <= 5

		    EquipWeapon("Red Key")

		  end

		  elseif GetConnectionEnemies("Dough King") then

		    local v = GetConnectionEnemies("Dough King")

            if v then

              repeat wait() Attack.Kill(v,_G.Doughv2) until not _G.Doughv2 or not v.Parent or v.Humanoid.Health <= 0

            else

              _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 

            end

	      end

		  if GetBP("Sweet Chalice") then

		    replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)

		    _G.AutoMiror = true

	      else

	        _G.AutoMiror = false

          end

	      if GetBP("God's Chalice") and GetM("Conjured Cocoa") >= 10 then

		    replicated.Remotes.CommF_:InvokeServer("SweetChaliceNpc")

		  end

	      if not plr.Backpack:FindFirstChild("God's Chalice") or plr.Character:FindFirstChild("God's Chalice") then

	        _G.FarmEliteHunt = true

		  else

		    _G.FarmEliteHunt = false

		  end

	      if GetM("Conjured Cocoa") <= 10 then	        

		  local cocoa3 = {"Cocoa Warrior","Chocolate Bar Battler"}

		  local v = GetConnectionEnemies(cocoa3)

            if v then

            repeat wait() Attack.Kill(v,_G.Doughv2) until _G.Doughv2 == false or not v.Parent or v.Humanoid.Health <= 0

          else

            _tp(CFrame.new(402.7189025878906, 81.06050109863281, -12259.54296875))

          end	      

        end

      end)

    end

  end

end)

local Q = Tabs.Dungeons:AddToggle("Q", {Title = "Auto Unlock Phoenix dungeon", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoPhoenixF = Value

end)

spawn(function()

  while wait(.1) do

    if _G.AutoPhoenixF then

      pcall(function()

        if GetBP("Bird-Bird: Phoenix") then

          if plr.Backpack:FindFirstChild(plr.Data.DevilFruit.Value) then

            if plr.Backpack:FindFirstChild(plr.Data.DevilFruit.Value).Level.Value >= 400 then

               _tp(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))

               if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then

                 replicated.Remotes.CommF_:InvokeServer("SickScientist","Check")

                 replicated.Remotes.CommF_:InvokeServer("SickScientist","Heal")

               end

             end

             elseif plr.Character:FindFirstChild(plr.Data.DevilFruit.Value) then

             if plr.Character:FindFirstChild(plr.Data.DevilFruit.Value).Level.Value >= 400 then

               _tp(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))

              if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then

                replicated.Remotes.CommF_:InvokeServer("SickScientist","Check")

                replicated.Remotes.CommF_:InvokeServer("SickScientist","Heal")

              end

            end

          end

        end

      end)

    end 

  end

end)


DungeonTables = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"}

local Q = Tabs.Dungeons:AddDropdown("Q",{Title = "Select Chip", Searchable = true, Values = DungeonTables,Multi = false,Default = 1})

Q:OnChanged(function(Value)

  _G.SelectChip = Value

end)

local Q = Tabs.Dungeons:AddToggle("Q", {Title = "Auto Select Dungeon Chip", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.AutoSelectDungeon = Value

end)

spawn(function()

  while wait(Sec) do

    if _G.AutoSelectDungeon then

      pcall(function()

        if GetBP("Flame-Flame") then

          _G.SelectChip = "Flame"

        elseif GetBP("Ice-Ice") then

          _G.SelectChip = "Ice"

        elseif GetBP("Quake-Quake") then

          _G.SelectChip = "Quake"

        elseif GetBP("Light-Light") then

          _G.SelectChip = "Light"

        elseif GetBP("Dark-Dark") then

          _G.SelectChip = "Dark"

        elseif GetBP("String-String") then

          _G.SelectChip = "String"

        elseif GetBP("Rumble-Rumble") then

          _G.SelectChip = "Rumble"

         elseif GetBP("Magma-Magma") then

          _G.SelectChip = "Magma"

         elseif GetBP("Human-Human: Buddha Fruit") then

          _G.SelectChip = "Human: Buddha"

        elseif GetBP("Dough-Dough") then

          _G.SelectChip = "Dough"

        elseif GetBP("Sand-Sand") then

          _G.SelectChip = "Sand"

        elseif GetBP("Bird-Bird: Phoenix") then

          _G.SelectChip = "Bird: Phoenix"

        else

          _G.SelectChip = "Ice"

        end

      end)

    end

  end

end)

Tabs.Dungeons:AddButton({Title = "Buy Dungeon Chips [Beli]", Description = "",

Callback = function()

  if not GetBP("Special Microchip") then replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip) end

end})

Tabs.Dungeons:AddButton({Title = "Buy Dungeon Chips [Devil Fruit]", Description = "Use your lowest fruit in your bag",

Callback = function()

  if GetBP("Special Microchip") then return end

  local FruitPrice = {}

  local FruitStore = {}

  for i,v in next,replicated:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do

    if v.Price <= 490000 then table.insert(FruitPrice,v.Name) end 

  end    

  for _,y in pairs(FruitPrice) do    

    for i,v in pairs(DungeonTables) do 

      if not GetBP("Special Microchip") then     

        replicated.Remotes.CommF_:InvokeServer("LoadFruit",tostring(y))	      

	    replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)	

	  end            

    end    

  end

end})


Tabs.Dungeons:AddSection("Raiding Menu")

local Q = Tabs.Dungeons:AddToggle("Q", {Title = "Auto Start Raid", Description = "", Default = false})

Q:OnChanged(function(Value)

  _G.Auto_StartRaid = Value

end)

spawn(function()

  while wait(Sec) do

    pcall(function()

      if _G.Auto_StartRaid then

        if plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then

          if GetBP("Special Microchip") then

            if World2 then

              _tp(CFrame.new(-6438.73535, 250.645355, -4501.50684))

              fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)

            elseif World3 then                   

              replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))

              fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)

            end

          end

        end

      end

    end)

  end

end)

Window:SelectTab(1)
local AutoConfigName = "Phuocmaru"

SaveManager:SetLibrary(Fluent)
SaveManager:SetFolder("MaruConfig")

task.defer(function()
pcall(function()
SaveManager:Load(AutoConfigName)
end)
end)

task.spawn(function()
while task.wait(1) do
pcall(function()
SaveManager:Save(AutoConfigName)
end)

pcall(function()  
        InterfaceManager:SaveSettings()  
    end)  
end

end)