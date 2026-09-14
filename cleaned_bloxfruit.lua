-- by kuri
local U = table.unpack or unpack
local gs = {} -- global state
local fn  = {} -- function table

fn_1 = function(...)
  fn_2 = function(...)
    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    return
  end
  fn_3 = function(...)
    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    return
  end
  fn_4 = function(...)
    local _,  a1 = ...
    gs_c4_1 = a1
    if not gs_c4_1 then return end
    if (plr.Backpack:FindFirstChild(gs_c4_1)) then
      plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(gs_c4_1))
    end
    return
  end
  fn_5 = function(...)
    local _,  a1 = ...
        gs_c5_1 = a1
    for _key, item in pairs(plr.Backpack:GetChildren()) do
      gs_c5_1 = _key
      gs_c5_2 = item
      if (gs_c5_2:IsA("Tool")) then
      if (gs_c5_2.ToolTip == gs_c1_1) then
      EquipWeapon(gs_c5_2.Name)
      end
      end
    end
    return
  end
  fn_6 = function(...)
    local _,  a1 = ...
      gs_c6_1 = a1
    if not gs_c6_1 then return end
    gs_c6_2 = gs_c6_1:FindFirstChild("Humanoid")
    local tmp926 = gs_c6_2
    if gs_c6_2 then
      tmp926 = gs_c6_2.Health > 0
    end
    return tmp926
  end
  fn_7 = function(...)
    local _,  a1, a2 = ...
    gs_c7_1 = a1
    gs_c7_2 = a2
    return (Root.Position - mode.Position).Magnitude <= gs_c7_2
  end
  fn_8 = function(...)
    local _,  a1, a2 = ...
    gs_c8_1 = a1
    gs_c8_2 = a2
    return (Root.Position - (gs_c8_1:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= gs_c8_2
  end
  fn_9 = function(...)
    local _,  a1, a2 = ...
    gs_c9_1 = a1
    gs_c9_2 = a2
    return (Root.Position - (gs_c9_1:FindFirstChild("HumanoidRootPart")).Position).Magnitude > gs_c9_2
  end
  fn_10 = function(...)
    local _,  a1, a2 = ...
      gs_c10_1 = a1
    gs_c10_2 = a2
    local tmp925 = gs_c10_1
    if gs_c10_1 then
      tmp925 = gs_c10_2
    end
    if tmp925 then
      if not (gs_c10_1:GetAttribute("Locked")) then
        gs_c10_1:SetAttribute("Locked", gs_c10_1.HumanoidRootPart.CFrame)
      end
      PosMon = (gs_c10_1:GetAttribute("Locked")).Position
      BringEnemy()
      EquipWeapon(_G.SelectWeapon)
      gs_10_1_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
      gs_10_1_2 = gs_10_1_1.ToolTip
      if (gs_10_1_2 == "Blox Fruit") then
        _tp((gs_c10_1.HumanoidRootPart.CFrame * (CFrame.new(0, 10, 0))) * (CFrame.Angles(0, math.rad(90), 0)))
      else
        _tp((gs_c10_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 0))) * (CFrame.Angles(0, math.rad(180), 0)))
      end
      if RandomCFrame then
        wait(0.5)
        _tp(gs_c10_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 25)))
        wait(0.5)
        _tp(gs_c10_1.HumanoidRootPart.CFrame * (CFrame.new(25, 30, 0)))
        wait(0.5)
        _tp(gs_c10_1.HumanoidRootPart.CFrame * (CFrame.new(-25, 30, 0)))
        wait(0.5)
        _tp(gs_c10_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 25)))
        wait(0.5)
        _tp(gs_c10_1.HumanoidRootPart.CFrame * (CFrame.new(-25, 30, 0)))
      end
    end
    return
  end
  fn_11 = function(...)
    local _,  a1, a2 = ...
      gs_c11_1 = a1
    gs_c11_2 = a2
    local tmp924 = gs_c11_1
    if gs_c11_1 then
      tmp924 = gs_c11_2
    end
    if tmp924 then
      if not (gs_c11_1:GetAttribute("Locked")) then
        gs_c11_1:SetAttribute("Locked", gs_c11_1.HumanoidRootPart.CFrame)
      end
      PosMon = (gs_c11_1:GetAttribute("Locked")).Position
      BringEnemy()
      EquipWeapon(_G.SelectWeapon)
      gs_11_1_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
      gs_11_1_2 = gs_11_1_1.ToolTip
      if (gs_11_1_2 == "Blox Fruit") then
        _tp((gs_c11_1.HumanoidRootPart.CFrame * (CFrame.new(0, 10, 0))) * (CFrame.Angles(0, math.rad(90), 0)))
      else
        _tp((gs_c11_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 8))) * (CFrame.Angles(0, math.rad(180), 0)))
      end
      if RandomCFrame then
        wait(0.1)
        _tp(gs_c11_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 25)))
        wait(0.1)
        _tp(gs_c11_1.HumanoidRootPart.CFrame * (CFrame.new(25, 30, 0)))
        wait(0.1)
        _tp(gs_c11_1.HumanoidRootPart.CFrame * (CFrame.new(-25, 30, 0)))
        wait(0.1)
        _tp(gs_c11_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 25)))
        wait(0.1)
        _tp(gs_c11_1.HumanoidRootPart.CFrame * (CFrame.new(-25, 30, 0)))
      end
    end
    return
  end
  fn_12 = function(...)
    local _,  a1, a2 = ...
      gs_c12_1 = a1
    gs_c12_2 = a2
    local tmp923 = gs_c12_1
    if gs_c12_1 then
      tmp923 = gs_c12_2
    end
    if tmp923 then
      if not (gs_c12_1:GetAttribute("Locked")) then
        gs_c12_1:SetAttribute("Locked", gs_c12_1.HumanoidRootPart.CFrame)
      end
      PosMon = (gs_c12_1:GetAttribute("Locked")).Position
      BringEnemy()
      EquipWeapon(_G.SelectWeapon)
      gs_12_1_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
      gs_12_1_2 = gs_12_1_1.ToolTip
      if (gs_12_1_2 == "Blox Fruit") then
        _tp((gs_c12_1.HumanoidRootPart.CFrame * (CFrame.new(0, 10, 0))) * (CFrame.Angles(0, math.rad(90), 0)))
      else
        notween(gs_c12_1.HumanoidRootPart.CFrame * (CFrame.new(0, 50, 8)))
        wait(0.85)
        notween(gs_c12_1.HumanoidRootPart.CFrame * (CFrame.new(0, 400, 0)))
        wait(1)
      end
    end
    return
  end
  fn_13 = function(...)
    local _,  a1, a2 = ...
      gs_c13_1 = a1
    gs_c13_2 = a2
    local tmp922 = gs_c13_1
    if gs_c13_1 then
      tmp922 = gs_c13_2
    end
    if tmp922 then
      if not (gs_c13_1:GetAttribute("Locked")) then
        gs_c13_1:SetAttribute("Locked", gs_c13_1.HumanoidRootPart.CFrame)
      end
      PosMon = (gs_c13_1:GetAttribute("Locked")).Position
      BringEnemy()
      weaponSc("Sword")
      _tp(gs_c13_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 0)))
      if RandomCFrame then
        wait(0.1)
        _tp(gs_c13_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 25)))
        wait(0.1)
        _tp(gs_c13_1.HumanoidRootPart.CFrame * (CFrame.new(25, 30, 0)))
        wait(0.1)
        _tp(gs_c13_1.HumanoidRootPart.CFrame * (CFrame.new(-25, 30, 0)))
        wait(0.1)
        _tp(gs_c13_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 25)))
        wait(0.1)
        _tp(gs_c13_1.HumanoidRootPart.CFrame * (CFrame.new(-25, 30, 0)))
      end
    end
    return
  end
  fn_14 = function(...)
    local _,  a1, a2 = ...
      gs_c14_1 = a1
    gs_c14_2 = a2
    local tmp921 = gs_c14_1
    if gs_c14_1 then
      tmp921 = gs_c14_2
    end
    if tmp921 then
      if not (gs_c14_1:GetAttribute("Locked")) then
        gs_c14_1:SetAttribute("Locked", gs_c14_1.HumanoidRootPart.CFrame)
      end
      PosMon = (gs_c14_1:GetAttribute("Locked")).Position
      BringEnemy()
      if (gs_c14_1.Humanoid.Health <= HealthM) then
        _tp(gs_c14_1.HumanoidRootPart.CFrame * (CFrame.new(0, 20, 0)))
        Useskills("Blox Fruit", "Z")
        Useskills("Blox Fruit", "X")
        Useskills("Blox Fruit", "C")
      else
        weaponSc("Melee")
        _tp(gs_c14_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 0)))
      end
    end
    return
  end
  fn_15 = function(...)
    local _,  a1, a2 = ...
      gs_c15_1 = a1
    gs_c15_2 = a2
    local tmp920 = gs_c15_1
    if gs_c15_1 then
      tmp920 = gs_c15_2
    end
    if tmp920 then
      if not (gs_c15_1:GetAttribute("Locked")) then
        gs_c15_1:SetAttribute("Locked", gs_c15_1.HumanoidRootPart.CFrame)
      end
      PosMon = (gs_c15_1:GetAttribute("Locked")).Position
      BringEnemy()
      if (gs_c15_1.Humanoid.Health <= HealthM) then
        _tp(gs_c15_1.HumanoidRootPart.CFrame * (CFrame.new(0, 35, 8)))
        Useskills("Gun", "Z")
        Useskills("Gun", "X")
      else
        weaponSc("Melee")
        _tp(gs_c15_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 0)))
      end
    end
    return
  end
  fn_16 = function(...)
    local _,  a1, a2 = ...
    gs_c16_1 = a1
    gs_c16_2 = a2
    if (gs_c16_1 == "Melee") then
      if (plr.Data.Points.Value ~= 0) then
        replicated.Remotes.CommF_:InvokeServer("AddPoint", "Melee", gs_c16_2)
      end
      goto L115075
    end
    if (gs_c16_1 == "Defense") then
      if (plr.Data.Points.Value ~= 0) then
        replicated.Remotes.CommF_:InvokeServer("AddPoint", "Defense", gs_c16_2)
      end
      goto L115075
    end
    if (gs_c16_1 == "Sword") then
      if (plr.Data.Points.Value ~= 0) then
        replicated.Remotes.CommF_:InvokeServer("AddPoint", "Sword", gs_c16_2)
      end
      goto L115075
    end
    if (gs_c16_1 == "Gun") then
      if (plr.Data.Points.Value ~= 0) then
        replicated.Remotes.CommF_:InvokeServer("AddPoint", "Gun", gs_c16_2)
      end
      goto L115075
    end
    if not (gs_c16_1 == "Devil") then goto L115075 end
    if (plr.Data.Points.Value ~= 0) then
      replicated.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", gs_c16_2)
    end
    ::L115075::
    return
  end
  fn_17 = function(...)
    local _,  a1 = ...
            fn_997 = function(...)
      local _,  a1 = ...
          gs_c997_1 = a1
      gs_c997_2 = gs_c997_1:FindFirstChildOfClass("Humanoid")
      gs_c997_3 = gs_c997_1:FindFirstChild("HumanoidRootPart")
      local tmp919 = gs_c997_2
      if not gs_c997_2 then goto L114851 end
      tmp919 = gs_c997_3
      if not gs_c997_3 then goto L114851 end
      tmp919 = gs_c997_2.Health > 0
      ::L114851::
      return tmp919, gs_c997_3, gs_c997_2
    end
    fn_998 = function(...)
      local _,  a1 = ...
          gs_c998_1 = a1
      if isnetworkowner then return {isnetworkowner(gs_c998_1)} end
      local tmp918 = gs_c998_1.ReceiveAge == 0
      if not (gs_c998_1.ReceiveAge == 0) then goto L114793 end
      tmp918 = not gs_c998_1.Anchored
      if not not gs_c998_1.Anchored then goto L114793 end
      tmp918 = gs_c998_1.Velocity.Magnitude > 0
      ::L114793::
      return tmp918
    end
    fn_999 = function(...)
          local _t2
      local _t3
      local _t4
                  if sethiddenproperty then
        sethiddenproperty(plr, "SimulationRadius", math.huge)
      end
      gs_c999_1 = gs_c17_1.HumanoidRootPart.Position
      _iter = {ipairs(workspace.Enemies:GetChildren())}
      ::L114512::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L114708
      end
      gs_c999_1 = _loopkey
      gs_c999_2 = _loopval
      if (gs_c999_2 ~= gs_c1_1) then
        gs_999_3_1 = gs_c1_3(gs_c999_2)
        gs_999_3_2 = ({gs_c1_3(gs_c999_2)})[2]
        gs_999_3_3 = ({gs_c1_3(gs_c999_2)})[3]
        local tmp911 = gs_999_3_1
        if gs_999_3_1 then
          tmp911 = gs_c999_2.Name == gs_c1_1.Name
        end
        if tmp911 then
          gs_999_4_1 = (gs_999_3_2.Position - gs_c17_1).Magnitude
          if (gs_999_4_1 <= 3000) then
            gs_999_5_1 = gs_999_3_2:FindFirstChild("BodyVelocity")
            if not gs_999_5_1 then
              gs_999_5_1 = Instance.new("BodyVelocity")
              gs_999_5_1.Name = "BodyVelocity"
              gs_999_5_1.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000)
              gs_999_5_1.Velocity = Vector3.zero
              gs_999_5_1.Parent = gs_999_3_2
              local tmp912 = gs_999_5_1
            end
            if (gs_999_4_1 <= 10) then
              gs_c1_2 = true
            end
            if not gs_c1_2 then
            end
            if j114669_1_5 then
              gs_999_3_2.CFrame = CFrame.new(gs_c17_1)
            end
            gs_999_3_2.CanCollide = false
            gs_999_3_3.WalkSpeed = 0
            gs_999_3_3.JumpPower = 0
            local tmp913 = tmp912
          end
          local tmp914 = tmp913
        end
        local tmp915 = tmp914
      end
      goto L114512
      ::L114708::
      local tmp916 = gs_c999_1
      if gs_c999_1 then
        tmp916 = gs_c999_1:FindFirstChild("HumanoidRootPart")
      end
      if tmp916 then
        _t2 = gs_c999_1.HumanoidRootPart
        _t2.CanCollide = false
        _t3 = gs_c999_1.Humanoid
        _t3.WalkSpeed = 0
        _t4 = gs_c999_1.Humanoid
        _t4.JumpPower = 0
        local tmp917 = gs_c999_1.HumanoidRootPart
      end
      return
    end
    gs_c17_1 = a1
    if not _B then return end
    if not not gs_c17_1 then goto L114434 end
    local tmp909 = plr.Character
    if plr.Character then
      tmp909 = plr.Character:FindFirstChild("HumanoidRootPart")
    end
    gs_17_2_1 = tmp909
    if not gs_17_2_1 then return end
    gs_17_2_2 = math.huge
    _iter = {ipairs(workspace.Enemies:GetChildren())}
    ::L114327::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L114425
    end
    gs_17_2_1 = _loopkey
    gs_17_2_2 = _loopval
    gs_17_2_3 = gs_17_2_2:FindFirstChildOfClass("Humanoid")
    gs_17_2_4 = gs_17_2_2:FindFirstChild("HumanoidRootPart")
    local tmp910 = gs_17_2_3
    if not gs_17_2_3 then goto L114390 end
    tmp910 = gs_17_2_4
    if not gs_17_2_4 then goto L114390 end
    tmp910 = gs_17_2_3.Health > 0
    ::L114390::
    if tmp910 then
      gs_17_5_1 = (gs_17_2_4.Position - gs_c17_1.Position).Magnitude
      if (gs_17_5_1 < gs_c17_2) then
        gs_c17_2 = gs_17_5_1
        gs_c1_1 = gs_17_2_2
      end
    end
    goto L114327
    ::L114425::
    if not gs_17_2_1 then return end
    ::L114434::
    gs_c17_2 = false
    gs_c17_3 = fn_997
    gs_c17_4 = fn_998
    pcall(fn_999)
    return
  end
  fn_18 = function(...)
    local _,  a1, a2 = ...
      gs_c18_1 = a1
    gs_c18_2 = a2
    if not (gs_c18_1 == "Melee") then goto L113789 end
    weaponSc("Melee")
    if (gs_c18_2 == "Z") then
      vim1:SendKeyEvent(true, "Z", false, game)
      vim1:SendKeyEvent(false, "Z", false, game)
      goto L113787
    end
    if (gs_c18_2 == "X") then
      vim1:SendKeyEvent(true, "X", false, game)
      vim1:SendKeyEvent(false, "X", false, game)
      goto L113787
    end
    if not (gs_c18_2 == "C") then goto L113787 end
    vim1:SendKeyEvent(true, "C", false, game)
    vim1:SendKeyEvent(false, "C", false, game)
    ::L113787::
    goto L114189
    ::L113789::
    if not (gs_c18_1 == "Sword") then goto L113893 end
    weaponSc("Sword")
    if (gs_c18_2 == "Z") then
      vim1:SendKeyEvent(true, "Z", false, game)
      vim1:SendKeyEvent(false, "Z", false, game)
      goto L113891
    end
    if not (gs_c18_2 == "X") then goto L113891 end
    vim1:SendKeyEvent(true, "X", false, game)
    vim1:SendKeyEvent(false, "X", false, game)
    ::L113891::
    goto L114189
    ::L113893::
    if not (gs_c18_1 == "Blox Fruit") then goto L114085 end
    weaponSc("Blox Fruit")
    if (gs_c18_2 == "Z") then
      vim1:SendKeyEvent(true, "Z", false, game)
      vim1:SendKeyEvent(false, "Z", false, game)
      goto L114083
    end
    if (gs_c18_2 == "X") then
      vim1:SendKeyEvent(true, "X", false, game)
      vim1:SendKeyEvent(false, "X", false, game)
      goto L114083
    end
    if (gs_c18_2 == "C") then
      vim1:SendKeyEvent(true, "C", false, game)
      vim1:SendKeyEvent(false, "C", false, game)
      goto L114083
    end
    if not (gs_c18_2 == "V") then goto L114083 end
    vim1:SendKeyEvent(true, "V", false, game)
    vim1:SendKeyEvent(false, "V", false, game)
    ::L114083::
    goto L114189
    ::L114085::
    if not (gs_c18_1 == "Gun") then goto L114189 end
    weaponSc("Gun")
    if (gs_c18_2 == "Z") then
      vim1:SendKeyEvent(true, "Z", false, game)
      vim1:SendKeyEvent(false, "Z", false, game)
      goto L114187
    end
    if not (gs_c18_2 == "X") then goto L114187 end
    vim1:SendKeyEvent(true, "X", false, game)
    vim1:SendKeyEvent(false, "X", false, game)
    ::L114187::
    ::L114189::
    local tmp908 = gs_c18_1 == "nil"
    if (gs_c18_1 == "nil") then
      tmp908 = gs_c18_2 == "Y"
    end
    if tmp908 then
      vim1:SendKeyEvent(true, "Y", false, game)
      vim1:SendKeyEvent(false, "Y", false, game)
    end
    return
  end
  fn_19 = function(...)
    local Ag = {...}
              gs_c19_1 = getnamecallmethod()
    gs_c19_2 = ({{unpack(Ag)}})[1]
    if not ((tostring(gs_c19_1)) == "FireServer") then goto L113626 end
    if not ((tostring(gs_c19_2[1])) == "RemoteEvent") then goto L113624 end
    local tmp903 = (tostring(gs_c19_2[2])) ~= "true"
    if ((tostring(gs_c19_2[2])) ~= "true") then
      tmp903 = (tostring(gs_c19_2[2])) ~= "false"
    end
    if not tmp903 then goto L113622 end
    local tmp904 = _G.FarmMastery_G
    if _G.FarmMastery_G then
      tmp904 = not SoulGuitar
    end
    local tmp907 = tmp904
    if tmp904 then goto L113596 end
    tmp907 = _G.FarmMastery_Dev
    if _G.FarmMastery_Dev then goto L113596 end
    tmp907 = _G.FarmBlazeEM
    if _G.FarmBlazeEM then goto L113596 end
    tmp907 = _G.Prehis_Skills
    if _G.Prehis_Skills then goto L113596 end
    local tmp905 = _G.SeaBeast1
    if _G.SeaBeast1 then goto L113566 end
    tmp905 = _G.FishBoat
    if _G.FishBoat then goto L113566 end
    tmp905 = _G.PGB
    if _G.PGB then goto L113566 end
    tmp905 = _G.Leviathan1
    if _G.Leviathan1 then goto L113566 end
    tmp905 = _G.Complete_Trials
    ::L113566::
    tmp907 = tmp905
    if tmp905 then goto L113596 end
    local tmp906 = _G.AimMethod
    if _G.AimMethod then
      tmp906 = ABmethod == "Aim Player"
    end
    tmp907 = tmp906
    if tmp906 then goto L113596 end
    tmp907 = _G.AimMethod
    if not _G.AimMethod then goto L113596 end
    tmp907 = ABmethod == "Nearest Aim"
    ::L113596::
    if tmp907 then
      gs_c19_2[2] = MousePos
      return gs_c19_2, gs_c1_15(unpack(gs_c19_2))
    end
    ::L113622::
    ::L113624::
    ::L113626::
    return gs_c1_15(unpack(Ag))
  end
  fn_20 = function(...)
    local _,  a1 = ...
                        gs_c20_1 = a1
    for _key, item in pairs(replicated:GetChildren()) do
      gs_c20_1 = _key
      gs_c20_2 = item
      local tmp899 = gs_c20_2:IsA("Model")
      if not (gs_c20_2:IsA("Model")) then goto L113280 end
      local tmp897 = (typeof(gs_c1_1)) == "table"
      if ((typeof(gs_c1_1)) == "table") then
      tmp897 = table.find(gs_c1_1, gs_c20_2.Name)
      end
      local tmp898 = tmp897
      if not (tmp897) then
      tmp898 = gs_c20_2.Name == gs_c1_1
      end
      tmp899 = tmp898
      if not tmp898 then goto L113280 end
      tmp899 = gs_c20_2:FindFirstChild("Humanoid")
      if not (gs_c20_2:FindFirstChild("Humanoid")) then goto L113280 end
      tmp899 = gs_c20_2.Humanoid.Health > 0
      ::L113280::
      if tmp899 then return {gs_c20_2} end
    end
    _iter = {next, game.Workspace.Enemies:GetChildren()}
    ::L113312::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L113411
    end
    gs_20_1_1 = _loopkey
    gs_20_1_2 = _loopval
    local tmp902 = gs_20_1_2:IsA("Model")
    if not (gs_20_1_2:IsA("Model")) then goto L113402 end
    local tmp900 = (typeof(gs_c20_1)) == "table"
    if ((typeof(gs_c20_1)) == "table") then
      tmp900 = table.find(gs_c20_1, gs_20_1_2.Name)
    end
    local tmp901 = tmp900
    if not (tmp900) then
      tmp901 = gs_20_1_2.Name == gs_c20_1
    end
    tmp902 = tmp901
    if not tmp901 then goto L113402 end
    tmp902 = gs_20_1_2:FindFirstChild("Humanoid")
    if not (gs_20_1_2:FindFirstChild("Humanoid")) then goto L113402 end
    tmp902 = gs_20_1_2.Humanoid.Health > 0
    ::L113402::
    if tmp902 then return {gs_20_1_2} end
    goto L113312
    ::L113411::
    return
  end
  fn_21 = function(...)
    local _t1
                                              gs_c21_1 = true
    gs_c21_2 = game
    gs_c21_3 = gs_c21_2.Workspace
    gs_c21_4 = gs_c21_2.Lighting
    gs_c21_5 = gs_c21_3.Terrain
    gs_c21_5.WaterWaveSize = 0
    gs_c21_5.WaterWaveSpeed = 0
    gs_c21_5.WaterReflectance = 0
    gs_c21_5.WaterTransparency = 0
    gs_c21_4.GlobalShadows = false
    gs_c21_4.FogEnd = 9000000000.0
    gs_c21_4.Brightness = 0
    _t1 = (settings()).Rendering
    _t1.QualityLevel = "Level01"
    _iter = gs_c21_5
    h112737_0_2 = gs_c21_5
    h112737_0_3 = gs_c21_5
    h112737_0_4 = gs_c21_5
    h112737_0_5 = gs_c21_4
    h112737_0_6 = gs_c21_4
    h112737_0_7 = gs_c21_4
    h112737_0_8 = (settings()).Rendering
    h112737_0_9 = {pairs(gs_c21_2.GetDescendants(gs_c21_2))}
    ::L112737::
    _k2 = {h112737_0_9[1](h112737_0_9[2], h112737_0_9[3])}
    h112737_0_9[3] = _k2[1]
    if not (_k2[1] == nil) then
      goto L113040
    end
    gs_c21_1 = h112737_0_9[1]
    gs_c21_2 = h112737_0_9[2]
    local tmp890 = gs_c21_2:IsA("Part")
    if gs_c21_2:IsA("Part") then goto L112808 end
    tmp890 = gs_c21_2:IsA("Union")
    if gs_c21_2:IsA("Union") then goto L112808 end
    tmp890 = gs_c21_2:IsA("CornerWedgePart")
    if gs_c21_2:IsA("CornerWedgePart") then goto L112808 end
    tmp890 = gs_c21_2:IsA("TrussPart")
    ::L112808::
    if tmp890 then
      gs_c21_2.Material = "Plastic"
      gs_c21_2.Reflectance = 0
      local tmp894 = gs_c21_2
      goto L113037
    end
    local tmp891 = gs_c21_2:IsA("Decal")
    if gs_c21_2:IsA("Decal") then goto L112855 end
    tmp891 = gs_c21_2:IsA("Texture")
    if not (gs_c21_2:IsA("Texture")) then goto L112855 end
    tmp891 = gs_c1_1
    ::L112855::
    if tmp891 then
      gs_c21_2.Transparency = 1
      tmp894 = gs_c21_2
      goto L113037
    end
    local tmp892 = gs_c21_2:IsA("ParticleEmitter")
    if not (gs_c21_2:IsA("ParticleEmitter")) then
      tmp892 = gs_c21_2:IsA("Trail")
    end
    if tmp892 then
      gs_c21_2.Lifetime = NumberRange.new(0)
      tmp894 = gs_c21_2
      goto L113037
    end
    if (gs_c21_2:IsA("Explosion")) then
      gs_c21_2.BlastPressure = 1
      gs_c21_2.BlastRadius = 1
      tmp894 = gs_c21_2
      goto L113037
    end
    local tmp893 = gs_c21_2:IsA("Fire")
    if gs_c21_2:IsA("Fire") then goto L112998 end
    tmp893 = gs_c21_2:IsA("SpotLight")
    if gs_c21_2:IsA("SpotLight") then goto L112998 end
    tmp893 = gs_c21_2:IsA("Smoke")
    if gs_c21_2:IsA("Smoke") then goto L112998 end
    tmp893 = gs_c21_2:IsA("Sparkles")
    ::L112998::
    if tmp893 then
      gs_c21_2.Enabled = false
      tmp894 = gs_c21_2
      goto L113037
    end
    if not (gs_c21_2:IsA("MeshPart")) then goto L113037 end
    gs_c21_2.Material = "Plastic"
    gs_c21_2.Reflectance = 0
    gs_c21_2.TextureID = 1.0385902758728956e+16
    tmp894 = gs_c21_2
    ::L113037::
    goto L112737
    ::L113040::
    _iter = {pairs(gs_21_1_4:GetChildren())}
    ::L113063::
    _k3 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k3[1]
    if not (_k3[1] == nil) then
      goto L113162
    end
    gs_21_1_1 = _loopkey
    gs_21_1_2 = _loopval
    local tmp895 = gs_21_1_2:IsA("BlurEffect")
    if gs_21_1_2:IsA("BlurEffect") then goto L113150 end
    tmp895 = gs_21_1_2:IsA("SunRaysEffect")
    if gs_21_1_2:IsA("SunRaysEffect") then goto L113150 end
    tmp895 = gs_21_1_2:IsA("ColorCorrectionEffect")
    if gs_21_1_2:IsA("ColorCorrectionEffect") then goto L113150 end
    tmp895 = gs_21_1_2:IsA("BloomEffect")
    if gs_21_1_2:IsA("BloomEffect") then goto L113150 end
    tmp895 = gs_21_1_2:IsA("DepthOfFieldEffect")
    ::L113150::
    if tmp895 then
      gs_21_1_2.Enabled = false
      local tmp896 = gs_21_1_2
    end
    goto L113063
    ::L113162::
    return
  end
  fn_22 = function(...)
      local tmp889 = GetBP("Dragon-Dragon")
    if GetBP("Dragon-Dragon") then goto L112625 end
    tmp889 = GetBP("Gas-Gas")
    if GetBP("Gas-Gas") then goto L112625 end
    tmp889 = GetBP("Yeti-Yeti")
    if GetBP("Yeti-Yeti") then goto L112625 end
    tmp889 = GetBP("Kitsune-Kitsune")
    if GetBP("Kitsune-Kitsune") then goto L112625 end
    tmp889 = GetBP("T-Rex-T-Rex")
    ::L112625::
    if tmp889 then return {true} end
    return
  end
  fn_23 = function(...)
        for _key, item in pairs(workspace.Boats:GetChildren()) do
          gs_c23_1 = _key
          gs_c23_2 = item
          if ((tostring(gs_c23_2.Owner.Value)) == (tostring(plr.Name))) then return {gs_c23_2} end
        end
    return false
  end
  fn_24 = function(...)
          for _key, item in pairs(workspace.Enemies:GetChildren()) do
            gs_c24_1 = _key
            gs_c24_2 = item
            local tmp888 = gs_c24_2.Name == "FishBoat"
            if (gs_c24_2.Name == "FishBoat") then
            tmp888 = (gs_c24_2:FindFirstChild("Health")).Value > 0
            end
            if tmp888 then return {true} end
          end
    return false
  end
  fn_25 = function(...)
            for _key, item in pairs(workspace.Enemies:GetChildren()) do
              gs_c25_1 = _key
              gs_c25_2 = item
              local tmp886 = gs_c25_2.Name == "PirateGrandBrigade"
              if not (gs_c25_2.Name == "PirateGrandBrigade") then
              tmp886 = gs_c25_2.Name == "PirateBrigade"
              end
              local tmp887 = tmp886
              if tmp886 then
              tmp887 = (gs_c25_2:FindFirstChild("Health")).Value > 0
              end
              if tmp887 then return {true} end
            end
    return false
  end
  fn_26 = function(...)
          for _key, item in pairs(workspace.Enemies:GetChildren()) do
            gs_c26_1 = _key
            gs_c26_2 = item
            local tmp885 = gs_c26_2.Name == "Shark"
            if (gs_c26_2.Name == "Shark") then
            tmp885 = gs_root_13.Alive(gs_c26_2)
            end
            if tmp885 then return {true} end
          end
    return false
  end
  fn_27 = function(...)
          for _key, item in pairs(workspace.Enemies:GetChildren()) do
            gs_c27_1 = _key
            gs_c27_2 = item
            local tmp884 = gs_c27_2.Name == "Terrorshark"
            if (gs_c27_2.Name == "Terrorshark") then
            tmp884 = gs_root_13.Alive(gs_c27_2)
            end
            if tmp884 then return {true} end
          end
    return false
  end
  fn_28 = function(...)
          for _key, item in pairs(workspace.Enemies:GetChildren()) do
            gs_c28_1 = _key
            gs_c28_2 = item
            local tmp883 = gs_c28_2.Name == "Piranha"
            if (gs_c28_2.Name == "Piranha") then
            tmp883 = gs_root_13.Alive(gs_c28_2)
            end
            if tmp883 then return {true} end
          end
    return false
  end
  fn_29 = function(...)
            for _key, item in pairs(workspace.Enemies:GetChildren()) do
              gs_c29_1 = _key
              gs_c29_2 = item
              local tmp881 = gs_c29_2.Name == "Fish Crew Member"
              if not (gs_c29_2.Name == "Fish Crew Member") then
              tmp881 = gs_c29_2.Name == "Haunted Crew Member"
              end
              local tmp882 = tmp881
              if tmp881 then
              tmp882 = gs_root_13.Alive(gs_c29_2)
              end
              if tmp882 then return {true} end
            end
    return false
  end
  fn_30 = function(...)
          for _key, item in pairs(workspace.Enemies:GetChildren()) do
            gs_c30_1 = _key
            gs_c30_2 = item
            local tmp880 = gs_c30_2.Name == "Haunted Crew Member"
            if (gs_c30_2.Name == "Haunted Crew Member") then
            tmp880 = gs_root_13.Alive(gs_c30_2)
            end
            if tmp880 then return {true} end
          end
    return false
  end
  fn_31 = function(...)
    if (workspace.SeaBeasts:FindFirstChild("SeaBeast1")) then return {true} end
    return false
  end
  fn_32 = function(...)
    if (workspace.SeaBeasts:FindFirstChild("Leviathan")) then return {true} end
    return false
  end
  fn_33 = function(...)
        for _key, item in pairs(plr.Backpack:GetChildren()) do
          gs_c33_1 = _key
          gs_c33_2 = item
          StoreFruit = gs_c33_2:FindFirstChild("EatRemote", true)
          if StoreFruit then
          replicated.Remotes.CommF_:InvokeServer("StoreFruit", StoreFruit.Parent:GetAttribute("OriginalName"), plr.Backpack:FindFirstChild(gs_c33_2.Name))
          end
        end
    return
  end
  fn_34 = function(...)
    local _,  a1 = ...
        local _t2
      gs_c34_1 = a1
    if not gs_c34_1 then goto L111834 end
    gs_34_1_1 = plr.Character
    for _key, item in pairs(workspace:GetChildren()) do
      gs_34_1_1 = _key
      gs_34_1_2 = item
      if (string.find(gs_34_1_2.Name, "Fruit")) then
      _t2 = gs_34_1_2.Handle
      _t2.CFrame = gs_c34_1.HumanoidRootPart.CFrame
      local tmp879 = gs_34_1_2.Handle
      end
    end
    ::L111834::
    return
  end
  fn_35 = function(...)
    if World1 then return {Lighting.FantasySky.MoonTextureId} end
    if World2 then return {Lighting.FantasySky.MoonTextureId} end
    if World3 then return {Lighting.Sky.MoonTextureId} end
    return
  end
  fn_36 = function(...)
        local _t2
          local _t4
      for _key, item in pairs(plr.Backpack:GetChildren()) do
        gs_c36_1 = _key
        gs_c36_2 = item
        if (string.find(gs_c36_2.Name, "Fruit")) then
        EquipWeapon(gs_c36_2.Name)
        wait(0.1)
        if (plr.PlayerGui.Main.Dialogue.Visible == true) then
        _t2 = plr.PlayerGui.Main.Dialogue
        _t2.Visible = false
        local tmp877 = plr.PlayerGui.Main.Dialogue
        end
        EquipWeapon(gs_c36_2.Name)
        (plr.Character:FindFirstChild(gs_c36_2.Name)).EatRemote.InvokeServer((plr.Character:FindFirstChild(gs_c36_2.Name)).EatRemote, "Drop")
        end
      end
    _iter = {pairs(plr.Character:GetChildren())}
    ::L111588::
    _k3 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k3[1]
    if not (_k3[1] == nil) then
      goto L111707
    end
    gs_36_1_1 = _loopkey
    gs_36_1_2 = _loopval
    if (string.find(gs_36_1_2.Name, "Fruit")) then
      EquipWeapon(gs_36_1_2.Name)
      wait(0.1)
      if (plr.PlayerGui.Main.Dialogue.Visible == true) then
        _t4 = plr.PlayerGui.Main.Dialogue
        _t4.Visible = false
        local tmp878 = plr.PlayerGui.Main.Dialogue
      end
      EquipWeapon(gs_36_1_2.Name)
      (plr.Character:FindFirstChild(gs_36_1_2.Name)).EatRemote.InvokeServer((plr.Character:FindFirstChild(gs_36_1_2.Name)).EatRemote, "Drop")
    end
    goto L111588
    ::L111707::
    return
  end
  fn_37 = function(...)
    local _,  a1 = ...
      gs_c37_1 = a1
    local tmp876 = plr.Backpack:FindFirstChild(gs_c37_1)
    if not (plr.Backpack:FindFirstChild(gs_c37_1)) then
      tmp876 = plr.Character:FindFirstChild(gs_c37_1)
    end
    return tmp876
  end
  fn_38 = function(...)
    local _,  a1 = ...
          gs_c38_1 = a1
    _iter = {pairs(replicated.Remotes.CommF_:InvokeServer("getInventory"))}
    ::L111301::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L111378
    end
    gs_c38_1 = _loopkey
    gs_c38_2 = _loopval
    if not ((type(gs_c38_2)) == "table") then goto L111375 end
    local tmp875 = gs_c38_2.Name == gs_c1_1
    if gs_c38_2.Name == gs_c1_1 then goto L111367 end
    tmp875 = plr.Character:FindFirstChild(gs_c1_1)
    if plr.Character:FindFirstChild(gs_c1_1) then goto L111367 end
    tmp875 = plr.Backpack:FindFirstChild(gs_c1_1)
    ::L111367::
    if tmp875 then return {true} end
    ::L111375::
    goto L111301
    ::L111378::
    return false
  end
  fn_39 = function(...)
    local _,  a1 = ...
        gs_c39_1 = a1
    _iter = {pairs(replicated.Remotes.CommF_:InvokeServer("getInventory"))}
    ::L111215::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L111266
    end
    gs_c39_1 = _loopkey
    gs_c39_2 = _loopval
    if ((type(gs_c39_2)) == "table") then
      if (gs_c39_2.Type == "Material") then
        if (gs_c39_2.Name == gs_c1_1) then return {gs_c39_2.Count} end
      end
    end
    goto L111215
    ::L111266::
    return 0
  end
  fn_40 = function(...)
    local _,  a1 = ...
          gs_c40_1 = a1
    _iter = {pairs(replicated.Remotes.CommF_:InvokeServer("getInventory"))}
    ::L111093::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L111180
    end
    gs_c40_1 = _loopkey
    gs_c40_2 = _loopval
    if not ((type(gs_c40_2)) == "table") then goto L111177 end
    if not (gs_c40_2.Type == "Sword") then goto L111175 end
    local tmp874 = gs_c40_2.Name == gs_c1_1
    if gs_c40_2.Name == gs_c1_1 then goto L111167 end
    tmp874 = plr.Character:FindFirstChild(gs_c1_1)
    if plr.Character:FindFirstChild(gs_c1_1) then goto L111167 end
    tmp874 = plr.Backpack:FindFirstChild(gs_c1_1)
    ::L111167::
    if tmp874 then return {true} end
    ::L111175::
    ::L111177::
    goto L111093
    ::L111180::
    return false
  end
  fn_41 = function(...)
    local _,  a1, a2 = ...
                          fn_996 = function(...)
      local _t1
      if gs_c41_2 then
        _t1 = plr.Character.Energy
        _t1.Value = Energy
        local tmp873 = plr.Character.Energy
      end
      return
    end
    gs_c41_1 = a1
    gs_c41_2 = a2
    if not Root then return end
    local tmp867 = gs_c41_1 == "Soru"
    if (gs_c41_1 == "Soru") then
      tmp867 = gs_c41_2
    end
    if not tmp867 then goto L110980 end
    _iter = {next, getgc()}
    ::L110843::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L110977
    end
    gs_41_2_1 = _loopkey
    gs_41_2_2 = _loopval
    if not plr.Character.Soru then goto L110974 end
    local tmp868 = (typeof(gs_41_2_2)) == "function"
    if ((typeof(gs_41_2_2)) == "function") then
      tmp868 = (getfenv(gs_41_2_2)).script == plr.Character.Soru
    end
    if not tmp868 then goto L110972 end
    _iter = {next, getupvalues(gs_41_2_2)}
    ::L110909::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L110969
    end
    gs_41_5_1 = _loopkey
    gs_41_5_2 = _loopval
    if not ((typeof(gs_41_5_2)) == "table") then goto L110966 end
    ::L110932::
    wait(Sec)
    gs_41_5_2.LastUse = 0
    if gs_root_2 then
    end
    if not (j110961_2_2) then
      goto L110932
    end
    local tmp869 = gs_41_5_2
    ::L110966::
    goto L110909
    ::L110969::
    ::L110972::
    ::L110974::
    goto L110843
    ::L110977::
    goto L111043
    ::L110980::
    local tmp870 = gs_c41_1 == "Energy"
    if (gs_c41_1 == "Energy") then
      tmp870 = gs_c41_2
    end
    if tmp870 then
      plr.Character.Energy.Changed.connect(plr.Character.Energy.Changed, fn_996)
      goto L111043
    end
    local tmp871 = gs_c41_1 == "Observation"
    if (gs_c41_1 == "Observation") then
      tmp871 = gs_c41_2
    end
    if not tmp871 then goto L111043 end
    gs_41_10_1 = plr.VisionRadius
    gs_41_10_1.Value = math.huge
    local tmp872 = gs_41_10_1
    ::L111043::
    return
  end
  fn_42 = function(...)
    fn_995 = function(...)
                  local _lv1
      local _lm1
      local _ls1
                          _iter = (math.random(1, math.random(40, 75))) - 1
      h110723_0_2 = 100
      h110723_0_3 = 1
      _lv1 = _iter + h110723_0_3
      _lm1 = h110723_0_2
      _ls1 = h110723_0_3
      ::FOR_110723::
      _lv1 = _lv1 + _ls1
      if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_110723 end
      gs_995f110723_1 = _lv1
      gs_995f110723_2 = replicated.__ServerBrowser:InvokeServer(gs_995f110723_1)
      _iter = _iter + h110723_0_3
      h110754_0_2 = h110723_0_2
      h110754_0_3 = h110723_0_3
      _iter = {next, gs_995f110723_2}
      ::L110754::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if _k2[1] == nil then goto L110756 end
      goto L110802
      ::L110756::
      gs_995f110723_1 = _loopkey
      gs_995f110723_2 = _loopval
      if not ((tonumber(gs_995f110723_2.Count)) < 12) then goto L110799 end
      TeleportService:TeleportToPlaceInstance(game.PlaceId, gs_995f110723_1)
      ::L110799::
      goto L110754
      ::L110802::
      goto FOR_110723
      ::FOR_END_110723::
      return
    end
    pcall(fn_995)
    return
  end
  fn_43 = function(...)
      local _t1
    local _t2
      local _t3
      while (task.wait()) do
      local tmp864 = gs_c1_16
      if gs_c1_16 then
        tmp864 = gs_c1_16.Parent == workspace
      end
      if tmp864 then
        if shouldTween then
          _t1 = getgenv()
          _t1.OnFarm = true
          local tmp865 = getgenv()
        else
          _t2 = getgenv()
          _t2.OnFarm = false
          tmp865 = getgenv()
        end
        local tmp866 = tmp865
      else
        _t3 = getgenv()
        _t3.OnFarm = false
        tmp866 = getgenv()
      end
    end
    return
  end
  fn_44 = function(...)
        fn_994 = function(...)
          if not (getgenv()).OnFarm then goto L110539 end
      local tmp855 = gs_c1_16
      if gs_c1_16 then
        tmp855 = gs_c1_16.Parent == workspace
      end
      if tmp855 then
        local tmp856 = gs_c44_1.Character
        if gs_c44_1.Character then
          tmp856 = gs_c44_1.Character.PrimaryPart
        end
        gs_994_2_1 = tmp856
        local tmp857 = gs_994_2_1
        if gs_994_2_1 then
          tmp857 = (gs_994_2_1.Position - gs_c1_16.Position).Magnitude <= 200
        end
        if tmp857 then
          gs_994_2_1.CFrame = gs_c1_16.CFrame
          local tmp858 = gs_994_2_1
        else
          gs_c1_16.CFrame = gs_994_2_1.CFrame
          tmp858 = gs_c1_16
        end
        local tmp859 = tmp858
      end
      gs_994_1_1 = gs_c44_1.Character
      local tmp861 = tmp859
      if not gs_994_1_1 then goto L110537 end
      _iter = tmp859
      h110499_0_2 = {pairs(gs_994_1_1:GetChildren())}
      ::L110499::
      _k1 = {h110499_0_2[1](h110499_0_2[2], h110499_0_2[3])}
      h110499_0_2[3] = _k1[1]
      if not (_k1[1] == nil) then
        goto L110534
      end
      gs_994_5_1 = h110499_0_2[1]
      gs_994_5_2 = h110499_0_2[2]
      if (gs_994_5_2:IsA("BasePart")) then
        gs_994_5_2.CanCollide = false
        local tmp860 = gs_994_5_2
      end
      goto L110499
      ::L110534::
      ::L110537::
      local tmp863 = tmp861
      goto L110614
      ::L110539::
      gs_994_8_1 = gs_c44_1.Character
      if not gs_994_8_1 then goto L110613 end
      _iter = {pairs(gs_994_8_1:GetChildren())}
      ::L110575::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L110610
      end
      gs_994_9_1 = _loopkey
      gs_994_9_2 = _loopval
      if (gs_994_9_2:IsA("BasePart")) then
        gs_994_9_2.CanCollide = true
        local tmp862 = gs_994_9_2
      end
      goto L110575
      ::L110610::
      ::L110613::
      ::L110614::
      return
    end
    gs_c44_1 = game.Players.LocalPlayer
    ::L110324::
    task.wait()
    local tmp854 = gs_c44_1.Character
    if gs_c44_1.Character then
      tmp854 = gs_c44_1.Character.PrimaryPart
    end
    if not (tmp854) then
      goto L110324
    end
    gs_c1_16.CFrame = gs_c44_1.Character.PrimaryPart.CFrame
    _iter = gs_c1_16
    while (task.wait()) do
      pcall(fn_994)
    end
    return
  end
  fn_45 = function(...)
    local _,  a1 = ...
    gs_c45_1 = a1
    if not gs_c45_1 then return end
    if ((typeof(gs_c45_1)) == "Vector3") then return {CFrame.new(gs_c45_1)} end
    if ((typeof(gs_c45_1)) == "CFrame") then return {gs_c45_1} end
    if ((typeof(gs_c45_1)) == "Model") then return {gs_c45_1.GetPivot(gs_c45_1)} end
    if gs_c45_1.CFrame then return {gs_c45_1.CFrame} end
    return
  end
  fn_46 = function(...)
    local _,  a1, a2, a3 = ...
      gs_c46_1 = a1
    gs_c46_2 = a2
    gs_c46_3 = a3
    if (gs_c46_1 == nil) then return {9000000000.0} end
    gs_c46_4 = gs_c1_22.Character
    if not gs_c46_4 then return {9000000000.0} end
    gs_c46_5 = gs_c46_4:FindFirstChild("Humanoid")
    local tmp853 = not gs_c46_5
    if gs_c46_5 then
      tmp853 = gs_c46_5.Health <= 0
    end
    if tmp853 then return {9000000000.0} end
    if (gs_c46_2 == nil) then
      gs_c46_2 = gs_c46_4:FindFirstChild("HumanoidRootPart")
      if not gs_c46_2 then return {9000000000.0} end
    end
    gs_c46_6 = Convert_CFrame(gs_c46_1)
    gs_c46_7 = Convert_CFrame(gs_c46_2)
    if gs_c46_3 then return {((Vector3.new(gs_c46_6.X, 0, gs_c46_6.Z)) - (Vector3.new(gs_c46_7.X, 0, gs_c46_7.Z))).Magnitude} end
    return (gs_c46_6.Position - gs_c46_7.Position).Magnitude
  end
  fn_47 = function(...)
    local _,  a1 = ...
          gs_c47_1 = a1
    gs_c47_2 = workspace:FindFirstChild("_WorldOrigin")
    if not gs_c47_2 then return {{.Name = ""}} end
    gs_c47_3 = Convert_CFrame(gs_c47_1)
    for _key, item in pairs(gs_c47_2.Locations:GetChildren()) do
      gs_c47_1 = _key
      gs_c47_2 = item
      local tmp852 = gs_c47_2:FindFirstChild("Mesh")
      if (gs_c47_2:FindFirstChild("Mesh")) then
      tmp852 = (gs_c1_3.Position - gs_c47_2.Position).Magnitude <= gs_c47_2.Mesh.Scale.X
      end
      if tmp852 then return {gs_c47_2} end
    end
    do return {{.Name = ""}} end
  end
  fn_48 = function(...)
    local _,  a1 = ...
            gs_c48_1 = a1
    local tmp850 = workspace:FindFirstChild("_WorldOrigin")
    if not (workspace:FindFirstChild("_WorldOrigin")) then goto L109834 end
    tmp850 = workspace._WorldOrigin:FindFirstChild("PlayerSpawns")
    if not (workspace._WorldOrigin:FindFirstChild("PlayerSpawns")) then goto L109834 end
    tmp850 = workspace._WorldOrigin.PlayerSpawns:FindFirstChild("Pirates")
    ::L109834::
    gs_c48_2 = tmp850
    if not gs_c48_2 then return end
    for _key, item in pairs(gs_c48_2:GetChildren()) do
      gs_c48_1 = _key
      gs_c48_2 = item
      local tmp851 = gs_c48_2:FindFirstChild("Part")
      if (gs_c48_2:FindFirstChild("Part")) then
      tmp851 = (gs_c48_2.Part.Position - gs_c1_1.Position).Magnitude <= 2500
      end
      if tmp851 then return {gs_c48_2} end
    end
    return
  end
  fn_49 = function(...)
      fn_993 = function(...)
      local _,  a1 = ...
                              gs_c993_1 = a1
      for _key, item in pairs(gs_c1_22.Backpack:GetChildren()) do
        gs_c993_1 = _key
        gs_c993_2 = item
        local tmp848 = gs_c993_2:IsA("Tool")
        if not (gs_c993_2:IsA("Tool")) then goto L109686 end
        tmp848 = gs_c993_2.Name == gs_c49_1
        if gs_c993_2.Name == gs_c49_1 then goto L109686 end
        tmp848 = string.find(gs_c993_2.Name, gs_c49_1)
        ::L109686::
        if tmp848 then return {gs_c993_2} end
      end
      _iter = {next, gs_c49_22.Character:GetChildren()}
      ::L109715::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L109772
      end
      gs_993_1_1 = _loopkey
      gs_993_1_2 = _loopval
      local tmp849 = gs_993_1_2:IsA("Tool")
      if not (gs_993_1_2:IsA("Tool")) then goto L109763 end
      tmp849 = gs_993_1_2.Name == gs_c993_1
      if gs_993_1_2.Name == gs_c993_1 then goto L109763 end
      tmp849 = string.find(gs_993_1_2.Name, gs_c993_1)
      ::L109763::
      if tmp849 then return {gs_993_1_2} end
      goto L109715
      ::L109772::
      return
    end
    gs_c49_1 = fn_993
    local tmp847 = gs_c49_1("God's Chalice")
    if gs_c49_1("God's Chalice") then goto L109607 end
    tmp847 = gs_c49_1("Fist of Darkness")
    if gs_c49_1("Fist of Darkness") then goto L109607 end
    tmp847 = gs_c49_1("Sweet Chalice")
    if gs_c49_1("Sweet Chalice") then goto L109607 end
    tmp847 = gs_c49_1("Hallow Essence")
    if gs_c49_1("Hallow Essence") then goto L109607 end
    tmp847 = gs_c49_1("Flower1")
    ::L109607::
    if tmp847 then return {true} end
    return false
  end
  fn_50 = function(...)
    gs_c50_1 = gs_c1_22.Character
    if not gs_c50_1 then return end
    gs_c50_2 = gs_c50_1:FindFirstChild("Humanoid")
    if gs_c50_2 then return {gs_c50_2} end
    gs_c50_3 = (tick()) + 5
    while ((tick()) < gs_c50_3) do
      gs_c50_2 = gs_c50_1:FindFirstChild("Humanoid")
      if gs_c50_2 then return {gs_c50_2} end
      task.wait(0.1)
    end
    return
  end
  fn_51 = function(...)
    local _,  a1 = ...
        gs_c51_1 = a1
    if not gs_c51_1 then goto L109447 end
    _iter = {pairs(gs_c1_18.Remotes.CommF_:InvokeServer("getInventory"))}
    ::L109420::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L109444
    end
    gs_51_1_1 = _loopkey
    gs_51_1_2 = _loopval
    if (gs_51_1_2.Name == gs_c1_1) then return {true} end
    goto L109420
    ::L109444::
    ::L109447::
    return false
  end
  fn_52 = function(...)
    local _,  a1, a2 = ...
      gs_c52_1 = a1
    gs_c52_2 = a2
    local tmp846 = gs_c52_2
    if not (gs_c52_2) then
      tmp846 = gs_c1_22.Character.HumanoidRootPart.CFrame
    end
    gs_c52_2 = tmp846
    gs_c52_3 = CFrame.new(gs_c52_1.X, gs_c52_2.Y, gs_c52_1.Z)
    gs_c52_4 = CFrame.new(gs_c52_2.X, gs_c52_2.Y, gs_c52_2.Z)
    return (gs_c52_3.Position - gs_c52_4.Position).Magnitude
  end
  fn_53 = function(...)
    local _,  a1 = ...
        gs_c53_1 = a1
    gs_c53_2 = (InArea(gs_c53_1)).Name
    if (gs_c53_2 == "") then return {false} end
    local tmp844 = not gs_c1_23["Bypass Teleport"]
    if not gs_c1_23["Bypass Teleport"] then goto L109252 end
    tmp844 = gs_c53_2:find("Dimension")
    if gs_c53_2:find("Dimension") then goto L109252 end
    tmp844 = gs_c53_2:find("Submerged")
    if gs_c53_2:find("Submerged") then goto L109252 end
    tmp844 = gs_c53_2 == "Sealed Cavern"
    if gs_c53_2 == "Sealed Cavern" then goto L109252 end
    gs_c53_2.lower(gs_c53_2)
    tmp844 = (gs_c53_2.lower(gs_c53_2)).find(gs_c53_2.lower(gs_c53_2), "under")
    if (gs_c53_2.lower(gs_c53_2)).find(gs_c53_2.lower(gs_c53_2), "under") then goto L109252 end
    tmp844 = CheckLegendaryItems()
    ::L109252::
    if tmp844 then return {false} end
    local tmp845 = gs_c1_22.Data
    if not gs_c1_22.Data then goto L109283 end
    tmp845 = gs_c1_22.Data.LastSpawnPoint
    if not gs_c1_22.Data.LastSpawnPoint then goto L109283 end
    tmp845 = gs_c1_22.Data.LastSpawnPoint.Value == "SubmergedIsland"
    ::L109283::
    if tmp845 then return {false} end
    if ((GetDistance(gs_c53_1.Position)) <= 3500) then return {false} end
    return true
  end
  fn_54 = function(...)
    local _,  a1 = ...
            gs_c54_1 = a1
    gs_c54_2 = math.huge
    gs_c54_4 = workspace._WorldOrigin.PlayerSpawns.Pirates:GetChildren()
    local tmp842 = gs_c1_22.Character
    if gs_c1_22.Character then
      tmp842 = gs_c1_22.Character:FindFirstChild("HumanoidRootPart")
    end
    gs_c54_5 = tmp842
    if not gs_c54_5 then return end
    _iter = {next, gs_c54_4}
    ::L109023::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L109141
    end
    gs_c54_1 = _loopkey
    gs_c54_2 = _loopval
    if not (gs_c54_2:FindFirstChild("Part")) then goto L109138 end
    local tmp843 = (gs_c1_1.Position - gs_c1_5.Position).Magnitude >= 3000
    if not ((gs_c1_1.Position - gs_c1_5.Position).Magnitude >= 3000) then goto L109117 end
    tmp843 = (GetSpawnPoint(gs_c54_2.Part)) ~= (GetSpawnPoint(gs_c1_5))
    if not ((GetSpawnPoint(gs_c54_2.Part)) ~= (GetSpawnPoint(gs_c1_5))) then goto L109117 end
    tmp843 = (gs_c54_2.Part.Position - gs_c1_5.Position).Magnitude <= 10000
    if not ((gs_c54_2.Part.Position - gs_c1_5.Position).Magnitude <= 10000) then goto L109117 end
    tmp843 = (gs_c54_2.Part.Position - gs_c1_1.Position).Magnitude <= gs_c1_2
    ::L109117::
    if tmp843 then
      gs_c1_2 = (gs_c54_2.Part.Position - gs_c1_1.Position).Magnitude
      gs_c1_3 = gs_c54_2
    end
    ::L109138::
    goto L109023
    ::L109141::
    return gs_54_2_3
  end
  fn_55 = function(...)
    local _,  a1 = ...
          local _t1
      gs_c55_1 = a1
    gs_c55_2 = gs_c1_22.Character
    if not gs_c55_2 then return end
    gs_c55_3 = WaitForHumanoid()
    local tmp838 = not gs_c55_3
    if gs_c55_3 then
      tmp838 = gs_c55_3.Health <= 0
    end
    if tmp838 then return end
    local tmp839 = CanBypassTeleport(gs_c55_1)
    if (CanBypassTeleport(gs_c55_1)) then
      tmp839 = GetBypassCFrame(gs_c55_1)
    end
    if not tmp839 then goto L108942 end
    gs_55_3_1 = GetBypassCFrame(gs_c55_1)
    local tmp840 = gs_55_3_1
    if gs_55_3_1 then
      tmp840 = gs_55_3_1:FindFirstChild("Part")
    end
    if not tmp840 then goto L108940 end
    _t1 = gs_c55_2.LastSpawnPoint
    _t1.Disabled = true
    gs_c1_18.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", gs_55_3_1.Name)
    gs_c1_18.Remotes.CommF_:InvokeServer("SetSpawnPoint")
    gs_c55_2:PivotTo(gs_55_3_1.Part.CFrame)
    gs_c55_3:ChangeState(15)
    ::L108896::
    task.wait()
    local tmp841 = gs_c1_22.Character
    if not gs_c1_22.Character then goto L108935 end
    tmp841 = WaitForHumanoid()
    if not (WaitForHumanoid()) then goto L108935 end
    tmp841 = (WaitForHumanoid()).Health > 0
    ::L108935::
    if not (tmp841) then
      goto L108896
    end
    ::L108940::
    ::L108942::
    return
  end
  fn_56 = function(...)
          local _lv1
    local _lm1
    local _ls1
    if ((getdis(CFrame.new(28310.0234, 14895.1123, 109.456741))) > 1500) then
      gs_c1_18.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28310.0234, 14895.1123, 109.456741))
      wait(0.3)
    end
    gs_c56_1 = CFrame.new(28607.5352, 14896.5449, 106.011726)
    _tp(gs_c56_1)
    ::L108661::
    wait()
    if not ((getdis(gs_c56_1)) <= 5) then
      goto L108661
    end
    wait(0.5)
    _iter = 1 - 1
    h108694_0_2 = 4
    h108694_0_3 = 1
    _lv1 = _iter + h108694_0_3
    _lm1 = h108694_0_2
    _ls1 = h108694_0_3
    ::FOR_108694::
    _lv1 = _lv1 + _ls1
    if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_108694 end
    gs_56f108694_1 = _lv1
    gs_c1_18.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
    goto FOR_108694
    ::FOR_END_108694::
    return
  end
  fn_57 = function(...)
    local _,  a1 = ...
                    fn_992 = function(...)
      if _G.TweenCache then
        _G.TweenCache.Cancel(_G.TweenCache)
      end
      return
    end
    gs_c57_1 = a1
    gs_c57_2 = ({{}})[1]
    gs_c57_3 = gs_c57_1
    if ((typeof(gs_c57_1)) == "CFrame") then
      gs_c57_3 = gs_c57_1.Position
    end
    if sea1 then
      gs_c57_2 = {.Sky3 = Vector3.new(-7894, 5547, -380), .Sky3Exit = Vector3.new(-4607, 874, -1667), .UnderWater = Vector3.new(61163, 11, 1819), ["Underwater City"] = Vector3.new(61165.19140625, 0.18704631924629211, 1897.379150390625), ["Pirate Village"] = Vector3.new(-1242.4625244140625, 4.787059783935547, 3901.282958984375), .UnderwaterExit = Vector3.new(4050, -1, -1814)}
      goto L108277
    end
    if sea2 then
      gs_c57_2 = {["Swan Mansion"] = Vector3.new(-390, 332, 673), ["Swan Room"] = Vector3.new(2285, 15, 905), ["Cursed Ship"] = Vector3.new(923, 126, 32852), ["Zombie Island"] = Vector3.new(-6509, 83, -133)}
      goto L108277
    end
    gs_c57_2 = {["Hydra Island"] = Vector3.new(5657.88623046875, 1013.0790405273438, -335.4996337890625), .Mansion = Vector3.new(-12462, 375, -7552), .Castle = Vector3.new(-5036, 315, -3179), ["Temple of Time"] = Vector3.new(28286, 14897, 103), ["Greate Tree"] = Vector3.new(3024.1709, 2280.69434, -7325.12793)}
    if not (checkinventory("Valkyrie Helm")) then return end
    ::L108277::
    gs_c57_4 = ({})[1]
    gs_c57_5 = ({})[2]
    _iter = {pairs(gs_c57_2)}
    ::L108301::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L108361
    end
    gs_c57_1 = _loopkey
    gs_c57_2 = _loopval
    local tmp832 = (typeof(gs_c57_2)) == "Vector3"
    if ((typeof(gs_c57_2)) == "Vector3") then
      tmp832 = (gs_c57_2 - gs_c1_3).Magnitude
    end
    local tmp833 = tmp832
    if not (tmp832) then
      tmp833 = (gs_c57_2.Position - gs_c1_3).Magnitude
    end
    gs_c57_3 = tmp833
    if (gs_c57_3 < gs_c1_5) then
      gs_c1_5 = gs_c57_3
      gs_c1_4 = gs_c57_2
    end
    goto L108301
    ::L108361::
    local tmp834 = gs_57_6_4
    if not gs_57_6_4 then goto L108382 end
    tmp834 = gs_57_6_5
    if not gs_57_6_5 then goto L108382 end
    tmp834 = gs_57_6_5 < (getdis(gs_57_6_1))
    ::L108382::
    if not tmp834 then goto L108544 end
    pcall(fn_992)
    local tmp835 = (typeof(gs_57_6_4)) == "Vector3"
    if not ((typeof(gs_57_6_4)) == "Vector3") then goto L108454 end
    tmp835 = gs_57_6_4.X == 3024.1709
    if not (gs_57_6_4.X == 3024.1709) then goto L108454 end
    tmp835 = gs_57_6_4.Y == 2280.69434
    if not (gs_57_6_4.Y == 2280.69434) then goto L108454 end
    tmp835 = gs_57_6_4.Z == -7325.12793
    if not (gs_57_6_4.Z == -7325.12793) then goto L108454 end
    tmp835 = (gs_c57_18.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")) >= 2
    ::L108454::
    if tmp835 then
      totopofgreattree()
      wait(1)
      goto L108542
    end
    if not (gs_57_6_5 < (getdis(gs_57_6_1))) then goto L108542 end
    local tmp836 = (typeof(gs_57_6_4)) == "Vector3"
    if ((typeof(gs_57_6_4)) == "Vector3") then
      tmp836 = gs_57_6_4
    end
    local tmp837 = tmp836
    if not (tmp836) then
      tmp837 = gs_57_6_4.Position
    end
    gs_57_10_1 = tmp837
    gs_c57_18.Remotes.CommF_:InvokeServer("requestEntrance", gs_57_10_1)
    wait(1)
    ::L108542::
    ::L108544::
    return
  end
  fn_58 = function(...)
    local _,  a1 = ...
            fn_988 = function(...)
      if (CanBypassTeleport(gs_c58_2)) then
        BypassTP(gs_c58_2)
        task.wait(0.5)
      end
      return
    end
    fn_989 = function(...)
      requestentrance(gs_c58_1)
      return
    end
    fn_990 = function(...)
      if (gs_58_6_1:FindFirstChild("BodyClip")) then
        gs_58_6_1.BodyClip.Destroy(gs_58_6_1.BodyClip)
      end
      return
    end
    fn_991 = function(...)
      ::L107872::
      if (gs_c58_7.PlaybackState == Enum.PlaybackState.Playing) then
        if not shouldTween then
          gs_c58_7.Cancel(gs_c58_7)
        else
          task.wait(0.1)
          goto L107872
        end
      end
      return
    end
    gs_c58_1 = a1
    if ((typeof(gs_c58_1)) == "Vector3") then
      gs_c58_2 = CFrame.new(gs_c58_1)
      goto L107484
    end
    if ((typeof(gs_c58_1)) == "CFrame") then
      gs_c58_2 = gs_c58_1
      goto L107484
    end
    local tmp828 = gs_c58_1
    if gs_c58_1 then
      tmp828 = gs_c58_1.CFrame
    end
    gs_c58_2 = tmp828
    ::L107484::
    if not gs_c58_2 then return end
    gs_c58_3 = plr.Character
    local tmp829 = not gs_c58_3
    if gs_c58_3 then
      tmp829 = not (gs_c58_3:FindFirstChild("HumanoidRootPart"))
    end
    if tmp829 then return end
    gs_c58_4 = gs_c58_3.HumanoidRootPart
    pcall(fn_988)
    pcall(fn_989)
    local tmp830 = sea3
    if sea3 then
      tmp830 = (getdis(gs_c58_2.Position, gs_c1_24.Position)) < 2000
    end
    if not tmp830 then goto L107730 end
    gs_58_6_1 = plr.Character.HumanoidRootPart
    if not ((math.abs(gs_c1_24.Position.Y - gs_58_6_1.CFrame.Y)) > 1000) then goto L107728 end
    ::L107609::
    task.wait()
    old_tp(gs_c1_25)
    if ((getdis(gs_c1_25)) < 10) then
      gs_58_9_1 = gs_c1_18.Modules.Net
      gs_58_9_1["RF/SubmarineWorkerSpeak"].InvokeServer(gs_58_9_1["RF/SubmarineWorkerSpeak"], "AskKilledTikiBoss")
      task.wait(0.5)
      gs_58_9_1["RF/SubmarineWorkerSpeak"].InvokeServer(gs_58_9_1["RF/SubmarineWorkerSpeak"], "TravelToSubmergedIsland")
    end
    if not ((getdis(gs_c58_2.Position)) < 2000) then
      goto L107609
    end
    task.wait(0.6)
    pcall(fn_990)
    ::L107728::
    ::L107730::
    gs_c58_5 = (gs_c58_2.Position - gs_c58_4.Position).Magnitude
    gs_c58_6 = TweenInfo.new(gs_c58_5 / 150, Enum.EasingStyle.Linear)
    game:GetService("TweenService")
    gs_c58_7 = ({(game:GetService("TweenService")).Create(game:GetService("TweenService"), gs_c1_16, gs_c58_6, {.CFrame = gs_c58_2})})[1]
    if (plr.Character.Humanoid.Sit == true) then
      gs_c1_16.CFrame = CFrame.new(gs_c1_16.Position.X, gs_c58_2.Y, gs_c1_16.Position.Z)
      local tmp831 = gs_c1_16
    end
    gs_c58_7.Play(gs_c58_7)
    task.spawn(fn_991)
    return gs_c58_7
  end
  fn_59 = function(...)
    local _,  a1 = ...
      local _t1
      gs_c59_1 = a1
    gs_c59_2 = plr.Character
    local tmp826 = gs_c59_2
    if gs_c59_2 then
      tmp826 = gs_c59_2:FindFirstChild("HumanoidRootPart")
    end
    if tmp826 then
      _t1 = gs_c59_2.HumanoidRootPart
      _t1.CFrame = gs_c59_1
      local tmp827 = gs_c59_2.HumanoidRootPart
    end
    return
  end
  fn_60 = function(...)
    local _,  a1 = ...
    gs_c60_1 = a1
    if ((gs_c60_1.Position - plr.Character.HumanoidRootPart.Position).Magnitude > 1000) then
      _tp(gs_c60_1)
    else
      _tp(gs_c60_1)
    end
    return
  end
  fn_61 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c61_1 = a1
    _t1 = plr.Character.HumanoidRootPart
    _t1.CFrame = gs_c61_1
    return
  end
  fn_62 = function(...)
    local _,  a1 = ...
    local _t1
      gs_c62_1 = a1
    gs_c62_2 = game.Players.LocalPlayer
    gs_c62_3 = gs_c62_2.Character.HumanoidRootPart
    gs_c62_4 = gs_c62_2.Character.Humanoid
    gs_c62_5 = gs_c62_2.PlayerGui.Main
    gs_c62_6 = gs_c62_1.Position
    gs_c62_7 = gs_c62_3.Position
    ::L107266::
    gs_c62_4.Health = 0
    gs_c62_3.CFrame = gs_c62_1
    _t1 = gs_c62_5.Quest
    _t1.Visible = false
    if ((gs_c62_3.Position - gs_c62_7).Magnitude > 1) then
      gs_c62_7 = gs_c62_3.Position
      gs_c62_3.CFrame = gs_c62_1
    end
    task.wait(0.5)
    if not ((gs_c62_1.Position - gs_c62_3.Position).Magnitude <= 2000) then
      goto L107266
    end
    return
  end
  fn_63 = function(...)
    fn_987 = function(...)
          local tmp823 = _G.SailBoat_Hydra
      if _G.SailBoat_Hydra then goto L106851 end
      tmp823 = _G.WardenBoss
      if _G.WardenBoss then goto L106851 end
      tmp823 = _G.AutoFactory
      if _G.AutoFactory then goto L106851 end
      tmp823 = _G.HighestMirage
      if _G.HighestMirage then goto L106851 end
      tmp823 = _G.HCM
      if _G.HCM then goto L106851 end
      tmp823 = _G.PGB
      if _G.PGB then goto L106851 end
      tmp823 = _G.Leviathan1
      if _G.Leviathan1 then goto L106851 end
      tmp823 = _G.UPGDrago
      if _G.UPGDrago then goto L106851 end
      tmp823 = _G.Complete_Trials
      if _G.Complete_Trials then goto L106851 end
      tmp823 = _G.TpDrago_Prehis
      if _G.TpDrago_Prehis then goto L106851 end
      tmp823 = _G.BuyDrago
      if _G.BuyDrago then goto L106851 end
      tmp823 = _G.AutoFireFlowers
      if _G.AutoFireFlowers then goto L106851 end
      tmp823 = _G.DT_Uzoth
      if _G.DT_Uzoth then goto L106851 end
      tmp823 = _G.AutoBerry
      if _G.AutoBerry then goto L106851 end
      tmp823 = _G.Prefully
      if _G.Prefully then goto L106851 end
      tmp823 = _G.Prehis_Find
      if _G.Prehis_Find then goto L106851 end
      tmp823 = _G.Prehis_Skills
      if _G.Prehis_Skills then goto L106851 end
      tmp823 = _G.Prehis_DB
      if _G.Prehis_DB then goto L106851 end
      tmp823 = _G.Prehis_DE
      if _G.Prehis_DE then goto L106851 end
      tmp823 = _G.FarmBlazeEM
      if _G.FarmBlazeEM then goto L106851 end
      tmp823 = _G.Dojoo
      if _G.Dojoo then goto L106851 end
      tmp823 = _G.CollectPresent
      if _G.CollectPresent then goto L106851 end
      tmp823 = _G.AutoLawKak
      if _G.AutoLawKak then goto L106851 end
      tmp823 = _G.TpLab
      if _G.TpLab then goto L106851 end
      tmp823 = _G.AutoPhoenixF
      if _G.AutoPhoenixF then goto L106851 end
      tmp823 = _G.AutoFarmChest
      if _G.AutoFarmChest then goto L106851 end
      tmp823 = _G.AutoHytHallow
      if _G.AutoHytHallow then goto L106851 end
      tmp823 = _G.LongsWord
      if _G.LongsWord then goto L106851 end
      tmp823 = _G.BlackSpikey
      if _G.BlackSpikey then goto L106851 end
      tmp823 = _G.AutoHolyTorch
      if _G.AutoHolyTorch then goto L106851 end
      tmp823 = _G.TrainDrago
      if _G.TrainDrago then goto L106851 end
      tmp823 = _G.AutoSaber
      if _G.AutoSaber then goto L106851 end
      tmp823 = _G.FarmMastery_Dev
      if _G.FarmMastery_Dev then goto L106851 end
      tmp823 = _G.CitizenQuest
      if _G.CitizenQuest then goto L106851 end
      tmp823 = _G.AutoEctoplasm
      if _G.AutoEctoplasm then goto L106851 end
      tmp823 = _G.KeysRen
      if _G.KeysRen then goto L106851 end
      tmp823 = _G.Auto_Rainbow_Haki
      if _G.Auto_Rainbow_Haki then goto L106851 end
      tmp823 = _G.obsFarm
      if _G.obsFarm then goto L106851 end
      tmp823 = _G.AutoBigmom
      if _G.AutoBigmom then goto L106851 end
      tmp823 = _G.Doughv2
      if _G.Doughv2 then goto L106851 end
      tmp823 = _G.AuraBoss
      if _G.AuraBoss then goto L106851 end
      tmp823 = _G.Raiding
      if _G.Raiding then goto L106851 end
      tmp823 = _G.Auto_Cavender
      if _G.Auto_Cavender then goto L106851 end
      tmp823 = _G.TpPly
      if _G.TpPly then goto L106851 end
      tmp823 = _G.Bartilo_Quest
      if _G.Bartilo_Quest then goto L106851 end
      tmp823 = _G.Level
      if _G.Level then goto L106851 end
      tmp823 = _G.FarmEliteHunt
      if _G.FarmEliteHunt then goto L106851 end
      tmp823 = _G.AutoZou
      if _G.AutoZou then goto L106851 end
      tmp823 = _G.AutoFarm_Bone
      if _G.AutoFarm_Bone then goto L106851 end
      tmp823 = (getgenv()).AutoMaterial
      if (getgenv()).AutoMaterial then goto L106851 end
      tmp823 = _G.CraftVM
      if _G.CraftVM then goto L106851 end
      tmp823 = _G.FrozenTP
      if _G.FrozenTP then goto L106851 end
      tmp823 = _G.TPDoor
      if _G.TPDoor then goto L106851 end
      tmp823 = _G.AcientOne
      if _G.AcientOne then goto L106851 end
      tmp823 = _G.AutoFarmNear
      if _G.AutoFarmNear then goto L106851 end
      tmp823 = _G.AutoRaidCastle
      if _G.AutoRaidCastle then goto L106851 end
      tmp823 = _G.DarkBladev3
      if _G.DarkBladev3 then goto L106851 end
      tmp823 = _G.AutoFarmRaid
      if _G.AutoFarmRaid then goto L106851 end
      tmp823 = _G.Auto_Cake_Prince
      if _G.Auto_Cake_Prince then goto L106851 end
      tmp823 = _G.Addealer
      if _G.Addealer then goto L106851 end
      tmp823 = _G.TPNpc
      if _G.TPNpc then goto L106851 end
      tmp823 = _G.TwinHook
      if _G.TwinHook then goto L106851 end
      tmp823 = _G.FindMirage
      if _G.FindMirage then goto L106851 end
      tmp823 = _G.FarmChestM
      if _G.FarmChestM then goto L106851 end
      tmp823 = _G.Shark
      if _G.Shark then goto L106851 end
      tmp823 = _G.TerrorShark
      if _G.TerrorShark then goto L106851 end
      tmp823 = _G.Piranha
      if _G.Piranha then goto L106851 end
      tmp823 = _G.MobCrew
      if _G.MobCrew then goto L106851 end
      tmp823 = _G.SeaBeast1
      if _G.SeaBeast1 then goto L106851 end
      tmp823 = _G.FishBoat
      if _G.FishBoat then goto L106851 end
      tmp823 = _G.AutoPole
      if _G.AutoPole then goto L106851 end
      tmp823 = _G.AutoPoleV2
      if _G.AutoPoleV2 then goto L106851 end
      tmp823 = _G.Auto_SuperHuman
      if _G.Auto_SuperHuman then goto L106851 end
      tmp823 = _G.AutoDeathStep
      if _G.AutoDeathStep then goto L106851 end
      tmp823 = _G.Auto_SharkMan_Karate
      if _G.Auto_SharkMan_Karate then goto L106851 end
      tmp823 = _G.Auto_Electric_Claw
      if _G.Auto_Electric_Claw then goto L106851 end
      tmp823 = _G.AutoDragonTalon
      if _G.AutoDragonTalon then goto L106851 end
      tmp823 = _G.Auto_Def_DarkCoat
      if _G.Auto_Def_DarkCoat then goto L106851 end
      tmp823 = _G.Auto_God_Human
      if _G.Auto_God_Human then goto L106851 end
      tmp823 = _G.Auto_Tushita
      if _G.Auto_Tushita then goto L106851 end
      tmp823 = _G.AutoMatSoul
      if _G.AutoMatSoul then goto L106851 end
      tmp823 = _G.AutoKenVTWO
      if _G.AutoKenVTWO then goto L106851 end
      tmp823 = _G.AutoSerpentBow
      if _G.AutoSerpentBow then goto L106851 end
      tmp823 = _G.AutoFMon
      if _G.AutoFMon then goto L106851 end
      tmp823 = _G.Auto_Soul_Guitar
      if _G.Auto_Soul_Guitar then goto L106851 end
      tmp823 = _G.TPGEAR
      if _G.TPGEAR then goto L106851 end
      tmp823 = _G.AutoSaw
      if _G.AutoSaw then goto L106851 end
      tmp823 = _G.AutoTridentW2
      if _G.AutoTridentW2 then goto L106851 end
      tmp823 = _G.AutoEvoRace
      if _G.AutoEvoRace then goto L106851 end
      tmp823 = _G.AutoGetQuestBounty
      if _G.AutoGetQuestBounty then goto L106851 end
      tmp823 = _G.MarinesCoat
      if _G.MarinesCoat then goto L106851 end
      tmp823 = _G.TravelDres
      if _G.TravelDres then goto L106851 end
      tmp823 = _G.Defeating
      if _G.Defeating then goto L106851 end
      tmp823 = _G.DummyMan
      if _G.DummyMan then goto L106851 end
      tmp823 = _G.Auto_Yama
      if _G.Auto_Yama then goto L106851 end
      tmp823 = _G.Auto_SwanGG
      if _G.Auto_SwanGG then goto L106851 end
      tmp823 = _G.SwanCoat
      if _G.SwanCoat then goto L106851 end
      tmp823 = _G.AutoEcBoss
      if _G.AutoEcBoss then goto L106851 end
      tmp823 = _G.Auto_Mink
      if _G.Auto_Mink then goto L106851 end
      tmp823 = _G.Auto_Human
      if _G.Auto_Human then goto L106851 end
      tmp823 = _G.Auto_Skypiea
      if _G.Auto_Skypiea then goto L106851 end
      tmp823 = _G.Auto_Fish
      if _G.Auto_Fish then goto L106851 end
      tmp823 = _G.CDK_TS
      if _G.CDK_TS then goto L106851 end
      tmp823 = _G.CDK_YM
      if _G.CDK_YM then goto L106851 end
      tmp823 = _G.CDK
      if _G.CDK then goto L106851 end
      tmp823 = _G.AutoFarmGodChalice
      if _G.AutoFarmGodChalice then goto L106851 end
      tmp823 = _G.AutoFistDarkness
      if _G.AutoFistDarkness then goto L106851 end
      tmp823 = _G.AutoMiror
      if _G.AutoMiror then goto L106851 end
      tmp823 = _G.Teleport
      if _G.Teleport then goto L106851 end
      tmp823 = _G.AutoKilo
      if _G.AutoKilo then goto L106851 end
      tmp823 = _G.AutoGetUsoap
      if _G.AutoGetUsoap then goto L106851 end
      tmp823 = _G.Praying
      if _G.Praying then goto L106851 end
      tmp823 = _G.TryLucky
      if _G.TryLucky then goto L106851 end
      tmp823 = _G.AutoColShad
      if _G.AutoColShad then goto L106851 end
      tmp823 = _G.AutoUnHaki
      if _G.AutoUnHaki then goto L106851 end
      tmp823 = _G.Auto_DonAcces
      if _G.Auto_DonAcces then goto L106851 end
      tmp823 = _G.AutoRipIngay
      if _G.AutoRipIngay then goto L106851 end
      tmp823 = _G.DragoV3
      if _G.DragoV3 then goto L106851 end
      tmp823 = _G.DragoV1
      if _G.DragoV1 then goto L106851 end
      tmp823 = _G.SailBoats
      if _G.SailBoats then goto L106851 end
      tmp823 = NextIs
      if NextIs then goto L106851 end
      tmp823 = _G.FarmGodChalice
      if _G.FarmGodChalice then goto L106851 end
      tmp823 = _G.IceBossRen
      if _G.IceBossRen then goto L106851 end
      tmp823 = senth
      if senth then goto L106851 end
      tmp823 = senth2
      if senth2 then goto L106851 end
      tmp823 = _G.Lvthan
      if _G.Lvthan then goto L106851 end
      tmp823 = _G.beasthunter
      if _G.beasthunter then goto L106851 end
      tmp823 = _G.DangerLV
      if _G.DangerLV then goto L106851 end
      tmp823 = _G.Relic123
      if _G.Relic123 then goto L106851 end
      tmp823 = _G.tweenKitsune
      if _G.tweenKitsune then goto L106851 end
      tmp823 = _G.Collect_Ember
      if _G.Collect_Ember then goto L106851 end
      tmp823 = _G.AutofindKitIs
      if _G.AutofindKitIs then goto L106851 end
      tmp823 = _G.snaguine
      if _G.snaguine then goto L106851 end
      tmp823 = _G.TwFruits
      if _G.TwFruits then goto L106851 end
      tmp823 = _G.tweenKitShrine
      if _G.tweenKitShrine then goto L106851 end
      tmp823 = _G.Tp_LgS
      if _G.Tp_LgS then goto L106851 end
      tmp823 = _G.Tp_MasterA
      if _G.Tp_MasterA then goto L106851 end
      tmp823 = _G.tweenShrine
      if _G.tweenShrine then goto L106851 end
      tmp823 = _G.FarmMastery_G
      if _G.FarmMastery_G then goto L106851 end
      tmp823 = _G.FarmMastery_S
      if _G.FarmMastery_S then goto L106851 end
      tmp823 = _G.FarmBoss
      if _G.FarmBoss then goto L106851 end
      tmp823 = _G.AutoFarmAllBoss
      if _G.AutoFarmAllBoss then goto L106851 end
      tmp823 = _G.AutoFishSlap
      if _G.AutoFishSlap then goto L106851 end
      tmp823 = _G.FarmTyrant
      if _G.FarmTyrant then goto L106851 end
      tmp823 = _G.FarmPhaBinh
      if _G.FarmPhaBinh then goto L106851 end
      tmp823 = _G.AutoSpawnCP
      if _G.AutoSpawnCP then goto L106851 end
      tmp823 = _G.AutoBerryH
      if _G.AutoBerryH then goto L106851 end
      tmp823 = _G.AutoChestBP
      if _G.AutoChestBP then goto L106851 end
      tmp823 = _G.FarmEliteHop
      if _G.FarmEliteHop then goto L106851 end
      tmp823 = _G.AutoHop_Dough
      if _G.AutoHop_Dough then goto L106851 end
      tmp823 = _G.AutoDoughKing
      if _G.AutoDoughKing then goto L106851 end
      tmp823 = _G.AutoAttackDoughKing
      if _G.AutoAttackDoughKing then goto L106851 end
      tmp823 = _G.AutoChipFruit
      if _G.AutoChipFruit then goto L106851 end
      tmp823 = _G.AutoChipBeli
      if _G.AutoChipBeli then goto L106851 end
      tmp823 = _G.StartEvent
      if _G.StartEvent then goto L106851 end
      tmp823 = _G.AutoMysticIsland
      if _G.AutoMysticIsland then goto L106851 end
      tmp823 = _G.AutoPlayerHunter
      if _G.AutoPlayerHunter then goto L106851 end
      tmp823 = _G.SafeMode
      if _G.SafeMode then goto L106851 end
      tmp823 = _G.AutoKillMob
      if _G.AutoKillMob then goto L106851 end
      tmp823 = _G.AutoStartPrehistoric
      if _G.AutoStartPrehistoric then goto L106851 end
      tmp823 = _G.AutoUnHaki
      if _G.AutoUnHaki then goto L106851 end
      tmp823 = _G.AutoAttackRipIndra
      if _G.AutoAttackRipIndra then goto L106851 end
      tmp823 = _G.AutoFarmIsland
      if _G.AutoFarmIsland then goto L106851 end
      tmp823 = _G.AutoFarmDungeon
      if _G.AutoFarmDungeon then goto L106851 end
      tmp823 = _G.AutoFarmCandy
      if _G.AutoFarmCandy then goto L106851 end
      tmp823 = _G.AutoTP_Gift
      if _G.AutoTP_Gift then goto L106851 end
      tmp823 = _G.AutoTPGift
      if _G.AutoTPGift then goto L106851 end
      tmp823 = _G.AutoTPAndCollect
      if _G.AutoTPAndCollect then goto L106851 end
      tmp823 = _G.MasterAutoLevel
      if _G.MasterAutoLevel then goto L106851 end
      tmp823 = _G.MasterAutoCandy
      if _G.MasterAutoCandy then goto L106851 end
      tmp823 = _G.TPFloor1
      if _G.TPFloor1 then goto L106851 end
      tmp823 = _G.TPFloor2
      if _G.TPFloor2 then goto L106851 end
      tmp823 = _G.TPFloor3
      if _G.TPFloor3 then goto L106851 end
      tmp823 = _G.TPFloor4
      ::L106851::
      if not tmp823 then goto L107094 end
      shouldTween = true
      if not (plr.Character.HumanoidRootPart:FindFirstChild("BodyClip")) then
        gs_987_2_1 = Instance.new("BodyVelocity")
        gs_987_2_1.Name = "BodyClip"
        gs_987_2_1.Parent = plr.Character.HumanoidRootPart
        gs_987_2_1.MaxForce = Vector3.new(100000, 100000, 100000)
        gs_987_2_1.Velocity = Vector3.new(0, 0, 0)
        local tmp824 = gs_987_2_1
      end
      if not (plr.Character:FindFirstChild("highlight")) then
        gs_987_3_1 = Instance.new("Highlight")
        gs_987_3_1.Name = "highlight"
        gs_987_3_1.Enabled = true
        gs_987_3_1.FillColor = Color3.fromRGB(0, 255, 254)
        gs_987_3_1.OutlineColor = Color3.fromRGB(0, 255, 254)
        gs_987_3_1.FillTransparency = 0.5
        gs_987_3_1.OutlineTransparency = 0.2
        gs_987_3_1.Parent = plr.Character
      end
      _iter = tmp824
      h107056_0_2 = j106940_0_2
      h107056_0_3 = j106940_0_3
      h107056_0_4 = j106940_0_4
      h107056_0_5 = j107031_0_5
      h107056_0_6 = j107031_0_6
      h107056_0_7 = j107031_0_7
      h107056_0_8 = j107031_0_8
      h107056_0_9 = j107031_0_9
      h107056_0_10 = j107031_0_10
      h107056_0_11 = j107031_0_11
      h107056_0_12 = {pairs(plr.Character.GetDescendants(plr.Character))}
      ::L107056::
      _k1 = {h107056_0_12[1](h107056_0_12[2], h107056_0_12[3])}
      h107056_0_12[3] = _k1[1]
      if not (_k1[1] == nil) then
        goto L107091
      end
      gs_987_1_1 = h107056_0_12[1]
      gs_987_1_2 = h107056_0_12[2]
      if (gs_987_1_2:IsA("BasePart")) then
        gs_987_1_2.CanCollide = false
        local tmp825 = gs_987_1_2
      end
      goto L107056
      ::L107091::
      goto L107199
      ::L107094::
      shouldTween = false
      if (plr.Character.HumanoidRootPart:FindFirstChild("BodyClip")) then
        plr.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
      end
      if (plr.Character:FindFirstChild("highlight")) then
        plr.Character:FindFirstChild("highlight"):Destroy()
      end
      ::L107199::
      return
    end
    while (task.wait()) do
      pcall(fn_987)
    end
    return
  end
  fn_64 = function(...)
    if not World1 then goto L104750 end
    if (_G.FindBoss == "The Gorilla King") then
      bMon = "The Gorilla King"
      Qname = "JungleQuest"
      Qdata = 3
      PosQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
      PosB = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
      goto L104748
    end
    if (_G.FindBoss == "Bobby") then
      bMon = "Bobby"
      Qname = "BuggyQuest1"
      Qdata = 3
      PosQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
      PosB = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
      goto L104748
    end
    if (_G.FindBoss == "The Saw") then
      bMon = "The Saw"
      PosB = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
      goto L104748
    end
    if (_G.FindBoss == "Yeti") then
      bMon = "Yeti"
      Qname = "SnowQuest"
      Qdata = 3
      PosQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
      PosB = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
      goto L104748
    end
    if (_G.FindBoss == "Mob Leader") then
      bMon = "Mob Leader"
      PosB = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
      goto L104748
    end
    if (_G.FindBoss == "Vice Admiral") then
      bMon = "Vice Admiral"
      Qname = "MarineQuest2"
      Qdata = 2
      PosQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
      PosB = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
      goto L104748
    end
    if (_G.FindBoss == "Saber Expert") then
      bMon = "Saber Expert"
      PosB = CFrame.new(-1458.89502, 29.8870335, -50.633564)
      goto L104748
    end
    if (_G.FindBoss == "Warden") then
      bMon = "Warden"
      Qname = "ImpelQuest"
      Qdata = 1
      PosB = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
      PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
      goto L104748
    end
    if (_G.FindBoss == "Chief Warden") then
      bMon = "Chief Warden"
      Qname = "ImpelQuest"
      Qdata = 2
      PosB = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
      PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
      goto L104748
    end
    if (_G.FindBoss == "Swan") then
      bMon = "Swan"
      Qname = "ImpelQuest"
      Qdata = 3
      PosB = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
      PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
      goto L104748
    end
    if (_G.FindBoss == "Magma Admiral") then
      bMon = "Magma Admiral"
      Qname = "MagmaQuest"
      Qdata = 3
      PosQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
      PosB = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
      goto L104748
    end
    if (_G.FindBoss == "Fishman Lord") then
      bMon = "Fishman Lord"
      Qname = "FishmanQuest"
      Qdata = 3
      PosQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
      PosB = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
      goto L104748
    end
    if (_G.FindBoss == "Wysper") then
      bMon = "Wysper"
      Qname = "SkyExp1Quest"
      Qdata = 3
      PosQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
      PosB = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
      goto L104748
    end
    if (_G.FindBoss == "Thunder God") then
      bMon = "Thunder God"
      Qname = "SkyExp2Quest"
      Qdata = 3
      PosQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
      PosB = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
      goto L104748
    end
    if (_G.FindBoss == "Cyborg") then
      bMon = "Cyborg"
      Qname = "FountainQuest"
      Qdata = 3
      PosQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
      PosB = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
      goto L104748
    end
    if (_G.FindBoss == "Ice Admiral") then
      bMon = "Ice Admiral"
      Qdata = nil
      PosQBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
      PosB = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
      goto L104748
    end
    if not (_G.FindBoss == "Greybeard") then goto L104748 end
    bMon = "Greybeard"
    Qdata = nil
    PosQBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
    PosB = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
    ::L104748::
    ::L104750::
    if not World2 then goto L105208 end
    if (_G.FindBoss == "Diamond") then
      bMon = "Diamond"
      Qname = "Area1Quest"
      Qdata = 3
      PosQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
      PosB = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
      goto L105206
    end
    if (_G.FindBoss == "Jeremy") then
      bMon = "Jeremy"
      Qname = "Area2Quest"
      Qdata = 3
      PosQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
      PosB = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
      goto L105206
    end
    if (_G.FindBoss == "Orbitus") then
      bMon = "Orbitus"
      Qname = "MarineQuest3"
      Qdata = 3
      PosQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
      PosB = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
      goto L105206
    end
    if (_G.FindBoss == "Don Swan") then
      bMon = "Don Swan"
      PosB = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
      goto L105206
    end
    if (_G.FindBoss == "Smoke Admiral") then
      bMon = "Smoke Admiral"
      Qname = "IceSideQuest"
      Qdata = 3
      PosQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
      PosB = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
      goto L105206
    end
    if (_G.FindBoss == "Awakened Ice Admiral") then
      bMon = "Awakened Ice Admiral"
      Qname = "FrostQuest"
      Qdata = 3
      PosQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
      PosB = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
      goto L105206
    end
    if (_G.FindBoss == "Tide Keeper") then
      bMon = "Tide Keeper"
      Qname = "ForgottenQuest"
      Qdata = 3
      PosQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
      PosB = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
      goto L105206
    end
    if (_G.FindBoss == "Darkbeard") then
      bMon = "Darkbeard"
      Qdata = nil
      PosQBoss = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
      PosB = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
      goto L105206
    end
    if (_G.FindBoss == "Cursed Captaim") then
      bMon = "Cursed Captain"
      Qdata = nil
      PosQBoss = CFrame.new(916.928589, 181.092773, 33422)
      PosB = CFrame.new(916.928589, 181.092773, 33422)
      goto L105206
    end
    if not (_G.FindBoss == "Order") then goto L105206 end
    bMon = "Order"
    Qdata = nil
    PosQBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
    PosB = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
    ::L105206::
    ::L105208::
    if not World3 then goto L105611 end
    if (_G.FindBoss == "Stone") then
      bMon = "Stone"
      Qname = "PiratePortQuest"
      Qdata = 3
      PosQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
      PosB = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
      goto L105609
    end
    if (_G.FindBoss == "Hydra Leader") then
      bMon = "Hydra Leader"
      Qname = "VenomCrewQuest"
      Qdata = 3
      PosQBoss = CFrame.new(5211.021484375, 1004.35778859375, 758.1847534179688)
      PosB = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
      goto L105609
    end
    if (_G.FindBoss == "Kilo Admiral") then
      bMon = "Kilo Admiral"
      Qname = "MarineTreeIsland"
      Qdata = 3
      PosQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
      PosB = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
      goto L105609
    end
    if (_G.FindBoss == "Captain Elephant") then
      bMon = "Captain Elephant"
      Qname = "DeepForestIsland"
      Qdata = 3
      PosQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
      PosB = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
      goto L105609
    end
    if (_G.FindBoss == "Beautiful Pirate") then
      bMon = "Beautiful Pirate"
      Qname = "DeepForestIsland2"
      Qdata = 3
      PosQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
      PosB = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
      goto L105609
    end
    if (_G.FindBoss == "Cake Queen") then
      bMon = "Cake Queen"
      Qname = "IceCreamIslandQuest"
      Qdata = 3
      PosQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
      PosB = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
      goto L105609
    end
    if (_G.FindBoss == "Longma") then
      bMon = "Longma"
      Qdata = nil
      PosQBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
      PosB = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
      goto L105609
    end
    if not (_G.FindBoss == "Soul Reaper") then goto L105609 end
    bMon = "Soul Reaper"
    Qdata = nil
    PosQBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
    PosB = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
    ::L105609::
    ::L105611::
    return
  end
  fn_65 = function(...)
    gs_c65_1 = QuestB()
    do return {{bMon, Qdata, Qname, PosB, PosQBoss, [0] = _G.FindBoss}} end
  end
  fn_66 = function(...)
    local _,  a1 = ...
                gs_c66_1 = a1
    local tmp817 = game.PlaceId == 2753915549
    if not (game.PlaceId == 2753915549) then
      tmp817 = game.PlaceId == 85211729168715.0
    end
    local tmp818 = tmp817
    if tmp817 then
      tmp818 = gs_c66_1 == 1
    end
    if tmp818 then return {true} end
    local tmp819 = game.PlaceId == 4442272183.0
    if not (game.PlaceId == 4442272183.0) then
      tmp819 = game.PlaceId == 79091703265657.0
    end
    local tmp820 = tmp819
    if tmp819 then
      tmp820 = gs_c66_1 == 2
    end
    if tmp820 then return {true} end
    local tmp821 = game.PlaceId == 7449423635.0
    if not (game.PlaceId == 7449423635.0) then
      tmp821 = game.PlaceId == 100117331123089.0
    end
    local tmp822 = tmp821
    if tmp821 then
      tmp822 = gs_c66_1 == 3
    end
    if tmp822 then return {true} end
    return false
  end
  fn_67 = function(...)
    local _,  a1 = ...
                gs_c67_1 = a1
    for _key, item in pairs(workspace.NPCs:GetChildren()) do
      gs_c67_1 = _key
      gs_c67_2 = item
      local tmp815 = gs_c67_2.Name == gs_c1_1
      if (gs_c67_2.Name == gs_c1_1) then
      tmp815 = gs_c67_2:FindFirstChild("HumanoidRootPart")
      end
      if tmp815 then return {gs_c67_2.HumanoidRootPart.CFrame} end
    end
    _iter = {pairs(replicated.NPCs:GetChildren())}
    ::L103729::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L103774
    end
    gs_67_1_1 = _loopkey
    gs_67_1_2 = _loopval
    local tmp816 = gs_67_1_2.Name == gs_c67_1
    if (gs_67_1_2.Name == gs_c67_1) then
      tmp816 = gs_67_1_2:FindFirstChild("HumanoidRootPart")
    end
    if tmp816 then return {gs_67_1_2.HumanoidRootPart.CFrame} end
    goto L103729
    ::L103774::
    return
  end
  fn_68 = function(...)
                                      gs_c68_1 = plr.Data.Level.Value
    gs_c68_2 = 0
    gs_c68_3 = ({{}})[1]
    local tmp810 = gs_c68_1 >= 700
    if (gs_c68_1 >= 700) then
      tmp810 = CheckSea(1)
    end
    if tmp810 then
      gs_c68_3.Mob = "Galley Captain"
      gs_c68_3.NameQuest = "FountainQuest"
      gs_c68_3.ID = 2
      gs_c68_3.LevelReq = 700
      local tmp814 = gs_c68_3
      goto L103627
    end
    local tmp811 = gs_c68_1 >= 1500
    if (gs_c68_1 >= 1500) then
      tmp811 = CheckSea(2)
    end
    if tmp811 then
      gs_c68_3.Mob = "Water Fighter"
      gs_c68_3.NameQuest = "ForgottenQuest"
      gs_c68_3.ID = 2
      gs_c68_3.LevelReq = 1450
      tmp814 = gs_c68_3
      goto L103627
    end
    _iter = {pairs(gs_c1_26)}
    ::L103491::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L103625
    end
    gs_68_3_1 = _loopkey
    gs_68_3_2 = _loopval
    _iter = {pairs(gs_68_3_2)}
    ::L103512::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L103621
    end
    gs_68_3_1 = _loopkey
    gs_68_3_2 = _loopval
    gs_68_3_3 = gs_68_3_2.LevelReq
    _iter = {pairs(gs_68_3_2.Task)}
    ::L103544::
    _k3 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k3[1]
    if not (_k3[1] == nil) then
      goto L103617
    end
    gs_68_3_1 = _loopkey
    gs_68_3_2 = _loopval
    local tmp812 = gs_deepm1_1 >= gs_c68_3
    if not (gs_deepm1_1 >= gs_c68_3) then goto L103591 end
    tmp812 = gs_deepm1_2 <= gs_c68_3
    if not (gs_deepm1_2 <= gs_c68_3) then goto L103591 end
    tmp812 = gs_c68_2.Task[gs_68_3_1] > 1
    if not (gs_c68_2.Task[gs_68_3_1] > 1) then goto L103591 end
    tmp812 = not (table.find(gs_deepm2_28, gs_c1_1))
    ::L103591::
    if tmp812 then
      gs_deepm1_2 = gs_c68_3
      gs_deepm1_3.Mob = gs_68_3_1
      gs_deepm1_3.NameQuest = gs_c1_1
      gs_deepm1_3.ID = gs_c68_1
      gs_deepm1_3.LevelReq = gs_c68_3
      local tmp813 = gs_deepm1_3
    end
    goto L103544
    ::L103617::
    goto L103512
    ::L103621::
    goto L103491
    ::L103625::
    ::L103627::
    return tmp814, j103627_0_2, j103627_0_3, j103627_0_4, gs_c68_3
  end
  fn_69 = function(...)
      local tmp809 = gs_c1_27
    if not gs_c1_27 then goto L103358 end
    tmp809 = gs_c1_27.Data
    if not gs_c1_27.Data then goto L103358 end
    tmp809 = gs_c1_27.Data.LastClosestNPC
    ::L103358::
    if tmp809 then return {GetQuestPointFromNPC(gs_c1_27.Data.LastClosestNPC)} end
    return
  end
  fn_70 = function(...)
      fn_986 = function(...)
      local _,  a1, a2 = ...
      gs_c986_1 = a1
      gs_c986_2 = a2
      gs_c986_3 = (gs_c70_2.Position - gs_c986_1).Magnitude
      if (gs_c986_3 >= gs_c986_2) then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", gs_c986_1)
      end
      return
    end
    gs_c70_1 = game.Players.LocalPlayer
    local tmp808 = gs_c70_1.Character
    if gs_c70_1.Character then
      tmp808 = gs_c70_1.Character:FindFirstChild("HumanoidRootPart")
    end
    gs_c70_2 = tmp808
    if not gs_c70_2 then return end
    shouldRequestEntrance = fn_986
    if not World1 then goto L102794 end
    if (SelectMaterial == "Angel Wings") then
      MMon = {"Shanda", "Royal Squad", "Royal Soldier", "Wysper", "Thunder God"}
      MPos = CFrame.new(-4698, 845, -1912)
      SP = "Default"
      gs_70_3_1 = Vector3.new(-4607.82275, 872.54248, -1667.55688)
      shouldRequestEntrance(gs_70_3_1, 10000)
      goto L102792
    end
    if (SelectMaterial == "Leather + Scrap Metal") then
      MMon = {"Brute", "Pirate"}
      MPos = CFrame.new(-1145, 15, 4350)
      SP = "Default"
      goto L102792
    end
    if (SelectMaterial == "Magma Ore") then
      MMon = {"Military Soldier", "Military Spy", "Magma Admiral"}
      MPos = CFrame.new(-5815, 84, 8820)
      SP = "Default"
      goto L102792
    end
    if not (SelectMaterial == "Fish Tail") then goto L102792 end
    MMon = {"Fishman Warrior", "Fishman Commando", "Fishman Lord"}
    MPos = CFrame.new(61123, 19, 1569)
    SP = "Default"
    gs_70_6_1 = Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)
    shouldRequestEntrance(gs_70_6_1, 17000)
    ::L102792::
    goto L103293
    ::L102794::
    if not World2 then goto L103040 end
    if (SelectMaterial == "Leather + Scrap Metal") then
      MMon = {"Marine Captain"}
      MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
      SP = "Default"
      goto L103038
    end
    if (SelectMaterial == "Magma Ore") then
      MMon = {"Magma Ninja", "Lava Pirate"}
      MPos = CFrame.new(-5428, 78, -5959)
      SP = "Default"
      goto L103038
    end
    if (SelectMaterial == "Ectoplasm") then
      MMon = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
      MPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625)
      SP = "Default"
      gs_70_10_1 = Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)
      shouldRequestEntrance(gs_70_10_1, 18000)
      goto L103038
    end
    if (SelectMaterial == "Mystic Droplet") then
      MMon = {"Water Fighter"}
      MPos = CFrame.new(-3385, 239, -10542)
      SP = "Default"
      goto L103038
    end
    if (SelectMaterial == "Radioactive Material") then
      MMon = {"Factory Staff"}
      MPos = CFrame.new(295, 73, -56)
      SP = "Default"
      goto L103038
    end
    if not (SelectMaterial == "Vampire Fang") then goto L103038 end
    MMon = {"Vampire"}
    MPos = CFrame.new(-6033, 7, -1317)
    SP = "Default"
    ::L103038::
    goto L103293
    ::L103040::
    if not World3 then goto L103293 end
    if (SelectMaterial == "Scrap Metal") then
      MMon = {"Jungle Pirate", "Forest Pirate"}
      MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
      SP = "Default"
      goto L103291
    end
    if (SelectMaterial == "Fish Tail") then
      MMon = {"Fishman Raider", "Fishman Captain"}
      MPos = CFrame.new(-10993, 332, -8940)
      SP = "Default"
      goto L103291
    end
    if (SelectMaterial == "Conjured Cocoa") then
      MMon = {"Chocolate Bar Battler", "Cocoa Warrior"}
      MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
      SP = "Default"
      goto L103291
    end
    if (SelectMaterial == "Dragon Scale") then
      MMon = {"Dragon Crew Archer", "Dragon Crew Warrior"}
      MPos = CFrame.new(6594, 383, 139)
      SP = "Default"
      goto L103291
    end
    if (SelectMaterial == "Gunpowder") then
      MMon = {"Pistol Billionaire"}
      MPos = CFrame.new(-84.8556900024414, 85.62061309814453, 6132.0087890625)
      SP = "Default"
      goto L103291
    end
    if (SelectMaterial == "Mini Tusk") then
      MMon = {"Mythological Pirate"}
      MPos = CFrame.new(-13545, 470, -6917)
      SP = "Default"
      goto L103291
    end
    if not (SelectMaterial == "Demonic Wisp") then goto L103291 end
    MMon = {"Demonic Soul"}
    MPos = CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)
    SP = "Default"
    ::L103291::
    ::L103293::
    return
  end
  fn_71 = function(...)
    gs_c71_1 = GetQuests()
    do return {{gs_c71_1.Mob, gs_c71_1.ID, gs_c71_1.NameQuest, gs_c71_1.LevelReq, gs_c71_1.Mob, GetQuestPoint()}} end
  end
  fn_72 = function(...)
        local _t1
    local _t2
        fn_985 = function(...)
      return gs_c72_6:GetCountryRegionForPlayerAsync(gs_c72_8)
    end
    gs_c72_1 = os.date("*t")
    gs_c72_2 = gs_c72_1.hour % 24
    local tmp804 = gs_c72_2 < 12
    if (gs_c72_2 < 12) then
      tmp804 = "AM"
    end
    local tmp805 = tmp804
    if not (tmp804) then
      tmp805 = "PM"
    end
    gs_c72_3 = tmp805
    gs_c72_4 = string.format("%02i:%02i:%02i %s", ((gs_c72_2 - 1) % 12) + 1, gs_c72_1.min, gs_c72_1.sec, gs_c72_3)
    gs_c72_5 = string.format("%02d/%02d/%04d", gs_c72_1.day, gs_c72_1.month, gs_c72_1.year)
    gs_c72_6 = game:GetService("LocalizationService")
    gs_c72_7 = game:GetService("Players")
    gs_c72_8 = gs_c72_7.LocalPlayer
    if not (getgenv()).countryRegionCode then
      gs_c72_9 = pcall(fn_985)
      gs_c72_10 = ({pcall(fn_985)})[2]
      if gs_c72_9 then
        _t1 = getgenv()
        _t1.countryRegionCode = gs_c72_10
        local tmp806 = getgenv()
      else
        _t2 = getgenv()
        _t2.countryRegionCode = "Unknown"
        tmp806 = getgenv()
      end
      local tmp807 = tmp806
    else
      gs_c72_10 = (getgenv()).countryRegionCode
    end
    gs_c1_34:SetDesc(gs_c72_5 .. (" - " .. (gs_c72_4 .. (" [ " .. (gs_c72_10 .. " ]")))))
    return
  end
  fn_73 = function(...)
    while true do
      UpdateOS()
      wait(1)
    end
    return
  end
  fn_74 = function(...)
    gs_c74_1 = math.floor(workspace.DistributedGameTime + 0.5)
    gs_c74_2 = (math.floor(gs_c74_1 / 3600)) % 24
    gs_c74_3 = (math.floor(gs_c74_1 / 60)) % 60
    gs_c74_4 = (math.floor(gs_c74_1 / 1)) % 60
    gs_c1_35:SetDesc(gs_c74_2 .. (" Hour (h) " .. (gs_c74_3 .. (" Minute (m) " .. (gs_c74_4 .. " Second (s)")))))
    return
  end
  fn_75 = function(...)
    while true do
      UpdateGameTime()
      wait(1)
    end
    return
  end
  fn_76 = function(...)
    fn_984 = function(...)
              while true do
        wait(1)
        gs_984_1_1 = (game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")) ~= nil
        local tmp802 = gs_984_1_1
        if gs_984_1_1 then
          tmp802 = "\226\156\133"
        end
        local tmp803 = tmp802
        if not (tmp802) then
          tmp803 = "\226\157\140"
        end
        gs_984_1_2 = tmp803
        if (gs_984_1_2 ~= gs_c1_37) then
          gs_c1_36:SetDesc("Status: " .. gs_984_1_2)
          gs_c1_37 = gs_984_1_2
        end
      end
      return
    end
    pcall(fn_984)
    return
  end
  fn_77 = function(...)
        while (task.wait(1)) do
      local tmp800 = (game:GetService("Workspace")).Map.FindFirstChild((game:GetService("Workspace")).Map, "KitsuneIsland")
      if ((game:GetService("Workspace")).Map.FindFirstChild((game:GetService("Workspace")).Map, "KitsuneIsland")) then
        tmp800 = "\226\156\133"
      end
      local tmp801 = tmp800
      if not (tmp800) then
        tmp801 = "\226\157\140"
      end
      gs_77_1_1 = tmp801
      if (gs_77_1_1 ~= gs_c1_39) then
        gs_c1_38:SetDesc("Status: " .. gs_77_1_1)
        gs_c1_39 = gs_77_1_1
      end
    end
    return
  end
  fn_78 = function(...)
        while (task.wait(1)) do
      local tmp798 = game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")
      if (game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")) then
        tmp798 = "\226\156\133"
      end
      local tmp799 = tmp798
      if not (tmp798) then
        tmp799 = "\226\157\140"
      end
      gs_78_1_1 = tmp799
      if (gs_78_1_1 ~= gs_c1_41) then
        gs_c1_40:SetDesc("Status: " .. gs_78_1_1)
        gs_c1_41 = gs_78_1_1
      end
    end
    return
  end
  fn_79 = function(...)
        while (wait(1)) do
      local tmp796 = game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")
      if (game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")) then
        tmp796 = "\226\156\133"
      end
      local tmp797 = tmp796
      if not (tmp796) then
        tmp797 = "\226\157\140"
      end
      gs_79_1_1 = tmp797
      if (gs_79_1_1 ~= gs_c1_43) then
        gs_c1_42:SetDesc("Status: " .. gs_79_1_1)
        gs_c1_43 = gs_79_1_1
      end
    end
    return
  end
  fn_80 = function(...)
    while (wait(1)) do
      gs_80_1_1 = (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "CakePrinceSpawner")
      gs_80_1_2 = "Cake Prince: \226\156\133"
      if ((string.len(gs_80_1_1)) >= 86) then
        gs_80_2_1 = string.sub(gs_80_1_1, 39, 41)
        gs_80_1_2 = "Killed: " .. gs_80_2_1
      end
      gs_c1_44:SetDesc(gs_80_1_2)
    end
    return
  end
  fn_81 = function(...)
          while (wait(1)) do
      game:GetService("ReplicatedStorage")
      local tmp793 = (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "rip_indra True Form")
      if not ((game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "rip_indra True Form")) then
        tmp793 = (game:GetService("Workspace")).Enemies.FindFirstChild((game:GetService("Workspace")).Enemies, "rip_indra")
      end
      local tmp794 = tmp793
      if tmp793 then
        tmp794 = "\226\156\133"
      end
      local tmp795 = tmp794
      if not (tmp794) then
        tmp795 = "\226\157\140"
      end
      gs_81_1_1 = tmp795
      if (gs_81_1_1 ~= gs_c1_46) then
        gs_c1_45:SetDesc("Status: " .. gs_81_1_1)
        gs_c1_46 = gs_81_1_1
      end
    end
    return
  end
  fn_82 = function(...)
          while (wait(1)) do
      game:GetService("ReplicatedStorage")
      local tmp790 = (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "Dough King")
      if not ((game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "Dough King")) then
        tmp790 = (game:GetService("Workspace")).Enemies.FindFirstChild((game:GetService("Workspace")).Enemies, "Dough King")
      end
      local tmp791 = tmp790
      if tmp790 then
        tmp791 = "\226\156\133"
      end
      local tmp792 = tmp791
      if not (tmp791) then
        tmp792 = "\226\157\140"
      end
      gs_82_1_1 = tmp792
      if (gs_82_1_1 ~= gs_c1_48) then
        gs_c1_47:SetDesc("Status: " .. gs_82_1_1)
        gs_c1_48 = gs_82_1_1
      end
    end
    return
  end
  fn_83 = function(...)
    ::L101289::
    if not (task.wait(1)) then goto L101398 end
    gs_83_1_1 = (game:GetService("Lighting")).Sky.MoonTextureId
    gs_83_1_2 = "Moon: 0/5"
    if (gs_83_1_1 == "http://www.roblox.com/asset/?id=9709149431") then
      gs_83_1_2 = "Moon: 5/5 (Full Moon) \226\156\133"
      goto L101383
    end
    if (gs_83_1_1 == "http://www.roblox.com/asset/?id=9709149052") then
      gs_83_1_2 = "Moon: 4/5"
      goto L101383
    end
    if (gs_83_1_1 == "http://www.roblox.com/asset/?id=9709143733") then
      gs_83_1_2 = "Moon: 3/5"
      goto L101383
    end
    if (gs_83_1_1 == "http://www.roblox.com/asset/?id=9709150401") then
      gs_83_1_2 = "Moon: 2/5"
      goto L101383
    end
    if not (gs_83_1_1 == "http://www.roblox.com/asset/?id=9709149680") then goto L101383 end
    gs_83_1_2 = "Moon: 1/5"
    ::L101383::
    gs_c1_49:SetDesc(gs_83_1_2)
    goto L101289
    ::L101398::
    return
  end
  fn_84 = function(...)
    ::L101140::
    if not (wait(1)) then goto L101287 end
    gs_84_1_1 = "Not Found"
    if ((game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "LegendarySwordDealer", "1")) then
      gs_84_1_1 = "Shisui \226\156\133"
      goto L101272
    end
    if ((game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "LegendarySwordDealer", "2")) then
      gs_84_1_1 = "Wando \226\156\133"
      goto L101272
    end
    if not ((game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "LegendarySwordDealer", "3")) then goto L101272 end
    gs_84_1_1 = "Saddi \226\156\133"
    ::L101272::
    gs_c1_50:SetDesc(gs_84_1_1)
    goto L101140
    ::L101287::
    return
  end
  fn_85 = function(...)
    local _,  a1 = ...
    gs_c85_1 = a1
    gs_c85_2 = ({{.Small = 0.8, .Large = 1, .Big = 1.2}})[1]
    gs_c1_30:SetUIScale(gs_c85_2[gs_c85_1])
    return
  end
  fn_86 = function(...)
    local _,  a1 = ...
    gs_c86_1 = a1
    _G.ChooseWP = gs_c86_1
    return
  end
  fn_87 = function(...)
    fn_983 = function(...)
          if not (_G.ChooseWP == "Melee") then goto L100893 end
      for _key, item in pairs(plr.Backpack:GetChildren()) do
        gs_983_1_1 = _key
        gs_983_1_2 = item
        if (gs_983_1_2.ToolTip == "Melee") then
        _G.SelectWeapon = gs_983_1_2.Name
        local tmp786 = _G
        end
      end
      goto L101094
      ::L100893::
      if not (_G.ChooseWP == "Sword") then goto L100960 end
      _iter = {pairs(plr.Backpack:GetChildren())}
      ::L100927::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L100957
      end
      gs_983_4_1 = _loopkey
      gs_983_4_2 = _loopval
      if (gs_983_4_2.ToolTip == "Sword") then
        _G.SelectWeapon = gs_983_4_2.Name
        local tmp787 = _G
      end
      goto L100927
      ::L100957::
      goto L101094
      ::L100960::
      if not (_G.ChooseWP == "Gun") then goto L101027 end
      _iter = {pairs(plr.Backpack:GetChildren())}
      ::L100994::
      _k3 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k3[1]
      if not (_k3[1] == nil) then
        goto L101024
      end
      gs_983_7_1 = _loopkey
      gs_983_7_2 = _loopval
      if (gs_983_7_2.ToolTip == "Gun") then
        _G.SelectWeapon = gs_983_7_2.Name
        local tmp788 = _G
      end
      goto L100994
      ::L101024::
      goto L101094
      ::L101027::
      if not (_G.ChooseWP == "Blox Fruit") then goto L101094 end
      _iter = {pairs(plr.Backpack:GetChildren())}
      ::L101061::
      _k4 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k4[1]
      if not (_k4[1] == nil) then
        goto L101091
      end
      gs_983_10_1 = _loopkey
      gs_983_10_2 = _loopval
      if (gs_983_10_2.ToolTip == "Blox Fruit") then
        _G.SelectWeapon = gs_983_10_2.Name
        local tmp789 = _G
      end
      goto L101061
      ::L101091::
      ::L101094::
      return
    end
    while (task.wait(0.5)) do
      pcall(fn_983)
    end
    return
  end
  fn_88 = function(...)
    local _,  a1 = ...
            gs_c88_1 = a1
    _G.SelectedFarmMode = gs_c88_1
    if _G.StartFarm then
      _G.Level = gs_c88_1 == "Level Farm"
      _G.AutoFarm_Bone = gs_c88_1 == "Farm Bone"
      _G.Auto_Cake_Prince = gs_c88_1 == "Farm Katakuri"
      _G.FarmTyrant = gs_c88_1 == "Farm Tyrant Of The Skies"
    end
    return
  end
  fn_89 = function(...)
    local _,  a1 = ...
        gs_c89_1 = a1
    _G.StartFarm = gs_c89_1
    _G.Level = false
    _G.AutoFarm_Bone = false
    _G.Auto_Cake_Prince = false
    _G.FarmTyrant = false
    if not gs_c89_1 then goto L100753 end
    if (_G.SelectedFarmMode == "Level Farm") then
      _G.Level = true
      goto L100751
    end
    if (_G.SelectedFarmMode == "Farm Bone") then
      _G.AutoFarm_Bone = true
      goto L100751
    end
    if (_G.SelectedFarmMode == "Farm Katakuri") then
      _G.Auto_Cake_Prince = true
      goto L100751
    end
    if not (_G.SelectedFarmMode == "Farm Tyrant Of The Skies") then goto L100751 end
    _G.FarmTyrant = true
    ::L100751::
    ::L100753::
    return
  end
  fn_90 = function(...)
    gs_c90_1 = gs_c1_52.Character
    if not gs_c90_1 then return {false} end
    gs_c90_2 = gs_c90_1:FindFirstChild("HumanoidRootPart")
    if not gs_c90_2 then return {false} end
    gs_c90_3 = Vector3.new(11520.8017578125, 0, 9829.513671875)
    gs_c90_4 = Vector3.new(gs_c90_2.Position.X, 0, gs_c90_2.Position.Z)
    return (gs_c90_4 - gs_c90_3).Magnitude < 2000
  end
  fn_91 = function(...)
        fn_979 = function(...)
                                                                                                                                                                                                                                  fn_980 = function(...)
        gs_c980_1 = ({{"TravelToSubmergedIsland"}})[1]
        (game:GetService("ReplicatedStorage")).Modules.Net.FindFirstChild((game:GetService("ReplicatedStorage")).Modules.Net, "RF/SubmarineWorkerSpeak")
        ((game:GetService("ReplicatedStorage")).Modules.Net.FindFirstChild((game:GetService("ReplicatedStorage")).Modules.Net, "RF/SubmarineWorkerSpeak")).InvokeServer((game:GetService("ReplicatedStorage")).Modules.Net.FindFirstChild((game:GetService("ReplicatedStorage")).Modules.Net, "RF/SubmarineWorkerSpeak"), unpack(gs_c980_1))
        return
      end
      fn_981 = function(...)
        gs_c1_53.Remotes.CommF_:InvokeServer("StartQuest", gs_979_7_1[3], gs_979_7_1[2])
        return
      end
      fn_982 = function(...)
        gs_c1_53.Remotes.CommF_:InvokeServer("StartQuest", gs_979_7_1[3], gs_979_7_1[2])
        return
      end
      local tmp754 = gs_c1_52.Character
      if not (gs_c1_52.Character) then
        tmp754 = gs_c1_52.CharacterAdded.Wait(gs_c1_52.CharacterAdded)
      end
      gs_c979_1 = tmp754
      gs_c979_2 = gs_c979_1:WaitForChild("HumanoidRootPart")
      if not gs_c979_2 then return end
      gs_c979_3 = gs_c1_52.Data.Level.Value
      gs_c979_4 = gs_c1_56()
      gs_c979_5 = gs_c1_52.PlayerGui.Main.Quest
      local tmp755 = gs_c979_5.Visible
      if gs_c979_5.Visible then
        tmp755 = gs_c979_5.Container.QuestTitle.Title.Text
      end
      local tmp756 = tmp755
      if not (tmp755) then
        tmp756 = ""
      end
      gs_c979_6 = tmp756
      local tmp757 = gs_c979_3 >= 2600
      if not (gs_c979_3 >= 2600) then goto L99522 end
      tmp757 = not gs_c979_4
      if not not gs_c979_4 then goto L99522 end
      tmp757 = not gs_c1_55
      if not not gs_c1_55 then goto L99522 end
      tmp757 = not gs_c1_54
      ::L99522::
      if not tmp757 then goto L99763 end
      gs_c1_55 = true
      gs_979_2_1 = CFrame.new(-16269.7041, 25.2288494, 1373.65955)
      gs_979_2_2 = 0
      ::L99552::
      local tmp758 = Sec
      if not (Sec) then
        tmp758 = 0.1
      end
      task.wait(tmp758)
      _tp(gs_979_2_1)
      gs_979_2_2 = gs_979_2_2 + 1
      local tmp759 = not _G.Level
      if not _G.Level then goto L99613 end
      tmp759 = not _G.StartFarm
      if not _G.StartFarm then goto L99613 end
      tmp759 = (gs_c979_2.Position - gs_979_2_1.Position).Magnitude <= 8
      if (gs_c979_2.Position - gs_979_2_1.Position).Magnitude <= 8 then goto L99613 end
      tmp759 = gs_979_2_2 > 20
      ::L99613::
      if not (tmp759) then
        goto L99552
      end
      local tmp760 = not _G.Level
      if _G.Level then
        tmp760 = not _G.StartFarm
      end
      if tmp760 then
        gs_c1_55 = false
        return
      end
      task.wait(1)
      pcall(fn_980)
      gs_979_2_3 = tick()
      ::L99666::
      task.wait(0.5)
      gs_979_5_1 = gs_c1_56()
      gs_979_5_2 = (gs_c979_2.Position - gs_979_2_1.Position).Magnitude > 50
      local tmp761 = gs_979_5_1
      if not (gs_979_5_1) then
        tmp761 = gs_979_5_2
      end
      if tmp761 then
        goto L99747
      end
      local tmp762 = not _G.Level
      if not _G.Level then goto L99744 end
      tmp762 = not _G.StartFarm
      if not _G.StartFarm then goto L99744 end
      tmp762 = ((tick()) - gs_979_2_3) > 15
      ::L99744::
      if tmp762 then goto L99747 end
      goto L99666
      ::L99747::
      task.wait(2)
      gs_c1_54 = true
      gs_c1_55 = false
      goto L100443
      ::L99763::
      local tmp763 = gs_c979_4
      if not (gs_c979_4) then
        tmp763 = gs_c979_3 < 2600
      end
      if not tmp763 then goto L100443 end
      gs_c1_54 = true
      gs_c1_55 = false
      local tmp764 = QuestNeta
      if QuestNeta then
        tmp764 = QuestNeta()
      end
      gs_979_7_1 = tmp764
      local tmp765 = not gs_979_7_1
      if gs_979_7_1 then
        tmp765 = not gs_979_7_1[1]
      end
      if tmp765 then
        task.wait(1)
        return
      end
      local tmp766 = gs_c979_5.Visible
      if gs_c979_5.Visible then
        tmp766 = not (string.find(gs_c979_6, gs_979_7_1[1]))
      end
      if tmp766 then
        gs_c1_53.Remotes.CommF_:InvokeServer("AbandonQuest")
        task.wait(0.2)
        return
      end
      if not gs_c979_5.Visible then
        gs_979_10_1 = gs_979_7_1[6]
        if gs_979_10_1 then
          _tp(gs_979_10_1)
          task.wait(1)
          if ((gs_c979_2.Position - gs_979_10_1.Position).Magnitude <= 10) then
            pcall(fn_981)
            task.wait(0.5)
          end
        else
          pcall(fn_982)
          task.wait(0.5)
        end
        return
      end
      gs_979_7_2 = gs_979_7_1[1]
      gs_979_7_3 = false
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L100007::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        local tmp772 = _iter
        goto L100198
      end
      gs_979_7_1 = _loopkey
      gs_979_7_2 = _loopval
      local tmp767 = gs_979_7_2.Name == gs_c979_2
      if (gs_979_7_2.Name == gs_c979_2) then
        tmp767 = gs_root_13.Alive(gs_979_7_2)
      end
      if not tmp767 then goto L100195 end
      gs_c979_3 = true
      ::L100040::
      local tmp768 = Sec
      if not (Sec) then
        tmp768 = 0.05
      end
      task.wait(tmp768)
      local tmp769 = GetFarmStandCFrame
      if GetFarmStandCFrame then
        tmp769 = GetFarmStandCFrame(gs_979_7_2)
      end
      gs_979_16_1 = tmp769
      if gs_979_16_1 then
        _tp(gs_979_16_1)
        goto L100139
      end
      local tmp770 = FarmOffset
      if not FarmOffset then goto L100117 end
      tmp770 = FarmOffset.Weapon
      if not FarmOffset.Weapon then goto L100117 end
      tmp770 = gs_979_7_2:FindFirstChild("HumanoidRootPart")
      ::L100117::
      if not tmp770 then goto L100139 end
      _tp(gs_979_7_2.HumanoidRootPart.CFrame * FarmOffset.Weapon)
      ::L100139::
      gs_root_13.Kill(gs_979_7_2, _G.Level)
      local tmp771 = not _G.Level
      if not _G.Level then goto L100189 end
      tmp771 = not _G.StartFarm
      if not _G.StartFarm then goto L100189 end
      tmp771 = not gs_979_7_2.Parent
      if not gs_979_7_2.Parent then goto L100189 end
      tmp771 = gs_979_7_2.Humanoid.Health <= 0
      if gs_979_7_2.Humanoid.Health <= 0 then goto L100189 end
      tmp771 = not gs_91_2_5.Visible
      ::L100189::
      if not (tmp771) then
        goto L100040
      end
      goto L100198
      ::L100195::
      goto L100007
      ::L100198::
      local tmp777 = tmp772
      if not not gs_c979_3 then goto L100351 end
      _iter = tmp772
      h100226_0_2 = j100198_0_2
      _iter = {pairs(gs_root_53:GetChildren())}
      ::L100226::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        local tmp776 = _iter
        goto L100348
      end
      gs_979_19_1 = _loopkey
      gs_979_19_2 = _loopval
      local tmp773 = gs_979_19_2.Name == gs_91_2_2
      if (gs_979_19_2.Name == gs_91_2_2) then
        tmp773 = gs_deepm1_13.Alive(gs_979_19_2)
      end
      if not tmp773 then goto L100345 end
      gs_91_2_3 = true
      local tmp774 = GetFarmStandCFrame
      if GetFarmStandCFrame then
        tmp774 = GetFarmStandCFrame(gs_979_19_2)
      end
      gs_979_21_1 = tmp774
      if gs_979_21_1 then
        _tp(gs_979_21_1)
        goto L100342
      end
      local tmp775 = FarmOffset
      if not FarmOffset then goto L100320 end
      tmp775 = FarmOffset.Weapon
      if not FarmOffset.Weapon then goto L100320 end
      tmp775 = gs_979_19_2:FindFirstChild("HumanoidRootPart")
      ::L100320::
      if not tmp775 then goto L100342 end
      _tp(gs_979_19_2.HumanoidRootPart.CFrame * FarmOffset.Weapon)
      ::L100342::
      goto L100348
      ::L100345::
      goto L100226
      ::L100348::
      tmp777 = _iter
      local tmp778 = tmp776
      ::L100351::
      local tmp781 = tmp777
      local tmp782 = tmp778
      if not not gs_91_2_3 then goto L100441 end
      _iter = tmp777
      h100383_0_2 = j100351_0_2
      _iter = tmp778
      h100383_1_2 = j100351_1_2
      _iter = {pairs(workspace._WorldOrigin.EnemySpawns:GetChildren())}
      ::L100383::
      _k3 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k3[1]
      if not (_k3[1] == nil) then
        local tmp779 = _iter
        goto L100438
      end
      gs_979_24_1 = _loopkey
      gs_979_24_2 = _loopval
      if (string.find(gs_979_24_2.Name, gs_91_1_2)) then
        _tp(gs_979_24_2.CFrame * (CFrame.new(0, 20, 0)))
      else
        goto L100383
      end
      ::L100438::
      tmp781 = _iter
      tmp782 = _iter
      local tmp780 = tmp779
      ::L100441::
      local tmp784 = tmp781
      local tmp785 = tmp782
      local tmp783 = tmp780
      ::L100443::
      return
    end
    ::L99333::
    local tmp752 = Sec
    if not (Sec) then
      tmp752 = 0.05
    end
    if (task.wait(tmp752)) then
      local tmp753 = _G.Level
      if _G.Level then
        tmp753 = _G.StartFarm
      end
      if tmp753 then
        pcall(fn_979)
      else
        gs_c1_55 = false
        gs_c1_54 = false
      end
      goto L99333
    end
    return
  end
  fn_92 = function(...)
      fn_977 = function(...)
                                          fn_978 = function(...)
        gs_c1_53.Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 1)
        return
      end
      gs_c977_1 = gs_c1_52.Character
      local tmp743 = gs_c977_1
      if gs_c977_1 then
        tmp743 = gs_c977_1:FindFirstChild("HumanoidRootPart")
      end
      gs_c977_2 = tmp743
      if not gs_c977_2 then return end
      local tmp744 = gs_c1_52.PlayerGui:FindFirstChild("Main")
      if (gs_c1_52.PlayerGui:FindFirstChild("Main")) then
        tmp744 = gs_c1_52.PlayerGui.Main:FindFirstChild("Quest")
      end
      gs_c977_3 = tmp744
      local tmp745 = _G.AcceptQuestB
      if not _G.AcceptQuestB then goto L99045 end
      tmp745 = gs_c977_3
      if not gs_c977_3 then goto L99045 end
      tmp745 = not gs_c977_3.Visible
      ::L99045::
      if tmp745 then
        gs_977_2_1 = CFrame.new(-9516.99316, 172.01718, 6078.46533)
        if ((gs_977_2_1.Position - gs_c977_2.Position).Magnitude > 15) then
          _tp(gs_977_2_1)
          task.wait(0.2)
          return
        end
        pcall(fn_978)
        task.wait(0.3)
        return
      end
      local tmp746 = GetConnectionEnemies
      if GetConnectionEnemies then
        tmp746 = GetConnectionEnemies(gs_c92_1)
      end
      gs_c977_4 = tmp746
      local tmp747 = gs_c977_4
      if gs_c977_4 then
        tmp747 = gs_c977_4:FindFirstChild("HumanoidRootPart")
      end
      if not tmp747 then goto L99289 end
      ::L99159::
      local tmp748 = Sec
      if not (Sec) then
        tmp748 = 0.05
      end
      task.wait(tmp748)
      local tmp749 = GetFarmStandCFrame
      if GetFarmStandCFrame then
        tmp749 = GetFarmStandCFrame(gs_c977_4)
      end
      gs_977_5_1 = tmp749
      if gs_977_5_1 then
        _tp(gs_977_5_1)
        goto L99241
      end
      local tmp750 = FarmOffset
      if FarmOffset then
        tmp750 = FarmOffset.Weapon
      end
      if not tmp750 then goto L99241 end
      _tp(gs_c977_4.HumanoidRootPart.CFrame * FarmOffset.Weapon)
      ::L99241::
      gs_c1_13.Kill(gs_c977_4, _G.AutoFarm_Bone)
      local tmp751 = not _G.AutoFarm_Bone
      if not _G.AutoFarm_Bone then goto L99284 end
      tmp751 = not _G.StartFarm
      if not _G.StartFarm then goto L99284 end
      tmp751 = not gs_c977_4.Parent
      if not gs_c977_4.Parent then goto L99284 end
      tmp751 = gs_c977_4.Humanoid.Health <= 0
      ::L99284::
      if not (tmp751) then
        goto L99159
      end
      goto L99310
      ::L99289::
      _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
      ::L99310::
      return
    end
    gs_c92_1 = ({{"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Possessed Mummy"}})[1]
    ::L98903::
    if (task.wait(0.1)) then
      local tmp742 = not _G.AutoFarm_Bone
      if _G.AutoFarm_Bone then
        tmp742 = not _G.StartFarm
      end
      if tmp742 then
        goto L98903
      end
      pcall(fn_977)
      goto L98903
    end
    return
  end
  fn_93 = function(...)
      fn_975 = function(...)
                                                                      fn_976 = function(...)
        gs_c1_53.Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest2", 1)
        return
      end
      local tmp726 = gs_c1_52.Character
      if gs_c1_52.Character then
        tmp726 = gs_c1_52.Character:FindFirstChild("HumanoidRootPart")
      end
      gs_c975_1 = tmp726
      if not gs_c975_1 then return end
      local tmp727 = gs_c1_52.PlayerGui:FindFirstChild("Main")
      if (gs_c1_52.PlayerGui:FindFirstChild("Main")) then
        tmp727 = gs_c1_52.PlayerGui.Main:FindFirstChild("Quest")
      end
      gs_c975_2 = tmp727
      gs_c975_3 = workspace:FindFirstChild("Enemies")
      local tmp728 = _G.AcceptQuestC
      if not _G.AcceptQuestC then goto L98396 end
      tmp728 = gs_c975_2
      if not gs_c975_2 then goto L98396 end
      tmp728 = not gs_c975_2.Visible
      ::L98396::
      if tmp728 then
        if ((gs_c93_2.Position - gs_c975_1.Position).Magnitude > 15) then
          _tp(gs_c93_2)
          task.wait(0.2)
          return
        end
        pcall(fn_976)
        task.wait(0.3)
        return
      end
      local tmp729 = gs_c975_3
      if gs_c975_3 then
        tmp729 = gs_c975_3:FindFirstChild("Cake Prince")
      end
      gs_c975_4 = tmp729
      local tmp730 = gs_c975_4
      if not gs_c975_4 then goto L98521 end
      tmp730 = gs_c975_4:FindFirstChild("HumanoidRootPart")
      if not (gs_c975_4:FindFirstChild("HumanoidRootPart")) then goto L98521 end
      tmp730 = gs_c975_4:FindFirstChild("Humanoid")
      if not (gs_c975_4:FindFirstChild("Humanoid")) then goto L98521 end
      tmp730 = gs_c975_4.Humanoid.Health > 0
      ::L98521::
      if not tmp730 then goto L98681 end
      ::L98524::
      local tmp731 = Sec
      if not (Sec) then
        tmp731 = 0.05
      end
      task.wait(tmp731)
      local tmp732 = GetFarmStandCFrame
      if GetFarmStandCFrame then
        tmp732 = GetFarmStandCFrame(gs_c975_4)
      end
      gs_975_5_1 = tmp732
      if gs_975_5_1 then
        _tp(gs_975_5_1)
        goto L98606
      end
      local tmp733 = FarmOffset
      if FarmOffset then
        tmp733 = FarmOffset.Weapon
      end
      if not tmp733 then goto L98606 end
      _tp(gs_c975_4.HumanoidRootPart.CFrame * FarmOffset.Weapon)
      ::L98606::
      if ((typeof(gs_c1_13)) == "table") then
        local tmp734 = gs_c1_13.Kill2
        if not (gs_c1_13.Kill2) then
          tmp734 = gs_c1_13.Kill
        end
        gs_975_8_1 = tmp734
        gs_975_8_1(gs_c975_4, _G.Auto_Cake_Prince)
      end
      local tmp735 = not _G.Auto_Cake_Prince
      if not _G.Auto_Cake_Prince then goto L98677 end
      tmp735 = not _G.StartFarm
      if not _G.StartFarm then goto L98677 end
      tmp735 = not gs_c975_4.Parent
      if not gs_c975_4.Parent then goto L98677 end
      tmp735 = gs_c975_4.Humanoid.Health <= 0
      ::L98677::
      if not (tmp735) then
        goto L98524
      end
      return
      ::L98681::
      local tmp736 = GetConnectionEnemies
      if GetConnectionEnemies then
        tmp736 = GetConnectionEnemies(gs_c93_1)
      end
      gs_c975_5 = tmp736
      local tmp737 = gs_c975_5
      if gs_c975_5 then
        tmp737 = gs_c975_5:FindFirstChild("HumanoidRootPart")
      end
      if not tmp737 then goto L98852 end
      ::L98722::
      local tmp738 = Sec
      if not (Sec) then
        tmp738 = 0.05
      end
      task.wait(tmp738)
      local tmp739 = GetFarmStandCFrame
      if GetFarmStandCFrame then
        tmp739 = GetFarmStandCFrame(gs_c975_5)
      end
      gs_975_10_1 = tmp739
      if gs_975_10_1 then
        _tp(gs_975_10_1)
        goto L98804
      end
      local tmp740 = FarmOffset
      if FarmOffset then
        tmp740 = FarmOffset.Weapon
      end
      if not tmp740 then goto L98804 end
      _tp(gs_c975_5.HumanoidRootPart.CFrame * FarmOffset.Weapon)
      ::L98804::
      gs_c1_13.Kill(gs_c975_5, _G.Auto_Cake_Prince)
      local tmp741 = not _G.Auto_Cake_Prince
      if not _G.Auto_Cake_Prince then goto L98847 end
      tmp741 = not _G.StartFarm
      if not _G.StartFarm then goto L98847 end
      tmp741 = not gs_c975_5.Parent
      if not gs_c975_5.Parent then goto L98847 end
      tmp741 = gs_c975_5.Humanoid.Health <= 0
      ::L98847::
      if not (tmp741) then
        goto L98722
      end
      goto L98862
      ::L98852::
      _tp(gs_c93_3)
      ::L98862::
      return
    end
    gs_c93_1 = ({{"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}})[1]
    gs_c93_2 = CFrame.new(-1927.92, 37.8, -12842.54)
    gs_c93_3 = CFrame.new(-2077, 252, -12373)
    ::L98239::
    if (task.wait(0.1)) then
      local tmp725 = not _G.Auto_Cake_Prince
      if _G.Auto_Cake_Prince then
        tmp725 = not _G.StartFarm
      end
      if tmp725 then
        goto L98239
      end
      pcall(fn_975)
      goto L98239
    end
    return
  end
  fn_94 = function(...)
      fn_974 = function(...)
          local tmp712 = gs_c1_52.Character
      if gs_c1_52.Character then
        tmp712 = gs_c1_52.Character:FindFirstChild("HumanoidRootPart")
      end
      gs_c974_1 = tmp712
      if not gs_c974_1 then return end
      gs_c974_2 = workspace:FindFirstChild("Enemies")
      local tmp713 = gs_c974_2
      if gs_c974_2 then
        tmp713 = gs_c974_2:FindFirstChild("Tyrant of the Skies")
      end
      gs_c974_3 = tmp713
      local tmp714 = gs_c974_3
      if not gs_c974_3 then goto L97821 end
      tmp714 = gs_c974_3:FindFirstChild("Humanoid")
      if not (gs_c974_3:FindFirstChild("Humanoid")) then goto L97821 end
      tmp714 = gs_c974_3.Humanoid.Health > 0
      if not (gs_c974_3.Humanoid.Health > 0) then goto L97821 end
      tmp714 = gs_c974_3:FindFirstChild("HumanoidRootPart")
      ::L97821::
      if not tmp714 then goto L97953 end
      ::L97824::
      local tmp715 = Sec
      if not (Sec) then
        tmp715 = 0.05
      end
      task.wait(tmp715)
      local tmp716 = GetFarmStandCFrame
      if GetFarmStandCFrame then
        tmp716 = GetFarmStandCFrame(gs_c974_3)
      end
      gs_974_3_1 = tmp716
      if gs_974_3_1 then
        _tp(gs_974_3_1)
        goto L97906
      end
      local tmp717 = FarmOffset
      if FarmOffset then
        tmp717 = FarmOffset.Weapon
      end
      if not tmp717 then goto L97906 end
      _tp(gs_c974_3.HumanoidRootPart.CFrame * FarmOffset.Weapon)
      ::L97906::
      gs_c1_13.Kill(gs_c974_3, _G.FarmTyrant)
      local tmp718 = not _G.FarmTyrant
      if not _G.FarmTyrant then goto L97949 end
      tmp718 = not _G.StartFarm
      if not _G.StartFarm then goto L97949 end
      tmp718 = not gs_c974_3.Parent
      if not gs_c974_3.Parent then goto L97949 end
      tmp718 = gs_c974_3.Humanoid.Health <= 0
      ::L97949::
      if not (tmp718) then
        goto L97824
      end
      return
      ::L97953::
      if ((gs_c974_1.Position - gs_c94_1).Magnitude > 300) then
        _tp(CFrame.new(gs_c94_1))
        task.wait(0.3)
        return
      end
      local tmp719 = GetConnectionEnemies
      if GetConnectionEnemies then
        tmp719 = GetConnectionEnemies(gs_c94_2)
      end
      gs_c974_4 = tmp719
      local tmp720 = gs_c974_4
      if gs_c974_4 then
        tmp720 = gs_c974_4:FindFirstChild("HumanoidRootPart")
      end
      if not tmp720 then goto L98164 end
      ::L98034::
      local tmp721 = Sec
      if not (Sec) then
        tmp721 = 0.05
      end
      task.wait(tmp721)
      local tmp722 = GetFarmStandCFrame
      if GetFarmStandCFrame then
        tmp722 = GetFarmStandCFrame(gs_c974_4)
      end
      gs_974_8_1 = tmp722
      if gs_974_8_1 then
        _tp(gs_974_8_1)
        goto L98116
      end
      local tmp723 = FarmOffset
      if FarmOffset then
        tmp723 = FarmOffset.Weapon
      end
      if not tmp723 then goto L98116 end
      _tp(gs_c974_4.HumanoidRootPart.CFrame * FarmOffset.Weapon)
      ::L98116::
      gs_c1_13.Kill(gs_c974_4, _G.FarmTyrant)
      local tmp724 = not _G.FarmTyrant
      if not _G.FarmTyrant then goto L98159 end
      tmp724 = not _G.StartFarm
      if not _G.StartFarm then goto L98159 end
      tmp724 = not gs_c974_4.Parent
      if not gs_c974_4.Parent then goto L98159 end
      tmp724 = gs_c974_4.Humanoid.Health <= 0
      ::L98159::
      if not (tmp724) then
        goto L98034
      end
      goto L98183
      ::L98164::
      _tp(CFrame.new(gs_c94_1))
      ::L98183::
      return
    end
    gs_c94_1 = Vector3.new(-16268.287, 152.616, 1390.773)
    gs_c94_2 = ({{"Serpent Hunter", "Skull Slayer", "Isle Champion", "Sun-kissed Warrior"}})[1]
    ::L97653::
    if (task.wait(0.1)) then
      local tmp711 = not _G.FarmTyrant
      if _G.FarmTyrant then
        tmp711 = not _G.StartFarm
      end
      if tmp711 then
        goto L97653
      end
      pcall(fn_974)
      goto L97653
    end
    return
  end
  fn_95 = function(...)
    fn_973 = function(...)
      gs_c1_57:SetDesc("Bones : " .. (GetM("Bones")))
      return
    end
    while (wait(0.2)) do
      pcall(fn_973)
    end
    return
  end
  fn_96 = function(...)
    local _,  a1 = ...
    gs_c96_1 = a1
    _G.AutoHytHallow = gs_c96_1
    return
  end
  fn_97 = function(...)
    fn_972 = function(...)
                  gs_c972_1 = GetConnectionEnemies("Soul Reaper")
      if not gs_c972_1 then goto L97422 end
      ::L97378::
      task.wait()
      gs_c1_13.Kill(gs_c972_1, _G.AutoHytHallow)
      local tmp708 = gs_c972_1.Humanoid.Health <= 0
      if not (gs_c972_1.Humanoid.Health <= 0) then
        tmp708 = _G.AutoHytHallow == false
      end
      if not (tmp708) then
        goto L97378
      end
      goto L97559
      ::L97422::
      if not not (GetBP("Hallow Essence")) then goto L97488 end
      ::L97435::
      task.wait(0.1)
      gs_c1_53.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
      local tmp709 = _G.AutoHytHallow == false
      if not (_G.AutoHytHallow == false) then
        tmp709 = GetBP("Hallow Essence")
      end
      if not (tmp709) then
        goto L97435
      end
      goto L97558
      ::L97488::
      ::L97489::
      wait(0.1)
      _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
      local tmp710 = _G.AutoHytHallow == false
      if not (_G.AutoHytHallow == false) then
        tmp710 = gs_c1_52.Character.HumanoidRootPart.CFrame == (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
      end
      if not (tmp710) then
        goto L97489
      end
      EquipWeapon("Hallow Essence")
      ::L97558::
      ::L97559::
      return
    end
    while (wait(Sec)) do
      if _G.AutoHytHallow then
        pcall(fn_972)
      end
    end
    return
  end
  fn_98 = function(...)
    local _,  a1 = ...
    gs_c98_1 = a1
    _G.Auto_Random_Bone = gs_c98_1
    return
  end
  fn_99 = function(...)
    fn_971 = function(...)
      if not _G.Auto_Random_Bone then goto L97316 end
      ::L97276::
      task.wait()
      gs_c1_53.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
      if _G.Auto_Random_Bone then
        goto L97276
      end
      ::L97316::
      return
    end
    while (wait(Sec)) do
      pcall(fn_971)
    end
    return
  end
  fn_100 = function(...)
    local _,  a1 = ...
    gs_c100_1 = a1
    _G.AutoFarmChest = gs_c100_1
    return
  end
  fn_101 = function(...)
    fn_970 = function(...)
                      local _lv1
      local _lm1
      local _ls1
              gs_c970_1 = game:GetService("CollectionService")
      gs_c970_2 = game:GetService("Players")
      gs_c970_3 = gs_c970_2.LocalPlayer
      local tmp705 = gs_c970_3.Character
      if not (gs_c970_3.Character) then
        tmp705 = gs_c970_3.CharacterAdded.Wait(gs_c970_3.CharacterAdded)
      end
      gs_c970_4 = tmp705
      if not gs_c970_4 then return end
      gs_c970_5 = (gs_c970_4.GetPivot(gs_c970_4)).Position
      gs_c970_6 = gs_c970_1:GetTagged("_ChestTagged")
      gs_c970_7 = math.huge
      gs_c970_8 = ({math.huge})[2]
      _iter = 1 - 1
      h97114_0_2 = #gs_c970_6
      h97114_0_3 = 1
      _lv1 = _iter + h97114_0_3
      _lm1 = h97114_0_2
      _ls1 = h97114_0_3
      ::FOR_97114::
      _lv1 = _lv1 + _ls1
      if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_97114 end
      gs_970f97114_1 = _lv1
      gs_970f97114_2 = gs_c970_6[gs_970f97114_1]
      gs_970f97114_3 = ((gs_970f97114_2.GetPivot(gs_970f97114_2)).Position - gs_c970_5).Magnitude
      local tmp706 = not SelectedIsland
      if not SelectedIsland then goto L97170 end
      tmp706 = gs_970f97114_2:IsDescendantOf(SelectedIsland)
      ::L97170::
      if not tmp706 then goto L97205 end
      local tmp707 = not (gs_970f97114_2:GetAttribute("IsDisabled"))
      if not not (gs_970f97114_2:GetAttribute("IsDisabled")) then goto L97194 end
      tmp707 = gs_970f97114_3 < gs_c970_7
      ::L97194::
      if not tmp707 then goto L97203 end
      gs_c970_7 = gs_970f97114_3
      gs_c970_8 = gs_970f97114_2
      ::L97203::
      ::L97205::
      goto FOR_97114
      ::FOR_END_97114::
      if gs_c970_8 then
        _tp(gs_c970_8.GetPivot(gs_c970_8))
      end
      return
    end
    while (wait(Sec)) do
      if _G.AutoFarmChest then
        pcall(fn_970)
      end
    end
    return
  end
  fn_102 = function(...)
    local _,  a1 = ...
    gs_c102_1 = a1
    _G.AutoBerry = gs_c102_1
    return
  end
  fn_103 = function(...)
          local _lv1
    local _lm1
    local _ls1
                            local _lv3
    local _lm3
    local _ls3
                            ::L96624::
    if not (wait(Sec)) then goto L96932 end
    if not _G.AutoBerry then goto L96930 end
    gs_103_2_1 = game:GetService("CollectionService")
    gs_103_2_2 = game:GetService("Players")
    gs_103_2_3 = gs_103_2_2.LocalPlayer
    gs_103_2_4 = gs_103_2_1:GetTagged("BerryBush")
    gs_103_2_5 = math.huge
    gs_103_2_6 = ({math.huge})[2]
    _iter = 1 - 1
    h96728_0_2 = #gs_103_2_4
    h96728_0_3 = 1
    _lv1 = _iter + h96728_0_3
    _lm1 = h96728_0_2
    _ls1 = h96728_0_3
    ::FOR_96728::
    _lv1 = _lv1 + _ls1
    if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_96728 end
    gs_103f96728_1 = _lv1
    gs_103f96728_2 = gs_103_2_4[gs_103f96728_1]
    _iter = _iter + h96728_0_3
    h96762_0_2 = h96728_0_2
    h96762_0_3 = h96728_0_3
    _iter = {pairs(gs_103f96728_2.GetAttributes(gs_103f96728_2))}
    ::L96762::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if _k2[1] == nil then goto L96764 end
    goto L96923
    ::L96764::
    gs_103f96728_1 = _loopkey
    gs_103f96728_2 = _loopval
    local tmp702 = not BerryArray
    if not BerryArray then goto L96790 end
    tmp702 = table.find(BerryArray, gs_103f96728_2)
    ::L96790::
    local tmp704 = _iter
    if not tmp702 then goto L96920 end
    _tp(gs_103_2_2.Parent.GetPivot(gs_103_2_2.Parent))
    _iter = _iter
    h96819_0_2 = h96762_0_2
    h96819_0_3 = h96762_0_3
    _iter = 1 - 1
    h96819_2_2 = #gs_103_1_4
    h96819_2_3 = 1
    _lv3 = _iter + h96819_2_3
    _lm3 = h96819_2_2
    _ls3 = h96819_2_3
    ::FOR_96819::
    _lv3 = _lv3 + _ls3
    if not ((_ls3 < 0 and _lv3 >= _lm3) or (_ls3 > 0 and _lv3 <= _lm3)) then goto FOR_END_96819 end
    gs_103f96819_1 = _lv3
    gs_103f96819_2 = gs_103_1_4[gs_103f96819_1]
    _iter = _iter
    h96853_0_2 = h96819_0_2
    h96853_0_3 = h96819_0_3
    _iter = _iter + h96819_2_3
    h96853_2_2 = h96819_2_2
    h96853_2_3 = h96819_2_3
    _iter = {pairs(gs_103f96819_2:GetChildren())}
    ::L96853::
    _k4 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k4[1]
    if _k4[1] == nil then goto L96855 end
    goto L96913
    ::L96855::
    gs_103f96819_1 = _loopkey
    gs_103f96819_2 = _loopval
    local tmp703 = not BerryArray
    if not BerryArray then goto L96881 end
    tmp703 = table.find(BerryArray, gs_103f96819_2)
    ::L96881::
    if not tmp703 then goto L96910 end
    _tp(gs_103f96819_2.WorldPivot)
    fireproximityprompt(gs_103f96819_2.ProximityPrompt, math.huge)
    ::L96910::
    goto L96853
    ::L96913::
    goto FOR_96819
    ::FOR_END_96819::
    ::L96917::
    tmp704 = _iter
    ::L96920::
    _iter = tmp704
    h96762_0_2 = j96920_0_2
    h96762_0_3 = j96920_0_3
    goto L96762
    ::L96923::
    goto FOR_96728
    ::FOR_END_96728::
    ::L96930::
    goto L96624
    ::L96932::
    return
  end
  fn_104 = function(...)
    local _,  a1 = ...
    gs_c104_1 = a1
    _G.AutoHop_Dough = gs_c104_1
    return
  end
  fn_105 = function(...)
    fn_969 = function(...)
              gs_c969_1 = game:GetService("HttpService")
      gs_c969_2 = ({{}})[1]
      gs_c969_3 = game:HttpGet("https://games.roblox.com/v1/games/" .. (game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
      gs_c969_4 = gs_c969_1:JSONDecode(gs_c969_3)
      _iter = {pairs(gs_c969_4.data)}
      ::L96516::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L96554
      end
      gs_c969_1 = _loopkey
      gs_c969_2 = _loopval
      if (gs_c969_2.playing < gs_c969_2.maxPlayers) then
        table.insert(gs_c105_2, gs_c969_2.id)
      end
      goto L96516
      ::L96554::
      if (#gs_969_1_2 > 0) then
        game:GetService("TeleportService")
        (game:GetService("TeleportService")).TeleportToPlaceInstance(game:GetService("TeleportService"), game.PlaceId, gs_969_1_2[math.random(1, #gs_969_1_2)], game.Players.LocalPlayer)
      end
      return
    end
    pcall(fn_969)
    return
  end
  fn_106 = function(...)
    fn_968 = function(...)
              gs_c968_1 = GetConnectionEnemies("Dough King")
      if not gs_c968_1 then goto L96352 end
      ::L96302::
      task.wait()
      gs_c1_13.Kill(gs_c968_1, _G.AutoHop_Dough)
      local tmp700 = not _G.AutoHop_Dough
      if not _G.AutoHop_Dough then goto L96347 end
      tmp700 = not gs_c968_1.Parent
      if not gs_c968_1.Parent then goto L96347 end
      tmp700 = gs_c968_1.Humanoid.Health <= 0
      ::L96347::
      if not (tmp700) then
        goto L96302
      end
      goto L96418
      ::L96352::
      _tp(CFrame.new(-1943.6765, 251.5095, -12337.8809))
      task.wait(2)
      gs_968_3_1 = GetConnectionEnemies("Dough King")
      local tmp701 = not gs_968_3_1
      if not gs_968_3_1 then
        tmp701 = _G.AutoHop_Dough
      end
      if tmp701 then
        gs_c1_58()
      end
      ::L96418::
      return
    end
    while (task.wait()) do
      if _G.AutoHop_Dough then
        pcall(fn_968)
      end
    end
    return
  end
  fn_107 = function(...)
          gs_c107_1 = workspace.Map.TikiOutpost.IslandModel
    gs_c107_2 = ({{gs_c107_1.Eye1, gs_c107_1.Eye2, gs_c107_1.IslandChunks.E.Eye3, gs_c107_1.IslandChunks.E.Eye4}})[1]
    gs_c107_3 = 0
    _iter = {ipairs(gs_c107_2)}
    ::L96204::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L96236
    end
    gs_c107_1 = _loopkey
    gs_c107_2 = _loopval
    local tmp699 = gs_c107_2
    if gs_c107_2 then
      tmp699 = gs_c107_2.Transparency ~= 1
    end
    if tmp699 then
      gs_c1_3 = gs_c1_3 + 1
    end
    goto L96204
    ::L96236::
    gs_107_1_4 = gs_107_1_3 == 4
    return gs_107_1_3, gs_107_1_4
  end
  fn_108 = function(...)
      gs_c108_1 = false
    ::L96066::
    if not (task.wait(1)) then goto L96136 end
    gs_108_1_1 = Check_Eye()
    gs_108_1_2 = ({Check_Eye()})[2]
    gs_c1_59:SetDesc("Eyes: " .. (gs_108_1_1 .. "/4"))
    local tmp698 = gs_108_1_2
    if gs_108_1_2 then
      tmp698 = not gs_c108_1
    end
    if tmp698 then
      gs_c108_1 = true
      goto L96134
    end
    if not not gs_108_1_2 then goto L96134 end
    gs_c108_1 = false
    ::L96134::
    goto L96066
    ::L96136::
    return
  end
  fn_109 = function(...)
    fn_967 = function(...)
      while (wait(1)) do
        if (workspace.Enemies:FindFirstChild("Tyrant of the Skies")) then
          gs_c1_60:SetDesc("\226\156\133")
        else
          gs_c1_60:SetDesc("\226\157\140")
        end
      end
      return
    end
    pcall(fn_967)
    return
  end
  fn_110 = function(...)
    fn_966 = function(...)
          gs_c966_1 = string.match(gs_c1_53.Remotes.CommF_:InvokeServer("CakePrinceSpawner"), "%d+")
      if gs_c966_1 then
        if not (500 - (tonumber(gs_c966_1))) then
        end
        gs_c1_61:SetDesc("Killed : " .. j95970_1_3)
      end
      return
    end
    while (wait(0.2)) do
      pcall(fn_966)
    end
    return
  end
  fn_111 = function(...)
    while (wait(1)) do
      gs_111_1_1 = (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "Bones", "Check")
      gs_c1_62:SetDesc("You Have: " .. ((tostring(gs_111_1_1)) .. " Bones"))
    end
    return
  end
  fn_112 = function(...)
    local _,  a1 = ...
    gs_c112_1 = a1
    _G.FarmPhaBinh = gs_c112_1
    return
  end
  fn_113 = function(...)
    local _,  a1 = ...
    gs_c113_1 = a1
    gs_c113_2 = game:GetService("VirtualInputManager")
    gs_c113_2:SendKeyEvent(true, gs_c113_1, false, game)
    wait(0.05)
    gs_c113_2:SendKeyEvent(false, gs_c113_1, false, game)
    return
  end
  fn_114 = function(...)
    local _,  a1 = ...
                              fn_965 = function(...)
      gs_deepm1_63(gs_114_3_2)
      return
    end
    gs_c114_1 = a1
    gs_c114_2 = gs_c1_52.Character
    gs_c114_3 = gs_c1_52.Backpack
    local tmp692 = gs_c114_2
    if not gs_c114_2 then goto L95581 end
    tmp692 = gs_c114_2:FindFirstChild("Humanoid")
    if not (gs_c114_2:FindFirstChild("Humanoid")) then goto L95581 end
    tmp692 = gs_c114_2.Humanoid.Health > 0
    ::L95581::
    if not tmp692 then return end
    _iter = {pairs(gs_c114_3:GetChildren())}
    ::L95608::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      local tmp696 = _iter
      goto L95730
    end
    gs_c114_1 = _loopkey
    gs_c114_2 = _loopval
    local tmp693 = gs_c114_2:IsA("Tool")
    if (gs_c114_2:IsA("Tool")) then
      tmp693 = gs_c114_2.ToolTip == gs_c1_1
    end
    if not tmp693 then goto L95727 end
    gs_c114_2.Parent = gs_c1_2
    wait(0.12)
    _iter = {ipairs({"Z", "X", "C", "V", "F"})}
    ::L95679::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      local tmp694 = _iter
      goto L95719
    end
    gs_114_3_1 = _loopkey
    gs_114_3_2 = _loopval
    if not _G.FarmPhaBinh then
    else
      pcall(fn_965)
      wait(0.12)
      goto L95679
    end
    ::L95719::
    gs_c1_2.Parent = gs_root_3
    local tmp697 = tmp694
    local tmp695 = gs_c1_2
    goto L95730
    ::L95727::
    goto L95608
    ::L95730::
    return
  end
  fn_115 = function(...)
    fn_964 = function(...)
                                      local tmp687 = gs_c1_52
      if not gs_c1_52 then goto L95326 end
      tmp687 = gs_c1_52.Character
      if not gs_c1_52.Character then goto L95326 end
      tmp687 = gs_c1_52.Character:FindFirstChild("HumanoidRootPart")
      if not (gs_c1_52.Character:FindFirstChild("HumanoidRootPart")) then goto L95326 end
      tmp687 = gs_c1_52.Character:FindFirstChild("Humanoid")
      if not (gs_c1_52.Character:FindFirstChild("Humanoid")) then goto L95326 end
      tmp687 = gs_c1_52.Character.Humanoid.Health > 0
      ::L95326::
      if not tmp687 then return end
      _iter = {ipairs(gs_c1_65)}
      ::L95342::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        local tmp691 = _iter
        goto L95529
      end
      gs_c964_1 = _loopkey
      gs_c964_2 = _loopval
      if not _G.FarmPhaBinh then
        goto L95529
      end
      _tp(gs_c964_2)
      gs_c964_3 = false
      gs_c964_4 = tick()
      ::L95391::
      local tmp688 = ((tick()) - gs_c964_4) < 12
      if not (((tick()) - gs_c964_4) < 12) then goto L95416 end
      tmp688 = not gs_c964_3
      if not not gs_c964_3 then goto L95416 end
      tmp688 = _G.FarmPhaBinh
      ::L95416::
      if not tmp688 then goto L95491 end
      local tmp689 = gs_root_52.Character
      if gs_root_52.Character then
        tmp689 = gs_root_52.Character:FindFirstChild("HumanoidRootPart")
      end
      gs_964_4_1 = tmp689
      if not gs_964_4_1 then
        goto L95491
      end
      gs_964_4_2 = (gs_964_4_1.Position - gs_c964_2.Position).Magnitude
      if (gs_964_4_2 <= 3) then
        gs_c964_3 = true
      else
        wait(0.1)
        goto L95391
      end
      ::L95491::
      local tmp690 = _G.FarmPhaBinh
      if _G.FarmPhaBinh then
        tmp690 = gs_c964_3
      end
      if tmp690 then
        gs_root_64("Melee")
        gs_root_64("Sword")
        gs_root_64("Gun")
      end
      goto L95342
      ::L95529::
      return
    end
    while (wait(Sec)) do
      if _G.FarmPhaBinh then
        pcall(fn_964)
      end
    end
    return
  end
  fn_116 = function(...)
    local _,  a1 = ...
    gs_c116_1 = a1
    _G.FarmPhaBinh = gs_c116_1
    return
  end
  fn_117 = function(...)
    local _,  a1 = ...
    gs_c117_1 = a1
    gs_c117_2 = game:GetService("VirtualInputManager")
    gs_c117_2:SendKeyEvent(true, gs_c117_1, false, game)
    wait(0.05)
    gs_c117_2:SendKeyEvent(false, gs_c117_1, false, game)
    return
  end
  fn_118 = function(...)
    local _,  a1 = ...
                              fn_963 = function(...)
      gs_deepm1_66(gs_118_3_2)
      return
    end
    gs_c118_1 = a1
    gs_c118_2 = gs_c1_52.Character
    gs_c118_3 = gs_c1_52.Backpack
    local tmp681 = gs_c118_2
    if not gs_c118_2 then goto L94998 end
    tmp681 = gs_c118_2:FindFirstChild("Humanoid")
    if not (gs_c118_2:FindFirstChild("Humanoid")) then goto L94998 end
    tmp681 = gs_c118_2.Humanoid.Health > 0
    ::L94998::
    if not tmp681 then return end
    _iter = {pairs(gs_c118_3:GetChildren())}
    ::L95025::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      local tmp684 = _iter
      goto L95147
    end
    gs_c118_1 = _loopkey
    gs_c118_2 = _loopval
    local tmp682 = gs_c118_2:IsA("Tool")
    if (gs_c118_2:IsA("Tool")) then
      tmp682 = gs_c118_2.ToolTip == gs_c1_1
    end
    if not tmp682 then goto L95144 end
    gs_c118_2.Parent = gs_c1_2
    wait(0.12)
    _iter = {ipairs({"Z", "X", "C", "V", "F"})}
    ::L95096::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      local tmp683 = _iter
      goto L95136
    end
    gs_118_3_1 = _loopkey
    gs_118_3_2 = _loopval
    if not _G.FarmPhaBinh then
    else
      pcall(fn_963)
      wait(0.12)
      goto L95096
    end
    ::L95136::
    gs_c1_2.Parent = gs_root_3
    local tmp685 = tmp683
    local tmp686 = gs_c1_2
    goto L95147
    ::L95144::
    goto L95025
    ::L95147::
    return
  end
  fn_119 = function(...)
    fn_962 = function(...)
                                      local tmp676 = gs_c1_52
      if not gs_c1_52 then goto L94743 end
      tmp676 = gs_c1_52.Character
      if not gs_c1_52.Character then goto L94743 end
      tmp676 = gs_c1_52.Character:FindFirstChild("HumanoidRootPart")
      if not (gs_c1_52.Character:FindFirstChild("HumanoidRootPart")) then goto L94743 end
      tmp676 = gs_c1_52.Character:FindFirstChild("Humanoid")
      if not (gs_c1_52.Character:FindFirstChild("Humanoid")) then goto L94743 end
      tmp676 = gs_c1_52.Character.Humanoid.Health > 0
      ::L94743::
      if not tmp676 then return end
      _iter = {ipairs(gs_c1_68)}
      ::L94759::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        local tmp680 = _iter
        goto L94946
      end
      gs_c962_1 = _loopkey
      gs_c962_2 = _loopval
      if not _G.FarmPhaBinh then
        goto L94946
      end
      _tp(gs_c962_2)
      gs_c962_3 = false
      gs_c962_4 = tick()
      ::L94808::
      local tmp677 = ((tick()) - gs_c962_4) < 12
      if not (((tick()) - gs_c962_4) < 12) then goto L94833 end
      tmp677 = not gs_c962_3
      if not not gs_c962_3 then goto L94833 end
      tmp677 = _G.FarmPhaBinh
      ::L94833::
      if not tmp677 then goto L94908 end
      local tmp678 = gs_root_52.Character
      if gs_root_52.Character then
        tmp678 = gs_root_52.Character:FindFirstChild("HumanoidRootPart")
      end
      gs_962_4_1 = tmp678
      if not gs_962_4_1 then
        goto L94908
      end
      gs_962_4_2 = (gs_962_4_1.Position - gs_c962_2.Position).Magnitude
      if (gs_962_4_2 <= 3) then
        gs_c962_3 = true
      else
        wait(0.1)
        goto L94808
      end
      ::L94908::
      local tmp679 = _G.FarmPhaBinh
      if _G.FarmPhaBinh then
        tmp679 = gs_c962_3
      end
      if tmp679 then
        gs_root_67("Melee")
        gs_root_67("Sword")
        gs_root_67("Gun")
      end
      goto L94759
      ::L94946::
      return
    end
    while (wait(Sec)) do
      if _G.FarmPhaBinh then
        pcall(fn_962)
      end
    end
    return
  end
  fn_120 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c120_1 = a1
    _t1 = getgenv()
    _t1.SelectMaterial = gs_c120_1
    return
  end
  fn_121 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c121_1 = a1
    _t1 = getgenv()
    _t1.AutoMaterial = gs_c121_1
    return
  end
  fn_122 = function(...)
    fn_959 = function(...)
      local _,  a1, a2 = ...
              gs_c959_1 = a1
      gs_c959_2 = a2
      local tmp674 = gs_c959_1:FindFirstChild("Humanoid")
      if not (gs_c959_1:FindFirstChild("Humanoid")) then goto L94550 end
      tmp674 = gs_c959_1:FindFirstChild("HumanoidRootPart")
      if not (gs_c959_1:FindFirstChild("HumanoidRootPart")) then goto L94550 end
      tmp674 = gs_c959_1.Humanoid.Health > 0
      ::L94550::
      if not tmp674 then goto L94621 end
      if not (gs_c959_1.Name == gs_c959_2) then goto L94619 end
      ::L94561::
      wait()
      gs_c1_13.Kill(gs_c959_1, (getgenv()).AutoMaterial)
      local tmp675 = not (getgenv()).AutoMaterial
      if not (getgenv()).AutoMaterial then goto L94614 end
      tmp675 = not gs_c959_1.Parent
      if not gs_c959_1.Parent then goto L94614 end
      tmp675 = gs_c959_1.Humanoid.Health <= 0
      ::L94614::
      if not (tmp675) then
        goto L94561
      end
      ::L94619::
      ::L94621::
      return
    end
    fn_960 = function(...)
                      _iter = {pairs((game:GetService("Workspace"))._WorldOrigin.EnemySpawns.GetChildren((game:GetService("Workspace"))._WorldOrigin.EnemySpawns))}
      ::L94407::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L94502
      end
      gs_c960_1 = _loopkey
      gs_c960_2 = _loopval
      _iter = {ipairs(MMon)}
      ::L94429::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L94498
      end
      gs_c960_1 = _loopkey
      gs_c960_2 = _loopval
      if (string.find(gs_c122_2.Name, gs_c960_2)) then
        if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - gs_c122_2.Position).Magnitude >= 10) then
          _tp(gs_c122_2.CFrame * Pos)
        end
      end
      goto L94429
      ::L94498::
      goto L94407
      ::L94502::
      return
    end
    fn_961 = function(...)
                      if (getgenv()).SelectMaterial then
        MaterialMon((getgenv()).SelectMaterial)
        _tp(MPos)
      end
      _iter = {ipairs(MMon)}
      ::L94299::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L94359
      end
      gs_c961_1 = _loopkey
      gs_c961_2 = _loopval
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L94334::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L94355
      end
      gs_c961_1 = _loopkey
      gs_c961_2 = _loopval
      gs_root_1(gs_c961_2, gs_122_2_2)
      goto L94334
      ::L94355::
      goto L94299
      ::L94359::
      gs_122_1_2()
      return
    end
    gs_c122_1 = fn_959
    gs_c122_2 = fn_960
    while (wait()) do
      if (getgenv()).AutoMaterial then
        pcall(fn_961)
      end
    end
    return
  end
  fn_123 = function(...)
    local _,  a1 = ...
    gs_c123_1 = a1
    _G.AutoEctoplasm = gs_c123_1
    return
  end
  fn_124 = function(...)
    fn_958 = function(...)
          if not _G.AutoEctoplasm then goto L94197 end
      gs_958_1_1 = ({{"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior"}})[1]
      gs_958_1_2 = GetConnectionEnemies(gs_958_1_1)
      if not (gs_c1_13.Alive(gs_958_1_2)) then goto L94164 end
      ::L94116::
      wait()
      gs_c1_13.Kill(gs_958_1_2, _G.AutoEctoplasm)
      local tmp673 = not _G.AutoEctoplasm
      if not _G.AutoEctoplasm then goto L94159 end
      tmp673 = not gs_958_1_2.Parent
      if not gs_958_1_2.Parent then goto L94159 end
      tmp673 = gs_958_1_2.Humanoid.Health <= 0
      ::L94159::
      if not (tmp673) then
        goto L94116
      end
      goto L94195
      ::L94164::
      gs_c1_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      ::L94195::
      ::L94197::
      return
    end
    while (wait(Sec)) do
      pcall(fn_958)
    end
    return
  end
  fn_125 = function(...)
    local _,  a1 = ...
    gs_c125_1 = a1
    _G.FindBoss = gs_c125_1
    return
  end
  fn_126 = function(...)
    local _,  a1 = ...
    fn_956 = function(...)
      fn_957 = function(...)
          local tmp667 = (QuestBeta())[2] ~= nil
        if ((QuestBeta())[2] ~= nil) then
          tmp667 = (QuestBeta())[3] ~= nil
        end
        gs_c957_1 = tmp667
        gs_c957_2 = gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
        local tmp668 = _G.AcceptQuestBoss
        if _G.AcceptQuestBoss then
          tmp668 = gs_c957_1
        end
        if not tmp668 then goto L93792 end
        if not (string.find(gs_c957_2, (QuestBeta())[0])) then
          gs_c1_53.Remotes.CommF_:InvokeServer("AbandonQuest")
        end
        if (gs_c1_52.PlayerGui.Main.Quest.Visible == false) then
          _tp((QuestBeta())[5])
          if ((Root.Position - (QuestBeta())[5].Position).Magnitude <= 5) then
            gs_c1_53.Remotes.CommF_:InvokeServer("StartQuest", (QuestBeta())[3], (QuestBeta())[2])
          end
          goto L93790
        end
        if not (gs_c1_52.PlayerGui.Main.Quest.Visible == true) then goto L93790 end
        if not (workspace.Enemies:FindFirstChild((QuestBeta())[1])) then goto L93699 end
        for _key, item in pairs(workspace.Enemies:GetChildren()) do
          gs_957_6_1 = _key
          gs_957_6_2 = item
          local tmp669 = gs_root_13.Alive(gs_957_6_2)
          if (gs_root_13.Alive(gs_957_6_2)) then
          tmp669 = gs_957_6_2.Name == (QuestBeta())[1]
          end
          if not tmp669 then goto L93693 end
          if not (string.find(gs_956_2_2, (QuestBeta())[0])) then goto L93672 end
          ::L93610::
          wait()
          gs_root_13.Kill(gs_957_6_2, _G.FarmBoss)
          local tmp670 = not _G.FarmBoss
          if not _G.FarmBoss then goto L93667 end
          tmp670 = gs_957_6_2.Humanoid.Health <= 0
          if gs_957_6_2.Humanoid.Health <= 0 then goto L93667 end
          tmp670 = not gs_957_6_2.Parent
          if not gs_957_6_2.Parent then goto L93667 end
          tmp670 = gs_root_52.PlayerGui.Main.Quest.Visible == false
          ::L93667::
          if not (tmp670) then
          goto L93610
          end
          goto L93691
          ::L93672::
          gs_root_53.Remotes.CommF_:InvokeServer("AbandonQuest")
          ::L93691::
          ::L93693::
        end
        goto L93788
        ::L93699::
        _tp((QuestBeta())[4])
        if (gs_c1_53:FindFirstChild((QuestBeta())[1])) then
          _tp((gs_c1_53:FindFirstChild((QuestBeta())[1])).HumanoidRootPart.CFrame * (CFrame.new(0, 30, 0)))
        end
        ::L93788::
        ::L93790::
        goto L94028
        ::L93792::
        if not (workspace.Enemies:FindFirstChild((QuestBeta())[1])) then goto L93938 end
        _iter = {pairs(workspace.Enemies:GetChildren())}
        ::L93845::
        _k2 = {_loopkey(_loopval, _loopstate)}
        _loopstate = _k2[1]
        if not (_k2[1] == nil) then
          goto L93935
        end
        gs_957_15_1 = _loopkey
        gs_957_15_2 = _loopval
        local tmp671 = gs_root_13.Alive(gs_957_15_2)
        if (gs_root_13.Alive(gs_957_15_2)) then
          tmp671 = gs_957_15_2.Name == (QuestBeta())[1]
        end
        if not tmp671 then goto L93932 end
        ::L93884::
        wait()
        gs_root_13.Kill(gs_957_15_2, _G.FarmBoss)
        local tmp672 = not _G.FarmBoss
        if not _G.FarmBoss then goto L93927 end
        tmp672 = gs_957_15_2.Humanoid.Health <= 0
        if gs_957_15_2.Humanoid.Health <= 0 then goto L93927 end
        tmp672 = not gs_957_15_2.Parent
        ::L93927::
        if not (tmp672) then
          goto L93884
        end
        ::L93932::
        goto L93845
        ::L93935::
        goto L94027
        ::L93938::
        _tp((QuestBeta())[4])
        if (gs_c1_53:FindFirstChild((QuestBeta())[1])) then
          _tp((gs_c1_53:FindFirstChild((QuestBeta())[1])).HumanoidRootPart.CFrame * (CFrame.new(0, 30, 0)))
        end
        ::L94027::
        ::L94028::
        return
      end
      while (wait(Sec)) do
        if _G.FarmBoss then
          pcall(fn_957)
        end
      end
      return
    end
    gs_c126_1 = a1
    _G.FarmBoss = gs_c126_1
    spawn(fn_956)
    return
  end
  fn_127 = function(...)
    local _,  a1 = ...
    gs_c127_1 = a1
    _G.AcceptQuestBoss = gs_c127_1
    return
  end
  fn_128 = function(...)
    local _,  a1 = ...
    gs_c128_1 = a1
    _G.AutoFarmAllBoss = gs_c128_1
    return
  end
  fn_129 = function(...)
    fn_955 = function(...)
                                  gs_c955_1 = game.Players.LocalPlayer
      local tmp662 = not gs_c955_1.Character
      if gs_c955_1.Character then
        tmp662 = not (gs_c955_1.Character:FindFirstChild("HumanoidRootPart"))
      end
      if tmp662 then return end
      gs_c955_2 = gs_c955_1.Character.HumanoidRootPart
      gs_c955_3 = ({})[1]
      gs_c955_4 = ({})[2]
      for _key, item in pairs(workspace.Enemies:GetChildren()) do
        gs_c955_1 = _key
        gs_c955_2 = item
        local tmp663 = gs_c955_2:FindFirstChild("HumanoidRootPart")
        if not (gs_c955_2:FindFirstChild("HumanoidRootPart")) then goto L92976 end
        tmp663 = gs_c955_2:FindFirstChild("Humanoid")
        if not (gs_c955_2:FindFirstChild("Humanoid")) then goto L92976 end
        tmp663 = gs_c955_2.Humanoid.Health > 0
        ::L92976::
        if tmp663 then
        if (table.find(BossList, gs_c955_2.Name)) then
        gs_955_4_1 = (gs_129_2_2.Position - gs_c955_2.HumanoidRootPart.Position).Magnitude
        if (gs_955_4_1 < gs_129_2_4) then
        gs_129_2_3 = gs_c955_2
        gs_129_2_4 = gs_955_4_1
        end
        end
        end
      end
      local tmp664 = gs_955_2_3
      if gs_955_2_3 then
        tmp664 = gs_955_2_3:FindFirstChild("HumanoidRootPart")
      end
      if not tmp664 then goto L93214 end
      gs_955_6_1 = gs_955_2_3.HumanoidRootPart
      gs_955_6_2 = gs_955_2_3.Humanoid
      ::L93072::
      task.wait(0.1)
      if not _G.AutoFarmAllBoss then
        goto L93212
      end
      gs_955_7_1 = gs_955_6_1.CFrame * (CFrame.new(0, 5, 0))
      if ((gs_955_2_2.Position - gs_955_7_1.Position).Magnitude > 100) then
        gs_955_2_1.Character.PivotTo(gs_955_2_1.Character, gs_955_7_1)
      else
        _tp(gs_955_7_1)
      end
      local tmp665 = gs_c129_13
      if gs_c129_13 then
        tmp665 = (typeof(gs_c129_13.Kill)) == "function"
      end
      if tmp665 then
        gs_c129_13.Kill(gs_955_2_3, true)
      end
      local tmp666 = not gs_955_2_3.Parent
      if not gs_955_2_3.Parent then goto L93209 end
      tmp666 = gs_955_6_2.Health <= 0
      if gs_955_6_2.Health <= 0 then goto L93209 end
      tmp666 = not _G.AutoFarmAllBoss
      ::L93209::
      if tmp666 then goto L93212 end
      goto L93072
      ::L93212::
      ::L93214::
      return
    end
    while (task.wait(0.3)) do
      if _G.AutoFarmAllBoss then
        pcall(fn_955)
      end
    end
    return
  end
  fn_130 = function(...)
    local _,  a1 = ...
    gs_c130_1 = a1
    SelectIsland = gs_c130_1
    return
  end
  fn_131 = function(...)
    local _,  a1 = ...
    gs_c131_1 = a1
    _G.FarmMastery_Dev = gs_c131_1
    return
  end
  fn_132 = function(...)
    fn_953 = function(...)
      fn_954 = function(...)
                          local tmp661 = _G.FarmMastery_Dev
        if _G.FarmMastery_Dev then goto L92700 end
        tmp661 = _G.FarmMastery_G
        if _G.FarmMastery_G then goto L92700 end
        tmp661 = _G.FarmMastery_S
        ::L92700::
        if not tmp661 then goto L92785 end
        for _key, item in pairs(gs_c1_52.PlayerGui.Notifications:GetChildren()) do
          gs_954_1_1 = _key
          gs_954_1_2 = item
          if (gs_954_1_2.Name == "NotificationTemplate") then
          if (string.find(gs_954_1_2.Text, "Skill locked!")) then
          gs_954_1_2.Destroy(gs_954_1_2)
          end
          end
        end
        ::L92785::
        return
      end
      pcall(fn_954)
      return
    end
    RunSer.RenderStepped:Connect(fn_953)
    return
  end
  fn_133 = function(...)
    fn_952 = function(...)
              if not (SelectIsland == "Cake") then goto L92537 end
      gs_952_1_1 = GetConnectionEnemies(gs_c1_9)
      if not gs_952_1_1 then goto L92514 end
      HealthM = (gs_952_1_1.Humanoid.MaxHealth * 70) / 100
      ::L92458::
      wait()
      MousePos = gs_952_1_1.HumanoidRootPart.Position
      gs_c1_13.Mas(gs_952_1_1, _G.FarmMastery_Dev)
      local tmp659 = _G.FarmMastery_Dev == false
      if _G.FarmMastery_Dev == false then goto L92509 end
      tmp659 = gs_952_1_1.Humanoid.Health <= 0
      if gs_952_1_1.Humanoid.Health <= 0 then goto L92509 end
      tmp659 = not gs_952_1_1.Parent
      ::L92509::
      if not (tmp659) then
        goto L92458
      end
      goto L92535
      ::L92514::
      _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
      ::L92535::
      goto L92652
      ::L92537::
      if not (SelectIsland == "Bone") then goto L92652 end
      gs_952_5_1 = GetConnectionEnemies(gs_c1_10)
      if not gs_952_5_1 then goto L92629 end
      HealthM = (gs_952_5_1.Humanoid.MaxHealth * 70) / 100
      ::L92573::
      wait()
      MousePos = gs_952_5_1.HumanoidRootPart.Position
      gs_c1_13.Mas(gs_952_5_1, _G.FarmMastery_Dev)
      local tmp660 = _G.FarmMastery_Dev == false
      if _G.FarmMastery_Dev == false then goto L92624 end
      tmp660 = gs_952_5_1.Humanoid.Health <= 0
      if gs_952_5_1.Humanoid.Health <= 0 then goto L92624 end
      tmp660 = not gs_952_5_1.Parent
      ::L92624::
      if not (tmp660) then
        goto L92573
      end
      goto L92650
      ::L92629::
      _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
      ::L92650::
      ::L92652::
      return
    end
    while (wait(Sec)) do
      if _G.FarmMastery_Dev then
        pcall(fn_952)
      end
    end
    return
  end
  fn_134 = function(...)
    local _,  a1 = ...
    gs_c134_1 = a1
    _G.FarmMastery_G = gs_c134_1
    return
  end
  fn_135 = function(...)
    fn_951 = function(...)
                              if not (SelectIsland == "Cake") then goto L91905 end
      gs_951_1_1 = GetConnectionEnemies(gs_c1_9)
      if not gs_951_1_1 then goto L91882 end
      HealthM = (gs_951_1_1.Humanoid.MaxHealth * 70) / 100
      ::L91468::
      wait()
      MousePos = gs_951_1_1.HumanoidRootPart.Position
      gs_c1_13.Masgun(gs_951_1_1, _G.FarmMastery_G)
      gs_951_3_1 = gs_c1_53:FindFirstChild("Modules")
      gs_951_3_2 = gs_951_3_1:FindFirstChild("Net")
      gs_951_3_3 = gs_951_3_2:FindFirstChild("RE/ShootGunEvent")
      if ((gs_c1_52.Character:FindFirstChildOfClass("Tool")).ToolTip ~= "Gun") then return end
      local tmp653 = gs_c1_52.Character:FindFirstChildOfClass("Tool")
      if (gs_c1_52.Character:FindFirstChildOfClass("Tool")) then
        tmp653 = (gs_c1_52.Character:FindFirstChildOfClass("Tool")).Name == "Skull Guitar"
      end
      if tmp653 then
        SoulGuitar = true
        (gs_c1_52.Character:FindFirstChildOfClass("Tool")).RemoteEvent.FireServer((gs_c1_52.Character:FindFirstChildOfClass("Tool")).RemoteEvent, "TAP", MousePos)
        if _G.FarmMastery_G then
          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
          wait(0.05)
          vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
          wait(0.05)
        end
        goto L91851
      end
      local tmp654 = gs_c1_52.Character:FindFirstChildOfClass("Tool")
      if (gs_c1_52.Character:FindFirstChildOfClass("Tool")) then
        tmp654 = (gs_c1_52.Character:FindFirstChildOfClass("Tool")).Name ~= "Skull Guitar"
      end
      if not tmp654 then goto L91851 end
      SoulGuitar = false
      gs_951_3_3:FireServer(MousePos, {gs_951_1_1.HumanoidRootPart})
      if _G.FarmMastery_G then
        vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        wait(0.05)
        vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
        wait(0.05)
      end
      ::L91851::
      local tmp655 = _G.FarmMastery_G == false
      if _G.FarmMastery_G == false then goto L91874 end
      tmp655 = gs_951_1_1.Humanoid.Health <= 0
      if gs_951_1_1.Humanoid.Health <= 0 then goto L91874 end
      tmp655 = not gs_951_1_1.Parent
      ::L91874::
      if not (tmp655) then
        goto L91468
      end
      SoulGuitar = false
      goto L91903
      ::L91882::
      _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
      ::L91903::
      goto L92378
      ::L91905::
      if not (SelectIsland == "Bone") then goto L92378 end
      gs_951_10_1 = GetConnectionEnemies(gs_c1_10)
      if not gs_951_10_1 then goto L92355 end
      HealthM = (gs_951_10_1.Humanoid.MaxHealth * 70) / 100
      ::L91941::
      wait()
      MousePos = gs_951_10_1.HumanoidRootPart.Position
      gs_c1_13.Masgun(gs_951_10_1, _G.FarmMastery_G)
      gs_951_12_1 = gs_c1_53:FindFirstChild("Modules")
      gs_951_12_2 = gs_951_12_1:FindFirstChild("Net")
      gs_951_12_3 = gs_951_12_2:FindFirstChild("RE/ShootGunEvent")
      if ((gs_c1_52.Character:FindFirstChildOfClass("Tool")).ToolTip ~= "Gun") then return end
      local tmp656 = gs_c1_52.Character:FindFirstChildOfClass("Tool")
      if (gs_c1_52.Character:FindFirstChildOfClass("Tool")) then
        tmp656 = (gs_c1_52.Character:FindFirstChildOfClass("Tool")).Name == "Skull Guitar"
      end
      if tmp656 then
        SoulGuitar = true
        (gs_c1_52.Character:FindFirstChildOfClass("Tool")).RemoteEvent.FireServer((gs_c1_52.Character:FindFirstChildOfClass("Tool")).RemoteEvent, "TAP", MousePos)
        if _G.FarmMastery_G then
          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
          wait(0.05)
          vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
          wait(0.05)
        end
        goto L92324
      end
      local tmp657 = gs_c1_52.Character:FindFirstChildOfClass("Tool")
      if (gs_c1_52.Character:FindFirstChildOfClass("Tool")) then
        tmp657 = (gs_c1_52.Character:FindFirstChildOfClass("Tool")).Name ~= "Skull Guitar"
      end
      if not tmp657 then goto L92324 end
      SoulGuitar = false
      gs_951_12_3:FireServer(MousePos, {gs_951_10_1.HumanoidRootPart})
      if _G.FarmMastery_G then
        vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        wait(0.05)
        vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
        wait(0.05)
      end
      ::L92324::
      local tmp658 = _G.FarmMastery_G == false
      if _G.FarmMastery_G == false then goto L92347 end
      tmp658 = gs_951_10_1.Humanoid.Health <= 0
      if gs_951_10_1.Humanoid.Health <= 0 then goto L92347 end
      tmp658 = not gs_951_10_1.Parent
      ::L92347::
      if not (tmp658) then
        goto L91941
      end
      SoulGuitar = false
      goto L92376
      ::L92355::
      _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
      ::L92376::
      ::L92378::
      return
    end
    while (wait(Sec)) do
      if _G.FarmMastery_G then
        pcall(fn_951)
      end
    end
    return
  end
  fn_136 = function(...)
    local _,  a1 = ...
    gs_c136_1 = a1
    _G.FarmMastery_S = gs_c136_1
    return
  end
  fn_137 = function(...)
    fn_950 = function(...)
      if not _G.FarmMastery_S then goto L91388 end
      if not (SelectIsland == "Cake") then goto L91101 end
      _iter = {next, gs_c1_53.Remotes.CommF_:InvokeServer("getInventory")}
      ::L90845::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        local tmp647 = _iter
        goto L91098
      end
      gs_950_2_1 = _loopkey
      gs_950_2_2 = _loopval
      if not ((type(gs_950_2_2)) == "table") then goto L91095 end
      if not (gs_950_2_2.Type == "Sword") then goto L91093 end
      SwordName = gs_950_2_2.Name
      local tmp645 = (tonumber(gs_950_2_2.Mastery)) >= 1
      if not ((tonumber(gs_950_2_2.Mastery)) >= 1) then
        tmp645 = (tonumber(gs_950_2_2.Mastery)) <= 599
      end
      if not tmp645 then goto L91036 end
      gs_950_6_1 = GetConnectionEnemies(gs_root_9)
      if not (GetBP(SwordName)) then goto L91013 end
      if not gs_950_6_1 then goto L90990 end
      ::L90941::
      wait()
      gs_root_13.Sword(gs_950_6_1, _G.FarmMastery_S)
      local tmp646 = _G.FarmMastery_S == false
      if _G.FarmMastery_S == false then goto L90985 end
      tmp646 = not gs_950_6_1.Parent
      if not gs_950_6_1.Parent then goto L90985 end
      tmp646 = gs_950_6_1.Humanoid.Health <= 0
      ::L90985::
      if not (tmp646) then
        goto L90941
      end
      goto L91011
      ::L90990::
      _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
      ::L91011::
      goto L91034
      ::L91013::
      gs_root_53.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
      ::L91034::
      goto L91089
      ::L91036::
      if not ((tonumber(gs_950_2_2.Mastery)) >= 600) then goto L91089 end
      if (GetBP(SwordName)) then return end
      gs_root_53.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
      ::L91089::
      goto L91098
      ::L91093::
      ::L91095::
      goto L90845
      ::L91098::
      local tmp651 = tmp647
      goto L91386
      ::L91101::
      if not (SelectIsland == "Bone") then goto L91386 end
      _iter = {next, gs_c1_53.Remotes.CommF_:InvokeServer("getInventory")}
      ::L91130::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        local tmp650 = _iter
        goto L91383
      end
      gs_950_15_1 = _loopkey
      gs_950_15_2 = _loopval
      if not ((type(gs_950_15_2)) == "table") then goto L91380 end
      if not (gs_950_15_2.Type == "Sword") then goto L91378 end
      SwordName = gs_950_15_2.Name
      local tmp648 = (tonumber(gs_950_15_2.Mastery)) >= 1
      if not ((tonumber(gs_950_15_2.Mastery)) >= 1) then
        tmp648 = (tonumber(gs_950_15_2.Mastery)) <= 599
      end
      if not tmp648 then goto L91321 end
      gs_950_19_1 = GetConnectionEnemies(gs_root_10)
      if not (GetBP(SwordName)) then goto L91298 end
      if not gs_950_19_1 then goto L91275 end
      ::L91226::
      wait()
      gs_root_13.Sword(gs_950_19_1, _G.FarmMastery_S)
      local tmp649 = _G.FarmMastery_S == false
      if _G.FarmMastery_S == false then goto L91270 end
      tmp649 = not gs_950_19_1.Parent
      if not gs_950_19_1.Parent then goto L91270 end
      tmp649 = gs_950_19_1.Humanoid.Health <= 0
      ::L91270::
      if not (tmp649) then
        goto L91226
      end
      goto L91296
      ::L91275::
      _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
      ::L91296::
      goto L91319
      ::L91298::
      gs_root_53.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
      ::L91319::
      goto L91374
      ::L91321::
      if not ((tonumber(gs_950_15_2.Mastery)) >= 600) then goto L91374 end
      if (GetBP(SwordName)) then return end
      gs_root_53.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
      ::L91374::
      goto L91383
      ::L91378::
      ::L91380::
      goto L91130
      ::L91383::
      tmp651 = tmp650
      ::L91386::
      local tmp652 = tmp651
      ::L91388::
      return
    end
    while (wait(Sec)) do
      pcall(fn_950)
    end
    return
  end
  fn_138 = function(...)
    local _,  a1 = ...
    gs_c138_1 = a1
    _G.Seriality = gs_c138_1
    return
  end
  fn_139 = function(...)
    local _,  a1 = ...
    gs_c139_1 = a1
    _B = gs_c139_1
    return
  end
  fn_140 = function(...)
    local _,  a1 = ...
      gs_c140_1 = a1
    _G.AutoHopServer = gs_c140_1
    if not gs_c140_1 then
      _G.HopTimer = nil
    end
    return
  end
  fn_141 = function(...)
    fn_949 = function(...)
      if not _G.HopTimer then
        _G.HopTimer = tick()
        local tmp642 = _G
      end
      local tmp644 = tmp642
      if (((tick()) - _G.HopTimer) >= _G.HopDelay) then
        _G.HopTimer = tick()
        if syn then
        end
        local tmp643 = tmp642
        if j90694_0_3 then
          syn.queue_on_teleport("loadstring(game:HttpGet('https://pastefy.app/iiFOhcot/raw'))()")
        end
        game:GetService("TeleportService")
        (game:GetService("TeleportService")).Teleport(game:GetService("TeleportService"), game.PlaceId, game.Players.LocalPlayer)
      end
      return
    end
    while (Wait(1)) do
      if _G.AutoHopServer then
        pcall(fn_949)
      end
    end
    return
  end
  fn_142 = function(...)
    local _,  a1 = ...
    gs_c142_1 = a1
    _G.HopDelay = gs_c142_1 * 60
    return
  end
  fn_143 = function(...)
    local _,  a1 = ...
    local _t1
      fn_948 = function(...)
      (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "SetSpawnPoint")
      return
    end
    gs_c143_1 = a1
    _t1 = getgenv()
    _t1.Set = gs_c143_1
    local tmp641 = getgenv()
    if gs_c143_1 then
      pcall(fn_948)
    end
    return
  end
  fn_144 = function(...)
    local _,  a1 = ...
    gs_c144_1 = a1
    Boud = gs_c144_1
    return
  end
  fn_145 = function(...)
    fn_947 = function(...)
      if Boud then
        gs_947_1_1 = ({{"HasBuso", "Buso"}})[1]
        if not (gs_c1_52.Character:FindFirstChild(gs_947_1_1[1])) then
          gs_c1_53.Remotes.CommF_:InvokeServer(gs_947_1_1[2])
        end
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_947)
    end
    return
  end
  fn_146 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c146_1 = a1
    _t1 = getgenv()
    _t1.Observation = gs_c146_1
    return
  end
  fn_147 = function(...)
    fn_946 = function(...)
      (game:GetService("ReplicatedStorage")).Remotes.CommE.FireServer((game:GetService("ReplicatedStorage")).Remotes.CommE, "Ken", true)
      return
    end
    while (wait()) do
      if (getgenv()).Observation then
        pcall(fn_946)
      end
    end
    return
  end
  fn_148 = function(...)
    local _,  a1 = ...
    gs_c148_1 = a1
    _G.RaceClickAutov3 = gs_c148_1
    return
  end
  fn_149 = function(...)
    fn_945 = function(...)
      if not _G.RaceClickAutov3 then goto L90339 end
      ::L90303::
      gs_c1_53.Remotes.CommE:FireServer("ActivateAbility")
      wait(30)
      if _G.RaceClickAutov3 then
        goto L90303
      end
      ::L90339::
      return
    end
    while (wait(0.2)) do
      pcall(fn_945)
    end
    return
  end
  fn_150 = function(...)
    local _,  a1 = ...
    gs_c150_1 = a1
    _G.RaceClickAutov4 = gs_c150_1
    return
  end
  fn_151 = function(...)
    fn_944 = function(...)
      if _G.RaceClickAutov4 then
        if (gs_c1_52.Character:FindFirstChild("RaceEnergy")) then
          if ((gs_c1_52.Character:FindFirstChild("RaceEnergy")).Value == 1) then
            Useskills("nil", "Y")
          end
        end
      end
      return
    end
    while (wait(0.2)) do
      pcall(fn_944)
    end
    return
  end
  fn_152 = function(...)
    local _,  a1 = ...
    gs_c152_1 = a1
    RandomCFrame = gs_c152_1
    return
  end
  fn_153 = function(...)
    local _,  a1 = ...
    gs_c153_1 = a1
    _G.Safemode = gs_c153_1
    return
  end
  fn_154 = function(...)
    fn_943 = function(...)
      if _G.Safemode then
        gs_943_1_1 = (gs_c1_52.Character.Humanoid.Health / gs_c1_52.Character.Humanoid.MaxHealth) * 100
        if (gs_943_1_1 < Num_self) then
          shouldTween = true
          _tp(Root.CFrame * (CFrame.new(0, 500, 0)))
        else
          shouldTween = false
        end
      end
      return
    end
    while (task.wait(Sec)) do
      pcall(fn_943)
    end
    return
  end
  fn_155 = function(...)
    local _,  a1 = ...
    gs_c155_1 = a1
    _G.DestroyHit = gs_c155_1
    return
  end
  fn_156 = function(...)
    fn_942 = function(...)
              for _key, item in pairs(workspace._WorldOrigin:GetChildren()) do
                gs_c942_1 = _key
                gs_c942_2 = item
                if (table.find(gs_root_74, gs_c942_2.Name)) then
                gs_c942_2.Destroy(gs_c942_2)
                end
              end
      return
    end
    while (task.wait(Sec)) do
      if _G.DestroyHit then
        pcall(fn_942)
      end
    end
    return
  end
  fn_157 = function(...)
    local _,  a1 = ...
    gs_c157_1 = a1
    RDeath = gs_c157_1
    return
  end
  fn_158 = function(...)
    fn_941 = function(...)
      if RDeath then
        if (gs_c1_53.Effect.Container:FindFirstChild("Death")) then
          gs_c1_53.Effect.Container.Death.Destroy(gs_c1_53.Effect.Container.Death)
        end
        if (gs_c1_53.Effect.Container:FindFirstChild("Respawn")) then
          gs_c1_53.Effect.Container.Respawn.Destroy(gs_c1_53.Effect.Container.Respawn)
        end
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_941)
    end
    return
  end
  fn_159 = function(...)
    local _,  a1 = ...
    gs_c159_1 = a1
    RemoveDamage = gs_c159_1
    return
  end
  fn_160 = function(...)
    fn_940 = function(...)
      local _t1
      local _t2
      local _t3
      local _t4
              if RemoveDamage then
        _t1 = gs_c1_53.Assets.GUI.DamageCounter
        _t1.Enabled = false
        _t2 = gs_c1_52.PlayerGui.Notifications
        _t2.Enabled = false
        local tmp640 = gs_c1_53.Assets.GUI.DamageCounter
      else
        _t3 = gs_c1_53.Assets.GUI.DamageCounter
        _t3.Enabled = true
        _t4 = gs_c1_52.PlayerGui.Notifications
        _t4.Enabled = true
        tmp640 = gs_c1_53.Assets.GUI.DamageCounter
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_940)
    end
    return
  end
  fn_161 = function(...)
    local _,  a1 = ...
    gs_c161_1 = a1
    _G.AcceptQuestC = gs_c161_1
    return
  end
  fn_162 = function(...)
    local _,  a1 = ...
    gs_c162_1 = a1
    _G.AutoSpawnCP = gs_c162_1
    return
  end
  fn_163 = function(...)
    fn_939 = function(...)
      gs_c939_1 = game.ReplicatedStorage.Remotes.CommF_
      gs_c939_2 = workspace.Enemies
      gs_c939_3 = workspace.Map.CakeLoaf:FindFirstChild("BigMirror")
      if not gs_c939_3 then return end
      if (gs_c939_2:FindFirstChild("Cake Prince")) then return end
      if (gs_c939_3.Other.Transparency == 0) then return end
      gs_c939_1:InvokeServer("CakePrinceSpawner", true)
      return
    end
    while (task.wait(2)) do
      if _G.AutoSpawnCP then
        pcall(fn_939)
      end
    end
    return
  end
  fn_164 = function(...)
    local _,  a1 = ...
    gs_c164_1 = a1
    _G.AcceptQuestB = gs_c164_1
    return
  end
  fn_165 = function(...)
    local _,  a1 = ...
    fn_938 = function(...)
      gs_165_1_1:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
      wait(1)
      gs_165_1_1:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
      return
    end
    gs_c165_1 = a1
    if not gs_c165_1 then goto L89518 end
    gs_165_1_1 = game:GetService("VirtualUser")
    ::L89462::
    wait()
    if not (game.IsLoaded(game)) then
      goto L89462
    end
    (game:GetService("Players")).LocalPlayer.Idled.Connect((game:GetService("Players")).LocalPlayer.Idled, fn_938)
    ::L89518::
    return
  end
  fn_166 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c166_1 = a1
    _t1 = getgenv()
    _t1.HopServerAdmin = gs_c166_1
    return
  end
  fn_167 = function(...)
    fn_937 = function(...)
              if not (getgenv()).HopServerAdmin then goto L89420 end
      _iter = {pairs(game.Players.GetPlayers(game.Players))}
      ::L89333::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L89417
      end
      gs_937_1_1 = _loopkey
      gs_937_1_2 = _loopval
      gs_937_1_3 = ({{"red_game43", "rip_indra", "Axiore", "Polkster", "wenlocktoad", "Daigrock", "toilamvidamme", "oofficialnoobie", "Uzoth", "Azarth", "arlthmetic", "Death_King", "Lunoven", "TheGreateAced", "rip_fud", "drip_mama", "layandikit12", "Hingoi"}})[1]
      if (table.find(gs_937_1_3, gs_937_1_2.Name)) then
        Hop()
      end
      goto L89333
      ::L89417::
      ::L89420::
      return
    end
    while (wait()) do
      pcall(fn_937)
    end
    return
  end
  fn_168 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c168_1 = a1
    _t1 = getgenv()
    _t1.NoClip = gs_c168_1
    return
  end
  fn_169 = function(...)
    fn_935 = function(...)
      fn_936 = function(...)
                                if not (getgenv()).NoClip then goto L89258 end
        _iter = {pairs(game.Players.LocalPlayer.Character.GetDescendants(game.Players.LocalPlayer.Character))}
        ::L89204::
        _k1 = {_loopkey(_loopval, _loopstate)}
        _loopstate = _k1[1]
        if not (_k1[1] == nil) then
          goto L89255
        end
        gs_936_1_1 = _loopkey
        gs_936_1_2 = _loopval
        local tmp638 = gs_936_1_2:IsA("BasePart")
        if not (gs_936_1_2:IsA("BasePart")) then
          tmp638 = gs_936_1_2:IsA("Part")
        end
        if tmp638 then
          gs_936_1_2.CanCollide = false
          local tmp639 = gs_936_1_2
        end
        goto L89204
        ::L89255::
        ::L89258::
        return
      end
      (game:GetService("RunService")).Stepped.Connect((game:GetService("RunService")).Stepped, fn_936)
      return
    end
    pcall(fn_935)
    return
  end
  fn_170 = function(...)
    local _,  a1 = ...
    gs_c170_1 = a1
    _G.SelectedRod = gs_c170_1
    return
  end
  fn_171 = function(...)
    local _,  a1 = ...
      fn_934 = function(...)
      gs_c1_12.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
      return
    end
    gs_c171_1 = a1
    _G.SelectedBait = gs_c171_1
    local tmp637 = _G
    if _G.AutoBuyBait then
      pcall(fn_934)
    end
    return
  end
  fn_172 = function(...)
    local _,  a1 = ...
      fn_933 = function(...)
      gs_c1_12.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
      return
    end
    gs_c172_1 = a1
    _G.AutoBuyBait = gs_c172_1
    local tmp636 = _G
    if gs_c172_1 then
      pcall(fn_933)
    end
    return
  end
  fn_173 = function(...)
      fn_932 = function(...)
      gs_c1_12.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
      return
    end
    while (task.wait(2)) do
      local tmp635 = _G.AutoBuyBait
      if _G.AutoBuyBait then
        tmp635 = _G.SelectedBait
      end
      if tmp635 then
        pcall(fn_932)
      end
    end
    return
  end
  fn_174 = function(...)
    local _,  a1 = ...
    gs_c174_1 = a1
    _G.AutoFishing = gs_c174_1
    return
  end
  fn_175 = function(...)
    fn_931 = function(...)
                      local tmp631 = gs_c1_76.Character
      if not (gs_c1_76.Character) then
        tmp631 = gs_c1_76.CharacterAdded.Wait(gs_c1_76.CharacterAdded)
      end
      gs_c931_1 = tmp631
      gs_c931_2 = gs_c931_1:FindFirstChild("HumanoidRootPart")
      if not gs_c931_2 then return end
      gs_c931_3 = gs_c931_1:FindFirstChildOfClass("Tool")
      local tmp632 = _G.SelectedRod
      if not _G.SelectedRod then goto L88638 end
      tmp632 = not gs_c931_3
      if not gs_c931_3 then goto L88638 end
      tmp632 = gs_c931_3.Name ~= _G.SelectedRod
      ::L88638::
      if tmp632 then
        gs_931_2_1 = gs_c1_76.Backpack:FindFirstChild(_G.SelectedRod)
        if gs_931_2_1 then
          gs_c931_1.Humanoid:EquipTool(gs_931_2_1)
          gs_c931_3 = gs_931_2_1
        end
      end
      if not gs_c931_3 then goto L88946 end
      gs_931_4_1 = gs_c1_82(gs_c931_2.Position)
      gs_931_4_2 = ({gs_c1_77:FindPartOnRayWithIgnoreList(Ray.new(gs_c931_1.Head.Position, gs_c931_2.CFrame.LookVector * gs_c1_83), {gs_c931_1, gs_c1_77.Characters, gs_c1_77.Enemies})})[1]
      gs_931_4_3 = ({gs_c1_77:FindPartOnRayWithIgnoreList(Ray.new(gs_c931_1.Head.Position, gs_c931_2.CFrame.LookVector * gs_c1_83), {gs_c931_1, gs_c1_77.Characters, gs_c1_77.Enemies})})[2]
      local tmp633 = gs_931_4_3
      if gs_931_4_3 then
        tmp633 = Vector3.new(gs_931_4_3.X, math.max(gs_931_4_3.Y, gs_931_4_1), gs_931_4_3.Z)
      end
      gs_931_4_4 = tmp633
      gs_931_4_5 = gs_c931_3:GetAttribute("State")
      gs_931_4_6 = gs_c931_3:GetAttribute("ServerState")
      local tmp634 = gs_931_4_4
      if not gs_931_4_4 then goto L88855 end
      tmp634 = gs_931_4_5 == "ReeledIn"
      if gs_931_4_5 == "ReeledIn" then goto L88855 end
      tmp634 = gs_931_4_6 == "ReeledIn"
      ::L88855::
      if tmp634 then
        gs_c1_80:InvokeServer("StartCasting")
        task.wait()
        gs_c1_80:InvokeServer("CastLineAtLocation", gs_931_4_4, 100, true)
        goto L88944
      end
      if not (gs_931_4_6 == "Biting") then goto L88944 end
      gs_c1_80:InvokeServer("Catching", true)
      task.wait(0.1)
      gs_c1_80:InvokeServer("Catch", 1)
      ::L88944::
      ::L88946::
      return
    end
    while (task.wait(0.5)) do
      if _G.AutoFishing then
        pcall(fn_931)
      end
    end
    return
  end
  fn_176 = function(...)
    local _,  a1 = ...
    gs_c176_1 = a1
    _G.AutoFishingQuest = gs_c176_1
    return
  end
  fn_177 = function(...)
        local tmp629 = gs_c1_85.PlayerGui:FindFirstChild("Quest")
    if not (gs_c1_85.PlayerGui:FindFirstChild("Quest")) then
      tmp629 = gs_c1_85.PlayerGui:FindFirstChild("QuestGui")
    end
    gs_c177_1 = tmp629
    local tmp630 = gs_c177_1
    if not gs_c177_1 then goto L88494 end
    tmp630 = gs_c177_1:FindFirstChild("Container")
    if not (gs_c177_1:FindFirstChild("Container")) then goto L88494 end
    tmp630 = gs_c177_1.Container:FindFirstChild("QuestTitle")
    ::L88494::
    if tmp630 then return {true} end
    return false
  end
  fn_178 = function(...)
    fn_930 = function(...)
      if not (gs_c1_88()) then
        gs_c1_87:InvokeServer("FishingNPC", "Angler", "AskQuest")
      end
      return
    end
    while (task.wait(1)) do
      if _G.AutoFishingQuest then
        pcall(fn_930)
      end
    end
    return
  end
  fn_179 = function(...)
    local _,  a1 = ...
      fn_929 = function(...)
      gs_c1_12.RFJobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
      return
    end
    gs_c179_1 = a1
    _G.AutoQuestComplete = gs_c179_1
    local tmp628 = _G
    if gs_c179_1 then
      pcall(fn_929)
    end
    return
  end
  fn_180 = function(...)
    fn_928 = function(...)
      gs_c1_12.RFJobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
      return
    end
    while (task.wait(5)) do
      if _G.AutoQuestComplete then
        pcall(fn_928)
      end
    end
    return
  end
  fn_181 = function(...)
    local _,  a1 = ...
      fn_927 = function(...)
      gs_c1_12.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
      return
    end
    gs_c181_1 = a1
    _G.AutoSellFish = gs_c181_1
    local tmp627 = _G
    if gs_c181_1 then
      pcall(fn_927)
    end
    return
  end
  fn_182 = function(...)
    fn_926 = function(...)
      gs_c1_12.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
      return
    end
    while (task.wait(5)) do
      if _G.AutoSellFish then
        pcall(fn_926)
      end
    end
    return
  end
  fn_183 = function(...)
    local _,  a1 = ...
    gs_c183_1 = a1
    _G.AutoSkillZ = gs_c183_1
    return
  end
  fn_184 = function(...)
    fn_925 = function(...)
      gs_c1_90:InvokeServer("Z", true)
      return
    end
    while (task.wait(0.5)) do
      if _G.AutoSkillZ then
        pcall(fn_925)
      end
    end
    return
  end
  fn_185 = function(...)
    local _,  a1 = ...
    gs_c185_1 = a1
    _G.AutoRipIngay = gs_c185_1
    return
  end
  fn_186 = function(...)
    fn_924 = function(...)
              if not _G.AutoRipIngay then goto L88099 end
      gs_924_1_1 = GetConnectionEnemies("rip_indra")
      local tmp625 = not (GetWP("Dark Dagger"))
      if not (GetWP("Dark Dagger")) then goto L87979 end
      tmp625 = not (GetIn("Valkyrie"))
      if not not (GetIn("Valkyrie")) then goto L87979 end
      tmp625 = gs_924_1_1
      ::L87979::
      if not tmp625 then goto L88030 end
      ::L87982::
      wait()
      gs_c1_13.Kill(gs_924_1_1, _G.AutoRipIngay)
      local tmp626 = not _G.AutoRipIngay
      if not _G.AutoRipIngay then goto L88025 end
      tmp626 = not gs_924_1_1.Parent
      if not gs_924_1_1.Parent then goto L88025 end
      tmp626 = gs_924_1_1.Humanoid.Health <= 0
      ::L88025::
      if not (tmp626) then
        goto L87982
      end
      goto L88097
      ::L88030::
      gs_c1_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
      wait(0.1)
      _tp(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
      ::L88097::
      ::L88099::
      return
    end
    while (wait(Sec)) do
      pcall(fn_924)
    end
    return
  end
  fn_187 = function(...)
    local _,  a1 = ...
    gs_c187_1 = a1
    _G.AutoUnHaki = gs_c187_1
    return
  end
  fn_188 = function(...)
    local _,  a1 = ...
    gs_c188_1 = a1
    gs_c188_2 = ({{{.StorageName = gs_c188_1, .Type = "AuraSkin", .Context = "Equip"}}})[1]
    gs_c1_53:WaitForChild("Modules")
    (gs_c1_53:WaitForChild("Modules")).WaitForChild(gs_c1_53:WaitForChild("Modules"), "Net")
    ((gs_c1_53:WaitForChild("Modules")).WaitForChild(gs_c1_53:WaitForChild("Modules"), "Net")).WaitForChild((gs_c1_53:WaitForChild("Modules")).WaitForChild(gs_c1_53:WaitForChild("Modules"), "Net"), "RF/FruitCustomizerRF")
    (((gs_c1_53:WaitForChild("Modules")).WaitForChild(gs_c1_53:WaitForChild("Modules"), "Net")).WaitForChild((gs_c1_53:WaitForChild("Modules")).WaitForChild(gs_c1_53:WaitForChild("Modules"), "Net"), "RF/FruitCustomizerRF")).InvokeServer(((gs_c1_53:WaitForChild("Modules")).WaitForChild(gs_c1_53:WaitForChild("Modules"), "Net")).WaitForChild((gs_c1_53:WaitForChild("Modules")).WaitForChild(gs_c1_53:WaitForChild("Modules"), "Net"), "RF/FruitCustomizerRF"), unpack(gs_c188_2))
    return
  end
  fn_189 = function(...)
    local _,  a1 = ...
      gs_c189_1 = a1
    local tmp624 = gs_c189_1
    if gs_c189_1 then
      tmp624 = gs_c189_1.BrickColor
    end
    if tmp624 then return {(tostring(gs_c189_1.BrickColor)) == "Lime green"} end
    return
  end
  fn_190 = function(...)
    local _,  a1 = ...
      gs_c190_1 = a1
    gs_c190_2 = ({{["Really red"] = "Pure Red", .Oyster = "Snow White", ["Hot pink"] = "Winter Sky"}})[1]
    local tmp623 = gs_c190_1
    if gs_c190_1 then
      tmp623 = gs_c190_1.BrickColor
    end
    if tmp623 then return {gs_c190_2[tostring(gs_c190_1.BrickColor)]} end
    return
  end
  fn_191 = function(...)
    fn_923 = function(...)
                      gs_c923_1 = workspace.Map["Boat Castle"].FindFirstChild(workspace.Map["Boat Castle"], "Summoner")
      local tmp621 = gs_c923_1
      if gs_c923_1 then
        tmp621 = gs_c923_1:FindFirstChild("Circle")
      end
      if not tmp621 then goto L87744 end
      gs_c923_1:FindFirstChild("Circle")
      _iter = {pairs((gs_c923_1:FindFirstChild("Circle")).GetChildren(gs_c923_1:FindFirstChild("Circle")))}
      ::L87630::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L87741
      end
      gs_923_1_1 = _loopkey
      gs_923_1_2 = _loopval
      if not (gs_923_1_2.Name == "Part") then goto L87738 end
      gs_923_3_1 = gs_923_1_2:FindFirstChild("Part")
      if not ((VaildColor(gs_923_3_1)) == false) then goto L87736 end
      AuraSkin(HakiCalculate(gs_923_1_2))
      ::L87695::
      wait()
      _tp(gs_923_1_2.CFrame)
      local tmp622 = (VaildColor(gs_923_3_1)) == true
      if not ((VaildColor(gs_923_3_1)) == true) then
        tmp622 = not _G.AutoUnHaki
      end
      if not (tmp622) then
        goto L87695
      end
      ::L87736::
      ::L87738::
      goto L87630
      ::L87741::
      ::L87744::
      return
    end
    while (wait(Sec)) do
      if _G.AutoUnHaki then
        pcall(fn_923)
      end
    end
    return
  end
  fn_192 = function(...)
    local _,  a1 = ...
    gs_c192_1 = a1
    _G.AutoFactory = gs_c192_1
    return
  end
  fn_193 = function(...)
    fn_922 = function(...)
          if not _G.AutoFactory then goto L87507 end
      gs_922_1_1 = GetConnectionEnemies("Core")
      if not gs_922_1_1 then goto L87484 end
      ::L87425::
      wait()
      EquipWeapon(_G.SelectWeapon)
      _tp(CFrame.new(448.46756, 199.356781, -441.389252))
      local tmp620 = gs_922_1_1.Humanoid.Health <= 0
      if not (gs_922_1_1.Humanoid.Health <= 0) then
        tmp620 = _G.AutoFactory == false
      end
      if not (tmp620) then
        goto L87425
      end
      goto L87505
      ::L87484::
      _tp(CFrame.new(448.46756, 199.356781, -441.389252))
      ::L87505::
      ::L87507::
      return
    end
    while (wait(Sec)) do
      pcall(fn_922)
    end
    return
  end
  fn_194 = function(...)
    local _,  a1 = ...
    gs_c194_1 = a1
    _G.AutoRaidCastle = gs_c194_1
    return
  end
  fn_195 = function(...)
    fn_921 = function(...)
                                  local _lv2
      local _lm2
      local _ls2
                                      gs_c921_1 = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
      if not (((CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125)).Position - Root.Position).Magnitude <= 500) then goto L87219 end
      for _key, item in pairs(workspace.Enemies:GetChildren()) do
        gs_921_1_1 = _key
        gs_921_1_2 = item
        local tmp617 = gs_921_1_2:FindFirstChild("HumanoidRootPart")
        if not (gs_921_1_2:FindFirstChild("HumanoidRootPart")) then goto L87113 end
        tmp617 = gs_921_1_2:FindFirstChild("Humanoid")
        if not (gs_921_1_2:FindFirstChild("Humanoid")) then goto L87113 end
        tmp617 = gs_921_1_2.Humanoid.Health > 0
        ::L87113::
        if not tmp617 then goto L87213 end
        if not gs_921_1_2.Name then goto L87211 end
        if not ((gs_921_1_2.HumanoidRootPart.Position - Root.Position).Magnitude <= 2000) then goto L87209 end
        ::L87139::
        wait()
        gs_root_13.Kill(gs_921_1_2, _G.AutoRaidCastle)
        local tmp618 = not _G.AutoRaidCastle
        if not _G.AutoRaidCastle then goto L87204 end
        tmp618 = not gs_921_1_2.Parent
        if not gs_921_1_2.Parent then goto L87204 end
        tmp618 = gs_921_1_2.Humanoid.Health <= 0
        if gs_921_1_2.Humanoid.Health <= 0 then goto L87204 end
        tmp618 = not (workspace.Enemies:FindFirstChild(gs_921_1_2.Name))
        ::L87204::
        if not (tmp618) then
        goto L87139
        end
        ::L87209::
        ::L87211::
        ::L87213::
      end
      goto L87365
      ::L87219::
      gs_921_7_1 = ({{"Galley Pirate", "Galley Captain", "Raider", "Mercenary", "Vampire", "Zombie", "Snow Trooper", "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Magma Ninja", "Lava Pirate", "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior", "Snow Lurker", "Sea Soldier", "Water Fighter"}})[1]
      _iter = 1 - 1
      h87275_0_2 = #gs_921_7_1
      h87275_0_3 = 1
      _lv2 = _iter + h87275_0_3
      _lm2 = h87275_0_2
      _ls2 = h87275_0_3
      ::FOR_87275::
      _lv2 = _lv2 + _ls2
      if not ((_ls2 < 0 and _lv2 >= _lm2) or (_ls2 > 0 and _lv2 <= _lm2)) then goto FOR_END_87275 end
      gs_921f87275_1 = _lv2
      local tmp619 = _iter + h87275_0_3
      if not (gs_c1_53:FindFirstChild(gs_921_7_1[gs_921f87275_1])) then goto L87360 end
      _iter = _iter + h87275_0_3
      h87318_0_2 = h87275_0_2
      h87318_0_3 = h87275_0_3
      _iter = {pairs(gs_c1_53:GetChildren())}
      ::L87318::
      _k3 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k3[1]
      if _k3[1] == nil then goto L87320 end
      goto L87357
      ::L87320::
      gs_921_9_1 = _loopkey
      gs_921_9_2 = _loopval
      if not (table.find(gs_c921_1, gs_921_9_2.Name)) then goto L87354 end
      _tp(gs_195_2_1)
      ::L87354::
      goto L87318
      ::L87357::
      tmp619 = _iter
      ::L87360::
      goto FOR_87275
      ::FOR_END_87275::
      ::L87365::
      return
    end
    while (wait(Sec)) do
      if _G.AutoRaidCastle then
        pcall(fn_921)
      end
    end
    return
  end
  fn_196 = function(...)
    local _,  a1 = ...
    gs_c196_1 = a1
    _G.Auto_Tushita = gs_c196_1
    return
  end
  fn_197 = function(...)
    fn_920 = function(...)
                              if not _G.Auto_Tushita then goto L86940 end
      if not (workspace.Map.Turtle:FindFirstChild("TushitaGate")) then goto L86811 end
      if not (GetBP("Holy Torch")) then
        _tp(CFrame.new(5148.03613, 162.352493, 910.548218))
        wait(0.7)
        goto L86809
      end
      EquipWeapon("Holy Torch")
      task.wait(1)
      ::L86446::
      task.wait()
      _tp(CFrame.new(-10752, 417, -9366))
      local tmp611 = not _G.Auto_Tushita
      if _G.Auto_Tushita then
        tmp611 = ((CFrame.new(-10752, 417, -9366)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10
      end
      if not (tmp611) then
        goto L86446
      end
      wait(0.7)
      ::L86520::
      task.wait()
      _tp(CFrame.new(-11672, 334, -9474))
      local tmp612 = not _G.Auto_Tushita
      if _G.Auto_Tushita then
        tmp612 = ((CFrame.new(-11672, 334, -9474)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10
      end
      if not (tmp612) then
        goto L86520
      end
      wait(0.7)
      ::L86594::
      task.wait()
      _tp(CFrame.new(-12132, 521, -10655))
      local tmp613 = not _G.Auto_Tushita
      if _G.Auto_Tushita then
        tmp613 = ((CFrame.new(-12132, 521, -10655)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10
      end
      if not (tmp613) then
        goto L86594
      end
      wait(0.7)
      ::L86668::
      task.wait()
      _tp(CFrame.new(-13336, 486, -6985))
      local tmp614 = not _G.Auto_Tushita
      if _G.Auto_Tushita then
        tmp614 = ((CFrame.new(-13336, 486, -6985)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10
      end
      if not (tmp614) then
        goto L86668
      end
      wait(0.7)
      ::L86742::
      task.wait()
      _tp(CFrame.new(-13489, 332, -7925))
      local tmp615 = not _G.Auto_Tushita
      if _G.Auto_Tushita then
        tmp615 = ((CFrame.new(-13489, 332, -7925)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10
      end
      if not (tmp615) then
        goto L86742
      end
      ::L86809::
      goto L86938
      ::L86811::
      gs_920_10_1 = GetConnectionEnemies("Longma")
      if not gs_920_10_1 then goto L86880 end
      ::L86830::
      task.wait()
      gs_c1_13.Kill(gs_920_10_1, _G.Auto_Tushita)
      local tmp616 = gs_920_10_1.Humanoid.Health <= 0
      if gs_920_10_1.Humanoid.Health <= 0 then goto L86875 end
      tmp616 = not _G.Auto_Tushita
      if not _G.Auto_Tushita then goto L86875 end
      tmp616 = not gs_920_10_1.Parent
      ::L86875::
      if not (tmp616) then
        goto L86830
      end
      goto L86937
      ::L86880::
      if (gs_c1_53:FindFirstChild("Longma")) then
        _tp((gs_c1_53:FindFirstChild("Longma")).HumanoidRootPart.CFrame * (CFrame.new(0, 40, 0)))
      end
      ::L86937::
      ::L86938::
      ::L86940::
      return
    end
    while (wait(Sec)) do
      pcall(fn_920)
    end
    return
  end
  fn_198 = function(...)
    local _,  a1 = ...
    gs_c198_1 = a1
    _G.Auto_Yama = gs_c198_1
    return
  end
  fn_199 = function(...)
    fn_919 = function(...)
      if not _G.Auto_Yama then goto L86323 end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")) < 30) then
        _G.FarmEliteHunt = true
        local tmp609 = _G
        goto L86321
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")) > 30) then goto L86321 end
      _G.FarmEliteHunt = false
      local tmp608 = _G
      if not ((workspace.Map.Waterfall.SealedKatana.Handle.Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude >= 20) then goto L86319 end
      _tp(workspace.Map.Waterfall.SealedKatana.Handle.CFrame)
      gs_919_4_1 = GetConnectionEnemies("Ghost")
      if not gs_919_4_1 then goto L86317 end
      ::L86250::
      wait()
      gs_c1_13.Kill(gs_919_4_1, _G.Auto_Yama)
      local tmp607 = gs_919_4_1.Humanoid.Health <= 0
      if gs_919_4_1.Humanoid.Health <= 0 then goto L86293 end
      tmp607 = not gs_919_4_1.Parent
      if not gs_919_4_1.Parent then goto L86293 end
      tmp607 = not _G.Auto_Yama
      ::L86293::
      if not (tmp607) then
        goto L86250
      end
      fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
      ::L86317::
      ::L86319::
      tmp609 = tmp608
      ::L86321::
      local tmp610 = tmp609
      ::L86323::
      return
    end
    while (wait(Sec)) do
      pcall(fn_919)
    end
    return
  end
  fn_200 = function(...)
    fn_918 = function(...)
      if (Quest1 == true) then
        gs_c1_91:SetDesc("Quest Number : Quest1")
        goto L86095
      end
      if (Quest2 == true) then
        gs_c1_91:SetDesc("Quest Number : Quest2")
        goto L86095
      end
      if (Quest3 == true) then
        gs_c1_91:SetDesc("Quest Number : Quest3")
        goto L86095
      end
      if (Quest4 == true) then
        gs_c1_91:SetDesc("Quest Number : Quest4")
        goto L86095
      end
      if (GetWP("Skull Guitar")) then
        gs_c1_91:SetDesc("Quest Number : Collect!!")
      else
        gs_c1_91:SetDesc("Quest Number : No Quest!!")
      end
      ::L86095::
      return
    end
    while (wait(0.2)) do
      pcall(fn_918)
    end
    return
  end
  fn_201 = function(...)
    local _,  a1 = ...
    gs_c201_1 = a1
    _G.Auto_Soul_Guitar = gs_c201_1
    return
  end
  fn_202 = function(...)
    fn_917 = function(...)
      local _t1
      local _t2
      local _t3
      local _t4
      local _t5
      local _t6
                                                      gs_c917_1 = GetConnectionEnemies("Living Zombie")
      if gs_c917_1 then
        _t1 = gs_c917_1.HumanoidRootPart
        _t1.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
        _t2 = gs_c917_1.Head
        _t2.CanCollide = false
        _t3 = gs_c917_1.Humanoid
        _t3.Sit = false
        _t4 = gs_c917_1.HumanoidRootPart
        _t4.CanCollide = false
        _t5 = gs_c917_1.Humanoid
        _t5.JumpPower = 0
        _t6 = gs_c917_1.Humanoid
        _t6.WalkSpeed = 0
        local tmp605 = gs_c917_1.HumanoidRootPart
        if (gs_c917_1.Humanoid:FindFirstChild("Animator")) then
          gs_c917_1.Humanoid:FindFirstChild("Animator"):Destroy()
        end
        local tmp606 = tmp605
      end
      return
    end
    while (wait()) do
      if _G.Auto_Soul_Guitar then
        pcall(fn_917)
      end
    end
    return
  end
  fn_203 = function(...)
    local _,  a1 = ...
    gs_c203_1 = a1
    if (gs_c203_1 == 1) then
      gs_c203_2 = workspace.Map["Haunted Castle"].Tablet.Segment1.Line.Rotation
      goto L85777
    end
    if (gs_c203_1 == 3) then
      gs_c203_2 = workspace.Map["Haunted Castle"].Tablet.Segment3.Line.Rotation
      goto L85777
    end
    if (gs_c203_1 == 4) then
      gs_c203_2 = workspace.Map["Haunted Castle"].Tablet.Segment4.Line.Rotation
      goto L85777
    end
    if (gs_c203_1 == 7) then
      gs_c203_2 = workspace.Map["Haunted Castle"].Tablet.Segment7.Line.Rotation
      goto L85777
    end
    if not (gs_c203_1 == 10) then goto L85777 end
    gs_c203_2 = workspace.Map["Haunted Castle"].Tablet.Segment10.Line.Rotation
    ::L85777::
    if gs_c203_2 then return {gs_c203_2.Z} end
    return
  end
  fn_204 = function(...)
    local _,  a1 = ...
                  gs_c204_1 = a1
    gs_c204_2 = workspace.Map["Haunted Castle"].Trophies.Quest
    for _key, item in pairs(gs_c204_2:GetChildren()) do
      gs_c204_1 = _key
      gs_c204_2 = item
      local tmp600 = gs_c1_1 == 1
      if not (gs_c1_1 == 1) then goto L85474 end
      tmp600 = gs_c204_2.Name == "Trophy1"
      if not (gs_c204_2.Name == "Trophy1") then goto L85474 end
      tmp600 = gs_c204_2:FindFirstChild("Handle")
      ::L85474::
      if tmp600 then
      gs_c1_3 = gs_c204_2.Handle.Rotation
      goto L85645
      end
      local tmp601 = gs_c1_1 == 2
      if not (gs_c1_1 == 2) then goto L85514 end
      tmp601 = gs_c204_2.Name == "Trophy2"
      if not (gs_c204_2.Name == "Trophy2") then goto L85514 end
      tmp601 = gs_c204_2:FindFirstChild("Handle")
      ::L85514::
      if tmp601 then
      gs_c1_3 = gs_c204_2.Handle.Rotation
      goto L85645
      end
      local tmp602 = gs_c1_1 == 3
      if not (gs_c1_1 == 3) then goto L85554 end
      tmp602 = gs_c204_2.Name == "Trophy3"
      if not (gs_c204_2.Name == "Trophy3") then goto L85554 end
      tmp602 = gs_c204_2:FindFirstChild("Handle")
      ::L85554::
      if tmp602 then
      gs_c1_3 = gs_c204_2.Handle.Rotation
      goto L85645
      end
      local tmp603 = gs_c1_1 == 4
      if not (gs_c1_1 == 4) then goto L85594 end
      tmp603 = gs_c204_2.Name == "Trophy4"
      if not (gs_c204_2.Name == "Trophy4") then goto L85594 end
      tmp603 = gs_c204_2:FindFirstChild("Handle")
      ::L85594::
      if tmp603 then
      gs_c1_3 = gs_c204_2.Handle.Rotation
      goto L85645
      end
      local tmp604 = gs_c1_1 == 5
      if not (gs_c1_1 == 5) then goto L85634 end
      tmp604 = gs_c204_2.Name == "Trophy5"
      if not (gs_c204_2.Name == "Trophy5") then goto L85634 end
      tmp604 = gs_c204_2:FindFirstChild("Handle")
      ::L85634::
      if not tmp604 then goto L85645 end
      gs_c1_3 = gs_c204_2.Handle.Rotation
      ::L85645::
      if gs_c1_3 then return {gs_c1_3.Z} end
    end
    return
  end
  fn_205 = function(...)
    local _,  a1, a2 = ...
    gs_c205_1 = a1
    gs_c205_2 = a2
    if ((tostring(workspace.Map["Haunted Castle"]["Placard" .. gs_c205_1][gs_c205_2].Indicator.BrickColor)) ~= "Pearl") then
      fireclickdetector(workspace.Map["Haunted Castle"]["Placard" .. gs_c205_1][gs_c205_2].ClickDetector)
    end
    return
  end
  fn_206 = function(...)
    fn_916 = function(...)
                                  if not _G.Auto_Soul_Guitar then goto L85336 end
      if not World3 then goto L85334 end
      gs_c1_53.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
      gs_c1_53.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")) == nil) then
        _tp(CFrame.new(-8655.0166015625, 141.3166961669922, 6160.0224609375))
        gs_c1_53.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
        gs_c1_53.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
        goto L85332
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")).Swamp == false) then goto L84056 end
      Quest1 = true
      Quest2 = false
      Quest3 = false
      Quest4 = false
      gs_916_4_1 = GetConnectionEnemies("Living Zombie")
      if not gs_916_4_1 then goto L84033 end
      ::L83957::
      task.wait()
      gs_c1_13.Kill(gs_916_4_1, _G.Auto_Soul_Guitar)
      local tmp593 = not _G.Auto_Soul_Guitar
      if not _G.Auto_Soul_Guitar then goto L84028 end
      tmp593 = gs_916_4_1.Humanoid.Health <= 0
      if gs_916_4_1.Humanoid.Health <= 0 then goto L84028 end
      tmp593 = not gs_916_4_1.Parent
      if not gs_916_4_1.Parent then goto L84028 end
      tmp593 = workspace.Map["Haunted Castle"].SwampWater.Color ~= (Color3.fromRGB(117, 0, 0))
      ::L84028::
      if not (tmp593) then
        goto L83957
      end
      goto L84054
      ::L84033::
      _tp(CFrame.new(-10170.7275390625, 138.6524658203125, 5934.26513671875))
      ::L84054::
      goto L85332
      ::L84056::
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")).Gravestones == false) then
        Quest1 = false
        Quest2 = true
        Quest3 = false
        Quest4 = false
        GetFirePlacard("7", "Left")
        GetFirePlacard("6", "Left")
        GetFirePlacard("5", "Left")
        GetFirePlacard("4", "Right")
        GetFirePlacard("3", "Left")
        GetFirePlacard("2", "Right")
        GetFirePlacard("1", "Right")
        goto L85332
      end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")).Ghost == false) then
        gs_c1_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
        gs_c1_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
        goto L85332
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")).Trophies == false) then goto L84948 end
      Quest1 = false
      Quest2 = false
      Quest3 = true
      Quest4 = false
      _tp(CFrame.new(-9532.8232421875, 6.471667766571045, 6078.068359375))
      ::L84278::
      wait()
      gs_916_11_1 = getRT(1)
      gs_916_11_2 = getT(1)
      local tmp594 = gs_916_11_1
      if gs_916_11_1 then
        tmp594 = gs_916_11_2
      end
      if tmp594 then
        fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment1.FindFirstChild(workspace.Map["Haunted Castle"].Tablet.Segment1, "ClickDetector"))
      end
      if gs_916_11_1 == gs_916_11_2 then goto L84360 end
      goto L84278
      ::L84360::
      wait()
      gs_916_13_1 = getRT(2)
      gs_916_13_2 = getT(3)
      local tmp595 = gs_916_13_1
      if gs_916_13_1 then
        tmp595 = gs_916_13_2
      end
      if tmp595 then
        fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment3.FindFirstChild(workspace.Map["Haunted Castle"].Tablet.Segment3, "ClickDetector"))
      end
      if gs_916_13_1 == gs_916_13_2 then goto L84442 end
      goto L84360
      ::L84442::
      wait()
      gs_916_15_1 = getRT(3)
      gs_916_15_2 = getT(4)
      local tmp596 = gs_916_15_1
      if gs_916_15_1 then
        tmp596 = gs_916_15_2
      end
      if tmp596 then
        fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment4.FindFirstChild(workspace.Map["Haunted Castle"].Tablet.Segment4, "ClickDetector"))
      end
      if gs_916_15_1 == gs_916_15_2 then goto L84524 end
      goto L84442
      ::L84524::
      wait()
      gs_916_17_1 = getRT(4)
      gs_916_17_2 = getT(7)
      local tmp597 = gs_916_17_1
      if gs_916_17_1 then
        tmp597 = gs_916_17_2
      end
      if tmp597 then
        fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment7.FindFirstChild(workspace.Map["Haunted Castle"].Tablet.Segment7, "ClickDetector"))
      end
      if gs_916_17_1 == gs_916_17_2 then goto L84606 end
      goto L84524
      ::L84606::
      wait()
      gs_916_19_1 = getRT(5)
      gs_916_19_2 = getT(10)
      local tmp598 = gs_916_19_1
      if gs_916_19_1 then
        tmp598 = gs_916_19_2
      end
      if tmp598 then
        fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment10.FindFirstChild(workspace.Map["Haunted Castle"].Tablet.Segment10, "ClickDetector"))
      end
      if gs_916_19_1 == gs_916_19_2 then goto L84688 end
      goto L84606
      ::L84688::
      wait()
      fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment2.FindFirstChild(workspace.Map["Haunted Castle"].Tablet.Segment2, "ClickDetector"))
      fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment5.FindFirstChild(workspace.Map["Haunted Castle"].Tablet.Segment5, "ClickDetector"))
      fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment6.FindFirstChild(workspace.Map["Haunted Castle"].Tablet.Segment6, "ClickDetector"))
      fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment8.FindFirstChild(workspace.Map["Haunted Castle"].Tablet.Segment8, "ClickDetector"))
      fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment9.FindFirstChild(workspace.Map["Haunted Castle"].Tablet.Segment9, "ClickDetector"))
      local tmp599 = workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0
      if workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 then goto L84943 end
      tmp599 = workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0
      if workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 then goto L84943 end
      tmp599 = workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0
      if workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 then goto L84943 end
      tmp599 = workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0
      if workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 then goto L84943 end
      tmp599 = workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0
      ::L84943::
      if not (tmp599) then
        goto L84688
      end
      goto L85332
      ::L84948::
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")).Pipes == false) then goto L85332 end
      Quest1 = false
      Quest2 = false
      Quest3 = false
      Quest4 = true
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
      ::L85332::
      ::L85334::
      ::L85336::
      return
    end
    ::L83731::
    task.wait()
    if _G.Auto_Soul_Guitar then goto L83748 end
    goto L83731
    ::L83748::
    if (wait(Sec)) then
      pcall(fn_916)
      goto L83748
    end
    return
  end
  fn_207 = function(...)
    local _,  a1 = ...
    gs_c207_1 = a1
    _G.AutoMatSoul = gs_c207_1
    return
  end
  fn_208 = function(...)
    fn_915 = function(...)
                                      local tmp585 = _G.AutoMatSoul
      if _G.AutoMatSoul then
        tmp585 = (GetWP("Skull Guitar")) == false
      end
      if not tmp585 then goto L83720 end
      local tmp586 = (GetM("Bones")) >= 500
      if not ((GetM("Bones")) >= 500) then goto L83208 end
      tmp586 = (GetM("Ectoplasm")) >= 250
      if not ((GetM("Ectoplasm")) >= 250) then goto L83208 end
      tmp586 = (GetM("Dark Fragment")) >= 1
      ::L83208::
      if tmp586 then
        gs_c1_53.Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
        goto L83718
      end
      if not ((GetM("Ectoplasm")) <= 250) then goto L83400 end
      local tmp587 = _G.AutoMatSoul
      if _G.AutoMatSoul then
        tmp587 = World2
      end
      if not tmp587 then goto L83379 end
      gs_915_5_1 = ({{"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior"}})[1]
      gs_915_5_2 = GetConnectionEnemies(gs_915_5_1)
      if not gs_915_5_2 then goto L83346 end
      ::L83296::
      task.wait()
      gs_c1_13.Kill(gs_915_5_2, _G.AutoMatSoul)
      local tmp588 = not _G.AutoMatSoul
      if not _G.AutoMatSoul then goto L83341 end
      tmp588 = not gs_915_5_2.Parent
      if not gs_915_5_2.Parent then goto L83341 end
      tmp588 = gs_915_5_2.Humanoid.Health <= 0
      ::L83341::
      if not (tmp588) then
        goto L83296
      end
      goto L83377
      ::L83346::
      gs_c1_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      ::L83377::
      goto L83398
      ::L83379::
      gs_c1_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
      ::L83398::
      goto L83717
      ::L83400::
      if not ((GetM("Dark Fragment")) < 1) then goto L83551 end
      local tmp589 = _G.AutoMatSoul
      if _G.AutoMatSoul then
        tmp589 = World2
      end
      if not tmp589 then goto L83509 end
      gs_915_11_1 = GetConnectionEnemies("Darkbeard")
      if not gs_915_11_1 then goto L83486 end
      ::L83444::
      task.wait()
      gs_c1_13.Kill(gs_915_11_1, _G.AutoMatSoul)
      local tmp590 = _G.AutoMatSoul
      if not (_G.AutoMatSoul) then
        tmp590 = gs_915_11_1.Humanoid.Health <= 0
      end
      if not (tmp590) then
        goto L83444
      end
      goto L83507
      ::L83486::
      _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
      ::L83507::
      goto L83528
      ::L83509::
      gs_c1_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
      ::L83528::
      if not (GetConnectionEnemies("Darkbeard")) then
        Hop()
      end
      goto L83717
      ::L83551::
      if not ((GetM("Bones")) <= 500) then goto L83717 end
      local tmp591 = _G.AutoMatSoul
      if _G.AutoMatSoul then
        tmp591 = World3
      end
      if not tmp591 then goto L83696 end
      gs_915_18_1 = ({{"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}})[1]
      gs_915_18_2 = GetConnectionEnemies(gs_915_18_1)
      if not gs_915_18_2 then goto L83673 end
      ::L83613::
      task.wait()
      gs_c1_13.Kill(gs_915_18_2, _G.AutoMatSoul)
      local tmp592 = not _G.AutoMatSoul
      if not _G.AutoMatSoul then goto L83668 end
      tmp592 = gs_915_18_2.Humanoid.Health <= 0
      if gs_915_18_2.Humanoid.Health <= 0 then goto L83668 end
      tmp592 = not gs_915_18_2.Parent
      if not gs_915_18_2.Parent then goto L83668 end
      tmp592 = gs_915_18_2.Humanoid.Health <= 0
      ::L83668::
      if not (tmp592) then
        goto L83613
      end
      goto L83694
      ::L83673::
      _tp(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
      ::L83694::
      goto L83715
      ::L83696::
      gs_c1_53.Remotes.CommF_:InvokeServer("TravelZou")
      ::L83715::
      ::L83717::
      ::L83718::
      ::L83720::
      return
    end
    while (wait(Sec)) do
      pcall(fn_915)
    end
    return
  end
  fn_209 = function(...)
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    topos(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    return
  end
  fn_210 = function(...)
    local _,  a1 = ...
    gs_c210_1 = a1
    _G.Dojoo = gs_c210_1
    return
  end
  fn_211 = function(...)
    local _,  a1 = ...
      gs_c211_1 = a1
    local tmp584 = (type(gs_c211_1)) == "table"
    if ((type(gs_c211_1)) == "table") then
      tmp584 = gs_c211_1.Quest.BeltName
    end
    if tmp584 then return {gs_c211_1.Quest.BeltName} end
    return
  end
  fn_212 = function(...)
    fn_914 = function(...)
                                                                                                                                                                                                                                          gs_c914_1 = ({{{.NPC = "Dojo Trainer", .Command = "RequestQuest"}}})[1]
      gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
      gs_c914_2 = (gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")).InvokeServer(gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest"), unpack(gs_c914_1))
      gs_c914_3 = printBeltName(gs_c914_2)
      local tmp575 = debug == false
      if not (debug == false) then goto L82393 end
      tmp575 = not gs_c914_2
      if not not gs_c914_2 then goto L82393 end
      tmp575 = not gs_c914_3
      ::L82393::
      if tmp575 then
        _tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))
        debug = true
        goto L82956
      end
      local tmp576 = debug == true
      if (debug == true) then
        tmp576 = ((CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 50
      end
      if not tmp576 then goto L82956 end
      if not (gs_c914_3 == "White") then goto L82555 end
      gs_914_3_1 = GetConnectionEnemies("Skull Slayer")
      if not gs_914_3_1 then goto L82532 end
      ::L82481::
      task.wait()
      gs_c1_13.Kill(gs_914_3_1, _G.Dojoo)
      local tmp577 = not gs_c914_2
      if not gs_c914_2 then goto L82527 end
      tmp577 = not _G.Dojoo
      if not _G.Dojoo then goto L82527 end
      tmp577 = not (gs_c1_13.Alive(gs_914_3_1))
      ::L82527::
      if not (tmp577) then
        goto L82481
      end
      goto L82553
      ::L82532::
      _tp(CFrame.new(-16759.58984375, 71.28376770019531, 1595.3399658203125))
      ::L82553::
      goto L82954
      ::L82555::
      if not (gs_c914_3 == "Yellow") then goto L82656 end
      ::L82561::
      task.wait()
      _G.SeaBeast1 = true
      _G.TerrorShark = true
      _G.Shark = true
      _G.Piranha = true
      _G.MobCrew = true
      _G.FishBoat = true
      _G.SailBoats = true
      if _G.Dojoo then
      end
      if not (j82616_0_8) then
        goto L82561
      end
      _G.SeaBeast1 = false
      _G.TerrorShark = false
      _G.Shark = false
      _G.Piranha = false
      _G.MobCrew = false
      _G.FishBoat = false
      _G.SailBoats = false
      local tmp581 = _G
      goto L82954
      ::L82656::
      if not (gs_c914_3 == "Green") then goto L82697 end
      ::L82662::
      task.wait()
      _G.SailBoats = true
      if _G.Dojoo then
      end
      if not (j82687_0_2) then
        goto L82662
      end
      _G.SailBoats = false
      tmp581 = _G
      goto L82954
      ::L82697::
      if not (gs_c914_3 == "Purple") then goto L82738 end
      ::L82703::
      task.wait()
      _G.FarmEliteHunt = true
      if _G.Dojoo then
      end
      if not (j82728_0_2) then
        goto L82703
      end
      _G.FarmEliteHunt = false
      tmp581 = _G
      goto L82954
      ::L82738::
      if not (gs_c914_3 == "Red") then goto L82789 end
      ::L82744::
      task.wait()
      _G.SailBoats = true
      _G.FishBoat = true
      if _G.Dojoo then
      end
      if not (j82774_0_3) then
        goto L82744
      end
      _G.SailBoats = false
      _G.FishBoat = false
      tmp581 = _G
      goto L82954
      ::L82789::
      if not (gs_c914_3 == "Black") then goto L82939 end
      ::L82795::
      task.wait()
      local tmp578 = workspace.Map:FindFirstChild("PrehistoricIsland")
      if not (workspace.Map:FindFirstChild("PrehistoricIsland")) then
        tmp578 = workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")
      end
      if tmp578 then
        _G.Prehis_Find = true
        if (workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true)) then
          _G.Prehis_Skills = false
          _G.Prehis_Find = true
        else
          _G.Prehis_Skills = true
          _G.Prehis_Find = false
        end
        local tmp579 = _G
      else
        _G.Prehis_Find = true
        _G.Prehis_Skills = false
        tmp579 = _G
      end
      if _G.Dojoo then
      end
      if not (j82924_0_4) then
        goto L82795
      end
      _G.Prehis_Find = false
      _G.Prehis_Skills = false
      tmp581 = tmp579
      goto L82954
      ::L82939::
      local tmp580 = gs_c914_3 == "Orange"
      if not (gs_c914_3 == "Orange") then
        tmp580 = gs_c914_3 == "Blue"
      end
      if not tmp580 then goto L82954 end
      return
      ::L82954::
      local tmp582 = tmp581
      ::L82956::
      local tmp583 = tmp582
      if not gs_c914_2 then
        debug = false
        gs_914_22_1 = ({{{.NPC = "Dojo Trainer", .Command = "ClaimQuest"}}})[1]
        gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
        (gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")).InvokeServer(gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest"), unpack(gs_914_22_1))
      end
      return
    end
    while (wait(Sec)) do
      if _G.Dojoo then
        pcall(fn_914)
      end
    end
    return
  end
  fn_213 = function(...)
    local _,  a1 = ...
    gs_c213_1 = a1
    _G.FarmBlazeEM = gs_c213_1
    return
  end
  fn_214 = function(...)
                        fn_912 = function(...)
      gs_c912_1 = ({{{.Context = "RequestQuest"}}})[1]
      game:GetService("ReplicatedStorage")
      (game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")
      ((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net")
      (((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net")).WaitForChild(((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net"), "RF/DragonHunter")
      ((((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net")).WaitForChild(((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net"), "RF/DragonHunter")).InvokeServer((((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net")).WaitForChild(((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net"), "RF/DragonHunter"), unpack(gs_c912_1))
      return
    end
    fn_913 = function(...)
      game:GetService("ReplicatedStorage")
      (game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")
      ((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net")
      (((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net")).WaitForChild(((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net"), "RF/DragonHunter")
      gs_c214_2 = ((((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net")).WaitForChild(((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net"), "RF/DragonHunter")).InvokeServer((((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net")).WaitForChild(((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules")).WaitForChild((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Modules"), "Net"), "RF/DragonHunter"), unpack(gs_c214_1))
      return
    end
    gs_c214_1 = ({{{.Context = "Check"}}})[1]
    gs_c214_2 = ({})[1]
    pcall(fn_912)
    gs_c214_3 = pcall(fn_913)
    gs_c214_4 = ({pcall(fn_913)})[2]
    gs_c214_5 = false
    if not gs_c214_2 then goto L82100 end
    if not gs_c214_2.Text then goto L82098 end
    gs_c214_5 = true
    gs_214_2_1 = gs_c214_2.Text
    if not (string.find(tostring(gs_214_2_1), "Defeat")) then goto L82067 end
    gs_c214_8 = 1
    gs_c214_6 = string.sub(tostring(gs_214_2_1), 8, 9)
    gs_c214_6 = tonumber(gs_c214_6)
    gs_214_3_1 = ({{"Hydra Enforcer", "Venomous Assailant"}})[1]
    _iter = {pairs(gs_214_3_1)}
    ::L82032::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      local tmp571 = _iter
      goto L82064
    end
    gs_214_3_1 = _loopkey
    gs_214_3_2 = _loopval
    if (string.find(gs_214_1_1, gs_214_3_2)) then
      gs_c1_7 = gs_214_3_2
    else
      goto L82032
    end
    ::L82064::
    local tmp572 = tmp571
    goto L82096
    ::L82067::
    if not (string.find(tostring(gs_214_2_1), "Destroy")) then goto L82096 end
    gs_c214_6 = 10
    gs_c214_8 = 2
    gs_c214_7 = nil
    ::L82096::
    local tmp573 = tmp572
    ::L82098::
    local tmp574 = tmp573
    ::L82100::
    return gs_c1_5, gs_c1_7, gs_c1_6, gs_c1_8
  end
  fn_215 = function(...)
        _iter = {pairs((game:GetService("Players")).LocalPlayer.PlayerGui.Notifications.GetChildren((game:GetService("Players")).LocalPlayer.PlayerGui.Notifications))}
    ::L81836::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L81878
    end
    gs_c215_1 = _loopkey
    gs_c215_2 = _loopval
    if (gs_c215_2.Name == "NotificationTemplate") then
      if (string.find(gs_c215_2.Text, "Head back to the Dojo to complete more tasks")) then return {true} end
    end
    goto L81836
    ::L81878::
    return false
  end
  fn_216 = function(...)
    local _,  a1, a2, a3 = ...
          gs_c216_1 = a1
    gs_c216_2 = a2
    gs_c216_3 = a3
    if not (workspace.Enemies:FindFirstChild(gs_c216_2)) then goto L81783 end
    for _key, item in pairs(workspace.Enemies:GetChildren()) do
      gs_216_1_1 = _key
      gs_216_1_2 = item
      local tmp570 = gs_216_1_2.Name == gs_c1_2
      if (gs_216_1_2.Name == gs_c1_2) then
      tmp570 = gs_root_13.Alive(gs_216_1_2)
      end
      if tmp570 then
      if gs_c1_1 then
      gs_root_13.Kill(gs_216_1_2, gs_c1_1)
      end
      end
    end
    goto L81793
    ::L81783::
    _tp(gs_c216_3)
    ::L81793::
    return
  end
  fn_217 = function(...)
    fn_910 = function(...)
                      fn_911 = function(...)
        _tp((workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true)).CFrame * (CFrame.new(4, 0, 0)))
        return
      end
      gs_c910_1 = checkQuesta()
      gs_c910_2 = ({checkQuesta()})[2]
      gs_c910_3 = ({checkQuesta()})[3]
      gs_c910_4 = ({checkQuesta()})[4]
      local tmp566 = gs_c910_1 == true
      if (gs_c910_1 == true) then
        tmp566 = not (BackTODoJo())
      end
      if not tmp566 then goto L81600 end
      if not (gs_c910_4 == 1) then goto L81349 end
      local tmp567 = gs_c910_2 == "Hydra Enforcer"
      if not (gs_c910_2 == "Hydra Enforcer") then
        tmp567 = gs_c910_2 == "Venomous Assailant"
      end
      if not tmp567 then goto L81347 end
      ::L81293::
      wait()
      DragonMobClear(true, gs_c910_2, CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
      local tmp568 = not _G.FarmBlazeEM
      if not _G.FarmBlazeEM then goto L81342 end
      tmp568 = not gs_c910_1
      if not gs_c910_1 then goto L81342 end
      tmp568 = BackTODoJo()
      ::L81342::
      if not (tmp568) then
        goto L81293
      end
      ::L81347::
      goto L81598
      ::L81349::
      if not (gs_c910_4 == 2) then goto L81598 end
      if not (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true)) then goto L81596 end
      ::L81379::
      wait()
      spawn(fn_911)
      if (((workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true)).Position - Root.Position).Magnitude <= 200) then
        MousePos = (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true)).Position
        Useskills("Melee", "Z")
        Useskills("Melee", "X")
        Useskills("Melee", "C")
        wait(0.5)
        Useskills("Sword", "Z")
        Useskills("Sword", "X")
        wait(0.5)
        Useskills("Blox Fruit", "Z")
        Useskills("Blox Fruit", "X")
        Useskills("Blox Fruit", "C")
        wait(0.5)
        Useskills("Gun", "Z")
        Useskills("Gun", "X")
      end
      local tmp569 = not _G.FarmBlazeEM
      if not _G.FarmBlazeEM then goto L81591 end
      tmp569 = not gs_c910_1
      if not gs_c910_1 then goto L81591 end
      tmp569 = BackTODoJo()
      ::L81591::
      if not (tmp569) then
        goto L81379
      end
      ::L81596::
      ::L81598::
      goto L81631
      ::L81600::
      _tp(CFrame.new(5813, 1208, 884))
      DragonMobClear(false)
      ::L81631::
      return
    end
    while (wait()) do
      if _G.FarmBlazeEM then
        pcall(fn_910)
      end
    end
    return
  end
  fn_218 = function(...)
    fn_909 = function(...)
      local _t1
      if (workspace.EmberTemplate:FindFirstChild("Part")) then
        _t1 = game.Players.LocalPlayer.Character.HumanoidRootPart
        _t1.CFrame = workspace.EmberTemplate.Part.CFrame
        local tmp565 = game.Players.LocalPlayer.Character.HumanoidRootPart
      end
      return
    end
    while (wait(0.1)) do
      if _G.FarmBlazeEM then
        pcall(fn_909)
      end
    end
    return
  end
  fn_219 = function(...)
    ::L80981::
    if not (wait(0.2)) then goto L81130 end
    if (QuestYama_1 == true) then
      gs_c1_92:SetDesc("Quest Numbers : yama quest 1")
      goto L81128
    end
    if (QuestYama_2 == true) then
      gs_c1_92:SetDesc("Quest Numbers : yama quest 2")
      goto L81128
    end
    if (QuestYama_3 == true) then
      gs_c1_92:SetDesc("Quest Numbers : yama quest 3")
      goto L81128
    end
    if (QuestTushita_1 == true) then
      gs_c1_92:SetDesc("Quest Numbers : tushita quest 1")
      goto L81128
    end
    if (QuestTushita_2 == true) then
      gs_c1_92:SetDesc("Quest Numbers : tushita quest 2")
      goto L81128
    end
    if not (GetWP("Cursed Dual Katana")) then goto L81128 end
    gs_c1_92:SetDesc("Quest Numbers : CDK done!!")
    ::L81128::
    goto L80981
    ::L81130::
    return
  end
  fn_220 = function(...)
    local _,  a1 = ...
    gs_c220_1 = a1
    _G.CDK = gs_c220_1
    return
  end
  fn_221 = function(...)
    fn_908 = function(...)
                  if not _G.CDK then goto L80970 end
      gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
      gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
      gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Boss")
      gs_908_1_1 = GetConnectionEnemies("Cursed Skeleton Boss")
      if not gs_908_1_1 then goto L80920 end
      ::L80768::
      wait()
      local tmp562 = gs_c1_52.Character:FindFirstChild("Yama")
      if not (gs_c1_52.Character:FindFirstChild("Yama")) then
        tmp562 = gs_c1_52.Backpack:FindFirstChild("Yama")
      end
      if tmp562 then
        EquipWeapon("Yama")
        goto L80868
      end
      local tmp563 = gs_c1_52.Character:FindFirstChild("Tushita")
      if not (gs_c1_52.Character:FindFirstChild("Tushita")) then
        tmp563 = gs_c1_52.Backpack:FindFirstChild("Tushita")
      end
      if not tmp563 then goto L80868 end
      EquipWeapon("Tushita")
      ::L80868::
      _tp(gs_908_1_1.HumanoidRootPart.CFrame * (CFrame.new(0, 20, 0)))
      local tmp564 = not _G.CDK
      if not _G.CDK then goto L80915 end
      tmp564 = not gs_908_1_1.Parent
      if not gs_908_1_1.Parent then goto L80915 end
      tmp564 = gs_908_1_1.Humanoid.Health <= 0
      ::L80915::
      if not (tmp564) then
        goto L80768
      end
      goto L80968
      ::L80920::
      _tp(CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375))
      wait(0.5)
      _tp(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
      ::L80968::
      ::L80970::
      return
    end
    while (wait(Sec)) do
      pcall(fn_908)
    end
    return
  end
  fn_222 = function(...)
    local _,  a1 = ...
    gs_c222_1 = a1
    _G.CDK_YM = gs_c222_1
    return
  end
  fn_223 = function(...)
    fn_907 = function(...)
          if not _G.CDK_YM then goto L80651 end
      if ((tostring(gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor"))) ~= "opened") then
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        goto L80649
      end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Finished == nil) then
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        goto L80648
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Finished == false) then goto L80648 end
      if not ((tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == -3) then goto L79216 end
      QuestYama_1 = true
      QuestYama_2 = false
      QuestYama_3 = false
      ::L79074::
      task.wait()
      if not (workspace.Enemies:FindFirstChild("Forest Pirate")) then
        _tp(CFrame.new(-13223.521484375, 428.1938171386719, -7766.06787109375))
        goto L79174
      end
      gs_907_9_1 = GetConnectionEnemies("Forest Pirate")
      if gs_907_9_1 then
        _tp((workspace.Enemies:FindFirstChild("Forest Pirate")).HumanoidRootPart.CFrame)
      end
      ::L79174::
      local tmp551 = (tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == 1
      if not ((tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == 1) then
        tmp551 = not _G.CDK_YM
      end
      if not (tmp551) then
        goto L79074
      end
      goto L80646
      ::L79216::
      if not ((tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == -4) then goto L79611 end
      QuestYama_1 = false
      QuestYama_2 = true
      QuestYama_3 = false
      _iter = {pairs((game:GetService("Players")).LocalPlayer.QuestHaze.GetChildren((game:GetService("Players")).LocalPlayer.QuestHaze))}
      ::L79296::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L79608
      end
      gs_907_11_1 = _loopkey
      gs_907_11_2 = _loopval
      _iter = {pairs(gs_root_11)}
      ::L79317::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L79604
      end
      gs_907_11_1 = _loopkey
      gs_907_11_2 = _loopval
      local tmp552 = string.find(gs_907_11_1, gs_907_5_2.Name)
      if (string.find(gs_907_11_1, gs_907_5_2.Name)) then
        tmp552 = gs_907_5_2.Value > 0
      end
      if not tmp552 then goto L79601 end
      local tmp553 = (gs_907_11_2.Position - Root.Position).Magnitude <= 1000
      if ((gs_907_11_2.Position - Root.Position).Magnitude <= 1000) then
        tmp553 = workspace.Enemies:FindFirstChild(gs_907_11_1)
      end
      if not tmp553 then goto L79589 end
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L79412::
      _k3 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k3[1]
      if not (_k3[1] == nil) then
        goto L79586
      end
      gs_907_15_1 = _loopkey
      gs_907_15_2 = _loopval
      local tmp554 = gs_907_15_2:FindFirstChild("HumanoidRootPart")
      if not (gs_907_15_2:FindFirstChild("HumanoidRootPart")) then goto L79490 end
      tmp554 = gs_907_15_2:FindFirstChild("Humanoid")
      if not (gs_907_15_2:FindFirstChild("Humanoid")) then goto L79490 end
      tmp554 = (gs_907_15_2:FindFirstChild("Humanoid")).Health > 0
      if not ((gs_907_15_2:FindFirstChild("Humanoid")).Health > 0) then goto L79490 end
      tmp554 = gs_907_15_2:FindFirstChild("HazeESP")
      ::L79490::
      if not tmp554 then goto L79583 end
      ::L79493::
      wait()
      gs_deepm2_13.Kill(gs_907_15_2, _G.CDK_YM)
      local tmp555 = not _G.CDK_YM
      if not _G.CDK_YM then goto L79578 end
      tmp555 = (tonumber((gs_deepm2_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == 2
      if (tonumber((gs_deepm2_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == 2 then goto L79578 end
      tmp555 = not (gs_907_15_2:FindFirstChild("HazeESP"))
      if not (gs_907_15_2:FindFirstChild("HazeESP")) then goto L79578 end
      tmp555 = gs_907_15_2.Humanoid.Health <= 0
      ::L79578::
      if not (tmp555) then
        goto L79493
      end
      ::L79583::
      goto L79412
      ::L79586::
      goto L79599
      ::L79589::
      _tp(gs_907_11_2)
      ::L79599::
      ::L79601::
      goto L79317
      ::L79604::
      goto L79296
      ::L79608::
      goto L80646
      ::L79611::
      if not ((tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == -5) then goto L80646 end
      QuestYama_1 = false
      QuestYama_2 = false
      QuestYama_3 = true
      if not (workspace.Map:FindFirstChild("HellDimension")) then goto L80644 end
      if not ((Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000) then goto L80642 end
      _iter = {pairs(workspace.Map.HellDimension.Exit:GetChildren())}
      ::L79722::
      _k4 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k4[1]
      if not (_k4[1] == nil) then
        goto L79814
      end
      gs_907_22_1 = _loopkey
      gs_907_22_2 = _loopval
      if not ((tonumber(gs_907_22_1)) == 2) then goto L79811 end
      ::L79745::
      task.wait()
      Root.CFrame = workspace.Map.HellDimension.Exit.CFrame
      if _G.CDK_YM then
      end
      if not (j79806_1_2) then
        goto L79745
      end
      local tmp556 = Root
      ::L79811::
      goto L79722
      ::L79814::
      EquipWeapon(_G.SelectWeapon)
      if not ((tonumber((gs_c223_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) ~= 3) then goto L80430 end
      ::L79858::
      task.wait()
      ::L79868::
      task.wait()
      _tp(workspace.Map.HellDimension.Torch1.Particles.CFrame)
      _iter = {pairs(workspace.Map.HellDimension.GetDescendants(workspace.Map.HellDimension))}
      ::L79924::
      _k5 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k5[1]
      if not (_k5[1] == nil) then
        goto L79963
      end
      gs_907_28_1 = _loopkey
      gs_907_28_2 = _loopval
      if (gs_907_28_2:IsA("ProximityPrompt")) then
        fireproximityprompt(gs_907_28_2)
      end
      goto L79924
      ::L79963::
      if not ((workspace.Map.HellDimension.Torch1.Particles.Position - Root.Position).Magnitude < 5) then
        goto L79868
      end
      wait(2)
      _G.T1Yama = true
      if not _G.CDK_YM then goto L80045 end
      if _G.T1Yama then goto L80045 end
      ::L80045::
      _iter = _G
      if j80045_0_2 then goto L80048 end
      goto L79858
      ::L80048::
      task.wait()
      ::L80058::
      task.wait()
      _tp(workspace.Map.HellDimension.Torch2.Particles.CFrame)
      _iter = {pairs(workspace.Map.HellDimension.GetDescendants(workspace.Map.HellDimension))}
      ::L80114::
      _k6 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k6[1]
      if not (_k6[1] == nil) then
        goto L80153
      end
      gs_907_32_1 = _loopkey
      gs_907_32_2 = _loopval
      if (gs_907_32_2:IsA("ProximityPrompt")) then
        fireproximityprompt(gs_907_32_2)
      end
      goto L80114
      ::L80153::
      if not ((workspace.Map.HellDimension.Torch2.Particles.Position - Root.Position).Magnitude < 5) then
        goto L80058
      end
      wait(2)
      _G.T2Yama = true
      if _G.T2Yama then goto L80236 end
      if _G.CDK_YM == false then goto L80236 end
      ::L80236::
      _iter = _G
      if j80236_0_2 then goto L80239 end
      _iter = _G
      goto L80048
      ::L80239::
      wait()
      ::L80247::
      task.wait()
      _tp(workspace.Map.HellDimension.Torch3.Particles.CFrame)
      _iter = {pairs(workspace.Map.HellDimension.GetDescendants(workspace.Map.HellDimension))}
      ::L80303::
      _k7 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k7[1]
      if not (_k7[1] == nil) then
        goto L80342
      end
      gs_907_36_1 = _loopkey
      gs_907_36_2 = _loopval
      if (gs_907_36_2:IsA("ProximityPrompt")) then
        fireproximityprompt(gs_907_36_2)
      end
      goto L80303
      ::L80342::
      if not ((workspace.Map.HellDimension.Torch3.Particles.Position - Root.Position).Magnitude < 5) then
        goto L80247
      end
      wait(2)
      _G.T3Yama = true
      if _G.T3Yama then goto L80425 end
      if _G.CDK_YM == false then goto L80425 end
      ::L80425::
      if not (j80425_0_2) then
        _iter = _G
        goto L80239
      end
      local tmp557 = _G
      ::L80430::
      _iter = tmp557
      h80455_0_2 = {pairs(workspace.Enemies:GetChildren())}
      ::L80455::
      _k8 = {h80455_0_2[1](h80455_0_2[2], h80455_0_2[3])}
      h80455_0_2[3] = _k8[1]
      if not (_k8[1] == nil) then
        goto L80639
      end
      gs_907_23_1 = h80455_0_2[1]
      gs_907_23_2 = h80455_0_2[2]
      local tmp561 = _iter
      if not (((gs_907_23_2:FindFirstChild("HumanoidRootPart")).Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 300) then goto L80636 end
      local tmp558 = gs_907_23_2:FindFirstChild("HumanoidRootPart")
      if not (gs_907_23_2:FindFirstChild("HumanoidRootPart")) then goto L80549 end
      tmp558 = gs_907_23_2:FindFirstChild("Humanoid")
      if not (gs_907_23_2:FindFirstChild("Humanoid")) then goto L80549 end
      tmp558 = (gs_907_23_2:FindFirstChild("Humanoid")).Health > 0
      ::L80549::
      local tmp560 = _iter
      if not tmp558 then goto L80634 end
      _iter = _iter
      ::L80552::
      task.wait()
      gs_c1_13.Kill(gs_907_23_2, _G.CDK_YM)
      local tmp559 = not _G.CDK_YM
      if not _G.CDK_YM then goto L80629 end
      tmp559 = gs_907_23_2.Humanoid.Health <= 0
      if gs_907_23_2.Humanoid.Health <= 0 then goto L80629 end
      tmp559 = not gs_907_23_2.Parent
      if not gs_907_23_2.Parent then goto L80629 end
      tmp559 = (tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == 3
      ::L80629::
      if not (tmp559) then
        goto L80552
      end
      tmp560 = _iter
      ::L80634::
      tmp561 = tmp560
      ::L80636::
      _iter = tmp561
      goto L80455
      ::L80639::
      ::L80642::
      ::L80644::
      ::L80646::
      ::L80648::
      ::L80649::
      ::L80651::
      return
    end
    while (wait()) do
      pcall(fn_907)
    end
    return
  end
  fn_224 = function(...)
    fn_906 = function(...)
          if not _G.CDK_YM then goto L78842 end
      if not ((tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == -5) then goto L78840 end
      local tmp542 = not (workspace.Map:FindFirstChild("HellDimension"))
      if (workspace.Map:FindFirstChild("HellDimension")) then
        tmp542 = (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000
      end
      if not tmp542 then goto L78838 end
      gs_906_3_1 = GetConnectionEnemies("Soul Reaper")
      if not gs_906_3_1 then goto L78285 end
      ::L78162::
      task.wait()
      _tp(gs_906_3_1.HumanoidRootPart.CFrame)
      local tmp543 = gs_906_3_1.Humanoid.Health <= 0
      if gs_906_3_1.Humanoid.Health <= 0 then goto L78280 end
      tmp543 = not _G.CDK_YM
      if not _G.CDK_YM then goto L78280 end
      tmp543 = not gs_906_3_1.Parent
      if not gs_906_3_1.Parent then goto L78280 end
      tmp543 = (tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == 3
      if (tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Evil)) == 3 then goto L78280 end
      tmp543 = workspace.Map:FindFirstChild("HellDimension")
      if not (workspace.Map:FindFirstChild("HellDimension")) then goto L78280 end
      tmp543 = (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000
      ::L78280::
      if not (tmp543) then
        goto L78162
      end
      goto L78836
      ::L78285::
      local tmp544 = gs_c1_52.Backpack:FindFirstChild("Hallow Essence")
      if not (gs_c1_52.Backpack:FindFirstChild("Hallow Essence")) then
        tmp544 = gs_c1_52.Character:FindFirstChild("Hallow Essence")
      end
      if not tmp544 then goto L78386 end
      ::L78321::
      _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
      task.wait()
      if not (((CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)).Position - Root.Position).Magnitude <= 8) then
        goto L78321
      end
      EquipWeapon("Hallow Essence")
      goto L78836
      ::L78386::
      local tmp545 = gs_c1_53:FindFirstChild("Soul Reaper")
      if (gs_c1_53:FindFirstChild("Soul Reaper")) then
        tmp545 = (gs_c1_53:FindFirstChild("Soul Reaper")).Humanoid.Health > 0
      end
      if tmp545 then
        _tp((gs_c1_53:FindFirstChild("Soul Reaper")).HumanoidRootPart.CFrame)
        goto L78836
      end
      local tmp546 = (gs_c1_53.Remotes.CommF_:InvokeServer("Bones", "Check")) < 50
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Bones", "Check")) < 50) then goto L78532 end
      tmp546 = not (workspace.Enemies:FindFirstChild("Soul Reaper"))
      if not not (workspace.Enemies:FindFirstChild("Soul Reaper")) then goto L78532 end
      tmp546 = not (gs_c1_53:FindFirstChild("Soul Reaper"))
      if not not (gs_c1_53:FindFirstChild("Soul Reaper")) then goto L78532 end
      tmp546 = not (workspace.Map:FindFirstChild("HellDimension"))
      ::L78532::
      if not tmp546 then goto L78813 end
      local tmp547 = workspace.Enemies:FindFirstChild("Reborn Skeleton")
      if workspace.Enemies:FindFirstChild("Reborn Skeleton") then goto L78608 end
      tmp547 = workspace.Enemies:FindFirstChild("Living Zombie")
      if workspace.Enemies:FindFirstChild("Living Zombie") then goto L78608 end
      tmp547 = workspace.Enemies:FindFirstChild("Domenic Soul")
      if workspace.Enemies:FindFirstChild("Domenic Soul") then goto L78608 end
      tmp547 = workspace.Enemies:FindFirstChild("Posessed Mummy")
      ::L78608::
      if not tmp547 then goto L78790 end
      for _key, item in pairs(workspace.Enemies:GetChildren()) do
        gs_906_11_1 = _key
        gs_906_11_2 = item
        local tmp548 = gs_906_11_2.Name == "Reborn Skeleton"
        if gs_906_11_2.Name == "Reborn Skeleton" then goto L78675 end
        tmp548 = gs_906_11_2.Name == "Living Zombie"
        if gs_906_11_2.Name == "Living Zombie" then goto L78675 end
        tmp548 = gs_906_11_2.Name == "Demonic Soul"
        if gs_906_11_2.Name == "Demonic Soul" then goto L78675 end
        tmp548 = gs_906_11_2.Name == "Posessed Mummy"
        ::L78675::
        if not tmp548 then goto L78784 end
        local tmp549 = gs_906_11_2:FindFirstChild("HumanoidRootPart")
        if not (gs_906_11_2:FindFirstChild("HumanoidRootPart")) then goto L78729 end
        tmp549 = gs_906_11_2:FindFirstChild("Humanoid")
        if not (gs_906_11_2:FindFirstChild("Humanoid")) then goto L78729 end
        tmp549 = (gs_906_11_2:FindFirstChild("Humanoid")).Health > 0
        ::L78729::
        if not tmp549 then goto L78782 end
        ::L78732::
        task.wait()
        gs_root_13.Kill(gs_906_11_2, _G.CDK_YM)
        local tmp550 = not _G.CDK_YM
        if not _G.CDK_YM then goto L78777 end
        tmp550 = gs_906_11_2.Humanoid.Health <= 0
        if gs_906_11_2.Humanoid.Health <= 0 then goto L78777 end
        tmp550 = not gs_906_11_2.Parent
        ::L78777::
        if not (tmp550) then
        goto L78732
        end
        ::L78782::
        ::L78784::
      end
      goto L78811
      ::L78790::
      _tp(CFrame.new(-9515.2255859375, 164.0062255859375, 5785.38330078125))
      ::L78811::
      goto L78835
      ::L78813::
      gs_c1_53.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
      ::L78835::
      ::L78836::
      ::L78838::
      ::L78840::
      ::L78842::
      return
    end
    while (wait()) do
      pcall(fn_906)
    end
    return
  end
  fn_225 = function(...)
    local _,  a1 = ...
    gs_c225_1 = a1
    _G.CDK_TS = gs_c225_1
    return
  end
  fn_226 = function(...)
    fn_905 = function(...)
          local _t3
      if not _G.CDK_TS then goto L78030 end
      if ((tostring(gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor"))) ~= "opened") then
        wait(0.7)
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
        wait(0.3)
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        goto L78028
      end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Finished == nil) then
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        goto L78027
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Finished == false) then goto L78027 end
      if not ((tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Good)) == -3) then goto L76765 end
      QuestTushita_1 = true
      QuestTushita_2 = false
      QuestTushita_3 = false
      ::L76013::
      wait()
      _tp(CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875))
      local tmp528 = ((CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3
      if ((CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then goto L76121 end
      tmp528 = not _G.CDK_TS
      if not _G.CDK_TS then goto L76121 end
      tmp528 = (tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Good)) == 1
      ::L76121::
      if not (tmp528) then
        goto L76013
      end
      if (((CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10) then
        wait(0.7)
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
        wait(0.5)
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
      end
      wait(1)
      ::L76263::
      wait()
      _tp(CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125))
      local tmp529 = ((CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3
      if ((CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then goto L76371 end
      tmp529 = not _G.CDK_TS
      if not _G.CDK_TS then goto L76371 end
      tmp529 = (tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Good)) == 1
      ::L76371::
      if not (tmp529) then
        goto L76263
      end
      if (((CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10) then
        wait(0.7)
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
        wait(0.5)
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
      end
      wait(1)
      ::L76513::
      wait()
      _tp(CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625))
      local tmp530 = ((CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3
      if ((CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then goto L76621 end
      tmp530 = not _G.CDK_TS
      if not _G.CDK_TS then goto L76621 end
      tmp530 = (tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Good)) == 1
      ::L76621::
      if not (tmp530) then
        goto L76513
      end
      if (((CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10) then
        wait(0.7)
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
        wait(0.5)
        gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
      end
      wait(1)
      goto L78025
      ::L76765::
      if not ((tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Good)) == -4) then goto L76866 end
      QuestTushita_1 = false
      QuestTushita_2 = true
      QuestTushita_3 = false
      ::L76806::
      wait()
      _G.AutoRaidCastle = true
      if _G.CDK_TS then
      end
      if not (j76856_0_2) then
        goto L76806
      end
      _G.AutoRaidCastle = false
      local tmp538 = _G
      goto L78025
      ::L76866::
      if not ((tonumber((gs_c1_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Good)) == -5) then goto L78025 end
      QuestTushita_1 = false
      QuestTushita_2 = false
      QuestTushita_3 = true
      if not (workspace.Enemies:FindFirstChild("Cake Queen")) then goto L77101 end
      for _key, item in pairs(workspace.Enemies:GetChildren()) do
        gs_905_16_1 = _key
        gs_905_16_2 = item
        if not (gs_905_16_2.Name == "Cake Queen") then goto L77095 end
        local tmp531 = gs_905_16_2:FindFirstChild("Humanoid")
        if not (gs_905_16_2:FindFirstChild("Humanoid")) then goto L77010 end
        tmp531 = gs_905_16_2:FindFirstChild("HumanoidRootPart")
        if not (gs_905_16_2:FindFirstChild("HumanoidRootPart")) then goto L77010 end
        tmp531 = gs_905_16_2.Humanoid.Health > 0
        ::L77010::
        if not tmp531 then goto L77093 end
        ::L77013::
        wait()
        gs_root_13.Kill(gs_905_16_2, _G.CDK_TS)
        local tmp532 = not _G.CDK_TS
        if not _G.CDK_TS then goto L77088 end
        tmp532 = not gs_905_16_2.Parent
        if not gs_905_16_2.Parent then goto L77088 end
        tmp532 = gs_905_16_2.Humanoid.Health <= 0
        if gs_905_16_2.Humanoid.Health <= 0 then goto L77088 end
        tmp532 = (tonumber((gs_root_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")).Good)) == 3
        ::L77088::
        if not (tmp532) then
        goto L77013
        end
        ::L77093::
        ::L77095::
      end
      goto L78023
      ::L77101::
      local tmp533 = gs_c1_53:FindFirstChild("Cake Queen")
      if (gs_c1_53:FindFirstChild("Cake Queen")) then
        tmp533 = (gs_c1_53:FindFirstChild("Cake Queen")).Humanoid.Health > 0
      end
      if tmp533 then
        _tp((gs_c1_53:FindFirstChild("Cake Queen")).HumanoidRootPart.CFrame * (CFrame.new(0, 30, 0)))
        goto L78023
      end
      if not ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000) then goto L78022 end
      _iter = {pairs(workspace.Map.HeavenlyDimension.Exit:GetChildren())}
      ::L77239::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L77255
      end
      gs_905_23_1 = _loopkey
      gs_905_23_2 = _loopval
      Ex = gs_905_23_1
      goto L77239
      ::L77255::
      _iter = nil
      if not (Ex == 2) then goto L77335 end
      ::L77263::
      wait()
      _t3 = game.Players.LocalPlayer.Character.HumanoidRootPart
      _t3.CFrame = workspace.Map.HeavenlyDimension.Exit.CFrame
      if _G.CDK_TS then
      end
      if not (j77330_0_2) then
        goto L77263
      end
      _iter = game.Players.LocalPlayer.Character.HumanoidRootPart
      ::L77335::
      wait()
      ::L77343::
      wait()
      _tp(CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625))
      _iter = {pairs(workspace.Map.HeavenlyDimension.GetDescendants(workspace.Map.HeavenlyDimension))}
      ::L77397::
      _k4 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k4[1]
      if not (_k4[1] == nil) then
        goto L77436
      end
      gs_905_28_1 = _loopkey
      gs_905_28_2 = _loopval
      if (gs_905_28_2:IsA("ProximityPrompt")) then
        fireproximityprompt(gs_905_28_2)
      end
      goto L77397
      ::L77436::
      if not (((CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5) then
        goto L77343
      end
      wait(2)
      _G.DoneT1 = true
      if _G.CDK_TS then
      end
      _iter = _G
      if j77496_0_2 then goto L77499 end
      _iter = _G
      goto L77335
      ::L77499::
      wait()
      ::L77507::
      wait()
      _tp(CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875))
      _iter = {pairs(workspace.Map.HeavenlyDimension.GetDescendants(workspace.Map.HeavenlyDimension))}
      ::L77561::
      _k5 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k5[1]
      if not (_k5[1] == nil) then
        goto L77600
      end
      gs_905_32_1 = _loopkey
      gs_905_32_2 = _loopval
      if (gs_905_32_2:IsA("ProximityPrompt")) then
        fireproximityprompt(gs_905_32_2)
      end
      goto L77561
      ::L77600::
      if not (((CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5) then
        goto L77507
      end
      wait(2)
      _G.DoneT2 = true
      if not (_G.DoneT2) then
      end
      _iter = _G
      if j77661_0_2 then goto L77664 end
      _iter = _G
      goto L77499
      ::L77664::
      wait()
      ::L77672::
      task.wait()
      _tp(CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375))
      _iter = {pairs(workspace.Map.HeavenlyDimension.GetDescendants(workspace.Map.HeavenlyDimension))}
      ::L77728::
      _k6 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k6[1]
      if not (_k6[1] == nil) then
        goto L77767
      end
      gs_905_36_1 = _loopkey
      gs_905_36_2 = _loopval
      if (gs_905_36_2:IsA("ProximityPrompt")) then
        fireproximityprompt(gs_905_36_2)
      end
      goto L77728
      ::L77767::
      if not (((CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5) then
        goto L77672
      end
      wait(2)
      _G.DoneT3 = true
      if not (_G.DoneT3) then
      end
      if not (j77828_0_2) then
        _iter = _G
        goto L77664
      end
      _iter = _G
      h77856_0_2 = {pairs(workspace.Enemies:GetChildren())}
      ::L77856::
      _k7 = {h77856_0_2[1](h77856_0_2[2], h77856_0_2[3])}
      h77856_0_2[3] = _k7[1]
      if not (_k7[1] == nil) then
        goto L78019
      end
      gs_905_35_1 = h77856_0_2[1]
      gs_905_35_2 = h77856_0_2[2]
      local tmp537 = _iter
      if not (((gs_905_35_2:FindFirstChild("HumanoidRootPart")).Position - (CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.32185834e-08, 0.99301964, -8.73070718e-08, 1, -2.30819008e-08, -0.99301964, -8.3975138e-08, 0.11794927)).Position).Magnitude <= 300) then goto L78016 end
      local tmp534 = gs_905_35_2:FindFirstChild("HumanoidRootPart")
      if not (gs_905_35_2:FindFirstChild("HumanoidRootPart")) then goto L77963 end
      tmp534 = gs_905_35_2:FindFirstChild("Humanoid")
      if not (gs_905_35_2:FindFirstChild("Humanoid")) then goto L77963 end
      tmp534 = (gs_905_35_2:FindFirstChild("Humanoid")).Health > 0
      ::L77963::
      local tmp536 = _iter
      if not tmp534 then goto L78014 end
      _iter = _iter
      ::L77966::
      wait()
      gs_c905_13.Kill(gs_905_35_2, _G.CDK_TS)
      local tmp535 = not _G.CDK_TS
      if not _G.CDK_TS then goto L78009 end
      tmp535 = gs_905_35_2.Humanoid.Health <= 0
      if gs_905_35_2.Humanoid.Health <= 0 then goto L78009 end
      tmp535 = not gs_905_35_2.Parent
      ::L78009::
      if not (tmp535) then
        goto L77966
      end
      tmp536 = _iter
      ::L78014::
      tmp537 = tmp536
      ::L78016::
      _iter = tmp537
      goto L77856
      ::L78019::
      ::L78022::
      ::L78023::
      ::L78025::
      local tmp539 = tmp538
      ::L78027::
      local tmp540 = tmp539
      ::L78028::
      local tmp541 = tmp540
      ::L78030::
      return
    end
    while (wait()) do
      pcall(fn_905)
    end
    return
  end
  fn_227 = function(...)
    local _,  a1 = ...
    gs_c227_1 = a1
    _G.AutoDoughKing = gs_c227_1
    return
  end
  fn_228 = function(...)
    fn_904 = function(...)
          if not (workspace.Map.CakeLoaf:FindFirstChild("RedDoor")) then
        if (GetBP("Red Key")) then
          gs_c1_53.Remotes.CommF_:InvokeServer("CakeScientist", "Check")
          gs_c1_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
        end
        goto L75525
      end
      if not (workspace.Map.CakeLoaf:FindFirstChild("RedDoor")) then goto L75423 end
      if not (GetBP("Red Key")) then goto L75421 end
      ::L75324::
      task.wait()
      _tp(CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782))
      local tmp522 = not (getgenv()).AutoDoughKing
      if (getgenv()).AutoDoughKing then
        tmp522 = (gs_c1_52.Character.HumanoidRootPart.CFrame - (CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782))).Magnitude <= 5
      end
      if not (tmp522) then
        goto L75324
      end
      EquipWeapon("Red Key")
      ::L75421::
      goto L75525
      ::L75423::
      if not (GetConnectionEnemies("Dough King")) then goto L75525 end
      gs_904_6_1 = GetConnectionEnemies("Dough King")
      if not gs_904_6_1 then goto L75502 end
      ::L75452::
      task.wait()
      gs_c1_13.Kill(gs_904_6_1, _G.AutoDoughKing)
      local tmp523 = not _G.AutoDoughKing
      if not _G.AutoDoughKing then goto L75497 end
      tmp523 = not gs_904_6_1.Parent
      if not gs_904_6_1.Parent then goto L75497 end
      tmp523 = gs_904_6_1.Humanoid.Health <= 0
      ::L75497::
      if not (tmp523) then
        goto L75452
      end
      goto L75523
      ::L75502::
      _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
      ::L75523::
      ::L75525::
      if (GetBP("Sweet Chalice")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
        _G.AutoAttackDoughKing = true
        local tmp524 = _G
      else
        _G.AutoAttackDoughKing = false
        tmp524 = _G
      end
      if (GetBP("God's Chalice")) then
      end
      local tmp525 = tmp524
      if j75590_0_2 then
        gs_c1_53.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
      end
      if (gs_c1_52.Backpack:FindFirstChild("God's Chalice")) then
      end
      if j75646_0_2 then
        _G.FarmEliteHunt = true
      else
        _G.FarmEliteHunt = false
      end
      local tmp527 = tmp525
      if not ((GetM("Conjured Cocoa")) <= 10) then goto L75775 end
      gs_904_15_1 = ({GetConnectionEnemies({"Cocoa Warrior", "Chocolate Bar Battler"})})[1]
      if not gs_904_15_1 then goto L75752 end
      _iter = tmp525
      h75701_0_2 = j75663_0_2
      ::L75701::
      task.wait()
      gs_c1_13.Kill(gs_904_15_1, _G.AutoDoughKing)
      local tmp526 = _G.AutoDoughKing == false
      if _G.AutoDoughKing == false then goto L75747 end
      tmp526 = not gs_904_15_1.Parent
      if not gs_904_15_1.Parent then goto L75747 end
      tmp526 = gs_904_15_1.Humanoid.Health <= 0
      ::L75747::
      if not (tmp526) then
        goto L75701
      end
      goto L75773
      ::L75752::
      _tp(CFrame.new(402.7189025878906, 81.06050109863281, -12259.54296875))
      ::L75773::
      ::L75775::
      return
    end
    while (wait()) do
      if _G.AutoDoughKing then
        pcall(fn_904)
      end
    end
    return
  end
  fn_229 = function(...)
    local _,  a1 = ...
    gs_c229_1 = a1
    _G.AutoAttackDoughKing = gs_c229_1
    return
  end
  fn_230 = function(...)
    fn_903 = function(...)
          gs_c903_1 = GetConnectionEnemies("Dough King")
      if not gs_c903_1 then goto L75156 end
      ::L75106::
      task.wait()
      gs_c1_13.Kill(gs_c903_1, _G.AutoAttackDoughKing)
      local tmp521 = not _G.AutoAttackDoughKing
      if not _G.AutoAttackDoughKing then goto L75151 end
      tmp521 = not gs_c903_1.Parent
      if not gs_c903_1.Parent then goto L75151 end
      tmp521 = gs_c903_1.Humanoid.Health <= 0
      ::L75151::
      if not (tmp521) then
        goto L75106
      end
      goto L75177
      ::L75156::
      _tp(CFrame.new(-1943.6765, 251.5095, -12337.8809))
      ::L75177::
      return
    end
    while (wait()) do
      if _G.AutoAttackDoughKing then
        pcall(fn_903)
      end
    end
    return
  end
  fn_231 = function(...)
    gs_c1_53.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
    gs_c1_53.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
    gs_c1_53.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
    return
  end
  fn_232 = function(...)
    gs_c1_53.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
    return
  end
  fn_233 = function(...)
    local _,  a1 = ...
    gs_c233_1 = a1
    _G.Tp_LgS = gs_c233_1
    return
  end
  fn_234 = function(...)
    fn_902 = function(...)
              for _key, item in pairs(gs_c1_53.NPCs:GetChildren()) do
                gs_c902_1 = _key
                gs_c902_2 = item
                if (gs_c902_2.Name == "Legendary Sword Dealer ") then
                _tp(gs_c902_2.HumanoidRootPart.CFrame)
                end
              end
      return
    end
    while (wait(Sec)) do
      if _G.Tp_LgS then
        pcall(fn_902)
      end
    end
    return
  end
  fn_235 = function(...)
    local _,  a1 = ...
    gs_c235_1 = a1
    _G.AutoPole = gs_c235_1
    return
  end
  fn_236 = function(...)
    fn_901 = function(...)
          gs_c901_1 = GetConnectionEnemies("Thunder God")
      if not gs_c901_1 then goto L74845 end
      ::L74795::
      task.wait()
      gs_c1_13.Kill(gs_c901_1, _G.AutoPole)
      local tmp520 = not _G.AutoPole
      if not _G.AutoPole then goto L74840 end
      tmp520 = not gs_c901_1.Parent
      if not gs_c901_1.Parent then goto L74840 end
      tmp520 = gs_c901_1.Humanoid.Health <= 0
      ::L74840::
      if not (tmp520) then
        goto L74795
      end
      goto L74866
      ::L74845::
      _tp(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))
      ::L74866::
      return
    end
    while (wait(Sec)) do
      if _G.AutoPole then
        pcall(fn_901)
      end
    end
    return
  end
  fn_237 = function(...)
    local _,  a1 = ...
    gs_c237_1 = a1
    _G.AutoPoleV2 = gs_c237_1
    return
  end
  fn_238 = function(...)
    fn_900 = function(...)
      if not _G.AutoPoleV2 then goto L74733 end
      if not (GetBP("Pole (1st Form)")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("LoadItem", "Pole (1st Form)")
      end
      if not (GetBP("Pole (2nd Form)")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("LoadItem", "Pole (2nd Form)")
      end
      local tmp513 = GetBP("Pole (1st Form)")
      if (GetBP("Pole (1st Form)")) then
        tmp513 = (GetBP("Pole (1st Form)")).Level.Value <= 179
      end
      if tmp513 then
        _G.Level = true
        local tmp515 = _G
        goto L74404
      end
      local tmp514 = GetBP("Pole (1st Form)")
      if (GetBP("Pole (1st Form)")) then
        tmp514 = (GetBP("Pole (1st Form)")).Level.Value >= 180
      end
      if not tmp514 then goto L74404 end
      _G.Level = false
      tmp515 = _G
      ::L74404::
      if not (GetBP("Rumble Fruit")) then return end
      if not ((GetBP("Rumble Fruit")).AwakenedMoves.FindFirstChild((GetBP("Rumble Fruit")).AwakenedMoves, "Z")) then goto L74543 end
      if not ((GetBP("Rumble Fruit")).AwakenedMoves.FindFirstChild((GetBP("Rumble Fruit")).AwakenedMoves, "X")) then goto L74543 end
      if not ((GetBP("Rumble Fruit")).AwakenedMoves.FindFirstChild((GetBP("Rumble Fruit")).AwakenedMoves, "C")) then goto L74543 end
      if not ((GetBP("Rumble Fruit")).AwakenedMoves.FindFirstChild((GetBP("Rumble Fruit")).AwakenedMoves, "V")) then goto L74543 end
      ::L74543::
      if j74543_0_2 then
        _G.SelectChip = nil
        _G.Raiding = false
        _G.Auto_Awakener = false
        local tmp516 = tmp515
        if (gs_c1_52.Data.Fragments.Value >= 5000) then
          gs_c1_53.Remotes.CommF_:InvokeServer("Thunder God", "Talk")
          wait(Sec)
          gs_c1_53.Remotes.CommF_:InvokeServer("Thunder God", "Sure")
        end
        local tmp518 = tmp516
        goto L74731
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Awakener", "Check")) == nil) then
      end
      tmp518 = tmp515
      if not j74665_0_2 then goto L74731 end
      _G.SelectChip = "Rumble"
      gs_900_9_1 = gs_c1_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
      local tmp517 = tmp515
      if gs_900_9_1 then
        gs_900_9_1.Stop(gs_900_9_1)
      end
      _G.Raiding = true
      _G.Auto_Awakener = true
      tmp518 = tmp517
      ::L74731::
      local tmp519 = tmp518
      ::L74733::
      return
    end
    while (wait(Sec)) do
      pcall(fn_900)
    end
    return
  end
  fn_239 = function(...)
    local _,  a1 = ...
    gs_c239_1 = a1
    _G.AutoSaw = gs_c239_1
    return
  end
  fn_240 = function(...)
    fn_899 = function(...)
          if not _G.AutoSaw then goto L74226 end
      gs_899_1_1 = GetConnectionEnemies("The Saw")
      if not gs_899_1_1 then goto L74203 end
      ::L74159::
      task.wait()
      gs_c1_13.Kill(gs_899_1_1, _G.AutoSaw)
      local tmp512 = _G.AutoSaw == false
      if not (_G.AutoSaw == false) then
        tmp512 = gs_899_1_1.Humanoid.Health <= 0
      end
      if not (tmp512) then
        goto L74159
      end
      goto L74224
      ::L74203::
      _tp(CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906))
      ::L74224::
      ::L74226::
      return
    end
    while (wait(0.2)) do
      pcall(fn_899)
    end
    return
  end
  fn_241 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c241_1 = a1
    _t1 = getgenv()
    _t1.SelectMob = gs_c241_1
    return
  end
  fn_242 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c242_1 = a1
    _t1 = getgenv()
    _t1.SelectMob = gs_c242_1
    return
  end
  fn_243 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c243_1 = a1
    _t1 = getgenv()
    _t1.SelectMob = gs_c243_1
    return
  end
  fn_244 = function(...)
    local _,  a1 = ...
    gs_c244_1 = a1
    _G.AutoKillMob = gs_c244_1
    return
  end
  fn_245 = function(...)
    fn_898 = function(...)
                      if not ((game:GetService("Workspace")).Enemies.FindFirstChild((game:GetService("Workspace")).Enemies, (getgenv()).SelectMob)) then goto L74058 end
      _iter = {pairs((game:GetService("Workspace")).Enemies.GetChildren((game:GetService("Workspace")).Enemies))}
      ::L73912::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L74055
      end
      gs_898_1_1 = _loopkey
      gs_898_1_2 = _loopval
      if not (gs_898_1_2.Name == (getgenv()).SelectMob) then goto L74052 end
      local tmp510 = gs_898_1_2:FindFirstChild("Humanoid")
      if not (gs_898_1_2:FindFirstChild("Humanoid")) then goto L73979 end
      tmp510 = gs_898_1_2:FindFirstChild("HumanoidRootPart")
      if not (gs_898_1_2:FindFirstChild("HumanoidRootPart")) then goto L73979 end
      tmp510 = gs_898_1_2.Humanoid.Health > 0
      ::L73979::
      if not tmp510 then goto L74050 end
      ::L73982::
      (game:GetService("RunService")).Heartbeat.Wait((game:GetService("RunService")).Heartbeat)
      gs_root_13.Kill(gs_898_1_2, _G.AutoKillMob)
      local tmp511 = not _G.AutoKillMob
      if not _G.AutoKillMob then goto L74045 end
      tmp511 = not gs_898_1_2.Parent
      if not gs_898_1_2.Parent then goto L74045 end
      tmp511 = gs_898_1_2.Humanoid.Health <= 0
      ::L74045::
      if not (tmp511) then
        goto L73982
      end
      ::L74050::
      ::L74052::
      goto L73912
      ::L74055::
      ::L74058::
      return
    end
    while (wait()) do
      if _G.AutoKillMob then
        pcall(fn_898)
      end
    end
    return
  end
  fn_246 = function(...)
    local _,  a1 = ...
    gs_c246_1 = a1
    _G.SelectIsland = gs_c246_1
    return
  end
  fn_247 = function(...)
    local _,  a1 = ...
    gs_c247_1 = a1
    _G.SelectIsland = gs_c247_1
    return
  end
  fn_248 = function(...)
    local _,  a1 = ...
    gs_c248_1 = a1
    _G.SelectIsland = gs_c248_1
    return
  end
  fn_249 = function(...)
    local _,  a1 = ...
    gs_c249_1 = a1
    _G.AutoFarmIsland = gs_c249_1
    return
  end
  fn_250 = function(...)
                ::L73460::
    if not (task.wait(0.2)) then goto L73767 end
    if not _G.AutoFarmIsland then
      goto L73460
    end
    if not _G.SelectIsland then
      goto L73460
    end
    if not gs_c1_96 then
      goto L73460
    end
    gs_250_1_1 = gs_c1_96[_G.SelectIsland]
    if not gs_250_1_1 then
      goto L73460
    end
    gs_250_1_2 = gs_250_1_1.CFrame
    gs_250_1_3 = gs_250_1_1.Mobs
    gs_250_1_4 = ({{}})[1]
    _iter = {ipairs(gs_250_1_3)}
    ::L73559::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L73576
    end
    gs_250_1_1 = _loopkey
    gs_250_1_2 = _loopval
    gs_c250_4[gs_250_1_2] = true
    goto L73559
    ::L73576::
    gs_250_6_5 = false
    _iter = {pairs(workspace.Enemies:GetChildren())}
    ::L73609::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L73749
    end
    gs_250_6_1 = _loopkey
    gs_250_6_2 = _loopval
    local tmp508 = gs_250_1_4[gs_250_6_2.Name]
    if not gs_250_1_4[gs_250_6_2.Name] then goto L73669 end
    tmp508 = gs_250_6_2:FindFirstChild("Humanoid")
    if not (gs_250_6_2:FindFirstChild("Humanoid")) then goto L73669 end
    tmp508 = gs_250_6_2:FindFirstChild("HumanoidRootPart")
    if not (gs_250_6_2:FindFirstChild("HumanoidRootPart")) then goto L73669 end
    tmp508 = gs_250_6_2.Humanoid.Health > 0
    ::L73669::
    if not tmp508 then goto L73746 end
    gs_250_1_5 = true
    ::L73674::
    task.wait()
    _tp(gs_250_6_2.HumanoidRootPart.CFrame * (CFrame.new(0, 10, 0)))
    gs_c1_13.Kill(gs_250_6_2, true)
    local tmp509 = not _G.AutoFarmIsland
    if not _G.AutoFarmIsland then goto L73741 end
    tmp509 = not gs_250_6_2.Parent
    if not gs_250_6_2.Parent then goto L73741 end
    tmp509 = gs_250_6_2.Humanoid.Health <= 0
    ::L73741::
    if not (tmp509) then
      goto L73674
    end
    ::L73746::
    goto L73609
    ::L73749::
    if not gs_250_7_5 then
      _tp(gs_250_7_2)
    end
    goto L73460
    ::L73767::
    return
  end
  fn_251 = function(...)
    local _,  a1 = ...
    gs_c251_1 = a1
    _G.RandomMagnet = gs_c251_1
    if gs_c251_1 then
      StartAutoSpin()
    else
      StopAutoSpin()
    end
    return
  end
  fn_252 = function(...)
    gs_c252_1 = gs_c1_97:FindFirstChild("Remotes")
    if not gs_c252_1 then return end
    return gs_c252_1:FindFirstChild("GachaNetworkRF")
  end
  fn_253 = function(...)
      fn_897 = function(...)
      return gs_c253_1:InvokeServer("Check", "MagnetEventGacha26")
    end
    gs_c253_1 = gs_c1_103()
    if not gs_c253_1 then return end
    gs_c253_2 = pcall(fn_897)
    gs_c253_3 = ({pcall(fn_897)})[2]
    local tmp507 = gs_c253_2
    if not gs_c253_2 then goto L73358 end
    tmp507 = (type(gs_c253_3)) == "table"
    if not ((type(gs_c253_3)) == "table") then goto L73358 end
    tmp507 = gs_c253_3.Current
    ::L73358::
    if tmp507 then
      gs_c1_100 = gs_c253_3.Current
    end
    return
  end
  fn_254 = function(...)
    gs_c1_104()
    return gs_c1_100 >= gs_c1_102
  end
  fn_255 = function(...)
      fn_896 = function(...)
      return gs_c255_1:InvokeServer("Purchase", "MagnetEventGacha26")
    end
    gs_c255_1 = gs_c1_103()
    if not gs_c255_1 then return {false} end
    gs_c255_2 = pcall(fn_896)
    gs_c255_3 = ({pcall(fn_896)})[2]
    if not gs_c255_2 then return {false} end
    local tmp506 = gs_c255_3
    if gs_c255_3 then
      tmp506 = gs_c255_3.ErrorMessage
    end
    if tmp506 then return {false} end
    gs_c1_101 = gs_c1_101 + 1
    gs_c1_104()
    return true
  end
  fn_256 = function(...)
    while gs_c1_99 do
      task.wait(2)
      if (gs_c1_105()) then
        gs_c1_106()
      end
    end
    return
  end
  fn_257 = function(...)
    if gs_c1_99 then return end
    gs_c1_99 = true
    task.spawn(gs_c1_107)
    return
  end
  fn_258 = function(...)
    gs_c1_99 = false
    return
  end
  fn_259 = function(...)
    fn_895 = function(...)
      gs_c1_108:SetDesc("Elite Progress : " .. (gs_c1_53.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")))
      return
    end
    while (wait(Sec)) do
      pcall(fn_895)
    end
    return
  end
  fn_260 = function(...)
          gs_c260_1 = ""
    ::L72812::
    if not (wait(1)) then goto L73083 end
    game:GetService("ReplicatedStorage")
    local tmp503 = (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "Diablo")
    if (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "Diablo") then goto L73001 end
    game:GetService("ReplicatedStorage")
    tmp503 = (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "Deandre")
    if (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "Deandre") then goto L73001 end
    game:GetService("ReplicatedStorage")
    tmp503 = (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "Urban")
    if (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "Urban") then goto L73001 end
    tmp503 = (game:GetService("Workspace")).Enemies.FindFirstChild((game:GetService("Workspace")).Enemies, "Diablo")
    if (game:GetService("Workspace")).Enemies.FindFirstChild((game:GetService("Workspace")).Enemies, "Diablo") then goto L73001 end
    tmp503 = (game:GetService("Workspace")).Enemies.FindFirstChild((game:GetService("Workspace")).Enemies, "Deandre")
    if (game:GetService("Workspace")).Enemies.FindFirstChild((game:GetService("Workspace")).Enemies, "Deandre") then goto L73001 end
    tmp503 = (game:GetService("Workspace")).Enemies.FindFirstChild((game:GetService("Workspace")).Enemies, "Urban")
    ::L73001::
    local tmp504 = tmp503
    if tmp503 then
      tmp504 = "\226\156\133"
    end
    local tmp505 = tmp504
    if not (tmp504) then
      tmp505 = "\226\157\140"
    end
    gs_260_1_1 = tmp505
    gs_260_1_2 = (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "EliteHunter", "Progress")
    if (gs_260_1_1 ~= gs_c260_1) then
      gs_c1_109:SetDesc("Status: " .. (gs_260_1_1 .. (" | Killed: " .. gs_260_1_2)))
      gs_c260_1 = gs_260_1_1
    end
    goto L72812
    ::L73083::
    return
  end
  fn_261 = function(...)
    local _,  a1 = ...
    gs_c261_1 = a1
    _G.FarmEliteHunt = gs_c261_1
    return
  end
  fn_262 = function(...)
    fn_894 = function(...)
      if not _G.FarmEliteHunt then goto L72794 end
      gs_894_1_1 = gs_c1_52.PlayerGui.Main.Quest
      gs_894_1_2 = gs_894_1_1.Container.QuestTitle.Title.Text
      if not gs_894_1_1.Visible then
        gs_894_2_1 = gs_c1_53.Remotes.CommF_:InvokeServer("EliteHunter")
        local tmp483 = gs_894_2_1 == nil
        if not (gs_894_2_1 == nil) then
          tmp483 = string.find(gs_894_2_1, "Cooldown")
        end
        if tmp483 then
          wait(10)
          return
        end
        task.wait(1)
        goto L72792
      end
      gs_894_4_1 = ({})[1]
      _iter = {pairs({"Diablo", "Urban", "Deandre"})}
      ::L72486::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        local tmp484 = _iter
        goto L72518
      end
      gs_894_4_1 = _loopkey
      gs_894_4_2 = _loopval
      if (string.find(gs_c894_2, gs_894_4_2)) then
        gs_894_1_1 = gs_894_4_2
      else
        goto L72486
      end
      ::L72518::
      if not gs_894_1_1 then goto L72772 end
      gs_894_7_1 = ({})[1]
      _iter = tmp484
      h72552_0_2 = j72518_0_2
      _iter = {pairs(gs_root_53:GetChildren())}
      ::L72552::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        local tmp486 = _iter
        goto L72595
      end
      gs_894_7_1 = _loopkey
      gs_894_7_2 = _loopval
      local tmp485 = gs_894_7_2.Name == gs_c894_1
      if (gs_894_7_2.Name == gs_c894_1) then
        tmp485 = gs_894_7_2:FindFirstChild("HumanoidRootPart")
      end
      if tmp485 then
        gs_894_1_1 = gs_894_7_2
      else
        goto L72552
      end
      ::L72595::
      _iter = _iter
      h72619_0_2 = h72552_0_2
      _iter = tmp486
      h72619_1_2 = j72595_1_2
      _iter = {pairs(Enemies:GetChildren())}
      ::L72619::
      _k3 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k3[1]
      if not (_k3[1] == nil) then
        local tmp488 = _iter
        goto L72658
      end
      gs_894_1_1 = _loopkey
      gs_894_1_2 = _loopval
      local tmp487 = gs_894_1_2.Name == gs_262_1_1
      if (gs_894_1_2.Name == gs_262_1_1) then
        tmp487 = gs_deepm2_13.Alive(gs_894_1_2)
      end
      if tmp487 then
        gs_c894_1 = gs_894_1_2
      else
        goto L72619
      end
      ::L72658::
      local tmp489 = gs_c894_1
      if gs_c894_1 then
        tmp489 = gs_c894_1:FindFirstChild("HumanoidRootPart")
      end
      if not tmp489 then goto L72760 end
      _tp(gs_c894_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 0)))
      _iter = _iter
      h72705_0_2 = h72619_0_2
      _iter = _iter
      h72705_1_2 = h72619_1_2
      _iter = tmp488
      h72705_2_2 = j72658_2_2
      ::L72705::
      wait()
      gs_deepm2_13.Kill(gs_c894_1, _G.FarmEliteHunt)
      local tmp490 = not _G.FarmEliteHunt
      if not _G.FarmEliteHunt then goto L72755 end
      tmp490 = not gs_c894_1.Parent
      if not gs_c894_1.Parent then goto L72755 end
      tmp490 = gs_c894_1.Humanoid.Health <= 0
      if gs_c894_1.Humanoid.Health <= 0 then goto L72755 end
      tmp490 = not gs_c262_1.Visible
      ::L72755::
      if not (tmp490) then
        goto L72705
      end
      local tmp491 = _iter
      local tmp493 = _iter
      local tmp492 = _iter
      goto L72770
      ::L72760::
      wait(5)
      tmp491 = _iter
      tmp493 = _iter
      tmp492 = tmp488
      ::L72770::
      local tmp494 = tmp491
      local tmp496 = tmp493
      local tmp495 = tmp492
      goto L72791
      ::L72772::
      gs_root_53.Remotes.CommF_:InvokeServer("AbandonQuest")
      tmp494 = tmp484
      ::L72791::
      local tmp497 = tmp494
      local tmp498 = tmp496
      local tmp499 = tmp495
      ::L72792::
      local tmp500 = tmp497
      local tmp502 = tmp498
      local tmp501 = tmp499
      ::L72794::
      return
    end
    while (wait(1)) do
      pcall(fn_894)
    end
    return
  end
  fn_263 = function(...)
    local _,  a1 = ...
    gs_c263_1 = a1
    _G.FarmEliteH = gs_c263_1
    return
  end
  fn_264 = function(...)
                            fn_893 = function(...)
      return game:HttpGet(gs_c264_3 .. (gs_c264_4 .. ("/servers/Public?sortOrder=Asc&limit=100&cursor=" .. gs_c264_6)))
    end
    gs_c264_1 = game:GetService("HttpService")
    gs_c264_2 = game:GetService("TeleportService")
    gs_c264_3 = "https://games.roblox.com/v1/games/"
    gs_c264_4 = game.PlaceId
    gs_c264_5 = ({{}})[1]
    gs_c264_6 = ""
    gs_c264_7 = false
    ::L72153::
    gs_264_1_1 = pcall(fn_893)
    gs_264_1_2 = ({pcall(fn_893)})[2]
    local tmp476 = gs_264_1_1
    if gs_264_1_1 then
      tmp476 = gs_264_1_2
    end
    if not tmp476 then goto L72286 end
    gs_264_2_1 = gs_c264_1:JSONDecode(gs_264_1_2)
    if not gs_264_2_1.data then goto L72284 end
    _iter = {pairs(gs_264_2_1.data)}
    ::L72217::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      local tmp478 = _iter
      goto L72273
    end
    gs_264_3_1 = _loopkey
    gs_264_3_2 = _loopval
    local tmp477 = gs_264_3_2.playing < gs_264_3_2.maxPlayers
    if (gs_264_3_2.playing < gs_264_3_2.maxPlayers) then
      tmp477 = gs_264_3_2.id ~= game.JobId
    end
    if tmp477 then
      gs_c1_7 = true
      gs_c1_2:TeleportToPlaceInstance(gs_c1_4, gs_264_3_2.id)
    else
      goto L72217
    end
    ::L72273::
    local tmp479 = gs_264_1_1.nextPageCursor
    if not (gs_264_1_1.nextPageCursor) then
      tmp479 = ""
    end
    gs_c1_6 = tmp479
    local tmp480 = tmp478
    ::L72284::
    local tmp481 = tmp480
    ::L72286::
    local tmp482 = not gs_c1_6
    if gs_c1_6 then
      tmp482 = gs_c1_7
    end
    if not (tmp482) then
      goto L72153
    end
    return
  end
  fn_265 = function(...)
    fn_892 = function(...)
      if not _G.FarmEliteH then goto L72073 end
      gs_892_1_1 = gs_c1_52.PlayerGui.Main.Quest
      gs_892_1_2 = gs_892_1_1.Container.QuestTitle.Title.Text
      if not gs_892_1_1.Visible then
        gs_892_2_1 = gs_c1_53.Remotes.CommF_:InvokeServer("EliteHunter")
        local tmp456 = gs_892_2_1 == nil
        if not (gs_892_2_1 == nil) then
          tmp456 = string.find(gs_892_2_1, "Cooldown")
        end
        if tmp456 then
          gs_c1_110()
          return
        end
        task.wait(1)
        goto L72071
      end
      gs_892_4_1 = ({})[1]
      _iter = {pairs({"Diablo", "Urban", "Deandre"})}
      ::L71739::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        local tmp457 = _iter
        goto L71771
      end
      gs_892_4_1 = _loopkey
      gs_892_4_2 = _loopval
      if (string.find(gs_c892_2, gs_892_4_2)) then
        gs_892_1_1 = gs_892_4_2
      else
        goto L71739
      end
      ::L71771::
      if not gs_892_1_1 then goto L72035 end
      gs_892_7_1 = ({})[1]
      _iter = tmp457
      h71805_0_2 = j71771_0_2
      _iter = {pairs(gs_root_53:GetChildren())}
      ::L71805::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        local tmp459 = _iter
        goto L71848
      end
      gs_892_7_1 = _loopkey
      gs_892_7_2 = _loopval
      local tmp458 = gs_892_7_2.Name == gs_c892_1
      if (gs_892_7_2.Name == gs_c892_1) then
        tmp458 = gs_892_7_2:FindFirstChild("HumanoidRootPart")
      end
      if tmp458 then
        gs_892_1_1 = gs_892_7_2
      else
        goto L71805
      end
      ::L71848::
      _iter = _iter
      h71874_0_2 = h71805_0_2
      _iter = tmp459
      h71874_1_2 = j71848_1_2
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L71874::
      _k3 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k3[1]
      if not (_k3[1] == nil) then
        local tmp461 = _iter
        goto L71913
      end
      gs_892_1_1 = _loopkey
      gs_892_1_2 = _loopval
      local tmp460 = gs_892_1_2.Name == gs_265_1_1
      if (gs_892_1_2.Name == gs_265_1_1) then
        tmp460 = gs_deepm2_13.Alive(gs_892_1_2)
      end
      if tmp460 then
        gs_c892_1 = gs_892_1_2
      else
        goto L71874
      end
      ::L71913::
      local tmp462 = gs_c892_1
      if gs_c892_1 then
        tmp462 = gs_c892_1:FindFirstChild("HumanoidRootPart")
      end
      if not tmp462 then goto L72015 end
      _tp(gs_c892_1.HumanoidRootPart.CFrame * (CFrame.new(0, 30, 0)))
      _iter = _iter
      h71960_0_2 = h71874_0_2
      _iter = _iter
      h71960_1_2 = h71874_1_2
      _iter = tmp461
      h71960_2_2 = j71913_2_2
      ::L71960::
      wait()
      gs_deepm2_13.Kill(gs_c892_1, _G.FarmEliteH)
      local tmp463 = not _G.FarmEliteH
      if not _G.FarmEliteH then goto L72010 end
      tmp463 = not gs_c892_1.Parent
      if not gs_c892_1.Parent then goto L72010 end
      tmp463 = gs_c892_1.Humanoid.Health <= 0
      if gs_c892_1.Humanoid.Health <= 0 then goto L72010 end
      tmp463 = not gs_c265_1.Visible
      ::L72010::
      if not (tmp463) then
        goto L71960
      end
      local tmp466 = _iter
      local tmp465 = _iter
      local tmp464 = _iter
      goto L72033
      ::L72015::
      task.wait(5)
      gs_deepm2_110()
      tmp466 = _iter
      tmp465 = _iter
      tmp464 = tmp461
      ::L72033::
      local tmp467 = tmp466
      local tmp468 = tmp465
      local tmp469 = tmp464
      goto L72070
      ::L72035::
      gs_root_53.Remotes.CommF_:InvokeServer("AbandonQuest")
      task.wait(1)
      gs_root_110()
      tmp467 = tmp457
      ::L72070::
      local tmp472 = tmp467
      local tmp471 = tmp468
      local tmp470 = tmp469
      ::L72071::
      local tmp473 = tmp472
      local tmp475 = tmp471
      local tmp474 = tmp470
      ::L72073::
      return
    end
    while (task.wait(1)) do
      pcall(fn_892)
    end
    return
  end
  fn_266 = function(...)
    local _,  a1 = ...
    gs_c266_1 = a1
    _G.AutoSaber = gs_c266_1
    return
  end
  fn_267 = function(...)
    fn_891 = function(...)
          local _t1
      local _t2
      local _t3
      local _t4
      local _t5
          local tmp448 = _G.AutoSaber
      if not _G.AutoSaber then goto L70476 end
      tmp448 = gs_c1_52.Data.Level.Value >= 200
      if not (gs_c1_52.Data.Level.Value >= 200) then goto L70476 end
      tmp448 = not (gs_c1_52.Backpack:FindFirstChild("Saber"))
      if not not (gs_c1_52.Backpack:FindFirstChild("Saber")) then goto L70476 end
      tmp448 = not (gs_c1_52.Character:FindFirstChild("Saber"))
      ::L70476::
      if not tmp448 then goto L71571 end
      if not (workspace.Map.Jungle.Final.Part.Transparency == 0) then goto L71366 end
      if (workspace.Map.Jungle.QuestPlates.Door.Transparency == 0) then
        if (((CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 100) then
          _tp(gs_c1_52.Character.HumanoidRootPart.CFrame)
          wait(0.5)
          _t1 = gs_c1_52.Character.HumanoidRootPart
          _t1.CFrame = workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame
          wait(0.5)
          _t2 = gs_c1_52.Character.HumanoidRootPart
          _t2.CFrame = workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame
          wait(0.5)
          _t3 = gs_c1_52.Character.HumanoidRootPart
          _t3.CFrame = workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame
          wait(0.5)
          _t4 = gs_c1_52.Character.HumanoidRootPart
          _t4.CFrame = workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame
          wait(0.5)
          _t5 = gs_c1_52.Character.HumanoidRootPart
          _t5.CFrame = workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame
          wait(0.5)
        else
          _tp(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
        end
        goto L71364
      end
      if (workspace.Map.Desert.Burn.Part.Transparency == 0) then
        local tmp449 = gs_c1_52.Backpack:FindFirstChild("Torch")
        if not (gs_c1_52.Backpack:FindFirstChild("Torch")) then
          tmp449 = gs_c1_52.Character:FindFirstChild("Torch")
        end
        if tmp449 then
          EquipWeapon("Torch")
          firetouchinterest(gs_c1_52.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 0)
          firetouchinterest(gs_c1_52.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 1)
          _tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
        else
          _tp(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
        end
        goto L71363
      end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")) ~= 0) then
        gs_c1_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
        wait(0.5)
        EquipWeapon("Cup")
        wait(0.5)
        gs_c1_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", gs_c1_52.Character.Cup)
        wait(Sec)
        gs_c1_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
        goto L71362
      end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")) == nil) then
        gs_c1_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
        goto L71361
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")) == 0) then goto L71282 end
      local tmp450 = workspace.Enemies:FindFirstChild("Mob Leader")
      if not (workspace.Enemies:FindFirstChild("Mob Leader")) then
        tmp450 = gs_c1_53:FindFirstChild("Mob Leader")
      end
      if not tmp450 then goto L71280 end
      _tp(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L71199::
      _k6 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k6[1]
      if not (_k6[1] == nil) then
        goto L71277
      end
      gs_891_15_1 = _loopkey
      gs_891_15_2 = _loopval
      local tmp451 = gs_891_15_2.Name == "Mob Leader"
      if (gs_891_15_2.Name == "Mob Leader") then
        tmp451 = gs_root_13.Alive(gs_891_15_2)
      end
      if not tmp451 then goto L71274 end
      ::L71230::
      task.wait()
      gs_root_13.Kill(gs_891_15_2, _G.AutoSaber)
      local tmp452 = gs_891_15_2.Humanoid.Health <= 0
      if not (gs_891_15_2.Humanoid.Health <= 0) then
        tmp452 = _G.AutoSaber == false
      end
      if not (tmp452) then
        goto L71230
      end
      ::L71274::
      goto L71199
      ::L71277::
      ::L71280::
      goto L71361
      ::L71282::
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")) == 1) then goto L71361 end
      gs_c1_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
      EquipWeapon("Relic")
      _tp(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
      ::L71361::
      ::L71362::
      ::L71363::
      ::L71364::
      goto L71569
      ::L71366::
      local tmp453 = workspace.Enemies:FindFirstChild("Saber Expert")
      if not (workspace.Enemies:FindFirstChild("Saber Expert")) then
        tmp453 = gs_c1_53:FindFirstChild("Saber Expert")
      end
      if not tmp453 then goto L71538 end
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L71427::
      _k7 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k7[1]
      if not (_k7[1] == nil) then
        goto L71535
      end
      gs_891_21_1 = _loopkey
      gs_891_21_2 = _loopval
      local tmp454 = gs_891_21_2.Name == "Saber Expert"
      if (gs_891_21_2.Name == "Saber Expert") then
        tmp454 = gs_root_13.Alive(gs_891_21_2)
      end
      if not tmp454 then goto L71532 end
      ::L71458::
      task.wait()
      gs_root_13.Kill(gs_891_21_2, _G.AutoSaber)
      local tmp455 = gs_891_21_2.Humanoid.Health <= 0
      if not (gs_891_21_2.Humanoid.Health <= 0) then
        tmp455 = _G.AutoSaber == false
      end
      if not (tmp455) then
        goto L71458
      end
      if (gs_891_21_2.Humanoid.Health <= 0) then
        gs_root_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
      end
      ::L71532::
      goto L71427
      ::L71535::
      goto L71568
      ::L71538::
      _tp(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-08, 0.513301849, -8.55007443e-08, 1, -2.77243419e-08, -0.513301849, -2.00944328e-08, 0.85820812))
      ::L71568::
      ::L71569::
      ::L71571::
      return
    end
    while (wait(0.2)) do
      pcall(fn_891)
    end
    return
  end
  fn_268 = function(...)
    local _,  a1 = ...
    gs_c268_1 = a1
    _G.AutoColShad = gs_c268_1
    return
  end
  fn_269 = function(...)
    fn_890 = function(...)
          gs_c890_1 = GetConnectionEnemies("Cyborg")
      if not gs_c890_1 then goto L70364 end
      ::L70313::
      task.wait()
      gs_c1_13.Kill(gs_c890_1, _G.AutoColShad)
      local tmp447 = _G.AutoColShad == false
      if _G.AutoColShad == false then goto L70359 end
      tmp447 = not gs_c890_1.Parent
      if not gs_c890_1.Parent then goto L70359 end
      tmp447 = gs_c890_1.Humanoid.Health <= 0
      ::L70359::
      if not (tmp447) then
        goto L70313
      end
      goto L70385
      ::L70364::
      _tp(CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813))
      ::L70385::
      return
    end
    while (wait(0.2)) do
      if _G.AutoColShad then
        pcall(fn_890)
      end
    end
    return
  end
  fn_270 = function(...)
    local _,  a1 = ...
    gs_c270_1 = a1
    _G.AutoGetUsoap = gs_c270_1
    return
  end
  fn_271 = function(...)
    fn_889 = function(...)
                      if not _G.AutoGetUsoap then goto L70252 end
      for _key, item in pairs(workspace.Characters:GetChildren()) do
        gs_889_1_1 = _key
        gs_889_1_2 = item
        if not (gs_889_1_2.Name ~= gs_root_52.Name) then goto L70246 end
        local tmp445 = gs_889_1_2.Humanoid.Health > 0
        if not (gs_889_1_2.Humanoid.Health > 0) then goto L70133 end
        tmp445 = gs_889_1_2:FindFirstChild("HumanoidRootPart")
        if not (gs_889_1_2:FindFirstChild("HumanoidRootPart")) then goto L70133 end
        tmp445 = gs_889_1_2.Parent
        if not gs_889_1_2.Parent then goto L70133 end
        tmp445 = (Root.Position - gs_889_1_2.HumanoidRootPart.Position).Magnitude <= 230
        ::L70133::
        if not tmp445 then goto L70244 end
        ::L70136::
        task.wait()
        EquipWeapon(_G.SelectWeapon)
        _tp(gs_889_1_2.HumanoidRootPart.CFrame * (CFrame.new(1, 1, 2)))
        local tmp446 = _G.AutoGetUsoap == false
        if _G.AutoGetUsoap == false then goto L70239 end
        tmp446 = gs_889_1_2.Humanoid.Health <= 0
        if gs_889_1_2.Humanoid.Health <= 0 then goto L70239 end
        tmp446 = not gs_889_1_2.Parent
        if not gs_889_1_2.Parent then goto L70239 end
        tmp446 = not (gs_889_1_2:FindFirstChild("HumanoidRootPart"))
        if not (gs_889_1_2:FindFirstChild("HumanoidRootPart")) then goto L70239 end
        tmp446 = not (gs_889_1_2:FindFirstChild("Humanoid"))
        ::L70239::
        if not (tmp446) then
        goto L70136
        end
        ::L70244::
        ::L70246::
      end
      ::L70252::
      return
    end
    while (task.wait(Sec)) do
      pcall(fn_889)
    end
    return
  end
  fn_272 = function(...)
    local _,  a1 = ...
    gs_c272_1 = a1
    _G.Greybeard = gs_c272_1
    return
  end
  fn_273 = function(...)
    fn_888 = function(...)
          if not (GetWP("Bisento")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
        goto L69995
      end
      if not (GetWP("Bisento")) then goto L69995 end
      gs_c1_53.Remotes.CommF_:InvokeServer("LoadItem", "Bisento")
      gs_888_2_1 = GetConnectionEnemies("Greybeard")
      if not gs_888_2_1 then goto L69972 end
      ::L69923::
      wait()
      gs_c1_13.Kill(gs_888_2_1, _G.Greybeard)
      local tmp444 = _G.Greybeard == false
      if _G.Greybeard == false then goto L69967 end
      tmp444 = not gs_888_2_1.Parent
      if not gs_888_2_1.Parent then goto L69967 end
      tmp444 = gs_888_2_1.Humanoid.Health <= 0
      ::L69967::
      if not (tmp444) then
        goto L69923
      end
      goto L69993
      ::L69972::
      _tp(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))
      ::L69993::
      ::L69995::
      return
    end
    while (wait(Sec)) do
      if _G.Greybeard then
        pcall(fn_888)
      end
    end
    return
  end
  fn_274 = function(...)
    local _,  a1 = ...
    gs_c274_1 = a1
    _G.WardenBoss = gs_c274_1
    return
  end
  fn_275 = function(...)
    fn_887 = function(...)
          gs_c887_1 = GetConnectionEnemies("Chief Warden")
      if not gs_c887_1 then goto L69770 end
      ::L69721::
      wait()
      gs_c1_13.Kill(gs_c887_1, _G.WardenBoss)
      local tmp443 = _G.WardenBoss == false
      if _G.WardenBoss == false then goto L69765 end
      tmp443 = not gs_c887_1.Parent
      if not gs_c887_1.Parent then goto L69765 end
      tmp443 = gs_c887_1.Humanoid.Health <= 0
      ::L69765::
      if not (tmp443) then
        goto L69721
      end
      goto L69800
      ::L69770::
      _tp(CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939))
      ::L69800::
      return
    end
    while (wait(0.1)) do
      if _G.WardenBoss then
        pcall(fn_887)
      end
    end
    return
  end
  fn_276 = function(...)
    local _,  a1 = ...
    gs_c276_1 = a1
    _G.MarinesCoat = gs_c276_1
    return
  end
  fn_277 = function(...)
    fn_886 = function(...)
          gs_c886_1 = GetConnectionEnemies("Vice Admiral")
      if not gs_c886_1 then goto L69639 end
      ::L69590::
      wait()
      gs_c1_13.Kill(gs_c886_1, _G.MarinesCoat)
      local tmp442 = _G.MarinesCoat == false
      if _G.MarinesCoat == false then goto L69634 end
      tmp442 = not gs_c886_1.Parent
      if not gs_c886_1.Parent then goto L69634 end
      tmp442 = gs_c886_1.Humanoid.Health <= 0
      ::L69634::
      if not (tmp442) then
        goto L69590
      end
      goto L69660
      ::L69639::
      _tp(CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375))
      ::L69660::
      return
    end
    while (wait(0.1)) do
      if _G.MarinesCoat then
        pcall(fn_886)
      end
    end
    return
  end
  fn_278 = function(...)
    local _,  a1 = ...
    gs_c278_1 = a1
    _G.SwanCoat = gs_c278_1
    return
  end
  fn_279 = function(...)
    fn_885 = function(...)
          gs_c885_1 = GetConnectionEnemies("Swan")
      if not gs_c885_1 then goto L69499 end
      ::L69450::
      wait()
      gs_c1_13.Kill(gs_c885_1, _G.SwanCoat)
      local tmp441 = _G.SwanCoat == false
      if _G.SwanCoat == false then goto L69494 end
      tmp441 = not gs_c885_1.Parent
      if not gs_c885_1.Parent then goto L69494 end
      tmp441 = gs_c885_1.Humanoid.Health <= 0
      ::L69494::
      if not (tmp441) then
        goto L69450
      end
      goto L69529
      ::L69499::
      _tp(CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812))
      ::L69529::
      return
    end
    while (wait(0.1)) do
      if _G.SwanCoat then
        pcall(fn_885)
      end
    end
    return
  end
  fn_280 = function(...)
    local _,  a1 = ...
    gs_c280_1 = a1
    _G.IceBossRen = gs_c280_1
    return
  end
  fn_281 = function(...)
    fn_884 = function(...)
          ::L69277::
      if not (wait(0.1)) then goto L69389 end
      if not _G.IceBossRen then goto L69387 end
      gs_884_2_1 = GetConnectionEnemies("Awakened Ice Admiral")
      if not gs_884_2_1 then goto L69364 end
      ::L69313::
      task.wait()
      gs_c1_13.Kill(gs_884_2_1, _G.IceBossRen)
      local tmp440 = _G.IceBossRen == false
      if _G.IceBossRen == false then goto L69359 end
      tmp440 = not gs_884_2_1.Parent
      if not gs_884_2_1.Parent then goto L69359 end
      tmp440 = gs_884_2_1.Humanoid.Health <= 0
      ::L69359::
      if not (tmp440) then
        goto L69313
      end
      goto L69385
      ::L69364::
      _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
      ::L69385::
      ::L69387::
      goto L69277
      ::L69389::
      return
    end
    pcall(fn_884)
    return
  end
  fn_282 = function(...)
    local _,  a1 = ...
    gs_c282_1 = a1
    _G.KeysRen = gs_c282_1
    return
  end
  fn_283 = function(...)
    fn_883 = function(...)
              if not _G.KeysRen then goto L69256 end
      local tmp438 = gs_c1_52.Backpack:FindFirstChild(gs_c1_2[3])
      if not (gs_c1_52.Backpack:FindFirstChild(gs_c1_2[3])) then
        tmp438 = gs_c1_52.Character:FindFirstChild(gs_c1_2[3])
      end
      if tmp438 then
        EquipWeapon(gs_c1_2[3])
        wait(0.1)
        _tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
        goto L69254
      end
      gs_883_3_1 = GetConnectionEnemies(gs_c1_2)
      if not gs_883_3_1 then goto L69232 end
      ::L69161::
      task.wait()
      gs_c1_13.Kill(gs_883_3_1, _G.KeysRen)
      local tmp439 = gs_c1_52.Backpack:FindFirstChild(gs_c1_2[3])
      if gs_c1_52.Backpack:FindFirstChild(gs_c1_2[3]) then goto L69227 end
      tmp439 = _G.KeysRen == false
      if _G.KeysRen == false then goto L69227 end
      tmp439 = not gs_883_3_1.Parent
      if not gs_883_3_1.Parent then goto L69227 end
      tmp439 = gs_883_3_1.Humanoid.Health <= 0
      ::L69227::
      if not (tmp439) then
        goto L69161
      end
      goto L69253
      ::L69232::
      _tp(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
      ::L69253::
      ::L69254::
      ::L69256::
      return
    end
    while (wait(0.1)) do
      pcall(fn_883)
    end
    return
  end
  fn_284 = function(...)
    local _,  a1 = ...
    gs_c284_1 = a1
    _G.AutoTridentW2 = gs_c284_1
    return
  end
  fn_285 = function(...)
    fn_882 = function(...)
          if not _G.AutoTridentW2 then goto L69022 end
      gs_882_1_1 = GetConnectionEnemies("Tide Keeper")
      if not gs_882_1_1 then goto L68999 end
      ::L68948::
      task.wait()
      gs_c1_13.Kill(gs_882_1_1, _G.AutoTridentW2)
      local tmp437 = _G.AutoTridentW2 == false
      if _G.AutoTridentW2 == false then goto L68994 end
      tmp437 = not gs_882_1_1.Parent
      if not gs_882_1_1.Parent then goto L68994 end
      tmp437 = gs_882_1_1.Humanoid.Health <= 0
      ::L68994::
      if not (tmp437) then
        goto L68948
      end
      goto L69020
      ::L68999::
      _tp(CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188))
      ::L69020::
      ::L69022::
      return
    end
    while (wait(0.1)) do
      pcall(fn_882)
    end
    return
  end
  fn_286 = function(...)
    local _,  a1 = ...
    gs_c286_1 = a1
    _G.LongsWord = gs_c286_1
    return
  end
  fn_287 = function(...)
    fn_881 = function(...)
          if not _G.LongsWord then goto L68889 end
      gs_881_1_1 = GetConnectionEnemies("Diamond")
      if not gs_881_1_1 then goto L68866 end
      ::L68815::
      task.wait()
      gs_c1_13.Kill(gs_881_1_1, _G.LongsWord)
      local tmp436 = _G.LongsWord == false
      if _G.LongsWord == false then goto L68861 end
      tmp436 = not gs_881_1_1.Parent
      if not gs_881_1_1.Parent then goto L68861 end
      tmp436 = gs_881_1_1.Humanoid.Health <= 0
      ::L68861::
      if not (tmp436) then
        goto L68815
      end
      goto L68887
      ::L68866::
      _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
      ::L68887::
      ::L68889::
      return
    end
    while (wait(0.1)) do
      pcall(fn_881)
    end
    return
  end
  fn_288 = function(...)
    local _,  a1 = ...
    gs_c288_1 = a1
    _G.BlackSpikey = gs_c288_1
    return
  end
  fn_289 = function(...)
    fn_880 = function(...)
          gs_c880_1 = GetConnectionEnemies("Jeremy")
      if not gs_c880_1 then goto L68735 end
      ::L68686::
      wait()
      gs_c1_13.Kill(gs_c880_1, _G.BlackSpikey)
      local tmp435 = _G.BlackSpikey == false
      if _G.BlackSpikey == false then goto L68730 end
      tmp435 = not gs_c880_1.Parent
      if not gs_c880_1.Parent then goto L68730 end
      tmp435 = gs_c880_1.Humanoid.Health <= 0
      ::L68730::
      if not (tmp435) then
        goto L68686
      end
      goto L68756
      ::L68735::
      _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
      ::L68756::
      return
    end
    while (wait(0.1)) do
      if _G.BlackSpikey then
        pcall(fn_880)
      end
    end
    return
  end
  fn_290 = function(...)
    local _,  a1 = ...
    gs_c290_1 = a1
    _G.DarkBladev3 = gs_c290_1
    return
  end
  fn_291 = function(...)
    fn_879 = function(...)
                          local tmp430 = _G.DarkBladev3
      if _G.DarkBladev3 then
        tmp430 = World2
      end
      if not tmp430 then goto L68625 end
      if not (GetBP("Dark Blade")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("LoadItem", "Dark Blade")
      end
      if not ((GetBP("Fist of Darkness")) > 1) then goto L68616 end
      if not (workspace.Enemies:FindFirstChild("Darkbeard")) then
        _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
        goto L68614
      end
      local tmp431 = GetConnectionEnemies("Darkbeard")
      if (GetConnectionEnemies("Darkbeard")) then
        tmp431 = (GetBP("Fist of Darkness")) >= 1
      end
      if not tmp431 then goto L68614 end
      ::L68534::
      wait()
      _tp(CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375))
      local tmp432 = not _G.DarkBladev3
      if _G.DarkBladev3 then
        tmp432 = Root.Position == (CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375)).Position
      end
      if not (tmp432) then
        goto L68534
      end
      fireclickdetector(workspace.Map.GraveIsland.Mountain.Rocks.Button.ClickDetector)
      ::L68614::
      goto L68623
      ::L68616::
      _G.AutoFarmChest = true
      local tmp433 = _G
      ::L68623::
      local tmp434 = tmp433
      ::L68625::
      return
    end
    while (wait(Sec)) do
      pcall(fn_879)
    end
    return
  end
  fn_292 = function(...)
    local _,  a1 = ...
    gs_c292_1 = a1
    _G.AutoEcBoss = gs_c292_1
    return
  end
  fn_293 = function(...)
    fn_878 = function(...)
          if not _G.AutoEcBoss then goto L68375 end
      if ((GetM("Ectoplasm")) >= 99) then
        gs_c1_53.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
        goto L68373
      end
      if not ((GetM("Ectoplasm")) <= 99) then goto L68373 end
      gs_878_3_1 = GetConnectionEnemies("Cursed Captain")
      if not gs_878_3_1 then goto L68313 end
      ::L68265::
      wait()
      gs_c1_13.Kill(gs_878_3_1, _G.AutoEcBoss)
      local tmp429 = not _G.AutoEcBoss
      if not _G.AutoEcBoss then goto L68308 end
      tmp429 = not gs_878_3_1.Parent
      if not gs_878_3_1.Parent then goto L68308 end
      tmp429 = gs_878_3_1.Humanoid.Health <= 0
      ::L68308::
      if not (tmp429) then
        goto L68265
      end
      goto L68371
      ::L68313::
      gs_c1_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      wait(0.5)
      _tp(CFrame.new(916.928589, 181.092773, 33422))
      ::L68371::
      ::L68373::
      ::L68375::
      return
    end
    while (wait(Sec)) do
      pcall(fn_878)
    end
    return
  end
  fn_294 = function(...)
    local _,  a1 = ...
    gs_c294_1 = a1
    _G.Auto_Def_DarkCoat = gs_c294_1
    return
  end
  fn_295 = function(...)
    fn_877 = function(...)
                              local tmp425 = GetBP("Fist of Darkness")
      if (GetBP("Fist of Darkness")) then
        tmp425 = not (workspace.Enemies:FindFirstChild("Darkbeard"))
      end
      if tmp425 then
        _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
        goto L68158
      end
      if not (GetConnectionEnemies("Darkbeard")) then goto L68082 end
      gs_877_2_1 = GetConnectionEnemies("Darkbeard")
      if not gs_877_2_1 then goto L68080 end
      ::L68031::
      wait()
      gs_c1_13.Kill(gs_877_2_1, _G.Auto_Def_DarkCoat)
      local tmp426 = _G.Auto_Def_DarkCoat == false
      if _G.Auto_Def_DarkCoat == false then goto L68075 end
      tmp426 = not gs_877_2_1.Parent
      if not gs_877_2_1.Parent then goto L68075 end
      tmp426 = gs_877_2_1.Humanoid.Helath <= 0
      ::L68075::
      if not (tmp426) then
        goto L68031
      end
      ::L68080::
      goto L68158
      ::L68082::
      local tmp427 = not (GetBP("Fist of Darkness"))
      if not (GetBP("Fist of Darkness")) then
        tmp427 = not (GetConnectionEnemies("Darkbeard"))
      end
      if not tmp427 then goto L68158 end
      ::L68107::
      wait(0.1)
      _G.AutoFarmChest = true
      if not _G.Auto_Def_DarkCoat then goto L68148 end
      if GetBP("Fist of Darkness") then goto L68148 end
      ::L68148::
      if not (j68148_0_2) then
        goto L68107
      end
      _G.AutoFarmChest = false
      local tmp428 = _G
      ::L68158::
      return
    end
    while (wait(0.1)) do
      if _G.Auto_Def_DarkCoat then
        pcall(fn_877)
      end
    end
    return
  end
  fn_296 = function(...)
    local _,  a1 = ...
    gs_c296_1 = a1
    _G.Auto_DonAcces = gs_c296_1
    return
  end
  fn_297 = function(...)
    fn_876 = function(...)
          local tmp422 = (gs_c1_53.Remotes.CommF_:InvokeServer("GetUnlockables")).FlamingoAccess == nil
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("GetUnlockables")).FlamingoAccess == nil) then
        tmp422 = gs_c1_52.Data.Level.Value >= 1500
      end
      if not tmp422 then goto L67906 end
      FruitPrice = {}
      FruitStore = {}
      _iter = {next, (gs_c1_53:WaitForChild("Remotes")).CommF_.InvokeServer((gs_c1_53:WaitForChild("Remotes")).CommF_, "GetFruits")}
      ::L67533::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L67570
      end
      gs_876_1_1 = _loopkey
      gs_876_1_2 = _loopval
      if (gs_876_1_2.Price >= 1000000) then
        table.insert(FruitPrice, gs_876_1_2.Name)
      end
      goto L67533
      ::L67570::
      _iter = {pairs(gs_c297_53.Remotes.CommF_:InvokeServer("getInventoryFruits"))}
      ::L67598::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L67903
      end
      gs_876_2_1 = _loopkey
      gs_876_2_2 = _loopval
      _iter = {pairs(gs_876_2_2)}
      ::L67619::
      _k3 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k3[1]
      if not (_k3[1] == nil) then
        goto L67652
      end
      gs_876_2_1 = _loopkey
      gs_876_2_2 = _loopval
      if (gs_876_2_1 == "Name") then
        table.insert(FruitStore, gs_876_2_2)
      end
      goto L67619
      ::L67652::
      gs_c297_53.Remotes.CommF_:InvokeServer("Cousin", "Buy")
      _iter = {pairs(FruitPrice)}
      ::L67683::
      _k4 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k4[1]
      if not (_k4[1] == nil) then
        goto L67863
      end
      gs_876_5_1 = _loopkey
      gs_876_5_2 = _loopval
      _iter = {pairs(FruitStore)}
      ::L67705::
      _k5 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k5[1]
      if not (_k5[1] == nil) then
        goto L67859
      end
      gs_876_5_1 = _loopkey
      gs_876_5_2 = _loopval
      local tmp423 = gs_876_2_2 == gs_876_5_2
      if (gs_876_2_2 == gs_876_5_2) then
        tmp423 = (gs_root_53.Remotes.CommF_:InvokeServer("GetUnlockables")).FlamingoAccess == nil
      end
      if tmp423 then
        _G.StoreF = false
        if not (gs_root_52.Backpack:FindFirstChild(FruitStore)) then
          gs_root_53.Remotes.CommF_:InvokeServer("LoadFruit", tostring(gs_876_2_2))
        else
          gs_root_53.Remotes.CommF_:InvokeServer("TalkTrevor", "1")
          gs_root_53.Remotes.CommF_:InvokeServer("TalkTrevor", "2")
          gs_root_53.Remotes.CommF_:InvokeServer("TalkTrevor", "3")
        end
      end
      goto L67705
      ::L67859::
      goto L67683
      ::L67863::
      if ((gs_297_1_53.Remotes.CommF_.InvokeServer(gs_297_1_53.Remotes.CommF_, "GetUnlockables")).FlamingoAccess ~= nil) then
        _G.StoreF = true
        _G.Auto_DonAcces = false
        local tmp424 = _G
      end
      goto L67598
      ::L67903::
      ::L67906::
      return
    end
    while (wait(0.1)) do
      if _G.Auto_DonAcces then
        pcall(fn_876)
      end
    end
    return
  end
  fn_298 = function(...)
    local _,  a1 = ...
    gs_c298_1 = a1
    _G.Auto_SwanGG = gs_c298_1
    return
  end
  fn_299 = function(...)
    fn_875 = function(...)
          gs_c875_1 = GetConnectionEnemies("Don Swan")
      if not gs_c875_1 then goto L67394 end
      ::L67345::
      wait()
      gs_c1_13.Kill(gs_c875_1, _G.Auto_SwanGG)
      local tmp421 = _G.Auto_SwanGG == false
      if _G.Auto_SwanGG == false then goto L67389 end
      tmp421 = not gs_c875_1.Parent
      if not gs_c875_1.Parent then goto L67389 end
      tmp421 = gs_c875_1.Humanoid.Health <= 0
      ::L67389::
      if not (tmp421) then
        goto L67345
      end
      goto L67415
      ::L67394::
      _tp(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
      ::L67415::
      return
    end
    while (wait(0.2)) do
      if _G.Auto_SwanGG then
        pcall(fn_875)
      end
    end
    return
  end
  fn_300 = function(...)
    local _,  a1 = ...
    gs_c300_1 = a1
    _G.AutoBigmom = gs_c300_1
    return
  end
  fn_301 = function(...)
    fn_874 = function(...)
          gs_c874_1 = GetConnectionEnemies("Cake Queen")
      if not gs_c874_1 then goto L67263 end
      ::L67213::
      task.wait()
      gs_c1_13.Kill(gs_c874_1, _G.AutoBigmom)
      local tmp420 = not _G.AutoBigmom
      if not _G.AutoBigmom then goto L67258 end
      tmp420 = not gs_c874_1.Parent
      if not gs_c874_1.Parent then goto L67258 end
      tmp420 = gs_c874_1.Humanoid.Health <= 0
      ::L67258::
      if not (tmp420) then
        goto L67213
      end
      goto L67284
      ::L67263::
      _tp(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
      ::L67284::
      return
    end
    while (wait(Sec)) do
      if _G.AutoBigmom then
        pcall(fn_874)
      end
    end
    return
  end
  fn_302 = function(...)
    local _,  a1 = ...
    gs_c302_1 = a1
    _G.Auto_Cavender = gs_c302_1
    return
  end
  fn_303 = function(...)
    fn_873 = function(...)
          if not _G.Auto_Cavender then goto L67151 end
      gs_873_1_1 = GetConnectionEnemies("Beautiful Pirate")
      if not gs_873_1_1 then goto L67128 end
      ::L67087::
      wait()
      gs_c1_13.Kill(gs_873_1_1, _G.Auto_Cavender)
      local tmp419 = not _G.Auto_Cavender
      if _G.Auto_Cavender then
        tmp419 = gs_873_1_1.Humanoid.Health <= 0
      end
      if not (tmp419) then
        goto L67087
      end
      goto L67149
      ::L67128::
      _tp(CFrame.new(5283.609375, 22.56223487854, -110.78285217285))
      ::L67149::
      ::L67151::
      return
    end
    while (wait(Sec)) do
      pcall(fn_873)
    end
    return
  end
  fn_304 = function(...)
    local _,  a1 = ...
    gs_c304_1 = a1
    _G.TwinHook = gs_c304_1
    return
  end
  fn_305 = function(...)
    fn_872 = function(...)
          if not _G.TwinHook then goto L67027 end
      gs_872_1_1 = GetConnectionEnemies("Captain Elephant")
      if not gs_872_1_1 then goto L66967 end
      ::L66926::
      wait()
      gs_c1_13.Kill(gs_872_1_1, _G.TwinHook)
      local tmp418 = not _G.TwinHook
      if _G.TwinHook then
        tmp418 = gs_872_1_1.Humanoid.Health <= 0
      end
      if not (tmp418) then
        goto L66926
      end
      goto L67025
      ::L66967::
      gs_c1_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
      wait(0.2)
      _tp(CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125))
      ::L67025::
      ::L67027::
      return
    end
    while (wait(Sec)) do
      pcall(fn_872)
    end
    return
  end
  fn_306 = function(...)
    local _,  a1 = ...
    gs_c306_1 = a1
    _G.AutoSerpentBow = gs_c306_1
    return
  end
  fn_307 = function(...)
      ::L66756::
    if not (wait(Sec)) then goto L66866 end
    if not _G.AutoSerpentBow then goto L66864 end
    gs_307_2_1 = GetConnectionEnemies("Hydra Leader")
    if not gs_307_2_1 then goto L66841 end
    ::L66793::
    wait()
    gs_c1_13.Kill(gs_307_2_1, _G.AutoSerpentBow)
    local tmp417 = not _G.AutoSerpentBow
    if not _G.AutoSerpentBow then goto L66836 end
    tmp417 = not gs_307_2_1.Parent
    if not gs_307_2_1.Parent then goto L66836 end
    tmp417 = gs_307_2_1.Humanoid.Health <= 0
    ::L66836::
    if not (tmp417) then
      goto L66793
    end
    goto L66862
    ::L66841::
    _tp(CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547))
    ::L66862::
    ::L66864::
    goto L66756
    ::L66866::
    return
  end
  fn_308 = function(...)
    local _,  a1 = ...
    gs_c308_1 = a1
    _G.AutoKilo = gs_c308_1
    return
  end
  fn_309 = function(...)
    fn_871 = function(...)
          gs_c871_1 = GetConnectionEnemies("Kilo Admiral")
      if not gs_c871_1 then goto L66724 end
      ::L66674::
      task.wait()
      gs_c1_13.Kill(gs_c871_1, _G.AutoKilo)
      local tmp416 = not _G.AutoKilo
      if not _G.AutoKilo then goto L66719 end
      tmp416 = not gs_c871_1.Parent
      if not gs_c871_1.Parent then goto L66719 end
      tmp416 = gs_c871_1.Humanoid.Health <= 0
      ::L66719::
      if not (tmp416) then
        goto L66674
      end
      goto L66745
      ::L66724::
      _tp(CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125))
      ::L66745::
      return
    end
    while (wait(0.2)) do
      if _G.AutoKilo then
        pcall(fn_871)
      end
    end
    return
  end
  fn_310 = function(...)
    local _,  a1 = ...
    gs_c310_1 = a1
    _G.Tp_MasterA = gs_c310_1
    return
  end
  fn_311 = function(...)
    fn_870 = function(...)
              for _key, item in pairs(gs_c1_53.NPCs:GetChildren()) do
                gs_c870_1 = _key
                gs_c870_2 = item
                if (gs_c870_2.Name == "Barista Cousin") then
                _tp(gs_c870_2.HumanoidRootPart.CFrame)
                end
              end
      return
    end
    while (wait()) do
      if _G.Tp_MasterA then
        pcall(fn_870)
      end
    end
    return
  end
  fn_312 = function(...)
    gs_c1_53.Remotes.CommF_:InvokeServer("ColorsDealer", "2")
    return
  end
  fn_313 = function(...)
    local _,  a1 = ...
    gs_c313_1 = a1
    _G.Auto_Rainbow_Haki = gs_c313_1
    return
  end
  fn_314 = function(...)
    fn_869 = function(...)
                                              ::L65401::
      if not (wait(Sec)) then goto L66491 end
      if not _G.Auto_Rainbow_Haki then goto L66489 end
      if not (gs_c1_52.PlayerGui.Main.Quest.Visible == false) then goto L65560 end
      if _G.GetQFast then
        if (gs_c1_52.PlayerGui.Main.Quest.Visible == false) then
          gs_c1_53.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
        end
        goto L65558
      end
      Rainbow1 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
      if (gs_c1_52.Character.HumanoidRootPart.CFrame ~= Rainbow1) then
        _tp(Rainbow1)
        goto L65557
      end
      if not (gs_c1_52.Character.HumanoidRootPart.CFrame == Rainbow1) then goto L65557 end
      wait(1)
      gs_c1_53.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
      ::L65557::
      ::L65558::
      goto L66487
      ::L65560::
      local tmp406 = gs_c1_52.PlayerGui.Main.Quest.Visible == true
      if (gs_c1_52.PlayerGui.Main.Quest.Visible == true) then
        tmp406 = string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone")
      end
      if not tmp406 then goto L65716 end
      gs_869_9_1 = GetConnectionEnemies("Stone")
      if not gs_869_9_1 then goto L65684 end
      ::L65621::
      wait()
      gs_c1_13.Kill(gs_869_9_1, _G.Auto_Rainbow_Haki)
      local tmp407 = _G.Auto_Rainbow_Haki == false
      if _G.Auto_Rainbow_Haki == false then goto L65679 end
      tmp407 = gs_869_9_1.Humanoid.Health <= 0
      if gs_869_9_1.Humanoid.Health <= 0 then goto L65679 end
      tmp407 = not gs_869_9_1.Parent
      if not gs_869_9_1.Parent then goto L65679 end
      tmp407 = gs_c1_52.PlayerGui.Main.Quest.Visible == false
      ::L65679::
      if not (tmp407) then
        goto L65621
      end
      goto L65714
      ::L65684::
      _tp(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
      ::L65714::
      goto L66487
      ::L65716::
      local tmp408 = gs_c1_52.PlayerGui.Main.Quest.Visible == true
      if (gs_c1_52.PlayerGui.Main.Quest.Visible == true) then
        tmp408 = string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader")
      end
      if not tmp408 then goto L65935 end
      gs_869_13_1 = GetConnectionEnemies("Hydra Leader")
      if not gs_869_13_1 then goto L65842 end
      ::L65777::
      task.wait()
      gs_c1_13.Kill(gs_869_13_1, _G.Auto_Rainbow_Haki)
      local tmp409 = _G.Auto_Rainbow_Haki == false
      if _G.Auto_Rainbow_Haki == false then goto L65837 end
      tmp409 = gs_869_13_1.Humanoid.Health <= 0
      if gs_869_13_1.Humanoid.Health <= 0 then goto L65837 end
      tmp409 = not gs_869_13_1.Parent
      if not gs_869_13_1.Parent then goto L65837 end
      tmp409 = gs_c1_52.PlayerGui.Main.Quest.Visible == false
      ::L65837::
      if not (tmp409) then
        goto L65777
      end
      goto L65933
      ::L65842::
      gs_c1_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
      gs_869_16_1 = Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625)
      gs_869_16_2 = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
      if (gs_c1_52.Character.HumanoidRootPart.CFrame.Position == gs_869_16_1) then
        _tp(gs_869_16_2)
      end
      ::L65933::
      goto L66487
      ::L65935::
      local tmp410 = gs_c1_52.PlayerGui.Main.Quest.Visible == true
      if (gs_c1_52.PlayerGui.Main.Quest.Visible == true) then
        tmp410 = string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral")
      end
      if not tmp410 then goto L66093 end
      gs_869_18_1 = GetConnectionEnemies("Kilo Admiral")
      if not gs_869_18_1 then goto L66061 end
      ::L65996::
      task.wait()
      gs_c1_13.Kill(gs_869_18_1, _G.Auto_Rainbow_Haki)
      local tmp411 = _G.Auto_Rainbow_Haki == false
      if _G.Auto_Rainbow_Haki == false then goto L66056 end
      tmp411 = gs_869_18_1.Humanoid.Health <= 0
      if gs_869_18_1.Humanoid.Health <= 0 then goto L66056 end
      tmp411 = not gs_869_18_1.Parent
      if not gs_869_18_1.Parent then goto L66056 end
      tmp411 = gs_c1_52.PlayerGui.Main.Quest.Visible == false
      ::L66056::
      if not (tmp411) then
        goto L65996
      end
      goto L66091
      ::L66061::
      _tp(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, 0, -0.143904909, 0, 1.00000012, 0, 0.143904924, 0, -0.989591479))
      ::L66091::
      goto L66487
      ::L66093::
      local tmp412 = gs_c1_52.PlayerGui.Main.Quest.Visible == true
      if (gs_c1_52.PlayerGui.Main.Quest.Visible == true) then
        tmp412 = string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")
      end
      if not tmp412 then goto L66328 end
      gs_869_22_1 = GetConnectionEnemies("Captain Elephant")
      if not gs_869_22_1 then goto L66219 end
      ::L66154::
      task.wait()
      gs_c1_13.Kill(gs_869_22_1, _G.Auto_Rainbow_Haki)
      local tmp413 = _G.Auto_Rainbow_Haki == false
      if _G.Auto_Rainbow_Haki == false then goto L66214 end
      tmp413 = gs_869_22_1.Humanoid.Health <= 0
      if gs_869_22_1.Humanoid.Health <= 0 then goto L66214 end
      tmp413 = not gs_869_22_1.Parent
      if not gs_869_22_1.Parent then goto L66214 end
      tmp413 = gs_c1_52.PlayerGui.Main.Quest.Visible == false
      ::L66214::
      if not (tmp413) then
        goto L66154
      end
      goto L66326
      ::L66219::
      gs_869_25_1 = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)
      gs_869_25_2 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
      if (gs_c1_52.Character.HumanoidRootPart.CFrame.Position ~= gs_869_25_1) then
        gs_c1_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        goto L66325
      end
      if not (gs_c1_52.Character.HumanoidRootPart.CFrame.Position == gs_869_25_1) then goto L66325 end
      _tp(gs_869_25_2)
      ::L66325::
      ::L66326::
      goto L66487
      ::L66328::
      local tmp414 = gs_c1_52.PlayerGui.Main.Quest.Visible == true
      if (gs_c1_52.PlayerGui.Main.Quest.Visible == true) then
        tmp414 = string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate")
      end
      if not tmp414 then goto L66487 end
      gs_869_28_1 = GetConnectionEnemies("Captain Elephant")
      if not gs_869_28_1 then goto L66454 end
      ::L66389::
      task.wait()
      gs_c1_13.Kill(gs_869_28_1, _G.Auto_Rainbow_Haki)
      local tmp415 = _G.Auto_Rainbow_Haki == false
      if _G.Auto_Rainbow_Haki == false then goto L66449 end
      tmp415 = gs_869_28_1.Humanoid.Health <= 0
      if gs_869_28_1.Humanoid.Health <= 0 then goto L66449 end
      tmp415 = not gs_869_28_1.Parent
      if not gs_869_28_1.Parent then goto L66449 end
      tmp415 = gs_c1_52.PlayerGui.Main.Quest.Visible == false
      ::L66449::
      if not (tmp415) then
        goto L66389
      end
      goto L66485
      ::L66454::
      gs_c1_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
      ::L66485::
      ::L66487::
      ::L66489::
      goto L65401
      ::L66491::
      return
    end
    pcall(fn_869)
    return
  end
  fn_315 = function(...)
    local _,  a1 = ...
    gs_c315_1 = a1
    _G.GetQFast = gs_c315_1
    return
  end
  fn_316 = function(...)
    local _,  a1 = ...
    gs_c316_1 = a1
    _G.obsFarm = gs_c316_1
    return
  end
  fn_317 = function(...)
    fn_868 = function(...)
      if not _G.obsFarm then goto L65371 end
      gs_c1_53.Remotes.CommE:FireServer("Ken", true)
      if ((gs_c1_52:GetAttribute("KenDodgesLeft")) == 0) then
        KenTest = false
        goto L65369
      end
      if not ((gs_c1_52:GetAttribute("KenDodgesLeft")) > 0) then goto L65369 end
      gs_c1_53.Remotes.CommE:FireServer("Ken", true)
      KenTest = true
      ::L65369::
      ::L65371::
      return
    end
    while (wait(0.2)) do
      pcall(fn_868)
    end
    return
  end
  fn_318 = function(...)
    fn_867 = function(...)
      local _t1
          local _t2
                  local _t3
          local _t4
      if not _G.obsFarm then goto L65255 end
      if not World1 then goto L64885 end
      if not (workspace.Enemies:FindFirstChild("Galley Captain")) then goto L64862 end
      if not KenTest then goto L64796 end
      ::L64730::
      wait()
      _t1 = gs_c1_52.Character.HumanoidRootPart
      _t1.CFrame = (workspace.Enemies:FindFirstChild("Galley Captain")).HumanoidRootPart.CFrame * (CFrame.new(3, 0, 0))
      if not (_G.obsFarm == false) then
      end
      if not (j64791_0_2) then
        goto L64730
      end
      local tmp398 = gs_c1_52.Character.HumanoidRootPart
      goto L64860
      ::L64796::
      ::L64797::
      wait()
      _t2 = gs_c1_52.Character.HumanoidRootPart
      _t2.CFrame = (workspace.Enemies:FindFirstChild("Galley Captain")).HumanoidRootPart.CFrame * (CFrame.new(0, 50, 0))
      if not (_G.obsFarm == false) then
      end
      if not (j64856_0_2) then
        goto L64797
      end
      tmp398 = gs_c1_52.Character.HumanoidRootPart
      ::L64860::
      local tmp399 = tmp398
      goto L64883
      ::L64862::
      _tp(CFrame.new(5533.29785, 88.1079102, 4852.3916))
      ::L64883::
      local tmp404 = tmp399
      goto L65253
      ::L64885::
      if not World2 then goto L65069 end
      if not (workspace.Enemies:FindFirstChild("Lava Pirate")) then goto L65046 end
      if not KenTest then goto L64980 end
      ::L64914::
      wait()
      _t3 = gs_c1_52.Character.HumanoidRootPart
      _t3.CFrame = (workspace.Enemies:FindFirstChild("Lava Pirate")).HumanoidRootPart.CFrame * (CFrame.new(3, 0, 0))
      if not (_G.obsFarm == false) then
      end
      if not (j64975_0_2) then
        goto L64914
      end
      local tmp400 = gs_c1_52.Character.HumanoidRootPart
      goto L65044
      ::L64980::
      ::L64981::
      wait()
      _t4 = gs_c1_52.Character.HumanoidRootPart
      _t4.CFrame = (workspace.Enemies:FindFirstChild("Lava Pirate")).HumanoidRootPart.CFrame * (CFrame.new(0, 50, 0))
      if not (_G.obsFarm == false) then
      end
      if not (j65040_0_2) then
        goto L64981
      end
      tmp400 = gs_c1_52.Character.HumanoidRootPart
      ::L65044::
      local tmp401 = tmp400
      goto L65067
      ::L65046::
      _tp(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
      ::L65067::
      tmp404 = tmp401
      goto L65253
      ::L65069::
      if not World3 then goto L65253 end
      if not (workspace.Enemies:FindFirstChild("Venomous Assailant")) then goto L65230 end
      if not KenTest then goto L65164 end
      ::L65098::
      wait()
      _tp((workspace.Enemies:FindFirstChild("Venomous Assailant")).HumanoidRootPart.CFrame * (CFrame.new(3, 0, 0)))
      local tmp402 = _G.obsFarm == false
      if not (_G.obsFarm == false) then
        tmp402 = KenTest == false
      end
      if not (tmp402) then
        goto L65098
      end
      goto L65228
      ::L65164::
      ::L65165::
      wait()
      _tp((workspace.Enemies:FindFirstChild("Venomous Assailant")).HumanoidRootPart.CFrame * (CFrame.new(0, 50, 0)))
      local tmp403 = _G.obsFarm == false
      if not (_G.obsFarm == false) then
        tmp403 = KenTest
      end
      if not (tmp403) then
        goto L65165
      end
      ::L65228::
      goto L65251
      ::L65230::
      _tp(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
      ::L65251::
      ::L65253::
      local tmp405 = tmp404
      ::L65255::
      return
    end
    while (wait(0.2)) do
      pcall(fn_867)
    end
    return
  end
  fn_319 = function(...)
    local _,  a1 = ...
    gs_c319_1 = a1
    _G.AutoKenVTWO = gs_c319_1
    return
  end
  fn_320 = function(...)
    fn_866 = function(...)
                              local _t2
              local _t4
              local _t6
                      gs_c866_1 = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
      gs_c866_2 = "Kuy"
      gs_c866_3 = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
      gs_c866_4 = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
      gs_c866_5 = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)
      local tmp390 = gs_c1_52.PlayerGui.Main.Quest.Visible == true
      if (gs_c1_52.PlayerGui.Main.Quest.Visible == true) then
        tmp390 = string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates")
      end
      if not tmp390 then goto L63708 end
      gs_866_1_1 = GetConnectionEnemies("Forest Pirate")
      if not gs_866_1_1 then goto L63696 end
      ::L63641::
      wait()
      gs_c1_13.Kill(gs_866_1_1, _G.AutoKenVTWO)
      local tmp391 = not _G.AutoKenVTWO
      if not _G.AutoKenVTWO then goto L63691 end
      tmp391 = gs_866_1_1.Humanoid.Health <= 0
      if gs_866_1_1.Humanoid.Health <= 0 then goto L63691 end
      tmp391 = gs_c1_52.PlayerGui.Main.Quest.Visible == false
      ::L63691::
      if not (tmp391) then
        goto L63641
      end
      goto L63706
      ::L63696::
      _tp(gs_c866_4)
      ::L63706::
      goto L63868
      ::L63708::
      if not (gs_c1_52.PlayerGui.Main.Quest.Visible == true) then goto L63807 end
      gs_866_5_1 = GetConnectionEnemies("Captain Elephant")
      if not gs_866_5_1 then goto L63795 end
      ::L63740::
      wait()
      gs_c1_13.Kill(gs_866_5_1, _G.AutoKenVTWO)
      local tmp392 = not _G.AutoKenVTWO
      if not _G.AutoKenVTWO then goto L63790 end
      tmp392 = gs_866_5_1.Humanoid.Health <= 0
      if gs_866_5_1.Humanoid.Health <= 0 then goto L63790 end
      tmp392 = gs_c1_52.PlayerGui.Main.Quest.Visible == false
      ::L63790::
      if not (tmp392) then
        goto L63740
      end
      goto L63805
      ::L63795::
      _tp(gs_c866_5)
      ::L63805::
      goto L63868
      ::L63807::
      if not (gs_c1_52.PlayerGui.Main.Quest.Visible == false) then goto L63868 end
      gs_c1_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
      wait(0.1)
      gs_c1_53.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
      ::L63868::
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")) == 2) then
        _tp(CFrame.new(-12513.51953125, 340.1137390136719, -9873.048828125))
      end
      local tmp393 = not (gs_c1_52.Backpack:FindFirstChild("Fruit Bowl"))
      if (gs_c1_52.Backpack:FindFirstChild("Fruit Bowl")) then
        tmp393 = not (gs_c1_52.Character:FindFirstChild("Fruit Bowl"))
      end
      if not tmp393 then goto L64660 end
      if not not (GetBP("Fruit Bowl")) then goto L64379 end
      if not not (GetBP("Apple")) then goto L64107 end
      gs_c1_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
      _iter = {pairs(workspace.GetDescendants(workspace))}
      ::L64026::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L64104
      end
      gs_866_13_1 = _loopkey
      gs_866_13_2 = _loopval
      if (gs_866_13_2.Name == "Apple") then
        _t2 = gs_866_13_2.Handle
        _t2.CFrame = gs_root_52.Character.HumanoidRootPart.CFrame * (CFrame.new(0, 1, 10))
        wait()
        firetouchinterest(gs_root_52.Character.HumanoidRootPart, gs_866_13_2.Handle, 0)
        wait()
      end
      goto L64026
      ::L64104::
      goto L64377
      ::L64107::
      if not not (GetBP("Banana")) then goto L64242 end
      _tp(CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125))
      _iter = {pairs(workspace.GetDescendants(workspace))}
      ::L64161::
      _k3 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k3[1]
      if not (_k3[1] == nil) then
        goto L64239
      end
      gs_866_16_1 = _loopkey
      gs_866_16_2 = _loopval
      if (gs_866_16_2.Name == "Banana") then
        _t4 = gs_866_16_2.Handle
        _t4.CFrame = gs_root_52.Character.HumanoidRootPart.CFrame * (CFrame.new(0, 1, 10))
        wait()
        firetouchinterest(gs_root_52.Character.HumanoidRootPart, gs_866_16_2.Handle, 0)
        wait()
      end
      goto L64161
      ::L64239::
      goto L64377
      ::L64242::
      if not not (GetBP("Pineapple")) then goto L64377 end
      _tp(CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625))
      _iter = {pairs(workspace.GetDescendants(workspace))}
      ::L64296::
      _k5 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k5[1]
      if not (_k5[1] == nil) then
        goto L64374
      end
      gs_866_19_1 = _loopkey
      gs_866_19_2 = _loopval
      if (gs_866_19_2.Name == "Pineapple") then
        _t6 = gs_866_19_2.Handle
        _t6.CFrame = gs_root_52.Character.HumanoidRootPart.CFrame * (CFrame.new(0, 1, 10))
        wait()
        firetouchinterest(gs_root_52.Character.HumanoidRootPart, gs_866_19_2.Handle, 0)
        wait()
      end
      goto L64296
      ::L64374::
      ::L64377::
      ::L64379::
      local tmp394 = gs_c1_52.Backpack:FindFirstChild("Banana")
      if not (gs_c1_52.Backpack:FindFirstChild("Banana")) then goto L64432 end
      tmp394 = gs_c1_52.Backpack:FindFirstChild("Apple")
      if not (gs_c1_52.Backpack:FindFirstChild("Apple")) then goto L64432 end
      tmp394 = gs_c1_52.Backpack:FindFirstChild("Pineapple")
      ::L64432::
      local tmp395 = tmp394
      if tmp394 then goto L64482 end
      tmp395 = gs_c1_52:FindFirstChild("Banana")
      if not (gs_c1_52:FindFirstChild("Banana")) then goto L64482 end
      tmp395 = gs_c1_52:FindFirstChild("Apple")
      if not (gs_c1_52:FindFirstChild("Apple")) then goto L64482 end
      tmp395 = gs_c1_52:FindFirstChild("Pineapple")
      ::L64482::
      if not tmp395 then goto L64540 end
      ::L64485::
      wait()
      _tp(gs_c866_1)
      local tmp396 = _G.AutoKenVTWO
      if not (_G.AutoKenVTWO) then
        tmp396 = gs_c1_52.Character.HumanoidRootPart.CFrame == gs_c866_1
      end
      if not (tmp396) then
        goto L64485
      end
      gs_c1_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
      ::L64540::
      local tmp397 = gs_c1_52.Backpack:FindFirstChild("Fruit Bowl")
      if not (gs_c1_52.Backpack:FindFirstChild("Fruit Bowl")) then
        tmp397 = gs_c1_52.Character:FindFirstChild("Fruit Bowl")
      end
      if not tmp397 then goto L64658 end
      if (gs_c1_52.Character.HumanoidRootPart.CFrame ~= gs_c866_3) then
        _tp(gs_c866_3)
        goto L64656
      end
      if not (gs_c1_52.Character.HumanoidRootPart.CFrame == gs_c866_3) then goto L64656 end
      gs_c1_53.Remotes.CommF_:InvokeServer("KenTalk2", "Start")
      wait(0.1)
      gs_c1_53.Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
      ::L64656::
      ::L64658::
      ::L64660::
      return
    end
    while (wait(Sec)) do
      if _G.AutoKenVTWO then
        pcall(fn_866)
      end
    end
    return
  end
  fn_321 = function(...)
    local _,  a1 = ...
    gs_c321_1 = a1
    _G.Bartilo_Quest = gs_c321_1
    return
  end
  fn_322 = function(...)
    fn_865 = function(...)
          local _t1
      local _t2
      local _t3
      local _t4
      local _t5
      local _t6
      local _t7
      local _t8
              local tmp380 = _G.Bartilo_Quest
      if _G.Bartilo_Quest then
        tmp380 = Lv >= 850
      end
      if not tmp380 then goto L63457 end
      gs_865_1_1 = gs_c1_52.PlayerGui.Main.Quest
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")) == 0) then goto L62969 end
      _G.Level = false
      if not (gs_865_1_1.Visible == true) then goto L62823 end
      gs_865_3_1 = GetConnectionEnemies("Swan Pirate")
      if not gs_865_3_1 then goto L62791 end
      gs_865_4_1 = GetConnectionEnemies(gs_c1_5)
      local tmp382 = _G
      if not gs_865_4_1 then goto L62789 end
      _iter = _G
      ::L62663::
      task.wait()
      if not (string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("AbandonQuest")
      else
        gs_c1_13.Kill(gs_865_4_1, _G.Bartilo_Quest)
      end
      local tmp381 = _G.Bartilo_Quest == false
      if _G.Bartilo_Quest == false then goto L62784 end
      tmp381 = not gs_865_4_1.Parent
      if not gs_865_4_1.Parent then goto L62784 end
      tmp381 = gs_865_4_1.Humanoid.Health <= 0
      if gs_865_4_1.Humanoid.Health <= 0 then goto L62784 end
      tmp381 = gs_865_1_1.Visible == false
      if gs_865_1_1.Visible == false then goto L62784 end
      tmp381 = not (gs_865_4_1:FindFirstChild("HumanoidRootPart"))
      ::L62784::
      if not (tmp381) then
        goto L62663
      end
      ::L62789::
      local tmp383 = tmp382
      goto L62821
      ::L62791::
      _tp(CFrame.nee(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468))
      ::L62821::
      local tmp385 = tmp383
      goto L62967
      ::L62823::
      _iter = _G
      ::L62824::
      wait()
      _tp(CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, 0, -0.998706102, 0, 1, 0, 0.998706102, 0, 0.050853312))
      local tmp384 = ((CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, 0, -0.998706102, 0, 1, 0, 0.998706102, 0, 0.050853312)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 20
      if not (((CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, 0, -0.998706102, 0, 1, 0, 0.998706102, 0, 0.050853312)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 20) then
        tmp384 = _G.Bartilo_Quest == false
      end
      if not (tmp384) then
        goto L62824
      end
      if (((CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, 0, -0.998706102, 0, 1, 0, 0.998706102, 0, 0.050853312)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 1) then
        gs_c1_53.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
      end
      ::L62967::
      local tmp388 = tmp385
      goto L63455
      ::L62969::
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")) == 1) then goto L63123 end
      _G.Level = false
      gs_865_13_1 = GetConnectionEnemies("Jeremy")
      if not gs_865_13_1 then goto L63091 end
      _iter = _G
      ::L63015::
      task.wait()
      gs_c1_13.Kill(gs_865_13_1, _G.Bartilo_Quest)
      local tmp386 = _G.Bartilo_Quest == false
      if _G.Bartilo_Quest == false then goto L63086 end
      tmp386 = not gs_865_13_1.Parent
      if not gs_865_13_1.Parent then goto L63086 end
      tmp386 = gs_865_13_1.Humanoid.Health <= 0
      if gs_865_13_1.Humanoid.Health <= 0 then goto L63086 end
      tmp386 = gs_865_1_1.Visible == false
      if gs_865_1_1.Visible == false then goto L63086 end
      tmp386 = not (gs_865_13_1:FindFirstChild("HumanoidRootPart"))
      ::L63086::
      if not (tmp386) then
        goto L63015
      end
      goto L63121
      ::L63091::
      _tp(CFrame.new(2158.97412, 449.056244, 705.411682, -0.754199564, -4.17389057e-09, -0.656645238, -4.47752875e-08, 1, 4.50709301e-08, 0.656645238, 6.3393955e-08, -0.754199564))
      ::L63121::
      goto L63455
      ::L63123::
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")) == 2) then goto L63455 end
      ::L63146::
      wait()
      _tp(CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456))
      local tmp387 = ((CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 1
      if not (((CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 1) then
        tmp387 = _G.Bartilo_Quest == false
      end
      if not (tmp387) then
        goto L63146
      end
      wait(0.5)
      _t1 = gs_c1_52.Character.HumanoidRootPart
      _t1.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate1.CFrame
      wait(0.5)
      _t2 = gs_c1_52.Character.HumanoidRootPart
      _t2.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate2.CFrame
      wait(0.5)
      _t3 = gs_c1_52.Character.HumanoidRootPart
      _t3.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate3.CFrame
      wait(0.5)
      _t4 = gs_c1_52.Character.HumanoidRootPart
      _t4.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate4.CFrame
      wait(0.5)
      _t5 = gs_c1_52.Character.HumanoidRootPart
      _t5.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate5.CFrame
      wait(0.5)
      _t6 = gs_c1_52.Character.HumanoidRootPart
      _t6.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate6.CFrame
      wait(0.5)
      _t7 = gs_c1_52.Character.HumanoidRootPart
      _t7.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate7.CFrame
      wait(0.5)
      _t8 = gs_c1_52.Character.HumanoidRootPart
      _t8.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate8.CFrame
      wait(2.5)
      ::L63455::
      local tmp389 = tmp388
      ::L63457::
      return
    end
    while (wait(0.1)) do
      pcall(fn_865)
    end
    return
  end
  fn_323 = function(...)
    local _,  a1 = ...
    gs_c323_1 = a1
    _G.CitizenQuest = gs_c323_1
    return
  end
  fn_324 = function(...)
    fn_864 = function(...)
                                  if not _G.CitizenQuest then goto L62529 end
      local tmp373 = Lv >= 1800
      if (Lv >= 1800) then
        tmp373 = (gs_c1_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress")).KilledBandits == false
      end
      if not tmp373 then goto L62201 end
      local tmp374 = string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate")
      if not (string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate")) then goto L62013 end
      tmp374 = string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")
      if not (string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")) then goto L62013 end
      tmp374 = gs_c1_52.PlayerGui.Main.Quest.Visible == true
      ::L62013::
      if not tmp374 then goto L62122 end
      gs_864_3_1 = GetConnectionEnemies("Forest Pirate")
      if not gs_864_3_1 then goto L62099 end
      ::L62034::
      task.wait()
      gs_c1_13.Kill(gs_864_3_1, _G.CitizenQuest)
      local tmp375 = _G.CitizenQuest == false
      if _G.CitizenQuest == false then goto L62094 end
      tmp375 = not gs_864_3_1.Parent
      if not gs_864_3_1.Parent then goto L62094 end
      tmp375 = gs_864_3_1.Humanoid.Health <= 0
      if gs_864_3_1.Humanoid.Health <= 0 then goto L62094 end
      tmp375 = gs_c1_52.PlayerGui.Main.Quest.Visible == false
      ::L62094::
      if not (tmp375) then
        goto L62034
      end
      goto L62120
      ::L62099::
      _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
      ::L62120::
      goto L62199
      ::L62122::
      _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
      if (((Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125)) - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 30) then
        wait(1.5)
        gs_c1_53.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
      end
      ::L62199::
      goto L62527
      ::L62201::
      local tmp376 = Lv >= 1800
      if (Lv >= 1800) then
        tmp376 = (gs_c1_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress")).KilledBoss == false
      end
      if not tmp376 then goto L62475 end
      gs_864_9_1 = GetConnectionEnemies("Captain Elephant")
      local tmp377 = gs_c1_52.PlayerGui.Main.Quest.Visible
      if not gs_c1_52.PlayerGui.Main.Quest.Visible then goto L62300 end
      tmp377 = string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")
      if not (string.find(gs_c1_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")) then goto L62300 end
      tmp377 = gs_c1_52.PlayerGui.Main.Quest.Visible == true
      ::L62300::
      if not tmp377 then goto L62395 end
      if not gs_864_9_1 then goto L62372 end
      ::L62307::
      task.wait()
      gs_c1_13.Kill(gs_864_9_1, _G.CitizenQuest)
      local tmp378 = _G.CitizenQuest == false
      if _G.CitizenQuest == false then goto L62367 end
      tmp378 = gs_864_9_1.Humanoid.Health <= 0
      if gs_864_9_1.Humanoid.Health <= 0 then goto L62367 end
      tmp378 = not gs_864_9_1.Parent
      if not gs_864_9_1.Parent then goto L62367 end
      tmp378 = gs_c1_52.PlayerGui.Main.Quest.Visible == false
      ::L62367::
      if not (tmp378) then
        goto L62307
      end
      goto L62393
      ::L62372::
      _tp(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
      ::L62393::
      goto L62473
      ::L62395::
      _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
      if (((CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125)).Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 4) then
        wait(1.5)
        gs_c1_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
      end
      ::L62473::
      goto L62527
      ::L62475::
      local tmp379 = Lv >= 1800
      if (Lv >= 1800) then
        tmp379 = (gs_c1_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")) == 2
      end
      if not tmp379 then goto L62527 end
      _tp(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
      ::L62527::
      ::L62529::
      return
    end
    while (wait(Sec)) do
      pcall(fn_864)
    end
    return
  end
  fn_325 = function(...)
    local _,  a1 = ...
    gs_c325_1 = a1
    _G.DummyMan = gs_c325_1
    return
  end
  fn_326 = function(...)
    fn_863 = function(...)
          if (gs_c1_52.PlayerGui.Main.Quest.Visible == false) then
        gs_863_1_1 = ({{"ArenaTrainer"}})[1]
        gs_c1_53:WaitForChild("Remotes")
        (gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")
        ((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")).InvokeServer((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_"), unpack(gs_863_1_1))
        goto L61870
      end
      gs_863_2_1 = GetConnectionEnemies("Training Dummy")
      if not gs_863_2_1 then goto L61848 end
      ::L61800::
      wait()
      gs_c1_13.Kill(gs_863_2_1, _G.DummyMan)
      local tmp372 = not _G.DummyMan
      if not _G.DummyMan then goto L61843 end
      tmp372 = not gs_863_2_1.Parent
      if not gs_863_2_1.Parent then goto L61843 end
      tmp372 = gs_863_2_1.Humanoid.Health <= 0
      ::L61843::
      if not (tmp372) then
        goto L61800
      end
      goto L61869
      ::L61848::
      _tp(CFrame.new(3688.005126953125, 12.746943473815918, 170.20953369140625))
      ::L61869::
      ::L61870::
      return
    end
    while (wait(Sec)) do
      if _G.DummyMan then
        pcall(fn_863)
      end
    end
    return
  end
  fn_327 = function(...)
    local _,  a1 = ...
    gs_c327_1 = a1
    _G.Auto_SuperHuman = gs_c327_1
    return
  end
  fn_328 = function(...)
    fn_862 = function(...)
          if not _G.Auto_SuperHuman then goto L61667 end
      gs_862_1_1 = gs_c1_52.Data.Beli.Value
      gs_862_1_2 = gs_c1_52.Data.Fragments.Value
      if not (gs_c1_52:FindFirstChild("WeaponAssetCache")) then goto L61665 end
      if not not (GetBP("Superhuman")) then goto L61663 end
      if not (GetBP("Black Leg")) then
        if (gs_862_1_1 >= 150000) then
          gs_c1_53.Remotes.CommF_:InvokeServer("BuyBlackLeg")
        end
        goto L61309
      end
      local tmp363 = GetBP("Black Leg")
      if (GetBP("Black Leg")) then
        tmp363 = (GetBP("Black Leg")).Level.Value < 299
      end
      if tmp363 then
        _G.Level = true
        local tmp365 = _G
        goto L61309
      end
      local tmp364 = GetBP("Black Leg")
      if (GetBP("Black Leg")) then
        tmp364 = (GetBP("Black Leg")).Level.Value >= 300
      end
      if not tmp364 then goto L61309 end
      _G.Level = false
      tmp365 = _G
      ::L61309::
      if not (GetBP("Electro")) then
        local tmp366 = tmp365
        if (gs_862_1_1 >= 500000) then
          gs_c1_53.Remotes.CommF_:InvokeServer("BuyElectro")
        end
        local tmp367 = tmp366
        goto L61420
      end
      if (GetBP("Electro")) then
      end
      if j61374_0_2 then
        _G.Level = true
        tmp367 = tmp365
        goto L61420
      end
      if (GetBP("Electro")) then
      end
      tmp367 = tmp365
      if not j61410_0_2 then goto L61420 end
      _G.Level = false
      tmp367 = tmp365
      ::L61420::
      if not (GetBP("Fishman Karate")) then
        local tmp368 = tmp367
        if (gs_862_1_1 >= 750000) then
          gs_c1_53.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
        end
        local tmp369 = tmp368
        goto L61531
      end
      if (GetBP("Fishman Karate")) then
      end
      if j61485_0_3 then
        _G.Level = true
        tmp369 = tmp367
        goto L61531
      end
      if (GetBP("Fishman Karate")) then
      end
      tmp369 = tmp367
      if not j61521_0_3 then goto L61531 end
      _G.Level = false
      tmp369 = tmp367
      ::L61531::
      if not (GetBP("Dragon Claw")) then
        local tmp370 = tmp369
        if (gs_862_1_2 >= 1500) then
          gs_c1_53.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
        end
        local tmp371 = tmp370
        goto L61644
      end
      if (GetBP("Dragon Claw")) then
      end
      if j61598_0_4 then
        _G.Level = true
        tmp371 = tmp369
        goto L61644
      end
      if (GetBP("Dragon Claw")) then
      end
      tmp371 = tmp369
      if not j61634_0_4 then goto L61644 end
      _G.Level = false
      tmp371 = tmp369
      ::L61644::
      gs_c1_53.Remotes.CommF_:InvokeServer("BuySuperhuman")
      ::L61663::
      ::L61665::
      ::L61667::
      return
    end
    while (wait(Sec)) do
      pcall(fn_862)
    end
    return
  end
  fn_329 = function(...)
    local _,  a1 = ...
    gs_c329_1 = a1
    _G.AutoDeathStep = gs_c329_1
    return
  end
  fn_330 = function(...)
    fn_861 = function(...)
      if not (gs_c1_52:FindFirstChild("WeaponAssetCache")) then goto L61102 end
      if not not (GetBP("Death Step")) then goto L61100 end
      if not (GetBP("Black Leg")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("BuyBlackLeg")
      end
      local tmp353 = GetBP("Black Leg")
      if (GetBP("Black Leg")) then
        tmp353 = (GetBP("Black Leg")).Level.Value >= 400
      end
      if tmp353 then
        gs_c1_53.Remotes.CommF_:InvokeServer("BuyDeathStep")
        _G.Level = false
        local tmp355 = _G
        goto L60814
      end
      local tmp354 = GetBP("Black Leg")
      if (GetBP("Black Leg")) then
        tmp354 = (GetBP("Black Leg")).Level.Value < 399
      end
      if not tmp354 then goto L60814 end
      _G.Level = true
      tmp355 = _G
      ::L60814::
      if not (GetBP("Black Leg")) then
      end
      local tmp360 = tmp355
      if not j60839_0_2 then goto L61098 end
      local tmp359 = tmp355
      if not (workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0) then goto L61096 end
      if not (GetBP("Library Key")) then goto L60970 end
      _iter = tmp355
      ::L60872::
      wait()
      _tp(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))
      local tmp356 = not _G.AutoDeathStep
      if _G.AutoDeathStep then
        tmp356 = Root.Position == (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)).Position
      end
      if not (tmp356) then
        goto L60872
      end
      if (Root.CFrame == (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))) then
        gs_c1_53.Remotes.CommF_:InvokeServer("BuyDeathStep")
      end
      goto L61094
      ::L60970::
      local tmp358 = tmp355
      if not not (GetBP("Library Key")) then goto L61094 end
      gs_861_11_1 = GetConnectionEnemies("Awakened Ice Admiral")
      if not gs_861_11_1 then goto L61071 end
      _iter = tmp355
      ::L61000::
      wait()
      gs_c1_13.Kill(gs_861_11_1, _G.AutoDeathStep)
      local tmp357 = not gs_861_11_1.Parent
      if not gs_861_11_1.Parent then goto L61066 end
      tmp357 = gs_861_11_1.Humanoid.Health <= 0
      if gs_861_11_1.Humanoid.Health <= 0 then goto L61066 end
      tmp357 = _G.AutoDeathStep == false
      if _G.AutoDeathStep == false then goto L61066 end
      tmp357 = GetBP("Library Key")
      if GetBP("Library Key") then goto L61066 end
      tmp357 = GetBP("Death Step")
      ::L61066::
      if not (tmp357) then
        goto L61000
      end
      goto L61092
      ::L61071::
      _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
      ::L61092::
      ::L61094::
      tmp359 = tmp358
      ::L61096::
      tmp360 = tmp359
      ::L61098::
      local tmp361 = tmp360
      ::L61100::
      local tmp362 = tmp361
      ::L61102::
      return
    end
    while (wait(Sec)) do
      if _G.AutoDeathStep then
        pcall(fn_861)
      end
    end
    return
  end
  fn_331 = function(...)
    local _,  a1 = ...
    gs_c331_1 = a1
    _G.Auto_SharkMan_Karate = gs_c331_1
    return
  end
  fn_332 = function(...)
    fn_860 = function(...)
      if not (gs_c1_52:FindFirstChild("WeaponAssetCache")) then goto L60622 end
      if not not (GetBP("Sharkman Karate")) then goto L60620 end
      if not (GetBP("Fishman Karate")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
      end
      local tmp342 = GetBP("Fishman Karate")
      if (GetBP("Fishman Karate")) then
        tmp342 = (GetBP("Fishman Karate")).Level.Value >= 400
      end
      if tmp342 then
        gs_c1_53.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        _G.Level = false
        local tmp344 = _G
        goto L60314
      end
      local tmp343 = GetBP("Fishman Karate")
      if (GetBP("Fishman Karate")) then
        tmp343 = (GetBP("Fishman Karate")).Level.Value < 399
      end
      if not tmp343 then goto L60314 end
      _G.Level = true
      tmp344 = _G
      ::L60314::
      if not (GetBP("Fishman Karate")) then
      end
      local tmp350 = tmp344
      if not j60339_0_2 then goto L60618 end
      if not (GetBP("Water Key")) then goto L60492 end
      local tmp347 = tmp344
      if not (string.find(gs_c1_53.Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys")) then goto L60490 end
      local tmp346 = tmp344
      if not (GetBP("Water Key")) then goto L60488 end
      _iter = tmp344
      ::L60394::
      wait()
      _tp(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
      local tmp345 = not _G.Auto_SharkMan_Karate
      if _G.Auto_SharkMan_Karate then
        tmp345 = Root.Position == (CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)).Position
      end
      if not (tmp345) then
        goto L60394
      end
      gs_c1_53.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
      ::L60488::
      tmp347 = tmp346
      ::L60490::
      local tmp349 = tmp347
      goto L60616
      ::L60492::
      tmp349 = tmp344
      if not not (GetBP("Water Key")) then goto L60616 end
      gs_860_11_1 = GetConnectionEnemies("Tide Keeper")
      if not gs_860_11_1 then goto L60593 end
      _iter = tmp344
      ::L60522::
      wait()
      gs_c1_13.Kill(gs_860_11_1, _G.Auto_SharkMan_Karate)
      local tmp348 = not gs_860_11_1.Parent
      if not gs_860_11_1.Parent then goto L60588 end
      tmp348 = gs_860_11_1.Humanoid.Health <= 0
      if gs_860_11_1.Humanoid.Health <= 0 then goto L60588 end
      tmp348 = _G.Auto_SharkMan_Karate == false
      if _G.Auto_SharkMan_Karate == false then goto L60588 end
      tmp348 = GetBP("Water Key")
      if GetBP("Water Key") then goto L60588 end
      tmp348 = GetBP("Sharkman Karate")
      ::L60588::
      if not (tmp348) then
        goto L60522
      end
      goto L60614
      ::L60593::
      _tp(CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625))
      ::L60614::
      ::L60616::
      tmp350 = tmp349
      ::L60618::
      local tmp351 = tmp350
      ::L60620::
      local tmp352 = tmp351
      ::L60622::
      return
    end
    while (wait(Sec)) do
      if _G.Auto_SharkMan_Karate then
        pcall(fn_860)
      end
    end
    return
  end
  fn_333 = function(...)
    local _,  a1 = ...
    gs_c333_1 = a1
    _G.Auto_Electric_Claw = gs_c333_1
    return
  end
  fn_334 = function(...)
    fn_859 = function(...)
      if not (gs_c1_52:FindFirstChild("WeaponAssetCache")) then goto L60122 end
      if not (GetBP("Electro")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("BuyElectro")
      end
      local tmp337 = GetBP("Electro")
      if (GetBP("Electro")) then
        tmp337 = (GetBP("Electro")).Level.Value >= 400
      end
      if tmp337 then
        if ((gs_c1_53.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")) == nil) then
          notween(CFrame.new(-12548, 337, -7481))
        end
        gs_c1_53.Remotes.CommF_:InvokeServer("BuyElectricClaw")
        goto L60120
      end
      local tmp338 = GetBP("Electro")
      if (GetBP("Electro")) then
        tmp338 = (GetBP("Electro")).Level.Value < 400
      end
      if not tmp338 then goto L60120 end
      ::L60081::
      _G.AutoFarm_Bone = true
      wait()
      local tmp339 = not _G.Auto_Electric_Claw
      if _G.Auto_Electric_Claw then
        tmp339 = GetBP("Electric Claw")
      end
      if not (tmp339) then
        goto L60081
      end
      _G.AutoFarm_Bone = false
      local tmp340 = _G
      ::L60120::
      local tmp341 = tmp340
      ::L60122::
      return
    end
    while (wait(Sec)) do
      if _G.Auto_Electric_Claw then
        pcall(fn_859)
      end
    end
    return
  end
  fn_335 = function(...)
    local _,  a1 = ...
    gs_c335_1 = a1
    _G.AutoDragonTalon = gs_c335_1
    return
  end
  fn_336 = function(...)
    fn_858 = function(...)
      if not (gs_c1_52:FindFirstChild("WeaponAssetCache")) then goto L59869 end
      if not (GetBP("Dragon Claw")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
      end
      local tmp332 = GetBP("Dragon Claw")
      if (GetBP("Dragon Claw")) then
        tmp332 = (GetBP("Dragon Claw")).Level.Value >= 400
      end
      if tmp332 then
        gs_c1_53.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        gs_c1_53.Remotes.CommF_:InvokeServer("BuyDragonTalon")
        goto L59867
      end
      local tmp333 = GetBP("Dragon Claw")
      if (GetBP("Dragon Claw")) then
        tmp333 = (GetBP("Dragon Claw")).Level.Value < 400
      end
      if not tmp333 then goto L59867 end
      ::L59828::
      _G.AutoFarm_Bone = true
      wait()
      local tmp334 = not _G.AutoDragonTalon
      if _G.AutoDragonTalon then
        tmp334 = GetBP("Dragon Talon")
      end
      if not (tmp334) then
        goto L59828
      end
      _G.AutoFarm_Bone = false
      local tmp335 = _G
      ::L59867::
      local tmp336 = tmp335
      ::L59869::
      return
    end
    while (wait(Sec)) do
      if _G.AutoDragonTalon then
        pcall(fn_858)
      end
    end
    return
  end
  fn_337 = function(...)
    local _,  a1 = ...
    gs_c337_1 = a1
    _G.Auto_God_Human = gs_c337_1
    return
  end
  fn_338 = function(...)
    fn_857 = function(...)
      if not _G.Auto_God_Human then goto L59638 end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("BuyGodhuman", true)) == "Bring me 20 Fish Tails, 20 Magma Ore, 10 Dragon Scales and 10 Mystic Droplets.") then goto L59591 end
      local tmp321 = (GetM("Dragon Scale")) == false
      if not ((GetM("Dragon Scale")) == false) then
        tmp321 = (GetM("Dragon Scale")) < 10
      end
      if tmp321 then
        if World3 then
          Lv = 1575
          _G.Level = true
          local tmp322 = _G
        else
          gs_c1_53.Remotes.CommF_:InvokeServer("TravelZou")
        end
        local tmp329 = tmp322
        goto L59589
      end
      local tmp323 = (GetM("Fish Tail")) == false
      if not ((GetM("Fish Tail")) == false) then
        tmp323 = (GetM("Fish Tail")) < 20
      end
      if tmp323 then
        if World3 then
          Lv = 1775
          _G.Level = true
          local tmp324 = _G
        else
          gs_c1_53.Remotes.CommF_:InvokeServer("TravelZou")
        end
        tmp329 = tmp324
        goto L59589
      end
      local tmp325 = (GetM("Mystic Droplet")) == false
      if not ((GetM("Mystic Droplet")) == false) then
        tmp325 = (GetM("Mystic Droplet")) < 10
      end
      if tmp325 then
        if World2 then
          Lv = 1425
          _G.Level = true
          local tmp326 = _G
        else
          gs_c1_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
        tmp329 = tmp326
        goto L59589
      end
      local tmp327 = (GetM("Magma Ore")) == false
      if not ((GetM("Magma Ore")) == false) then
        tmp327 = (GetM("Magma Ore")) < 20
      end
      if not tmp327 then goto L59589 end
      if World2 then
        Lv = 1175
        _G.Level = true
        local tmp328 = _G
      else
        gs_c1_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
      end
      tmp329 = tmp328
      ::L59589::
      local tmp330 = tmp329
      goto L59636
      ::L59591::
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("BuyGodhuman", true)) == 3) then return end
      gs_c1_53.Remotes.CommF_:InvokeServer("BuyGodhuman")
      ::L59636::
      local tmp331 = tmp330
      ::L59638::
      return
    end
    while (wait()) do
      pcall(fn_857)
    end
    return
  end
  fn_339 = function(...)
    local _,  a1 = ...
    gs_c339_1 = a1
    _G.Snaguine = gs_c339_1
    return
  end
  fn_340 = function(...)
    fn_856 = function(...)
          if not (GetBP("Sanguine Art")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("Sanguine Art")
      end
      if not not (GetBP("Sanguine Art")) then goto L59259 end
      if ((GetM("Leviathan Heart")) >= 1) then
        print("Completed!!")
        goto L58823
      end
      if World3 then
        _G.DangerSc = "Lv Infinite"
        _G.SailBoats = true
        local tmp312 = _G
      else
        _G.SailBoats = false
        tmp312 = _G
      end
      local tmp313 = tmp312
      ::L58823::
      local tmp315 = tmp313
      if not ((GetM("Vampire Fang")) <= 19) then goto L58953 end
      if not World2 then goto L58932 end
      gs_856_8_1 = GetConnectionEnemies("Vampire")
      if not gs_856_8_1 then goto L58909 end
      _iter = tmp313
      h58859_0_2 = j58823_0_2
      ::L58859::
      task.wait()
      gs_c1_13.Kill(gs_856_8_1, _G.Snaguine)
      local tmp314 = not _G.Snaguine
      if not _G.Snaguine then goto L58904 end
      tmp314 = gs_856_8_1.Humanoid.Health <= 0
      if gs_856_8_1.Humanoid.Health <= 0 then goto L58904 end
      tmp314 = not gs_856_8_1.Parent
      ::L58904::
      if not (tmp314) then
        goto L58859
      end
      goto L58930
      ::L58909::
      _tp(CFrame.new(-6041.29248046875, 6.402710914611816, -1304.63330078125))
      ::L58930::
      goto L58951
      ::L58932::
      gs_c1_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
      ::L58951::
      ::L58953::
      if ((GetM("Vampire Fang")) >= 20) then
      end
      local tmp317 = tmp315
      if not j58977_0_3 then goto L59097 end
      if not World3 then goto L59076 end
      gs_856_14_1 = GetConnectionEnemies("Demonic Soul")
      if not gs_856_14_1 then goto L59053 end
      _iter = tmp315
      h59003_0_2 = j58953_0_2
      ::L59003::
      task.wait()
      gs_c1_13.Kill(gs_856_14_1, _G.Snaguine)
      local tmp316 = not _G.Snaguine
      if not _G.Snaguine then goto L59048 end
      tmp316 = gs_856_14_1.Humanoid.Health <= 0
      if gs_856_14_1.Humanoid.Health <= 0 then goto L59048 end
      tmp316 = not gs_856_14_1.Parent
      ::L59048::
      if not (tmp316) then
        goto L59003
      end
      goto L59074
      ::L59053::
      _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
      ::L59074::
      goto L59095
      ::L59076::
      gs_c1_53.Remotes.CommF_:InvokeServer("TravelZou")
      ::L59095::
      ::L59097::
      if not ((GetM("Vampire Fang")) >= 20) then goto L59135 end
      if not ((GetM("Demonic Wisp")) >= 20) then goto L59135 end
      ::L59135::
      local tmp319 = tmp317
      if not j59135_0_3 then goto L59257 end
      if not World2 then goto L59236 end
      gs_856_20_1 = GetConnectionEnemies("Darkbeard")
      if not gs_856_20_1 then goto L59213 end
      _iter = tmp317
      h59161_0_2 = j59097_0_2
      ::L59161::
      task.wait()
      gs_c1_13.Kill(black, _G.Snaguine)
      local tmp318 = _G.Snaguine
      if _G.Snaguine then goto L59208 end
      tmp318 = black.Humanoid.Health <= 0
      if black.Humanoid.Health <= 0 then goto L59208 end
      tmp318 = not black.Parent
      ::L59208::
      if not (tmp318) then
        goto L59161
      end
      goto L59234
      ::L59213::
      _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
      ::L59234::
      goto L59255
      ::L59236::
      gs_c1_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
      ::L59255::
      ::L59257::
      local tmp320 = tmp319
      goto L59278
      ::L59259::
      gs_c1_53.Remotes.CommF_:InvokeServer("BuySanguineArt")
      ::L59278::
      return
    end
    while (wait(Sec)) do
      if _G.Snaguine then
        pcall(fn_856)
      end
    end
    return
  end
  fn_341 = function(...)
      while (wait(0.2)) do
      local tmp311 = workspace.Map:FindFirstChild("MysticIsland")
      if not (workspace.Map:FindFirstChild("MysticIsland")) then
        tmp311 = workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")
      end
      if tmp311 then
        gs_c1_112:SetDesc("Mirage Island : True")
      else
        gs_c1_112:SetDesc("Mirage Island : False")
      end
    end
    return
  end
  fn_342 = function(...)
    fn_855 = function(...)
      gs_c855_1 = "http://www.roblox.com/asset/?id=9709150401"
      gs_c855_2 = "http://www.roblox.com/asset/?id=9709150086"
      gs_c855_3 = "http://www.roblox.com/asset/?id=9709149680"
      gs_c855_4 = "http://www.roblox.com/asset/?id=9709149431"
      gs_c855_5 = "http://www.roblox.com/asset/?id=9709149052"
      gs_c855_6 = "http://www.roblox.com/asset/?id=9709143733"
      gs_c855_7 = "http://www.roblox.com/asset/?id=9709139597"
      gs_c855_8 = "http://www.roblox.com/asset/?id=9709135895"
      gs_c855_9 = Getmoon()
      if (gs_c855_9 == gs_c855_8) then
        gs_c1_111:SetDesc("Moon : 0 / 8")
        goto L58611
      end
      if (gs_c855_9 == gs_c855_7) then
        gs_c1_111:SetDesc("Moon : 1 / 8")
        goto L58611
      end
      if (gs_c855_9 == gs_c855_6) then
        gs_c1_111:SetDesc("Moon : 2 / 8")
        goto L58611
      end
      if (gs_c855_9 == gs_c855_5) then
        gs_c1_111:SetDesc("Moon : 3 / 8 [ Next Night ]")
        goto L58611
      end
      if (gs_c855_9 == gs_c855_4) then
        gs_c1_111:SetDesc("Moon : 4 / 8 [ Full Moon ]")
        goto L58611
      end
      if (gs_c855_9 == gs_c855_3) then
        gs_c1_111:SetDesc("Moon : 5 / 8 [ Last Night ]")
        goto L58611
      end
      if (gs_c855_9 == gs_c855_2) then
        gs_c1_111:SetDesc("Moon : 6 / 8")
        goto L58611
      end
      if not (gs_c855_9 == gs_c855_1) then goto L58611 end
      gs_c1_111:SetDesc("Moon : 7 / 8")
      ::L58611::
      return
    end
    while (wait(0.2)) do
      pcall(fn_855)
    end
    return
  end
  fn_343 = function(...)
    local _,  a1 = ...
    gs_c343_1 = a1
    _G.FindMirage = gs_c343_1
    return
  end
  fn_344 = function(...)
    fn_854 = function(...)
              local _t1
                  if not not (workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true)) then goto L58308 end
      gs_854_1_1 = CheckBoat()
      if not gs_854_1_1 then
        gs_854_2_1 = CFrame.new(-16927.451, 9.086, 433.864)
        TeleportToTarget(gs_854_2_1)
        if ((gs_854_2_1.Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10) then
          gs_c1_53.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
        end
        goto L58306
      end
      if (gs_c1_52.Character.Humanoid.Sit == false) then
        gs_854_5_1 = gs_854_1_1.VehicleSeat.CFrame * (CFrame.new(0, 1, 0))
        _tp(gs_854_5_1)
        goto L58305
      end
      ::L58139::
      wait()
      gs_854_7_1 = CFrame.new(-10000000, 31, 37016.25)
      local tmp306 = CheckEnemiesBoat()
      if CheckEnemiesBoat() then goto L58192 end
      tmp306 = CheckTerrorShark()
      if CheckTerrorShark() then goto L58192 end
      tmp306 = CheckPirateGrandBrigade()
      ::L58192::
      if tmp306 then
        _tp(CFrame.new(-10000000, 150, 37016.25))
      else
        _tp(CFrame.new(-10000000, 31, 37016.25))
      end
      local tmp307 = not _G.FindMirage
      if not _G.FindMirage then goto L58293 end
      tmp307 = (gs_854_7_1.Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10
      if (gs_854_7_1.Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10 then goto L58293 end
      tmp307 = workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")
      if workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then goto L58293 end
      tmp307 = gs_c1_52.Character.Humanoid.Sit == false
      ::L58293::
      if not (tmp307) then
        goto L58139
      end
      _t1 = gs_c1_52.Character.Humanoid
      _t1.Sit = false
      local tmp308 = gs_c1_52.Character.Humanoid
      ::L58305::
      local tmp309 = tmp308
      ::L58306::
      local tmp310 = tmp309
      goto L58340
      ::L58308::
      _tp(workspace.Map.MysticIsland.Center.CFrame * (CFrame.new(0, 300, 0)))
      ::L58340::
      return
    end
    while (wait()) do
      if _G.FindMirage then
        pcall(fn_854)
      end
    end
    return
  end
  fn_345 = function(...)
    local _,  a1 = ...
    gs_c345_1 = a1
    _G.TPGEAR = gs_c345_1
    return
  end
  fn_346 = function(...)
    fn_853 = function(...)
              ::L57836::
      if not (wait(0.1)) then goto L57939 end
      if not _G.TPGEAR then goto L57937 end
      workspace.Map:FindFirstChild("MysticIsland")
      _iter = {pairs((workspace.Map:FindFirstChild("MysticIsland")).GetChildren(workspace.Map:FindFirstChild("MysticIsland")))}
      ::L57891::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L57934
      end
      gs_853_2_1 = _loopkey
      gs_853_2_2 = _loopval
      if (gs_853_2_2.Name == "Part") then
        if (gs_853_2_2.ClassName == "MeshPart") then
          _tp(gs_853_2_2.CFrame)
        end
      end
      goto L57891
      ::L57934::
      ::L57937::
      goto L57836
      ::L57939::
      return
    end
    pcall(fn_853)
    return
  end
  fn_347 = function(...)
    local _,  a1 = ...
    gs_c347_1 = a1
    _G.can = gs_c347_1
    return
  end
  fn_348 = function(...)
    fn_852 = function(...)
                      ::L57711::
      if not (wait(Sec)) then goto L57815 end
      if not _G.can then goto L57813 end
      workspace.Map:FindFirstChild("MysticIsland")
      _iter = {pairs((workspace.Map:FindFirstChild("MysticIsland")).GetChildren(workspace.Map:FindFirstChild("MysticIsland")))}
      ::L57767::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L57810
      end
      gs_852_2_1 = _loopkey
      gs_852_2_2 = _loopval
      if (gs_852_2_2.Name == "Part") then
        if (gs_852_2_2.ClassName == "MeshPart") then
          gs_852_2_2.Transparency = 0
          local tmp304 = gs_852_2_2
        else
          gs_852_2_2.Transparency = 1
          tmp304 = gs_852_2_2
        end
        local tmp305 = tmp304
      end
      goto L57767
      ::L57810::
      ::L57813::
      goto L57711
      ::L57815::
      return
    end
    pcall(fn_852)
    return
  end
  fn_349 = function(...)
    local _,  a1 = ...
    gs_c349_1 = a1
    _G.Addealer = gs_c349_1
    return
  end
  fn_350 = function(...)
    fn_851 = function(...)
              for _key, item in pairs(gs_c1_53.NPCs:GetChildren()) do
                gs_c851_1 = _key
                gs_c851_2 = item
                if (gs_c851_2.Name == "Advanced Fruit Dealer") then
                _tp(gs_c851_2.HumanoidRootPart.CFrame)
                end
              end
      return
    end
    while (wait()) do
      if _G.Addealer then
        pcall(fn_851)
      end
    end
    return
  end
  fn_351 = function(...)
    gs_c1_53:WaitForChild("Remotes")
    (gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")
    ((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")).InvokeServer((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_"), "RaceV4Progress", "Begin")
    gs_c1_53:WaitForChild("Remotes")
    (gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")
    ((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")).InvokeServer((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_"), "RaceV4Progress", "Check")
    gs_c1_53:WaitForChild("Remotes")
    (gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")
    ((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")).InvokeServer((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_"), "RaceV4Progress", "Teleport")
    gs_c1_53:WaitForChild("Remotes")
    (gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")
    ((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")).InvokeServer((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_"), "RaceV4Progress", "Continue")
    return
  end
  fn_352 = function(...)
    local _,  a1 = ...
    gs_c352_1 = a1
    LookM = gs_c352_1
    return
  end
  fn_353 = function(...)
    local _t1
    local _t2
    _t1 = workspace.CurrentCamera
    _t1.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, (Lighting.GetMoonDirection(Lighting)) + workspace.CurrentCamera.CFrame.Position)
    _t2 = gs_c1_52.Character.HumanoidRootPart
    _t2.CFrame = CFrame.new(gs_c1_52.Character.HumanoidRootPart.Position, (Lighting.GetMoonDirection(Lighting)) + gs_c1_52.Character.HumanoidRootPart.CFrame.Position)
    return
  end
  fn_354 = function(...)
    while (task.wait()) do
      if LookM then
        MoveCamtoMoon()
        wait(0.1)
        gs_c1_53.Remotes.CommE:FireServer("ActivateAbility")
      end
    end
    return
  end
  fn_355 = function(...)
    local _,  a1 = ...
    gs_c355_1 = a1
    LookMV3 = gs_c355_1
    return
  end
  fn_356 = function(...)
    local _t1
    local _t2
    gs_c356_1 = Lighting.GetMoonDirection(Lighting)
    _t1 = workspace.CurrentCamera
    _t1.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + gs_c356_1)
    _t2 = gs_c1_52.Character.HumanoidRootPart
    _t2.CFrame = CFrame.new(gs_c1_52.Character.HumanoidRootPart.Position, gs_c1_52.Character.HumanoidRootPart.Position + gs_c356_1)
    return
  end
  fn_357 = function(...)
    while (task.wait(0.1)) do
      if LookMV3 then
        MoveCamtoMoon()
        gs_c1_53.Remotes.CommE:FireServer("ActivateAbility")
        UIS:SendKeyEvent(true, "T", false, game)
        wait(0.5)
        UIS:SendKeyEvent(false, "T", false, game)
      end
    end
    return
  end
  fn_358 = function(...)
    local _,  a1 = ...
    fn_850 = function(...)
      while MirageIslandESP do
        UpdateIslandMirageESP()
        task.wait(1)
      end
      return
    end
    gs_c358_1 = a1
    MirageIslandESP = gs_c358_1
    if MirageIslandESP then
      task.spawn(fn_850)
    else
      UpdateIslandMirageESP()
    end
    return
  end
  fn_359 = function(...)
    local _,  a1 = ...
    gs_c359_1 = a1
    _G.AutoMysticIsland = gs_c359_1
    return
  end
  fn_360 = function(...)
    fn_849 = function(...)
              if not _G.AutoMysticIsland then goto L57035 end
      _iter = {pairs((game:GetService("Workspace"))._WorldOrigin.Locations.GetChildren((game:GetService("Workspace"))._WorldOrigin.Locations))}
      ::L56986::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L57032
      end
      gs_849_1_1 = _loopkey
      gs_849_1_2 = _loopval
      if (gs_849_1_2.Name == "Mirage Island") then
        topos(gs_849_1_2.CFrame * (CFrame.new(0, 333, 0)))
      end
      goto L56986
      ::L57032::
      ::L57035::
      return
    end
    while (task.wait(0.1)) do
      pcall(fn_849)
    end
    return
  end
  fn_361 = function(...)
    local _,  a1 = ...
    gs_c361_1 = a1
    _G.FarmChestM = gs_c361_1
    return
  end
  fn_362 = function(...)
    fn_848 = function(...)
                          local _lv1
      local _lm1
      local _ls1
              local tmp300 = workspace.Map.MysticIsland.Chests:FindFirstChild("DiamondChest")
      if not (workspace.Map.MysticIsland.Chests:FindFirstChild("DiamondChest")) then
        tmp300 = workspace.Map.MysticIsland.Chests:FindFirstChild("FragChest")
      end
      if not tmp300 then goto L56904 end
      gs_848_1_1 = game:GetService("CollectionService")
      gs_848_1_2 = game:GetService("Players")
      gs_848_1_3 = gs_848_1_2.LocalPlayer
      local tmp301 = gs_848_1_3.Character
      if not (gs_848_1_3.Character) then
        tmp301 = gs_848_1_3.CharacterAdded.Wait(gs_848_1_3.CharacterAdded)
      end
      gs_848_1_4 = tmp301
      if not gs_848_1_4 then return end
      gs_848_1_5 = (gs_848_1_4.GetPivot(gs_848_1_4)).Position
      gs_848_1_6 = gs_848_1_1:GetTagged("_ChestTagged")
      gs_848_1_7 = math.huge
      gs_848_1_8 = ({math.huge})[2]
      _iter = 1 - 1
      h56782_0_2 = #gs_848_1_6
      h56782_0_3 = 1
      _lv1 = _iter + h56782_0_3
      _lm1 = h56782_0_2
      _ls1 = h56782_0_3
      ::FOR_56782::
      _lv1 = _lv1 + _ls1
      if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_56782 end
      gs_848f56782_1 = _lv1
      gs_848f56782_2 = gs_848_1_6[gs_848f56782_1]
      gs_848f56782_3 = ((gs_848f56782_2.GetPivot(gs_848f56782_2)).Position - gs_848_1_5).Magnitude
      local tmp302 = not SelectedIsland
      if not SelectedIsland then goto L56838 end
      tmp302 = gs_848f56782_2:IsDescendantOf(SelectedIsland)
      ::L56838::
      if not tmp302 then goto L56873 end
      local tmp303 = not (gs_848f56782_2:GetAttribute("IsDisabled"))
      if not not (gs_848f56782_2:GetAttribute("IsDisabled")) then goto L56862 end
      tmp303 = gs_848f56782_3 < gs_848_1_7
      ::L56862::
      if not tmp303 then goto L56871 end
      gs_848_1_7 = gs_848f56782_3
      gs_848_1_8 = gs_848f56782_2
      ::L56871::
      ::L56873::
      goto FOR_56782
      ::FOR_END_56782::
      if gs_848_1_8 then
        _tp(gs_848_1_8.GetPivot(gs_848_1_8))
      end
      ::L56904::
      return
    end
    while (wait(0.2)) do
      if _G.FarmChestM then
        pcall(fn_848)
      end
    end
    return
  end
  fn_363 = function(...)
    local _,  a1 = ...
    gs_c363_1 = a1
    _G.HighestMirage = gs_c363_1
    return
  end
  fn_364 = function(...)
    fn_847 = function(...)
      if (workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true)) then
        _tp(workspace.Map.MysticIsland.Center.CFrame * (CFrame.new(0, 400, 0)))
      end
      return
    end
    while (wait(Sec)) do
      if _G.HighestMirage then
        pcall(fn_847)
      end
    end
    return
  end
  fn_365 = function(...)
    gs_c365_1 = ({{{.NPC = "Dragon Wizard", .Command = "Upgrade"}}})[1]
    gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
    return (gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")).InvokeServer(gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest"), unpack(gs_c365_1))
  end
  fn_366 = function(...)
    local _,  a1 = ...
    gs_c366_1 = a1
    _G.UPGDrago = gs_c366_1
    return
  end
  fn_367 = function(...)
    fn_846 = function(...)
      if _G.UPGDrago then
        if ((GetQuestDracoLevel()) == false) then return end
        if ((GetQuestDracoLevel()) == true) then
          if (((CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)).Position - Root.Position).Magnitude >= 300) then
            _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
          else
            _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
            gs_846_5_1 = ({{{.NPC = "Dragon Wizard", .Command = "Upgrade"}}})[1]
            gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
            (gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")).InvokeServer(gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest"), unpack(gs_846_5_1))
          end
        end
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_846)
    end
    return
  end
  fn_368 = function(...)
    local _,  a1 = ...
    gs_c368_1 = a1
    _G.DragoV1 = gs_c368_1
    return
  end
  fn_369 = function(...)
    fn_845 = function(...)
      if not _G.DragoV1 then goto L56209 end
      if not ((GetM("Dragon Egg")) <= 0) then goto L56207 end
      ::L56146::
      wait()
      _G.Prehis_Find = true
      _G.Prehis_Skills = true
      _G.Prehis_DE = true
      if _G.DragoV1 then
      end
      if not (j56187_0_4) then
        goto L56146
      end
      _G.Prehis_Find = false
      _G.Prehis_Skills = false
      _G.Prehis_DE = false
      local tmp298 = _G
      ::L56207::
      local tmp299 = tmp298
      ::L56209::
      return
    end
    while (wait(Sec)) do
      pcall(fn_845)
    end
    return
  end
  fn_370 = function(...)
    local _,  a1 = ...
    gs_c370_1 = a1
    _G.AutoFireFlowers = gs_c370_1
    return
  end
  fn_371 = function(...)
            ::L55779::
    if not (wait(Sec)) then goto L56091 end
    if not _G.AutoFireFlowers then goto L56089 end
    gs_371_2_1 = workspace:FindFirstChild("FireFlowers")
    gs_371_2_2 = GetConnectionEnemies("Forest Pirate")
    if not gs_371_2_2 then goto L55888 end
    ::L55836::
    wait()
    gs_c1_13.Kill(gs_371_2_2, _G.AutoFireFlowers)
    local tmp296 = not _G.AutoFireFlowers
    if not _G.AutoFireFlowers then goto L55883 end
    tmp296 = not gs_371_2_2.Parent
    if not gs_371_2_2.Parent then goto L55883 end
    tmp296 = gs_371_2_2.Humanoid.Health <= 0
    if gs_371_2_2.Humanoid.Health <= 0 then goto L55883 end
    tmp296 = gs_371_2_1
    ::L55883::
    if not (tmp296) then
      goto L55836
    end
    goto L55909
    ::L55888::
    _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
    ::L55909::
    if not gs_371_2_1 then goto L56087 end
    for _key, item in pairs(gs_371_2_1:GetChildren()) do
      gs_371_6_1 = _key
      gs_371_6_2 = item
      local tmp297 = gs_371_6_2:IsA("Model")
      if (gs_371_6_2:IsA("Model")) then
      tmp297 = gs_371_6_2.PrimaryPart
      end
      if tmp297 then
      gs_371_8_1 = gs_371_6_2.PrimaryPart.Position
      gs_371_8_2 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
      gs_371_8_3 = (gs_371_8_1 - gs_371_8_2).Magnitude
      if (gs_371_8_3 <= 100) then
      vim1:SendKeyEvent(true, "E", false, game)
      wait(1.5)
      vim1:SendKeyEvent(false, "E", false, game)
      else
      _tp(CFrame.new(gs_371_8_1))
      end
      end
    end
    ::L56087::
    ::L56089::
    goto L55779
    ::L56091::
    return
  end
  fn_372 = function(...)
    local _,  a1 = ...
    gs_c372_1 = a1
    _G.DragoV3 = gs_c372_1
    return
  end
  fn_373 = function(...)
    fn_844 = function(...)
      if not _G.DragoV3 then goto L55768 end
      ::L55720::
      wait()
      _G.DangerSc = "Lv Infinite"
      _G.SailBoats = true
      _G.TerrorShark = true
      if _G.DragoV3 then
        goto L55720
      end
      _G.DangerSc = "Lv 1"
      _G.SailBoats = false
      _G.TerrorShark = false
      local tmp295 = _G
      ::L55768::
      return
    end
    while (wait(Sec)) do
      pcall(fn_844)
    end
    return
  end
  fn_374 = function(...)
    local _,  a1 = ...
    gs_c374_1 = a1
    _G.Relic123 = gs_c374_1
    return
  end
  fn_375 = function(...)
    fn_843 = function(...)
                                  if not (workspace.Map:FindFirstChild("DracoTrial")) then goto L55610 end
      gs_c1_53.Remotes.DracoTrial.InvokeServer(gs_c1_53.Remotes.DracoTrial)
      wait(0.5)
      ::L55250::
      wait()
      _tp(CFrame.new(-39934.9765625, 10685.359375, 22999.34375))
      local tmp288 = not _G.Relic123
      if _G.Relic123 then
        tmp288 = Root.Position == (CFrame.new(-39934.9765625, 10685.359375, 22999.34375)).Position
      end
      if tmp288 then goto L55307 end
      goto L55250
      ::L55307::
      wait()
      _tp(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625))
      local tmp289 = not _G.Relic123
      if _G.Relic123 then
        tmp289 = Root.Position == (CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625)).Position
      end
      if not (tmp289) then
        goto L55307
      end
      wait(2.5)
      ::L55372::
      wait()
      _tp(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375))
      local tmp290 = not _G.Relic123
      if _G.Relic123 then
        tmp290 = Root.Position == (CFrame.new(-39914.65625, 10685.384765625, 23000.177734375)).Position
      end
      if tmp290 then goto L55429 end
      goto L55372
      ::L55429::
      wait()
      _tp(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375))
      local tmp291 = not _G.Relic123
      if _G.Relic123 then
        tmp291 = Root.Position == (CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375)).Position
      end
      if not (tmp291) then
        goto L55429
      end
      wait(2.5)
      ::L55494::
      wait()
      _tp(CFrame.new(-39908.5, 10685.4052734375, 22990.04296875))
      local tmp292 = not _G.Relic123
      if _G.Relic123 then
        tmp292 = Root.Position == (CFrame.new(-39908.5, 10685.4052734375, 22990.04296875)).Position
      end
      if tmp292 then goto L55551 end
      goto L55494
      ::L55551::
      wait()
      _tp(CFrame.new(-39609.5, 9376.400390625, 23472.94335975))
      local tmp293 = not _G.Relic123
      if _G.Relic123 then
        tmp293 = Root.Position == (CFrame.new(-39609.5, 9376.400390625, 23472.94335975)).Position
      end
      if not (tmp293) then
        goto L55551
      end
      goto L55678
      ::L55610::
      gs_843_8_1 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
      local tmp294 = gs_843_8_1
      if gs_843_8_1 then
        tmp294 = gs_843_8_1:IsA("Part")
      end
      if tmp294 then
        _tp(CFrame.new(gs_843_8_1.Position))
      end
      ::L55678::
      return
    end
    while (wait(Sec)) do
      if _G.Relic123 then
        pcall(fn_843)
      end
    end
    return
  end
  fn_376 = function(...)
    local _,  a1 = ...
    gs_c376_1 = a1
    _G.TrainDrago = gs_c376_1
    return
  end
  fn_377 = function(...)
    fn_842 = function(...)
                  local _lv1
      local _lm1
      local _ls1
          if not _G.TrainDrago then goto L55163 end
      gs_842_1_1 = ({{"Venomous Assailant", "Hydra Enforcer"}})[1]
      _iter = 1 - 1
      h54962_0_2 = #gs_842_1_1
      h54962_0_3 = 1
      _lv1 = _iter + h54962_0_3
      _lm1 = h54962_0_2
      _ls1 = h54962_0_3
      ::FOR_54962::
      _lv1 = _lv1 + _ls1
      if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_54962 end
      gs_842f54962_1 = _lv1
      if not ((gs_c1_52.Character:FindFirstChild("RaceEnergy")).Value == 1) then goto L55045 end
      vim1:SendKeyEvent(true, "Y", false, game)
      gs_c1_53.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy", 2)
      _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
      local tmp287 = _iter + h54962_0_3
      goto L55157
      ::L55045::
      tmp287 = _iter + h54962_0_3
      if not ((gs_c1_52.Character:FindFirstChild("RaceTransformed")).Value == false) then goto L55157 end
      gs_842_4_1 = GetConnectionEnemies(gs_842_1_1)
      if not gs_842_4_1 then goto L55134 end
      _iter = _iter + h54962_0_3
      h55085_0_2 = h54962_0_2
      h55085_0_3 = h54962_0_3
      ::L55085::
      wait()
      gs_c1_13.Kill(gs_842_4_1, _G.TrainDrago)
      local tmp285 = _G.TrainDrago == false
      if _G.TrainDrago == false then goto L55129 end
      tmp285 = gs_842_4_1.Humanoid.Health <= 0
      if gs_842_4_1.Humanoid.Health <= 0 then goto L55129 end
      tmp285 = not gs_842_4_1.Parent
      ::L55129::
      if tmp285 then goto L55132 end
      goto L55085
      ::L55132::
      local tmp286 = _iter
      goto L55155
      ::L55134::
      _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
      tmp286 = _iter + h54962_0_3
      ::L55155::
      tmp287 = tmp286
      ::L55157::
      goto FOR_54962
      ::FOR_END_54962::
      ::L55163::
      return
    end
    while (wait(Sec)) do
      pcall(fn_842)
    end
    return
  end
  fn_378 = function(...)
    local _,  a1 = ...
    gs_c378_1 = a1
    _G.TpDrago_Prehis = gs_c378_1
    return
  end
  fn_379 = function(...)
      while (wait(Sec)) do
      if _G.TpDrago_Prehis then
        gs_379_2_1 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
        local tmp284 = gs_379_2_1
        if gs_379_2_1 then
          tmp284 = gs_379_2_1:IsA("Part")
        end
        if tmp284 then
          _tp(CFrame.new(gs_379_2_1.Position))
        end
      end
    end
    return
  end
  fn_380 = function(...)
    local _,  a1 = ...
    gs_c380_1 = a1
    _G.BuyDrago = gs_c380_1
    return
  end
  fn_381 = function(...)
    fn_841 = function(...)
      if (((CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)).Position - Root.Position).Magnitude >= 300) then
        _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
      else
        _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        gs_841_2_1 = ({{{.NPC = "Dragon Wizard", .Command = "DragonRace"}}})[1]
        gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
        (gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")).InvokeServer(gs_c1_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest"), unpack(gs_841_2_1))
      end
      return
    end
    while (wait(Sec)) do
      if _G.BuyDrago then
        pcall(fn_841)
      end
    end
    return
  end
  fn_382 = function(...)
    local _,  a1 = ...
    gs_c382_1 = a1
    _G.DT_Uzoth = gs_c382_1
    return
  end
  fn_383 = function(...)
    while (wait(Sec)) do
      if _G.DT_Uzoth then
        gs_383_2_1 = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838e-08, -0.584473014, 4.75227395e-08, 1, 4.25682458e-08, 0.584473014, -6.23161966e-08, 0.811413169)
        _tp(gs_383_2_1)
        if ((gs_383_2_1.Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 25) then
          gs_383_3_1 = ({{.NPC = "Uzoth", .Command = "Upgrade"}})[1]
          gs_c1_53.Modules.Net["RF/InteractDragonQuest"].InvokeServer(gs_c1_53.Modules.Net["RF/InteractDragonQuest"], gs_383_3_1)
        end
      end
    end
    return
  end
  fn_384 = function(...)
    local _,  a1 = ...
    gs_c384_1 = a1
    _G.Auto_Mink = gs_c384_1
    return
  end
  fn_385 = function(...)
    fn_840 = function(...)
      if not _G.Auto_Mink then goto L54516 end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) ~= 2) then goto L54434 end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 0) then
        gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "2")
        goto L54432
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 1) then goto L54389 end
      local tmp278 = not (gs_c1_52.Backpack:FindFirstChild("Flower 1"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 1")) then
        tmp278 = not (gs_c1_52.Character:FindFirstChild("Flower 1"))
      end
      if tmp278 then
        _tp(workspace.Flower1.CFrame)
        goto L54387
      end
      local tmp279 = not (gs_c1_52.Backpack:FindFirstChild("Flower 2"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 2")) then
        tmp279 = not (gs_c1_52.Character:FindFirstChild("Flower 2"))
      end
      if tmp279 then
        _tp(workspace.Flower2.CFrame)
        goto L54387
      end
      local tmp280 = not (gs_c1_52.Backpack:FindFirstChild("Flower 3"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 3")) then
        tmp280 = not (gs_c1_52.Character:FindFirstChild("Flower 3"))
      end
      if not tmp280 then goto L54387 end
      gs_840_7_1 = GetConnectionEnemies("Swan Pirate")
      if not gs_840_7_1 then goto L54364 end
      ::L54304::
      wait()
      gs_c1_13.Kill(gs_840_7_1, _G.Auto_Mink)
      local tmp281 = GetBP("Flower 3")
      if GetBP("Flower 3") then goto L54359 end
      tmp281 = not gs_840_7_1.Parent
      if not gs_840_7_1.Parent then goto L54359 end
      tmp281 = gs_840_7_1.Humanoid.Health <= 0
      if gs_840_7_1.Humanoid.Health <= 0 then goto L54359 end
      tmp281 = _G.Auto_Mink == false
      ::L54359::
      if not (tmp281) then
        goto L54304
      end
      goto L54385
      ::L54364::
      _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
      ::L54385::
      ::L54387::
      goto L54432
      ::L54389::
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 2) then goto L54432 end
      gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "3")
      ::L54432::
      goto L54514
      ::L54434::
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")) == 0) then
        gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        goto L54514
      end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")) == 1) then
        _G.AutoFarmChest = true
        local tmp282 = _G
      else
        _G.AutoFarmChest = false
        tmp282 = _G
      end
      ::L54514::
      local tmp283 = tmp282
      ::L54516::
      return
    end
    while (wait(Sec)) do
      pcall(fn_840)
    end
    return
  end
  fn_386 = function(...)
    local _,  a1 = ...
    gs_c386_1 = a1
    _G.Auto_Human = gs_c386_1
    return
  end
  fn_387 = function(...)
    fn_839 = function(...)
                                  if not _G.Auto_Human then goto L54008 end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) ~= -2) then goto L53671 end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 0) then
        gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "2")
        goto L53669
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 1) then goto L53626 end
      local tmp271 = not (gs_c1_52.Backpack:FindFirstChild("Flower 1"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 1")) then
        tmp271 = not (gs_c1_52.Character:FindFirstChild("Flower 1"))
      end
      if tmp271 then
        _tp(workspace.Flower1.CFrame)
        goto L53624
      end
      local tmp272 = not (gs_c1_52.Backpack:FindFirstChild("Flower 2"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 2")) then
        tmp272 = not (gs_c1_52.Character:FindFirstChild("Flower 2"))
      end
      if tmp272 then
        _tp(workspace.Flower2.CFrame)
        goto L53624
      end
      local tmp273 = not (gs_c1_52.Backpack:FindFirstChild("Flower 3"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 3")) then
        tmp273 = not (gs_c1_52.Character:FindFirstChild("Flower 3"))
      end
      if not tmp273 then goto L53624 end
      gs_839_7_1 = GetConnectionEnemies("Swan Pirate")
      if not gs_839_7_1 then goto L53601 end
      ::L53534::
      wait()
      gs_c1_13.Kill(gs_839_7_1, _G.Auto_Human)
      local tmp274 = gs_c1_52.Backpack:FindFirstChild("Flower 3")
      if gs_c1_52.Backpack:FindFirstChild("Flower 3") then goto L53596 end
      tmp274 = not gs_839_7_1.Parent
      if not gs_839_7_1.Parent then goto L53596 end
      tmp274 = gs_839_7_1.Humanoid.Health <= 0
      if gs_839_7_1.Humanoid.Health <= 0 then goto L53596 end
      tmp274 = _G.Auto_Human == false
      ::L53596::
      if not (tmp274) then
        goto L53534
      end
      goto L53622
      ::L53601::
      _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
      ::L53622::
      ::L53624::
      goto L53669
      ::L53626::
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 2) then goto L53669 end
      gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "3")
      ::L53669::
      goto L54006
      ::L53671::
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")) == 0) then
        gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        goto L54006
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")) == 1) then goto L54006 end
      gs_839_13_1 = GetConnectionEnemies(gs_c1_7[1])
      if not gs_839_13_1 then goto L53805 end
      ::L53757::
      wait()
      gs_c1_13.Kill(gs_839_13_1, _G.Auto_Human)
      local tmp275 = gs_839_13_1.Humanoid.Health <= 0
      if gs_839_13_1.Humanoid.Health <= 0 then goto L53800 end
      tmp275 = not gs_839_13_1.Parent
      if not gs_839_13_1.Parent then goto L53800 end
      tmp275 = not _G.Auto_Human
      ::L53800::
      if not (tmp275) then
        goto L53757
      end
      goto L53826
      ::L53805::
      _tp(CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625))
      ::L53826::
      gs_839_13_2 = GetConnectionEnemies(gs_c1_7[2])
      if not gs_839_13_2 then goto L53894 end
      ::L53846::
      wait()
      gs_c1_13.Kill(gs_839_13_2, _G.Auto_Human)
      local tmp276 = gs_839_13_2.Humanoid.Health <= 0
      if gs_839_13_2.Humanoid.Health <= 0 then goto L53889 end
      tmp276 = not gs_839_13_2.Parent
      if not gs_839_13_2.Parent then goto L53889 end
      tmp276 = not _G.Auto_Human
      ::L53889::
      if not (tmp276) then
        goto L53846
      end
      goto L53915
      ::L53894::
      _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
      ::L53915::
      gs_839_13_3 = GetConnectionEnemies(gs_c1_7[3])
      if not gs_839_13_3 then goto L53983 end
      ::L53935::
      wait()
      gs_c1_13.Kill(gs_839_13_3, _G.Auto_Human)
      local tmp277 = gs_839_13_3.Humanoid.Health <= 0
      if gs_839_13_3.Humanoid.Health <= 0 then goto L53978 end
      tmp277 = not gs_839_13_3.Parent
      if not gs_839_13_3.Parent then goto L53978 end
      tmp277 = not _G.Auto_Human
      ::L53978::
      if not (tmp277) then
        goto L53935
      end
      goto L54004
      ::L53983::
      _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
      ::L54004::
      ::L54006::
      ::L54008::
      return
    end
    while (wait(Sec)) do
      pcall(fn_839)
    end
    return
  end
  fn_388 = function(...)
    local _,  a1 = ...
    gs_c388_1 = a1
    _G.Auto_Skypiea = gs_c388_1
    return
  end
  fn_389 = function(...)
    fn_838 = function(...)
                                      if not _G.Auto_Skypiea then goto L53238 end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) ~= -2) then goto L53021 end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 0) then
        gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "2")
        goto L53019
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 1) then goto L52976 end
      local tmp265 = not (gs_c1_52.Backpack:FindFirstChild("Flower 1"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 1")) then
        tmp265 = not (gs_c1_52.Character:FindFirstChild("Flower 1"))
      end
      if tmp265 then
        _tp(workspace.Flower1.CFrame)
        goto L52974
      end
      local tmp266 = not (gs_c1_52.Backpack:FindFirstChild("Flower 2"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 2")) then
        tmp266 = not (gs_c1_52.Character:FindFirstChild("Flower 2"))
      end
      if tmp266 then
        _tp(workspace.Flower2.CFrame)
        goto L52974
      end
      local tmp267 = not (gs_c1_52.Backpack:FindFirstChild("Flower 3"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 3")) then
        tmp267 = not (gs_c1_52.Character:FindFirstChild("Flower 3"))
      end
      if not tmp267 then goto L52974 end
      gs_838_7_1 = GetConnectionEnemies("Swan Pirate")
      if not gs_838_7_1 then goto L52951 end
      ::L52884::
      wait()
      gs_c1_13.Kill(gs_838_7_1, _G.Auto_Skypiea)
      local tmp268 = gs_c1_52.Backpack:FindFirstChild("Flower 3")
      if gs_c1_52.Backpack:FindFirstChild("Flower 3") then goto L52946 end
      tmp268 = not gs_838_7_1.Parent
      if not gs_838_7_1.Parent then goto L52946 end
      tmp268 = gs_838_7_1.Humanoid.Health <= 0
      if gs_838_7_1.Humanoid.Health <= 0 then goto L52946 end
      tmp268 = _G.Auto_Skypiea == false
      ::L52946::
      if not (tmp268) then
        goto L52884
      end
      goto L52972
      ::L52951::
      _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
      ::L52972::
      ::L52974::
      goto L53019
      ::L52976::
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 2) then goto L53019 end
      gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "3")
      ::L53019::
      goto L53236
      ::L53021::
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")) == 0) then
        gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        goto L53236
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")) == 1) then goto L53236 end
      for _key, item in pairs(game.Players:GetChildren()) do
        gs_838_13_1 = _key
        gs_838_13_2 = item
        local tmp269 = gs_838_13_2.Name ~= gs_root_52.Name
        if (gs_838_13_2.Name ~= gs_root_52.Name) then
        tmp269 = (tostring(gs_838_13_2.Data.Race.Value)) == "Skypiea"
        end
        if not tmp269 then goto L53230 end
        ::L53152::
        task.wait()
        _tp((gs_838_13_2.HumanoidRootPart.CFrame * (CFrame.new(0, 8, 0))) * (CFrame.Angles(math.rad(-45), 0, 0)))
        local tmp270 = gs_838_13_2.Humanoid.Health <= 0
        if not (gs_838_13_2.Humanoid.Health <= 0) then
        tmp270 = _G.Auto_Skypiea == false
        end
        if not (tmp270) then
        goto L53152
        end
        ::L53230::
      end
      ::L53236::
      ::L53238::
      return
    end
    while (wait(Sec)) do
      pcall(fn_838)
    end
    return
  end
  fn_390 = function(...)
    local _,  a1 = ...
    gs_c390_1 = a1
    _G.Auto_Fish = gs_c390_1
    return
  end
  fn_391 = function(...)
    fn_837 = function(...)
                      if not _G.Auto_Fish then goto L52588 end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) ~= -2) then goto L52510 end
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 0) then
        gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "2")
        goto L52508
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 1) then goto L52465 end
      local tmp261 = not (gs_c1_52.Backpack:FindFirstChild("Flower 1"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 1")) then
        tmp261 = not (gs_c1_52.Character:FindFirstChild("Flower 1"))
      end
      if tmp261 then
        _tp(workspace.Flower1.CFrame)
        goto L52463
      end
      local tmp262 = not (gs_c1_52.Backpack:FindFirstChild("Flower 2"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 2")) then
        tmp262 = not (gs_c1_52.Character:FindFirstChild("Flower 2"))
      end
      if tmp262 then
        _tp(workspace.Flower2.CFrame)
        goto L52463
      end
      local tmp263 = not (gs_c1_52.Backpack:FindFirstChild("Flower 3"))
      if not (gs_c1_52.Backpack:FindFirstChild("Flower 3")) then
        tmp263 = not (gs_c1_52.Character:FindFirstChild("Flower 3"))
      end
      if not tmp263 then goto L52463 end
      gs_837_7_1 = GetConnectionEnemies("Swan Pirate")
      if not gs_837_7_1 then goto L52440 end
      ::L52373::
      wait()
      gs_c1_13.Kill(gs_837_7_1, _G.Auto_Fish)
      local tmp264 = gs_c1_52.Backpack:FindFirstChild("Flower 3")
      if gs_c1_52.Backpack:FindFirstChild("Flower 3") then goto L52435 end
      tmp264 = not gs_837_7_1.Parent
      if not gs_837_7_1.Parent then goto L52435 end
      tmp264 = gs_837_7_1.Humanoid.Health <= 0
      if gs_837_7_1.Humanoid.Health <= 0 then goto L52435 end
      tmp264 = _G.Auto_Fish == false
      ::L52435::
      if not (tmp264) then
        goto L52373
      end
      goto L52461
      ::L52440::
      _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
      ::L52461::
      ::L52463::
      goto L52508
      ::L52465::
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "1")) == 2) then goto L52508 end
      gs_c1_53.Remotes.CommF_:InvokeServer("Alchemist", "3")
      ::L52508::
      goto L52586
      ::L52510::
      if ((gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")) == 0) then
        gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        goto L52586
      end
      if not ((gs_c1_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")) == 1) then goto L52586 end
      warn("Sea Beast Soon")
      ::L52586::
      ::L52588::
      return
    end
    while (wait(Sec)) do
      pcall(fn_837)
    end
    return
  end
  fn_392 = function(...)
    fn_836 = function(...)
      while (wait(0.2)) do
        gs_c1_113:SetDesc("Tiers - V4 : " .. (" " .. gs_c1_52.Data.Race.C.Value))
      end
      return
    end
    pcall(fn_836)
    return
  end
  fn_393 = function(...)
    local _,  a1 = ...
    gs_c393_1 = a1
    _G.Lver = gs_c393_1
    return
  end
  fn_394 = function(...)
    fn_835 = function(...)
              _iter = {pairs(workspace.Map["Temple of Time"].GetDescendants(workspace.Map["Temple of Time"]))}
      ::L51991::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L52026
      end
      gs_c835_1 = _loopkey
      gs_c835_2 = _loopval
      if (gs_c835_2.Name == "ProximityPrompt") then
        fireproximityprompt(gs_c835_2, math.huge)
      end
      goto L51991
      ::L52026::
      return
    end
    while (wait(Sec)) do
      if _G.Lver then
        pcall(fn_835)
      end
    end
    return
  end
  fn_395 = function(...)
    local _,  a1 = ...
    gs_c395_1 = a1
    _G.AcientOne = gs_c395_1
    return
  end
  fn_396 = function(...)
    fn_834 = function(...)
                  local _lv1
      local _lm1
      local _ls1
          if not _G.AcientOne then goto L51920 end
      gs_834_1_1 = ({{"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}})[1]
      _iter = 1 - 1
      h51720_0_2 = #gs_834_1_1
      h51720_0_3 = 1
      _lv1 = _iter + h51720_0_3
      _lm1 = h51720_0_2
      _ls1 = h51720_0_3
      ::FOR_51720::
      _lv1 = _lv1 + _ls1
      if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_51720 end
      gs_834f51720_1 = _lv1
      if not ((gs_c1_52.Character:FindFirstChild("RaceEnergy")).Value == 1) then goto L51802 end
      vim1:SendKeyEvent(true, "Y", false, game)
      gs_c1_53.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
      _tp(CFrame.new(-8987.041015625, 215.862060546875, 5886.71044921875))
      local tmp260 = _iter + h51720_0_3
      goto L51914
      ::L51802::
      tmp260 = _iter + h51720_0_3
      if not ((gs_c1_52.Character:FindFirstChild("RaceTransformed")).Value == false) then goto L51914 end
      gs_834_4_1 = GetConnectionEnemies(gs_834_1_1)
      if not gs_834_4_1 then goto L51891 end
      _iter = _iter + h51720_0_3
      h51842_0_2 = h51720_0_2
      h51842_0_3 = h51720_0_3
      ::L51842::
      wait()
      gs_c1_13.Kill(gs_834_4_1, _G.AcientOne)
      local tmp258 = _G.AcientOne == false
      if _G.AcientOne == false then goto L51886 end
      tmp258 = gs_834_4_1.Humanoid.Health <= 0
      if gs_834_4_1.Humanoid.Health <= 0 then goto L51886 end
      tmp258 = not gs_834_4_1.Parent
      ::L51886::
      if tmp258 then goto L51889 end
      goto L51842
      ::L51889::
      local tmp259 = _iter
      goto L51912
      ::L51891::
      _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
      tmp259 = _iter + h51720_0_3
      ::L51912::
      tmp260 = tmp259
      ::L51914::
      goto FOR_51720
      ::FOR_END_51720::
      ::L51920::
      return
    end
    while (wait(Sec)) do
      pcall(fn_834)
    end
    return
  end
  fn_397 = function(...)
            local _t1
        gs_c397_1 = (game:GetService("Players")).LocalPlayer
    local tmp256 = gs_c397_1.Character
    if gs_c397_1.Character then
      tmp256 = gs_c397_1.Character:FindFirstChild("HumanoidRootPart")
    end
    gs_c397_2 = tmp256
    if gs_c397_2 then
      gs_c397_2.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
      local tmp257 = gs_c397_2
    end
    if not ((game:GetService("Workspace")).Map.FindFirstChild((game:GetService("Workspace")).Map, "Temple of Time")) then
    end
    if j51595_0_2 then
      game:GetService("ReplicatedStorage")
      gs_397_2_1 = (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "MapStash")
      if gs_397_2_1 then
      end
      if j51648_0_2 then
        _t1 = gs_397_2_1["Temple of Time"]
        _t1.Parent = workspace.Map
      end
    end
    return
  end
  fn_398 = function(...)
            local _t1
        gs_c398_1 = (game:GetService("Players")).LocalPlayer
    local tmp254 = gs_c398_1.Character
    if gs_c398_1.Character then
      tmp254 = gs_c398_1.Character:FindFirstChild("HumanoidRootPart")
    end
    gs_c398_2 = tmp254
    if gs_c398_2 then
      gs_c398_2.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
      local tmp255 = gs_c398_2
    end
    if not ((game:GetService("Workspace")).Map.FindFirstChild((game:GetService("Workspace")).Map, "Temple of Time")) then
    end
    if j51389_0_2 then
      game:GetService("ReplicatedStorage")
      gs_398_2_1 = (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "MapStash")
      if gs_398_2_1 then
      end
      if j51442_0_2 then
        _t1 = gs_398_2_1["Temple of Time"]
        _t1.Parent = workspace.Map
      end
    end
    task.wait(2)
    tween(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    return
  end
  fn_399 = function(...)
            local _t1
        fn_833 = function(...)
      _tp(gs_c399_4)
      return
    end
    gs_c399_1 = (game:GetService("Players")).LocalPlayer
    local tmp248 = gs_c399_1.Character
    if gs_c399_1.Character then
      tmp248 = gs_c399_1.Character:FindFirstChild("HumanoidRootPart")
    end
    gs_c399_2 = tmp248
    gs_c399_3 = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    gs_c399_4 = CFrame.new(29549, 15069, -88)
    if gs_c399_2 then
      gs_c399_2.CFrame = gs_c399_3
      local tmp249 = gs_c399_2
    end
    task.delay(2, fn_833)
    local tmp250 = not (workspace.Map:FindFirstChild("Temple of Time"))
    if not (workspace.Map:FindFirstChild("Temple of Time")) then
      tmp250 = World3
    end
    if tmp250 then
      game:GetService("ReplicatedStorage")
      gs_399_2_1 = (game:GetService("ReplicatedStorage")).FindFirstChild(game:GetService("ReplicatedStorage"), "MapStash")
      local tmp251 = gs_399_2_1
      if gs_399_2_1 then
        tmp251 = gs_399_2_1:FindFirstChild("Temple of Time")
      end
      if tmp251 then
        _t1 = gs_399_2_1["Temple of Time"]
        _t1.Parent = workspace.Map
        local tmp252 = gs_399_2_1["Temple of Time"]
      end
      local tmp253 = tmp252
    end
    return
  end
  fn_400 = function(...)
    local _,  a1 = ...
    gs_c400_1 = a1
    _G.TPDoor = gs_c400_1
    return
  end
  fn_401 = function(...)
    fn_832 = function(...)
      if not _G.TPDoor then goto L51061 end
      if ((tostring(gs_c1_52.Data.Race.Value)) == "Mink") then
        _tp(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
        goto L51059
      end
      if ((tostring(gs_c1_52.Data.Race.Value)) == "Fishman") then
        _tp(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
        goto L51059
      end
      if ((tostring(gs_c1_52.Data.Race.Value)) == "Cyborg") then
        _tp(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
        goto L51059
      end
      if ((tostring(gs_c1_52.Data.Race.Value)) == "Skypiea") then
        _tp(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
        goto L51059
      end
      if ((tostring(gs_c1_52.Data.Race.Value)) == "Ghoul") then
        _tp(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
        goto L51059
      end
      if not ((tostring(gs_c1_52.Data.Race.Value)) == "Human") then goto L51059 end
      _tp(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
      ::L51059::
      ::L51061::
      return
    end
    while (wait(Sec)) do
      pcall(fn_832)
    end
    return
  end
  fn_402 = function(...)
    local _,  a1 = ...
    gs_c402_1 = a1
    _G.Complete_Trials = gs_c402_1
    return
  end
  fn_403 = function(...)
          if not (workspace.Map:FindFirstChild("FishmanTrial")) then return end
    if (workspace._WorldOrigin.Locations:FindFirstChild("Trial of Water")) then
      FishmanTrial = workspace._WorldOrigin.Locations:FindFirstChild("Trial of Water")
    end
    if not FishmanTrial then goto L50777 end
    for _key, item in pairs(workspace.SeaBeasts:GetChildren()) do
      gs_403_3_1 = _key
      gs_403_3_2 = item
      local tmp247 = gs_403_3_2:FindFirstChild("HumanoidRootPart")
      if (gs_403_3_2:FindFirstChild("HumanoidRootPart")) then
      tmp247 = (gs_403_3_2.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500
      end
      if tmp247 then
      if (gs_403_3_2.Health.Value > 0) then return {gs_403_3_2} end
      end
    end
    ::L50777::
    return
  end
  fn_404 = function(...)
    fn_831 = function(...)
      if _G.Complete_Trials then
        if ((tostring(gs_c1_52.Data.Race.Value)) == "Mink") then
          notween(workspace.Map.MinkTrial.Ceiling.CFrame * (CFrame.new(0, -20, 0)))
        end
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_831)
    end
    return
  end
  fn_405 = function(...)
    fn_829 = function(...)
          fn_830 = function(...)
        _tp(CFrame.new((GetSeaBeastTrial()).HumanoidRootPart.Position.X, (game:GetService("Workspace")).Map["WaterBase-Plane"].Position.Y + 300, (GetSeaBeastTrial()).HumanoidRootPart.Position.Z))
        return
      end
      if not _G.Complete_Trials then goto L50465 end
      if not ((tostring(gs_c1_52.Data.Race.Value)) == "Fishman") then goto L50463 end
      if not (GetSeaBeastTrial()) then goto L50461 end
      ::L50294::
      task.wait()
      spawn(fn_830)
      MousePos = (GetSeaBeastTrial()).HumanoidRootPart.Position
      Useskills("Melee", "Z")
      Useskills("Melee", "X")
      Useskills("Melee", "C")
      wait(0.1)
      Useskills("Sword", "Z")
      Useskills("Sword", "X")
      wait(0.1)
      Useskills("Blox Fruit", "Z")
      Useskills("Blox Fruit", "X")
      Useskills("Blox Fruit", "C")
      wait(0.1)
      Useskills("Gun", "Z")
      Useskills("Gun", "X")
      local tmp246 = _G.Complete_Trials == false
      if not (_G.Complete_Trials == false) then
        tmp246 = not (GetSeaBeastTrial())
      end
      if not (tmp246) then
        goto L50294
      end
      ::L50461::
      ::L50463::
      ::L50465::
      return
    end
    while (wait(Sec)) do
      pcall(fn_829)
    end
    return
  end
  fn_406 = function(...)
    fn_828 = function(...)
      if _G.Complete_Trials then
        if ((tostring(gs_c1_52.Data.Race.Value)) == "Cyborg") then
          _tp(workspace.Map.CyborgTrial.Floor.CFrame * (CFrame.new(0, 500, 0)))
        end
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_828)
    end
    return
  end
  fn_407 = function(...)
    fn_827 = function(...)
      if _G.Complete_Trials then
        if ((tostring(gs_c1_52.Data.Race.Value)) == "Skypiea") then
          notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
        end
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_827)
    end
    return
  end
  fn_408 = function(...)
    fn_826 = function(...)
              if not _G.Complete_Trials then goto L50071 end
      local tmp244 = (tostring(gs_c1_52.Data.Race.Value)) == "Human"
      if not ((tostring(gs_c1_52.Data.Race.Value)) == "Human") then
        tmp244 = (tostring(gs_c1_52.Data.Race.Value)) == "Ghoul"
      end
      if not tmp244 then goto L50069 end
      gs_826_2_1 = ({{"Ancient Vampire", "Ancient Zombie"}})[1]
      gs_826_2_2 = GetConnectionEnemies(gs_826_2_1)
      if not gs_826_2_2 then goto L50067 end
      ::L50018::
      wait()
      gs_c1_13.Kill(gs_826_2_2, _G.Complete_Trials)
      local tmp245 = _G.Complete_Trials == false
      if _G.Complete_Trials == false then goto L50062 end
      tmp245 = not gs_826_2_2.Parent
      if not gs_826_2_2.Parent then goto L50062 end
      tmp245 = gs_826_2_2.Humanoid.Health <= 0
      ::L50062::
      if not (tmp245) then
        goto L50018
      end
      ::L50067::
      ::L50069::
      ::L50071::
      return
    end
    while (wait(0.1)) do
      pcall(fn_826)
    end
    return
  end
  fn_409 = function(...)
    local _,  a1 = ...
    gs_c409_1 = a1
    _G.Defeating = gs_c409_1
    return
  end
  fn_410 = function(...)
    fn_825 = function(...)
                      if not _G.Defeating then goto L49907 end
      for _key, item in pairs(workspace.Characters:GetChildren()) do
        gs_825_1_1 = _key
        gs_825_1_2 = item
        if not (gs_825_1_2.Name ~= gs_root_52.Name) then goto L49901 end
        local tmp242 = gs_825_1_2.Humanoid.Health > 0
        if not (gs_825_1_2.Humanoid.Health > 0) then goto L49775 end
        tmp242 = gs_825_1_2:FindFirstChild("HumanoidRootPart")
        if not (gs_825_1_2:FindFirstChild("HumanoidRootPart")) then goto L49775 end
        tmp242 = gs_825_1_2.Parent
        if not gs_825_1_2.Parent then goto L49775 end
        tmp242 = (Root.Position - gs_825_1_2.HumanoidRootPart.Position).Magnitude <= 250
        ::L49775::
        if not tmp242 then goto L49899 end
        ::L49778::
        task.wait()
        EquipWeapon(_G.SelectWeapon)
        _tp(gs_825_1_2.HumanoidRootPart.CFrame * (CFrame.new(0, 0, 15)))
        sethiddenproperty(gs_root_52, "SimulationRadius", math.huge)
        local tmp243 = _G.Defeating == false
        if _G.Defeating == false then goto L49894 end
        tmp243 = gs_825_1_2.Humanoid.Health <= 0
        if gs_825_1_2.Humanoid.Health <= 0 then goto L49894 end
        tmp243 = not gs_825_1_2.Parent
        if not gs_825_1_2.Parent then goto L49894 end
        tmp243 = not (gs_825_1_2:FindFirstChild("HumanoidRootPart"))
        if not (gs_825_1_2:FindFirstChild("HumanoidRootPart")) then goto L49894 end
        tmp243 = not (gs_825_1_2:FindFirstChild("Humanoid"))
        ::L49894::
        if not (tmp243) then
        goto L49778
        end
        ::L49899::
        ::L49901::
      end
      ::L49907::
      return
    end
    while (task.wait(Sec)) do
      pcall(fn_825)
    end
    return
  end
  fn_411 = function(...)
    gs_c411_1 = ({{"CraftItem", "Craft", "Dragonheart"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c411_1))
    return
  end
  fn_412 = function(...)
    gs_c412_1 = ({{"CraftItem", "Craft", "Dragonstorm"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c412_1))
    return
  end
  fn_413 = function(...)
    gs_c413_1 = ({{"CraftItem", "Craft", "DinoHood"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c413_1))
    return
  end
  fn_414 = function(...)
    gs_c414_1 = ({{"CraftItem", "Craft", "TRexSkull"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c414_1))
    return
  end
  fn_415 = function(...)
      while (wait(0.2)) do
      local tmp241 = workspace.Map:FindFirstChild("PrehistoricIsland")
      if not (workspace.Map:FindFirstChild("PrehistoricIsland")) then
        tmp241 = workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")
      end
      if tmp241 then
        gs_c1_114:SetDesc("Prehistoric Island : True")
      else
        gs_c1_114:SetDesc("Prehistoric Island : False")
      end
    end
    return
  end
  fn_416 = function(...)
    gs_c416_1 = (game:GetService("ReplicatedStorage")).Modules.Net["RF/Craft"]
    gs_c416_1:InvokeServer("PossibleHardcode", "Volcanic Magnet")
    return
  end
  fn_417 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c417_1 = a1
    _t1 = getgenv()
    _t1.AutoCraftVolcanic = gs_c417_1
    return
  end
  fn_418 = function(...)
    local _t1
      fn_824 = function(...)
      gs_c418_1:InvokeServer("PossibleHardcode", "Volcanic Magnet")
      return
    end
    gs_c418_1 = (game:GetService("ReplicatedStorage")).Modules.Net["RF/Craft"]
    while (task.wait(0.3)) do
      if (getgenv()).AutoCraftVolcanic then
        pcall(fn_824)
        _t1 = getgenv()
        _t1.AutoCraftVolcanic = false
        local tmp240 = getgenv()
      end
    end
    return
  end
  fn_419 = function(...)
    local _,  a1 = ...
    gs_c419_1 = a1
    _G.Prehis_Find = gs_c419_1
    return
  end
  fn_420 = function(...)
    fn_823 = function(...)
                      if not _G.Prehis_Find then goto L49185 end
      gs_823_1_1 = gs_c1_52.Character
      if not gs_823_1_1 then return end
      gs_823_1_2 = gs_823_1_1:FindFirstChild("HumanoidRootPart")
      gs_823_1_3 = gs_823_1_1:FindFirstChild("Humanoid")
      local tmp237 = not gs_823_1_2
      if not gs_823_1_2 then goto L48735 end
      tmp237 = not gs_823_1_3
      if not gs_823_1_3 then goto L48735 end
      tmp237 = gs_823_1_3.Health <= 0
      ::L48735::
      if tmp237 then return end
      gs_823_1_4 = workspace._WorldOrigin.Locations
      gs_823_1_5 = gs_823_1_4:FindFirstChild("Prehistoric Island", true)
      if not not gs_823_1_5 then goto L48986 end
      gs_823_4_1 = CheckBoat()
      if not gs_823_4_1 then
        gs_823_5_1 = CFrame.new(-16927.451, 9.086, 433.864)
        TeleportToTarget(gs_823_5_1)
        if ((gs_823_5_1.Position - gs_823_1_2.Position).Magnitude <= 10) then
          if not (_G.SelectedBoat) then
          end
          gs_c1_53.Remotes.CommF_:InvokeServer("BuyBoat", j48849_1_3)
        end
        return
      end
      if (gs_823_1_3.Sit == false) then
        gs_823_7_1 = gs_823_4_1.VehicleSeat.CFrame * (CFrame.new(0, 1, 0))
        _tp(gs_823_7_1)
        return
      end
      gs_823_4_2 = CFrame.new(-10000000, 31, 37016.25)
      gs_c1_115 = gs_823_4_2
      local tmp238 = CheckEnemiesBoat()
      if CheckEnemiesBoat() then goto L48950 end
      tmp238 = CheckTerrorShark()
      if CheckTerrorShark() then goto L48950 end
      tmp238 = CheckPirateGrandBrigade()
      ::L48950::
      if tmp238 then
        _tp(CFrame.new(-10000000, 150, 37016.25))
      else
        _tp(gs_823_4_2)
      end
      goto L49183
      ::L48986::
      local tmp239 = gs_823_1_5:FindFirstChild("HeadTeleport", true)
      if gs_823_1_5:FindFirstChild("HeadTeleport", true) then goto L49036 end
      tmp239 = gs_823_1_5:FindFirstChild("Teleport_Head", true)
      if gs_823_1_5:FindFirstChild("Teleport_Head", true) then goto L49036 end
      tmp239 = gs_823_1_5:FindFirstChild("Head", true)
      ::L49036::
      gs_823_10_1 = tmp239
      if gs_823_10_1 then
        gs_823_11_1 = gs_823_10_1.CFrame
        gs_823_11_2 = (gs_823_11_1.Position - (gs_823_11_1.LookVector * 40)) + (Vector3.new(0, 20, 0))
        if ((gs_823_11_2 - gs_823_1_2.Position).Magnitude > 30) then
          _tp(CFrame.new(gs_823_11_2))
        end
      else
        gs_823_13_1 = gs_823_1_5.CFrame.Position
        gs_823_13_2 = (gs_823_13_1 - gs_823_1_2.Position).Unit
        gs_823_13_3 = (gs_823_13_1 - (gs_823_13_2 * 250)) + (Vector3.new(0, 60, 0))
        _tp(CFrame.new(gs_823_13_3))
      end
      ::L49183::
      ::L49185::
      return
    end
    while (wait(Sec)) do
      pcall(fn_823)
    end
    return
  end
  fn_421 = function(...)
    local _,  a1 = ...
    gs_c421_1 = a1
    _G.AutoStartPrehistoric = gs_c421_1
    return
  end
  fn_422 = function(...)
    fn_822 = function(...)
          gs_c822_1 = workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true)
      if gs_c822_1 then
        if (workspace.Map:FindFirstChild("PrehistoricIsland", true)) then
          gs_822_2_1 = workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt", true)
          local tmp236 = gs_822_2_1
          if gs_822_2_1 then
            tmp236 = gs_822_2_1:FindFirstChild("ProximityPrompt")
          end
          if tmp236 then
            if ((gs_c1_52:DistanceFromCharacter(gs_822_2_1.CFrame.Position)) <= 150) then
              fireproximityprompt(gs_822_2_1.ProximityPrompt, math.huge)
              vim1:SendKeyEvent(true, "E", false, game)
              wait(1.5)
              vim1:SendKeyEvent(false, "E", false, game)
            end
            _tp(gs_822_2_1.CFrame)
          end
        end
      end
      return
    end
    while (wait()) do
      if _G.AutoStartPrehistoric then
        pcall(fn_822)
      end
    end
    return
  end
  fn_423 = function(...)
    local _,  a1 = ...
    gs_c423_1 = a1
    _G.Prehis_Skills = gs_c423_1
    return
  end
  fn_424 = function(...)
    fn_821 = function(...)
                                      gs_c821_1 = workspace.Map:FindFirstChild("PrehistoricIsland")
      if not gs_c821_1 then return end
      _iter = {pairs(gs_c821_1.GetDescendants(gs_c821_1))}
      ::L48134::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L48223
      end
      gs_c821_1 = _loopkey
      gs_c821_2 = _loopval
      local tmp232 = gs_c821_2:IsA("BasePart")
      if not (gs_c821_2:IsA("BasePart")) then
        tmp232 = gs_c821_2:IsA("MeshPart")
      end
      local tmp233 = tmp232
      if tmp232 then
        gs_c821_2.Name.lower(gs_c821_2.Name)
        tmp233 = (gs_c821_2.Name.lower(gs_c821_2.Name)).find(gs_c821_2.Name.lower(gs_c821_2.Name), "lava")
      end
      if tmp233 then
        gs_c821_2.Destroy(gs_c821_2)
      end
      goto L48134
      ::L48223::
      gs_821_2_2 = gs_821_2_1:FindFirstChild("Core")
      if gs_821_2_2 then
        gs_821_4_1 = gs_821_2_2:FindFirstChild("InteriorLava")
        if gs_821_4_1 then
          gs_821_4_1.Destroy(gs_821_4_1)
        end
      end
      gs_821_2_3 = gs_821_2_1:FindFirstChild("TrialTeleport")
      _iter = {pairs(gs_821_2_1.GetDescendants(gs_821_2_1))}
      ::L48327::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L48387
      end
      gs_821_2_1 = _loopkey
      gs_821_2_2 = _loopval
      local tmp235 = gs_821_2_2.Name == "TouchInterest"
      if (gs_821_2_2.Name == "TouchInterest") then
        local tmp234 = gs_c821_3
        if gs_c821_3 then
          tmp234 = gs_821_2_2:IsDescendantOf(gs_c821_3)
        end
        tmp235 = not tmp234
      end
      if tmp235 then
        gs_821_2_2.Parent.Destroy(gs_821_2_2.Parent)
      end
      goto L48327
      ::L48387::
      return
    end
    while (wait(0.3)) do
      if _G.Prehis_Skills then
        pcall(fn_821)
      end
    end
    return
  end
  fn_425 = function(...)
    fn_820 = function(...)
              gs_c820_1 = GetConnectionEnemies("Lava Golem")
      local tmp230 = gs_c820_1
      if gs_c820_1 then
        tmp230 = gs_c820_1:FindFirstChild("Humanoid")
      end
      if not tmp230 then goto L48050 end
      ::L47989::
      wait(0.1)
      gs_c1_13.Kill(gs_c820_1, true)
      gs_c820_1.Humanoid.ChangeState(gs_c820_1.Humanoid, 15)
      local tmp231 = not _G.Prehis_Skills
      if not _G.Prehis_Skills then goto L48045 end
      tmp231 = not gs_c820_1.Parent
      if not gs_c820_1.Parent then goto L48045 end
      tmp231 = gs_c820_1.Humanoid.Health <= 0
      ::L48045::
      if not (tmp231) then
        goto L47989
      end
      ::L48050::
      return
    end
    while (wait(Sec)) do
      if _G.Prehis_Skills then
        pcall(fn_820)
      end
    end
    return
  end
  fn_426 = function(...)
    fn_819 = function(...)
                              gs_c819_1 = workspace.Map:FindFirstChild("PrehistoricIsland")
      if not gs_c819_1 then return end
      gs_c819_2 = gs_c819_1:FindFirstChild("Core")
      if not gs_c819_2 then return end
      gs_c819_3 = gs_c819_2:FindFirstChild("VolcanoRocks")
      if not gs_c819_3 then return end
      for _key, item in pairs(gs_c819_3:GetChildren()) do
        gs_c819_1 = _key
        gs_c819_2 = item
        gs_c819_3 = gs_c819_2:FindFirstChild("VFXLayer")
        local tmp226 = gs_c819_3
        if gs_c819_3 then
        tmp226 = gs_c819_3:FindFirstChild("At0")
        end
        gs_c819_4 = tmp226
        local tmp227 = gs_c819_4
        if gs_c819_4 then
        tmp227 = gs_c819_4:FindFirstChild("Glow")
        end
        gs_c819_5 = tmp227
        local tmp228 = gs_c819_5
        if gs_c819_5 then
        tmp228 = gs_c819_5.Enabled
        end
        if not tmp228 then goto L47915 end
        ::L47754::
        wait(0.1)
        _tp(gs_c819_3.CFrame)
        if ((gs_root_52:DistanceFromCharacter(gs_c819_3.CFrame.Position)) <= 150) then
        MousePos = gs_c819_3.CFrame.Position
        Useskills("Melee", "Z")
        wait(0.4)
        Useskills("Melee", "X")
        wait(0.4)
        Useskills("Melee", "C")
        wait(0.4)
        Useskills("Blox Fruit", "Z")
        wait(0.4)
        Useskills("Blox Fruit", "X")
        wait(0.4)
        Useskills("Blox Fruit", "C")
        end
        local tmp229 = not _G.Prehis_Skills
        if _G.Prehis_Skills then
        tmp229 = not gs_c819_5.Enabled
        end
        if not (tmp229) then
        goto L47754
        end
        ::L47915::
      end
      return
    end
    while (wait(Sec)) do
      if _G.Prehis_Skills then
        pcall(fn_819)
      end
    end
    return
  end
  fn_427 = function(...)
    local _,  a1 = ...
    gs_c427_1 = a1
    _G.KillAuraFull = gs_c427_1
    return
  end
  fn_428 = function(...)
    fn_818 = function(...)
                          local _t2
      local _t3
      gs_c818_1 = game.Players.LocalPlayer
      gs_c818_2 = gs_c818_1.Character
      local tmp223 = gs_c818_2
      if gs_c818_2 then
        tmp223 = gs_c818_2:FindFirstChild("HumanoidRootPart")
      end
      gs_c818_3 = tmp223
      if not gs_c818_3 then return end
      sethiddenproperty(gs_c818_1, "SimulationRadius", math.huge)
      for _key, item in pairs(workspace.Enemies:GetChildren()) do
        gs_c818_1 = _key
        gs_c818_2 = item
        local tmp224 = gs_c818_2:FindFirstChild("Humanoid")
        if (gs_c818_2:FindFirstChild("Humanoid")) then
        tmp224 = gs_c818_2:FindFirstChild("HumanoidRootPart")
        end
        if tmp224 then
        gs_818_3_1 = (gs_c818_2.HumanoidRootPart.Position - gs_428_2_3.Position).Magnitude
        local tmp225 = gs_818_3_1 <= gs_root_116
        if (gs_818_3_1 <= gs_root_116) then
        tmp225 = gs_c818_2.Humanoid.Health > 0
        end
        if tmp225 then
        _t2 = gs_c818_2.Humanoid
        _t2.Health = 0
        _t3 = gs_c818_2.HumanoidRootPart
        _t3.CanCollide = false
        gs_c818_2.BreakJoints(gs_c818_2)
        end
        end
      end
      return
    end
    while (task.wait(gs_c1_117)) do
      if _G.KillAuraFull then
        pcall(fn_818)
      end
    end
    return
  end
  fn_429 = function(...)
    local _,  a1 = ...
    gs_c429_1 = a1
    _G.Prehis_DB = gs_c429_1
    return
  end
  fn_430 = function(...)
    fn_817 = function(...)
              if not _G.Prehis_DB then goto L47279 end
      if not (workspace:FindFirstChild("DinoBone")) then goto L47277 end
      for _key, item in pairs(workspace:GetChildren()) do
        gs_817_2_1 = _key
        gs_817_2_2 = item
        if (gs_817_2_2.Name == "DinoBone") then
        _tp(gs_817_2_2.CFrame)
        end
      end
      ::L47277::
      ::L47279::
      return
    end
    while (wait(Sec)) do
      pcall(fn_817)
    end
    return
  end
  fn_431 = function(...)
    local _,  a1 = ...
    gs_c431_1 = a1
    _G.Prehis_DE = gs_c431_1
    return
  end
  fn_432 = function(...)
    fn_816 = function(...)
      if _G.Prehis_DE then
        if (workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg")) then
          _tp((workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg")).Molten.CFrame)
          fireproximityprompt(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs.DragonEgg.Molten.ProximityPrompt, 30)
        end
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_816)
    end
    return
  end
  fn_433 = function(...)
    local _,  a1 = ...
    gs_c433_1 = a1
    _G.ResetPH = gs_c433_1
    return
  end
  fn_434 = function(...)
    fn_815 = function(...)
          local _t1
      if not _G.ResetPH then goto L47031 end
      gs_815_1_1 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
      local tmp220 = gs_815_1_1
      if gs_815_1_1 then
        tmp220 = gs_815_1_1:FindFirstChild("TouchInterest")
      end
      if tmp220 then
        _t1 = gs_c1_52.Character.Humanoid
        _t1.Health = 0
        local tmp221 = gs_c1_52.Character.Humanoid
        goto L47029
      end
      if not (workspace:FindFirstChild("DinoBone")) then goto L47028 end
      _iter = {pairs(workspace:GetChildren())}
      ::L46992::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L47025
      end
      gs_815_4_1 = _loopkey
      gs_815_4_2 = _loopval
      if (gs_815_4_2.Name == "DinoBone") then
        _tp(gs_815_4_2.CFrame)
      end
      goto L46992
      ::L47025::
      ::L47028::
      ::L47029::
      local tmp222 = tmp221
      ::L47031::
      return
    end
    while (wait(Sec)) do
      pcall(fn_815)
    end
    return
  end
  fn_435 = function(...)
    (game:GetService("Lighting")).BaseAtmosphere.Destroy((game:GetService("Lighting")).BaseAtmosphere)
    return
  end
  fn_436 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c436_1 = a1
    _t1 = getgenv()
    _t1.SpeedBoat = gs_c436_1
    return
  end
  fn_437 = function(...)
            if not (getgenv()).SpeedBoat then goto L46820 end
    gs_437_1_1 = (game:GetService("Players")).LocalPlayer
    local tmp218 = gs_437_1_1.Character
    if gs_437_1_1.Character then
      tmp218 = gs_437_1_1.Character.FindFirstChild(gs_437_1_1.Character, "Humanoid")
    end
    if not tmp218 then goto L46818 end
    if not gs_437_1_1.Character.Humanoid.Sit then goto L46816 end
    _iter = {pairs((game:GetService("Workspace")).Boats.GetChildren((game:GetService("Workspace")).Boats))}
    ::L46770::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L46813
    end
    gs_437_3_1 = _loopkey
    gs_437_3_2 = _loopval
    gs_437_3_3 = gs_437_3_2:FindFirstChildWhichIsA("VehicleSeat")
    if gs_437_3_3 then
      gs_437_3_3.MaxSpeed = SetSpeedBoat
      local tmp219 = gs_437_3_3
    end
    goto L46770
    ::L46813::
    ::L46816::
    ::L46818::
    ::L46820::
    return
  end
  fn_438 = function(...)
    local _,  a1 = ...
    gs_c438_1 = a1
    SetSpeedBoat = gs_c438_1
    return
  end
  fn_439 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c439_1 = a1
    _t1 = getgenv()
    _t1.AutoPressW = gs_c439_1
    return
  end
  fn_440 = function(...)
    fn_814 = function(...)
      if (getgenv()).AutoPressW then
        gs_814_1_1 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        if (gs_814_1_1.Sit == true) then
          game:GetService("VirtualInputManager")
          (game:GetService("VirtualInputManager")).SendKeyEvent(game:GetService("VirtualInputManager"), true, "W", false, game)
        end
      end
      return
    end
    while (wait()) do
      pcall(fn_814)
    end
    return
  end
  fn_441 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c441_1 = a1
    _t1 = getgenv()
    _t1.NoClipShip = gs_c441_1
    return
  end
  fn_442 = function(...)
    fn_813 = function(...)
                                  _iter = {pairs((game:GetService("Workspace")).Boats.GetChildren((game:GetService("Workspace")).Boats))}
      ::L46419::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L46522
      end
      gs_c813_1 = _loopkey
      gs_c813_2 = _loopval
      _iter = {pairs(gs_c813_2.GetDescendants(gs_c813_2))}
      ::L46451::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L46518
      end
      gs_c813_1 = _loopkey
      gs_c813_2 = _loopval
      if (gs_c813_2:IsA("BasePart")) then
        local tmp215 = (getgenv()).NoClipShip
        if not ((getgenv()).NoClipShip) then
          tmp215 = (getgenv()).FindPrehistoric
        end
        if tmp215 then
          gs_c813_2.CanCollide = false
          local tmp216 = gs_c813_2
        else
          gs_c813_2.CanCollide = true
          tmp216 = gs_c813_2
        end
        local tmp217 = tmp216
      end
      goto L46451
      ::L46518::
      goto L46419
      ::L46522::
      return
    end
    while (wait()) do
      pcall(fn_813)
    end
    return
  end
  fn_443 = function(...)
    gs_c443_1 = ({{"CraftItem", "Craft", "SharkTooth"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c443_1))
    return
  end
  fn_444 = function(...)
    gs_c444_1 = ({{"CraftItem", "Craft", "TerrorJaw"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c444_1))
    return
  end
  fn_445 = function(...)
    gs_c445_1 = ({{"CraftItem", "Craft", "SharkAnchor"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c445_1))
    return
  end
  fn_446 = function(...)
    gs_c446_1 = ({{"CraftItem", "Craft", "LeviathanCrown"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c446_1))
    return
  end
  fn_447 = function(...)
    gs_c447_1 = ({{"CraftItem", "Craft", "LeviathanShield"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c447_1))
    return
  end
  fn_448 = function(...)
    gs_c448_1 = ({{"CraftItem", "Craft", "LeviathanBoat"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c448_1))
    return
  end
  fn_449 = function(...)
    gs_c449_1 = ({{"CraftItem", "Craft", "LegendaryScroll"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c449_1))
    return
  end
  fn_450 = function(...)
    gs_c450_1 = ({{"CraftItem", "Craft", "MythicalScroll"}})[1]
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_c450_1))
    return
  end
  fn_451 = function(...)
    local _,  a1 = ...
    gs_c451_1 = a1
    _G.SelectedBoat = gs_c451_1
    return
  end
  fn_452 = function(...)
    gs_c1_53.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
    return
  end
  fn_453 = function(...)
    local _,  a1 = ...
    gs_c453_1 = a1
    _G.DangerSc = gs_c453_1
    return
  end
  fn_454 = function(...)
    local _,  a1 = ...
    gs_c454_1 = a1
    _G.SailBoats = gs_c454_1
    return
  end
  fn_455 = function(...)
    fn_812 = function(...)
          local _t1
              gs_c812_1 = CheckBoat()
      local tmp189 = not gs_c812_1
      if not not gs_c812_1 then goto L45092 end
      local tmp180 = CheckShark()
      if (CheckShark()) then
        tmp180 = _G.Shark
      end
      local tmp183 = tmp180
      if tmp180 then goto L44991 end
      local tmp181 = CheckTerrorShark()
      if (CheckTerrorShark()) then
        tmp181 = _G.TerrorShark
      end
      tmp183 = tmp181
      if tmp181 then goto L44991 end
      local tmp182 = CheckFishCrew()
      if (CheckFishCrew()) then
        tmp182 = _G.MobCrew
      end
      tmp183 = tmp182
      if tmp182 then goto L44991 end
      tmp183 = CheckPiranha()
      if not (CheckPiranha()) then goto L44991 end
      tmp183 = _G.Piranha
      ::L44991::
      tmp189 = not tmp183
      if not not tmp183 then goto L45092 end
      local tmp184 = CheckEnemiesBoat()
      if (CheckEnemiesBoat()) then
        tmp184 = _G.FishBoat
      end
      tmp189 = not tmp184
      if not not tmp184 then goto L45092 end
      local tmp185 = CheckSeaBeast()
      if (CheckSeaBeast()) then
        tmp185 = _G.SeaBeast1
      end
      tmp189 = not tmp185
      if not not tmp185 then goto L45092 end
      local tmp186 = _G.PGB
      if _G.PGB then
        tmp186 = CheckPirateGrandBrigade()
      end
      tmp189 = not tmp186
      if not not tmp186 then goto L45092 end
      local tmp187 = _G.HCM
      if _G.HCM then
        tmp187 = CheckHauntedCrew()
      end
      tmp189 = not tmp187
      if not not tmp187 then goto L45092 end
      local tmp188 = _G.Leviathan1
      if _G.Leviathan1 then
        tmp188 = CheckLeviathan()
      end
      tmp189 = not tmp188
      ::L45092::
      if tmp189 then
        gs_812_1_1 = CFrame.new(-16927.451, 9.086, 433.864)
        TeleportToTarget(gs_812_1_1)
        if ((gs_812_1_1.Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10) then
          gs_c1_53.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
        end
        goto L45868
      end
      local tmp199 = gs_c812_1
      if not gs_c812_1 then goto L45339 end
      local tmp190 = CheckShark()
      if (CheckShark()) then
        tmp190 = _G.Shark
      end
      local tmp193 = tmp190
      if tmp190 then goto L45238 end
      local tmp191 = CheckTerrorShark()
      if (CheckTerrorShark()) then
        tmp191 = _G.TerrorShark
      end
      tmp193 = tmp191
      if tmp191 then goto L45238 end
      local tmp192 = CheckFishCrew()
      if (CheckFishCrew()) then
        tmp192 = _G.MobCrew
      end
      tmp193 = tmp192
      if tmp192 then goto L45238 end
      tmp193 = CheckPiranha()
      if not (CheckPiranha()) then goto L45238 end
      tmp193 = _G.Piranha
      ::L45238::
      tmp199 = not tmp193
      if not not tmp193 then goto L45339 end
      local tmp194 = CheckEnemiesBoat()
      if (CheckEnemiesBoat()) then
        tmp194 = _G.FishBoat
      end
      tmp199 = not tmp194
      if not not tmp194 then goto L45339 end
      local tmp195 = CheckSeaBeast()
      if (CheckSeaBeast()) then
        tmp195 = _G.SeaBeast1
      end
      tmp199 = not tmp195
      if not not tmp195 then goto L45339 end
      local tmp196 = _G.PGB
      if _G.PGB then
        tmp196 = CheckPirateGrandBrigade()
      end
      tmp199 = not tmp196
      if not not tmp196 then goto L45339 end
      local tmp197 = _G.HCM
      if _G.HCM then
        tmp197 = CheckHauntedCrew()
      end
      tmp199 = not tmp197
      if not not tmp197 then goto L45339 end
      local tmp198 = _G.Leviathan1
      if _G.Leviathan1 then
        tmp198 = CheckLeviathan()
      end
      tmp199 = not tmp198
      ::L45339::
      if not tmp199 then goto L45868 end
      if (gs_c1_52.Character.Humanoid.Sit == false) then
        gs_812_4_1 = gs_c812_1.VehicleSeat.CFrame * (CFrame.new(0, 1, 0))
        _tp(gs_812_4_1)
        goto L45866
      end
      if (_G.DangerSc == "Lv 1") then
        CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
        goto L45564
      end
      if (_G.DangerSc == "Lv 2") then
        CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
        goto L45564
      end
      if (_G.DangerSc == "Lv 3") then
        CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
        goto L45564
      end
      if (_G.DangerSc == "Lv 4") then
        CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
        goto L45564
      end
      if (_G.DangerSc == "Lv 5") then
        CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
        goto L45564
      end
      if (_G.DangerSc == "Lv 6") then
        CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
        goto L45564
      end
      if not (_G.DangerSc == "Lv Infinite") then goto L45564 end
      CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
      ::L45564::
      wait()
      local tmp200 = not _G.FishBoat
      if not _G.FishBoat then
        tmp200 = CheckEnemiesBoat()
      end
      local tmp202 = tmp200
      if tmp200 then goto L45626 end
      local tmp201 = not _G.PGB
      if not _G.PGB then
        tmp201 = CheckPirateGrandBrigade()
      end
      tmp202 = tmp201
      if tmp201 then goto L45626 end
      tmp202 = not _G.TerrorShark
      if not not _G.TerrorShark then goto L45626 end
      tmp202 = CheckTerrorShark()
      ::L45626::
      if tmp202 then
        _tp(CFrameSelectedZone * (CFrame.new(0, 150, 0)))
      else
        _tp(CFrameSelectedZone)
      end
      local tmp212 = _G.SailBoats == false
      if _G.SailBoats == false then goto L45854 end
      local tmp203 = CheckShark()
      if (CheckShark()) then
        tmp203 = _G.Shark
      end
      local tmp206 = tmp203
      if tmp203 then goto L45742 end
      local tmp204 = CheckTerrorShark()
      if (CheckTerrorShark()) then
        tmp204 = _G.TerrorShark
      end
      tmp206 = tmp204
      if tmp204 then goto L45742 end
      local tmp205 = CheckFishCrew()
      if (CheckFishCrew()) then
        tmp205 = _G.MobCrew
      end
      tmp206 = tmp205
      if tmp205 then goto L45742 end
      tmp206 = CheckPiranha()
      if not (CheckPiranha()) then goto L45742 end
      tmp206 = _G.Piranha
      ::L45742::
      tmp212 = tmp206
      if tmp206 then goto L45854 end
      local tmp207 = CheckSeaBeast()
      if (CheckSeaBeast()) then
        tmp207 = _G.SeaBeast1
      end
      tmp212 = tmp207
      if tmp207 then goto L45854 end
      local tmp208 = CheckEnemiesBoat()
      if (CheckEnemiesBoat()) then
        tmp208 = _G.FishBoat
      end
      tmp212 = tmp208
      if tmp208 then goto L45854 end
      local tmp209 = _G.Leviathan1
      if _G.Leviathan1 then
        tmp209 = CheckLeviathan()
      end
      tmp212 = tmp209
      if tmp209 then goto L45854 end
      local tmp210 = _G.HCM
      if _G.HCM then
        tmp210 = CheckHauntedCrew()
      end
      tmp212 = tmp210
      if tmp210 then goto L45854 end
      local tmp211 = _G.PGB
      if _G.PGB then
        tmp211 = CheckPirateGrandBrigade()
      end
      tmp212 = tmp211
      if tmp211 then goto L45854 end
      tmp212 = (gs_c1_52.Character:WaitForChild("Humanoid")).Sit == false
      ::L45854::
      if not (tmp212) then
        goto L45564
      end
      _t1 = gs_c1_52.Character.Humanoid
      _t1.Sit = false
      local tmp213 = gs_c1_52.Character.Humanoid
      ::L45866::
      local tmp214 = tmp213
      ::L45868::
      return
    end
    while (wait()) do
      if _G.SailBoats then
        pcall(fn_812)
      end
    end
    return
  end
  fn_456 = function(...)
    fn_811 = function(...)
                                  for _key, item in pairs(workspace.Boats:GetChildren()) do
                                    gs_c811_1 = _key
                                    gs_c811_2 = item
                                    _iter = {pairs(workspace.Boats[gs_c811_2.Name].GetDescendants(workspace.Boats[gs_c811_2.Name]))}
                                    ::L44787::
                                    _k2 = {_loopkey(_loopval, _loopstate)}
                                    _loopstate = _k2[1]
                                    if not (_k2[1] == nil) then
                                    goto L44865
                                    end
                                    gs_c811_1 = _loopkey
                                    gs_c811_2 = _loopval
                                    if not (gs_c811_2:IsA("BasePart")) then goto L44862 end
                                    local tmp177 = _G.SailBoats
                                    if _G.SailBoats then goto L44845 end
                                    tmp177 = _G.Prehis_Find
                                    if _G.Prehis_Find then goto L44845 end
                                    tmp177 = _G.FindMirage
                                    if _G.FindMirage then goto L44845 end
                                    tmp177 = _G.SailBoat_Hydra
                                    if _G.SailBoat_Hydra then goto L44845 end
                                    tmp177 = _G.AutofindKitIs
                                    ::L44845::
                                    if tmp177 then
                                    gs_c811_2.CanCollide = false
                                    local tmp178 = gs_c811_2
                                    else
                                    gs_c811_2.CanCollide = true
                                    tmp178 = gs_c811_2
                                    end
                                    local tmp179 = tmp178
                                    ::L44862::
                                    goto L44787
                                    ::L44865::
                                  end
      return
    end
    while (wait(Sec)) do
      pcall(fn_811)
    end
    return
  end
  fn_457 = function(...)
    local _,  a1 = ...
    gs_c457_1 = a1
    _G.Shark = gs_c457_1
    return
  end
  fn_458 = function(...)
    local _,  a1 = ...
    gs_c458_1 = a1
    _G.Piranha = gs_c458_1
    return
  end
  fn_459 = function(...)
    local _,  a1 = ...
    gs_c459_1 = a1
    _G.TerrorShark = gs_c459_1
    return
  end
  fn_460 = function(...)
    local _,  a1 = ...
    gs_c460_1 = a1
    _G.MobCrew = gs_c460_1
    return
  end
  fn_461 = function(...)
    local _,  a1 = ...
    gs_c461_1 = a1
    _G.HCM = gs_c461_1
    return
  end
  fn_462 = function(...)
    local _,  a1 = ...
    gs_c462_1 = a1
    _G.PGB = gs_c462_1
    return
  end
  fn_463 = function(...)
    local _,  a1 = ...
    gs_c463_1 = a1
    _G.FishBoat = gs_c463_1
    return
  end
  fn_464 = function(...)
    local _,  a1 = ...
    gs_c464_1 = a1
    _G.SeaBeast1 = gs_c464_1
    return
  end
  fn_465 = function(...)
    fn_806 = function(...)
                                                                                                                                  fn_807 = function(...)
        _tp(CFrame.new(gs_806_32_2.HumanoidRootPart.Position.X, (game:GetService("Workspace")).Map["WaterBase-Plane"].Position.Y + 200, gs_806_32_2.HumanoidRootPart.Position.Z))
        return
      end
      fn_808 = function(...)
        _tp(CFrame.new(gs_806_40_2.HumanoidRootPart.Position.X, (game:GetService("Workspace")).Map["WaterBase-Plane"].Position.Y + 200, gs_806_40_2.HumanoidRootPart.Position.Z))
        return
      end
      fn_809 = function(...)
        if (gs_806_48_2.Name == "FishBoat") then
          _tp(gs_806_48_2.Engine.CFrame * (CFrame.new(0, -50, -25)))
        end
        return
      end
      fn_810 = function(...)
        if (gs_806_56_2.Name == "PirateBrigade") then
          _tp(gs_806_56_2.Engine.CFrame * (CFrame.new(0, -30, -10)))
          goto L44476
        end
        if not (gs_806_56_2.Name == "PirateGrandBrigade") then goto L44476 end
        _tp(gs_806_56_2.Engine.CFrame * (CFrame.new(0, -50, -50)))
        ::L44476::
        return
      end
      if not _G.Shark then goto L42291 end
      gs_806_1_1 = ({{"Shark"}})[1]
      if not (CheckShark()) then goto L42289 end
      for _key, item in pairs(workspace.Enemies:GetChildren()) do
        gs_806_2_1 = _key
        gs_806_2_2 = item
        if not (table.find(gs_c806_1, gs_806_2_2.Name)) then goto L42283 end
        if not (gs_root_13.Alive(gs_806_2_2)) then goto L42281 end
        ::L42230::
        task.wait()
        gs_root_13.Kill(gs_806_2_2, _G.Shark)
        local tmp164 = _G.Shark == false
        if _G.Shark == false then goto L42276 end
        tmp164 = not gs_806_2_2.Parent
        if not gs_806_2_2.Parent then goto L42276 end
        tmp164 = gs_806_2_2.Humanoid.Health <= 0
        ::L42276::
        if not (tmp164) then
        goto L42230
        end
        ::L42281::
        ::L42283::
      end
      ::L42289::
      ::L42291::
      if not _G.TerrorShark then goto L42444 end
      gs_806_7_1 = ({{"Terrorshark"}})[1]
      if not (CheckTerrorShark()) then goto L42442 end
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L42345::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if not (_k2[1] == nil) then
        goto L42439
      end
      gs_806_8_1 = _loopkey
      gs_806_8_2 = _loopval
      if not (table.find(gs_c806_1, gs_806_8_2.Name)) then goto L42436 end
      if not (gs_root_13.Alive(gs_806_8_2)) then goto L42434 end
      ::L42383::
      task.wait()
      gs_root_13.KillSea(gs_806_8_2, _G.TerrorShark)
      local tmp165 = _G.TerrorShark == false
      if _G.TerrorShark == false then goto L42429 end
      tmp165 = not gs_806_8_2.Parent
      if not gs_806_8_2.Parent then goto L42429 end
      tmp165 = gs_806_8_2.Humanoid.Health <= 0
      ::L42429::
      if not (tmp165) then
        goto L42383
      end
      ::L42434::
      ::L42436::
      goto L42345
      ::L42439::
      ::L42442::
      ::L42444::
      if not _G.Piranha then goto L42597 end
      gs_806_13_1 = ({{"Piranha"}})[1]
      if not (CheckPiranha()) then goto L42595 end
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L42498::
      _k3 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k3[1]
      if not (_k3[1] == nil) then
        goto L42592
      end
      gs_806_14_1 = _loopkey
      gs_806_14_2 = _loopval
      if not (table.find(gs_c806_1, gs_806_14_2.Name)) then goto L42589 end
      if not (gs_root_13.Alive(gs_806_14_2)) then goto L42587 end
      ::L42536::
      task.wait()
      gs_root_13.Kill(gs_806_14_2, _G.Piranha)
      local tmp166 = _G.Piranha == false
      if _G.Piranha == false then goto L42582 end
      tmp166 = not gs_806_14_2.Parent
      if not gs_806_14_2.Parent then goto L42582 end
      tmp166 = gs_806_14_2.Humanoid.Health <= 0
      ::L42582::
      if not (tmp166) then
        goto L42536
      end
      ::L42587::
      ::L42589::
      goto L42498
      ::L42592::
      ::L42595::
      ::L42597::
      if not _G.MobCrew then goto L42750 end
      gs_806_19_1 = ({{"Fish Crew Member"}})[1]
      if not (CheckFishCrew()) then goto L42748 end
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L42651::
      _k4 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k4[1]
      if not (_k4[1] == nil) then
        goto L42745
      end
      gs_806_20_1 = _loopkey
      gs_806_20_2 = _loopval
      if not (table.find(gs_c806_1, gs_806_20_2.Name)) then goto L42742 end
      if not (gs_root_13.Alive(gs_806_20_2)) then goto L42740 end
      ::L42689::
      task.wait()
      gs_root_13.Kill(gs_806_20_2, _G.MobCrew)
      local tmp167 = _G.MobCrew == false
      if _G.MobCrew == false then goto L42735 end
      tmp167 = not gs_806_20_2.Parent
      if not gs_806_20_2.Parent then goto L42735 end
      tmp167 = gs_806_20_2.Humanoid.Health <= 0
      ::L42735::
      if not (tmp167) then
        goto L42689
      end
      ::L42740::
      ::L42742::
      goto L42651
      ::L42745::
      ::L42748::
      ::L42750::
      if not _G.HCM then goto L42903 end
      gs_806_25_1 = ({{"Haunted Crew Member"}})[1]
      if not (CheckHauntedCrew()) then goto L42901 end
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L42804::
      _k5 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k5[1]
      if not (_k5[1] == nil) then
        goto L42898
      end
      gs_806_26_1 = _loopkey
      gs_806_26_2 = _loopval
      if not (table.find(gs_c806_1, gs_806_26_2.Name)) then goto L42895 end
      if not (gs_root_13.Alive(gs_806_26_2)) then goto L42893 end
      ::L42842::
      task.wait()
      gs_root_13.Kill(gs_806_26_2, _G.HCM)
      local tmp168 = _G.HCM == false
      if _G.HCM == false then goto L42888 end
      tmp168 = not gs_806_26_2.Parent
      if not gs_806_26_2.Parent then goto L42888 end
      tmp168 = gs_806_26_2.Humanoid.Health <= 0
      ::L42888::
      if not (tmp168) then
        goto L42842
      end
      ::L42893::
      ::L42895::
      goto L42804
      ::L42898::
      ::L42901::
      ::L42903::
      if not _G.SeaBeast1 then goto L43281 end
      if not (workspace.SeaBeasts:FindFirstChild("SeaBeast1")) then goto L43279 end
      _iter = {pairs(workspace.SeaBeasts:GetChildren())}
      ::L42954::
      _k6 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k6[1]
      if not (_k6[1] == nil) then
        goto L43276
      end
      gs_806_32_1 = _loopkey
      gs_806_32_2 = _loopval
      local tmp169 = gs_806_32_2:FindFirstChild("HumanoidRootPart")
      if not (gs_806_32_2:FindFirstChild("HumanoidRootPart")) then goto L43005 end
      tmp169 = gs_806_32_2:FindFirstChild("Health")
      if not (gs_806_32_2:FindFirstChild("Health")) then goto L43005 end
      tmp169 = gs_806_32_2.Health.Value > 0
      ::L43005::
      if not tmp169 then goto L43273 end
      ::L43008::
      task.wait()
      spawn(fn_807)
      if ((gs_root_52:DistanceFromCharacter(gs_806_32_2.HumanoidRootPart.CFrame.Position)) <= 500) then
        AitSeaSkill_Custom = gs_806_32_2.HumanoidRootPart.CFrame
        MousePos = AitSeaSkill_Custom.Position
        if (CheckF()) then
          weaponSc("Blox Fruit")
          Useskills("Blox Fruit", "Z")
          Useskills("Blox Fruit", "X")
          Useskills("Blox Fruit", "C")
        else
          Useskills("Melee", "Z")
          Useskills("Melee", "X")
          Useskills("Melee", "C")
          wait(0.1)
          Useskills("Sword", "Z")
          Useskills("Sword", "X")
          wait(0.1)
          Useskills("Blox Fruit", "Z")
          Useskills("Blox Fruit", "X")
          Useskills("Blox Fruit", "C")
          wait(0.1)
          Useskills("Gun", "Z")
          Useskills("Gun", "X")
        end
      end
      local tmp170 = _G.SeaBeast1 == false
      if _G.SeaBeast1 == false then goto L43268 end
      tmp170 = not (gs_806_32_2:FindFirstChild("HumanoidRootPart"))
      if not (gs_806_32_2:FindFirstChild("HumanoidRootPart")) then goto L43268 end
      tmp170 = not gs_806_32_2.Parent
      if not gs_806_32_2.Parent then goto L43268 end
      tmp170 = gs_806_32_2.Health.Value <= 0
      ::L43268::
      if not (tmp170) then
        goto L43008
      end
      ::L43273::
      goto L42954
      ::L43276::
      ::L43279::
      ::L43281::
      if not _G.Leviathan1 then goto L43680 end
      if not (workspace.SeaBeasts:FindFirstChild("Leviathan")) then goto L43678 end
      _iter = {pairs(workspace.SeaBeasts:GetChildren())}
      ::L43332::
      _k7 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k7[1]
      if not (_k7[1] == nil) then
        goto L43675
      end
      gs_806_40_1 = _loopkey
      gs_806_40_2 = _loopval
      local tmp171 = gs_806_40_2:FindFirstChild("HumanoidRootPart")
      if not (gs_806_40_2:FindFirstChild("HumanoidRootPart")) then goto L43400 end
      tmp171 = gs_806_40_2:FindFirstChild("Leviathan Segment")
      if not (gs_806_40_2:FindFirstChild("Leviathan Segment")) then goto L43400 end
      tmp171 = gs_806_40_2:FindFirstChild("Health")
      if not (gs_806_40_2:FindFirstChild("Health")) then goto L43400 end
      tmp171 = gs_806_40_2.Health.Value > 0
      ::L43400::
      if not tmp171 then goto L43672 end
      ::L43403::
      task.wait()
      spawn(fn_808)
      if ((gs_root_52:DistanceFromCharacter(gs_806_40_2.HumanoidRootPart.CFrame.Position)) <= 500) then
        MousePos = (gs_806_40_2:FindFirstChild("Leviathan Segment")).Position
        if (CheckF()) then
          weaponSc("Blox Fruit")
          Useskills("Blox Fruit", "Z")
          Useskills("Blox Fruit", "X")
          Useskills("Blox Fruit", "C")
        else
          Useskills("Melee", "Z")
          Useskills("Melee", "X")
          Useskills("Melee", "C")
          wait(0.1)
          Useskills("Sword", "Z")
          Useskills("Sword", "X")
          wait(0.1)
          Useskills("Blox Fruit", "Z")
          Useskills("Blox Fruit", "X")
          Useskills("Blox Fruit", "C")
          wait(0.1)
          Useskills("Gun", "Z")
          Useskills("Gun", "X")
        end
      end
      local tmp172 = _G.Leviathan1 == false
      if _G.Leviathan1 == false then goto L43667 end
      tmp172 = not (gs_806_40_2:FindFirstChild("HumanoidRootPart"))
      if not (gs_806_40_2:FindFirstChild("HumanoidRootPart")) then goto L43667 end
      tmp172 = not gs_806_40_2.Parent
      if not gs_806_40_2.Parent then goto L43667 end
      tmp172 = gs_806_40_2.Health.Value <= 0
      ::L43667::
      if not (tmp172) then
        goto L43403
      end
      ::L43672::
      goto L43332
      ::L43675::
      ::L43678::
      ::L43680::
      if not _G.FishBoat then goto L44042 end
      if not (CheckEnemiesBoat()) then goto L44040 end
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L43722::
      _k8 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k8[1]
      if not (_k8[1] == nil) then
        goto L44037
      end
      gs_806_48_1 = _loopkey
      gs_806_48_2 = _loopval
      local tmp173 = gs_806_48_2:FindFirstChild("Health")
      if not (gs_806_48_2:FindFirstChild("Health")) then goto L43773 end
      tmp173 = gs_806_48_2.Health.Value > 0
      if not (gs_806_48_2.Health.Value > 0) then goto L43773 end
      tmp173 = gs_806_48_2:FindFirstChild("VehicleSeat")
      ::L43773::
      if not tmp173 then goto L44034 end
      ::L43776::
      task.wait()
      spawn(fn_809)
      if ((gs_root_52:DistanceFromCharacter(gs_806_48_2.Engine.CFrame.Position)) <= 150) then
        AitSeaSkill_Custom = gs_806_48_2.Engine.CFrame
        MousePos = AitSeaSkill_Custom.Position
        if (CheckF()) then
          weaponSc("Blox Fruit")
          Useskills("Blox Fruit", "Z")
          Useskills("Blox Fruit", "X")
          Useskills("Blox Fruit", "C")
        else
          Useskills("Melee", "Z")
          Useskills("Melee", "X")
          Useskills("Melee", "C")
          wait(0.1)
          Useskills("Sword", "Z")
          Useskills("Sword", "X")
          wait(0.1)
          Useskills("Blox Fruit", "Z")
          Useskills("Blox Fruit", "X")
          Useskills("Blox Fruit", "C")
          wait(0.1)
          Useskills("Gun", "Z")
          Useskills("Gun", "X")
        end
      end
      local tmp174 = _G.FishBoat == false
      if _G.FishBoat == false then goto L44029 end
      tmp174 = not (gs_806_48_2:FindFirstChild("VehicleSeat"))
      if not (gs_806_48_2:FindFirstChild("VehicleSeat")) then goto L44029 end
      tmp174 = gs_806_48_2.Health.Value <= 0
      ::L44029::
      if not (tmp174) then
        goto L43776
      end
      ::L44034::
      goto L43722
      ::L44037::
      ::L44040::
      ::L44042::
      if not _G.PGB then goto L44404 end
      if not (CheckPirateGrandBrigade()) then goto L44402 end
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L44084::
      _k9 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k9[1]
      if not (_k9[1] == nil) then
        goto L44399
      end
      gs_806_56_1 = _loopkey
      gs_806_56_2 = _loopval
      local tmp175 = gs_806_56_2:FindFirstChild("Health")
      if not (gs_806_56_2:FindFirstChild("Health")) then goto L44135 end
      tmp175 = gs_806_56_2.Health.Value > 0
      if not (gs_806_56_2.Health.Value > 0) then goto L44135 end
      tmp175 = gs_806_56_2:FindFirstChild("VehicleSeat")
      ::L44135::
      if not tmp175 then goto L44396 end
      ::L44138::
      task.wait()
      spawn(fn_810)
      if ((gs_root_52:DistanceFromCharacter(gs_806_56_2.Engine.CFrame.Position)) <= 150) then
        AitSeaSkill_Custom = gs_806_56_2.Engine.CFrame
        MousePos = AitSeaSkill_Custom.Position
        if (CheckF()) then
          weaponSc("Blox Fruit")
          Useskills("Blox Fruit", "Z")
          Useskills("Blox Fruit", "X")
          Useskills("Blox Fruit", "C")
        else
          Useskills("Melee", "Z")
          Useskills("Melee", "X")
          Useskills("Melee", "C")
          wait(0.1)
          Useskills("Sword", "Z")
          Useskills("Sword", "X")
          wait(0.1)
          Useskills("Blox Fruit", "Z")
          Useskills("Blox Fruit", "X")
          Useskills("Blox Fruit", "C")
          wait(0.1)
          Useskills("Gun", "Z")
          Useskills("Gun", "X")
        end
      end
      local tmp176 = _G.PGB == false
      if _G.PGB == false then goto L44391 end
      tmp176 = not (gs_806_56_2:FindFirstChild("VehicleSeat"))
      if not (gs_806_56_2:FindFirstChild("VehicleSeat")) then goto L44391 end
      tmp176 = gs_806_56_2.Health.Value <= 0
      ::L44391::
      if not (tmp176) then
        goto L44138
      end
      ::L44396::
      goto L44084
      ::L44399::
      ::L44402::
      ::L44404::
      return
    end
    while (wait()) do
      pcall(fn_806)
    end
    return
  end
  fn_466 = function(...)
      while (wait(0.2)) do
      local tmp163 = workspace.Map:FindFirstChild("KitsuneIsland")
      if not (workspace.Map:FindFirstChild("KitsuneIsland")) then
        tmp163 = workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
      end
      if tmp163 then
        gs_c1_120:SetDesc("Kitsune Island : True")
      else
        gs_c1_120:SetDesc("Kitsune Island : False")
      end
    end
    return
  end
  fn_467 = function(...)
    local _,  a1 = ...
    gs_c467_1 = a1
    _G.AutofindKitIs = gs_c467_1
    return
  end
  fn_468 = function(...)
    fn_805 = function(...)
              local _t1
                  if not not (workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true)) then goto L41978 end
      gs_805_1_1 = CheckBoat()
      if not gs_805_1_1 then
        gs_805_2_1 = CFrame.new(-16927.451, 9.086, 433.864)
        TeleportToTarget(gs_805_2_1)
        if ((gs_805_2_1.Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10) then
          gs_c1_53.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
        end
        goto L41976
      end
      if (gs_c1_52.Character.Humanoid.Sit == false) then
        gs_805_5_1 = gs_805_1_1.VehicleSeat.CFrame * (CFrame.new(0, 1, 0))
        _tp(gs_805_5_1)
        goto L41975
      end
      gs_805_6_1 = CFrame.new(-10000000, 31, 37016.25)
      ::L41827::
      wait()
      local tmp158 = CheckEnemiesBoat()
      if CheckEnemiesBoat() then goto L41862 end
      tmp158 = CheckTerrorShark()
      if CheckTerrorShark() then goto L41862 end
      tmp158 = CheckPirateGrandBrigade()
      ::L41862::
      if tmp158 then
        _tp(CFrame.new(-10000000, 150, 37016.25))
      else
        _tp(CFrame.new(-10000000, 31, 37016.25))
      end
      local tmp159 = not _G.AutofindKitIs
      if not _G.AutofindKitIs then goto L41963 end
      tmp159 = (gs_805_6_1.Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10
      if (gs_805_6_1.Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10 then goto L41963 end
      tmp159 = workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
      if workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then goto L41963 end
      tmp159 = gs_c1_52.Character.Humanoid.Sit == false
      ::L41963::
      if not (tmp159) then
        goto L41827
      end
      _t1 = gs_c1_52.Character.Humanoid
      _t1.Sit = false
      local tmp160 = gs_c1_52.Character.Humanoid
      ::L41975::
      local tmp161 = tmp160
      ::L41976::
      local tmp162 = tmp161
      goto L42020
      ::L41978::
      _tp((workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")).CFrame * (CFrame.new(0, 500, 0)))
      ::L42020::
      return
    end
    while (wait()) do
      if _G.AutofindKitIs then
        pcall(fn_805)
      end
    end
    return
  end
  fn_469 = function(...)
    local _,  a1 = ...
    gs_c469_1 = a1
    _G.tweenShrine = gs_c469_1
    return
  end
  fn_470 = function(...)
    fn_804 = function(...)
                          local tmp155 = workspace.Map:FindFirstChild("KitsuneIsland")
      if not (workspace.Map:FindFirstChild("KitsuneIsland")) then
        tmp155 = game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
      end
      gs_c804_1 = tmp155
      gs_c804_2 = gs_c804_1:FindFirstChild("ShrineActive")
      if not gs_c804_2 then goto L41567 end
      _iter = {next, gs_c804_2.GetDescendants(gs_c804_2)}
      ::L41441::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L41564
      end
      gs_804_1_1 = _loopkey
      gs_804_1_2 = _loopval
      local tmp156 = gs_804_1_2:IsA("BasePart")
      if (gs_804_1_2:IsA("BasePart")) then
        tmp156 = gs_804_1_2.Name.find(gs_804_1_2.Name, "NeonShrinePart")
      end
      if not tmp156 then goto L41561 end
      gs_root_53.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue")
      (gs_root_53.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue")).FireServer(gs_root_53.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"))
      ::L41514::
      wait()
      _tp(gs_804_1_2.CFrame * (CFrame.new(0, 2, 0)))
      local tmp157 = _G.tweenShrine == false
      if not (_G.tweenShrine == false) then
        tmp157 = not gs_470_2_1
      end
      if not (tmp157) then
        goto L41514
      end
      ::L41561::
      goto L41441
      ::L41564::
      goto L41609
      ::L41567::
      _tp((workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")).CFrame * (CFrame.new(0, 500, 0)))
      ::L41609::
      return
    end
    while (wait(0.1)) do
      if _G.tweenShrine then
        pcall(fn_804)
      end
    end
    return
  end
  fn_471 = function(...)
    local _,  a1 = ...
    gs_c471_1 = a1
    _G.Collect_Ember = gs_c471_1
    return
  end
  fn_472 = function(...)
    fn_803 = function(...)
          local tmp154 = workspace:WaitForChild("AttachedAzureEmber")
      if not (workspace:WaitForChild("AttachedAzureEmber")) then
        tmp154 = workspace:WaitForChild("EmberTemplate")
      end
      if tmp154 then
        workspace:WaitForChild("EmberTemplate")
        notween(((workspace:WaitForChild("EmberTemplate")).FindFirstChild(workspace:WaitForChild("EmberTemplate"), "Part")).CFrame)
      else
        _tp((workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")).CFrame * (CFrame.new(0, 500, 0)))
        gs_c1_53.Modules.Net["RF/KitsuneStatuePray"].InvokeServer(gs_c1_53.Modules.Net["RF/KitsuneStatuePray"])
      end
      return
    end
    while (wait(0.1)) do
      if _G.Collect_Ember then
        pcall(fn_803)
      end
    end
    return
  end
  fn_473 = function(...)
    local _,  a1 = ...
    gs_c473_1 = a1
    _G.Trade_Ember = gs_c473_1
    return
  end
  fn_474 = function(...)
    fn_802 = function(...)
      if (workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true)) then
        gs_c1_53.Modules.Net:FindFirstChild("RF/KitsuneStatuePray")
        (gs_c1_53.Modules.Net:FindFirstChild("RF/KitsuneStatuePray")).InvokeServer(gs_c1_53.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"))
      end
      return
    end
    while (wait(0.1)) do
      if _G.Trade_Ember then
        pcall(fn_802)
      end
    end
    return
  end
  fn_475 = function(...)
    gs_c1_53.Modules.Net:FindFirstChild("RF/KitsuneStatuePray")
    (gs_c1_53.Modules.Net:FindFirstChild("RF/KitsuneStatuePray")).InvokeServer(gs_c1_53.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"))
    return
  end
  fn_476 = function(...)
    gs_c1_53.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue")
    (gs_c1_53.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue")).FireServer(gs_c1_53.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"))
    return
  end
  fn_477 = function(...)
    fn_801 = function(...)
      while (wait(0.2)) do
        if (workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")) then
          gs_c1_121:SetDesc("Frozen Dimension : True")
        else
          gs_c1_121:SetDesc("Frozen Dimension : False")
        end
      end
      return
    end
    pcall(fn_801)
    return
  end
  fn_478 = function(...)
    fn_800 = function(...)
      gs_c800_1 = string.match(gs_c1_53.Remotes.CommF_:InvokeServer("InfoLeviathan", "1"), "%d+")
      if gs_c800_1 then
        gs_c1_122:SetDesc("Spy Leviathan : " .. (tostring(gs_c800_1)))
        if ((tonumber(gs_c800_1)) == 5) then
          gs_c1_122:SetDesc("Spy Leviathan : Already Done!!")
        end
      end
      return
    end
    while (wait(0.2)) do
      pcall(fn_800)
    end
    return
  end
  fn_479 = function(...)
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "InfoLeviathan", "2")
    return
  end
  fn_480 = function(...)
    local _,  a1 = ...
    gs_c480_1 = a1
    _G.FrozenTP = gs_c480_1
    return
  end
  fn_481 = function(...)
    fn_799 = function(...)
      if (workspace.Map:FindFirstChild("LeviathanGate")) then
        _tp(workspace.Map.LeviathanGate.CFrame)
        gs_c1_53:WaitForChild("Remotes")
        (gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")
        ((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")).InvokeServer((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_"), "OpenLeviathanGate")
      end
      return
    end
    while (wait(0.1)) do
      if _G.FrozenTP then
        pcall(fn_799)
      end
    end
    return
  end
  fn_482 = function(...)
    local _,  a1 = ...
    gs_c482_1 = a1
    _G.SailBoat_Hydra = gs_c482_1
    return
  end
  fn_483 = function(...)
    fn_798 = function(...)
              local _t1
              gs_c798_1 = CheckBoat()
      if not gs_c798_1 then
        gs_798_1_1 = CFrame.new(-16927.451, 9.086, 433.864)
        TeleportToTarget(gs_798_1_1)
        if ((gs_798_1_1.Position - gs_c1_52.Character.HumanoidRootPart.Position).Magnitude <= 10) then
          gs_c1_53.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
        end
        goto L40644
      end
      if not gs_c798_1 then goto L40644 end
      if (gs_c1_52.Character.Humanoid.Sit == false) then
        gs_798_4_1 = gs_c798_1.VehicleSeat.CFrame * (CFrame.new(0, 1, 0))
        _tp(gs_798_4_1)
        goto L40642
      end
      ::L40522::
      wait()
      local tmp150 = CheckEnemiesBoat()
      if CheckEnemiesBoat() then goto L40557 end
      tmp150 = CheckPirateGrandBrigade()
      if CheckPirateGrandBrigade() then goto L40557 end
      tmp150 = CheckTerrorShark()
      ::L40557::
      if tmp150 then
        _tp(CFrame.new(5433, 150, 290))
      else
        _tp(CFrame.new(5433, 35, 290))
      end
      local tmp151 = _G.SailBoat_Hydra == false
      if not (_G.SailBoat_Hydra == false) then
        tmp151 = (gs_c1_52.Character:WaitForChild("Humanoid")).Sit == false
      end
      if not (tmp151) then
        goto L40522
      end
      _t1 = gs_c1_52.Character.Humanoid
      _t1.Sit = false
      local tmp152 = gs_c1_52.Character.Humanoid
      ::L40642::
      local tmp153 = tmp152
      ::L40644::
      return
    end
    while (wait()) do
      if _G.SailBoat_Hydra then
        pcall(fn_798)
      end
    end
    return
  end
  fn_484 = function(...)
    local _,  a1 = ...
    gs_c484_1 = a1
    _G.Leviathan1 = gs_c484_1
    return
  end
  fn_485 = function(...)
    local _,  a1 = ...
    gs_c485_1 = a1
    gs_c485_2 = tostring(gs_c485_1)
    ::L40309::
    gs_485_1_1 = gs_c485_2:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
    gs_485_1_2 = ({gs_c485_2:gsub("^(-?%d+)(%d%d%d)", "%1,%2")})[2]
    gs_c485_2 = gs_485_1_1
    if not (gs_485_1_2 == 0) then
      goto L40309
    end
    return gs_c485_2
  end
  fn_486 = function(...)
                fn_796 = function(...)
      return (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "GetFruits", true)
    end
    fn_797 = function(...)
      return (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "GetFruits")
    end
    gs_c486_1 = "Advance Fruit Stock\n"
    gs_c486_2 = pcall(fn_796)
    gs_c486_3 = ({pcall(fn_796)})[2]
    local tmp148 = not gs_c486_2
    if gs_c486_2 then
      tmp148 = not gs_c486_3
    end
    if tmp148 then
      gs_c486_1 = gs_c486_1 .. "- Error while retrieving data.\n"
      goto L40112
    end
    gs_486_2_1 = false
    _iter = {pairs(gs_c486_3)}
    ::L40056::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L40099
    end
    gs_486_2_1 = _loopkey
    gs_486_2_2 = _loopval
    if gs_486_2_2.OnSale then
      gs_c486_1 = true
      gs_c1_1 = gs_c1_1 .. (gs_486_2_2.Name .. (" - $" .. ((gs_root_123(gs_486_2_2.Price)) .. "\n")))
    end
    goto L40056
    ::L40099::
    if not gs_486_3_1 then
      gs_486_2_1 = gs_486_2_1 .. "- No fruit.\n"
    end
    ::L40112::
    gs_c486_1 = gs_c486_1 .. "\nNormal Fruit Stock\n"
    gs_c486_4 = pcall(fn_797)
    gs_c486_5 = ({pcall(fn_797)})[2]
    local tmp149 = gs_c486_4
    if gs_c486_4 then
      tmp149 = gs_c486_5
    end
    if not tmp149 then goto L40216 end
    gs_486_6_1 = false
    _iter = {pairs(gs_c486_5)}
    ::L40159::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L40202
    end
    gs_486_6_1 = _loopkey
    gs_486_6_2 = _loopval
    if gs_486_6_2.OnSale then
      gs_c486_1 = true
      gs_c1_1 = gs_c1_1 .. (gs_486_6_2.Name .. (" - $" .. ((gs_root_123(gs_486_6_2.Price)) .. "\n")))
    end
    goto L40159
    ::L40202::
    if not gs_486_7_1 then
      gs_486_6_1 = gs_486_6_1 .. "- No fruit.\n"
    end
    goto L40222
    ::L40216::
    gs_c486_1 = gs_c486_1 .. "- Error while retrieving data.\n"
    ::L40222::
    return gs_c486_1
  end
  fn_487 = function(...)
    fn_795 = function(...)
      gs_c1_125:SetDesc(gs_c1_124())
      return
    end
    while (task.wait(60)) do
      pcall(fn_795)
    end
    return
  end
  fn_488 = function(...)
    gs_c1_125:SetDesc(gs_c1_124())
    return
  end
  fn_489 = function(...)
    local _,  a1 = ...
    gs_c489_1 = a1
    _G.Random_Auto = gs_c489_1
    return
  end
  fn_490 = function(...)
    fn_794 = function(...)
      if _G.Random_Auto then
        gs_c1_53.Remotes.CommF_:InvokeServer("Cousin", "Buy")
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_794)
    end
    return
  end
  fn_491 = function(...)
    local _,  a1 = ...
    gs_c491_1 = a1
    _G.DropFruit = gs_c491_1
    return
  end
  fn_492 = function(...)
    fn_793 = function(...)
      DropFruits()
      return
    end
    while (wait(Sec)) do
      if _G.DropFruit then
        pcall(fn_793)
      end
    end
    return
  end
  fn_493 = function(...)
    local _,  a1 = ...
    gs_c493_1 = a1
    _G.StoreF = gs_c493_1
    return
  end
  fn_494 = function(...)
    fn_792 = function(...)
      UpdStFruit()
      return
    end
    while (wait(Sec)) do
      if _G.StoreF then
        pcall(fn_792)
      end
    end
    return
  end
  fn_495 = function(...)
    local _,  a1 = ...
    gs_c495_1 = a1
    _G.TwFruits = gs_c495_1
    return
  end
  fn_496 = function(...)
    fn_791 = function(...)
              for _key, item in pairs(workspace:GetChildren()) do
                gs_c791_1 = _key
                gs_c791_2 = item
                if (string.find(gs_c791_2.Name, "Fruit")) then
                _tp(gs_c791_2.Handle.CFrame)
                end
              end
      return
    end
    while (wait(Sec)) do
      if _G.TwFruits then
        pcall(fn_791)
      end
    end
    return
  end
  fn_497 = function(...)
    local _,  a1 = ...
    gs_c497_1 = a1
    _G.InstanceF = gs_c497_1
    return
  end
  fn_498 = function(...)
    fn_790 = function(...)
      collectFruits(_G.InstanceF)
      return
    end
    while (wait(Sec)) do
      if _G.InstanceF then
        pcall(fn_790)
      end
    end
    return
  end
  fn_499 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c499_1 = a1
    _t1 = getgenv()
    _t1.SelectFruit = gs_c499_1
    return
  end
  fn_500 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c500_1 = a1
    _t1 = getgenv()
    _t1.AutoBuyFruitSniper = gs_c500_1
    return
  end
  fn_501 = function(...)
    fn_789 = function(...)
      while (wait()) do
        if (getgenv()).AutoBuyFruitSniper then
          (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "GetFruits")
          (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "PurchaseRawFruit", (getgenv()).SelectFruit)
        end
      end
      return
    end
    pcall(fn_789)
    return
  end
  fn_502 = function(...)
    local _,  a1 = ...
    gs_c502_1 = a1
    _G.SelectChip = gs_c502_1
    return
  end
  fn_503 = function(...)
    local _,  a1 = ...
    gs_c503_1 = a1
    _G.AutoSelectDungeon = gs_c503_1
    return
  end
  fn_504 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c504_1 = a1
    _t1 = getgenv()
    _t1.AutoGetFruit = gs_c504_1
    return
  end
  fn_505 = function(...)
    fn_788 = function(...)
              if not (getgenv()).AutoGetFruit then goto L39434 end
      gs_788_1_1 = ({{"Rocket-Rocket", "Spin-Spin", "Chop-Chop", "Spring-Spring", "Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame", "Falcon-Falcon", "Ice-Ice", "Sand-Sand", "Dark-Dark", "Ghost-Ghost", "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Barrier-Barrier"}})[1]
      _iter = {ipairs(gs_788_1_1)}
      ::L39368::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L39431
      end
      gs_788_1_1 = _loopkey
      gs_788_1_2 = _loopval
      gs_788_1_3 = ({{"LoadFruit", gs_788_1_2}})[1]
      (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, unpack(gs_788_1_3))
      goto L39368
      ::L39431::
      ::L39434::
      return
    end
    while (wait()) do
      pcall(fn_788)
    end
    return
  end
  fn_506 = function(...)
    if not (GetBP("Special Microchip")) then
      gs_c1_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
    end
    return
  end
  fn_507 = function(...)
                if (GetBP("Special Microchip")) then return end
    gs_c507_1 = ({{}})[1]
    gs_c507_2 = ({{}})[1]
    _iter = {next, (gs_c1_53:WaitForChild("Remotes")).CommF_.InvokeServer((gs_c1_53:WaitForChild("Remotes")).CommF_, "GetFruits")}
    ::L39091::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L39127
    end
    gs_c507_1 = _loopkey
    gs_c507_2 = _loopval
    if (gs_c507_2.Price <= 490000) then
      table.insert(gs_c1_1, gs_c507_2.Name)
    end
    goto L39091
    ::L39127::
    _iter = {pairs(gs_507_2_1)}
    ::L39139::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L39238
    end
    gs_507_2_1 = _loopkey
    gs_507_2_2 = _loopval
    _iter = {pairs(gs_c1_1)}
    ::L39160::
    _k3 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k3[1]
    if not (_k3[1] == nil) then
      goto L39234
    end
    gs_507_2_1 = _loopkey
    gs_507_2_2 = _loopval
    if not (GetBP("Special Microchip")) then
      gs_root_53.Remotes.CommF_:InvokeServer("LoadFruit", tostring(gs_c507_2))
      gs_root_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
    end
    goto L39160
    ::L39234::
    goto L39139
    ::L39238::
    return
  end
  fn_508 = function(...)
    local _,  a1 = ...
    gs_c508_1 = a1
    _G.AutoChipBeli = gs_c508_1
    return
  end
  fn_509 = function(...)
    fn_787 = function(...)
      if not (GetBP("Special Microchip")) then
        gs_c1_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
      end
      return
    end
    while (task.wait(1)) do
      if _G.AutoChipBeli then
        pcall(fn_787)
      end
    end
    return
  end
  fn_510 = function(...)
    local _,  a1 = ...
    gs_c510_1 = a1
    _G.AutoChipFruit = gs_c510_1
    return
  end
  fn_511 = function(...)
    fn_786 = function(...)
      if not not (GetBP("Special Microchip")) then goto L38941 end
      gs_786_1_1 = gs_c1_53.Remotes.CommF_:InvokeServer("GetFruits")
      gs_786_1_2 = ({})[1]
      _iter = {pairs(gs_786_1_1)}
      ::L38857::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        local tmp146 = _iter
        goto L38885
      end
      gs_786_1_1 = _loopkey
      gs_786_1_2 = _loopval
      if (gs_786_1_2.Price <= 490000) then
        gs_c786_2 = gs_786_1_2.Name
      else
        goto L38857
      end
      ::L38885::
      if gs_c786_2 then
        gs_root_53.Remotes.CommF_:InvokeServer("LoadFruit", tostring(gs_c786_2))
        gs_root_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
      end
      local tmp147 = tmp146
      ::L38941::
      return
    end
    while (task.wait(1)) do
      if _G.AutoChipFruit then
        pcall(fn_786)
      end
    end
    return
  end
  fn_512 = function(...)
    local _,  a1 = ...
    gs_c512_1 = a1
    _G.Auto_StartRaid = gs_c512_1
    return
  end
  fn_513 = function(...)
    fn_785 = function(...)
                  gs_c785_1 = game.Players.LocalPlayer
      gs_c785_2 = gs_c785_1:FindFirstChild("PlayerGui")
      local tmp143 = gs_c785_2
      if gs_c785_2 then
        tmp143 = gs_c785_2:FindFirstChild("Main")
      end
      gs_c785_3 = tmp143
      local tmp144 = gs_c785_3
      if gs_c785_3 then
        tmp144 = gs_c785_3:FindFirstChild("TopHUDList")
      end
      gs_c785_4 = tmp144
      local tmp145 = not gs_c785_4
      if gs_c785_4 then
        tmp145 = gs_c785_4.RaidTimer.Visible
      end
      if tmp145 then return end
      if not (GetBP("Special Microchip")) then return end
      if not World2 then goto L38672 end
      gs_785_3_1 = workspace.Map.CircleIsland.RaidSummon2.Button.Main
      if not gs_785_3_1 then goto L38670 end
      if (gs_785_3_1:FindFirstChild("ProximityPrompt")) then
        fireproximityprompt(gs_785_3_1.ProximityPrompt)
        goto L38668
      end
      if not (gs_785_3_1:FindFirstChild("ClickDetector")) then goto L38668 end
      fireclickdetector(gs_785_3_1.ClickDetector)
      ::L38668::
      ::L38670::
      ::L38672::
      if not World3 then goto L38759 end
      gs_785_7_1 = workspace.Map["Boat Castle"].RaidSummon2.Button.Main
      if not gs_785_7_1 then goto L38757 end
      if (gs_785_7_1:FindFirstChild("ProximityPrompt")) then
        fireproximityprompt(gs_785_7_1.ProximityPrompt)
        goto L38755
      end
      if not (gs_785_7_1:FindFirstChild("ClickDetector")) then goto L38755 end
      fireclickdetector(gs_785_7_1.ClickDetector)
      ::L38755::
      ::L38757::
      ::L38759::
      return
    end
    ::L38442::
    if (task.wait(Sec)) then
      if not _G.Auto_StartRaid then
        goto L38442
      end
      pcall(fn_785)
      goto L38442
    end
    return
  end
  fn_514 = function(...)
    local _,  a1 = ...
    gs_c514_1 = a1
    _G.Raiding = gs_c514_1
    return
  end
  fn_515 = function(...)
                      gs_c515_1 = workspace._WorldOrigin.Locations
    gs_c515_2 = ({{"Island 1", "Island 2", "Island 3", "Island 4", "Island 5"}})[1]
    gs_c515_3 = ({})[1]
    ::L37882::
    if not (task.wait(0.3)) then goto L38431 end
    if not _G.Raiding then
      goto L37882
    end
    gs_515_1_1 = gs_c1_52.PlayerGui.Main.TopHUDList.RaidTimer
    if not gs_515_1_1.Visible then
      goto L37882
    end
    gs_515_1_2 = gs_c1_52.Character
    if not gs_515_1_2 then
      goto L37882
    end
    gs_515_1_3 = gs_515_1_2:FindFirstChild("HumanoidRootPart")
    gs_515_1_4 = gs_515_1_2:FindFirstChildOfClass("Humanoid")
    local tmp138 = not gs_515_1_3
    if not gs_515_1_3 then goto L38001 end
    tmp138 = not gs_515_1_4
    if not gs_515_1_4 then goto L38001 end
    tmp138 = gs_515_1_4.Health <= 0
    ::L38001::
    if tmp138 then
      goto L37882
    end
    local tmp139 = gs_515_1_4.Sit
    if gs_515_1_4.Sit then goto L38022 end
    tmp139 = gs_515_1_4.PlatformStand
    if gs_515_1_4.PlatformStand then goto L38022 end
    tmp139 = gs_515_1_3.Anchored
    ::L38022::
    if tmp139 then
      goto L37882
    end
    gs_515_1_5 = 999999
    _iter = {ipairs(gs_c515_2)}
    ::L38046::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L38111
    end
    gs_515_1_1 = _loopkey
    gs_515_1_2 = _loopval
    gs_515_1_3 = gs_c1_1:FindFirstChild(gs_515_1_2)
    if gs_515_1_3 then
      gs_515_8_1 = (gs_c515_3.Position - gs_515_1_3.Position).Magnitude
      if (gs_515_8_1 < gs_c515_5) then
        gs_c515_5 = gs_515_8_1
        gs_c1_3 = gs_515_1_2
      end
    end
    goto L38046
    ::L38111::
    if not gs_515_1_3 then
      goto L37882
    end
    gs_515_7_6 = gs_515_1_1:FindFirstChild(gs_515_1_3)
    if not gs_515_7_6 then
      goto L37882
    end
    gs_515_7_7 = false
    _iter = {ipairs(workspace.Enemies:GetChildren())}
    ::L38179::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L38314
    end
    gs_515_7_1 = _loopkey
    gs_515_7_2 = _loopval
    gs_515_7_3 = gs_515_7_2:FindFirstChild("Humanoid")
    gs_515_7_4 = gs_515_7_2:FindFirstChild("HumanoidRootPart")
    local tmp140 = gs_515_7_3
    if not gs_515_7_3 then goto L38242 end
    tmp140 = gs_515_7_4
    if not gs_515_7_4 then goto L38242 end
    tmp140 = gs_515_7_3.Health > 0
    ::L38242::
    if not tmp140 then goto L38311 end
    if not ((gs_515_7_4.Position - gs_515_1_6.Position).Magnitude < 450) then goto L38309 end
    gs_515_1_7 = true
    ::L38261::
    task.wait()
    gs_c1_13.Kill(gs_515_7_2, _G.Raiding)
    local tmp141 = not _G.Raiding
    if not _G.Raiding then goto L38304 end
    tmp141 = not gs_515_7_2.Parent
    if not gs_515_7_2.Parent then goto L38304 end
    tmp141 = gs_515_7_3.Health <= 0
    ::L38304::
    if not (tmp141) then
      goto L38261
    end
    ::L38309::
    ::L38311::
    goto L38179
    ::L38314::
    if not gs_515_12_7 then
      gs_515_16_1 = table.find(gs_515_7_2, gs_515_7_3)
      local tmp142 = gs_515_16_1
      if gs_515_16_1 then
        tmp142 = gs_515_7_2[gs_515_16_1 + 1]
      end
      if tmp142 then
        gs_515_17_1 = gs_515_7_1:FindFirstChild(gs_515_7_2[gs_515_16_1 + 1])
        if gs_515_17_1 then
          gs_515_18_1 = gs_515_17_1.CFrame * (CFrame.new(0, 45, 120))
          _tp(gs_515_18_1)
        end
        gs_515_7_3 = gs_515_7_2[gs_515_16_1 + 1]
        task.wait(1)
      end
    end
    goto L37882
    ::L38431::
    return
  end
  fn_516 = function(...)
    local _,  a1 = ...
    gs_c516_1 = a1
    _G.Auto_Awakener = gs_c516_1
    return
  end
  fn_517 = function(...)
    fn_784 = function(...)
      if _G.Auto_Awakener then
        gs_c1_53.Remotes.CommF_:InvokeServer("Awakener", "Check")
        gs_c1_53.Remotes.CommF_:InvokeServer("Awakener", "Awaken")
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_784)
    end
    return
  end
  fn_518 = function(...)
    local _,  a1 = ...
        gs_c518_1 = a1
    _G.TpLab = gs_c518_1
    StopTween(_G.TpLab)
    ::L37659::
    if not _G.TpLab then goto L37761 end
    wait()
    if not _G.TpLab then goto L37759 end
    local tmp136 = World2
    if World2 then
      tmp136 = _G.TpLab
    end
    if tmp136 then
      topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
      goto L37757
    end
    local tmp137 = World3
    if World3 then
      tmp137 = _G.TpLab
    end
    if not tmp137 then goto L37757 end
    topos(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
    ::L37757::
    ::L37759::
    goto L37659
    ::L37761::
    return
  end
  fn_519 = function(...)
    gs_c1_53.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
    return
  end
  fn_520 = function(...)
    fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
    return
  end
  fn_521 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c521_1 = a1
    _t1 = getgenv()
    _t1.AutoBuyMicrochipLaw = gs_c521_1
    return
  end
  fn_522 = function(...)
    fn_783 = function(...)
      (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "BlackbeardReward", "Microchip", "2")
      return
    end
    while (task.wait(1)) do
      if (getgenv()).AutoBuyMicrochipLaw then
        pcall(fn_783)
      end
    end
    return
  end
  fn_523 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c523_1 = a1
    _t1 = getgenv()
    _t1.AutoStartLawRaids = gs_c523_1
    return
  end
  fn_524 = function(...)
    fn_782 = function(...)
      fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
      return
    end
    while (task.wait(1)) do
      if (getgenv()).AutoStartLawRaids then
        pcall(fn_782)
      end
    end
    return
  end
  fn_525 = function(...)
    local _,  a1 = ...
    gs_c525_1 = a1
    _G.AutoLawKak = gs_c525_1
    return
  end
  fn_526 = function(...)
    fn_781 = function(...)
          gs_c781_1 = GetConnectionEnemies("Order")
      if not gs_c781_1 then goto L37402 end
      ::L37351::
      task.wait()
      gs_c1_13.Kill(gs_c781_1, _G.AutoLawKak)
      local tmp135 = _G.AutoLawKak == false
      if _G.AutoLawKak == false then goto L37397 end
      tmp135 = not gs_c781_1.Parent
      if not gs_c781_1.Parent then goto L37397 end
      tmp135 = gs_c781_1.Humanoid.Health <= 0
      ::L37397::
      if not (tmp135) then
        goto L37351
      end
      goto L37423
      ::L37402::
      _tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
      ::L37423::
      return
    end
    while (wait(Sec)) do
      if _G.AutoLawKak then
        pcall(fn_781)
      end
    end
    return
  end
  fn_527 = function(...)
      gs_c527_1 = gs_c1_126.Character
    local tmp134 = gs_c527_1
    if gs_c527_1 then
      tmp134 = gs_c527_1:FindFirstChild("HumanoidRootPart")
    end
    return tmp134
  end
  fn_528 = function(...)
    local _,  a1 = ...
    gs_c528_1 = a1
    _G.AutoFarmDungeon = gs_c528_1
    return
  end
  fn_529 = function(...)
    fn_780 = function(...)
                                          gs_c780_1 = game.Players.LocalPlayer
      gs_c780_2 = gs_c780_1.Character
      local tmp128 = gs_c780_2
      if gs_c780_2 then
        tmp128 = gs_c780_2:FindFirstChild("HumanoidRootPart")
      end
      gs_c780_3 = tmp128
      local tmp129 = gs_c780_2
      if gs_c780_2 then
        tmp129 = gs_c780_2:FindFirstChildOfClass("Humanoid")
      end
      gs_c780_4 = tmp129
      local tmp130 = not gs_c780_3
      if not gs_c780_3 then goto L37081 end
      tmp130 = not gs_c780_4
      if not gs_c780_4 then goto L37081 end
      tmp130 = gs_c780_4.Health <= 0
      ::L37081::
      if tmp130 then return end
      _iter = {pairs(workspace.Enemies:GetChildren())}
      ::L37110::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        local tmp133 = _iter
        goto L37258
      end
      gs_c780_1 = _loopkey
      gs_c780_2 = _loopval
      if not _G.AutoFarmDungeon then
        goto L37258
      end
      gs_c780_3 = gs_c780_2:FindFirstChild("Humanoid")
      gs_c780_4 = gs_c780_2:FindFirstChild("HumanoidRootPart")
      local tmp131 = gs_c780_3
      if not gs_c780_3 then goto L37184 end
      tmp131 = gs_c780_4
      if not gs_c780_4 then goto L37184 end
      tmp131 = gs_c780_3.Health > 0
      ::L37184::
      if not tmp131 then goto L37255 end
      gs_780_4_1 = (gs_c780_4.Position - gs_529_1_3.Position).Magnitude
      if not (gs_780_4_1 <= gs_root_128) then goto L37253 end
      ::L37208::
      task.wait()
      gs_root_13.Kill(gs_c780_2, true)
      local tmp132 = not _G.AutoFarmDungeon
      if not _G.AutoFarmDungeon then goto L37248 end
      tmp132 = not gs_c780_2.Parent
      if not gs_c780_2.Parent then goto L37248 end
      tmp132 = gs_c780_3.Health <= 0
      ::L37248::
      if not (tmp132) then
        goto L37208
      end
      ::L37253::
      ::L37255::
      goto L37110
      ::L37258::
      return
    end
    ::L36961::
    if (task.wait(0.15)) then
      if not _G.AutoFarmDungeon then
        goto L36961
      end
      pcall(fn_780)
      goto L36961
    end
    return
  end
  fn_530 = function(...)
    local _,  a1 = ...
    gs_c530_1 = a1
    _G.TPFloor1 = gs_c530_1
    return
  end
  fn_531 = function(...)
          gs_c531_1 = gs_c1_127()
    if not gs_c531_1 then return end
    for _key, item in pairs(workspace.Map.Dungeon:GetChildren()) do
      gs_c531_1 = _key
      gs_c531_2 = item
      gs_c531_3 = gs_c531_2:FindFirstChild("ExitTeleporter")
      local tmp127 = gs_c531_3
      if gs_c531_3 then
      tmp127 = gs_c531_3:FindFirstChild("Root")
      end
      if tmp127 then
      if ((gs_c1_1.Position - gs_c531_3.Root.Position).Magnitude < 200) then return {gs_c531_3.Root} end
      end
    end
    return
  end
  fn_532 = function(...)
    local _t1
        ::L36745::
    if (task.wait(0.3)) then
      if not _G.TPFloor1 then
        gs_c1_129 = false
        goto L36745
      end
      if not gs_c1_129 then
        gs_532_3_1 = gs_c1_130()
        if gs_532_3_1 then
          gs_532_3_1 = gs_532_3_1.CFrame * (CFrame.new(0, 3, 0))
          _t1 = gs_c1_127()
          _t1.CFrame = gs_532_3_1
          gs_c1_129 = true
          local tmp125 = gs_c1_127()
        end
        local tmp126 = tmp125
      end
      goto L36745
    end
    return
  end
  fn_533 = function(...)
    local _,  a1 = ...
    gs_c533_1 = a1
    _G.TPFloor2 = gs_c533_1
    return
  end
  fn_534 = function(...)
                ::L36512::
    if not (task.wait(0.3)) then goto L36734 end
    if not _G.TPFloor2 then
      gs_c1_131 = false
      goto L36512
    end
    if gs_c1_131 then
      goto L36512
    end
    gs_534_1_1 = gs_c1_127()
    if not gs_534_1_1 then
      goto L36512
    end
    _iter = {pairs(workspace.Map.Dungeon:GetChildren())}
    ::L36592::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      local tmp124 = _iter
      goto L36731
    end
    gs_534_1_1 = _loopkey
    gs_534_1_2 = _loopval
    gs_534_1_3 = gs_534_1_2:FindFirstChild("EntranceTeleporter")
    gs_534_1_4 = gs_534_1_2:FindFirstChild("ExitTeleporter")
    local tmp122 = gs_534_1_3
    if not gs_534_1_3 then goto L36680 end
    tmp122 = gs_534_1_4
    if not gs_534_1_4 then goto L36680 end
    tmp122 = gs_534_1_3:FindFirstChild("Root")
    if not (gs_534_1_3:FindFirstChild("Root")) then goto L36680 end
    tmp122 = gs_534_1_4:FindFirstChild("Root")
    ::L36680::
    if tmp122 then
      if ((gs_c534_1.Position - gs_534_1_3.Root.Position).Magnitude < 100) then
        gs_c534_1.CFrame = gs_534_1_4.Root.CFrame * (CFrame.new(0, 3, 0))
        gs_root_131 = true
        local tmp123 = gs_c534_1
        goto L36731
      end
    end
    goto L36592
    ::L36731::
    goto L36512
    ::L36734::
    return
  end
  fn_535 = function(...)
    local _,  a1 = ...
    gs_c535_1 = a1
    _G.TPFloor3 = gs_c535_1
    return
  end
  fn_536 = function(...)
          for _key, item in pairs(workspace.Map.Dungeon:GetChildren()) do
            gs_c536_1 = _key
            gs_c536_2 = item
            gs_c536_3 = tonumber(gs_c536_2.Name)
            local tmp121 = gs_c536_3
            if not gs_c536_3 then goto L36488 end
            tmp121 = not gs_c1_1
            if not gs_c1_1 then goto L36488 end
            tmp121 = gs_c536_3 > (tonumber(gs_c1_1.Name))
            ::L36488::
            if tmp121 then
            gs_c1_1 = gs_c536_2
            end
          end
    return gs_536_1_1
  end
  fn_537 = function(...)
      local _t1
        ::L36292::
    if not (task.wait(0.3)) then goto L36411 end
    if not _G.TPFloor3 then
      gs_c1_132 = false
      goto L36292
    end
    if not not gs_c1_132 then goto L36409 end
    gs_537_3_1 = gs_c1_133()
    local tmp118 = gs_537_3_1
    if not gs_537_3_1 then goto L36372 end
    tmp118 = gs_537_3_1:FindFirstChild("ExitTeleporter")
    if not (gs_537_3_1:FindFirstChild("ExitTeleporter")) then goto L36372 end
    tmp118 = gs_537_3_1.ExitTeleporter.FindFirstChild(gs_537_3_1.ExitTeleporter, "Root")
    ::L36372::
    if tmp118 then
      _t1 = gs_c1_127()
      _t1.CFrame = gs_537_3_1.ExitTeleporter.Root.CFrame * (CFrame.new(0, 3, 0))
      gs_c1_132 = true
      local tmp119 = gs_c1_127()
    end
    local tmp120 = tmp119
    ::L36409::
    goto L36292
    ::L36411::
    return
  end
  fn_538 = function(...)
    local _,  a1 = ...
    gs_c538_1 = a1
    _G.TPFloor4 = gs_c538_1
    return
  end
  fn_539 = function(...)
          gs_c539_1 = gs_c1_127()
    if not gs_c539_1 then return end
    gs_c539_2 = ({})[1]
    gs_c539_3 = ({})[2]
    for _key, item in pairs(workspace.Map.Dungeon:GetChildren()) do
      gs_c539_1 = _key
      gs_c539_2 = item
      gs_c539_3 = gs_c539_2:FindFirstChild("ExitTeleporter")
      local tmp117 = gs_c539_3
      if gs_c539_3 then
      tmp117 = gs_c539_3:FindFirstChild("Root")
      end
      if tmp117 then
      gs_539_3_1 = (gs_c1_1.Position - gs_c539_3.Root.Position).Magnitude
      if (gs_539_3_1 < gs_c1_3) then
      gs_c1_3 = gs_539_3_1
      gs_c1_2 = gs_c539_3.Root
      end
      end
    end
    return gs_539_2_2
  end
  fn_540 = function(...)
    local _t1
        ::L36053::
    if (task.wait(0.3)) then
      if not _G.TPFloor4 then
        gs_c1_134 = false
        goto L36053
      end
      if not gs_c1_134 then
        gs_540_3_1 = gs_c1_135()
        if gs_540_3_1 then
          _t1 = gs_c1_127()
          _t1.CFrame = gs_540_3_1.CFrame * (CFrame.new(0, 3, 0))
          gs_c1_134 = true
          local tmp115 = gs_c1_127()
        end
        local tmp116 = tmp115
      end
      goto L36053
    end
    return
  end
  fn_541 = function(...)
    fn_779 = function(...)
      game:GetService("Players")
      gs_c779_1 = #((game:GetService("Players")).GetPlayers(game:GetService("Players")))
      if (gs_c779_1 == 12) then
        gs_c1_136:SetDesc("All Players : " .. (gs_c779_1 .. " / 12 [Max]"))
      else
        gs_c1_136:SetDesc("All Players : " .. (gs_c779_1 .. " / 12"))
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_779)
    end
    return
  end
  fn_542 = function(...)
    if _G.AimCam then return {"Aimbot Camera"} end
    if _G.AimbotGun then return {"Aimbot Guns"} end
    return ""
  end
  fn_543 = function(...)
    fn_778 = function(...)
          if _G.AimMethod then
        local tmp114 = _G.AimCam
        if not (_G.AimCam) then
          tmp114 = _G.AimbotGun
        end
        if tmp114 then
          gs_c1_137:SetDesc("Aimbot - " .. ((Checking_AimStatus()) .. " : True"))
        else
          gs_c1_137:SetDesc("Aimbot - Skills : True")
        end
      else
        gs_c1_137:SetDesc("Aimbot - Skills : False")
      end
      return
    end
    while (wait(0.2)) do
      pcall(fn_778)
    end
    return
  end
  fn_544 = function(...)
    local _,  a1 = ...
    gs_c544_1 = a1
    _G.PlayersList = gs_c544_1
    return
  end
  fn_545 = function(...)
    local _,  a1 = ...
    fn_776 = function(...)
      fn_777 = function(...)
        while _G.TpPly do
          wait()
          _tp((game:GetService("Players"))[_G.PlayersList].Character.HumanoidRootPart.CFrame)
        end
        return
      end
      pcall(fn_777)
      return
    end
    gs_c545_1 = a1
    _G.TpPly = gs_c545_1
    spawn(fn_776)
    return
  end
  fn_546 = function(...)
    local _,  a1 = ...
    fn_775 = function(...)
      local _t1
          local _t2
      ::L35633::
      task.wait(0.1)
      game:GetService("Players")
      if ((game:GetService("Players")).FindFirstChild(game:GetService("Players"), _G.PlayersList)) then
        game:GetService("Players")
        _t1 = workspace.Camera
        _t1.CameraSubject = ((game:GetService("Players")).FindFirstChild(game:GetService("Players"), _G.PlayersList)).Character.Humanoid
        local tmp113 = workspace.Camera
      end
      if SpectatePlys then
        goto L35633
      end
      _t2 = workspace.Camera
      _t2.CameraSubject = gs_1_19_126.Character.Humanoid
      return
    end
    gs_c546_1 = a1
    SpectatePlys = gs_c546_1
    spawn(fn_775)
    return
  end
  fn_547 = function(...)
    local _,  a1 = ...
    gs_c547_1 = a1
    ABmethod = gs_c547_1
    return
  end
  fn_548 = function(...)
    local _,  a1 = ...
    gs_c548_1 = a1
    _G.AimMethod = gs_c548_1
    return
  end
  fn_549 = function(...)
    fn_774 = function(...)
              local tmp111 = _G.AimMethod
      if _G.AimMethod then
        tmp111 = ABmethod == "Aim Player"
      end
      if not tmp111 then goto L35600 end
      gs_774_1_1 = gs_1_19_75:FindFirstChild((getgenv()).PlayersList)
      local tmp112 = gs_774_1_1
      if not gs_774_1_1 then goto L35572 end
      tmp112 = gs_774_1_1.Character
      if not gs_774_1_1.Character then goto L35572 end
      tmp112 = gs_774_1_1.Character.FindFirstChild(gs_774_1_1.Character, "HumanoidRootPart")
      ::L35572::
      if tmp112 then
        if (gs_774_1_1.Team ~= gs_1_19_126.Team) then
          MousePos = gs_774_1_1.Character.HumanoidRootPart.Position
        end
      end
      ::L35600::
      return
    end
    while (wait()) do
      pcall(fn_774)
    end
    return
  end
  fn_550 = function(...)
    fn_773 = function(...)
                      local tmp109 = _G.AimMethod
      if _G.AimMethod then
        tmp109 = ABmethod == "Nearest Aim"
      end
      if not tmp109 then goto L35479 end
      gs_773_1_1 = math.huge
      _iter = {pairs(gs_1_19_75.GetPlayers(gs_1_19_75))}
      ::L35376::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L35476
      end
      gs_773_1_1 = _loopkey
      gs_773_1_2 = _loopval
      local tmp110 = gs_773_1_2 ~= gs_c1_126
      if not (gs_773_1_2 ~= gs_c1_126) then goto L35426 end
      tmp110 = gs_773_1_2.Team ~= gs_c1_126.Team
      if not (gs_773_1_2.Team ~= gs_c1_126.Team) then goto L35426 end
      tmp110 = gs_773_1_2.Character
      if not gs_773_1_2.Character then goto L35426 end
      tmp110 = gs_773_1_2.Character.FindFirstChild(gs_773_1_2.Character, "HumanoidRootPart")
      ::L35426::
      if tmp110 then
        gs_773_3_1 = (gs_773_1_2.Character.HumanoidRootPart.Position - gs_c1_126.Character.HumanoidRootPart.Position).Magnitude
        if (gs_773_3_1 < gs_c773_1) then
          gs_c773_1 = gs_773_3_1
          MousePos = gs_773_1_2.Character.HumanoidRootPart.Position
        end
      end
      goto L35376
      ::L35476::
      ::L35479::
      return
    end
    while (wait()) do
      pcall(fn_773)
    end
    return
  end
  fn_551 = function(...)
    local _,  a1 = ...
    gs_c551_1 = a1
    _G.AimCam = gs_c551_1
    return
  end
  fn_552 = function(...)
    fn_771 = function(...)
              fn_772 = function(...)
                          gs_c772_1 = math.huge
        gs_c772_2 = ({})[1]
        _iter = {next, ply.GetPlayers(ply)}
        ::L35189::
        _k1 = {_loopkey(_loopval, _loopstate)}
        _loopstate = _k1[1]
        if not (_k1[1] == nil) then
          goto L35293
        end
        gs_c772_1 = _loopkey
        gs_c772_2 = _loopval
        if not (gs_c772_2 ~= gs_c1_126) then goto L35290 end
        local tmp108 = gs_c772_2.Character
        if not gs_c772_2.Character then goto L35248 end
        tmp108 = gs_c772_2.Character:FindFirstChild("Head")
        if not (gs_c772_2.Character:FindFirstChild("Head")) then goto L35248 end
        tmp108 = _G.AimCam
        if not _G.AimCam then goto L35248 end
        tmp108 = gs_c772_2.Character.Humanoid.Health > 0
        ::L35248::
        if tmp108 then
          gs_772_3_1 = (gs_c772_2.Character.Head.Position - gs_c1_126.Character.Head.Position).Magnitude
          if (gs_772_3_1 < gs_771_1_1) then
            gs_771_1_1 = gs_772_3_1
            gs_771_1_2 = gs_c772_2
          end
        end
        ::L35290::
        goto L35189
        ::L35293::
        return gs_772_1_2
      end
      if not _G.AimCam then goto L35152 end
      gs_771_1_1 = workspace.CurrentCamera
      closestplayer = fn_772
      ::L35093::
      task.wait()
      gs_771_1_1.CFrame = CFrame.new(gs_771_1_1.CFrame.Position, (closestplayer()).Character.HumanoidRootPart.Position)
      if not (_G.AimCam == false) then
      end
      if not (j35147_0_2) then
        goto L35093
      end
      local tmp107 = gs_771_1_1
      ::L35152::
      return
    end
    while (task.wait(Sec)) do
      pcall(fn_771)
    end
    return
  end
  fn_553 = function(...)
    fn_770 = function(...)
      (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "PlayerHunter")
      return
    end
    pcall(fn_770)
    return
  end
  fn_554 = function(...)
    local _,  a1 = ...
    gs_c554_1 = a1
    _G.AutoReceivePlayerQuest = gs_c554_1
    return
  end
  fn_555 = function(...)
    fn_769 = function(...)
      (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "PlayerHunter")
      return
    end
    while (task.wait(1)) do
      if _G.AutoReceivePlayerQuest then
        pcall(fn_769)
      end
    end
    return
  end
  fn_556 = function(...)
    local _,  a1 = ...
    gs_c556_1 = a1
    _G.AutoPlayerHunter = gs_c556_1
    return
  end
  fn_557 = function(...)
        local _t2
      ::L34545::
    if not (task.wait()) then goto L34919 end
    if not _G.AutoPlayerHunter then goto L34917 end
    if (game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
      task.wait(0.5)
      (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "PlayerHunter")
      goto L34915
    end
    _iter = {pairs((game:GetService("Workspace")).Characters.GetChildren((game:GetService("Workspace")).Characters))}
    ::L34663::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L34913
    end
    gs_557_4_1 = _loopkey
    gs_557_4_2 = _loopval
    if not (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, gs_557_4_2.Name)) then goto L34910 end
    ::L34708::
    task.wait()
    if AutoHaki then
      AutoHaki()
    end
    if EquipWeapon then
      EquipWeapon(_G.SelectWeapon)
    end
    Useskill = true
    _tp(gs_557_4_2.HumanoidRootPart.CFrame * (CFrame.new(1, 7, 3)))
    _t2 = gs_557_4_2.HumanoidRootPart
    _t2.Size = Vector3.new(60, 60, 60)
    game:GetService("VirtualUser")
    (game:GetService("VirtualUser")).CaptureController(game:GetService("VirtualUser"))
    game:GetService("VirtualUser")
    (game:GetService("VirtualUser")).Button1Down(game:GetService("VirtualUser"), Vector2.new(1280, 672))
    local tmp106 = _G.AutoPlayerHunter == false
    if not (_G.AutoPlayerHunter == false) then
      tmp106 = gs_557_4_2.Humanoid.Health <= 0
    end
    if not (tmp106) then
      goto L34708
    end
    Useskill = false
    (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "AbandonQuest")
    ::L34910::
    goto L34663
    ::L34913::
    ::L34915::
    ::L34917::
    goto L34545
    ::L34919::
    return
  end
  fn_558 = function(...)
    local _,  a1 = ...
    gs_c558_1 = a1
    _G.AutoPvP = gs_c558_1
    return
  end
  fn_559 = function(...)
      fn_768 = function(...)
      (game:GetService("ReplicatedStorage")).Remotes.CommF_.InvokeServer((game:GetService("ReplicatedStorage")).Remotes.CommF_, "EnablePvp")
      return
    end
    ::L34412::
    if not (task.wait(0.5)) then goto L34502 end
    if not _G.AutoPvP then goto L34500 end
    gs_559_2_1 = game.Players.LocalPlayer.PlayerGui
    local tmp105 = gs_559_2_1
    if not gs_559_2_1 then goto L34473 end
    tmp105 = gs_559_2_1.Main
    if not gs_559_2_1.Main then goto L34473 end
    tmp105 = gs_559_2_1.Main.FindFirstChild(gs_559_2_1.Main, "PvpDisabled")
    ::L34473::
    if tmp105 then
      if gs_559_2_1.Main.PvpDisabled.Visible then
        pcall(fn_768)
      end
    end
    ::L34500::
    goto L34412
    ::L34502::
    return
  end
  fn_560 = function(...)
    local _,  a1 = ...
    gs_c560_1 = a1
    _G.SafeMode = gs_c560_1
    return
  end
  fn_561 = function(...)
      while (task.wait(0.1)) do
      if _G.SafeMode then
        gs_561_2_1 = game.Players.LocalPlayer.Character
        local tmp104 = gs_561_2_1
        if gs_561_2_1 then
          tmp104 = gs_561_2_1:FindFirstChild("HumanoidRootPart")
        end
        gs_561_2_2 = tmp104
        if gs_561_2_2 then
          gs_561_3_1 = gs_561_2_2.CFrame * (CFrame.new(0, 1000, 0))
          _tp(gs_561_3_1)
        end
      end
    end
    return
  end
  fn_562 = function(...)
    fn_766 = function(...)
              gs_c766_1 = gs_1_19_142.Character
      if not gs_c766_1 then return end
      gs_c766_2 = gs_c766_1:FindFirstChildOfClass("Humanoid")
      if not gs_c766_2 then return end
      gs_c766_3 = gs_c766_2.MoveDirection
      gs_1_19_146.f = 0
      gs_1_19_146.b = 0
      gs_1_19_146.l = 0
      gs_1_19_146.r = 0
      if (gs_c766_3.Z < -0.1) then
        gs_1_19_146.f = 1
        goto L34273
      end
      if not (gs_c766_3.Z > 0.1) then goto L34273 end
      gs_1_19_146.b = 1
      ::L34273::
      if (gs_c766_3.X < -0.1) then
        gs_1_19_146.l = 1
        goto L34301
      end
      if not (gs_c766_3.X > 0.1) then goto L34301 end
      gs_1_19_146.r = 1
      ::L34301::
      return
    end
    fn_767 = function(...)
      if gs_1_19_143 then
        gs_c562_1()
        goto L34178
      end
      if gs_c562_2 then
        gs_c562_2.Disconnect(gs_c562_2)
      end
      ::L34178::
      return
    end
    gs_c562_1 = fn_766
    gs_c562_2 = gs_1_19_141.Heartbeat.Connect(gs_1_19_141.Heartbeat, fn_767)
    return
  end
  fn_563 = function(...)
    local _,  a1 = ...
                          fn_764 = function(...)
      local _,  a1 = ...
                  gs_c764_1 = a1
      local tmp102 = gs_c563_143
      if gs_c563_143 then
        tmp102 = gs_c764_1:IsA("BasePart")
      end
      if tmp102 then
        gs_c764_1.CanCollide = false
        gs_c764_1.Massless = true
        local tmp103 = gs_c764_1
      end
      return
    end
    fn_765 = function(...)
                                  local tmp97 = not gs_c563_143
      if gs_c563_143 then
        tmp97 = not gs_c563_142.Character
      end
      if tmp97 then return end
      _iter = {ipairs(gs_c563_142.Character.GetDescendants(gs_c563_142.Character))}
      ::L33928::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L33970
      end
      gs_c765_1 = _loopkey
      gs_c765_2 = _loopval
      local tmp98 = gs_c765_2:IsA("BasePart")
      if (gs_c765_2:IsA("BasePart")) then
        tmp98 = gs_c765_2.CanCollide
      end
      if tmp98 then
        gs_c765_2.CanCollide = false
        local tmp99 = gs_c765_2
      end
      goto L33928
      ::L33970::
      local tmp100 = (gs_563_1_146.l + gs_563_1_146.r) ~= 0
      if not ((gs_563_1_146.l + gs_563_1_146.r) ~= 0) then
        tmp100 = (gs_563_1_146.f + gs_563_1_146.b) ~= 0
      end
      if tmp100 then
        gs_563_1_148.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (gs_563_1_146.f + gs_563_1_146.b)) + ((workspace.CurrentCamera.CoordinateFrame * (CFrame.new(gs_563_1_146.l + gs_563_1_146.r, (gs_563_1_146.f + gs_563_1_146.b) * 0.2, 0)).p) - workspace.CurrentCamera.CoordinateFrame.p)) * gs_563_1_144
        local tmp101 = gs_563_1_148
      else
        gs_563_1_148.velocity = Vector3.new(0, 0, 0)
        tmp101 = gs_563_1_148
      end
      gs_563_1_147.cframe = workspace.CurrentCamera.CoordinateFrame
      return
    end
    gs_c563_1 = a1
    gs_1_19_143 = gs_c563_1
    if not gs_1_19_143 then goto L33714 end
    if not gs_1_19_142.Character then return end
    gs_563_1_1 = gs_1_19_142.Character.FindFirstChildOfClass(gs_1_19_142.Character, "Humanoid")
    if (gs_1_19_142.Character.FindFirstChild(gs_1_19_142.Character, "Torso")) then
      gs_563_1_2 = gs_1_19_142.Character.Torso
    else
      gs_563_1_2 = gs_1_19_142.Character.UpperTorso
    end
    local tmp93 = not gs_563_1_1
    if gs_563_1_1 then
      tmp93 = not gs_563_1_2
    end
    if tmp93 then return end
    _iter = {ipairs(gs_1_19_142.Character.GetDescendants(gs_1_19_142.Character))}
    ::L33549::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L33588
    end
    gs_563_1_1 = _loopkey
    gs_563_1_2 = _loopval
    if (gs_563_1_2:IsA("BasePart")) then
      gs_563_1_2.CanCollide = false
      gs_563_1_2.Massless = true
      local tmp94 = gs_563_1_2
    end
    goto L33549
    ::L33588::
    gs_563_6_3 = gs_c563_142.Character.DescendantAdded:Connect(fn_764)
    gs_c563_147 = Instance.new("BodyGyro", gs_563_6_2)
    gs_c563_147.P = 90000
    gs_c563_147.maxTorque = Vector3.new(9000000000.0, 9000000000.0, 9000000000.0)
    gs_c563_147.cframe = gs_563_6_2.CFrame
    gs_c563_148 = Instance.new("BodyVelocity", gs_563_6_2)
    gs_c563_148.velocity = Vector3.new(0, 0, 0)
    gs_c563_148.maxForce = Vector3.new(9000000000.0, 9000000000.0, 9000000000.0)
    gs_563_6_1.PlatformStand = true
    gs_c563_149()
    gs_c563_145 = gs_c563_141.Heartbeat:Connect(fn_765)
    goto L33889
    ::L33714::
    if gs_1_19_145 then
      gs_1_19_145.Disconnect(gs_1_19_145)
      gs_1_19_145 = nil
    end
    if not gs_1_19_142.Character then goto L33874 end
    gs_563_10_1 = gs_1_19_142.Character.FindFirstChildOfClass(gs_1_19_142.Character, "Humanoid")
    if gs_563_10_1 then
      gs_563_10_1.PlatformStand = false
      local tmp95 = gs_563_10_1
    end
    _iter = tmp95
    h33796_0_2 = {ipairs(gs_1_19_142.Character.GetDescendants(gs_1_19_142.Character))}
    ::L33796::
    _k2 = {h33796_0_2[1](h33796_0_2[2], h33796_0_2[3])}
    h33796_0_2[3] = _k2[1]
    if not (_k2[1] == nil) then
      goto L33835
    end
    gs_563_10_1 = h33796_0_2[1]
    gs_563_10_2 = h33796_0_2[2]
    if (gs_563_10_2:IsA("BasePart")) then
      gs_563_10_2.CanCollide = true
      gs_563_10_2.Massless = false
      local tmp96 = gs_563_10_2
    end
    goto L33796
    ::L33835::
    if gs_c563_147 then
      gs_c563_147.Destroy(gs_c563_147)
    end
    if gs_c563_148 then
      gs_c563_148.Destroy(gs_c563_148)
    end
    ::L33874::
    gs_1_19_146 = {.f = 0, .b = 0, .l = 0, .r = 0}
    ::L33889::
    return
  end
  fn_564 = function(...)
    local _,  a1 = ...
    gs_c564_1 = a1
    gs_1_19_144 = gs_c564_1
    return
  end
  fn_565 = function(...)
    local _,  a1 = ...
    gs_c565_1 = a1
    wait(1)
    if gs_1_19_143 then
      gs_1_19_150(false)
      wait(0.1)
      gs_1_19_150(true)
    end
    return
  end
  fn_566 = function(...)
    local _,  a1 = ...
    gs_c566_1 = a1
    gs_1_19_150(gs_c566_1)
    return
  end
  fn_567 = function(...)
    local _,  a1 = ...
    gs_c567_1 = a1
    gs_1_19_151(gs_c567_1)
    return
  end
  fn_568 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c568_1 = a1
    _t1 = getgenv()
    _t1.DodgeNoCD = gs_c568_1
    return
  end
  fn_569 = function(...)
            gs_c569_1 = game.Players.LocalPlayer.Character:WaitForChild("Dodge")
    _iter = {next, getgc()}
    ::L33254::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L33358
    end
    gs_c569_1 = _loopkey
    gs_c569_2 = _loopval
    if not ((typeof(gs_c569_2)) == "function") then goto L33355 end
    gs_569_2_1 = getfenv(gs_c569_2)
    if not (gs_569_2_1.script == gs_1_19_1) then goto L33353 end
    _iter = {next, getupvalues(gs_c569_2)}
    ::L33312::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L33350
    end
    gs_569_3_1 = _loopkey
    gs_569_3_2 = _loopval
    if ((tostring(gs_569_3_2)) == "0.4") then
      setupvalue(gs_1_19_2, gs_569_3_1, 0)
    end
    goto L33312
    ::L33350::
    ::L33353::
    ::L33355::
    goto L33254
    ::L33358::
    return
  end
  fn_570 = function(...)
    local _,  a1 = ...
    gs_c570_1 = a1
    InfAblities = gs_c570_1
    return
  end
  fn_571 = function(...)
    fn_763 = function(...)
                      if InfAblities then
        if not (gs_1_19_126.Character.HumanoidRootPart.FindFirstChild(gs_1_19_126.Character.HumanoidRootPart, "Agility")) then
          gs_763_2_1 = gs_1_19_53.FX.Agility.Clone(gs_1_19_53.FX.Agility)
          gs_763_2_1.Name = "Agility"
          gs_763_2_1.Parent = gs_1_19_126.Character.HumanoidRootPart
          local tmp91 = gs_763_2_1
        end
        local tmp92 = tmp91
      else
        gs_1_19_126.Character.HumanoidRootPart.Agility.Destroy(gs_1_19_126.Character.HumanoidRootPart.Agility)
      end
      return
    end
    while (wait(0.2)) do
      pcall(fn_763)
    end
    return
  end
  fn_572 = function(...)
    local _,  a1 = ...
    gs_c572_1 = a1
    infEnergy = gs_c572_1
    if gs_c572_1 then
      getInfinity_Ability("Energy", infEnergy)
    end
    return
  end
  fn_573 = function(...)
    local _,  a1 = ...
      gs_c573_1 = a1
    _G.InfSoru = gs_c573_1
    local tmp90 = _G
    if gs_c573_1 then
      getInfinity_Ability("Soru", _G.InfSoru)
    end
    return
  end
  fn_574 = function(...)
    local _,  a1 = ...
      gs_c574_1 = a1
    _G.InfiniteObRange = gs_c574_1
    local tmp89 = _G
    if gs_c574_1 then
      getInfinity_Ability("Observation", _G.InfiniteObRange)
    end
    return
  end
  fn_575 = function(...)
    local _,  a1 = ...
    gs_c575_1 = a1
    _G.NoAimTeam = gs_c575_1
    return
  end
  fn_576 = function(...)
    local _,  a1 = ...
    gs_c576_1 = a1
    _G.AcceptAlly = gs_c576_1
    return
  end
  fn_577 = function(...)
    fn_762 = function(...)
                  for _key, item in pairs(ply:GetChildren()) do
                    gs_c762_1 = _key
                    gs_c762_2 = item
                    local tmp88 = gs_c762_2.Name ~= gs_c1_126.Name
                    if not (gs_c762_2.Name ~= gs_c1_126.Name) then goto L32954 end
                    tmp88 = gs_c762_2:FindFirstChild("Humanoid")
                    if not (gs_c762_2:FindFirstChild("Humanoid")) then goto L32954 end
                    tmp88 = gs_c762_2:FindFirstChild("HumanoidRootPart")
                    ::L32954::
                    if tmp88 then
                    gs_c1_53:WaitForChild("Remotes")
                    (gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")
                    ((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_")).InvokeServer((gs_c1_53:WaitForChild("Remotes")).WaitForChild(gs_c1_53:WaitForChild("Remotes"), "CommF_"), "AcceptAlly", gs_c762_2.Name)
                    end
                  end
      return
    end
    while (wait(Sec)) do
      if _G.AcceptAlly then
        pcall(fn_762)
      end
    end
    return
  end
  fn_578 = function(...)
    local _,  a1 = ...
    gs_c578_1 = a1
    return gs_c578_1 == nil
  end
  fn_579 = function(...)
    local _,  a1 = ...
    gs_c579_1 = a1
    return math.floor((tonumber(gs_c579_1)) + 0.5)
  end
  fn_580 = function(...)
        fn_761 = function(...)
              local _t1
      if not (isnil(gs_c580_2.Character)) then
        if PlayerEsp then
          local tmp83 = not (isnil(gs_c580_2.Character.Head))
          if not (isnil(gs_c580_2.Character.Head)) then
            tmp83 = not (gs_c580_2.Character.Head:FindFirstChild("NameEsp" .. Number))
          end
          if tmp83 then
            gs_761_3_1 = Instance.new("BillboardGui", gs_c580_2.Character.Head)
            gs_761_3_1.Name = "NameEsp" .. Number
            gs_761_3_1.ExtentsOffset = Vector3.new(0, 1, 0)
            gs_761_3_1.Size = UDim2.new(1, 200, 1, 30)
            gs_761_3_1.Adornee = gs_c580_2.Character.Head
            gs_761_3_1.AlwaysOnTop = true
            gs_761_3_2 = Instance.new("TextLabel", gs_761_3_1)
            gs_761_3_2.Font = Enum.Font.Code
            gs_761_3_2.FontSize = "Size14"
            gs_761_3_2.TextWrapped = true
            gs_761_3_2.Text = gs_c580_2.Name .. (" \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c580_2.Character.Head.Position).Magnitude / 3)) .. " M"))
            gs_761_3_2.Size = UDim2.new(1, 0, 1, 0)
            gs_761_3_2.TextYAlignment = "Top"
            gs_761_3_2.BackgroundTransparency = 1
            gs_761_3_2.TextStrokeTransparency = 0.5
            if (gs_c580_2.Team == gs_c1_156) then
              gs_761_3_2.TextColor3 = Color3.new(0, 0, 254)
            else
              gs_761_3_2.TextColor3 = Color3.new(255, 0, 0)
            end
            local tmp85 = gs_761_3_1
          else
            if (gs_c580_2.Character.Head:FindFirstChild("NameEsp" .. Number)) then
              _t1 = gs_c580_2.Character.Head["NameEsp" .. Number].TextLabel
              _t1.Text = gs_c580_2.Name .. (" | " .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c580_2.Character.Head.Position).Magnitude / 3)) .. (" M\nHealth : " .. ((gs_c1_153((gs_c580_2.Character.Humanoid.Health * 100) / gs_c580_2.Character.Humanoid.MaxHealth)) .. "%"))))
              local tmp84 = gs_c580_2.Character.Head["NameEsp" .. Number].TextLabel
            end
            tmp85 = tmp84
          end
          local tmp86 = tmp85
        else
          if (gs_c580_2.Character.Head:FindFirstChild("NameEsp" .. Number)) then
            gs_c580_2.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
          end
        end
        local tmp87 = tmp86
      end
      return
    end
    for _key, item in pairs(game.Players:GetChildren()) do
      gs_c580_1 = _key
      gs_c580_2 = item
      pcall(fn_761)
    end
    return
  end
  fn_581 = function(...)
        fn_760 = function(...)
      local _t1
          if IslandESP then
        if (gs_c581_2.Name ~= "Sea") then
          if not (gs_c581_2:FindFirstChild("NameEsp")) then
            gs_760_3_1 = Instance.new("BillboardGui", gs_c581_2)
            gs_760_3_1.Name = "NameEsp"
            gs_760_3_1.ExtentsOffset = Vector3.new(0, 1, 0)
            gs_760_3_1.Size = UDim2.new(1, 200, 1, 30)
            gs_760_3_1.Adornee = gs_c581_2
            gs_760_3_1.AlwaysOnTop = true
            gs_760_3_2 = Instance.new("TextLabel", gs_760_3_1)
            gs_760_3_2.Font = Enum.Font.Code
            gs_760_3_2.FontSize = "Size14"
            gs_760_3_2.TextWrapped = true
            gs_760_3_2.Size = UDim2.new(1, 0, 1, 0)
            gs_760_3_2.TextYAlignment = "Top"
            gs_760_3_2.BackgroundTransparency = 1
            gs_760_3_2.TextStrokeTransparency = 0.5
            gs_760_3_2.TextColor3 = Color3.fromRGB(98, 252, 252)
            gs_760_3_2.Text = gs_c581_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c581_2.Position).Magnitude / 3)) .. " M"))
            local tmp80 = gs_760_3_1
          else
            _t1 = gs_c581_2.NameEsp.TextLabel
            _t1.Text = gs_c581_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c581_2.Position).Magnitude / 3)) .. " M"))
            tmp80 = gs_c581_2.NameEsp.TextLabel
          end
          local tmp81 = tmp80
        end
        local tmp82 = tmp81
      else
        if (gs_c581_2:FindFirstChild("NameEsp")) then
          gs_c581_2:FindFirstChild("NameEsp"):Destroy()
        end
      end
      return
    end
    for _key, item in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
      gs_c581_1 = _key
      gs_c581_2 = item
      pcall(fn_760)
    end
    return
  end
  fn_582 = function(...)
        fn_759 = function(...)
      local _t1
          if DevilFruitESP then
        if (string.find(gs_c582_2.Name, "Fruit")) then
          if not (gs_c582_2.Handle:FindFirstChild("NameEsp" .. Number)) then
            gs_759_3_1 = Instance.new("BillboardGui", gs_c582_2.Handle)
            gs_759_3_1.Name = "NameEsp" .. Number
            gs_759_3_1.ExtentsOffset = Vector3.new(0, 1, 0)
            gs_759_3_1.Size = UDim2.new(1, 200, 1, 30)
            gs_759_3_1.Adornee = gs_c582_2.Handle
            gs_759_3_1.AlwaysOnTop = true
            gs_759_3_2 = Instance.new("TextLabel", gs_759_3_1)
            gs_759_3_2.Font = Enum.Font.Code
            gs_759_3_2.FontSize = "Size14"
            gs_759_3_2.TextWrapped = true
            gs_759_3_2.Size = UDim2.new(1, 0, 1, 0)
            gs_759_3_2.TextYAlignment = "Top"
            gs_759_3_2.BackgroundTransparency = 1
            gs_759_3_2.TextStrokeTransparency = 0.5
            gs_759_3_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            gs_759_3_2.Text = gs_c582_2.Name .. (" \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c582_2.Handle.Position).Magnitude / 3)) .. " M"))
            local tmp76 = gs_759_3_1
          else
            _t1 = gs_c582_2.Handle["NameEsp" .. Number].TextLabel
            _t1.Text = "[" .. (gs_c582_2.Name .. ("]" .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c582_2.Handle.Position).Magnitude / 3)) .. " M"))))
            tmp76 = gs_c582_2.Handle["NameEsp" .. Number].TextLabel
          end
          local tmp77 = tmp76
        end
        local tmp79 = tmp77
      else
        local tmp78 = gs_c582_2:FindFirstChild("Handle")
        if (gs_c582_2:FindFirstChild("Handle")) then
          tmp78 = gs_c582_2.Handle:FindFirstChild("NameEsp" .. Number)
        end
        if tmp78 then
          gs_c582_2.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
        end
      end
      return
    end
    for _key, item in pairs(workspace:GetChildren()) do
      gs_c582_1 = _key
      gs_c582_2 = item
      pcall(fn_759)
    end
    return
  end
  fn_583 = function(...)
        fn_758 = function(...)
              local _t1
          local tmp72 = gs_c583_2.Name == "Flower2"
      if not (gs_c583_2.Name == "Flower2") then
        tmp72 = gs_c583_2.Name == "Flower1"
      end
      if not tmp72 then goto L31606 end
      if not FlowerESP then goto L31554 end
      if not not (gs_c583_2:FindFirstChild("NameEsp" .. Number)) then goto L31511 end
      gs_758_3_1 = Instance.new("BillboardGui", gs_c583_2)
      gs_758_3_1.Name = "NameEsp" .. Number
      gs_758_3_1.ExtentsOffset = Vector3.new(0, 1, 0)
      gs_758_3_1.Size = UDim2.new(1, 200, 1, 30)
      gs_758_3_1.Adornee = gs_c583_2
      gs_758_3_1.AlwaysOnTop = true
      gs_758_3_2 = Instance.new("TextLabel", gs_758_3_1)
      gs_758_3_2.Font = Enum.Font.Code
      gs_758_3_2.FontSize = "Size14"
      gs_758_3_2.TextWrapped = true
      gs_758_3_2.Size = UDim2.new(1, 0, 1, 0)
      gs_758_3_2.TextYAlignment = "Top"
      gs_758_3_2.BackgroundTransparency = 1
      gs_758_3_2.TextStrokeTransparency = 0.5
      gs_758_3_2.TextColor3 = Color3.fromRGB(88, 214, 252)
      if (gs_c583_2.Name == "Flower1") then
        gs_758_3_2.Text = "Blue Flower" .. (" \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c583_2.Position).Magnitude / 3)) .. " M"))
        goto L31509
      end
      if not (gs_c583_2.Name == "Flower2") then goto L31509 end
      gs_758_3_2.Text = "Red Flower" .. (" \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c583_2.Position).Magnitude / 3)) .. " M"))
      ::L31509::
      local tmp73 = gs_758_3_1
      goto L31552
      ::L31511::
      _t1 = gs_c583_2["NameEsp" .. Number].TextLabel
      _t1.Text = gs_c583_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c583_2.Position).Magnitude / 3)) .. " M"))
      tmp73 = gs_c583_2["NameEsp" .. Number].TextLabel
      ::L31552::
      local tmp74 = tmp73
      goto L31604
      ::L31554::
      if (gs_c583_2:FindFirstChild("NameEsp" .. Number)) then
        gs_c583_2:FindFirstChild("NameEsp" .. Number):Destroy()
      end
      ::L31604::
      local tmp75 = tmp74
      ::L31606::
      return
    end
    for _key, item in pairs(workspace:GetChildren()) do
      gs_c583_1 = _key
      gs_c583_2 = item
      pcall(fn_758)
    end
    return
  end
  fn_584 = function(...)
        fn_757 = function(...)
          local _t1
          if not EspEventIsland then goto L31155 end
      local tmp68 = gs_c584_2.Name == "Mirage Island"
      if gs_c584_2.Name == "Mirage Island" then goto L30927 end
      tmp68 = gs_c584_2.Name == "Prehistoric Island"
      if gs_c584_2.Name == "Prehistoric Island" then goto L30927 end
      tmp68 = gs_c584_2.Name == "Kitsune Island"
      ::L30927::
      if tmp68 then
        if not (gs_c584_2:FindFirstChild("NameEsp")) then
          gs_757_3_1 = Instance.new("BillboardGui", gs_c584_2)
          gs_757_3_1.Name = "NameEsp"
          gs_757_3_1.ExtentsOffset = Vector3.new(0, 1, 0)
          gs_757_3_1.Size = UDim2.new(1, 200, 1, 30)
          gs_757_3_1.Adornee = gs_c584_2
          gs_757_3_1.AlwaysOnTop = true
          gs_757_3_2 = Instance.new("TextLabel", gs_757_3_1)
          gs_757_3_2.Font = "Code"
          gs_757_3_2.FontSize = "Size14"
          gs_757_3_2.TextWrapped = true
          gs_757_3_2.Size = UDim2.new(1, 0, 1, 0)
          gs_757_3_2.TextYAlignment = "Top"
          gs_757_3_2.BackgroundTransparency = 1
          gs_757_3_2.TextStrokeTransparency = 0.5
          gs_757_3_2.TextColor3 = Color3.fromRGB(80, 245, 245)
          gs_757_3_2.Text = gs_c584_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c584_2.Position).Magnitude / 3)) .. " M"))
          local tmp69 = gs_757_3_1
        else
          _t1 = gs_c584_2.NameEsp.TextLabel
          _t1.Text = gs_c584_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c584_2.Position).Magnitude / 3)) .. " M"))
          tmp69 = gs_c584_2.NameEsp.TextLabel
        end
        local tmp70 = tmp69
      end
      local tmp71 = tmp70
      goto L31199
      ::L31155::
      if (gs_c584_2:FindFirstChild("NameEsp")) then
        gs_c584_2:FindFirstChild("NameEsp"):Destroy()
      end
      ::L31199::
      return
    end
    for _key, item in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
      gs_c584_1 = _key
      gs_c584_2 = item
      pcall(fn_757)
    end
    return
  end
  fn_585 = function(...)
        fn_756 = function(...)
          local _t1
          if ESPGear then
        local tmp64 = gs_c585_2.Name == "Part"
        if (gs_c585_2.Name == "Part") then
          tmp64 = gs_c585_2.Material == Enum.Material.Neon
        end
        if tmp64 then
          if not (gs_c585_2:FindFirstChild("NameEsp")) then
            gs_756_3_1 = Instance.new("BillboardGui", gs_c585_2)
            gs_756_3_1.Name = "NameEsp"
            gs_756_3_1.ExtentsOffset = Vector3.new(0, 1, 0)
            gs_756_3_1.Size = UDim2.new(1, 200, 1, 30)
            gs_756_3_1.Adornee = gs_c585_2
            gs_756_3_1.AlwaysOnTop = true
            gs_756_3_2 = Instance.new("TextLabel", gs_756_3_1)
            gs_756_3_2.Font = "Code"
            gs_756_3_2.FontSize = "Size14"
            gs_756_3_2.TextWrapped = true
            gs_756_3_2.Size = UDim2.new(1, 0, 1, 0)
            gs_756_3_2.TextYAlignment = "Top"
            gs_756_3_2.BackgroundTransparency = 1
            gs_756_3_2.TextStrokeTransparency = 0.5
            gs_756_3_2.TextColor3 = Color3.fromRGB(80, 245, 245)
            gs_756_3_2.Text = "Gear" .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c585_2.Position).Magnitude / 3)) .. " M"))
            local tmp65 = gs_756_3_1
          else
            _t1 = gs_c585_2.NameEsp.TextLabel
            _t1.Text = "Gear" .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_c585_2.Position).Magnitude / 3)) .. " M"))
            tmp65 = gs_c585_2.NameEsp.TextLabel
          end
          local tmp66 = tmp65
        end
        local tmp67 = tmp66
      else
        if (gs_c585_2:FindFirstChild("NameEsp")) then
          gs_c585_2:FindFirstChild("NameEsp"):Destroy()
        end
      end
      return
    end
    _iter = {pairs(workspace.Map.MysticIsland.GetDescendants(workspace.Map.MysticIsland))}
    ::L30532::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L30553
    end
    gs_c585_1 = _loopkey
    gs_c585_2 = _loopval
    pcall(fn_756)
    goto L30532
    ::L30553::
    return
  end
  fn_586 = function(...)
        local _t2
          if not advanEsp then goto L30457 end
    for _key, item in pairs(gs_1_19_155.NPCs:GetChildren()) do
      gs_586_1_1 = _key
      gs_586_1_2 = item
      tmp630 = nil
      tmp631 = nil
      tmp632 = nil
      tmp633 = nil
      tmp634 = nil
      if not (gs_586_1_2.Name == "Advanced Fruit Dealer") then goto L30451 end
      if not (workspace:FindFirstChild("Adv")) then
      Adv = Instance.new("Part")
      Adv.Name = "Adv"
      Adv.Transparency = 1
      Adv.Size = Vector3.new(1, 1, 1)
      Adv.Anchored = true
      Adv.CanCollide = false
      Adv.Parent = workspace
      Adv.CFrame = gs_586_1_2.HumanoidRootPart.CFrame
      local tmp62 = Adv
      tmp620 = nil
      tmp621 = nil
      tmp622 = nil
      tmp623 = nil
      tmp624 = nil
      goto L30449
      end
      tmp620 = nil
      tmp621 = nil
      tmp622 = nil
      tmp623 = nil
      tmp624 = nil
      if not (workspace:FindFirstChild("Adv")) then goto L30449 end
      if not (Adv:FindFirstChild("NameEsp")) then
      gs_586_6_1 = Instance.new("BillboardGui", Adv)
      gs_586_6_1.Name = "NameEsp"
      gs_586_6_1.ExtentsOffset = Vector3.new(0, 1, 0)
      gs_586_6_1.Size = UDim2.new(1, 200, 1, 30)
      gs_586_6_1.Adornee = Adv
      gs_586_6_1.AlwaysOnTop = true
      gs_586_6_2 = Instance.new("TextLabel", gs_586_6_1)
      gs_586_6_2.Font = "Code"
      gs_586_6_2.FontSize = "Size14"
      gs_586_6_2.TextWrapped = true
      gs_586_6_2.Size = UDim2.new(1, 0, 1, 0)
      gs_586_6_2.TextYAlignment = "Top"
      gs_586_6_2.BackgroundTransparency = 1
      gs_586_6_2.TextStrokeTransparency = 0.5
      gs_586_6_2.TextColor3 = Color3.fromRGB(80, 245, 245)
      gs_586_6_2.Text = gs_586_1_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_586_1_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M"))
      local tmp61 = gs_586_6_1
      tmp610 = gs_586_6_2
      tmp611 = gs_586_6_2
      tmp612 = gs_586_6_2
      tmp613 = gs_586_6_2
      tmp614 = gs_586_6_2
      else
      _t2 = Adv.NameEsp.TextLabel
      _t2.Text = gs_586_1_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_586_1_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M"))
      tmp61 = Adv.NameEsp.TextLabel
      tmp610 = nil
      tmp611 = nil
      tmp612 = nil
      tmp613 = nil
      tmp614 = nil
      end
      tmp62 = tmp61
      tmp620 = tmp610
      tmp621 = tmp611
      tmp622 = tmp612
      tmp623 = tmp613
      tmp624 = tmp614
      ::L30449::
      local tmp63 = tmp62
      tmp630 = tmp620
      tmp631 = tmp621
      tmp632 = tmp622
      tmp633 = tmp623
      tmp634 = tmp624
      ::L30451::
    end
    goto L30503
    ::L30457::
    if (workspace:FindFirstChild("Adv")) then
      workspace:FindFirstChild("Adv"):Destroy()
    end
    ::L30503::
    return
  end
  fn_587 = function(...)
        local _t2
          if not ColorEsp then goto L30023 end
    for _key, item in pairs(gs_1_19_155.NPCs:GetChildren()) do
      gs_587_1_1 = _key
      gs_587_1_2 = item
      tmp600 = nil
      tmp601 = nil
      tmp602 = nil
      tmp603 = nil
      tmp604 = nil
      if not (gs_587_1_2.Name == "Barista Cousin") then goto L30017 end
      if not (workspace:FindFirstChild("Gay")) then
      Gay = Instance.new("Part")
      Gay.Name = "Gay"
      Gay.Transparency = 1
      Gay.Size = Vector3.new(1, 1, 1)
      Gay.Anchored = true
      Gay.CanCollide = false
      Gay.Parent = workspace
      Gay.CFrame = gs_587_1_2.HumanoidRootPart.CFrame
      local tmp59 = Gay
      tmp590 = nil
      tmp591 = nil
      tmp592 = nil
      tmp593 = nil
      tmp594 = nil
      goto L30015
      end
      tmp590 = nil
      tmp591 = nil
      tmp592 = nil
      tmp593 = nil
      tmp594 = nil
      if not (workspace:FindFirstChild("Gay")) then goto L30015 end
      if not (Gay:FindFirstChild("NameEsp")) then
      gs_587_6_1 = Instance.new("BillboardGui", Gay)
      gs_587_6_1.Name = "NameEsp"
      gs_587_6_1.ExtentsOffset = Vector3.new(0, 1, 0)
      gs_587_6_1.Size = UDim2.new(1, 200, 1, 30)
      gs_587_6_1.Adornee = Gay
      gs_587_6_1.AlwaysOnTop = true
      gs_587_6_2 = Instance.new("TextLabel", gs_587_6_1)
      gs_587_6_2.Font = "Code"
      gs_587_6_2.FontSize = "Size14"
      gs_587_6_2.TextWrapped = true
      gs_587_6_2.Size = UDim2.new(1, 0, 1, 0)
      gs_587_6_2.TextYAlignment = "Top"
      gs_587_6_2.BackgroundTransparency = 1
      gs_587_6_2.TextStrokeTransparency = 0.5
      gs_587_6_2.TextColor3 = Color3.fromRGB(80, 245, 245)
      gs_587_6_2.Text = gs_587_1_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_587_1_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M"))
      local tmp58 = gs_587_6_1
      tmp580 = gs_587_6_2
      tmp581 = gs_587_6_2
      tmp582 = gs_587_6_2
      tmp583 = gs_587_6_2
      tmp584 = gs_587_6_2
      else
      _t2 = Gay.NameEsp.TextLabel
      _t2.Text = gs_587_1_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_587_1_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M"))
      tmp58 = Gay.NameEsp.TextLabel
      tmp580 = nil
      tmp581 = nil
      tmp582 = nil
      tmp583 = nil
      tmp584 = nil
      end
      tmp59 = tmp58
      tmp590 = tmp580
      tmp591 = tmp581
      tmp592 = tmp582
      tmp593 = tmp583
      tmp594 = tmp584
      ::L30015::
      local tmp60 = tmp59
      tmp600 = tmp590
      tmp601 = tmp591
      tmp602 = tmp592
      tmp603 = tmp593
      tmp604 = tmp594
      ::L30017::
    end
    goto L30069
    ::L30023::
    if (workspace:FindFirstChild("Gay")) then
      workspace:FindFirstChild("Gay"):Destroy()
    end
    ::L30069::
    return
  end
  fn_588 = function(...)
        local _t2
          if not LegenS then goto L29589 end
    for _key, item in pairs(gs_1_19_155.NPCs:GetChildren()) do
      gs_588_1_1 = _key
      gs_588_1_2 = item
      tmp570 = nil
      tmp571 = nil
      tmp572 = nil
      tmp573 = nil
      tmp574 = nil
      if not (gs_588_1_2.Name == "Legendary Sword Dealer") then goto L29583 end
      if not (workspace:FindFirstChild("Lgd")) then
      Lgd = Instance.new("Part")
      Lgd.Name = "Lgd"
      Lgd.Transparency = 1
      Lgd.Size = Vector3.new(1, 1, 1)
      Lgd.Anchored = true
      Lgd.CanCollide = false
      Lgd.Parent = workspace
      Lgd.CFrame = gs_588_1_2.HumanoidRootPart.CFrame
      local tmp56 = Lgd
      tmp560 = nil
      tmp561 = nil
      tmp562 = nil
      tmp563 = nil
      tmp564 = nil
      goto L29581
      end
      tmp560 = nil
      tmp561 = nil
      tmp562 = nil
      tmp563 = nil
      tmp564 = nil
      if not (workspace:FindFirstChild("Lgd")) then goto L29581 end
      if not (Lgd:FindFirstChild("NameEsp")) then
      gs_588_6_1 = Instance.new("BillboardGui", Lgd)
      gs_588_6_1.Name = "NameEsp"
      gs_588_6_1.ExtentsOffset = Vector3.new(0, 1, 0)
      gs_588_6_1.Size = UDim2.new(1, 200, 1, 30)
      gs_588_6_1.Adornee = Lgd
      gs_588_6_1.AlwaysOnTop = true
      gs_588_6_2 = Instance.new("TextLabel", gs_588_6_1)
      gs_588_6_2.Font = "Code"
      gs_588_6_2.FontSize = "Size14"
      gs_588_6_2.TextWrapped = true
      gs_588_6_2.Size = UDim2.new(1, 0, 1, 0)
      gs_588_6_2.TextYAlignment = "Top"
      gs_588_6_2.BackgroundTransparency = 1
      gs_588_6_2.TextStrokeTransparency = 0.5
      gs_588_6_2.TextColor3 = Color3.fromRGB(80, 245, 245)
      gs_588_6_2.Text = gs_588_1_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_588_1_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M"))
      local tmp55 = gs_588_6_1
      tmp550 = gs_588_6_2
      tmp551 = gs_588_6_2
      tmp552 = gs_588_6_2
      tmp553 = gs_588_6_2
      tmp554 = gs_588_6_2
      else
      _t2 = Lgd.NameEsp.TextLabel
      _t2.Text = gs_588_1_2.Name .. ("   \n" .. ((gs_c1_153((gs_c1_154.Character.Head.Position - gs_588_1_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M"))
      tmp55 = Lgd.NameEsp.TextLabel
      tmp550 = nil
      tmp551 = nil
      tmp552 = nil
      tmp553 = nil
      tmp554 = nil
      end
      tmp56 = tmp55
      tmp560 = tmp550
      tmp561 = tmp551
      tmp562 = tmp552
      tmp563 = tmp553
      tmp564 = tmp554
      ::L29581::
      local tmp57 = tmp56
      tmp570 = tmp560
      tmp571 = tmp561
      tmp572 = tmp562
      tmp573 = tmp563
      tmp574 = tmp564
      ::L29583::
    end
    goto L29635
    ::L29589::
    if (workspace:FindFirstChild("Lgd")) then
      workspace:FindFirstChild("Lgd"):Destroy()
    end
    ::L29635::
    return
  end
  fn_589 = function(...)
            fn_755 = function(...)
          local _t1
          gs_c755_1 = (gs_589_1_2.GetPivot(gs_589_1_2)).Position
      gs_c755_2 = (gs_c755_1 - gs_c1_154.Character.Head.Position).Magnitude
      gs_589_1_2.GetFullName(gs_589_1_2)
      gs_c755_3 = (gs_589_1_2.GetFullName(gs_589_1_2)).gsub(gs_589_1_2.GetFullName(gs_589_1_2), "[^%w_]", "_")
      gs_c755_4 = gs_589_1_2:FindFirstChild("ChestEspAttachment")
      if not gs_c755_4 then
        gs_755_1_1 = Instance.new("Attachment")
        gs_755_1_1.Name = "ChestEspAttachment"
        gs_755_1_1.Parent = gs_589_1_2
        gs_755_1_1.Position = Vector3.new(0, 3, 0)
        gs_755_1_2 = Instance.new("BillboardGui")
        gs_755_1_2.Name = "NameEsp"
        gs_755_1_2.Size = UDim2.new(0, 200, 0, 30)
        gs_755_1_2.Adornee = gs_755_1_1
        gs_755_1_2.ExtentsOffset = Vector3.new(0, 1, 0)
        gs_755_1_2.AlwaysOnTop = true
        gs_755_1_2.Parent = gs_755_1_1
        gs_755_1_3 = Instance.new("TextLabel")
        gs_755_1_3.Font = Enum.Font.Code
        gs_755_1_3.TextSize = 14
        gs_755_1_3.TextWrapped = true
        gs_755_1_3.Size = UDim2.new(1, 0, 1, 0)
        gs_755_1_3.TextYAlignment = Enum.TextYAlignment.Top
        gs_755_1_3.BackgroundTransparency = 1
        gs_755_1_3.TextStrokeTransparency = 0.5
        gs_755_1_3.TextColor3 = Color3.fromRGB(80, 245, 245)
        gs_755_1_3.Parent = gs_755_1_2
        local tmp53 = gs_755_1_1
      end
      local tmp54 = gs_c755_4
      if gs_c755_4 then
        tmp54 = gs_c755_4:FindFirstChild("NameEsp")
      end
      gs_c755_5 = tmp54
      if gs_c755_5 then
        gs_755_2_1 = math.floor(gs_c755_2 / 3)
        gs_755_2_2 = gs_589_1_2.Name.gsub(gs_589_1_2.Name, "Label", "")
        _t1 = gs_c755_5.TextLabel
        _t1.Text = string.format("[%s] %d M", gs_755_2_2, gs_755_2_1)
      end
      return
    end
    if not ChestESP then goto L28742 end
    gs_589_1_1 = game:GetService("CollectionService")
    gs_589_1_2 = gs_589_1_1:GetTagged("_ChestTagged")
    _iter = {ipairs(gs_589_1_2)}
    ::L28718::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L28739
    end
    gs_589_1_1 = _loopkey
    gs_589_1_2 = _loopval
    pcall(fn_755)
    goto L28718
    ::L28739::
    goto L28831
    ::L28742::
    game:GetService("CollectionService")
    _iter = {ipairs((game:GetService("CollectionService")).GetTagged(game:GetService("CollectionService"), "_ChestTagged"))}
    ::L28779::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L28829
    end
    gs_589_3_1 = _loopkey
    gs_589_3_2 = _loopval
    gs_589_3_3 = gs_589_3_2:FindFirstChild("ChestEspAttachment")
    if gs_589_3_3 then
      gs_589_3_3.Destroy(gs_589_3_3)
    end
    goto L28779
    ::L28829::
    ::L28831::
    return
  end
  fn_590 = function(...)
              fn_754 = function(...)
          local _t2
                                                                                              gs_c754_1 = (gs_590_1_2.Parent.GetPivot(gs_590_1_2.Parent)).Position
      _iter = {pairs(gs_590_1_2.GetAttributes(gs_590_1_2))}
      ::L28304::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L28660
      end
      gs_c754_1 = _loopkey
      gs_c754_2 = _loopval
      if gs_c754_2 then
        gs_754_2_1 = "BerryEspPart_" .. (gs_c754_2 .. ("_" .. (tostring(gs_590_1_1))))
        gs_754_2_2 = workspace:FindFirstChild(gs_754_2_1)
        if not gs_754_2_2 then
          gs_754_2_2 = Instance.new("Part")
          gs_754_2_2.Name = gs_754_2_1
          gs_754_2_2.Transparency = 1
          gs_754_2_2.Size = Vector3.new(1, 1, 1)
          gs_754_2_2.Anchored = true
          gs_754_2_2.CanCollide = false
          gs_754_2_2.Parent = workspace
          gs_754_2_2.CFrame = CFrame.new(gs_590_1_1)
          local tmp51 = gs_754_2_2
        end
        if not (gs_754_2_2:FindFirstChild("NameEsp")) then
          gs_754_4_1 = Instance.new("BillboardGui", gs_754_2_2)
          gs_754_4_1.Name = "NameEsp"
          gs_754_4_1.ExtentsOffset = Vector3.new(0, 1, 0)
          gs_754_4_1.Size = UDim2.new(0, 200, 0, 30)
          gs_754_4_1.Adornee = gs_754_2_2
          gs_754_4_1.AlwaysOnTop = true
          gs_754_4_2 = Instance.new("TextLabel", gs_754_4_1)
          gs_754_4_2.Font = Enum.Font.Code
          gs_754_4_2.TextSize = 14
          gs_754_4_2.TextWrapped = true
          gs_754_4_2.Size = UDim2.new(1, 0, 1, 0)
          gs_754_4_2.TextYAlignment = Enum.TextYAlignment.Top
          gs_754_4_2.BackgroundTransparency = 1
          gs_754_4_2.TextStrokeTransparency = 0.5
          gs_754_4_2.TextColor3 = Color3.fromRGB(80, 245, 245)
        end
        gs_754_2_3 = gs_754_2_2:FindFirstChild("NameEsp")
        gs_754_2_4 = (gs_root_154.Character.Head.Position - gs_590_1_1).Magnitude / 3
        if gs_754_2_3 then
          _t2 = gs_754_2_3.TextLabel
          _t2.Text = "[" .. (gs_c754_2 .. ("]" .. (" " .. ((math.round(gs_754_2_4)) .. " M"))))
        end
        local tmp52 = tmp51
      end
      goto L28304
      ::L28660::
      return
    end
    if not BerryEsp then goto L28170 end
    gs_590_1_1 = game:GetService("CollectionService")
    gs_590_1_2 = gs_590_1_1:GetTagged("BerryBush")
    _iter = {ipairs(gs_590_1_2)}
    ::L28146::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L28167
    end
    gs_590_1_1 = _loopkey
    gs_590_1_2 = _loopval
    pcall(fn_754)
    goto L28146
    ::L28167::
    goto L28258
    ::L28170::
    _iter = {ipairs(workspace:GetChildren())}
    ::L28194::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L28256
    end
    gs_590_3_1 = _loopkey
    gs_590_3_2 = _loopval
    local tmp50 = gs_590_3_2:IsA("Part")
    if (gs_590_3_2:IsA("Part")) then
      tmp50 = gs_590_3_2.Name.match(gs_590_3_2.Name, "BerryEspPart_.*")
    end
    if tmp50 then
      gs_590_3_2.Destroy(gs_590_3_2)
    end
    goto L28194
    ::L28256::
    ::L28258::
    return
  end
  fn_591 = function(...)
    local _,  a1 = ...
          fn_753 = function(...)
      while BerryEsp do
        berriesEsp()
        task.wait()
      end
      return
    end
    gs_c591_1 = a1
    BerryEsp = gs_c591_1
    if not not gs_c591_1 then goto L28052 end
    _iter = {ipairs(workspace:GetChildren())}
    ::L27987::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L28049
    end
    gs_591_1_1 = _loopkey
    gs_591_1_2 = _loopval
    local tmp49 = gs_591_1_2:IsA("Part")
    if (gs_591_1_2:IsA("Part")) then
      tmp49 = gs_591_1_2.Name.match(gs_591_1_2.Name, "BerryEspPart_.*")
    end
    if tmp49 then
      gs_591_1_2.Destroy(gs_591_1_2)
    end
    goto L27987
    ::L28049::
    goto L28064
    ::L28052::
    task.spawn(fn_753)
    ::L28064::
    return
  end
  fn_592 = function(...)
    local _,  a1 = ...
        fn_751 = function(...)
          local tmp48 = not (isnil(gs_592_1_2.Character))
      if not (isnil(gs_592_1_2.Character)) then
        tmp48 = not (isnil(gs_592_1_2.Character.Head))
      end
      if tmp48 then
        if (gs_592_1_2.Character.Head.FindFirstChild(gs_592_1_2.Character.Head, "NameEsp" .. Number)) then
          gs_592_1_2.Character.Head.FindFirstChild(gs_592_1_2.Character.Head, "NameEsp" .. Number)
          (gs_592_1_2.Character.Head.FindFirstChild(gs_592_1_2.Character.Head, "NameEsp" .. Number)).Destroy(gs_592_1_2.Character.Head.FindFirstChild(gs_592_1_2.Character.Head, "NameEsp" .. Number))
        end
      end
      return
    end
    fn_752 = function(...)
      while PlayerEsp do
        EspPly()
        task.wait()
      end
      return
    end
    gs_c592_1 = a1
    PlayerEsp = gs_c592_1
    if not not gs_c592_1 then goto L27824 end
    for _key, item in pairs(game.Players:GetChildren()) do
      gs_592_1_1 = _key
      gs_592_1_2 = item
      pcall(fn_751)
    end
    goto L27836
    ::L27824::
    task.spawn(fn_752)
    ::L27836::
    return
  end
  fn_593 = function(...)
    local _,  a1 = ...
        fn_750 = function(...)
      while ChestESP do
        ChestEsp()
        task.wait()
      end
      return
    end
    gs_c593_1 = a1
    ChestESP = gs_c593_1
    if not not gs_c593_1 then goto L27731 end
    game:GetService("CollectionService")
    _iter = {ipairs((game:GetService("CollectionService")).GetTagged(game:GetService("CollectionService"), "_ChestTagged"))}
    ::L27678::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L27728
    end
    gs_593_1_1 = _loopkey
    gs_593_1_2 = _loopval
    gs_593_1_3 = gs_593_1_2:FindFirstChild("ChestEspAttachment")
    if gs_593_1_3 then
      gs_593_1_3.Destroy(gs_593_1_3)
    end
    goto L27678
    ::L27728::
    goto L27743
    ::L27731::
    task.spawn(fn_750)
    ::L27743::
    return
  end
  fn_594 = function(...)
    local _,  a1 = ...
        fn_748 = function(...)
          local tmp47 = gs_594_1_2:FindFirstChild("Handle")
      if (gs_594_1_2:FindFirstChild("Handle")) then
        tmp47 = gs_594_1_2.Handle.FindFirstChild(gs_594_1_2.Handle, "NameEsp" .. Number)
      end
      if tmp47 then
        gs_594_1_2.Handle.FindFirstChild(gs_594_1_2.Handle, "NameEsp" .. Number)
        (gs_594_1_2.Handle.FindFirstChild(gs_594_1_2.Handle, "NameEsp" .. Number)).Destroy(gs_594_1_2.Handle.FindFirstChild(gs_594_1_2.Handle, "NameEsp" .. Number))
      end
      return
    end
    fn_749 = function(...)
      while DevilFruitESP do
        DevEsp()
        task.wait()
      end
      return
    end
    gs_c594_1 = a1
    DevilFruitESP = gs_c594_1
    if not not gs_c594_1 then goto L27522 end
    for _key, item in pairs(workspace:GetChildren()) do
      gs_594_1_1 = _key
      gs_594_1_2 = item
      pcall(fn_748)
    end
    goto L27534
    ::L27522::
    task.spawn(fn_749)
    ::L27534::
    return
  end
  fn_595 = function(...)
    local _,  a1 = ...
        fn_746 = function(...)
      if (gs_595_1_2:FindFirstChild("NameEsp")) then
        gs_595_1_2:FindFirstChild("NameEsp"):Destroy()
      end
      return
    end
    fn_747 = function(...)
      while IslandESP do
        LocationEsp()
        task.wait()
      end
      return
    end
    gs_c595_1 = a1
    IslandESP = gs_c595_1
    if not not gs_c595_1 then goto L27387 end
    for _key, item in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
      gs_595_1_1 = _key
      gs_595_1_2 = item
      pcall(fn_746)
    end
    goto L27399
    ::L27387::
    task.spawn(fn_747)
    ::L27399::
    return
  end
  fn_596 = function(...)
    local _,  a1 = ...
        fn_744 = function(...)
              local tmp45 = gs_596_1_2.Name == "Flower2"
      if not (gs_596_1_2.Name == "Flower2") then
        tmp45 = gs_596_1_2.Name == "Flower1"
      end
      local tmp46 = tmp45
      if tmp45 then
        tmp46 = gs_596_1_2:FindFirstChild("NameEsp" .. Number)
      end
      if tmp46 then
        gs_596_1_2:FindFirstChild("NameEsp" .. Number):Destroy()
      end
      return
    end
    fn_745 = function(...)
      while FlowerESP do
        flowerEsp()
        task.wait()
      end
      return
    end
    gs_c596_1 = a1
    FlowerESP = gs_c596_1
    if not not gs_c596_1 then goto L27225 end
    for _key, item in pairs(workspace:GetChildren()) do
      gs_596_1_1 = _key
      gs_596_1_2 = item
      pcall(fn_744)
    end
    goto L27237
    ::L27225::
    task.spawn(fn_745)
    ::L27237::
    return
  end
  fn_597 = function(...)
    local _,  a1 = ...
    fn_743 = function(...)
      while LegenS do
        LegenSword()
        task.wait()
      end
      return
    end
    gs_c597_1 = a1
    LegenS = gs_c597_1
    if not gs_c597_1 then
      if (workspace:FindFirstChild("Lgd")) then
        workspace:FindFirstChild("Lgd"):Destroy()
      end
    else
      task.spawn(fn_743)
    end
    return
  end
  fn_598 = function(...)
    local _,  a1 = ...
    fn_742 = function(...)
      while ColorEsp do
        HakiClorEsp()
        task.wait()
      end
      return
    end
    gs_c598_1 = a1
    ColorEsp = gs_c598_1
    if not gs_c598_1 then
      if (workspace:FindFirstChild("Gay")) then
        workspace:FindFirstChild("Gay"):Destroy()
      end
    else
      task.spawn(fn_742)
    end
    return
  end
  fn_599 = function(...)
    local _,  a1 = ...
        fn_740 = function(...)
      if (gs_599_1_2:FindFirstChild("NameEsp")) then
        gs_599_1_2:FindFirstChild("NameEsp"):Destroy()
      end
      return
    end
    fn_741 = function(...)
      while ESPGear do
        gearEsp()
        task.wait()
      end
      return
    end
    gs_c599_1 = a1
    ESPGear = gs_c599_1
    if not not gs_c599_1 then goto L26895 end
    _iter = {pairs(workspace.Map.MysticIsland.GetDescendants(workspace.Map.MysticIsland))}
    ::L26871::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L26892
    end
    gs_599_1_1 = _loopkey
    gs_599_1_2 = _loopval
    pcall(fn_740)
    goto L26871
    ::L26892::
    goto L26907
    ::L26895::
    task.spawn(fn_741)
    ::L26907::
    return
  end
  fn_600 = function(...)
    local _,  a1 = ...
        fn_738 = function(...)
      if (gs_600_1_2:FindFirstChild("NameEsp")) then
        gs_600_1_2:FindFirstChild("NameEsp"):Destroy()
      end
      return
    end
    fn_739 = function(...)
      while EspEventIsland do
        EventIslandEsp()
        task.wait()
      end
      return
    end
    gs_c600_1 = a1
    EspEventIsland = gs_c600_1
    if not not gs_c600_1 then goto L26751 end
    for _key, item in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
      gs_600_1_1 = _key
      gs_600_1_2 = item
      pcall(fn_738)
    end
    goto L26763
    ::L26751::
    task.spawn(fn_739)
    ::L26763::
    return
  end
  fn_601 = function(...)
    local _,  a1 = ...
    fn_737 = function(...)
      while advanEsp do
        AdvanFruitEsp()
        task.wait()
      end
      return
    end
    gs_c601_1 = a1
    advanEsp = gs_c601_1
    if not gs_c601_1 then
      if (workspace:FindFirstChild("Adv")) then
        workspace:FindFirstChild("Adv"):Destroy()
      end
    else
      task.spawn(fn_737)
    end
    return
  end
  fn_602 = function(...)
    gs_1_19_155.Remotes.CommF_.InvokeServer(gs_1_19_155.Remotes.CommF_, "TravelMain")
    return
  end
  fn_603 = function(...)
    gs_1_19_155.Remotes.CommF_.InvokeServer(gs_1_19_155.Remotes.CommF_, "TravelDressrosa")
    return
  end
  fn_604 = function(...)
    gs_1_19_155.Remotes.CommF_.InvokeServer(gs_1_19_155.Remotes.CommF_, "TravelZou")
    return
  end
  fn_605 = function(...)
    local _,  a1 = ...
    gs_c605_1 = a1
    _G.Island = gs_c605_1
    return
  end
  fn_606 = function(...)
    local _,  a1 = ...
                  gs_c606_1 = a1
    _G.Teleport = gs_c606_1
    local tmp44 = _G
    if not gs_c606_1 then goto L26527 end
    _iter = _G
    h26448_0_2 = {pairs(workspace._WorldOrigin.Locations:GetChildren())}
    ::L26448::
    _k1 = {h26448_0_2[1](h26448_0_2[2], h26448_0_2[3])}
    h26448_0_2[3] = _k1[1]
    if not (_k1[1] == nil) then
      goto L26524
    end
    gs_606_1_1 = h26448_0_2[1]
    gs_606_1_2 = h26448_0_2[2]
    local tmp43 = _iter
    if not (gs_606_1_2.Name == _G.Island) then goto L26521 end
    _iter = _iter
    ::L26469::
    wait()
    _tp(gs_606_1_2.CFrame * (CFrame.new(0, 30, 0)))
    local tmp42 = not _G.Teleport
    if _G.Teleport then
      tmp42 = Root.CFrame == gs_606_1_2.CFrame
    end
    if not (tmp42) then
      goto L26469
    end
    tmp43 = _iter
    ::L26521::
    _iter = tmp43
    goto L26448
    ::L26524::
    ::L26527::
    return
  end
  fn_607 = function(...)
    local _,  a1 = ...
    gs_c607_1 = a1
    _G.Island_PT = gs_c607_1
    return
  end
  fn_608 = function(...)
    if (_G.Island_PT == "Sky") then
      gs_1_20_155.Remotes.CommF_.InvokeServer(gs_1_20_155.Remotes.CommF_, "requestEntrance", Vector3.new(-7894, 5547, -380))
      goto L26399
    end
    if (_G.Island_PT == "UnderWater") then
      gs_1_20_155.Remotes.CommF_.InvokeServer(gs_1_20_155.Remotes.CommF_, "requestEntrance", Vector3.new(61163, 11, 1819))
      goto L26399
    end
    if (_G.Island_PT == "SwanRoom") then
      gs_1_20_155.Remotes.CommF_.InvokeServer(gs_1_20_155.Remotes.CommF_, "requestEntrance", Vector3.new(2285, 15, 905))
      goto L26399
    end
    if (_G.Island_PT == "Cursed Ship") then
      gs_1_20_155.Remotes.CommF_.InvokeServer(gs_1_20_155.Remotes.CommF_, "requestEntrance", Vector3.new(923, 126, 32852))
      goto L26399
    end
    if (_G.Island_PT == "Castle On The Sea") then
      gs_1_20_155.Remotes.CommF_.InvokeServer(gs_1_20_155.Remotes.CommF_, "requestEntrance", Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
      goto L26399
    end
    if (_G.Island_PT == "Mansion Cafe") then
      gs_1_20_155.Remotes.CommF_.InvokeServer(gs_1_20_155.Remotes.CommF_, "requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
      goto L26399
    end
    if (_G.Island_PT == "Hydra Teleport") then
      gs_1_20_155.Remotes.CommF_.InvokeServer(gs_1_20_155.Remotes.CommF_, "requestEntrance", Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
      goto L26399
    end
    if (_G.Island_PT == "Canvendish Room") then
      gs_1_20_155.Remotes.CommF_.InvokeServer(gs_1_20_155.Remotes.CommF_, "requestEntrance", Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
      goto L26399
    end
    if not (_G.Island_PT == "Temple of Time") then goto L26399 end
    gs_1_20_155.Remotes.CommF_.InvokeServer(gs_1_20_155.Remotes.CommF_, "requestEntrance", Vector3.new(28310.0234, 14895.1123, 109.456741, -0.469690144, -2.85620132e-08, -0.882831335, -3.23509219e-08, 1, -1.51411736e-08, 0.882831335, 2.14487486e-08, -0.469690144))
    ::L26399::
    return
  end
  fn_609 = function(...)
    local _,  a1 = ...
    gs_c609_1 = a1
    NPClist = gs_c609_1
    return
  end
  fn_610 = function(...)
    local _,  a1 = ...
    gs_c610_1 = a1
    _G.TPNpc = gs_c610_1
    return
  end
  fn_611 = function(...)
    fn_736 = function(...)
              for _key, item in pairs(gs_1_24_155.NPCs:GetChildren()) do
                gs_c736_1 = _key
                gs_c736_2 = item
                if (gs_c736_2.Name == NPClist) then
                _tp(gs_c736_2.HumanoidRootPart.CFrame)
                end
              end
      return
    end
    while (wait(Sec)) do
      if _G.TPNpc then
        pcall(fn_736)
      end
    end
    return
  end
  fn_612 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyHaki", "Buso")
    return
  end
  fn_613 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyHaki", "Geppo")
    return
  end
  fn_614 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyHaki", "Soru")
    return
  end
  fn_615 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "KenTalk", "Buy")
    return
  end
  fn_616 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyBlackLeg")
    return
  end
  fn_617 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyElectro")
    return
  end
  fn_618 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyFishmanKarate")
    return
  end
  fn_619 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BlackbeardReward", "DragonClaw", "2")
    return
  end
  fn_620 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuySuperhuman")
    return
  end
  fn_621 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyDeathStep")
    return
  end
  fn_622 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuySharkmanKarate")
    return
  end
  fn_623 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyElectricClaw")
    return
  end
  fn_624 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyDragonTalon")
    return
  end
  fn_625 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyGodhuman")
    return
  end
  fn_626 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuySanguineArt")
    return
  end
  fn_627 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Tomoe Ring")
    return
  end
  fn_628 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Black Cape")
    return
  end
  fn_629 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Swordsman Hat")
    return
  end
  fn_630 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "Ectoplasm", "Buy", 1)
    return
  end
  fn_631 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "Ectoplasm", "Buy", 2)
    return
  end
  fn_632 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Cutlass")
    return
  end
  fn_633 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Katana")
    return
  end
  fn_634 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Iron Mace")
    return
  end
  fn_635 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Duel Katana")
    return
  end
  fn_636 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Triple Katana")
    return
  end
  fn_637 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Pipe")
    return
  end
  fn_638 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Dual-Headed Blade")
    return
  end
  fn_639 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Bisento")
    return
  end
  fn_640 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Soul Cane")
    return
  end
  fn_641 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Slingshot")
    return
  end
  fn_642 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Musket")
    return
  end
  fn_643 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Dual Flintlock")
    return
  end
  fn_644 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Flintlock")
    return
  end
  fn_645 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Refined Flintlock")
    return
  end
  fn_646 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BuyItem", "Cannon")
    return
  end
  fn_647 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BlackbeardReward", "Slingshot", "2")
    return
  end
  fn_648 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BlackbeardReward", "Refund", "2")
    return
  end
  fn_649 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "BlackbeardReward", "Reroll", "2")
    return
  end
  fn_650 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "Ectoplasm", " Change", 4)
    return
  end
  fn_651 = function(...)
    gs_1_24_155.Remotes.CommF_.InvokeServer(gs_1_24_155.Remotes.CommF_, "CyborgTrainer", " Buy")
    return
  end
  fn_652 = function(...)
      _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    gs_c652_1 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)
    gs_c652_2 = game.Players.LocalPlayer
    local tmp41 = gs_c652_2.Character
    if not (gs_c652_2.Character) then
      tmp41 = gs_c652_2.CharacterAdded.Wait(gs_c652_2.CharacterAdded)
    end
    gs_c652_3 = tmp41
    ::L25023::
    wait()
    if not ((gs_c652_3.HumanoidRootPart.Position - gs_c652_1).Magnitude < 1) then
      goto L25023
    end
    gs_c652_4 = ({{{.NPC = "Dragon Wizard", .Command = "DragonRace"}}})[1]
    (game:GetService("ReplicatedStorage")).Modules.Net.FindFirstChild((game:GetService("ReplicatedStorage")).Modules.Net, "RF/InteractDragonQuest")
    ((game:GetService("ReplicatedStorage")).Modules.Net.FindFirstChild((game:GetService("ReplicatedStorage")).Modules.Net, "RF/InteractDragonQuest")).InvokeServer((game:GetService("ReplicatedStorage")).Modules.Net.FindFirstChild((game:GetService("ReplicatedStorage")).Modules.Net, "RF/InteractDragonQuest"), unpack(gs_c652_4))
    return
  end
  fn_653 = function(...)
        fn_735 = function(...)
      if gs_1_24_4.InvokeServer then
        gs_1_24_4:InvokeServer(gs_c653_2)
      else
        gs_1_24_4:FireServer(gs_c653_2)
      end
      return
    end
    gs_c653_1 = ({{"LIGHTNINGABUSE", "1LOSTADMIN", "ADMINFIGHT", "GIFTING_HOURS", "NOMOREHACK", "BANEXPLOIT", "WildDares", "BossBuild", "GetPranked", "EARN_FRUITS", "SUB2GAMERROBOT_RESET1", "KITT_RESET", "Bignews", "CHANDLER", "Fudd10", "fudd10_v2", "Sub2UncleKizaru", "FIGHT4FRUIT", "kittgaming", "TRIPLEABUSE", "Sub2CaptainMaui", "Sub2Fer999", "Enyu_is_Pro", "Magicbus", "JCWK", "Starcodeheo", "Bluxxy", "SUB2GAMERROBOT_EXP1", "Sub2NoobMaster123", "Sub2Daigrock", "Axiore", "TantaiGaming", "StrawHatMaine", "Sub2OfficialNoobie", "TheGreatAce", "JULYUPDATE_RESET", "ADMINHACKED", "SEATROLLING", "24NOADMIN", "ADMIN_TROLL", "NEWTROLL", "SECRET_ADMIN", "staffbattle", "NOEXPLOIT", "NOOB2ADMIN", "CODESLIDE", "fruitconcepts", "krazydares"}})[1]
    gs_c653_2 = game:GetService("ReplicatedStorage")
    gs_c653_3 = gs_c653_2:WaitForChild("Remotes")
    gs_c653_4 = gs_c653_3:FindFirstChild("Redeem")
    if not gs_c653_4 then return end
    _iter = {ipairs(gs_c653_1)}
    ::L24876::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L24907
    end
    gs_c653_1 = _loopkey
    gs_c653_2 = _loopval
    task.wait(0)
    pcall(fn_735)
    goto L24876
    ::L24907::
    return
  end
  fn_654 = function(...)
    game:GetService("TeleportService")
    (game:GetService("TeleportService")).Teleport(game:GetService("TeleportService"), game.PlaceId, game.Players.LocalPlayer)
    return
  end
  fn_655 = function(...)
    fn_732 = function(...)
                  fn_733 = function(...)
        gs_c733_1 = "https://games.roblox.com/v1/games/" .. (gs_c732_3 .. "/servers/Public?sortOrder=Asc&limit=100")
        gs_c733_2 = game:HttpGet(gs_c733_1)
        return (gs_c732_1:JSONDecode(gs_c733_2)).data
      end
      fn_734 = function(...)
        gs_732_1_2:TeleportToPlaceInstance(gs_732_1_3, gs_732_2_1, gs_732_1_4.LocalPlayer)
        return
      end
      gs_c732_1 = game:GetService("HttpService")
      gs_c732_2 = game:GetService("TeleportService")
      gs_c732_3 = game.PlaceId
      gs_c732_4 = game:GetService("Players")
      gs_c732_5 = pcall(fn_733)
      gs_c732_6 = ({pcall(fn_733)})[2]
      local tmp40 = gs_c732_5
      if gs_c732_5 then
        tmp40 = gs_c732_6
      end
      if not tmp40 then goto L24588 end
      _iter = {pairs(gs_c732_6)}
      ::L24542::
      _k1 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k1[1]
      if not (_k1[1] == nil) then
        goto L24571
      end
      gs_732_1_1 = _loopkey
      gs_732_1_2 = _loopval
      if (gs_732_1_2.playing < gs_732_1_2.maxPlayers) then
        gs_c732_1 = gs_732_1_2.id
      end
      goto L24542
      ::L24571::
      if gs_732_2_1 then
        pcall(fn_734)
      end
      ::L24588::
      return
    end
    task.spawn(fn_732)
    return
  end
  fn_656 = function(...)
    fn_731 = function(...)
      local _,  a1 = ...
              gs_c731_1 = a1
      if gs_c731_1 then
      end
      if not (j24388_2_3) then
      end
      gs_c731_2 = game:HttpGet(gs_c656_5 .. j24392_2_3)
      return gs_c656_1:JSONDecode(gs_c731_2)
    end
    gs_c656_1 = game:GetService("HttpService")
    gs_c656_2 = game:GetService("TeleportService")
    gs_c656_3 = "https://games.roblox.com/v1/games/"
    gs_c656_4 = game.PlaceId
    gs_c656_5 = gs_c656_3 .. (gs_c656_4 .. "/servers/Public?sortOrder=Asc&limit=100")
    ListServers = fn_731
    ::L24325::
    gs_656_1_1 = ListServers(gs_c656_7)
    gs_c656_6 = gs_656_1_1.data[1]
    gs_c656_7 = gs_656_1_1.nextPageCursor
    if not (gs_c656_6) then
      goto L24325
    end
    gs_c656_2:TeleportToPlaceInstance(gs_c656_4, gs_c656_6.id, gs_1_24_154)
    return
  end
  fn_657 = function(...)
          fn_729 = function(...)
      local _,  a1, a2 = ...
          fn_730 = function(...)
        return gs_c657_1:JSONDecode(game:HttpGet(gs_c729_3))
      end
      gs_c729_1 = a1
      gs_c729_2 = a2
      gs_c729_3 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", gs_c729_1, gs_c729_2)
      gs_c729_4 = pcall(fn_730)
      gs_c729_5 = ({pcall(fn_730)})[2]
      local tmp39 = gs_c729_4
      if not gs_c729_4 then goto L24213 end
      tmp39 = gs_c729_5
      if not gs_c729_5 then goto L24213 end
      tmp39 = gs_c729_5.data
      ::L24213::
      if tmp39 then return {gs_c729_5.data} end
      return
    end
    gs_c657_1 = game:GetService("HttpService")
    gs_c657_2 = game:GetService("TeleportService")
    gs_c657_3 = game:GetService("Stats")
    gs_c657_4 = fn_729
    gs_c657_5 = game.PlaceId
    gs_c657_6 = 100
    gs_c657_7 = gs_c657_4(gs_c657_5, gs_c657_6)
    if not gs_c657_7 then return end
    gs_c657_8 = gs_c657_7[1]
    _iter = {pairs(gs_c657_7)}
    ::L24016::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L24054
    end
    gs_c657_1 = _loopkey
    gs_c657_2 = _loopval
    local tmp38 = gs_c657_2.ping < gs_1_24_8.ping
    if (gs_c657_2.ping < gs_1_24_8.ping) then
      tmp38 = gs_c657_2.maxPlayers > gs_c657_2.playing
    end
    if tmp38 then
      gs_1_24_8 = gs_c657_2
    end
    goto L24016
    ::L24054::
    gs_657_2_9 = 0.5
    task.wait(gs_657_2_9)
    gs_657_2_10 = 100
    gs_657_2_11 = gs_657_2_3.Network.ServerStatsItem
    gs_657_2_12 = gs_657_2_11["Data Ping"].GetValueString(gs_657_2_11["Data Ping"])
    gs_657_2_13 = tonumber(gs_657_2_12:match("(%d+)"))
    if (gs_657_2_13 >= gs_657_2_10) then
      gs_657_2_2:TeleportToPlaceInstance(gs_657_2_5, gs_657_2_8.id)
    end
    return
  end
  fn_658 = function(...)
    local _,  a1 = ...
    local _t1
    gs_c658_1 = a1
    _t1 = getgenv()
    _t1.Job = gs_c658_1
    return
  end
  fn_659 = function(...)
      local tmp37 = (getgenv()).Job
    if (getgenv()).Job then
      tmp37 = (getgenv()).Job ~= ""
    end
    if tmp37 then
      game:GetService("TeleportService")
      (game:GetService("TeleportService")).TeleportToPlaceInstance(game:GetService("TeleportService"), game.PlaceId, (getgenv()).Job, game.Players.LocalPlayer)
    end
    return
  end
  fn_660 = function(...)
    setclipboard(tostring(game.JobId))
    return
  end
  fn_661 = function(...)
    local _t1
    _t1 = gs_1_24_154.PlayerGui.Main.AwakeningToggler
    _t1.Visible = true
    return
  end
  fn_662 = function(...)
    local _t1
    gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "getTitles", true)
    _t1 = gs_1_24_154.PlayerGui.Main.Titles
    _t1.Visible = true
    return
  end
  fn_663 = function(...)
    local _,  a1 = ...
      gs_c663_1 = a1
    _G.Rechat = gs_c663_1
    if (_G.Rechat == true) then
      gs_663_1_1 = game:GetService("StarterGui")
      gs_663_1_1:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
      goto L23744
    end
    local tmp36 = _G
    if not (_G.chat == false) then goto L23744 end
    gs_663_2_1 = game:GetService("StarterGui")
    gs_663_2_1:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
    ::L23744::
    return
  end
  fn_664 = function(...)
    local _,  a1 = ...
    gs_c664_1 = a1
    ReLeader = gs_c664_1
    if (ReLeader == true) then
      gs_664_1_1 = game:GetService("StarterGui")
      gs_664_1_1:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
      goto L23635
    end
    if not (ReLeader == false) then goto L23635 end
    gs_664_2_1 = game:GetService("StarterGui")
    gs_664_2_1:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
    ::L23635::
    return
  end
  fn_665 = function(...)
    Pirates()
    return
  end
  fn_666 = function(...)
    Marines()
    return
  end
  fn_667 = function(...)
    local _,  a1 = ...
    gs_c667_1 = a1
    _G.PortalUnLock = gs_c667_1
    return
  end
  fn_668 = function(...)
    fn_728 = function(...)
      if not _G.PortalUnLock then goto L23505 end
      if (gs_1_24_13.Pos(CstlePos_Miti, 8)) then
        gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        goto L23503
      end
      if (gs_1_24_13.Pos(Man3Pos_Miti, 8)) then
        gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "requestEntrance", Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
        goto L23503
      end
      if (gs_1_24_13.Pos(HydraPos_Miti, 8)) then
        gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "requestEntrance", Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))
        goto L23503
      end
      if not (gs_1_24_13.Pos(HydratoCastle, 8)) then goto L23503 end
      gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "requestEntrance", Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
      ::L23503::
      ::L23505::
      return
    end
    while (wait(Sec)) do
      pcall(fn_728)
    end
    return
  end
  fn_669 = function(...)
    local _,  a1 = ...
    gs_c669_1 = a1
    _G.SelectStateHaki = gs_c669_1
    return
  end
  fn_670 = function(...)
    if (_G.SelectStateHaki == "State 0") then
      gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "ChangeBusoStage", 0)
      goto L23281
    end
    if (_G.SelectStateHaki == "State 1") then
      gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "ChangeBusoStage", 1)
      goto L23281
    end
    if (_G.SelectStateHaki == "State 2") then
      gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "ChangeBusoStage", 2)
      goto L23281
    end
    if (_G.SelectStateHaki == "State 3") then
      gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "ChangeBusoStage", 3)
      goto L23281
    end
    if (_G.SelectStateHaki == "State 4") then
      gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "ChangeBusoStage", 4)
      goto L23281
    end
    if not (_G.SelectStateHaki == "State 5") then goto L23281 end
    gs_1_24_157.Remotes.CommF_.InvokeServer(gs_1_24_157.Remotes.CommF_, "ChangeBusoStage", 5)
    ::L23281::
    return
  end
  fn_671 = function(...)
    local _,  a1 = ...
      local _t1
          local _t2
                      gs_c671_1 = a1
    _G.RTXMode = gs_c671_1
    gs_c671_2 = game.Lighting
    gs_c671_3 = Instance.new("ColorCorrectionEffect", gs_c671_2)
    gs_c671_4 = Instance.new("ColorCorrectionEffect", gs_c671_2)
    OldAmbient = gs_c671_2.Ambient
    OldBrightness = gs_c671_2.Brightness
    OldColorShift_Top = gs_c671_2.ColorShift_Top
    OldBrightnessc = gs_c671_3.Brightness
    OldContrastc = gs_c671_3.Contrast
    OldTintColorc = gs_c671_3.TintColor
    OldTintColore = gs_c671_4.TintColor
    _iter = _G
    if not not _G.RTXMode then goto L22894 end
    return
    ::L22894::
    if _G.RTXMode then
      wait()
      gs_c671_2.Ambient = Color3.fromRGB(33, 33, 33)
      gs_c671_2.Brightness = 0.3
      gs_c671_3.Brightness = 0.176
      gs_c671_3.Contrast = 0.39
      gs_c671_3.TintColor = Color3.fromRGB(217, 145, 57)
      _t1 = game.Lighting
      _t1.FogEnd = 999
      if not (gs_1_24_154.Character.HumanoidRootPart.FindFirstChild(gs_1_24_154.Character.HumanoidRootPart, "PointLight")) then
        gs_671_3_1 = Instance.new("PointLight")
        gs_671_3_1.Parent = gs_1_24_154.Character.HumanoidRootPart
        gs_671_3_1.Range = 15
        gs_671_3_1.Color = Color3.fromRGB(217, 145, 57)
      end
      local tmp35 = gs_c671_2
      if not _G.RTXMode then
        gs_c671_2.Ambient = OldAmbient
        gs_c671_2.Brightness = OldBrightness
        gs_c671_2.ColorShift_Top = OldColorShift_Top
        gs_c671_3.Contrast = OldContrastc
        gs_c671_3.Brightness = OldBrightnessc
        gs_c671_3.TintColor = OldTintColorc
        gs_c671_4.TintColor = OldTintColore
        _t2 = game.Lighting
        _t2.FogEnd = 2500
        gs_1_24_154.Character.HumanoidRootPart.FindFirstChild(gs_1_24_154.Character.HumanoidRootPart, "PointLight")
        (gs_1_24_154.Character.HumanoidRootPart.FindFirstChild(gs_1_24_154.Character.HumanoidRootPart, "PointLight")).Destroy(gs_1_24_154.Character.HumanoidRootPart.FindFirstChild(gs_1_24_154.Character.HumanoidRootPart, "PointLight"))
      end
      _iter = tmp35
      goto L22894
    end
    return
  end
  fn_672 = function(...)
          _iter = {next, workspace.GetDescendants(workspace)}
    ::L22761::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L22796
    end
    gs_c672_1 = _loopkey
    gs_c672_2 = _loopval
    if (table.find(gs_1_20_4, gs_c672_2.ClassName)) then
      gs_c672_2.Material = "Plastic"
      local tmp34 = gs_c672_2
    end
    goto L22761
    ::L22796::
    return
  end
  fn_673 = function(...)
    LowCpu()
    return
  end
  fn_674 = function(...)
          local _t2
    local _t3
    local _t4
    local _t5
            _iter = {pairs(workspace.Boats.GetDescendants(workspace.Boats))}
    ::L22649::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L22731
    end
    gs_c674_1 = _loopkey
    gs_c674_2 = _loopval
    local tmp32 = table.find(gs_1_20_118, gs_c674_2.Name)
    if (table.find(gs_1_20_118, gs_c674_2.Name)) then
      tmp32 = (tostring(gs_c674_2.Owner.Value)) == (tostring(gs_1_20_154.Name))
    end
    if tmp32 then
      _t2 = gs_c674_2.VehicleSeat
      _t2.MaxSpeed = 350
      _t3 = gs_c674_2.VehicleSeat
      _t3.Torque = 0.2
      _t4 = gs_c674_2.VehicleSeat
      _t4.TurnSpeed = 5
      _t5 = gs_c674_2.VehicleSeat
      _t5.HeadsUpDisplay = true
      local tmp33 = gs_c674_2.VehicleSeat
    end
    goto L22649
    ::L22731::
    return
  end
  fn_675 = function(...)
    if (Lighting:FindFirstChild("LightingLayers")) then
      Lighting.LightingLayers.Destroy(Lighting.LightingLayers)
    end
    if (Lighting:FindFirstChild("SeaTerrorCC")) then
      Lighting.SeaTerrorCC.Destroy(Lighting.SeaTerrorCC)
    end
    if (Lighting:FindFirstChild("FantasySky")) then
      Lighting.FantasySky.Destroy(Lighting.FantasySky)
    end
    return
  end
  fn_676 = function(...)
    local _,  a1 = ...
    gs_c676_1 = a1
    pSats = gs_c676_1
    return
  end
  fn_677 = function(...)
    local _,  a1 = ...
    gs_c677_1 = a1
    _G.Auto_Melee = gs_c677_1
    return
  end
  fn_678 = function(...)
    fn_727 = function(...)
      if _G.Auto_Melee then
        statsSetings("Melee", pSats)
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_727)
    end
    return
  end
  fn_679 = function(...)
    local _,  a1 = ...
    gs_c679_1 = a1
    _G.Auto_Sword = gs_c679_1
    return
  end
  fn_680 = function(...)
    fn_726 = function(...)
      if _G.Auto_Sword then
        statsSetings("Sword", pSats)
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_726)
    end
    return
  end
  fn_681 = function(...)
    local _,  a1 = ...
    gs_c681_1 = a1
    _G.Auto_Gun = gs_c681_1
    return
  end
  fn_682 = function(...)
    fn_725 = function(...)
      if _G.Auto_Gun then
        statsSetings("Gun", pSats)
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_725)
    end
    return
  end
  fn_683 = function(...)
    local _,  a1 = ...
    gs_c683_1 = a1
    _G.Auto_DevilFruit = gs_c683_1
    return
  end
  fn_684 = function(...)
    fn_724 = function(...)
      if _G.Auto_DevilFruit then
        statsSetings("Devil", pSats)
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_724)
    end
    return
  end
  fn_685 = function(...)
    local _,  a1 = ...
    gs_c685_1 = a1
    _G.Auto_Defense = gs_c685_1
    return
  end
  fn_686 = function(...)
    fn_723 = function(...)
      if _G.Auto_Defense then
        statsSetings("Defense", pSats)
      end
      return
    end
    while (wait(Sec)) do
      pcall(fn_723)
    end
    return
  end
  fn_687 = function(...)
        fn_722 = function(...)
      local _,  a1 = ...
      gs_c722_1 = a1
      if (gs_c722_1.Parent == gs_1_20_154.Character) then
        gs_c687_2.Parent = gs_1_20_154.Backpack
        gs_1_20_154.Character.Humanoid.EquipTool(gs_1_20_154.Character.Humanoid, gs_c687_2)
      end
      return
    end
    _iter = {pairs((game:GetObjects("rbxassetid://14759368201"))[1].GetChildren((game:GetObjects("rbxassetid://14759368201"))[1]))}
    ::L22038::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L22201
    end
    gs_c687_1 = _loopkey
    gs_c687_2 = _loopval
    gs_c687_2.Parent = game.Workspace.Map
    gs_c687_2:MoveTo(gs_1_20_154.Character.PrimaryPart.Position + (Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))))
    if (gs_c687_2.Fruit:FindFirstChild("AnimationController")) then
      gs_c687_2.Fruit:FindFirstChild("AnimationController")
      (gs_c687_2.Fruit:FindFirstChild("AnimationController")).LoadAnimation(gs_c687_2.Fruit:FindFirstChild("AnimationController"), gs_c687_2.Fruit:FindFirstChild("Idle"))
      ((gs_c687_2.Fruit:FindFirstChild("AnimationController")).LoadAnimation(gs_c687_2.Fruit:FindFirstChild("AnimationController"), gs_c687_2.Fruit:FindFirstChild("Idle"))).Play((gs_c687_2.Fruit:FindFirstChild("AnimationController")).LoadAnimation(gs_c687_2.Fruit:FindFirstChild("AnimationController"), gs_c687_2.Fruit:FindFirstChild("Idle")))
    end
    gs_c687_2.Handle.Touched:Connect(fn_722)
    goto L22038
    ::L22201::
    return
  end
  fn_688 = function(...)
    local _,  a1 = ...
          gs_c688_1 = a1
    bright = gs_c688_1
    if (gs_c688_1 == true) then
      Lighting.Ambient = Color3.new(1, 1, 1)
      Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
      Lighting.ColorShift_Top = Color3.new(1, 1, 1)
      local tmp31 = Lighting
    else
      Lighting.Ambient = Color3.new(0, 0, 0)
      Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
      Lighting.ColorShift_Top = Color3.new(0, 0, 0)
      tmp31 = Lighting
    end
    return
  end
  fn_689 = function(...)
    local _,  a1 = ...
    gs_c689_1 = a1
    _G.SelectDN = gs_c689_1
    return
  end
  fn_690 = function(...)
    local _,  a1 = ...
    gs_c690_1 = a1
    _G.daylightN = gs_c690_1
    return
  end
  fn_691 = function(...)
        ::L21813::
    if not (task.wait()) then goto L21868 end
    if not _G.daylightN then goto L21866 end
    if (_G.SelectDN == "Day") then
      Lighting.ClockTime = 12
      local tmp29 = Lighting
      goto L21864
    end
    if not (_G.SelectDN == "Night") then goto L21864 end
    Lighting.ClockTime = 0
    tmp29 = Lighting
    ::L21864::
    local tmp30 = tmp29
    ::L21866::
    goto L21813
    ::L21868::
    return
  end
  fn_692 = function(...)
    local _,  a1 = ...
    local _t1
    local _t2
      gs_c692_1 = a1
    _G.WalkWater_Part = gs_c692_1
    if _G.WalkWater_Part then
      _t1 = (game:GetService("Workspace")).Map["WaterBase-Plane"]
      _t1.Size = Vector3.new(1000, 112, 1000)
    else
      _t2 = (game:GetService("Workspace")).Map["WaterBase-Plane"]
      _t2.Size = Vector3.new(1000, 80, 1000)
    end
    return
  end
  fn_693 = function(...)
    local _,  a1 = ...
    gs_c693_1 = a1
    _G.WalkWater = gs_c693_1
    return
  end
  fn_694 = function(...)
    fn_720 = function(...)
          fn_721 = function(...)
        gs_720_1_1.Destroy(gs_720_1_1)
        return
      end
      local tmp28 = gs_1_24_154.Character
      if gs_1_24_154.Character then
        tmp28 = gs_1_24_154.Character.FindFirstChild(gs_1_24_154.Character, "LeftFoot")
      end
      if tmp28 then
        gs_720_1_1 = gs_1_24_157.Assets.Models.IceSpikes4.Clone(gs_1_24_157.Assets.Models.IceSpikes4)
        gs_720_1_1.Parent = workspace
        gs_720_1_1.Size = Vector3.new(3 + (math.random(10, 12)), 1.7, 3 + (math.random(10, 12)))
        gs_720_1_1.Color = Color3.fromRGB(128, 187, 219)
        gs_720_1_1.CFrame = (CFrame.new(gs_1_24_154.Character.Head.Position.X, -3.8, gs_1_24_154.Character.Head.Position.Z)) * (CFrame.Angles(((math.random()) - 0.5) * 0.06, (math.random()) * 7, ((math.random()) - 0.5) * 0.07))
        gs_720_1_2 = ({{}})[1]
        gs_720_1_2.Size = Vector3.new(0, 0.3, 0)
        gs_720_1_3 = TW:Create(gs_720_1_1, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), gs_720_1_2)
        gs_720_1_3.Completed.Connect(gs_720_1_3.Completed, fn_721)
        gs_720_1_3.Play(gs_720_1_3)
      end
      return
    end
    while (task.wait()) do
      if _G.WalkWater then
        pcall(fn_720)
      end
    end
    return
  end
  fn_695 = function(...)
    local _,  a1 = ...
      gs_c695_1 = a1
    if not gs_c695_1 then return {false} end
    gs_c695_2 = gs_c695_1:FindFirstChild("Humanoid")
    local tmp27 = gs_c695_2
    if gs_c695_2 then
      tmp27 = gs_c695_2.Health > 0
    end
    return tmp27
  end
  fn_696 = function(...)
    local _,  a1, a2 = ...
                  gs_c696_1 = a1
    gs_c696_2 = a2
    gs_c696_3 = (game:GetService("Workspace")).Enemies.GetChildren((game:GetService("Workspace")).Enemies)
    game:GetService("Players")
    gs_c696_4 = (game:GetService("Players")).GetPlayers(game:GetService("Players"))
    gs_c696_5 = ({{}})[1]
    gs_c696_6 = (gs_c696_1.GetPivot(gs_c696_1)).Position
    _iter = {ipairs(gs_c696_3)}
    ::L21149::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L21230
    end
    gs_c696_1 = _loopkey
    gs_c696_2 = _loopval
    gs_c696_3 = gs_c696_2:FindFirstChild("HumanoidRootPart")
    local tmp24 = gs_c696_3
    if gs_c696_3 then
      tmp24 = gs_1_20_159(gs_c696_2)
    end
    if tmp24 then
      gs_696_2_1 = (gs_c696_3.Position - gs_1_24_6).Magnitude
      if (gs_696_2_1 <= gs_1_24_2) then
        table.insert(gs_1_24_5, gs_c696_2)
      end
    end
    goto L21149
    ::L21230::
    _iter = {ipairs(gs_696_1_4)}
    ::L21242::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L21344
    end
    gs_696_1_1 = _loopkey
    gs_696_1_2 = _loopval
    local tmp25 = gs_696_1_2 ~= gs_1_24_158
    if (gs_696_1_2 ~= gs_1_24_158) then
      tmp25 = gs_696_1_2.Character
    end
    if tmp25 then
      gs_696_5_1 = gs_696_1_2.Character.FindFirstChild(gs_696_1_2.Character, "HumanoidRootPart")
      local tmp26 = gs_696_5_1
      if gs_696_5_1 then
        tmp26 = gs_1_24_159(gs_696_1_2.Character)
      end
      if tmp26 then
        gs_696_6_1 = (gs_696_5_1.Position - gs_c696_6).Magnitude
        if (gs_696_6_1 <= gs_c696_2) then
          table.insert(gs_c696_5, gs_696_1_2.Character)
        end
      end
    end
    goto L21242
    ::L21344::
    return gs_696_4_5
  end
  fn_697 = function(...)
                                  fn_719 = function(...)
          local tmp23 = (require(gs_697_8_6.Flags)).COMBAT_REMOTE_THREAD
      if not ((require(gs_697_8_6.Flags)).COMBAT_REMOTE_THREAD) then
        tmp23 = false
      end
      return tmp23
    end
    gs_c697_1 = (game:GetService("Players")).LocalPlayer
    gs_c697_2 = gs_c697_1.Character
    if not gs_c697_2 then return end
    gs_c697_3 = ({})[1]
    _iter = {ipairs(gs_c697_2:GetChildren())}
    ::L20472::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      local tmp17 = _iter
      goto L20506
    end
    gs_c697_1 = _loopkey
    gs_c697_2 = _loopval
    if (gs_c697_2:IsA("Tool")) then
      gs_1_24_3 = gs_c697_2
    else
      goto L20472
    end
    ::L20506::
    if not gs_1_24_3 then return end
    gs_1_24_4 = gs_1_20_160(gs_1_24_2, 60)
    if (#gs_1_24_4 == 0) then return end
    gs_1_24_5 = game:GetService("ReplicatedStorage")
    gs_1_24_6 = gs_1_24_5:FindFirstChild("Modules")
    if not gs_1_24_6 then return end
    gs_1_24_5:WaitForChild("Modules")
    (gs_1_24_5:WaitForChild("Modules")).WaitForChild(gs_1_24_5:WaitForChild("Modules"), "Net")
    gs_1_24_7 = ((gs_1_24_5:WaitForChild("Modules")).WaitForChild(gs_1_24_5:WaitForChild("Modules"), "Net")).WaitForChild((gs_1_24_5:WaitForChild("Modules")).WaitForChild(gs_1_24_5:WaitForChild("Modules"), "Net"), "RE/RegisterAttack")
    gs_1_24_5:WaitForChild("Modules")
    (gs_1_24_5:WaitForChild("Modules")).WaitForChild(gs_1_24_5:WaitForChild("Modules"), "Net")
    gs_1_24_8 = ((gs_1_24_5:WaitForChild("Modules")).WaitForChild(gs_1_24_5:WaitForChild("Modules"), "Net")).WaitForChild((gs_1_24_5:WaitForChild("Modules")).WaitForChild(gs_1_24_5:WaitForChild("Modules"), "Net"), "RE/RegisterHit")
    local tmp18 = not gs_1_24_7
    if gs_1_24_7 then
      tmp18 = not gs_1_24_8
    end
    if tmp18 then return end
    gs_1_24_9 = ({{}})[1]
    gs_1_24_10 = ({{}})[2]
    _iter = tmp17
    h20698_0_2 = j20506_0_2
    _iter = {ipairs(gs_1_24_4)}
    ::L20698::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L20815
    end
    gs_1_24_1 = _loopkey
    gs_1_24_2 = _loopval
    if not (gs_1_24_2:GetAttribute("IsBoat")) then
      gs_697_9_1 = ({{"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand"}})[1]
      local tmp19 = gs_1_24_2:FindFirstChild(gs_697_9_1[math.random(#gs_697_9_1)])
      if not (gs_1_24_2:FindFirstChild(gs_697_9_1[math.random(#gs_697_9_1)])) then
        tmp19 = gs_1_24_2.PrimaryPart
      end
      gs_697_9_2 = tmp19
      if gs_697_9_2 then
        table.insert(gs_1_20_9, {gs_1_24_2, gs_697_9_2})
        gs_1_20_10 = gs_697_9_2
      end
    end
    goto L20698
    ::L20815::
    if not gs_697_8_10 then return end
    gs_697_8_7:FireServer(0)
    gs_697_8_11 = gs_697_8_1:FindFirstChild("PlayerScripts")
    if not gs_697_8_11 then return end
    gs_697_8_12 = gs_697_8_11:FindFirstChildOfClass("LocalScript")
    _iter = _iter
    h20879_0_2 = h20698_0_2
    while not gs_697_8_12 do
      gs_697_8_11.ChildAdded.Wait(gs_697_8_11.ChildAdded)
      gs_697_8_12 = gs_697_8_11:FindFirstChildOfClass("LocalScript")
    end
    if getsenv then
      gs_697_14_1 = pcall(getsenv, gs_697_8_12)
      gs_697_14_2 = ({pcall(getsenv, gs_697_8_12)})[2]
      local tmp20 = gs_697_14_1
      if gs_697_14_1 then
        tmp20 = gs_697_14_2
      end
      if tmp20 then
        gs_697_8_13 = gs_697_14_2._G.SendHitsToServer
      end
    end
    gs_697_8_14 = pcall(fn_719)
    gs_697_8_15 = ({pcall(fn_719)})[2]
    local tmp21 = gs_697_8_14
    if not gs_697_8_14 then goto L20983 end
    tmp21 = gs_697_8_15
    if not gs_697_8_15 then goto L20983 end
    tmp21 = gs_697_8_13
    ::L20983::
    if tmp21 then
      gs_697_8_13(gs_697_8_10, gs_697_8_9)
      goto L21022
    end
    local tmp22 = gs_697_8_14
    if gs_697_8_14 then
      tmp22 = not gs_697_8_15
    end
    if not tmp22 then goto L21022 end
    gs_697_8_8:FireServer(gs_697_8_10, gs_697_8_9)
    ::L21022::
    return
  end
  fn_698 = function(...)
                        for _key, item in pairs(workspace.Enemies:GetChildren()) do
                          gs_c698_1 = _key
                          gs_c698_2 = item
                          local tmp13 = gs_c698_2:FindFirstChild("UpperTorso")
                          if not (gs_c698_2:FindFirstChild("UpperTorso")) then
                          tmp13 = gs_c698_2:FindFirstChild("Head")
                          end
                          gs_c698_3 = tmp13
                          local tmp14 = gs_c698_2:FindFirstChild("HumanoidRootPart", true)
                          if (gs_c698_2:FindFirstChild("HumanoidRootPart", true)) then
                          tmp14 = gs_c698_3
                          end
                          if tmp14 then
                          if ((gs_c698_2.Head.Position - gs_1_20_154.Character.HumanoidRootPart.Position).Magnitude <= 50) then return {true, gs_c698_3.Position} end
                          end
                        end
    _iter = {pairs(workspace.SeaBeasts:GetChildren())}
    ::L20247::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L20312
    end
    gs_698_1_1 = _loopkey
    gs_698_1_2 = _loopval
    local tmp15 = gs_698_1_2:FindFirstChild("HumanoidRootPart")
    if not (gs_698_1_2:FindFirstChild("HumanoidRootPart")) then goto L20298 end
    tmp15 = gs_698_1_2:FindFirstChild("Health")
    if not (gs_698_1_2:FindFirstChild("Health")) then goto L20298 end
    tmp15 = gs_698_1_2.Health.Value > 0
    ::L20298::
    if tmp15 then return {true, gs_698_1_2.HumanoidRootPart.Position} end
    goto L20247
    ::L20312::
    _iter = {pairs(workspace.Enemies:GetChildren())}
    ::L20338::
    _k3 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k3[1]
    if not (_k3[1] == nil) then
      goto L20403
    end
    gs_698_4_1 = _loopkey
    gs_698_4_2 = _loopval
    local tmp16 = gs_698_4_2:FindFirstChild("Health")
    if not (gs_698_4_2:FindFirstChild("Health")) then goto L20389 end
    tmp16 = gs_698_4_2.Health.Value > 0
    if not (gs_698_4_2.Health.Value > 0) then goto L20389 end
    tmp16 = gs_698_4_2:FindFirstChild("VehicleSeat")
    ::L20389::
    if tmp16 then return {true, gs_698_4_2.Engine.Position} end
    goto L20338
    ::L20403::
    return
  end
  fn_699 = function(...)
        gs_c699_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    _iter = {next, getconnections(gs_c699_1.Activated)}
    ::L20055::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L20095
    end
    gs_c699_1 = _loopkey
    gs_c699_2 = _loopval
    if ((typeof(gs_c699_2.Function)) == "function") then
      getupvalues(gs_c699_2.Function)
    end
    goto L20055
    ::L20095::
    return
  end
  fn_700 = function(...)
    fn_717 = function(...)
      fn_718 = function(...)
        if not _G.Seriality then return end
        AttackNoCoolDown()
        gs_c718_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        gs_c718_2 = gs_c718_1.ToolTip
        gs_c718_3 = get_Monster()
        gs_c718_4 = ({get_Monster()})[2]
        if (gs_c718_2 == "Blox Fruit") then
          if gs_c718_3 then
            gs_718_3_1 = gs_c718_1:FindFirstChild("LeftClickRemote")
            if gs_718_3_1 then
              Actived()
              gs_718_3_1:FireServer(Vector3.new(0.01, -500, 0.01), 1, true)
              gs_718_3_1:FireServer(false)
            end
          end
        end
        return
      end
      pcall(fn_718)
      return
    end
    RunSer.Heartbeat:Connect(fn_717)
    return
  end
  fn_701 = function(...)
    local _,  a1, a2 = ...
    fn_716 = function(...)
      return gs_c701_1:WaitForChild(gs_c701_2)
    end
    gs_c701_1 = a1
    gs_c701_2 = a2
    gs_c701_3 = pcall(fn_716)
    gs_c701_4 = ({pcall(fn_716)})[2]
    return gs_c701_4
  end
  fn_702 = function(...)
    local _,  a1 = ...
      gs_c702_1 = a1
    gs_c702_2 = gs_c702_1:FindFirstChild("Humanoid")
    local tmp12 = gs_c702_2
    if gs_c702_2 then
      tmp12 = gs_c702_2.Health > 0
    end
    if tmp12 then return {true} end
    return false
  end
  fn_703 = function(...)
    local _,  a1, a2 = ...
          local _lv1
    local _lm1
    local _ls1
      gs_c703_1 = a1
    gs_c703_2 = a2
    gs_c703_3 = (gs_c703_1.GetPivot(gs_c703_1)).Position
    gs_c703_4 = ({{}})[1]
    gs_c703_5 = gs_c703_2:GetChildren()
    _iter = 1 - 1
    h19642_0_2 = #gs_c703_5
    h19642_0_3 = 1
    _lv1 = _iter + h19642_0_3
    _lm1 = h19642_0_2
    _ls1 = h19642_0_3
    ::FOR_19642::
    _lv1 = _lv1 + _ls1
    if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_19642 end
    gs_703f19642_1 = _lv1
    gs_703f19642_2 = gs_c703_5[gs_703f19642_1]
    gs_703f19642_3 = gs_703f19642_2:FindFirstChild("Humanoid")
    gs_703f19642_4 = gs_703f19642_2:FindFirstChild("HumanoidRootPart")
    local tmp11 = gs_703f19642_3
    if not gs_703f19642_3 then goto L19707 end
    tmp11 = gs_703f19642_4
    if not gs_703f19642_4 then goto L19707 end
    tmp11 = gs_703f19642_3.Health > 0
    ::L19707::
    if not tmp11 then goto L19744 end
    gs_703_2_1 = (gs_703f19642_4.Position - gs_c703_3).Magnitude
    if not (gs_703_2_1 <= 60) then goto L19742 end
    table.insert(gs_c703_4, gs_703f19642_2)
    ::L19742::
    ::L19744::
    goto FOR_19642
    ::FOR_END_19642::
    return gs_c703_4
  end
  fn_704 = function(...)
    local _,  a1 = ...
          local _lv1
    local _lm1
    local _ls1
      gs_c704_1 = a1
    gs_c704_2 = ({{}})[1]
    gs_c704_3 = #gs_c704_1
    _iter = 1 - 1
    h19519_0_2 = gs_c704_3
    h19519_0_3 = 1
    _lv1 = _iter + h19519_0_3
    _lm1 = h19519_0_2
    _ls1 = h19519_0_3
    ::FOR_19519::
    _lv1 = _lv1 + _ls1
    if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_19519 end
    gs_704f19519_1 = _lv1
    gs_704f19519_2 = gs_c704_1[gs_704f19519_1]
    local tmp10 = gs_704f19519_2:FindFirstChild("Head")
    if gs_704f19519_2:FindFirstChild("Head") then goto L19551 end
    tmp10 = gs_704f19519_2.PrimaryPart
    ::L19551::
    gs_704f19519_3 = tmp10
    if not gs_704f19519_3 then goto L19580 end
    table.insert(gs_c704_2, {gs_704f19519_2, gs_704f19519_3})
    ::L19580::
    goto FOR_19519
    ::FOR_END_19519::
    return gs_c704_2
  end
  fn_705 = function(...)
    local _,  a1 = ...
          local _lv1
    local _lm1
    local _ls1
          local _lv2
    local _lm2
    local _ls2
    gs_c705_1 = a1
    gs_c705_2 = gs_1_24_161.GetNearbyTargets(gs_c705_1, gs_1_24_172)
    gs_c705_3 = gs_1_24_161.GetNearbyTargets(gs_c705_1, gs_1_24_173)
    gs_c705_4 = ({{}})[1]
    _iter = 1 - 1
    h19449_0_2 = #gs_c705_2
    h19449_0_3 = 1
    _lv1 = _iter + h19449_0_3
    _lm1 = h19449_0_2
    _ls1 = h19449_0_3
    ::FOR_19449::
    _lv1 = _lv1 + _ls1
    if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_19449 end
    gs_705f19449_1 = _lv1
    table.insert(gs_c705_4, gs_c705_2[gs_705f19449_1])
    goto FOR_19449
    ::FOR_END_19449::
    _iter = 1 - 1
    h19474_0_2 = #gs_c705_3
    h19474_0_3 = 1
    _lv2 = _iter + h19474_0_3
    _lm2 = h19474_0_2
    _ls2 = h19474_0_3
    ::FOR_19474::
    _lv2 = _lv2 + _ls2
    if not ((_ls2 < 0 and _lv2 >= _lm2) or (_ls2 > 0 and _lv2 <= _lm2)) then goto FOR_END_19474 end
    gs_705f19474_1 = _lv2
    table.insert(gs_c705_4, gs_c705_3[gs_705f19474_1])
    goto FOR_19474
    ::FOR_END_19474::
    return gs_c705_4
  end
  fn_706 = function(...)
    gs_c706_1 = gs_1_24_169.Character
    if not gs_c706_1 then return end
    gs_c706_2 = gs_c706_1:FindFirstChildOfClass("Tool")
    if not gs_c706_2 then return end
    gs_c706_3 = gs_1_24_161.GetAllTargets(gs_c706_1)
    if (#gs_c706_3 < 1) then return end
    gs_c706_4 = gs_1_24_161.GetTargetParts(gs_c706_3)
    if (#gs_c706_4 < 1) then return end
    gs_c706_5 = gs_1_24_175["RE/RegisterAttack"]
    gs_c706_6 = gs_1_24_175["RE/RegisterHit"]
    gs_c706_5:FireServer(gs_1_24_161.Rate)
    gs_c706_7 = gs_c706_4[1][2]
    gs_c706_6:FireServer(gs_c706_7, gs_c706_4)
    return
  end
  fn_707 = function(...)
              fn_715 = function(...)
      local _,  a1 = ...
          gs_c715_1 = a1
      local tmp9 = gs_c715_1:IsA("RemoteEvent")
      if (gs_c715_1:IsA("RemoteEvent")) then
        tmp9 = gs_c715_1:GetAttribute("Id")
      end
      if tmp9 then
        gs_1_24_176 = gs_c715_1
        gs_1_24_177 = gs_c715_1:GetAttribute("Id")
      end
      return
    end
    gs_c707_1 = ({{gs_1_24_167.Util, gs_1_24_167.Common, gs_1_24_167.Remotes, gs_1_24_167.Assets, gs_1_24_167.FX}})[1]
    _iter = {ipairs(gs_c707_1)}
    ::L19077::
    _k1 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k1[1]
    if not (_k1[1] == nil) then
      goto L19199
    end
    gs_c707_1 = _loopkey
    gs_c707_2 = _loopval
    gs_c707_3 = gs_c707_2:GetChildren()
    _iter = {ipairs(gs_c707_3)}
    ::L19116::
    _k2 = {_loopkey(_loopval, _loopstate)}
    _loopstate = _k2[1]
    if not (_k2[1] == nil) then
      goto L19180
    end
    gs_c707_1 = _loopkey
    gs_c707_2 = _loopval
    local tmp8 = gs_c707_2:IsA("RemoteEvent")
    if (gs_c707_2:IsA("RemoteEvent")) then
      tmp8 = gs_c707_2:GetAttribute("Id")
    end
    if tmp8 then
      gs_1_19_176 = gs_c707_2
      gs_1_19_177 = gs_c707_2:GetAttribute("Id")
    end
    goto L19116
    ::L19180::
    gs_707_2_2.ChildAdded.Connect(gs_707_2_2.ChildAdded, fn_715)
    goto L19077
    ::L19199::
    return
  end
  fn_708 = function(...)
      fn_713 = function(...)
      local _,  a1 = ...
                  local _lv1
      local _lm1
      local _ls1
                                                      gs_c713_1 = a1
      gs_c713_2 = gs_c713_1:GetChildren()
      _iter = 1 - 1
      h18851_0_2 = #gs_c713_2
      h18851_0_3 = 1
      _lv1 = _iter + h18851_0_3
      _lm1 = h18851_0_2
      _ls1 = h18851_0_3
      ::FOR_18851::
      _lv1 = _lv1 + _ls1
      if not ((_ls1 < 0 and _lv1 >= _lm1) or (_ls1 > 0 and _lv1 <= _lm1)) then goto FOR_END_18851 end
      gs_713f18851_1 = _lv1
      gs_713f18851_2 = gs_c713_2[gs_713f18851_1]
      gs_713f18851_3 = gs_713f18851_2:FindFirstChild("Humanoid")
      gs_713f18851_4 = gs_713f18851_2:FindFirstChild("HumanoidRootPart")
      local tmp5 = gs_713f18851_3
      if not gs_713f18851_3 then goto L18923 end
      tmp5 = gs_713f18851_4
      if not gs_713f18851_4 then goto L18923 end
      tmp5 = gs_713f18851_3.Health > 0
      if not (gs_713f18851_3.Health > 0) then goto L18923 end
      tmp5 = gs_713f18851_2 ~= gs_c708_1
      ::L18923::
      local tmp7 = _iter + h18851_0_3
      if not tmp5 then goto L19030 end
      gs_713_2_1 = (gs_713f18851_4.Position - gs_c708_2.Position).Magnitude
      local tmp6 = _iter + h18851_0_3
      if not (gs_713_2_1 <= 60) then goto L19028 end
      gs_713_3_1 = gs_713f18851_2:GetChildren()
      _iter = _iter + h18851_0_3
      h18976_0_2 = h18851_0_2
      h18976_0_3 = h18851_0_3
      _iter = {ipairs(gs_713_3_1)}
      ::L18976::
      _k2 = {_loopkey(_loopval, _loopstate)}
      _loopstate = _k2[1]
      if _k2[1] == nil then goto L18978 end
      goto L19025
      ::L18978::
      gs_713_3_1 = _loopkey
      gs_713_3_2 = _loopval
      if not (gs_713_3_2:IsA("BasePart")) then goto L19022 end
      table.insert(gs_1_24_3, {gs_c713_2, gs_713_3_2})
      ::L19022::
      goto L18976
      ::L19025::
      tmp6 = _iter
      ::L19028::
      tmp7 = tmp6
      ::L19030::
      goto FOR_18851
      ::FOR_END_18851::
      return
    end
    fn_714 = function(...)
      local _,  a1 = ...
      gs_c714_1 = a1
      return string.char(bit32.bxor(string.byte(gs_c714_1), gs_708_5_2))
    end
    gs_c708_1 = gs_1_24_169.Character
    if not gs_c708_1 then return end
    gs_c708_2 = gs_c708_1:FindFirstChild("HumanoidRootPart")
    if not gs_c708_2 then return end
    gs_c708_3 = ({{}})[1]
    gs_c708_4 = fn_713
    gs_c708_4(gs_1_24_172)
    gs_c708_4(gs_1_24_173)
    gs_c708_5 = gs_c708_1:FindFirstChildOfClass("Tool")
    local tmp4 = #gs_c708_3 > 0
    if not (#gs_c708_3 > 0) then goto L18581 end
    tmp4 = gs_c708_5
    if not gs_c708_5 then goto L18581 end
    tmp4 = (gs_c708_5:GetAttribute("WeaponType")) == "Melee"
    if (gs_c708_5:GetAttribute("WeaponType")) == "Melee" then goto L18581 end
    tmp4 = (gs_c708_5:GetAttribute("WeaponType")) == "Sword"
    ::L18581::
    if tmp4 then
      gs_708_3_1 = gs_1_24_174.Net.seed.InvokeServer(gs_1_24_174.Net.seed)
      gs_708_3_2 = gs_1_24_175["RE/RegisterAttack"]
      gs_708_3_3 = gs_1_24_175["RE/RegisterHit"]
      gs_708_3_2.FireServer(gs_708_3_2)
      gs_708_3_4 = gs_c708_3[1][1].FindFirstChild(gs_c708_3[1][1], "Head")
      if not gs_708_3_4 then return end
      gs_708_3_3:FireServer(gs_708_3_4, gs_c708_3, {})
      if gs_1_24_176 then
        gs_708_5_1 = "RE/RegisterHit"
        gs_708_5_2 = (math.floor(((gs_1_24_168.GetServerTimeNow(gs_1_24_168)) / 10) % 10)) + 1
        gs_708_5_3 = string.gsub(gs_708_5_1, ".", fn_714)
        gs_708_5_4 = bit32.bxor(gs_1_24_177 + 909090, gs_708_3_1 * 2)
        cloneref(gs_1_24_176)
        (cloneref(gs_1_24_176)).FireServer(cloneref(gs_1_24_176), gs_708_5_3, gs_708_5_4, gs_708_3_4, gs_c708_3)
      end
    end
    return
  end
  fn_709 = function(...)
    gs_c709_1 = require(gs_1_24_167.Util.CameraShaker)
    gs_c709_1.Stop(gs_c709_1)
    return
  end
  fn_710 = function(...)
    fn_711 = function(...)
      while (task.wait(gs_1_24_161.Rate)) do
        gs_1_24_161.ExecuteFastAttack()
      end
      return
    end
    fn_712 = function(...)
      pcall(gs_1_24_162.Execute)
      return
    end
    task.spawn(fn_711)
    gs_1_24_166.Heartbeat.Connect(gs_1_24_166.Heartbeat, fn_712)
    return
  end
  ply = game.Players
  plr = ply.LocalPlayer
  Root = plr.Character.HumanoidRootPart
  replicated = game:GetService("ReplicatedStorage")
  Lv = game.Players.LocalPlayer.Data.Level.Value
  TeleportService = game:GetService("TeleportService")
  TW = game:GetService("TweenService")
  Lighting = game:GetService("Lighting")
  Enemies = workspace.Enemies
  vim1 = game:GetService("VirtualInputManager")
  vim2 = game:GetService("VirtualUser")
  TeamSelf = plr.Team
  RunSer = game:GetService("RunService")
  Stats = game:GetService("Stats")
  Energy = plr.Character.Energy.Value
  BringConnections = {}
  BossList = {}
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
  ::L230::
  plr.PlayerGui:WaitForChild("Main")
  local tmp1 = (plr.PlayerGui:WaitForChild("Main")).WaitForChild(plr.PlayerGui:WaitForChild("Main"), "Loading")
  if ((plr.PlayerGui:WaitForChild("Main")).WaitForChild(plr.PlayerGui:WaitForChild("Main"), "Loading")) then
    tmp1 = game.IsLoaded(game)
  end
  gs_1_2_1 = tmp1
  wait()
  if not (gs_1_2_1) then
    goto L230
  end
  if not (game.PlaceId == 2753915549) then
  end
  World1 = j309_0_2
  if not (game.PlaceId == 4442272183.0) then
  end
  World2 = j326_0_2
  if not (game.PlaceId == 7449423635.0) then
  end
  World3 = j343_0_2
  Marines = fn_2
  Pirates = fn_3
  if World1 then
    BossList = {"The Gorilla King", "Bobby", "The Saw", "Yeti", "Mob Leader", "Vice Admiral", "Saber Expert", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg", "Ice Admiral", "Greybeard"}
    goto L465
  end
  if World2 then
    BossList = {"Diamond", "Jeremy", "Orbitus", "Don Swan", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper", "Darkbeard", "Cursed Captain", "Order"}
    goto L465
  end
  if not World3 then goto L465 end
  BossList = {"Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Cake Queen", "Dough King", "Longma", "Soul Reaper", "rip_indra True Form", "Tyrant of the Skies"}
  ::L465::
  if World1 then
    MaterialList = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail"}
    goto L538
  end
  if World2 then
    MaterialList = {"Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang"}
    goto L538
  end
  if not World3 then goto L538 end
  MaterialList = {"Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk"}
  ::L538::
  gs_c1_1 = ({{"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}})[1]
  gs_c1_2 = ({{"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}})[1]
  gs_c1_3 = ({{"Hell's Messenger", "Heaven's Guardian", .Mob = "Mythological Pirate", .Mob2 = "Cursed Skeleton", .Mob3 = "Cursed Skeleton"}})[1]
  gs_c1_4 = ({{"Part", "SpawnLocation", "Terrain", "WedgePart", "MeshPart"}})[1]
  gs_c1_5 = ({{"Swan Pirate", "Jeremy"}})[1]
  gs_c1_6 = ({{"Forest Pirate", "Captain Elephant"}})[1]
  gs_c1_7 = ({{"Fajita", "Jeremy", "Diamond"}})[1]
  gs_c1_8 = ({{"Beast Hunter", "Lantern", "Guardian", "Grand Brigade", "Dinghy", "Sloop", "The Sentinel"}})[1]
  gs_c1_9 = ({{"Cookie Crafter"}})[1]
  gs_c1_10 = ({{"Reborn Skeleton"}})[1]
  gs_c1_11 = ({{["Pirate Millionaire"] = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625), ["Pistol Billionaire"] = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625), ["Dragon Crew Warrior"] = CFrame.new(7021.50439453125, 55.76270294189453, -730.1290893554688), ["Dragon Crew Archer"] = CFrame.new(6625, 378, 244), ["Female Islander"] = CFrame.new(4692.7939453125, 797.9766845703125, 858.8480224609375), ["Venomous Assailant"] = CFrame.new(4902, 670, 39), ["Marine Commodore"] = CFrame.new(2401, 123, -7589), ["Marine Rear Admiral"] = CFrame.new(3588, 229, -7085), ["Fishman Raider"] = CFrame.new(-10941, 332, -8760), ["Fishman Captain"] = CFrame.new(-11035, 332, -9087), ["Forest Pirate"] = CFrame.new(-13446, 413, -7760), ["Mythological Pirate"] = CFrame.new(-13510, 584, -6987), ["Jungle Pirate"] = CFrame.new(-11778, 426, -10592), ["Musketeer Pirate"] = CFrame.new(-13282, 496, -9565), ["Reborn Skeleton"] = CFrame.new(-8764, 142, 5963), ["Living Zombie"] = CFrame.new(-10227, 421, 6161), ["Demonic Soul"] = CFrame.new(-9579, 6, 6194), ["Posessed Mummy"] = CFrame.new(-9579, 6, 6194), ["Peanut Scout"] = CFrame.new(-1993, 187, -10103), ["Peanut President"] = CFrame.new(-2215, 159, -10474), ["Ice Cream Chef"] = CFrame.new(-877, 118, -11032), ["Ice Cream Commander"] = CFrame.new(-877, 118, -11032), ["Cookie Crafter"] = CFrame.new(-2021, 38, -12028), ["Cake Guard"] = CFrame.new(-2024, 38, -12026), ["Baking Staff"] = CFrame.new(-1932, 38, -12848), ["Head Baker"] = CFrame.new(-1932, 38, -12848), ["Cocoa Warrior"] = CFrame.new(95, 73, -12309), ["Chocolate Bar Battler"] = CFrame.new(647, 42, -12401), ["Sweet Thief"] = CFrame.new(116, 36, -12478), ["Candy Rebel"] = CFrame.new(47, 61, -12889), .Ghost = CFrame.new(5251, 5, 1111)}})[1]
  replicated:WaitForChild("Modules")
  (replicated:WaitForChild("Modules")).WaitForChild(replicated:WaitForChild("Modules"), "Net")
  gs_c1_12 = ({{.RFJobsRemoteFunction = replicated.Modules.Net["RF/JobsRemoteFunction"], .RFCraft = ((replicated:WaitForChild("Modules")).WaitForChild(replicated:WaitForChild("Modules"), "Net")).WaitForChild((replicated:WaitForChild("Modules")).WaitForChild(replicated:WaitForChild("Modules"), "Net"), "RF/Craft")}})[1]
  EquipWeapon = fn_4
  weaponSc = fn_5
  gs_c1_13 = ({{}})[1]
  gs_c1_13.__index = gs_c1_13
  gs_c1_13.Alive = fn_6
  gs_c1_13.Pos = fn_7
  gs_c1_13.Dist = fn_8
  gs_c1_13.DistH = fn_9
  gs_c1_13.Kill = fn_10
  gs_c1_13.Kill2 = fn_11
  gs_c1_13.KillSea = fn_12
  gs_c1_13.Sword = fn_13
  gs_c1_13.Mas = fn_14
  gs_c1_13.Masgun = fn_15
  statsSetings = fn_16
  BringEnemy = fn_17
  Useskills = fn_18
  gs_c1_14 = getrawmetatable(game)
  gs_c1_15 = gs_c1_14.__namecall
  setreadonly(gs_c1_14, false)
  gs_c1_14.__namecall = newcclosure(fn_19)
  GetConnectionEnemies = fn_20
  LowCpu = fn_21
  CheckF = fn_22
  CheckBoat = fn_23
  CheckEnemiesBoat = fn_24
  CheckPirateGrandBrigade = fn_25
  CheckShark = fn_26
  CheckTerrorShark = fn_27
  CheckPiranha = fn_28
  CheckFishCrew = fn_29
  CheckHauntedCrew = fn_30
  CheckSeaBeast = fn_31
  CheckLeviathan = fn_32
  UpdStFruit = fn_33
  collectFruits = fn_34
  Getmoon = fn_35
  DropFruits = fn_36
  GetBP = fn_37
  GetIn = fn_38
  GetM = fn_39
  GetWP = fn_40
  getInfinity_Ability = fn_41
  Hop = fn_42
  gs_c1_16 = Instance.new("Part", workspace)
  gs_c1_16.Size = Vector3.new(1, 1, 1)
  gs_c1_16.Name = "Rip_Indra"
  gs_c1_16.Anchored = true
  gs_c1_16.CanCollide = false
  gs_c1_16.CanTouch = false
  gs_c1_16.Transparency = 1
  gs_c1_17 = workspace:FindFirstChild(gs_c1_16.Name)
  if gs_c1_17 then
  end
  local tmp2 = gs_c1_14
  if j1485_0_8 then
    gs_c1_17.Destroy(gs_c1_17)
  end
  task.spawn(fn_43)
  task.spawn(fn_44)
  gs_c1_18 = game:GetService("ReplicatedStorage")
  gs_c1_19 = game:GetService("TweenService")
  gs_c1_20 = game:GetService("RunService")
  gs_c1_21 = game:GetService("Players")
  gs_c1_22 = gs_c1_21.LocalPlayer
  if not (game.PlaceId == 2753915549) then
  end
  sea1 = j1627_0_2
  if not (game.PlaceId == 4442272183.0) then
  end
  sea2 = j1644_0_2
  if not (game.PlaceId == 7449423635.0) then
  end
  sea3 = j1661_0_2
  gs_c1_23 = ({{["Tween Speed"] = 350, ["Bypass Teleport"] = true, ["Up Y"] = false, ["Up Y When Low Health"] = false, ["Same Y"] = false}})[1]
  gs_c1_24 = CFrame.new(10641.0918, -1953.92981, 9825.07031, -0.652825892, -9.2805891e-08, -0.757508039, -2.73638356e-08, 1, -9.89323823e-08, 0.757508039, -4.38572947e-08, -0.652825892)
  gs_c1_25 = CFrame.new(-16271.126, 25.5847301, 1371.98755, 0.999396622, -5.78875188e-08, -0.0347310975, 5.52972779e-08, 1, -8.7544322e-08, 0.034731105, 8.28877091e-08, 0.999396741)
  Convert_CFrame = fn_45
  GetDistance = fn_46
  InArea = fn_47
  GetSpawnPoint = fn_48
  CheckLegendaryItems = fn_49
  WaitForHumanoid = fn_50
  checkinventory = fn_51
  getdis = fn_52
  CanBypassTeleport = fn_53
  GetBypassCFrame = fn_54
  BypassTP = fn_55
  totopofgreattree = fn_56
  requestentrance = fn_57
  _tp = fn_58
  old_tp = fn_59
  TeleportToTarget = fn_60
  notween = fn_61
  BTP = fn_62
  spawn(fn_63)
  QuestB = fn_64
  QuestBeta = fn_65
  game:GetService("ReplicatedStorage")
  gs_c1_26 = require((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "Quests"))
  game:GetService("ReplicatedStorage")
  gs_c1_27 = require((game:GetService("ReplicatedStorage")).WaitForChild(game:GetService("ReplicatedStorage"), "GuideModule"))
  gs_c1_28 = ({{"MarineQuest", "BartiloQuest", "CitizenQuest", "Trainees"}})[1]
  CheckSea = fn_66
  GetQuestPointFromNPC = fn_67
  GetQuests = fn_68
  GetQuestPoint = fn_69
  MaterialMon = fn_70
  QuestNeta = fn_71
  gs_c1_29 = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"))()
  gs_c1_30 = ({gs_c1_29:MakeWindow({.Title = "SkitringX Hub [ BETA ]: Blox Fruit", .SubTitle = "by @realRedz and @realskira", .SaveFolder = "\226\128\153NaiHapget.json"})})[1]
  gs_c1_31 = ({gs_c1_30:NewMinimizer({.KeyCode = Enum.KeyCode.LeftControl})})[1]
  gs_c1_32 = ({gs_c1_31:CreateMobileMinimizer({.Image = "rbxassetid://15298567397", .BackgroundColor3 = Color3.fromRGB(0, 255, 254)})})[1]
  gs_c1_33 = ({{.Discord = gs_c1_30:MakeTab({.Title = "Tab Discord", .Icon = "Info"}), .Settings = gs_c1_30:MakeTab({.Title = "Tab Configuration", .Icon = "rbxassetid://7734053495"}), .Main = gs_c1_30:MakeTab({.Title = "Tab Main", .Icon = "rbxassetid://7733960981"}), .Fish = gs_c1_30:MakeTab({.Title = "Tab Fishing", .Icon = "rbxassetid://127664059821666"}), .Quests = gs_c1_30:MakeTab({.Title = "Tab Quests/Item", .Icon = "Swords"}), .SeaEvent = gs_c1_30:MakeTab({.Title = "Tab Sea Event", .Icon = "waves"}), .Race = gs_c1_30:MakeTab({.Title = "Tab Race V4", .Icon = "moon"}), .Info = gs_c1_30:MakeTab({.Title = "Tab Server", .Icon = "Server"}), .Prehistoric = gs_c1_30:MakeTab({.Title = "Tab Island Event", .Icon = "palmtree"}), .Raids = gs_c1_30:MakeTab({.Title = "Tab Fruit And Raid", .Icon = "cherry"}), .Webhook = gs_c1_30:MakeTab({.Title = "Tab Hop", .Icon = "rbxassetid://10709819149"}), .Visual = gs_c1_30:MakeTab({.Title = "Tab Visual Fake", .Icon = "rbxassetid://6031075929"}), .Combat = gs_c1_30:MakeTab({.Title = "Tab Local Player", .Icon = "rbxassetid://13075651575"}), .Travel = gs_c1_30:MakeTab({.Title = "Tab Teleport", .Icon = "locate"}), .Shop = gs_c1_30:MakeTab({.Title = "Tab Shop", .Icon = "rbxassetid://6031265976"}), .Misc = gs_c1_30:MakeTab({.Title = "Tab Miscellaneous", .Icon = "rbxassetid://10709783577"})}})[1]
  gs_c1_33.Discord.AddSection(gs_c1_33.Discord, "Information")
  gs_c1_33.Discord.AddDiscordInvite(gs_c1_33.Discord, {.Title = "SkitringX Hub | Community", .Description = "A community for SkitringX Hub Users - official scripts, updates, and suport in one place.", .Banner = "rbxassetid://15298567397", .Logo = "rbxassetid://15298567397", .Invite = "https://discord.gg/a9fdcSMDZ", .Members = 99999, .Online = 99999})
  gs_c1_33.Info.AddSection(gs_c1_33.Info, "Status Server")
  gs_c1_34 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Time Zone", "")
  UpdateOS = fn_72
  spawn(fn_73)
  gs_c1_35 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Game Time", "")
  UpdateGameTime = fn_74
  spawn(fn_75)
  gs_c1_36 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Mirage Island", "Status: ")
  gs_c1_37 = ""
  spawn(fn_76)
  gs_c1_38 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Kitsune Island", "Status: ")
  gs_c1_39 = ""
  spawn(fn_77)
  gs_c1_40 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Prehistoric Island", "Status: ")
  gs_c1_41 = ""
  task.spawn(fn_78)
  gs_c1_42 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Frozen Dimension", "Status: ")
  gs_c1_43 = ""
  spawn(fn_79)
  gs_c1_44 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Cake Prince", "")
  spawn(fn_80)
  gs_c1_45 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Rip Indra", "Status: ")
  gs_c1_46 = ""
  spawn(fn_81)
  gs_c1_47 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Dough King", "Status: ")
  gs_c1_48 = ""
  spawn(fn_82)
  gs_c1_49 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Full Moon", "")
  task.spawn(fn_83)
  gs_c1_50 = gs_c1_33.Info.AddParagraph(gs_c1_33.Info, "Legendary Sword", "Status: ")
  spawn(fn_84)
  gs_c1_33.Main.AddDropdown(gs_c1_33.Main, {.Name = "UI Scale", .Options = {"Small", "Large", "Big"}, .Default = "Large", .Callback = fn_85})
  gs_c1_51 = replicated.Modules.Net["RF/SubmarineWorkerSpeak"]
  WeaponDropdown = gs_c1_33.Main.AddDropdown(gs_c1_33.Main, {.Name = "Select Tool", .Options = {"Melee", "Sword", "Blox Fruit", "Gun"}, .Default = "Melee", .Callback = fn_86})
  spawn(fn_87)
  gs_c1_33.Main.AddSection(gs_c1_33.Main, "Farming Main")
  gs_c1_52 = game.Players.LocalPlayer
  gs_c1_53 = game:GetService("ReplicatedStorage")
  _G.SelectedFarmMode = "Level Farm"
  _G.StartFarm = false
  gs_c1_33.Main.AddDropdown(gs_c1_33.Main, {.Name = "Select Target Farm", .Description = "Select the farming mode you want", .Options = {"Level Farm", "Farm Bone", "Farm Katakuri", "Farm Tyrant Of The Skies"}, .Default = "Level Farm", .Callback = fn_88})
  gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Start Farm", .Description = "Start selected farm mode", .Default = false, .Callback = fn_89})
  gs_c1_54 = false
  gs_c1_55 = false
  gs_c1_56 = fn_90
  task.spawn(fn_91)
  task.spawn(fn_92)
  task.spawn(fn_93)
  task.spawn(fn_94)
  gs_c1_33.Main.AddSection(gs_c1_33.Main, "Farming Bone")
  gs_c1_57 = gs_c1_33.Main.AddParagraph(gs_c1_33.Main, "Bones", "")
  spawn(fn_95)
  gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Soul Reaper", .Description = "", .Default = false, .Callback = fn_96})
  spawn(fn_97)
  RanBone = gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Random Bones", .Description = "", .Default = false, .Callback = fn_98})
  spawn(fn_99)
  gs_c1_33.Main.AddSection(gs_c1_33.Main, "Auto Collect Chest")
  ChestTW = gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Farm Chest < Tween >", .Description = "1B Ez No Reset Level", .Default = false, .Callback = fn_100})
  spawn(fn_101)
  gs_c1_33.Main.AddSection(gs_c1_33.Main, "Collect Berry")
  Berry = gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Farm Berry", .Description = "", .Default = false, .Callback = fn_102})
  spawn(fn_103)
  gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Farm Dough King + Hop", .Default = false, .Callback = fn_104})
  gs_c1_58 = fn_105
  spawn(fn_106)
  gs_c1_33.Main.AddSection(gs_c1_33.Main, "Status Main Farm")
  gs_c1_59 = gs_c1_33.Main.AddParagraph(gs_c1_33.Main, "Check Status Eyes", "")
  Check_Eye = fn_107
  task.spawn(fn_108)
  gs_c1_60 = gs_c1_33.Main.AddParagraph(gs_c1_33.Main, "Boss Spawn", "")
  spawn(fn_109)
  gs_c1_61 = gs_c1_33.Main.AddParagraph(gs_c1_33.Main, "Cake Princes", "")
  spawn(fn_110)
  gs_c1_62 = gs_c1_33.Main.AddParagraph(gs_c1_33.Main, "Bone", "")
  spawn(fn_111)
  gs_c1_33.Main.AddSection(gs_c1_33.Main, "Tyrant of the Skies")
  FarmPhaBinh = gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Summon Boss", .Description = "", .Default = false, .Callback = fn_112})
  gs_c1_63 = fn_113
  gs_c1_64 = fn_114
  gs_c1_65 = ({{CFrame.new(-16332.5263671875, 158.07200622558594, 1440.324951171875), CFrame.new(-16288.609375, 158.16700744628906, 1470.3680419921875), CFrame.new(-16245.412109375, 158.43699645996094, 1463.365966796875), CFrame.new(-16212.46875, 158.16700744628906, 1466.343994140625), CFrame.new(-16211.9462890625, 158.07200622558594, 1322.39794921875), CFrame.new(-16260.921875, 154.92100524902344, 1323.615966796875), CFrame.new(-16297.0595703125, 159.322998046875, 1317.2239990234375), CFrame.new(-16335.0966796875, 159.33399963378906, 1324.885986328125)}})[1]
  spawn(fn_115)
  FarmPhaBinh = gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Summon Boss skull Guitar", .Description = "", .Default = false, .Callback = fn_116})
  gs_c1_66 = fn_117
  gs_c1_67 = fn_118
  gs_c1_68 = ({{CFrame.new(-16332.5263671875, 158.07200622558594, 1440.324951171875), CFrame.new(-16288.609375, 158.16700744628906, 1470.3680419921875), CFrame.new(-16245.412109375, 158.43699645996094, 1463.365966796875), CFrame.new(-16212.46875, 158.16700744628906, 1466.343994140625), CFrame.new(-16211.9462890625, 158.07200622558594, 1322.39794921875), CFrame.new(-16260.921875, 154.92100524902344, 1323.615966796875), CFrame.new(-16297.0595703125, 159.322998046875, 1317.2239990234375), CFrame.new(-16335.0966796875, 159.33399963378906, 1324.885986328125)}})[1]
  spawn(fn_119)
  gs_c1_33.Main.AddSection(gs_c1_33.Main, "Farm Material")
  Test = gs_c1_33.Main.AddDropdown(gs_c1_33.Main, {.Name = "Choose Material", .Description = "", .Options = MaterialList, .Callback = fn_120})
  Toggle = gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Farm Materials", .Description = "", .Default = false, .Callback = fn_121})
  spawn(fn_122)
  Ecto = gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Farm Ectoplasm", .Description = "", .Default = false, .Callback = fn_123})
  spawn(fn_124)
  gs_c1_33.Main.AddSection(gs_c1_33.Main, "Farm Boss")
  BossDropdown = gs_c1_33.Main.AddDropdown(gs_c1_33.Main, {.Name = "Select Boss", .Description = "", .Options = BossList, .Callback = fn_125})
  FarmBoss = gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Farm Boss", .Description = "", .Default = false, .Callback = fn_126})
  BossQ = gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Accept Quests", .Description = "", .Default = true, .Callback = fn_127})
  FarmAllBoss = gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Farm All Boss", .Default = false, .Callback = fn_128})
  task.spawn(fn_129)
  gs_c1_33.Main.AddSection(gs_c1_33.Main, "Farming Mastery")
  gs_c1_69 = ({{"Cake", "Bone"}})[1]
  gs_c1_70 = ({gs_c1_33.Main.AddDropdown(gs_c1_33.Main, {.Name = "Choose Island", .Description = "", .Options = gs_c1_69, .Default = Bone, .Callback = fn_130})})[1]
  gs_c1_71 = ({gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Mastery Fruits", .Description = "", .Default = false, .Callback = fn_131})})[1]
  spawn(fn_132)
  spawn(fn_133)
  gs_c1_72 = ({gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Mastery Gun", .Description = "", .Default = false, .Callback = fn_134})})[1]
  spawn(fn_135)
  gs_c1_73 = ({gs_c1_33.Main.AddToggle(gs_c1_33.Main, {.Name = "Auto Mastery All Sword", .Description = "", .Default = false, .Callback = fn_136})})[1]
  spawn(fn_137)
  gs_c1_33.Settings.AddSection(gs_c1_33.Settings, "Settings / Configure")
  Initialize = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Fast Attack", .Description = "", .Default = true, .Callback = fn_138})
  Bringmob = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Bring Mobs", .Description = "", .Default = true, .Callback = fn_139})
  gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Auto Hop Server with time", .Default = false, .Callback = fn_140})
  Spawn(fn_141)
  gs_c1_33.Settings.AddSlider(gs_c1_33.Settings, {.Name = "Hop Delay (Minutes)", .Min = 5, .Max = 120, .Default = 30, .Increment = 1, .Callback = fn_142})
  gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Auto Set Spawn Point", .Default = false, .Callback = fn_143})
  BusuAura = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Auto Turn on Buso", .Description = "", .Default = true, .Callback = fn_144})
  spawn(fn_145)
  gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Auto Haki Observation", .Default = false, .Callback = fn_146})
  spawn(fn_147)
  RaceV3Aura = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Auto Turn on Race V3", .Description = "", .Default = false, .Flag = "AutoTurnonRaceV3", .Callback = fn_148})
  spawn(fn_149)
  RaceV4Aura = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Auto Turn on Race V4", .Description = "", .Default = false, .Callback = fn_150})
  spawn(fn_151)
  RandomAround = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Auto Turn on Spin  xyz", .Description = "", .Default = false, .Callback = fn_152})
  SafeModes = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Safe Mode", .Description = "", .Default = false, .Callback = fn_153})
  spawn(fn_154)
  DisableHitVFX = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Remove Hit VFX", .Description = "Removes slash and sword visual effects for better visibility", .Default = false, .Callback = fn_155})
  gs_c1_74 = ({{"SlashHit", "CurvedRing", "SwordSlash", "SlashTail"}})[1]
  task.spawn(fn_156)
  RmvVFX = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Remove Death & Respawned VFX", .Description = "", .Default = false, .Callback = fn_157})
  spawn(fn_158)
  DisblesNotify = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Disable Notify", .Description = "", .Default = false, .Callback = fn_159})
  spawn(fn_160)
  gs_c1_33.Settings.AddSection(gs_c1_33.Settings, "Auto Quests Katakuri or Quests Bone")
  CakeQ = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Accept Quests Katakuri", .Description = "", .Default = false, .Callback = fn_161})
  CakeSM = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Auto Summon Cake Prince", .Description = "", .Default = false, .Callback = fn_162})
  spawn(fn_163)
  BoneQ = gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Accept Quests Bones", .Description = "", .Default = false, .Callback = fn_164})
  gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Anti AFK", .Default = true, .Callback = fn_165})
  gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "Auto Anti - Admin Join Server", .Description = "", .Default = true, .Callback = fn_166})
  spawn(fn_167)
  gs_c1_33.Settings.AddToggle(gs_c1_33.Settings, {.Name = "No Clip", .Default = false, .Callback = fn_168})
  spawn(fn_169)
  gs_c1_33.Fish.AddSection(gs_c1_33.Fish, "Fishing")
  gs_c1_33.Fish.AddDropdown(gs_c1_33.Fish, {.Name = "Select Fishing Rod", .Description = "", .Options = {"Fishing Rod", "Gold Rod", "Shark Rod", "Shell Rod", "Treasure Rod"}, .Default = "Fishing Rod", .Callback = fn_170})
  BaitDropdown = gs_c1_33.Fish.AddDropdown(gs_c1_33.Fish, {.Name = "Select Bait", .Description = "", .Options = {"Basic Bait", "Kelp Bait", "Good Bait", "Abyssal Bait", "Frozen Bait", "Epic Bait", "Carnivore Bait"}, .Default = "Basic Bait", .Callback = fn_171})
  BuyBaitToggle = gs_c1_33.Fish.AddToggle(gs_c1_33.Fish, {.Name = "Auto Buy Bait", .Description = "", .Default = false, .Callback = fn_172})
  task.spawn(fn_173)
  FishingToggle = gs_c1_33.Fish.AddToggle(gs_c1_33.Fish, {.Name = "Auto Fishing", .Description = "", .Default = false, .Callback = fn_174})
  gs_c1_75 = game:GetService("Players")
  gs_c1_76 = gs_c1_75.LocalPlayer
  gs_c1_77 = game:GetService("Workspace")
  gs_c1_78 = game:GetService("ReplicatedStorage")
  gs_c1_79 = gs_c1_78:WaitForChild("FishReplicated")
  gs_c1_80 = gs_c1_79:WaitForChild("FishingRequest")
  gs_c1_81 = require(gs_c1_79.FishingClient.Config)
  gs_c1_82 = require(gs_c1_78.Util.GetWaterHeightAtLocation)
  gs_c1_83 = gs_c1_81.Rod.MaxLaunchDistance
  task.spawn(fn_175)
  FishingQ = gs_c1_33.Fish.AddToggle(gs_c1_33.Fish, {.Name = "Auto Quest Fishing", .Description = "", .Default = false, .Callback = fn_176})
  gs_c1_84 = game:GetService("Players")
  gs_c1_85 = gs_c1_84.LocalPlayer
  gs_c1_86 = game:GetService("ReplicatedStorage")
  gs_c1_87 = gs_c1_86.Modules.Net:WaitForChild("RF/JobsRemoteFunction")
  gs_c1_88 = fn_177
  task.spawn(fn_178)
  QuestToggle = gs_c1_33.Fish.AddToggle(gs_c1_33.Fish, {.Name = "Auto Complete Quest", .Description = "", .Default = false, .Callback = fn_179})
  task.spawn(fn_180)
  SellFishToggle = gs_c1_33.Fish.AddToggle(gs_c1_33.Fish, {.Name = "Auto Sell Fish", .Description = "", .Default = false, .Callback = fn_181})
  task.spawn(fn_182)
  SpamSkillZ = gs_c1_33.Fish.AddToggle(gs_c1_33.Fish, {.Name = "Auto Spam Skill Z", .Description = "", .Default = false, .Callback = fn_183})
  gs_c1_89 = game:GetService("ReplicatedStorage")
  gs_c1_90 = gs_c1_89.Modules.Net:WaitForChild("RF/JobToolAbilities")
  task.spawn(fn_184)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Farm Rip Indra")
  gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Attack Rip Indra", .Description = "", .Default = false, .Callback = fn_185})
  spawn(fn_186)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Auto Unlocked Haki Rip Indra")
  gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Unlocked Haki", .Description = "You need all three types of legendary Haki, you idiot", .Default = false, .Callback = fn_187})
  AuraSkin = fn_188
  VaildColor = fn_189
  HakiCalculate = fn_190
  spawn(fn_191)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Auto Raid Evens Fruits")
  FactoryRaids = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Factory Raid", .Description = "Sea 2", .Default = false, .Callback = fn_192})
  spawn(fn_193)
  CastleRaids = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Pirate Raid", .Description = "Sea 3", .Default = false, .Callback = fn_194})
  spawn(fn_195)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Tushita + Yama")
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Tushita Sword", .Description = "", .Default = false, .Callback = fn_196})
  spawn(fn_197)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Yama Sword", .Description = "", .Default = false, .Callback = fn_198})
  spawn(fn_199)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Skull Guitars / Misc")
  gs_c1_91 = gs_c1_33.Quests.AddParagraph(gs_c1_33.Quests, "Skull Guitar Quests", "")
  spawn(fn_200)
  gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Skull Guitar", .Description = "", .Default = false, .Callback = fn_201})
  task.spawn(fn_202)
  getT = fn_203
  getRT = fn_204
  GetFirePlacard = fn_205
  spawn(fn_206)
  gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Farm Material Skull Guitar", .Description = "", .Default = false, .Callback = fn_207})
  spawn(fn_208)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Dojo Quest")
  gs_c1_33.Quests.AddButton(gs_c1_33.Quests, {.Title = "Teleport To Dragon Dojo", .Callback = fn_209})
  DojoQ = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Dojo Trainer", .Description = "", .Default = false, .Callback = fn_210})
  printBeltName = fn_211
  spawn(fn_212)
  BlazeEM = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Dragon Hunter", .Description = "", .Default = false, .Callback = fn_213})
  checkQuesta = fn_214
  BackTODoJo = fn_215
  DragonMobClear = fn_216
  spawn(fn_217)
  spawn(fn_218)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Cursed Dual Katana")
  gs_c1_92 = gs_c1_33.Quests.AddParagraph(gs_c1_33.Quests, "Number Cursed dual katana quests", "Quest Numbers :")
  spawn(fn_219)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Get CDK [ Last Quest ]", .Description = "", .Default = false, .Callback = fn_220})
  spawn(fn_221)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Yama CDK", .Description = "", .Default = false, .Callback = fn_222})
  spawn(fn_223)
  spawn(fn_224)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Tushita CDK", .Description = "", .Default = false, .Callback = fn_225})
  spawn(fn_226)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Farming Cake")
  gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Dough King [Fully]", .Default = false, .Callback = fn_227})
  spawn(fn_228)
  gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Farm Dough King", .Default = false, .Callback = fn_229})
  spawn(fn_230)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "True Triple Katana Sword")
  gs_c1_33.Quests.AddButton(gs_c1_33.Quests, {.Name = "Buy Legendary Sword", .Description = "", .Callback = fn_231})
  gs_c1_33.Quests.AddButton(gs_c1_33.Quests, {.Name = "Buy True Triple Katana Sword", .Description = "", .Callback = fn_232})
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Tween to Legendary Sword Dealer", .Description = "", .Default = false, .Callback = fn_233})
  spawn(fn_234)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Pole / God Enal's")
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Pole V1", .Description = "", .Default = false, .Callback = fn_235})
  spawn(fn_236)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Pole V2 [Beta]", .Description = "", .Default = false, .Callback = fn_237})
  spawn(fn_238)
  gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Saw Sword", .Description = "", .Default = false, .Callback = fn_239})
  spawn(fn_240)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Farm Mob")
  if World1 then
    gs_c1_33.Quests.AddDropdown(gs_c1_33.Quests, {.Name = "Select Mob", .Default = Bandit, .Options = {"Bandit", "Monkey", "Gorilla", "Pirate", "Brute", "Desert Bandit", "Desert Officer", "Snow Bandit", "Snowman", "Chief Petty Officer", "Sky Bandit", "Dark Master", "Toga Warrior", "Gladiator", "Military Soldier", "Military Spy", "Fishman Warrior", "Fishman Commando", "God's Guard", "Shanda", "Royal Squad", "Royal Soldier", "Galley Pirate", "Galley Captain"}, .Callback = fn_241})
  end
  if World2 then
    gs_c1_33.Quests.AddDropdown(gs_c1_33.Quests, {.Name = "Select Mob", .Default = Raider, .Options = {"Raider", "Mercenary", "Swan Pirate", "Factory Staff", "Marine Lieutenant", "Marine Captain", "Zombie", "Vampire", "Snow Trooper", "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Magma Ninja", "Lava Pirate", "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior", "Snow Lurker", "Sea Soldier", "Water Fighter"}, .Callback = fn_242})
  end
  if World3 then
    gs_c1_33.Quests.AddDropdown(gs_c1_33.Quests, {.Name = "Select Mob", .Options = {"Pirate Millionaire", "Dragon Crew Warrior", "Dragon Crew Archer", "Female Islander", "Giant Islander", "Marine Commodore", "Marine Rear Admiral", "Fishman Raider", "Fishman Captain", "Forest Pirate", "Mythological Pirate", "Jungle Pirate", "Musketeer Pirate", "Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy", "Peanut Scout", "Peanut President", "Ice Cream Chef", "Ice Cream Commander", "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker", "Cocoa Warrior", "Chocolate Bar Battler", "Sweet Thief", "Candy Rebel", "Candy Pirate", "Snow Demon", "Isle Outlaw", "Island Boy", "Sun-kissed Warrior", "Isle Champion"}, .Callback = fn_243})
  end
  gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Kill Mob", .Default = false, .Callback = fn_244})
  spawn(fn_245)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Farm All Island  [ New Event]")
  gs_c1_93 = ({{.Pirates = {.CFrame = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929), .Mobs = {"Bandit"}}, .Marine = {.CFrame = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929), .Mobs = {"Trainee"}}, .Jungle = {.CFrame = CFrame.new(-1600, 36, 150), .Mobs = {"Monkey", "Gorilla"}}, ["Pirate Village"] = {.CFrame = CFrame.new(-1100, 4, 3850), .Mobs = {"Pirate", "Brute"}}, .Desert = {.CFrame = CFrame.new(1090, 7, 4370), .Mobs = {"Desert Bandit", "Desert Officer"}}, ["Frozen Village"] = {.CFrame = CFrame.new(1200, 28, -1500), .Mobs = {"Snow Bandit", "Snowman"}}, ["Marine Fortress"] = {.CFrame = CFrame.new(-4500, 20, 4250), .Mobs = {"Chief Petty Officer"}}, ["Skylands Lower"] = {.CFrame = CFrame.new(-5000, 700, -2500), .Mobs = {"Sky Bandit", "Dark Master"}}, .Prison = {.CFrame = CFrame.new(4875, 6, 735), .Mobs = {"Prisoner", "Dangerous Prisoner"}}, .Colosseum = {.CFrame = CFrame.new(-1500, 60, -290), .Mobs = {"Toga Warrior", "Gladiator"}}, ["Magma Village"] = {.CFrame = CFrame.new(-5200, 8, 8400), .Mobs = {"Military Soldier", "Military Spy"}}, ["Underwater City"] = {.CFrame = CFrame.new(61160, 5, 1819), .Mobs = {"Fishman Warrior", "Fishman Commando"}}, ["Skylands Upper"] = {.CFrame = CFrame.new(-7880, 5545, -380), .Mobs = {"Shanda", "Royal Squad", "Royal Soldier"}}}})[1]
  gs_c1_94 = ({{["Kingdom of Rose"] = {.CFrame = CFrame.new(-321, 73, 297), .Mobs = {"Raider", "Mercenary", "Swan Pirate", "Factory Staff"}}, ["Green Zone"] = {.CFrame = CFrame.new(-2447, 73, -3211), .Mobs = {"Marine Lieutenant", "Marine Captain"}}, ["Graveyard Island"] = {.CFrame = CFrame.new(-9515, 142, 5536), .Mobs = {"Zombie", "Vampire"}}, ["Snow Mountain"] = {.CFrame = CFrame.new(561, 401, -5306), .Mobs = {"Snow Trooper", "Winter Warrior"}}, ["Hot and Cold (Cold)"] = {.CFrame = CFrame.new(-6026, 15, -5062), .Mobs = {"Lab Subordinate", "Horned Warrior"}}, ["Hot and Cold (Hot)"] = {.CFrame = CFrame.new(-5478, 15, -5240), .Mobs = {"Magma Ninja", "Lava Pirate"}}, ["Cursed Ship"] = {.CFrame = CFrame.new(902, 126, 33071), .Mobs = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}}, ["Ice Castle"] = {.CFrame = CFrame.new(6137, 294, -6747), .Mobs = {"Arctic Warrior", "Snow Lurker"}}, ["Forgotten Island"] = {.CFrame = CFrame.new(-3043, 238, -10191), .Mobs = {"Sea Soldier", "Water Fighter"}}}})[1]
  gs_c1_95 = ({{["Port Town"] = {.CFrame = CFrame.new(-290, 44, 5450), .Mobs = {"Pirate Millionaire", "Pistol Billionaire"}}, ["Hydra Island"] = {.CFrame = CFrame.new(5228, 604, 345), .Mobs = {"Dragon Crew Warrior", "Dragon Crew Archer", "Female Islander", "Giant Islander", "Training Dummy"}}, ["Great Tree"] = {.CFrame = CFrame.new(2682, 1682, -7190), .Mobs = {"Marine Commodore", "Marine Rear Admiral"}}, ["Floating Turtle"] = {.CFrame = CFrame.new(-12000, 331, -8500), .Mobs = {"Forest Pirate", "Mythological Pirate", "Jungle Pirate", "Musketeer Pirate", "Fishman Raider", "Fishman Captain"}}, ["Haunted Castle"] = {.CFrame = CFrame.new(-9515, 142, 5536), .Mobs = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}}, ["Sea of Treats"] = {.CFrame = CFrame.new(-1145, 13, -14450), .Mobs = {"Peanut Scout", "Peanut President", "Ice Cream Commander", "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker", "Cocoa Warrior", "Chocolate Bar Battler", "Sweet Thief", "Candy Rebel"}}, ["Tiki Outpost"] = {.CFrame = CFrame.new(-16200, 90, -17300), .Mobs = {"Isle Outlaw", "Island Boy", "Sun-kissed Warrior", "Isle Champion"}}, ["Submerged Island"] = {.CFrame = CFrame.new(-3200, -10, -10000), .Mobs = {"Reef Bandit", "Coral Pirate", "Sea Chanter", "Ocean Prophet", "High Disciple", "Grand Devotee"}}}})[1]
  if World1 then
    gs_c1_33.Quests.AddDropdown(gs_c1_33.Quests, {.Name = "Select Island", .Options = {"Pirates", "Marine", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Marine Fortress", "Skylands Lower", "Prison", "Colosseum", "Magma Village", "Underwater City", "Skylands Upper"}, .Callback = fn_246})
  end
  if World2 then
    gs_c1_33.Quests.AddDropdown(gs_c1_33.Quests, {.Name = "Select Island", .Options = {"Kingdom of Rose", "Green Zone", "Graveyard Island", "Snow Mountain", "Hot and Cold (Cold)", "Hot and Cold (Hot)", "Cursed Ship", "Ice Castle", "Forgotten Island"}, .Callback = fn_247})
  end
  if World3 then
    gs_c1_33.Quests.AddDropdown(gs_c1_33.Quests, {.Name = "Select Island", .Options = {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Haunted Castle", "Sea of Treats", "Tiki Outpost", "Submerged Island"}, .Callback = fn_248})
  end
  if World1 then
    gs_c1_96 = gs_c1_93
    goto L8048
  end
  if World2 then
    gs_c1_96 = gs_c1_94
    goto L8048
  end
  if not World3 then goto L8048 end
  gs_c1_96 = gs_c1_95
  ::L8048::
  gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Farm All Island", .Default = false, .Callback = fn_249})
  task.spawn(fn_250)
  MagnetGacha = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Random Magnet [ Beta ]", .Description = "Auto Gacha New [ Even ]", .Default = false, .Callback = fn_251})
  gs_c1_97 = game:GetService("ReplicatedStorage")
  gs_c1_98 = game.Players.LocalPlayer
  gs_c1_99 = false
  gs_c1_100 = 0
  gs_c1_101 = 0
  gs_c1_102 = 500
  gs_c1_103 = fn_252
  gs_c1_104 = fn_253
  gs_c1_105 = fn_254
  gs_c1_106 = fn_255
  gs_c1_107 = fn_256
  StartAutoSpin = fn_257
  StopAutoSpin = fn_258
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Farm Elite Hunter")
  gs_c1_108 = gs_c1_33.Quests.AddParagraph(gs_c1_33.Quests, "Elites Process", "")
  spawn(fn_259)
  gs_c1_109 = gs_c1_33.Quests.AddParagraph(gs_c1_33.Quests, "Elite Spawn", "Status: ")
  spawn(fn_260)
  EliteQ = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Farm Elite", .Description = "", .Default = false, .Callback = fn_261})
  spawn(fn_262)
  EliteH = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Farm Elite + Hop", .Description = "", .Default = false, .Callback = fn_263})
  gs_c1_110 = fn_264
  spawn(fn_265)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Farm Item")
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Saber Sword", .Description = "", .Default = false, .Callback = fn_266})
  spawn(fn_267)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Cybrog", .Description = "", .Default = false, .Callback = fn_268})
  spawn(fn_269)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Usoap's Hat", .Description = "", .Default = false, .Callback = fn_270})
  spawn(fn_271)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Bisento V2", .Description = "", .Default = false, .Callback = fn_272})
  spawn(fn_273)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Warden Sword", .Description = "", .Default = false, .Callback = fn_274})
  spawn(fn_275)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Marine Coat", .Description = "", .Default = false, .Callback = fn_276})
  spawn(fn_277)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Swan Coat", .Description = "", .Default = false, .Callback = fn_278})
  spawn(fn_279)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Rengoku Sword")
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Rengoku Sword", .Description = "", .Default = false, .Callback = fn_280})
  spawn(fn_281)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Key Rengoku", .Description = "", .Default = false, .Callback = fn_282})
  spawn(fn_283)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Dragon Trident", .Description = "", .Default = false, .Callback = fn_284})
  spawn(fn_285)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Long Sword", .Description = "", .Default = false, .Callback = fn_286})
  spawn(fn_287)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Black Spikey", .Description = "", .Default = false, .Callback = fn_288})
  spawn(fn_289)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Dark Blade V3", .Description = "", .Default = false, .Callback = fn_290})
  spawn(fn_291)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Midnight Blade", .Description = "", .Default = false, .Callback = fn_292})
  spawn(fn_293)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Darkbeard", .Description = "", .Default = false, .Callback = fn_294})
  spawn(fn_295)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Unlocked DonSwan", .Description = "", .Default = false, .Callback = fn_296})
  spawn(fn_297)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Swan Glasses", .Description = "", .Default = false, .Callback = fn_298})
  spawn(fn_299)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Cavender + Twin Hooks + Bigmom")
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Bigmom", .Description = "", .Default = false, .Callback = fn_300})
  spawn(fn_301)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Canvendish Sword", .Description = "", .Default = false, .Callback = fn_302})
  spawn(fn_303)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Twin Hooks", .Description = "", .Default = false, .Callback = fn_304})
  spawn(fn_305)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Serpent Bow", .Description = "", .Default = false, .Callback = fn_306})
  spawn(fn_307)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Lei Accessory", .Description = "", .Default = false, .Callback = fn_308})
  spawn(fn_309)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Buso/Aura Colours")
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Teleport Barista Cousin", .Description = "", .Default = false, .Callback = fn_310})
  spawn(fn_311)
  gs_c1_33.Quests.AddButton(gs_c1_33.Quests, {.Name = "Buy Buso Colors", .Description = "", .Callback = fn_312})
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Rainbow Colors", .Description = "", .Default = false, .Callback = fn_313})
  spawn(fn_314)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Accept Rainbow Quest Faster", .Description = "", .Default = false, .Callback = fn_315})
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Instinct / Observation")
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Farm Observation", .Description = "", .Default = false, .Callback = fn_316})
  spawn(fn_317)
  spawn(fn_318)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Observation V2", .Description = "", .Default = false, .Callback = fn_319})
  spawn(fn_320)
  Bartilo = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Done Bartilo Quest", .Description = "", .Default = false, .Callback = fn_321})
  spawn(fn_322)
  CitizenQ = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Done Citizen Quest", .Description = "", .Default = false, .Callback = fn_323})
  spawn(fn_324)
  Q = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Training Dummy", .Description = "", .Default = false, .Callback = fn_325})
  spawn(fn_326)
  gs_c1_33.Quests.AddSection(gs_c1_33.Quests, "Fighting Melee Styles")
  SuperHuman = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Superhuman", .Description = "", .Default = false, .Callback = fn_327})
  spawn(fn_328)
  DeathStep = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto DeathStep", .Description = "", .Default = false, .Callback = fn_329})
  spawn(fn_330)
  SharkManV2 = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Sharkman Karate", .Description = "", .Default = false, .Callback = fn_331})
  spawn(fn_332)
  ElectricClaw = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto ElectricClaw", .Description = "", .Default = false, .Callback = fn_333})
  spawn(fn_334)
  DragonTalon = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto DragonTalon", .Description = "", .Default = false, .Callback = fn_335})
  spawn(fn_336)
  Godhuman = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto Godhuman", .Description = "", .Default = false, .Callback = fn_337})
  spawn(fn_338)
  SanguineArt = gs_c1_33.Quests.AddToggle(gs_c1_33.Quests, {.Name = "Auto SanguineArt", .Description = "", .Default = false, .Callback = fn_339})
  spawn(fn_340)
  gs_c1_33.Race.AddSection(gs_c1_33.Race, "Mystic Island / Full Moon")
  gs_c1_111 = gs_c1_33.Race.AddParagraph(gs_c1_33.Race, "FullMoon Status", "")
  gs_c1_112 = gs_c1_33.Race.AddParagraph(gs_c1_33.Race, "Mirage Island Status", "")
  spawn(fn_341)
  spawn(fn_342)
  gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Find Mirage Island", .Description = "", .Default = false, .Callback = fn_343})
  spawn(fn_344)
  gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Collect Gear", .Description = "", .Default = false, .Callback = fn_345})
  spawn(fn_346)
  gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Change Transparency can see", .Description = "", .Default = false, .Callback = fn_347})
  spawn(fn_348)
  gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Tween Advanced Fruit Dealer", .Description = "", .Default = false, .Callback = fn_349})
  spawn(fn_350)
  gs_c1_33.Race.AddButton(gs_c1_33.Race, {.Name = "Talk With Stone", .Description = "", .Callback = fn_351})
  gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Look At Moon", .Description = "", .Default = false, .Callback = fn_352})
  MoveCamtoMoon = fn_353
  task.spawn(fn_354)
  gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Look Moon + Auto V3", .Description = "", .Default = false, .Callback = fn_355})
  MoveCamtoMoon = fn_356
  task.spawn(fn_357)
  gs_c1_33.Race.AddSection(gs_c1_33.Race, "Mirage Extra")
  gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Esp Mirage Island", .Description = "", .Value = false, .Callback = fn_358})
  gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Tween To Mirage Island", .Description = "", .Default = false, .Callback = fn_359})
  spawn(fn_360)
  gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Collect Mirage Chest", .Description = "", .Default = false, .Callback = fn_361})
  spawn(fn_362)
  gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Tween To Highest Point", .Description = "", .Default = false, .Callback = fn_363})
  spawn(fn_364)
  gs_c1_33.Race.AddSection(gs_c1_33.Race, "Drago Trial")
  GetQuestDracoLevel = fn_365
  Toggle = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Tween To Upgrade Droco Trial", .Description = "", .Default = false, .Callback = fn_366})
  spawn(fn_367)
  Toggle = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Drago (V1)", .Description = "", .Default = false, .Callback = fn_368})
  spawn(fn_369)
  fireflower = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Drago (V2)", .Description = "", .Default = false, .Callback = fn_370})
  spawn(fn_371)
  Toggle = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Drago (V3)", .Description = "", .Default = false, .Callback = fn_372})
  spawn(fn_373)
  Toggle = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Relic Drago Trial [Beta]", .Description = "", .Default = false, .Callback = fn_374})
  spawn(fn_375)
  Toggle = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Train Drago v4", .Description = "", .Default = false, .Callback = fn_376})
  spawn(fn_377)
  dragoTpVolcano = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Tween to Drago Trials", .Description = "", .Default = false, .Callback = fn_378})
  spawn(fn_379)
  bdrago = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Swap Drago Race", .Description = "", .Default = false, .Callback = fn_380})
  spawn(fn_381)
  UpTalon = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Upgrade Dragon Talon With Uzoth", .Description = "", .Default = false, .Callback = fn_382})
  spawn(fn_383)
  gs_c1_33.Race.AddSection(gs_c1_33.Race, "Upgrade Races V2 And V3")
  RaceMink = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Upgrade Mink", .Description = "", .Default = false, .Callback = fn_384})
  spawn(fn_385)
  RaceHuman = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Upgrade Human", .Description = "", .Default = false, .Callback = fn_386})
  spawn(fn_387)
  RaceSky = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Upgrade Angel", .Description = "", .Default = false, .Callback = fn_388})
  spawn(fn_389)
  RaceFish = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Upgrade FishMan", .Description = "", .Default = false, .Callback = fn_390})
  spawn(fn_391)
  gs_c1_33.Race.AddSection(gs_c1_33.Race, "Trials Quest V4")
  gs_c1_113 = gs_c1_33.Race.AddParagraph(gs_c1_33.Race, "Tiers V4 Status", "")
  spawn(fn_392)
  PullLv = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Pull Lever", .Description = "", .Default = false, .Callback = fn_393})
  spawn(fn_394)
  Train = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Train V4", .Description = "", .Default = false, .Callback = fn_395})
  spawn(fn_396)
  gs_c1_33.Race.AddButton(gs_c1_33.Race, {.Name = "Teleport to Temple of Time", .Description = "", .Callback = fn_397})
  gs_c1_33.Race.AddButton(gs_c1_33.Race, {.Name = "Teleport to Ancient One", .Description = "", .Callback = fn_398})
  gs_c1_33.Race.AddButton(gs_c1_33.Race, {.Name = "Teleport to Ancient Clock", .Description = "", .Callback = fn_399})
  Doors = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Teleport to Race Doors", .Description = "", .Default = false, .Callback = fn_400})
  spawn(fn_401)
  Trials = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Complete Trial Race", .Description = "", .Default = false, .Callback = fn_402})
  GetSeaBeastTrial = fn_403
  spawn(fn_404)
  spawn(fn_405)
  spawn(fn_406)
  spawn(fn_407)
  spawn(fn_408)
  AutoKill = gs_c1_33.Race.AddToggle(gs_c1_33.Race, {.Name = "Auto Kill Player After Trial", .Description = "", .Default = false, .Callback = fn_409})
  spawn(fn_410)
  gs_c1_33.Prehistoric.AddSection(gs_c1_33.Prehistoric, "Volcanic Crafting")
  gs_c1_33.Prehistoric.AddButton(gs_c1_33.Prehistoric, {.Name = "Craft Dragonheart", .Description = "", .Callback = fn_411})
  gs_c1_33.Prehistoric.AddButton(gs_c1_33.Prehistoric, {.Name = "Craft Dragonstorm", .Description = "", .Callback = fn_412})
  gs_c1_33.Prehistoric.AddButton(gs_c1_33.Prehistoric, {.Name = "Craft Dino Hood", .Callback = fn_413})
  gs_c1_33.Prehistoric.AddButton(gs_c1_33.Prehistoric, {.Name = "Craft T-Rex Skull", .Callback = fn_414})
  gs_c1_33.Prehistoric.AddSection(gs_c1_33.Prehistoric, "Prehistoric Island")
  gs_c1_114 = gs_c1_33.Prehistoric.AddParagraph(gs_c1_33.Prehistoric, "Prehistoric Island Status", "")
  spawn(fn_415)
  gs_c1_33.Prehistoric.AddButton(gs_c1_33.Prehistoric, {.Name = "Craft Volcanic Magnet", .Callback = fn_416})
  gs_c1_33.Prehistoric.AddToggle(gs_c1_33.Prehistoric, {.Name = "Craft Volcanic Magnet", .Default = false, .Callback = fn_417})
  task.spawn(fn_418)
  gs_c1_33.Prehistoric.AddToggle(gs_c1_33.Prehistoric, {.Name = "Auto Find Prehistoric Island", .Description = "", .Default = false, .Callback = fn_419})
  gs_c1_115 = ({})[1]
  spawn(fn_420)
  gs_c1_33.Prehistoric.AddToggle(gs_c1_33.Prehistoric, {.Name = "Auto Start Prehistoric Event", .Default = false, .Callback = fn_421})
  spawn(fn_422)
  gs_c1_33.Prehistoric.AddToggle(gs_c1_33.Prehistoric, {.Name = "Auto Patch Prehistoric Event", .Description = "", .Default = false, .Callback = fn_423})
  spawn(fn_424)
  spawn(fn_425)
  spawn(fn_426)
  Kaura = gs_c1_33.Prehistoric.AddToggle(gs_c1_33.Prehistoric, {.Name = "Kill Aura", .Description = "", .Default = false, .Callback = fn_427})
  gs_c1_116 = 500
  gs_c1_117 = 2
  spawn(fn_428)
  Vocan = gs_c1_33.Prehistoric.AddToggle(gs_c1_33.Prehistoric, {.Name = "Auto Collect Dino Bones", .Description = "", .Default = false, .Callback = fn_429})
  spawn(fn_430)
  Vocan = gs_c1_33.Prehistoric.AddToggle(gs_c1_33.Prehistoric, {.Name = "Auto Collect Dragon Eggs", .Description = "", .Default = false, .Callback = fn_431})
  spawn(fn_432)
  Toggle = gs_c1_33.Prehistoric.AddToggle(gs_c1_33.Prehistoric, {.Name = "Auto Reset When Complete Volcano", .Description = "", .Default = false, .Callback = fn_433})
  spawn(fn_434)
  gs_c1_33.SeaEvent.AddSection(gs_c1_33.SeaEvent, "Sea Event / Setting Sail")
  gs_c1_118 = ({{"Guardian", "PirateGrandBrigade", "MarineGrandBrigade", "PirateBrigade", "MarineBrigade", "PirateSloop", "MarineSloop", "Beast Hunter"}})[1]
  gs_c1_119 = ({{"Lv 1", "Lv 2", "Lv 3", "Lv 4", "Lv 5", "Lv 6", "Lv Infinite"}})[1]
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Remove Lighting Effect", .Callback = fn_435})
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Ship Speed Modifier", .Default = false, .Callback = fn_436})
  (game:GetService("RunService")).RenderStepped.Connect((game:GetService("RunService")).RenderStepped, fn_437)
  gs_c1_33.SeaEvent.AddSlider(gs_c1_33.SeaEvent, {.Name = "Ship Speed", .Min = 0, .Max = 1000, .Increment = 1, .Default = 300, .Callback = fn_438})
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Press W", .Default = false, .Callback = fn_439})
  spawn(fn_440)
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "No Clip Ship", .Default = false, .Callback = fn_441})
  spawn(fn_442)
  gs_c1_33.SeaEvent.AddSection(gs_c1_33.SeaEvent, "Crafting Items")
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Craft SharkTooth", .Description = "", .Callback = fn_443})
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Craft TerrorJaw", .Description = "", .Callback = fn_444})
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Craft SharkAnchor", .Description = "", .Callback = fn_445})
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Craft LeviathanCrown", .Description = "", .Callback = fn_446})
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Craft LeviathanShield", .Description = "", .Callback = fn_447})
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Craft LeviathanBoat", .Description = "", .Callback = fn_448})
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Craft LegendaryScroll", .Description = "", .Callback = fn_449})
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Craft MythicalScroll", .Description = "", .Callback = fn_450})
  gs_c1_33.SeaEvent.AddSection(gs_c1_33.SeaEvent, "Choose Sea Event")
  Q = gs_c1_33.SeaEvent.AddDropdown(gs_c1_33.SeaEvent, {.Name = "Select Boats", .Options = gs_c1_118, .Callback = fn_451})
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Buy Boats", .Description = "", .Callback = fn_452})
  Q = gs_c1_33.SeaEvent.AddDropdown(gs_c1_33.SeaEvent, {.Name = "Select Sea Level", .Options = gs_c1_119, .Callback = fn_453})
  Q = gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Sail Boat", .Description = "", .Default = false, .Callback = fn_454})
  spawn(fn_455)
  spawn(fn_456)
  gs_c1_33.SeaEvent.AddSection(gs_c1_33.SeaEvent, "Entity Sea Event")
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Shark", .Description = "", .Default = false, .Callback = fn_457})
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Piranha", .Description = "", .Default = false, .Callback = fn_458})
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Terror Shark", .Description = "", .Default = false, .Callback = fn_459})
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Fish Crew Member", .Description = "", .Default = false, .Callback = fn_460})
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Haunted Crew Member", .Description = "", .Default = false, .Callback = fn_461})
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Attack PirateGrandBrigade", .Description = "", .Default = false, .Callback = fn_462})
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Attack Fish Boat", .Description = "", .Default = false, .Callback = fn_463})
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Attack Sea Beast", .Description = "", .Default = false, .Callback = fn_464})
  spawn(fn_465)
  gs_c1_33.SeaEvent.AddSection(gs_c1_33.SeaEvent, "Kitsune Island / Event")
  gs_c1_120 = gs_c1_33.SeaEvent.AddParagraph(gs_c1_33.SeaEvent, "Kitsune Island Status", "")
  spawn(fn_466)
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Find Kitsune Island", .Description = "", .Default = false, .Callback = fn_467})
  spawn(fn_468)
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Teleport to Shrine Actived", .Description = "", .Default = false, .Callback = fn_469})
  spawn(fn_470)
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Collect Azure Ember", .Description = "", .Default = false, .Callback = fn_471})
  spawn(fn_472)
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Trade Azure Ember", .Description = "", .Default = false, .Callback = fn_473})
  spawn(fn_474)
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Trade Items Azure", .Description = "", .Callback = fn_475})
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Talk with kitsune statue", .Description = "", .Callback = fn_476})
  gs_c1_33.SeaEvent.AddSection(gs_c1_33.SeaEvent, "Frozen Dimension Event")
  gs_c1_121 = gs_c1_33.SeaEvent.AddParagraph(gs_c1_33.SeaEvent, "FrozenDimension Status", "")
  spawn(fn_477)
  gs_c1_122 = gs_c1_33.SeaEvent.AddParagraph(gs_c1_33.SeaEvent, "Spy Status", "")
  spawn(fn_478)
  gs_c1_33.SeaEvent.AddButton(gs_c1_33.SeaEvent, {.Name = "Buy Spy", .Callback = fn_479})
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Teleport Frozen Dimension", .Description = "", .Default = false, .Callback = fn_480})
  spawn(fn_481)
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Drive To Hydra Island", .Description = "", .Default = false, .Callback = fn_482})
  spawn(fn_483)
  gs_c1_33.SeaEvent.AddToggle(gs_c1_33.SeaEvent, {.Name = "Auto Attack Leviathan", .Description = "", .Default = false, .Callback = fn_484})
  gs_c1_33.Raids.AddSection(gs_c1_33.Raids, "Fruits Options")
  gs_c1_123 = fn_485
  gs_c1_124 = fn_486
  gs_c1_125 = gs_c1_33.Raids.AddParagraph(gs_c1_33.Raids, "Stock Fruit", "Loading...")
  task.spawn(fn_487)
  pcall(fn_488)
  RandomFF = gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Random Fruit", .Description = "", .Default = false, .Callback = fn_489})
  spawn(fn_490)
  DropF = gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Drop Fruit", .Description = "", .Default = false, .Callback = fn_491})
  spawn(fn_492)
  StoredF = gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Store Fruit", .Description = "", .Default = false, .Callback = fn_493})
  spawn(fn_494)
  TwF = gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Tween to Fruit", .Description = "", .Default = false, .Callback = fn_495})
  spawn(fn_496)
  BringF = gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Collect Fruit", .Description = "", .Default = false, .Callback = fn_497})
  spawn(fn_498)
  gs_c1_33.Raids.AddDropdown(gs_c1_33.Raids, {.Name = "Select Fruit Shop", .Options = {"Rocket-Rocket", "Spin-Spin", "Blade-Blade", "Spring-Spring", "Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame", "Ice-Ice", "Sand-Sand", "Dark-Dark", "Eagle-Eagle", "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Ghost-Ghost", "Magma-Magma", "Quake-Quake", "Buddha-Buddha", "Love-Love", "Creation-Creation", "Spider-Spider", "Sound-Sound", "Phoenix-Phoenix", "Portal-Portal", "Lightning-Lightning", "Pain-Pain", "Blizzard-Blizzard", "Gravity-Gravity", "T-Rex-T-Rex", "Mammoth-Mammoth", "Dough-Dough", "Shadow-Shadow", "Venom-Venom", "Gas-Gas", "Control-Control", "Spirit-Spirit", "Leopard-Leopard", "Yeti-Yeti", "Kitsune-Kitsune", "Dragon-Dragon"}, .Callback = fn_499})
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Buy Fruit Shop", .Default = false, .Callback = fn_500})
  spawn(fn_501)
  gs_c1_33.Raids.AddSection(gs_c1_33.Raids, "Dungeon Event / Raiding")
  gs_c1_1 = {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}
  Q = gs_c1_33.Raids.AddDropdown(gs_c1_33.Raids, {.Name = "Select Chip", .Description = "", .Options = gs_c1_1, .Callback = fn_502})
  Q = gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Select Dungeon Chip", .Description = "", .Default = false, .Callback = fn_503})
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Get Fruit In Inventory Below 1M", .Default = false, .Callback = fn_504})
  spawn(fn_505)
  gs_c1_33.Raids.AddButton(gs_c1_33.Raids, {.Name = "Buy Dungeon Chips [Beli]", .Description = "", .Callback = fn_506})
  gs_c1_33.Raids.AddButton(gs_c1_33.Raids, {.Name = "Buy Dungeon Chips [Devil Fruit]", .Description = "", .Callback = fn_507})
  AutoChipBeli = gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Buy Chip [Beli]", .Description = "", .Default = false, .Callback = fn_508})
  task.spawn(fn_509)
  AutoChipFruit = gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Buy Chip [Devil Fruit]", .Description = "", .Default = false, .Callback = fn_510})
  task.spawn(fn_511)
  StartR = gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Start Raid", .Description = "", .Default = false, .Callback = fn_512})
  task.spawn(fn_513)
  Raiding = gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Raid + Next Island", .Description = "", .Default = false, .Callback = fn_514})
  spawn(fn_515)
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Awakening", .Description = "", .Default = false, .Callback = fn_516})
  spawn(fn_517)
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Teleport To Lab", .Default = false, .Callback = fn_518})
  gs_c1_33.Raids.AddSection(gs_c1_33.Raids, "Items Law/Order Sword")
  gs_c1_33.Raids.AddButton(gs_c1_33.Raids, {.Name = "Buy Microchip Law", .Description = "", .Callback = fn_519})
  gs_c1_33.Raids.AddButton(gs_c1_33.Raids, {.Name = "Start Law Raids", .Description = "", .Callback = fn_520})
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Buy Microchip Law", .Description = "", .Default = false, .Callback = fn_521})
  spawn(fn_522)
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Start Law Raids", .Description = "", .Default = false, .Callback = fn_523})
  spawn(fn_524)
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Kill Law", .Description = "", .Default = false, .Callback = fn_525})
  spawn(fn_526)
  gs_c1_33.Raids.AddSection(gs_c1_33.Raids, "Raids Dungeons")
  gs_c1_126 = game.Players.LocalPlayer
  gs_c1_127 = fn_527
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "Auto Farm Dungeon", .Description = "", .Default = false, .Callback = fn_528})
  gs_c1_128 = 5000
  spawn(fn_529)
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "TP Exit (1)", .Default = false, .Callback = fn_530})
  gs_c1_129 = false
  gs_c1_130 = fn_531
  task.spawn(fn_532)
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "TP Exit (2)", .Default = false, .Callback = fn_533})
  gs_c1_131 = false
  task.spawn(fn_534)
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "TP Exit (3)", .Default = false, .Callback = fn_535})
  gs_c1_132 = false
  gs_c1_133 = fn_536
  task.spawn(fn_537)
  gs_c1_33.Raids.AddToggle(gs_c1_33.Raids, {.Name = "TP Exit (4)", .Default = false, .Callback = fn_538})
  gs_c1_134 = false
  gs_c1_135 = fn_539
  task.spawn(fn_540)
  gs_c1_33.Combat.AddSection(gs_c1_33.Combat, "Combat / AimBot")
  gs_c1_136 = gs_c1_33.Combat.AddParagraph(gs_c1_33.Combat, "All Players On Server", "")
  spawn(fn_541)
  gs_c1_137 = gs_c1_33.Combat.AddParagraph(gs_c1_33.Combat, "Aimbot Status", "")
  Checking_AimStatus = fn_542
  spawn(fn_543)
  gs_c1_138 = ({{}})[1]
  game:GetService("Players")
  _iter = {pairs((game:GetService("Players")).GetChildren(game:GetService("Players")))}
  ::L14182::
  _k1 = {_loopkey(_loopval, _loopstate)}
  _loopstate = _k1[1]
  if not (_k1[1] == nil) then
    goto L14208
  end
  gs_c1_1 = _loopkey
  gs_c1_2 = _loopval
  table.insert(gs_root_138, gs_c1_2.Name)
  goto L14182
  ::L14208::
  gs_1_19_33.Combat.AddDropdown(gs_1_19_33.Combat, {.Name = "Select Players", .Description = "", .Options = gs_1_19_138, .Callback = fn_544})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Teleport To Select Players", .Description = "", .Default = false, .Callback = fn_545})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Spectate Select Players", .Description = "", .Default = false, .Callback = fn_546})
  gs_1_19_33.Combat.AddDropdown(gs_1_19_33.Combat, {.Name = "Select Aim Method", .Description = "", .Options = {"Aim Player", "Nearest Aim"}, .Callback = fn_547})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Aimbot Method Skills", .Description = "", .Default = false, .Callback = fn_548})
  spawn(fn_549)
  spawn(fn_550)
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Aimbot Camera Closet Players", .Description = "", .Default = false, .Callback = fn_551})
  task.spawn(fn_552)
  gs_1_19_33.Combat.AddSection(gs_1_19_33.Combat, "Quests Players")
  gs_1_19_33.Combat.AddButton(gs_1_19_33.Combat, {.Name = "Get player quests", .Description = "", .Callback = fn_553})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Auto Get PlayerQuest", .Description = "", .Default = false, .Callback = fn_554})
  spawn(fn_555)
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Auto Kill Player Quest", .Default = false, .Callback = fn_556})
  spawn(fn_557)
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Auto Enable PvP", .Description = "", .Default = false, .Callback = fn_558})
  spawn(fn_559)
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Auto Safe Mode", .Default = false, .Callback = fn_560})
  spawn(fn_561)
  gs_1_19_33.Combat.AddSection(gs_1_19_33.Combat, "LocalPlayer Settings")
  gs_1_19_139 = game:GetService("Players")
  gs_1_19_140 = game:GetService("UserInputService")
  gs_1_19_141 = game:GetService("RunService")
  gs_1_19_142 = gs_1_19_139.LocalPlayer
  gs_1_19_143 = false
  gs_1_19_144 = 50
  gs_1_19_146 = ({{.f = 0, .b = 0, .l = 0, .r = 0}})[1]
  gs_1_19_149 = fn_562
  gs_1_19_150 = fn_563
  gs_1_19_151 = fn_564
  gs_1_19_142.CharacterAdded.Connect(gs_1_19_142.CharacterAdded, fn_565)
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Enable Fly", .Default = false, .Callback = fn_566})
  gs_1_19_33.Combat.AddSlider(gs_1_19_33.Combat, {.Name = "Speed Fly Mode", .Min = 10, .Max = 200, .Default = 50, .Callback = fn_567})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Dash No Cooldown", .Default = false, .Callback = fn_568})
  gs_1_19_152 = fn_569
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Instance Mink V3 [ INF ]", .Description = "", .Default = false, .Callback = fn_570})
  spawn(fn_571)
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Instance Energy [ INF ]", .Description = "", .Default = false, .Callback = fn_572})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Instance Soru [ INF ]", .Description = "", .Default = false, .Callback = fn_573})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Instance Observation Range [ INF ]", .Description = "", .Default = false, .Callback = fn_574})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Ignore Same Teams", .Description = "", .Default = false, .Callback = fn_575})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Accept Allies", .Description = "", .Default = false, .Callback = fn_576})
  spawn(fn_577)
  gs_1_19_33.Combat.AddSection(gs_1_19_33.Combat, "Esp")
  isnil = fn_578
  gs_1_19_153 = fn_579
  Number = math.random(1, 1000000)
  gs_1_19_154 = (game:GetService("Players")).LocalPlayer
  gs_1_19_155 = game:GetService("ReplicatedStorage")
  gs_1_19_156 = gs_1_19_154.Team
  EspPly = fn_580
  LocationEsp = fn_581
  DevEsp = fn_582
  flowerEsp = fn_583
  EventIslandEsp = fn_584
  gearEsp = fn_585
  AdvanFruitEsp = fn_586
  HakiClorEsp = fn_587
  LegenSword = fn_588
  ChestEsp = fn_589
  berriesEsp = fn_590
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp Berry", .Description = "", .Default = false, .Callback = fn_591})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp Player", .Description = "", .Default = false, .Callback = fn_592})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp Chest", .Description = "", .Default = false, .Callback = fn_593})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp Fruit", .Description = "", .Default = false, .Callback = fn_594})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp Island", .Description = "", .Default = false, .Callback = fn_595})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp Flower", .Description = "", .Default = false, .Callback = fn_596})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp Legendary Sword", .Description = "", .Default = false, .Callback = fn_597})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp Haki Color", .Description = "", .Default = false, .Callback = fn_598})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp Gear", .Description = "", .Default = false, .Callback = fn_599})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp SeaEvent Island", .Description = "", .Default = false, .Callback = fn_600})
  gs_1_19_33.Combat.AddToggle(gs_1_19_33.Combat, {.Name = "Esp Advanced Dealer", .Description = "", .Default = false, .Callback = fn_601})
  gs_1_19_33.Travel.AddSection(gs_1_19_33.Travel, "Travel - Worlds")
  gs_1_19_33.Travel.AddButton(gs_1_19_33.Travel, {.Name = "Travel East Blue (World 1)", .Description = "", .Callback = fn_602})
  gs_1_19_33.Travel.AddButton(gs_1_19_33.Travel, {.Name = "Travel Dressrosa (World 2)", .Description = "", .Callback = fn_603})
  gs_1_19_33.Travel.AddButton(gs_1_19_33.Travel, {.Name = "Travel Zou (World 3)", .Description = "", .Callback = fn_604})
  gs_1_19_33.Travel.AddSection(gs_1_19_33.Travel, "Travel - Island")
  Location = {}
  _iter = {pairs(workspace._WorldOrigin.Locations:GetChildren())}
  ::L15519::
  _k2 = {_loopkey(_loopval, _loopstate)}
  _loopstate = _k2[1]
  if not (_k2[1] == nil) then
    goto L15546
  end
  gs_1_19_1 = _loopkey
  gs_1_19_2 = _loopval
  table.insert(Location, gs_1_19_2.Name)
  goto L15519
  ::L15546::
  Travelllll = gs_1_20_33.Travel.AddDropdown(gs_1_20_33.Travel, {.Name = "Select Travelling", .Description = "", .Options = Location, .Callback = fn_605})
  GoIsland = gs_1_20_33.Travel.AddToggle(gs_1_20_33.Travel, {.Name = "Auto Travel", .Description = "", .Default = false, .Callback = fn_606})
  gs_1_20_33.Travel.AddSection(gs_1_20_33.Travel, "Travel - Portal")
  if World1 then
    Location_Portal = {"Sky", "UnderWater"}
    goto L15678
  end
  if World2 then
    Location_Portal = {"SwanRoom", "Cursed Ship"}
    goto L15678
  end
  if not World3 then goto L15678 end
  Location_Portal = {"Castle On The Sea", "Mansion Cafe", "Hydra Teleport", "Canvendish Room", "Temple of Time"}
  ::L15678::
  PortalTP = gs_1_20_33.Travel.AddDropdown(gs_1_20_33.Travel, {.Name = "Select Portal", .Options = Location_Portal, .Callback = fn_607})
  gs_1_20_33.Travel.AddButton(gs_1_20_33.Travel, {.Name = "requestEntrance", .Description = "", .Callback = fn_608})
  gs_1_20_33.Travel.AddSection(gs_1_20_33.Travel, "Travel - NPCs")
  _iter = {pairs(gs_1_20_155.NPCs:GetChildren())}
  ::L15768::
  _k3 = {_loopkey(_loopval, _loopstate)}
  _loopstate = _k3[1]
  if not (_k3[1] == nil) then
    goto L15795
  end
  gs_1_20_1 = _loopkey
  gs_1_20_2 = _loopval
  table.insert(NPCList, gs_1_20_2.Name)
  goto L15768
  ::L15795::
  NPCsPos = gs_1_24_33.Travel.AddDropdown(gs_1_24_33.Travel, {.Name = "Select NPCs", .Options = NPCList, .Callback = fn_609})
  GoNPCs = gs_1_24_33.Travel.AddToggle(gs_1_24_33.Travel, {.Name = "Auto Tween to NPC", .Description = "", .Default = false, .Callback = fn_610})
  spawn(fn_611)
  gs_1_24_33.Shop.AddSection(gs_1_24_33.Shop, "Shop Options")
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Buso", .Description = "", .Callback = fn_612})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Geppo", .Description = "", .Callback = fn_613})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Soru", .Description = "", .Callback = fn_614})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Ken", .Description = "", .Callback = fn_615})
  gs_1_24_33.Shop.AddSection(gs_1_24_33.Shop, "Fighting - Style")
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Black Leg", .Description = "", .Callback = fn_616})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Electro", .Description = "", .Callback = fn_617})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Fishman Karate", .Description = "", .Callback = fn_618})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy DragonClaw", .Description = "", .Callback = fn_619})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Superhuman", .Description = "", .Callback = fn_620})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Death Step", .Description = "", .Callback = fn_621})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Sharkman Karate", .Description = "", .Callback = fn_622})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy ElectricClaw", .Description = "", .Callback = fn_623})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy DragonTalon", .Description = "", .Callback = fn_624})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Godhuman", .Description = "", .Callback = fn_625})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy SanguineArt", .Description = "", .Callback = fn_626})
  gs_1_24_33.Shop.AddSection(gs_1_24_33.Shop, "Accessory")
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Tomoe Ring", .Description = "", .Callback = fn_627})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Black Cape", .Description = "", .Callback = fn_628})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Swordsman Hat", .Description = "", .Callback = fn_629})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Bizarre Rifle", .Description = "", .Callback = fn_630})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Ghoul Mask", .Description = "", .Callback = fn_631})
  gs_1_24_33.Shop.AddSection(gs_1_24_33.Shop, "Weapon World1")
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Cutlass", .Description = "", .Callback = fn_632})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Katana", .Description = "", .Callback = fn_633})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Iron Mace", .Description = "", .Callback = fn_634})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Duel Katana", .Description = "", .Callback = fn_635})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Triple Katana", .Description = "", .Callback = fn_636})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Pipe", .Description = "", .Callback = fn_637})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Dual-Headed Blade", .Description = "", .Callback = fn_638})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Bisento", .Description = "", .Callback = fn_639})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Soul Cane", .Description = "", .Callback = fn_640})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Slingshot", .Description = "", .Callback = fn_641})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Musket", .Description = "", .Callback = fn_642})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Dual Flintlock", .Description = "", .Callback = fn_643})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Flintlock", .Description = "", .Callback = fn_644})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Refined Flintlock", .Description = "", .Callback = fn_645})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Cannon", .Description = "", .Callback = fn_646})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Kabucha", .Description = "", .Callback = fn_647})
  gs_1_24_33.Shop.AddSection(gs_1_24_33.Shop, "Fragments shop")
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Refund Stats", .Description = "", .Callback = fn_648})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Reroll Race", .Description = "", .Callback = fn_649})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Ghoul Race", .Description = "", .Callback = fn_650})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Cyborg Race (2.5k)", .Description = "", .Callback = fn_651})
  gs_1_24_33.Shop.AddButton(gs_1_24_33.Shop, {.Name = "Buy Draco Race", .Callback = fn_652})
  gs_1_24_33.Misc.AddSection(gs_1_24_33.Misc, "Server - Function")
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Redeem All Codes", .Description = "", .Callback = fn_653})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Rejoin Server", .Description = "", .Callback = fn_654})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Hop Server", .Description = "", .Callback = fn_655})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Hop to Lowest Players", .Description = "", .Callback = fn_656})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Hop to Lowest Pings Server", .Description = "", .Callback = fn_657})
  gs_1_24_157 = game:GetService("ReplicatedStorage")
  gs_1_24_33.Misc.AddTextBox(gs_1_24_33.Misc, {.Name = "Input Job Id", .Placeholder = "Job ID", .ClearOnFocus = true, .Callback = fn_658})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Teleport [Job ID]", .Callback = fn_659})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Copy JobID", .Description = "", .Callback = fn_660})
  gs_1_24_33.Misc.AddSection(gs_1_24_33.Misc, "Player Gui / Others")
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Open Awakenings Expert", .Description = "", .Callback = fn_661})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Open Title Selection", .Description = "", .Callback = fn_662})
  DisbleChat = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Disable Chat GUI", .Description = "", .Default = false, .Callback = fn_663})
  DisbleLeaderB = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Disable Leader Board GUI", .Description = "", .Default = false, .Callback = fn_664})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Set Pirate Team", .Description = "", .Callback = fn_665})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Set Marine Team", .Description = "", .Callback = fn_666})
  UnPortal = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Unlock All Portals", .Description = "", .Default = false, .Callback = fn_667})
  spawn(fn_668)
  gs_1_24_33.Misc.AddSection(gs_1_24_33.Misc, "Graphics / Haki Stats")
  HakiSt = {"State 0", "State 1", "State 2", "State 3", "State 4", "State 5"}
  HakiStat = gs_1_24_33.Misc.AddDropdown(gs_1_24_33.Misc, {.Name = "Select Haki States", .Options = HakiSt, .Callback = fn_669})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "ChangeBusoStage", .Description = "", .Callback = fn_670})
  rtxM = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Turn on RTX Mode", .Description = "", .Default = false, .Callback = fn_671})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Turn on Fast Mode", .Description = "", .Callback = fn_672})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Turn on Low CPU", .Description = "", .Callback = fn_673})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Turn on increase Boats", .Description = "", .Callback = fn_674})
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Remove Sky Fog", .Description = "", .Callback = fn_675})
  gs_1_24_33.Misc.AddSection(gs_1_24_33.Misc, "Stats Upgrade")
  StatusSelect = gs_1_24_33.Misc.AddSlider(gs_1_24_33.Misc, {.Name = "Stats Value", .Description = "", .Default = 10, .Min = 0, .Max = 1000, .Rounding = 1, .Callback = fn_676})
  StatsUpg = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Auto Melee", .Description = "", .Default = false, .Callback = fn_677})
  spawn(fn_678)
  StatsUpg = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Auto Swords", .Description = "", .Default = false, .Callback = fn_679})
  spawn(fn_680)
  StatsUpg = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Auto Gun", .Description = "", .Default = false, .Callback = fn_681})
  spawn(fn_682)
  StatsUpg = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Auto Blox Fruit", .Description = "", .Default = false, .Callback = fn_683})
  spawn(fn_684)
  StatsUpg = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Auto Defense", .Description = "", .Default = false, .Callback = fn_685})
  spawn(fn_686)
  gs_1_24_33.Misc.AddSection(gs_1_24_33.Misc, "Configure - God")
  gs_1_24_33.Misc.AddButton(gs_1_24_33.Misc, {.Name = "Rain Fruits (Client)", .Description = "", .Callback = fn_687})
  briggt1 = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Turn on Full Bright", .Description = "", .Default = false, .Callback = fn_688})
  DayN = gs_1_24_33.Misc.AddDropdown(gs_1_24_33.Misc, {.Name = "Select Time", .Description = "", .Options = {"Day", "Night"}, .Default = Day, .Callback = fn_689})
  dayornight = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Turn on Time", .Description = "", .Default = false, .Callback = fn_690})
  task.spawn(fn_691)
  walkWater = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Turn on Walk on Water", .Description = "", .Default = true, .Callback = fn_692})
  iceWalk = gs_1_24_33.Misc.AddToggle(gs_1_24_33.Misc, {.Name = "Turn on Ice Walk", .Description = "", .Default = false, .Callback = fn_693})
  spawn(fn_694)
  gs_1_24_158 = game.Players.LocalPlayer
  gs_1_24_159 = fn_695
  gs_1_24_160 = fn_696
  AttackNoCoolDown = fn_697
  CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
  CameraShakerR.Stop(CameraShakerR)
  get_Monster = fn_698
  Actived = fn_699
  task.spawn(fn_700)
  gs_1_24_161 = ({{}})[1]
  gs_1_24_162 = ({{}})[1]
  gs_1_24_163 = ({{}})[1]
  gs_1_24_164 = game
  gs_1_24_165 = gs_1_24_164:GetService("Players")
  gs_1_24_166 = gs_1_24_164:GetService("RunService")
  gs_1_24_167 = gs_1_24_164:GetService("ReplicatedStorage")
  gs_1_24_168 = gs_1_24_164:GetService("Workspace")
  gs_1_24_169 = gs_1_24_165.LocalPlayer
  local tmp3 = gs_1_24_169.Character
  if not (gs_1_24_169.Character) then
    tmp3 = gs_1_24_169.CharacterAdded.Wait(gs_1_24_169.CharacterAdded)
  end
  gs_1_24_170 = tmp3
  gs_1_24_171 = fn_701
  gs_1_24_172 = gs_1_24_171(gs_1_24_168, "Enemies")
  gs_1_24_173 = gs_1_24_171(gs_1_24_168, "Characters")
  gs_1_24_174 = gs_1_24_171(gs_1_24_167, "Modules")
  gs_1_24_175 = gs_1_24_171(gs_1_24_174, "Net")
  gs_1_24_161.Rate = 1e-20
  gs_1_24_161.Enabled = true
  gs_1_24_161.IsAlive = fn_702
  gs_1_24_161.GetNearbyTargets = fn_703
  gs_1_24_161.GetTargetParts = fn_704
  gs_1_24_161.GetAllTargets = fn_705
  gs_1_24_161.ExecuteFastAttack = fn_706
  gs_1_24_178 = fn_707
  gs_1_24_178()
  gs_1_24_162.Execute = fn_708
  gs_1_24_179 = fn_709
  gs_1_24_180 = fn_710
  gs_1_24_180()
  gs_1_24_30:Notify({.Title = "SkitringX Hub [ No Key ]", .Content = "SkitringX hub Ui Redz Hub da comeback", .Image = "rbxassetid://15298567397", .Duration = 5})
  return
end

return fn_1()

