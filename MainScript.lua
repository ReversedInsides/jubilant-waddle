--[[local getfenv = getfenv;
local setfenv = setfenv;
local meow = getfenv()
meow.script = script
setfenv(1,meow)
loadstring(game:GetService("HttpService"):GetAsync(script.UrlSource.Value))()]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local PhysicsService = game:GetService("PhysicsService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")

-- Fake Character Template Made by jh0nd0eone
-- Customizable Version: 19:59:28 UTC PM 13/08/2023

-- This script has been converted to FE by jh0nd0eone
local FancyChatGUI = Instance.new("BillboardGui")
FancyChatGUI.Enabled = false;
FancyChatGUI.ClipsDescendants = true;
FancyChatGUI.ResetOnSpawn = false;
FancyChatGUI.MaxDistance = 500;
FancyChatGUI.Name = "FancyChatGUI";
FancyChatGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
FancyChatGUI.ExtentsOffsetWorldSpace = Vector3.new(0,9,0);
FancyChatGUI.Active = true;
FancyChatGUI.Size = UDim2.new(10000,0,5,0);
FancyChatGUI.Parent = script

local Letter = Instance.new("TextLabel")
Letter.Visible = false;
Letter.FontSize = Enum.FontSize.Size14;
Letter.TextColor3 = Color3.new(1,1,1);
Letter.BackgroundTransparency = 1;
Letter.Text = "L";
Letter.TextWrapped = true;
Letter.TextStrokeTransparency = 0;
Letter.AnchorPoint = Vector2.new(0.5,0.5);
Letter.Font = Enum.Font.SourceSansSemibold;
Letter.Name = "Letter";
Letter.Size = UDim2.new(0,30,0,30);
Letter.TextSize = 14;
Letter.BackgroundColor3 = Color3.new(1,1,1);
Letter.TextScaled = true;
Letter.TextWrap = true;
Letter.Parent = FancyChatGUI

local RemoteEventFunc = nil
local Player,Mouse,mouse,UserInputService,ContextActionService = game.Players.jh0nd0eone,nil,nil,nil,nil
local UserId = Player.UserId
if game:GetService("RunService"):IsStudio() then
	wait(4)
end
script.Parent.Parent = nil
do
	local GUID = {}
	do
		GUID.IDs = {};
		function GUID:new(len)
			local id;
			if(not len)then
				id = (tostring(function() end))
				id = id:gsub("function: ","")
			else
				local function genID(len)
					local newID = ""
					for i = 1,len do
						newID = newID..string.char(math.random(48,90))
					end
					return newID
				end
				repeat id = genID(len) until not GUID.IDs[id]
				local oid = id;
				id = {Trash=function() GUID.IDs[oid]=nil; end;Get=function() return oid; end}
				GUID.IDs[oid]=true;
			end
			return id
		end
	end

	local AHB = Instance.new("BindableEvent")

	local FPS = 30

	local TimeFrame = 0

	local LastFrame = tick()
	local Frame = 1/FPS

	game:service'RunService'.Heartbeat:connect(function(s,p)
		TimeFrame = TimeFrame + s
		if(TimeFrame >= Frame)then
			for i = 1,math.floor(TimeFrame/Frame) do
				AHB:Fire()
			end
			LastFrame=tick()
			TimeFrame=TimeFrame-Frame*math.floor(TimeFrame/Frame)
		end
	end)


	function swait(dur)
		if(dur == 0 or typeof(dur) ~= 'number')then
			AHB.Event:wait()
		else
			for i = 1, dur*FPS do
				AHB.Event:wait()
			end
		end
	end
	local Swait = swait

	local CoAS = {Actions={}}
	local fakeEvent = function()
		local t = {_fakeEvent=true,Waited={}}
		t.Connect = function(self,f)
			local ft={Disconnected=false;disconnect=function(s) s.Disconnected=true end}
			ft.Disconnect=ft.disconnect

			ft.Func=function(...)
				for id,_ in next, t.Waited do 
					t.Waited[id] = true 
				end 
				return f(...)
			end; 
			self.Function=ft;
			return ft;
		end
		t.connect = t.Connect
		t.Wait = function() 
			local guid = GUID:new(25)
			local waitingId = guid:Get()
			t.Waited[waitingId]=false
			repeat swait() until t.Waited[waitingId]==true  
			t.Waited[waitingId]=nil;
			guid:Trash()
		end
		t.wait = t.Wait
		return t
	end;
	Create = function(Obj)
		local Ins = Instance.new(Obj);
		return function(Property)
			if Property then else return Ins end
			for Property_,Value_ in next, Property do
				Ins[Property_] = Value_;
			end;
			return Ins;
		end;
	end;
	NLS = function(sourcevalue, parent)
		-- New Local Script
		local NS = require(6084597954):Clone();
		NS.Name = "NLS";
		NS.code.Value = sourcevalue;
		NS.Parent = parent;
		wait(0.3);
		NS.Disabled = false;
		return NS;
	end;
	Coroutine_ = function(func)
		return coroutine.resume(coroutine.create(func));
	end;
	local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
	local UsIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}

	function CoAS:BindAction(name,fun,touch,...)
		CoAS.Actions[name] = {Name=name,Function=fun,Keys={...}}
	end
	function CoAS:UnbindAction(name)
		CoAS.Actions[name] = nil
	end
	local function te(self,ev,...)
		local t = self[ev]
		if t and t._fakeEvent and t.Function and t.Function.Func and not t.Function.Disconnected then
			t.Function.Func(...)
		elseif t and t._fakeEvent and t.Function and t.Function.Func and t.Function.Disconnected then
			self[ev].Function=nil
		end
	end
	m.TrigEvent = te
	UsIS.TrigEvent = te
	RemoteEventFunc = function(plr,io)
		if plr~=Player then return end
		if io.Mouse then
			m.Target = io.Target
			m.Hit = io.Hit
		elseif io.KeyEvent then
			m:TrigEvent('Key'..io.KeyEvent,io.Key)
		elseif io.UserInputType == Enum.UserInputType.MouseButton1 then
			if io.UserInputState == Enum.UserInputState.Begin then
				m:TrigEvent("Button1Down")
			else
				m:TrigEvent("Button1Up")
			end
		end
		if(not io.KeyEvent and not io.Mouse)then
			for n,t in pairs(CoAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
			if io.UserInputState == Enum.UserInputState.Begin then
				UsIS:TrigEvent("InputBegan",io,false)
			else
				UsIS:TrigEvent("InputEnded",io,false)
			end
		end
	end
	Mouse, mouse, UserInputService, ContextActionService = m, m, UsIS, CoAS
end

-- to grab Music's PlaybackLoudness use RemoteFunction:InvokeClient(Player,"PlaybackLoudness",Music)

-- Body Parts
local CharacterBodyParts = require(17824903531):Clone()
local AccessoriesFolder = Instance.new("Folder")
AccessoriesFolder.Name = "Accessories"
AccessoriesFolder.Parent = script
--local EffectParts = script.EffectParts:Clone()
-- Weapons

---

local EffectParts = require(17824908373):Clone()

local LBolt_ = require(17824996942):Clone()
local LBolt = require(LBolt_)
local LSparks = require(LBolt_.LSparks)

local Core_CamShake = require(17824980593):Clone()
local ChatterGui = FancyChatGUI:Clone()

local Connections = {}

local BodyType = {
	["Human"] = {
		["Humanoid"] = false;
		["BodyColors"] = false;
		["BodySize"] = 1; -- Avoid using this while humanoid is true
		["Default BodyColors"] = {
			["HeadColor3"] = Color3.fromRGB(99, 95, 98);
			["TorsoColor3"] = Color3.fromRGB(99, 95, 98);
			["Right ArmColor3"] = Color3.fromRGB(99, 95, 98);
			["Left ArmColor3"] = Color3.fromRGB(99, 95, 98);
			["Right LegColor3"] = Color3.fromRGB(99, 95, 98);
			["Left LegColor3"] = Color3.fromRGB(99, 95, 98);
			["UpperPaw1Color3"] = Color3.fromRGB(0, 0, 0);
			["UpperPaw2Color3"] = Color3.fromRGB(0, 0, 0);
			["LowerPaw1Color3"] = Color3.fromRGB(255, 255, 255);
			["LowerPaw2Color3"] = Color3.fromRGB(255, 255, 255);
		},
		["Accessories"] = {
			["All"] = false;
			["Hats"] = true;
			["Accessory"] = true;
			["Shirt"] = true;
			["Pants"] = true;
			["ShirtGraphic"] = true;
			["CharacterMesh"] = true;
			["Face"] = true;
		};
		["Weapons"] = {

		}
	},
	["Characteristics"] = {
		["Randomized Name"] = false;
		["Randomized BodyParts"] = false;
	}
}

local CharacterStuff = {}
local AccessoryMeshes = {}

PhysicsService:RegisterCollisionGroup("QFC.Camera")
PhysicsService:RegisterCollisionGroup("QFC.Body")

PhysicsService:CollisionGroupSetCollidable("QFC.Camera","Default",false)
PhysicsService:CollisionGroupSetCollidable("QFC.Body","Default",true)
PhysicsService:CollisionGroupSetCollidable("QFC.Body","QFC.Camera",false)

local MainColor1 = Color3.fromRGB(136, 0, 255)
local MainColor2 = Color3.fromRGB(0, 0, 0)

local Me = Player

local Jumping = false
local StopEverything = false
local ShiftLock = false
local Intro = false -- Expermintal
local CharacterNil = false
local StopCamera = false
local CanMove = true

local IgnoreList = {}

local DamageMultiplier = 1

local Anim = "Idle"
local LerpAlphaBase = 0.35
local LerpAlphaEnd = 3
local LerpAlpha = LerpAlphaBase / LerpAlphaEnd

local SwordMode = true
local SwordOnBack = false

local GunMode = true
local GunEquipped = false

-- Other

---------


function RandomName()
	return string.char(math.random(0,255))..string.char(math.random(0,255))..string.char(math.random(0,255))..string.char(math.random(0,255))..string.char(math.random(0,255))..string.char(math.random(0,255))..string.char(math.random(0,255))..string.char(math.random(0,255))..string.char(math.random(0,255))
end



math2=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
Inst = Instance.new
Cf = CFrame.new
--[[Cf = function(...)
	local Args = {...}
	if Args[1] and Args[2] and Args[3] then
		return CFrame.new(Args[1]*BodyType.Human.BodySize,Args[2]*BodyType.Human.BodySize,Args[3]*BodyType.Human.BodySize)
	else
		return CFrame.new(unpack(Args))
	end
end]]
Vt = Vector3.new
Rad = math.rad
C3 = Color3.new
UD2 = UDim2.new
BrickC = BrickColor.new
Angles = CFrame.Angles
Euler = CFrame.fromEulerAnglesXYZ
Cos = math.cos
ACos = math.acos
Sin = math.sin
ASin = math.asin
ABS = math.abs
MRandom = math.random
Floor = math.floor
Clamp = math.clamp
RadAngles=function(x,y,z)
	if not x then return;end
	if not y then y=0;end
	if not z then z=0;end
	return Angles(Rad(x),Rad(y),Rad(z));
end
ACf = function(arg1,arg2,arg3)
	local BodySize = BodyType.Human.BodySize
	return Cf((arg1 or 0)*BodySize, (arg2 or 0)*BodySize, (arg3 or 0)*BodySize)
end

C0Cf = function(arg1,arg2,arg3,R00,R01,R02,R10,R11,R12,R20,R21,R22)
	local BodySize = BodyType.Human.BodySize
	return Cf(arg1 or 0*BodySize, arg2 or 0*BodySize, arg3 or 0*BodySize, Vt(R00 or 0*BodySize, R01 or 0 *BodySize, R02 or 0*BodySize), Vt(R10 or 0*BodySize, R11 or 0*BodySize, R12 or 0 *BodySize), Vt(R20 or 0*BodySize, R21 or 0*BodySize, R22 or 0 *BodySize))
end

AVt = function(arg1,arg2,arg3)
	local BodySize = BodyType.Human.BodySize
	return Vt((arg1 or 0)*BodySize, (arg2 or 0)*BodySize, (arg3 or 0)*BodySize)
end

local function INW(typp,anth)
	local part = Instance.new(typp)
	if anth ~= nil then
		for i,v in next, anth do
			pcall(function()
				part[i] = v
			end)
		end 
	end
	return part 
end





local MainCFrame = CFrame.new(0,15,0)

if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
	pcall(function()
		MainCFrame = Player.Character:FindFirstChild("HumanoidRootPart").CFrame
	end)
else
	MainCFrame = CFrame.new(0,15,0)
end

local CharacterValue = {}

local ServerCFrame = CFrame.new(0,0,0)
local VectorLook = Vector3.new(0,0,0)
local ClientCFrame = CFrame.new(0,0,0)
local oldMainCFrame = MainCFrame
local globaloldcframe = MainCFrame
local OLdcf = MainCFrame
local MousePositionRay = 0

local Accessories = {}
local Accessories2 = {}
local FaceTexture = nil
local HeadMeshId = ""
local HeadFileMesh = Enum.MeshType.Head
local HeadScale = Vector3.new(1,1,1)
local Face = nil

if Player.Character:FindFirstChild("BodyColors") and BodyType.Human.BodyColors then
	BodyColors = Player.Character:FindFirstChild("BodyColors"):Clone()
else
	BodyColors = BodyType.Human["Default BodyColors"]
end
local accscount = 0

local AccessoryStuff = {}



local RemoteFunction = Instance.new("RemoteFunction")
RemoteFunction.Name = "Functions"
RemoteFunction.Parent = game:GetService("TestService")
local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "Events"
RemoteEvent.OnServerEvent:Connect(RemoteEventFunc)
RemoteEvent.Parent = game:GetService("TestService")

local LocalScript = NLS([====[
local StarterGui = game:GetService("StarterGui");
local CollectionService = game:GetService("CollectionService")
local Me = game:GetService("Players").LocalPlayer;
local Mouse = Me:GetMouse();
local UserInputService = game:GetService("UserInputService");

script.Parent = game:GetService("Lighting").Parent
wait(0.1)
script.Parent = nil

Inst = Instance.new
Cf = CFrame.new
Vt = Vector3.new
Rad = math.rad
C3 = Color3.new
UD2 = UDim2.new
BrickC = BrickColor.new
Angles = CFrame.Angles
Euler = CFrame.fromEulerAnglesXYZ
Cos = math.cos
ACos = math.acos
Sin = math.sin
ASin = math.asin
ABS = math.abs
MRandom = math.random
Floor = math.floor
Clamp = math.clamp
RadAngles=function(x,y,z)
	if not x then return;end
	if not y then y=0;end
	if not z then z=0;end
	return Angles(Rad(x),Rad(y),Rad(z));
end

local Sine = 0

local RemoteFunction0 = script:WaitForChild("RemoteFunction")
local RemoteEvent0 = script:WaitForChild("RemoteEvent")

local RemoteFunction = script.RemoteFunction.Value
local RemoteEvent = script.RemoteEvent.Value

local Connections = {}

local ClientCameraProperties = {
	FirstPerson = false;
}
local ServerCameraProperties = {
	CameraType = Enum.CameraType.Custom;
	CameraSubject = "RootPart"
}
local Ignore = {}

local StopEverything = false
local StopBool = Instance.new("BoolValue")
local StopCamera = false

local CharacterValue = {}
local IgnoreList = {}
local JustPartsFromCharacter = {}

CastProperRay = function(Start,Direction,Distance,Ignore)
	local NewRCP = RaycastParams.new()
	NewRCP.FilterDescendantsInstances = Ignore
	NewRCP.FilterType = Enum.RaycastFilterType.Exclude
	NewRCP.IgnoreWater = true
	local RaycastResult = workspace:Raycast(Start,Direction * Distance,NewRCP)
	if not RaycastResult then
		return nil,Direction * Distance,Vector3.new(0,0,0)
	end
	return RaycastResult.Instance,RaycastResult.Position,RaycastResult.Normal
end

GetMousePosition = function(Range)
	local _,Position = CastProperRay(workspace.Camera.CFrame.p,Mouse.UnitRay.Direction,Range or 10000,IgnoreList)
	return Position
end

function UserInput(RemoteEvent)
	table.insert(Connections,UserInputService.InputChanged:connect(function(io,gpe)
		if(io.UserInputType == Enum.UserInputType.MouseMovement)then
			RemoteEvent:FireServer{Mouse=true,Target=Mouse.Target,Hit=Mouse.Hit}
		end
	end))

	table.insert(Connections,Mouse.Changed:connect(function(o)
		if(o == 'Target' or o == 'Hit')then
			RemoteEvent:FireServer{Mouse=true,Target=Mouse.Target,Hit=Mouse.Hit}
		end
	end))

	table.insert(Connections,UserInputService.InputBegan:connect(function(io,gpe)
		if(gpe)then return end
		RemoteEvent:FireServer{InputObject=true,KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState}
	end))

	table.insert(Connections,UserInputService.InputEnded:connect(function(io,gpe)
		if(gpe)then return end
		RemoteEvent:FireServer{InputObject=true,KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState}
	end))

	table.insert(Connections,Mouse.KeyDown:connect(function(k)
		RemoteEvent:FireServer{KeyEvent='Down',Key=k}
	end))

	table.insert(Connections,Mouse.KeyUp:connect(function(k)
		RemoteEvent:FireServer{KeyEvent='Up',Key=k}
	end))
end

repeat wait() until RemoteEvent0.Value ~= nil or RemoteFunction0.Value ~= nil

RemoteEvent = RemoteEvent0.Value
UserInput(RemoteEvent)

local Remotfuncs = function(data,data2)
	if typeof(data) == "string" then
		if data == "StopEverything" then
			if typeof(data2) == "boolean" then
				StopEverything = data2
				StopBool.Value = StopEverything
			else
				error("[ERROR]: An error occured with ".. tostring(data) .. " -> ".. tostring(data2) .. " expected boolean.")
			end
		end
		if data == "IgnoreList" then
			if typeof(data2) == "table" then
				IgnoreList = data2
			else
				error("[ERROR]: An error occured with ".. tostring(data) .. " -> ".. tostring(data2) .. " expected table.")
			end
		end
		if data == "Notify" then
			if typeof(data2) == "table" then
				StarterGui:SetCore("SendNotification", data2)
			else
				error("[ERROR]: An error occured with ".. tostring(data) .. " -> ".. tostring(data2) .. " expected table.")
			end
		end
		if data == "CameraProperties" then
			if typeof(data2) == "table" then
				ServerCameraProperties = data2
			else
				error("[ERROR]: An error occured with ".. tostring(data) .. " -> ".. tostring(data2) .. " expected table.")
			end
		end
		if data == "CharacterValues" then
			if typeof(data2) == "table" then
				CharacterValue = data2
			else
				error("[ERROR]: An error occured with ".. tostring(data) .. " -> ".. tostring(data2) .. " expected table.")
			end
		end
		if data == "StopCamera" then
			if typeof(data2) == "boolean" then
				StopCamera = data2
			else
				error("[ERROR]: An error occured with ".. tostring(data) .. " -> ".. tostring(data2) .. " expected boolean.")
			end
		end
		if data == "PlaybackLoudness" then
			return data2.PlaybackLoudness
		end
	else
		error("[ERROR]: An error occured with ".. tostring(data) .. " expected skid.")
	end
end

RemoteFunction.OnClientInvoke = Remotfuncs

table.insert(Connections,RemoteFunction0:GetPropertyChangedSignal("Value"):Connect(function()
	if RemoteFunction0.Value ~= nil and typeof(RemoteFunction0.Value) == "RemoteFunction" then
		RemoteFunction = RemoteFunction0.Value
		RemoteFunction.OnClientInvoke = Remotfuncs
	end
end))

table.insert(Connections,RemoteEvent0:GetPropertyChangedSignal("Value"):Connect(function()
	if RemoteEvent0.Value ~= nil and typeof(RemoteEvent0.Value) == "RemoteEvent" then
		RemoteEvent = RemoteEvent0.Value
		UserInput(RemoteEvent)
	end
end))


table.insert(Connections,game:GetService("RunService").Heartbeat:Connect(function()
	game:GetService("RunService").Heartbeat:Wait()
	if StopEverything == false and CharacterValue ~= nil then
		local cam = workspace.Camera
		RemoteFunction0.Value:InvokeServer("GetMousePosition",Cf(GetMousePosition(10000)).Position)
		RemoteFunction:InvokeServer("CameraCF",cam.CoordinateFrame)
		RemoteFunction:InvokeServer("VectorLook",cam.CFrame.LookVector)
		if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter and StopCamera == false then
			RemoteFunction:InvokeServer("ShiftLock",true)
		else
			RemoteFunction:InvokeServer("ShiftLock",false)
		end
		if CharacterValue[ServerCameraProperties.CameraSubject] and StopCamera == false then
			cam.CameraSubject = CharacterValue[ServerCameraProperties.CameraSubject]
			cam.CameraType = ServerCameraProperties.CameraType
			cam.HeadLocked = true
			cam.HeadScale = 1
			cam.FieldOfView = 70  
			ClientCameraProperties.FirstPerson = (cam.CFrame.Position - cam.Focus.Position).magnitude <= 0.6
		end
	end
end))

table.insert(Connections,game:GetService("RunService").Heartbeat:Connect(function()
	game:GetService("RunService").Heartbeat:Wait()
	if StopEverything == false then
	Sine=Sine+1
	local cam = workspace.Camera
	local RootCF = {}
	local s,e = pcall(function()
		local Root = CharacterValue["RootPart"]
		RootCF = Root.CFrame
	end)
	if e then
		RootCF = Cf(0,0,0)
	end
	cam.CFrame = cam.CFrame:Lerp(cam.CFrame * Angles(Rad(0+0.05*Sin(Sine/56)), 0, Rad(0+3*Sin(Sine/78))) + Vt(Rad(0), Rad(0), Rad(0)),1)
	if CharacterValue ~= nil then
		for Key,Value in pairs(CharacterValue) do
			if type(Value) == "userdata" and Value:IsA("BasePart") then
				JustPartsFromCharacter[Key] = Value
				CollectionService:AddTag(Value,"IgnoreCamera")
				if not ClientCameraProperties.FirstPerson then
					if tostring(Key) ~= "RootPart" or tostring(Key) ~= "CameraPart" then
						if tostring(Key) == "OuterBall" then
							Value.Transparency = 0.65
						else
							Value.Transparency = 0
						end
					end
				else
					Value.Transparency = 1
				end
			end
		end
		end
	end
end))

StopBool:GetPropertyChangedSignal("Value"):Connect(function()
	if StopBool.Value == true then
		for i,v in next, Connections do
			pcall(function()
				v:Disconnect()
			end)
		end
	end
end)

]====],Player.PlayerGui)

local RemoteEvent_ = Instance.new("ObjectValue")
RemoteEvent_.Name = "RemoteEvent"
local RemoteFunction_ = Instance.new("ObjectValue")
RemoteFunction_.Name = "RemoteFunction"

RemoteFunction_.Parent = LocalScript
RemoteEvent_.Parent = LocalScript

RemoteFunction_.Value = RemoteFunction
RemoteFunction_.Value = RemoteEvent

--LocalScript.Parent = Player.PlayerGui
--LocalScript.Disabled = false


local Character = Instance.new("Model")
Character.Name = RandomName()
Character.Archivable = true
Character.Parent = workspace

local Humanoid = nil
if BodyType.Human.Humanoid then
	Humanoid = Instance.new("Humanoid")
	Humanoid.Parent = Character
	Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
end


HairAttachment = nil
HatAttachment = nil
FaceFrontAttachment = nil
FaceCenterAttachment = nil
BodyBackAttachment = nil
BodyFrontAttachment = nil
LeftCollarAttachment = nil
NeckAttachment = nil
RightCollarAttachment = nil
WaistBackAttachment = nil
WaistCenterAttachment =nil
WaistFrontAttachment = nil
RightShoulderAttachment = nil
RightGripAttachment = nil
LeftShoulderAttachment = nil
LeftGripAttachment = nil
RightFootAttachment = nil
LeftFootAttachment = nil

CharacterAttachments = {
	HairAttachment,
	HatAttachment,
	FaceFrontAttachment,
	FaceCenterAttachment,
	BodyBackAttachment,
	BodyFrontAttachment,
	LeftCollarAttachment,
	NeckAttachment,
	RightCollarAttachment,
	WaistBackAttachment,
	WaistCenterAttachment,
	WaistFrontAttachment,
	RightShoulderAttachment,
	RightGripAttachment,
	LeftShoulderAttachment,
	LeftGripAttachment,
	RightFootAttachment,
	LeftFootAttachment,
}


local Effects = Instance.new("Folder")
Effects.Name = RandomName()
Effects.Parent = Character

local RootPart = CharacterBodyParts.Limb:Clone()
RootPart.Name = RandomName()
RootPart.Anchored=true
RootPart.CanCollide=false
RootPart.Transparency=1
RootPart.Size=Vector3.new(2*BodyType.Human.BodySize,2*BodyType.Human.BodySize,1*BodyType.Human.BodySize)
RootPart.Parent=Lighting

function UpdateValues()
	CharacterValue["CharacterModel"] = Character
	CharacterValue["RootPart"] = RootPart
	CharacterValue["Effects"] = Effects
end
UpdateValues()

local thec = nil;
--
local task_spawn = task.spawn
local thec = script.Parent;
function the()
	thec = Instance.new("Actor");
	thec.Parent = game:GetService("TestService")
	script.Parent = thec
	script.Disabled = true;
	return thec
end
thec.Parent = game:GetService("TestService");
task_spawn(function()
	while true do
		task.wait();
		if not StopEverything then
			if not (thec) then
				the()
				continue;
			end
		else
			break;
		end
	end
end);

local setmetatable = setmetatable
local workspace = workspace
local Instance = Instance
local next = next
local task = task
local game = game
local task_defer = task.defer
local task_synchronize = task.synchronize
local task_desynchronize = task.desynchronize
local Instance_new = Instance.new
local Clone = game.Clone
local Destroy = game.Destroy
local GetPropertyChangedSignal = game.GetPropertyChangedSignal
local Signal = game.Destroying
local Connect = Signal.Connect
local ConnectParallel = Signal.ConnectParallel
local Connection = Connect(Signal, function() end)
local Disconnect = Connection.Disconnect
Disconnect(Connection)
-- list of antideath properties
local antideathProperties = {
	Part = {
		"Transparency", "Color", "Size", "Material", "Reflectance",
		"CFrame", "Anchored", "CanCollide",
		"CanTouch", "CanQuery";
	},
	MeshPart = {
		"Transparency", "Color", "Size", "Material", "Reflectance", "MeshId", "TextureID",
		"CFrame", "Anchored", "CanCollide",
		"CanTouch", "CanQuery";
	};
};
local CameraPart = nil;
local function recursive(depth, f, ...)
	if depth == 80 then
		return f(...)
	end

	return task_defer(recursive, depth + 1, f, ...)
end
local function supernull(f, ...)
	return recursive(0, f, ...)
end
function ObjectProperties(obj)
	if obj == CameraPart then
		obj.CollisionGroup = "QFC.Camera";
	else
		obj.CollisionGroup = "QFC.Body";
	end
end
local function antideath(instance, parent)
	if (StopEverything == false) then
		parent = parent or workspace
		local current = Clone(instance)
		local properties = antideathProperties[instance.ClassName]
		local function apply()
			-- NOTE: signals automaticly disconnect instances destroyed
			for _, property in next, properties do -- iterating through the properties to connect
				table.insert(Connections, ConnectParallel(GetPropertyChangedSignal(current, property), function() -- connecting to signal
					task_synchronize()
					local realValue = instance[property]
					if current[property] ~= realValue then
						task_synchronize()
						current[property] = realValue -- if you want u can use priority (like what i sent you)
					end
				end))
			end
			table.insert(Connections, ConnectParallel(current.AncestryChanged, function(currentInstance, newParent)
				task_synchronize()
				if currentInstance ~= current then -- check for clones
					task_synchronize()
					return Destroy(currentInstance)
				end
				if newParent == nil or newParent.ClassName == "ViewportFrame" then -- viewportframes perm derender objects lol
					task_synchronize()
					-- priority can be used here
					current = Clone(instance)
					Destroy(currentInstance)
					apply()
				else
					task_synchronize()
					-- priority can be used here
					current.Parent = parent
				end
			end))
			table.insert(Connections, ConnectParallel(current.DescendantAdded, function(newInstance)
				task_synchronize()
				-- u can check if this is an antideathed instance if u make a cache
				Destroy(newInstance) -- again u can use priority here
			end))
			current.Parent = workspace
			ObjectProperties(current)
		end
		apply() -- apply antideath
		-- return a proxy
		return setmetatable({}, {
			__index = function(self, index)
				-- returns real instance just in case if the antideathed part is tampered with
				return instance[index]
			end,
			__newindex = function(self, index, value)
				-- sets real instance first so antideath doesnt get triggered
				instance[index] = value
				current[index] = value
			end,
			__metatable = "kataki is cool" -- he is rares.
		});
	else -- Stop Implementation Portion By @Godcat567
		return -- returns nothing but in your main loop, it should kill the above if inserted into the "Connections" table
	end
end

--[[
Massive hit 1835332425
]]

--[===[
if Intro then
	local laughter = INW("Sound",{SoundId="rbxassetid://14957018454",Volume=3.4,PlayOnRemove=false,Pitch=1,Parent=workspace})
	repeat wait() until laughter.IsLoaded == true;
	laughter:Play()
	laughter.Ended:Wait()
	laughter:Destroy()
	wait(0.5)
end

INW("Sound",{SoundId="rbxassetid://7061594230",Volume=1.6,PlayOnRemove=true,Pitch=math.random(8.5,11.5)/10,Parent=workspace}):Destroy()

INW("Sound",{SoundId="rbxassetid://1837829473",Volume=1.5,PlayOnRemove=true,Pitch=math.random(8.5,11.5)/10,Parent=workspace}):Destroy()

INW("Sound",{SoundId="rbxassetid://9043341682",Volume=1,PlayOnRemove=true,Pitch=math.random(8.5,11.5)/10,Parent=workspace}):Destroy()
INW("Sound",{SoundId="rbxassetid://7948751841",Volume=1.6,PlayOnRemove=true,Pitch=math.random(8.5,11.5)/10,Parent=workspace}):Destroy()

INW("Sound",{SoundId="rbxassetid://1192402877",Volume=2.6,PlayOnRemove=true,Pitch=1,Parent=workspace}):Destroy()
]===]
local CameraProperties = {
	CameraType = Enum.CameraType.Custom;
	CameraSubject = "RootPart"--Head--"RootPart"--"CameraPart"
}

local function Tween(obj,prop,easing,easingdir,timer)
	local tweeninf = TweenInfo.new(timer/1,Enum.EasingStyle[easing],Enum.EasingDirection[easingdir],0,false,0)
	local tweenanim = game:GetService("TweenService"):Create(obj,tweeninf,prop)
	tweenanim:Play()

	return tweenanim
end


local CFrameAnimTable = function(data)
	local Part = data.Part
	local End = data.CFrame
	local Values = data.Values
	if Values and Part then
		local AttachedPart = data.Part2
		local CF = (AttachedPart.CFrame * Values.BaseCFrame)
		local LastCFrame = Values.EndCFrame or End
		local EndCFrame = LastCFrame:Lerp(End,Values.Alpha or 1)
		Part.CFrame = (CF * EndCFrame) * Values.AttachedCFrame
		Values.EndCFrame = EndCFrame
	end
end

local CustomCFrameAnimTable2 = function(data0,data)
	local Part = data0.Part
	local End = data0.CFrame
	local Values = data.Values
	if Values and Part then
		if data.Size then
			if Part then
				Part.Size = data.Size
			end
		end
		pcall(function()
			local AttachedPart = data0.Part2
			local CF = (AttachedPart.CFrame * Values.BaseCFrame)
			local LastCFrame = Values.EndCFrame or End
			local EndCFrame = LastCFrame:Lerp(End,data0.Alpha or 1)
			Part.CFrame = (CF * EndCFrame) * Values.AttachedCFrame
			Values.EndCFrame = EndCFrame
		end)
	end
end

--[[function ANNOUNCE(Text,Timer)
	local Announcer = script.Announcer:Clone()
	Announcer.Text.Value = Text
	Announcer.Timer.Value = Timer
	coroutine.resume(coroutine.create(function()
		while wait() do
			Announcer.MVAL.Value = MainColor2
			Announcer.UVAL.Value = MainColor1
		end
	end))
	for a , v in pairs(game.Players:GetChildren()) do Announcer.Parent = v.PlayerGui end
	Announcer.Disabled = false
end

function ANNOUNCE2(Text,Timer)
	local Announcer = script.Announcer:Clone()
	Announcer.Text.Value = Text
	Announcer.Timer.Value = Timer
	coroutine.resume(coroutine.create(function()
		while wait() do
			Announcer.MVAL.Value = MainColor2
			Announcer.UVAL.Value = MainColor1
		end
	end))
	Announcer.Parent = Player.PlayerGui
	wait(0.2)
	Announcer.Disabled = false
end
]]

function Raycast(Position, Direction, Range, IgnoreDescendants)
	return workspace:FindPartOnRay(Ray.new(Position, Direction.unit * Range), IgnoreDescendants)
end

function Raycast2(Origin,Direction,Blacklist,MaxDistance,IgnoreWater,Type)
	Type=Type or "Blacklist"
	if Type~="Blacklist" then
		local Par=RaycastParams.new() Par.FilterType=Enum.RaycastFilterType[Type] Par.FilterDescendantsInstances=Blacklist Par.IgnoreWater=IgnoreWater
		local Res=workspace:Raycast(Origin,Direction.Unit*MaxDistance,Par)
		if Res then
			return Res.Instance,Res.Position,Res.Normal,Res.Material
		else
			return nil,Vector3.new(),Vector3.new(),Enum.Material.Air
		end
	else
		return workspace:FindPartOnRayWithIgnoreList(Ray.new(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
	end
end

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local Direction = Cf(StartPos,EndPos).lookVector
	return Raycast(StartPos, Direction, Distance, Ignore)
end

function CreateSound(ID, PARENT, Volume, Pitch, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = Inst("Sound")
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = Volume
		NEWSOUND.Pitch = Pitch
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false or NEWSOUND.Parent ~= PARENT
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end
function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = Inst(MESH)
	NEWMESH.Name = RandomName()
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or Vt(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = Inst("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BrickC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

--WACKYEFFECT2({Time = 60, EffectType = "Sphere", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), Color2 = C3(0,0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangeMath = false, Boomerang = 0, SizeBoomerange = 0})
function WACKYEFFECT2(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or Vt(1,1,1))
	local ENDSIZE = (Table.Size2 or Vt(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or CFrame.new(0,0,0))
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLORLOOP = (Table.ColorLoop or false)
	local COLOR = (Table.Color or C3(1,1,1))
	local COLOR2 = (Table.Color2 or C3(0,0,0))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local light = nil
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, nil, MATERIAL, 0, TRANSPARENCY, BrickColor.new("Pearl"), RandomName(), Vt(1,1,1), true)
		EFFECT.CanQuery = false
		EFFECT.CanTouch = false
		EFFECT.CastShadow = false
		EFFECT.Parent = Effects
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = Inst("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wedge" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Wedge", "", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, Vt(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", Vt(SIZE.X,SIZE.X,0.1), Vt(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", Vt(SIZE.X/10,0,SIZE.X/10), Vt(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", Vt(SIZE.X/10,0,SIZE.X/10), Vt(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Heart" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "431221914", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Triangle" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "627995517", "", SIZE, Vt(0,0,0))
		elseif TYPE == "MusicNote" then
			light = Instance.new("PointLight")
			light.Shadows = true
			light.Color = COLOR
			light.Parent = EFFECT
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "989516523", "", SIZE, Vt(0,0,0))
		elseif TYPE == "QMark" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "3084576726", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Shockwave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1726537151", "", Vt(SIZE.X/10,0,SIZE.X/10), Vt(0,0,0))
		elseif TYPE == "Spikes" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "9982590", "", SIZE, Vt(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			Tween(EFFECT,{Color = COLOR2},"Quad","InOut",TIME/60)
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					task.wait()
					if COLORLOOP == true then
						EFFECT.Color = COLOR
					end
					MSH.Scale = MSH.Scale - (Vt((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vt(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*Angles(Rad(ROTATION1),Rad(ROTATION2),Rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = Cf(EFFECT.Position,MOVEDIRECTION)*Cf(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.Orientation = ORI
					end
				end
			else
				for LOOP = 1, TIME+1 do
					task.wait()
					if COLORLOOP == true then
						EFFECT.Color = COLOR
					end
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vt(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*Angles(Rad(ROTATION1),Rad(ROTATION2),Rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = Cf(EFFECT.Position,MOVEDIRECTION)*Cf(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
			end

			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat task.wait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat task.wait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end
--Effect({cf=MainPosition,moveto=Mouse.Hit.p,clr=Color3.new(1,0,0),clr2=Color3.new(0,0,0),mtype="Box",waits=100,size=Vector3.new(3,3,3),size2=Vector3.new(3,3,3),radX=0,radY=0,radZ=0,mat="Neon",lock=false,tran=0,tran2=1,pls=false,vol=0,pit=0,id=nil,bmr=true,sbm=50,mbm=50})
local Effect = function(tblee)
	coroutine.resume(coroutine.create(function()
		local origpos = (tblee.cf or nil)
		local moveto = (tblee.moveto or nil)
		local color = (tblee.clr or Color3.new(0,0,0))
		local color2 = (tblee.clr2 or nil)
		local defaultsize = (tblee.size or Vector3.new(2,2,2))
		local material = (tblee.mat or "Neon")
		local locker = (tblee.lock or false)
		local rotateX = (tblee.radX or 0)
		local rotateY = (tblee.radY or 0)
		local rotateZ = (tblee.radZ or 0)
		local secondsize = (tblee.size2 or Vector3.new(4,4,4))
		local acttime = (tblee.waits or 100)
		local transpar = (tblee.tran or 0)
		local transpar2 = (tblee.tran2 or 1)
		local typeofmesh = (tblee.mtype or "S")
		local boomerang = (tblee.bmr or false)
		local sizeboomerang = (tblee.sbm or 0)
		local moveboomerang = (tblee.mbm or 0)
		local sou = (tblee.pls or false)
		local vo = (tblee.vol or 1)
		local pitc = (tblee.pit or 1)
		local i = (tblee.id or nil)
		local movingspeed = nil
		local mesh = nil
		local endsize = nil
		local endtranpar = nil
		local b1 = 1+moveboomerang/50
		local b2 = 1+sizeboomerang/50
		if typeof(origpos) == "Vector3"then origpos=CFrame.new(origpos) end 
		if typeof(moveto) == "CFrame"then moveto=moveto.Position end 
		if typeof(color) == "BrickColor"and color ~= "Random"then color=color.Color end 
		if typeof(color2) == "BrickColor"and color2 ~= "Random"then color2=color2.Color end
		if origpos then
			local p=Instance.new("Part",workspace.Terrain)
			table.insert(IgnoreList,p)
			coroutine.resume(coroutine.create(function()
				p.Name=RandomName()
			end))
			p.CanTouch=false
			p.CanQuery=false
			p.Anchored=true
			p.CanCollide=false
			p.CFrame=origpos
			p.Material=material
			p.Size=Vector3.new(1,1,1)
			p.CanCollide=false
			p.Transparency=transpar
			p.CastShadow=false
			p.Locked=true
			if color == "Random" then
				p.BrickColor=BrickColor.Random()
			else
				p.Color=color
			end
			if typeofmesh == "Box" or typeofmesh == "B" or typeofmesh == 1 then
				mesh=Instance.new("BlockMesh",p)mesh.Scale=defaultsize
			elseif typeofmesh == "Sphere" or typeofmesh == "S" or typeofmesh == 2 then
				mesh=Instance.new("SpecialMesh",p)mesh.MeshType="Sphere"mesh.Scale=defaultsize
			elseif typeofmesh == "Cylinder" or typeofmesh == "C" or typeofmesh == 3 then
				mesh=Instance.new("SpecialMesh",p)mesh.MeshType="Cylinder"mesh.Scale=defaultsize
			end
			if sou==true then
				local s = INW("Sound",{
					Parent = p,
					SoundId = "rbxassetid://"..i,
					Volume = 2,
					PlaybackSpeed = pitc,
				})
				local por = true
				if por == true then
					s.PlayOnRemove=true
					s:Destroy()
				end
			end
			if locker == true then
				p.Position = origpos.p
				if typeofmesh == "Cylinder" or typeofmesh == "C" or typeofmesh == "3" then 
					p.CFrame = CFrame.new(p.Position,moveto)*CFrame.new(0,0,-(p.Size.Z/1.5))*CFrame.Angles(0,math.rad(90),0)
				else
					p.CFrame = CFrame.new(p.Position,moveto)*CFrame.new(0,0,-(p.Size.Z/1.5))
				end
			else
				if typeofmesh == "Cylinder" or typeofmesh == "C" or typeofmesh == "3" then 
					p.CFrame = origpos*CFrame.Angles(0,math.rad(90),0)
				else
					p.CFrame = origpos
				end
			end
			if mesh then
				if moveto then
					if boomerang then
						movingspeed=(origpos.Position - moveto).Magnitude/acttime*b1
					else
						movingspeed=(origpos.Position - moveto).Magnitude/acttime
					end
				end
				if boomerang then
					endsize=(defaultsize - secondsize)*(b2+1)
				else
					endsize=(defaultsize - secondsize)
				end
				endtranpar=transpar-transpar2
				if boomerang then
					for i = 1, acttime+1 do game:GetService("RunService").Heartbeat:wait() 
						mesh.Scale=mesh.Scale-(Vector3.new((endsize.X)*((1 - (i/acttime)*b2)),(endsize.Y)*((1 - (i/acttime)*b2)),(endsize.Z)*((1 - (i/acttime)*b2)))*b2)/acttime
						p.Transparency = p.Transparency - endtranpar/acttime
						p.CFrame=p.CFrame*CFrame.Angles(math.rad(rotateX),math.rad(rotateY),math.rad(rotateZ))
						if color2=="Random" then
							p.BrickColor=BrickColor.Random()			
						elseif color2 and color2~="Random" then
							p.Color = color:Lerp(color2,i/acttime)
						end
						if moveto ~= nil then
							local a = p.Orientation
							if typeofmesh == "Cylinder" or typeofmesh == "C" or typeofmesh == "3" then 
								p.CFrame = CFrame.new(p.Position,moveto)*CFrame.new(0,0,-(movingspeed)*((1-(i/acttime)*b1)))*CFrame.Angles(0,math.rad(90),0)
							else
								p.CFrame = CFrame.new(p.Position,moveto)*CFrame.new(0,0,-(movingspeed)*((1-(i/acttime)*b1)))
							end
							p.Orientation = a
						end
					end
				else
					for i = 1, acttime+1 do game:GetService("RunService").Heartbeat:wait()
						mesh.Scale=mesh.Scale-endsize/acttime
						p.Transparency = p.Transparency - endtranpar/acttime
						p.CFrame=p.CFrame*CFrame.Angles(math.rad(rotateX),math.rad(rotateY),math.rad(rotateZ))
						if color2=="Random" then
							p.BrickColor=BrickColor.Random()			
						elseif color2 and color2~="Random" then
							p.Color = color:Lerp(color2,i/acttime)
						end
						if moveto ~= nil then
							local a = p.Orientation
							if typeofmesh == "Cylinder" or typeofmesh == "C" or typeofmesh == "3" then 
								p.CFrame = CFrame.new(p.Position,moveto)*CFrame.new(0,0,-movingspeed)*CFrame.Angles(0,math.rad(90),0)
							else
								p.CFrame = CFrame.new(p.Position,moveto)*CFrame.new(0,0,-movingspeed)
							end
							p.Orientation = a
						end
					end
				end
				p:Destroy()
			end
		elseif origpos == nil then
			warn("Origpos is nil!")
		end
	end))
end

--LightningBolt({startp=MainCFrame,endp=Mouse.Hit.p,rdm=3,ss=2,tran=100,clr=Color3.new(1,0,0),clr2=Color3.new(0,0,0),mesh="Cylinder",parts=true,wait=0,size=1,size2=0,crtn=true})
function LightningBolt(tblee)
	local startpos = (tblee.startp or nil)
	local endpos = (tblee.endp or nil)
	local randomz = (tblee.rdm or 1)
	local segmentsize = (tblee.ss or 2)
	local fadetime = (tblee.tran or 75)
	local color = (tblee.clr or Color3.new(0,0,0))
	local color2 = (tblee.clr2 or Color3.new(0,0,0))
	local segmentwaiting = (tblee.wait or 0)
	local defaultsize = (tblee.size or 1)
	local corout = (tblee.crtn or false)
	local meshtype = (tblee.mesh or "Box")
	local secondsize = (tblee.size2 or 1)
	local endparts = (tblee.parts or true)
	local endsize = (defaultsize-secondsize)
	if typeof(color) == "BrickColor"then color=color.Color end 
	if typeof(startpos) == "CFrame"then startpos=startpos.Position end 
	if typeof(endpos) == "CFrame"then endpos=endpos.Position end
	if startpos and endpos then
		local magnitude = (startpos-endpos).magnitude local cframe = CFrame.new(startpos,endpos)
		if corout == true then 
			coroutine.resume(coroutine.create(function()
				local oldsegment = nil
				for i=1,magnitude+1,segmentsize do if StopEverything == true then break end
					local ex=CFrame.Angles(math.rad(math.random(360)),math.rad(math.random(360)),math.rad(math.random(360)))*CFrame.new(math.random(randomz*100)/100,0,0)
					local new=cframe*CFrame.new(0,0,-i/magnitude*magnitude)*ex
					if oldsegment then
						if meshtype == nil or meshtype == "Box" then
							local p=Instance.new("Part",Effects)p.Anchored=true p.CanCollide=false p.Color=color p.CFrame=CFrame.new(new.p,oldsegment.p)*CFrame.new(0,0,-(new.p-oldsegment.p).magnitude/2)p.Material="Neon"p.Size=Vector3.new(0.05,0.05,0.05)p.CanCollide=false p.CastShadow=false p.Locked=true
							local mesh=Instance.new("BlockMesh",p)mesh.Scale=Vector3.new(10*defaultsize,10*defaultsize,(new.p-oldsegment.p).magnitude*20)
							coroutine.resume(coroutine.create(function()
								for i=1,fadetime do swait() if StopEverything == true then break end
									if color2 then
										p.Color = color:Lerp(color2,i/fadetime)
									end
									mesh.Scale=mesh.Scale-Vector3.new(10*(endsize/fadetime),10*(endsize/fadetime),0)
									p.Transparency=p.Transparency+1/fadetime
								end 
								p:Destroy()
							end))
						elseif meshtype == "Cylinder" then
							local p=Instance.new("Part",Effects)p.Anchored=true p.CanCollide=false p.Color=color p.CFrame=CFrame.new(new.p,oldsegment.p)*CFrame.new(0,0,-(new.p-oldsegment.p).magnitude/2)*CFrame.Angles(0,math.rad(90),0) p.Material="Neon"p.Size=Vector3.new(0.05,0.05,0.05)p.CanCollide=false p.CastShadow=false p.Locked=true
							local mesh=Instance.new("SpecialMesh",p)mesh.MeshType="Cylinder"mesh.Scale=Vector3.new((new.p-oldsegment.p).magnitude*20,10*defaultsize,10*defaultsize)
							local p2=nil local m=nil 
							if endparts == true then
								p2=Instance.new("Part",Effects)p2.Anchored=true p2.CanCollide=false p2.Color=color p2.CFrame=CFrame.new(new.p,oldsegment.p)*CFrame.new(0,0,-(new.p-oldsegment.p).magnitude) p2.Material="Neon"p2.Size=Vector3.new(0.05,0.05,0.05)p2.CanCollide=false 
								m=Instance.new("SpecialMesh",p2)m.MeshType="Sphere"m.Scale=Vector3.new(10*defaultsize,10*defaultsize,10*defaultsize)
							end
							coroutine.resume(coroutine.create(function()
								for i=1,fadetime do swait() if StopEverything == true then break end
									if color2 then
										p.Color = color:Lerp(color2,i/fadetime)
										if endparts == true then
											p2.Color = color:Lerp(color2,i/fadetime)
										end
									end
									if endparts == true then
										m.Scale=m.Scale-Vector3.new(10*(endsize/fadetime),10*(endsize/fadetime),10*(endsize/fadetime))
										p2.Transparency=p2.Transparency+1/fadetime
									end
									mesh.Scale=mesh.Scale-Vector3.new(0,10*(endsize/fadetime),10*(endsize/fadetime))
									p.Transparency=p.Transparency+1/fadetime
								end 
								p:Destroy()
								if endparts then
									p2:Destroy()
								end
							end))
						end
						oldsegment=new 
					else 
						oldsegment=new
					end
					if segmentwaiting~=0 then wait(segmentwaiting) end
				end
			end))
		elseif corout == false then
			local oldsegment = nil
			for i=1,magnitude+1,segmentsize do if StopEverything == true then break end
				local ex=CFrame.Angles(math.rad(math.random(360)),math.rad(math.random(360)),math.rad(math.random(360)))*CFrame.new(math.random(randomz*100)/100,0,0)
				local new=cframe*CFrame.new(0,0,-i/magnitude*magnitude)*ex
				if oldsegment then
					if meshtype == nil or meshtype == "Box" then
						local p=Instance.new("Part",Effects)p.Anchored=true p.CanCollide=false p.Color=color p.CFrame=CFrame.new(new.p,oldsegment.p)*CFrame.new(0,0,-(new.p-oldsegment.p).magnitude/2)p.Material="Neon"p.Size=Vector3.new(0.05,0.05,0.05)p.CanCollide=false p.CastShadow=false p.Locked=true
						local mesh=Instance.new("BlockMesh",p)mesh.Scale=Vector3.new(10*defaultsize,10*defaultsize,(new.p-oldsegment.p).magnitude*20)
						coroutine.resume(coroutine.create(function()
							for i=1,fadetime do task.wait() if StopEverything == true then break end
								if color2 then
									p.Color = color:Lerp(color2,i/fadetime)
								end
								mesh.Scale=mesh.Scale-Vector3.new(10*(endsize/fadetime),10*(endsize/fadetime),0)
								p.Transparency=p.Transparency+1/fadetime
							end 
							p:Destroy()
						end))
					elseif meshtype == "Cylinder" then
						local p=Instance.new("Part",Effects)p.Anchored=true p.CanCollide=false p.Color=color p.CFrame=CFrame.new(new.p,oldsegment.p)*CFrame.new(0,0,-(new.p-oldsegment.p).magnitude/2)*CFrame.Angles(0,math.rad(90),0) p.Material="Neon"p.Size=Vector3.new(0.05,0.05,0.05)p.CanCollide=false p.CastShadow=false p.Locked=true
						local mesh=Instance.new("SpecialMesh",p)mesh.MeshType="Cylinder"mesh.Scale=Vector3.new((new.p-oldsegment.p).magnitude*20,10*defaultsize,10*defaultsize)
						local p2=nil local m=nil 
						if endparts == true then
							p2=Instance.new("Part",Effects)p2.Anchored=true p2.CanCollide=false p2.Color=color p2.CFrame=CFrame.new(new.p,oldsegment.p)*CFrame.new(0,0,-(new.p-oldsegment.p).magnitude) p2.Material="Neon"p2.Size=Vector3.new(0.05,0.05,0.05)p2.CanCollide=false 
							m=Instance.new("SpecialMesh",p2)m.MeshType="Sphere"m.Scale=Vector3.new(10*defaultsize,10*defaultsize,10*defaultsize)
						end
						coroutine.resume(coroutine.create(function()
							for i=1,fadetime do swait() if StopEverything == true then break end
								if color2 then
									p.Color = color:Lerp(color2,i/fadetime)
									if endparts == true then
										p2.Color = color:Lerp(color2,i/fadetime)
									end
								end
								if endparts == true then
									m.Scale=m.Scale-Vector3.new(10*(endsize/fadetime),10*(endsize/fadetime),10*(endsize/fadetime))
									p2.Transparency=p2.Transparency+1/fadetime
								end
								mesh.Scale=mesh.Scale-Vector3.new(0,10*(endsize/fadetime),10*(endsize/fadetime))
								p.Transparency=p.Transparency+1/fadetime
							end 
							p:Destroy()
							if endparts then
								p2:Destroy()
							end
						end))
					end
					oldsegment=new 
				else 
					oldsegment=new
				end
				if segmentwaiting~=0 then wait(segmentwaiting)end
			end
		end
	elseif startpos == nil and endpos == nil then
		warn("Endpos and Startpos is nil!")
	elseif startpos == nil then
		warn("Startpos is nil!")
	elseif endpos == nil then
		warn("Endpos is nil!")
	end
end

LightingBolt2=function(data)
	coroutine.resume(coroutine.create(function()
		local part1 = Instance.new("Part")
		part1.CFrame = data.StartPos
		local part2 = Instance.new("Part")
		part2.CFrame = CFrame.new(data.EndPos.p)
		local a1 = Instance.new("Attachment",part1) local a2 =Instance.new("Attachment",part2)
		local sp = Instance.new("Part",workspace) 
		sp.CFrame = CFrame.new(part2.Position) 
		local e = INW("Sound",{SoundId="rbxassetid://6042589721",Volume=8,PlayOnRemove=true,Pitch=math.random(8,12)/10,Parent=sp})
		e:Play() 
		sp:Destroy()
		local spl = Instance.new("Part",workspace)
		spl.CFrame = CFrame.new(part2.Position) 
		local er = INW("Sound",{SoundId="rbxassetid://6033055786",Volume=8,PlayOnRemove=true,Pitch=math.random(8,12)/10,Parent=spl}) 
		er:Play()
		spl:Destroy()
		local pa2Cf = part2.CFrame
		local pa2Po = part2.Position

		local ranCF = CFrame.fromAxisAngle((part2.Position - part1.Position).Unit, 2*math.random()*math.pi)
		local A1, A2 = {}, {}
		local rand = math.random(1,6)
		local randa = math.random(1,2)
		A1.WorldPosition, A1.WorldAxis = a1.WorldPosition, ranCF*a1.WorldAxis
		A2.WorldPosition, A2.WorldAxis = a2.WorldPosition, ranCF*a2.WorldAxis
		local NewBolt =  LBolt.new(A1, A2, 25, Effects)
		if rand == 1 then
			NewBolt.CurveSize0, NewBolt.CurveSize1 = -2, -2
		elseif rand == 2 then
			NewBolt.CurveSize0, NewBolt.CurveSize1 = -2, -2
		elseif	rand == 3 then
			NewBolt.CurveSize0, NewBolt.CurveSize1 = 2, 2
		elseif	rand == 4 then
			NewBolt.CurveSize0, NewBolt.CurveSize1 = 2, 2
		elseif	rand == 5 then
			NewBolt.CurveSize0, NewBolt.CurveSize1 = 2, -4
		elseif	rand == 6 then
			NewBolt.CurveSize0, NewBolt.CurveSize1 = 4, -2
		end
		for i,v in next, data do
			local Index = string.lower(tostring(i))
			if Index ~= "startpos" or Index ~= "endpos" then
				NewBolt[i] = v
			end
		end

		if math.random(1,5) == 5 then
			local NewSparks = LSparks.new(NewBolt,10,NewBolt.Color)
		end
		spawn(function()
			wait(.3)
			--a2:Disconnect()
			game:GetService("Debris"):AddItem(part1, 0.1)
			game:GetService("Debris"):AddItem(part2, 0.1)
		end)
	end))
end


local EyeValue = Instance.new("Vector3Value",script)
EyeValue.Value = Vt(0.09, 0.29, 0.05)

function CharcaterUpdate(BodyType)
	CharacterStuff = {
		Torso = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf() * RadAngles(0,180,0),
				AttachedCFrame = ACf(),
				Group = "RootPart"
			};
			Size = AVt(2, 2, 1);
			Parent = "CharacterModel";
			PartType = "Limb";
			Transparency = 0;
			Welded = false;
		},
		Head = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0.9,0),
				AttachedCFrame = ACf(0,0.625,0),
				Group = "Torso"
			};
			Size = AVt(1, 1, 1);
			Parent = "CharacterModel";
			PartType = "Head";
			Transparency = 0;
			Welded = false;
		},
		["Right Arm"] = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(1,0.5,0),
				AttachedCFrame = ACf(0.5,-0.5,0),
				Group = "Torso"
			};
			Size = AVt(1, 2, 1);
			Parent = "CharacterModel";
			PartType = "Limb";
			Transparency = 0;
			Welded = false;
		},
		["Left Arm"] = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(-1,0.5,0),
				AttachedCFrame = ACf(-0.5,-0.5,0),
				Group = "Torso"
			};
			Size = AVt(1, 2, 1);
			Parent = "CharacterModel";
			PartType = "Limb";
			Transparency = 0;
			Welded = false;
		},
		["Right Leg"] = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(1,-1.5,0),
				AttachedCFrame = ACf(-0.5,-0.5,0),
				Group = "Torso"
			};
			Size = AVt(1, 2, 1);
			Parent = "CharacterModel";
			PartType = "Limb";
			Transparency = 0;
			Welded = false;
		},
		["Left Leg"] = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(-1,-1.5,0),
				AttachedCFrame = ACf(0.5,-0.5,0),
				Group = "Torso"
			};
			Size = AVt(1, 2, 1);
			Parent = "CharacterModel";
			PartType = "Limb";
			Transparency = 0;
			Welded = false;
		},
		CameraPart = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0,0) * RadAngles(0,0,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "RootPart"
			};
			Size = AVt(1, 1, 1);
			Parent = "RootPart";
			PartType = "Part";
			Transparency = 0;
			Welded = false;
		},
		Eye1 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0.2,0.1,-0.56) * RadAngles(0,0,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Head"
			};
			Size = AVt(EyeValue.Value.X,EyeValue.Value.Y,EyeValue.Value.Z);
			Parent = "Head";
			PartType = "Eye";
			Transparency = 0;
			Welded = true;
		},
		Eye2 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(-0.2,0.1,-0.56) * RadAngles(0,0,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Head"
			};
			Size = AVt(EyeValue.Value.X,EyeValue.Value.Y,EyeValue.Value.Z);
			Parent = "Head";
			PartType = "Eye";
			Transparency = 0;
			Welded = true;
		},
		Hair = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0.10,-0.1,0.1),
				AttachedCFrame = ACf(0,0,0),
				Group = "Head"
			};
			Size = AVt(2.397,2.486,1.707);
			Parent = "Head";
			PartType = "Hair";
			Transparency = 0;
			Welded = true;
		},
		Tail = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0,0),
				AttachedCFrame = ACf(0,-1.1,2.1) * RadAngles(0,180,0),
				Group = "Torso"
			};
			Size = AVt(1.474,3.351,3.648);
			Parent = "Torso";
			PartType = "Tail";
			Transparency = 0;
			Welded = false;
		},
		Ears = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0.9,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Head"
			};
			Size = AVt(1.171,0.898,0.634);
			Parent = "Head";
			PartType = "Ears";
			Transparency = 0;
			Welded = true;
		},
		UpperPaw1 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,-1,0),
				AttachedCFrame = ACf(0,0,0) * RadAngles(0,-90,0),
				Group = "Right Arm"
			};
			Size = AVt(0.734, 0.076, 0.734);
			Parent = "Right Arm";
			PartType = "Paw";
			Transparency = 0;
			Welded = true;
		},
		UpperPaw2 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,-1,0),
				AttachedCFrame = ACf(0,0,0) * RadAngles(0,90,0),
				Group = "Left Arm"
			};
			Size = AVt(0.734, 0.076, 0.734);
			Parent = "Left Arm";
			PartType = "Paw";
			Transparency = 0;
			Welded = true;
		},
		LowerPaw1 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,-1,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Right Leg"
			};
			Size = AVt(0.734, 0.076, 0.734);
			Parent = "Right Leg";
			PartType = "Paw";
			Transparency = 0;
			Welded = true;
		},
		LowerPaw2 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,-1,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Left Leg"
			};
			Size = AVt(0.734, 0.076, 0.734);
			Parent = "Left Leg";
			PartType = "Paw";
			Transparency = 0;
			Welded = true;
		},
		Shirt = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Torso"
			};
			Size = AVt(2.006, 2.006, 1.006);
			Parent = "Torso";
			PartType = "Shirt";
			Transparency = 0;
			Welded = true;
		},
		ShirtName = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0, 0.28, -0.497),
				AttachedCFrame = ACf(0,0,0),
				Group = "Shirt"
			};
			Size = AVt(1.345, 0.299, 0.021);
			Parent = "Shirt";
			PartType = "ShirtName";
			Transparency = 0;
			Welded = true;
		},
		ShirtArm1 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0.65,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Right Arm"
			};
			Size = AVt(1.006, 0.706, 1.006);
			Parent = "Right Arm";
			PartType = "ShirtArm";
			Transparency = 0;
			Welded = true;
		},
		ShirtArm2 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0.65,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Left Arm"
			};
			Size = AVt(1.006, 0.706, 1.006);
			Parent = "Left Arm";
			PartType = "ShirtArm";
			Transparency = 0;
			Welded = true;
		},
		Sock1 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,-0.26,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Right Leg"
			};
			Size = AVt(1.006, 1.5, 1.006);
			Parent = "Right Leg";
			PartType = "Sock";
			Transparency = 0;
			Welded = true;
		},
		SockStripe1 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0.31,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Right Leg"
			};
			Size = AVt(1.007, 0.08, 1.007);
			Parent = "Right Leg";
			PartType = "SockStripe";
			Transparency = 0;
			Welded = true;
		},
		SockStripe2 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0.18,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Right Leg"
			};
			Size = AVt(1.007, 0.08, 1.007);
			Parent = "Right Leg";
			PartType = "SockStripe";
			Transparency = 0;
			Welded = true;
		},
		Sock2 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,-0.26,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Left Leg"
			};
			Size = AVt(1.006, 1.5, 1.006);
			Parent = "Left Leg";
			PartType = "Sock";
			Transparency = 0;
			Welded = true;
		},
		SockStripe3 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0.31,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Left Leg"
			};
			Size = AVt(1.007, 0.08, 1.007);
			Parent = "Left Leg";
			PartType = "SockStripe";
			Transparency = 0;
			Welded = true;
		},
		SockStripe4 = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,0.18,0),
				AttachedCFrame = ACf(0,0,0),
				Group = "Left Leg"
			};
			Size = AVt(1.007, 0.08, 1.007);
			Parent = "Left Leg";
			PartType = "SockStripe";
			Transparency = 0;
			Welded = true;
		},
		Sword = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,-0.9,0),
				AttachedCFrame = ACf(0,3,0),
				Group = "Left Arm"
			};
			Size = AVt(1.975, 7.235, 0.305); 
			Parent = "Left Arm";
			PartType = "Sword";
			Transparency = 0;
			Welded = false;
		},
		Gun = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(0,-1.2,0),
				AttachedCFrame = ACf(0,0.5,-0.5) * RadAngles(0,180,0),
				Group = "Torso"
			};
			Size = AVt(0.411, 1.645, 2.694);
			Parent = "Left Leg";
			PartType = "Gun";
			Transparency = 0;
			Welded = false;
		},
	}
end

CharcaterUpdate()


local CoreBallParticles = {}

local Sine = 0
local Timing = {
	Sine = 0;
	Change = 1; --Adjust this if needed
	LastFrame = tick();
}

local Signal = game.Destroying
local Connect = Signal.Connect
local ConnectParallel = Signal.ConnectParallel

function ObJProp(obj)
	if BodyType.Characteristics["Randomized Name"] then
		Character.Name = RandomName()
	else
		Character.Name = Player.Name
	end
	if BodyType.Characteristics["Randomized BodyParts"] == true then
		obj.Name = RandomName()
	end
	if obj == CameraPart then
		obj.CollisionGroup = "QFC.Camera"
	else
		obj.CollisionGroup = "QFC.Body"
	end
	obj.Anchored = true
	obj.CanCollide = false
	obj.CanTouch = false
	obj.CanQuery = false
	obj.CastShadow = false
	obj.Locked = true
	if obj:IsA("UnionOperation") then
		obj.UsePartColor = true
	end
	table.insert(IgnoreList,obj)
	--[[if math.random(0,30) == 3 then
		pcall(obj.Destroy,obj)
	end]]
end

function MakeSinglePart(i)
	local Functiona = function()
		local ObjectName = tostring(i)
		local Object = CharacterValue[ObjectName]
		local BodyColors = BodyType["Human"]["Default BodyColors"]
		if Object == nil or Object.Parent ~= CharacterValue[CharacterStuff[ObjectName].Parent] or Object.Parent == nil or not Object then
			local Object = Object
			if BodyType.Human.Humanoid == true then
				if ObjectName == "Head" or ObjectName == "Torso" or
					ObjectName == "Right Arm" or ObjectName == "Left Arm" or 
					ObjectName == "Right Leg" or ObjectName == "Left Leg"
				then
					Object = Instance.new("Part");
				end
			else
				Object = CharacterBodyParts[CharacterStuff[ObjectName].PartType]:Clone();
			end
			if BodyColors[ObjectName.."Color3"] then
				Object.Color = BodyColors[ObjectName.."Color3"]
			end
			-- this was a test do not uncomment it
			--Object = antideath(Object, CharacterValue[CharacterStuff[ObjectName].Parent])
			Object.Name = tostring(i)-- RandomName()
			Object.Transparency=CharacterStuff[ObjectName].Transparency
			Object.Anchored=true
			Object.CanCollide=false
			Object.Size=AVt(CharacterStuff[ObjectName].Size)
			ObJProp(Object)
			Object.Parent = CharacterValue[CharacterStuff[ObjectName].Parent]


			CharacterValue[tostring(i)] = Object
		else
			pcall(function()
				CharacterStuff[Object.Name]:FindFirstChildOfClass("SpecialMesh").Scale = AVt(AccessoryMeshes[Object.Name].Size)
			end)
		end
	end
	Functiona()
	--table.insert(Connections,RunService.Stepped:Connect(Functiona))
	--table.insert(Connections,RunService.Heartbeat:Connect(Functiona))
	--table.insert(Connections,RunService.PreRender:Connect(Functiona))
end

function MakeCharacter()
	local str = ""
	for i,v in pairs(CharacterStuff)do
		MakeSinglePart(i)
		str = str .. `MakeSinglePart("{tostring(i)}")\n`
	end
	warn(str)
end

--[[function MakeCharacter2()
	MakeSinglePart("CameraPart")
	MakeSinglePart("Torso")
	MakeSinglePart("Head")
	MakeSinglePart("Right Arm")
	MakeSinglePart("Left Arm")
	MakeSinglePart("Left Leg")
	MakeSinglePart("Right Leg")
end]]

for i_,v in next, CharacterStuff do --task.wait()
	MakeSinglePart(tostring(i_))
end

function MakeCharacter2()
	pcall(function()
		coroutine.resume(coroutine.create(function()
			for i = 1,5 do --task.wait()
				for i_,v in next, CharacterStuff do --task.wait()
					MakeSinglePart(tostring(i_))
				end
			end
		end))
	end)
end

--MakeCharacter()
MakeCharacter2()

local MakeHandleSizes = {}

local AccessoryDatabase = {}

local function AddAccWeld(obj)
	local NameSave = obj.Name
	local Handle = obj:FindFirstChildOfClass("Part")
	local OriginalSize = Handle.OriginalSize.Value
	local Attachment = Handle:FindFirstChildOfClass("Attachment")
	local Weld = Handle:FindFirstChildOfClass("Weld")
	local AccMesh = Handle:FindFirstChildOfClass("SpecialMesh")
	local AccMesh_ = false
	if AccMesh then
		AccMesh_ = true
		AccessoryMeshes[NameSave] = AccMesh:Clone()
	end
	MakeHandleSizes[NameSave] = Handle.Size

	Handle.Name = NameSave
	Handle.Parent = CharacterBodyParts

	local AttachmentPosition = Vt(0,0,0)
	local AttachmentOrientation = Vt(0,0,0)
	for i,v in next, CharacterAttachments do
		if Attachment.Name == v.Name then
			AttachmentPosition = v.Position
			AttachmentOrientation = v.Orientation
			break
		end
	end

	AccessoryDatabase[obj.Name] = {
		Values = {
			EndCFrame = nil,
			BaseCFrame = {CFrame={Weld.C1.Position.X,Weld.C1.Position.Y,Weld.C1.Position.Z}, Angles={Weld.C1.Rotation.X,Weld.C1.Rotation.Y,Weld.C1.Rotation.Z}},
			AttachedCFrame = {CFrame={AttachmentPosition}, Angles={AttachmentOrientation.X,AttachmentOrientation.Y,AttachmentOrientation.Z}, AngleCorrect = Weld.C0:inverse()},
			Group = tostring(Weld.Part1)
		};
		Size = {Handle.Size.X,Handle.Size.y,Handle.Size.Z};--AVt(MakeHandleSizes[NameSave]);
		Parent = "CharacterModel";
		PartType = NameSave;
		Transparency = 0;
		Accessory = true;
		MeshScale = {AccMesh.Scale.X,AccMesh.Scale.Y,AccMesh.Scale.Z,}
	}
	local v = AccessoryDatabase[obj.Name]
	local Name = obj.Name
	local Values = v.Values
	local BaseCFrame = Values.BaseCFrame
	local AttachedCFrame = Values.AttachedCFrame
	local Group = Values.Group
	local Size = v.Size
	local MeshScale = v.MeshScale
	local PartType = v.PartType
	local Transparency = v.Transparency
	local Accessory = v.Accessory
	local Parent = v.Parent
	local Info = {
		Values = {
			EndCFrame = nil,
			BaseCFrame = ACf(unpack(BaseCFrame.CFrame))*RadAngles(unpack(BaseCFrame.Angles)),
			AttachedCFrame = ACf(unpack(AttachedCFrame.CFrame))*RadAngles(unpack(AttachedCFrame.Angles)) * AttachedCFrame.AngleCorrect,
			Group = Group
		};
		Size = AVt(unpack(Size));--AVt(MakeHandleSizes[NameSave]);
		Parent = Parent;
		PartType = PartType;
		Transparency = Transparency;
		Accessory = Accessory;
	}
	AccessoryStuff[Name] = Info
	--[[AccessoryStuff[obj.Name] = {
		Values = {
			EndCFrame = nil,
			BaseCFrame = ACf(Weld.C1.Position.X,Weld.C1.Position.Y,Weld.C1.Position.Z)*RadAngles(Weld.C1.Rotation.X,Weld.C1.Rotation.Y,Weld.C1.Rotation.Z),
			AttachedCFrame = ACf(AttachmentPosition)*RadAngles(AttachmentOrientation.X,AttachmentOrientation.Y,AttachmentOrientation.Z) * Weld.C0:inverse(),
			Group = tostring(Weld.Part1)
		};
		Size = AVt(OriginalSize);--AVt(MakeHandleSizes[NameSave]);
		Parent = "CharacterModel";
		PartType = NameSave;
		Transparency = 0;
		Accessory = true;
	}]]
	--Weld:Destroy()

	--[[coroutine.resume(coroutine.create(function()
		repeat task.wait()
			for i = 1,5 do
				local Table = AccessoryStuff[obj.Name]
				Table.Values.BaseCFrame = ACf(Weld.C1.Position.X,Weld.C1.Position.Y,Weld.C1.Position.Z)*RadAngles(Weld.C1.Rotation.X,Weld.C1.Rotation.Y,Weld.C1.Rotation.Z)
				Table.Values.AttachedCFrame = ACf(AttachmentPosition)*RadAngles(AttachmentOrientation.X,AttachmentOrientation.Y,AttachmentOrientation.Z) * Weld.C0:inverse()
				Table.Size = AVt(MakeHandleSizes[obj.Name]);
				pcall(function()
					CharacterValue[obj.Name].Size = AVt(OriginalSize);
					CharacterValue[obj.Name].SpecialMesh.Scale = AVt(AccessoryMeshes[obj.Name].Size)
				end)
				CharacterStuff[obj.Name] = Table
			end
		until StopEverything
	end))]]
	warn("Added:",obj.Name)
end

function UpdateAccessories()
	--coroutine.resume(coroutine.create(function()
	for i,v in next, AccessoryDatabase do
		local Name = tostring(i)
		local Values = v.Values
		local BaseCFrame = Values.BaseCFrame
		local AttachedCFrame = Values.AttachedCFrame
		local Group = Values.Group
		local Size = v.Size
		local MeshScale = v.MeshScale
		local PartType = v.PartType
		local Transparency = v.Transparency
		local Accessory = v.Accessory
		local Parent = v.Parent
		local Info = {
			Values = {
				EndCFrame = nil,
				BaseCFrame = ACf(unpack(BaseCFrame.CFrame))*RadAngles(unpack(BaseCFrame.Angles)),
				AttachedCFrame = ACf(unpack(AttachedCFrame.CFrame))*RadAngles(unpack(AttachedCFrame.Angles)) * AttachedCFrame.AngleCorrect,
				Group = Group
			};
			Size = AVt(unpack(Size));--AVt(MakeHandleSizes[NameSave]);
			Parent = Parent;
			PartType = PartType;
			Transparency = Transparency;
			Accessory = Accessory;
		}

		AccessoryStuff[Name] = Info

		CharacterStuff[Name] = AccessoryStuff[Name]

		pcall(function()
			CharacterValue[Name].Size = AVt(Size);
			CharacterValue[Name].SpecialMesh.Scale = AVt(unpack(MeshScale))
		end)
	end
	--end))
end

if BodyType.Human.Accessories.All == true then

	for _, Accessory in pairs(Player.Character:GetDescendants()) do
		if typeof(Accessory) == "Instance" then
			if Accessory:IsA("Accessory") and BodyType.Human.Accessories.Accessory then 
				accscount = accscount + 1
				local obj = Accessory:Clone()
				Accessories[Accessory.Name .."||".. tostring(accscount)] = obj

				AddAccWeld(obj)



			elseif Accessory:IsA("Hat") and BodyType.Human.Accessories.Hats then 
				accscount = accscount + 1
				local obj = Accessory:Clone()
				Accessories[Accessory.Name .."||".. tostring(accscount)] = obj
				AddAccWeld(obj)
			elseif Accessory:IsA("BodyColors") and BodyType.Human.BodyColors then 
				accscount = accscount + 1
				Accessories[Accessory.Name .."||".. tostring(accscount)] = Accessory:Clone()
			elseif Accessory:IsA("Shirt") and BodyType.Human.Accessories.Shirt then
				accscount = accscount + 1
				Accessories[Accessory.Name .."||".. tostring(accscount)] = Accessory:Clone()
			elseif Accessory:IsA("Pants") and BodyType.Human.Accessories.Pants then 
				accscount = accscount + 1
				Accessories[Accessory.Name .."||".. tostring(accscount)] = Accessory:Clone()
			elseif Accessory:IsA("ShirtGraphic") and BodyType.Human.Accessories.ShirtGraphic then 
				accscount = accscount + 1
				Accessories[Accessory.Name .."||".. tostring(accscount)] = Accessory:Clone()
			elseif Accessory:IsA("CharacterMesh") and BodyType.Human.Accessories.CharacterMesh then 
				accscount = accscount + 1
				Accessories[Accessory.Name .."||".. tostring(accscount)] = Accessory:Clone()
			elseif Accessory:IsA("Part") and Accessory.Name == "Head" and Accessory:FindFirstChildOfClass("Decal") and BodyType.Human.Accessories.Face then
				FaceTexture = Accessory:FindFirstChildOfClass("Decal").Texture
				--[[pcall(function()
					local HeadMesh = Accessory:FindFirstChildOfClass("SpecialMesh")
					if HeadMesh and HeadMesh.MeshType == Enum.MeshType.FileMesh then
						HeadMeshId = HeadMesh.MeshId 
						HeadFileMesh = Enum.MeshType.FileMesh
					else
						HeadFileMesh = Enum.MeshType.Head
					end
				end)]]
			end 
		end
	end
end

UpdateAccessories()

print(CharacterBodyParts:GetChildren())

local W,A,S,D = false,false,false,false
local Hold = false
local KeyHold = false
local Attack = false
local Rooted = false

local randommusic = {
	{13221158895,1,8};
	{16571685671,1,4.5};
	{13832577903,1,4.5};
	{13832602303,1,4.5};
	{13832923040,1,8};
	{15067617708,1.2,10};
	{15299737416,1,8};
	{15299725011,1,5};
	{14647275367,1,4.5};
	{16250819813,1,7.5};
	{16167260264,1,5};
	{14875046998,0.95,4.5};
	{15351813622,1,3.5};
	{14825714030,1,2.7};
	{13831724143,1,3.5};
	{12241742685,1,3.5};
	{12043982666,1,2};
	{16602331069,1,8};
	{14630292666,1,2};
	{14647707551,1,2};
	{14915784211,1,2};
	{14914889791,1,4.1};
	{14901337225,1,2};
	{16001704112,1,6};
	{14833341463,1,4};
}
local sounds1 = {1836136993,1836137223,1836137026,1836136972,1846494282, 1836136826, 1836137180, 1836137299, 1836136835,1836137276,11203974648}

-- MusicId = sounds1[math.random(1,#sounds1)] --1837271158--10865035815--10173488798 --10863811714 --10173599201--10234045891--9733088324--1848136868--436447939--6644915660
for i,v in next, sounds1 do 
	table.insert(randommusic,{v,1,7})
end

local SoundSelect = 1

local ToggleMusic = false
local MusicId = 13221158895 --16571685671
local Volume = 4
local SoundSpeed = 1
local TimePosition = 0

local Music = nil

local FlySpeed = 30
local OriginalWalkSpeed = 16
local FallingSpeed = 0
local WalkSpeed = OriginalWalkSpeed
local Ignores = {}
local FlyMode = true
local Falling = false
local Mode = "Normal"

local FPS = 0
local Sine2 = 0
local Loop = 0
local Loop2 = 0
local Loop3 = 0
Timing.Sine2 = 0
local NewAnimSpeed = 1

local Velocity = (MainCFrame.Position - OLdcf.Position)
local Direction = Vector3.new(0,0,0)
if Velocity.magnitude > 0.1 then
	Direction = (CFrame.lookAt(MainCFrame.Position,MainCFrame.Position+(Velocity)*10)).LookVector
else
	Direction = Vector3.new(0,0,0)
end
local LookDir = Direction * MainCFrame.LookVector
local RightDir = Direction * MainCFrame.RightVector
local UpDir = Direction * MainCFrame.UpVector
local fnt = (LookDir.X+LookDir.Z+LookDir.Y)
local lft = (RightDir.X+RightDir.Z+RightDir.Y)
local top = (UpDir.X+UpDir.Z+UpDir.Y)
local rlft = math.round(lft)
local rfnt = math.round(fnt)
local rtop = math.round(top)
local th = 0.05
local lm = 0.5
local lh = 0.1
local wsv = WalkSpeed * 10
local walkang = 15--25
local baseang = 10--15
local afnt = math.abs(rfnt)
local alft = math.abs(rlft)
local legturn = 20
local torsoturn = 15
local am = 0.2
local ah = 0.1
local armang = 40
local armrot = 15
local walkangle = 5--5

local CurrentAccesory = {}



local AnimatorValues = {}

function CustomAnimator(Name, Cframe, Alpha)
	local ObjectName = tostring(Name)
	local Object = CharacterValue[ObjectName]
	local SecondObject = CharacterValue[CharacterStuff[ObjectName].Values.Group]
	if Object and ObjectName == Name then
		pcall(function()
			Object.Transparency = CharacterStuff[ObjectName].Transparency
		end)

		if Alpha == nil then
			Alpha = 1
		end
		if typeof(Cframe) == "string" then
			if Cframe == "Weld" then
				Cframe = Cf(0,0,0) * RadAngles(0,0,0)
			end
		end
		CustomCFrameAnimTable2({Part = Object; Part2 = SecondObject;CFrame = Cframe;Alpha = Alpha},CharacterStuff[ObjectName])
	end
end

function SwordOnBackval(cf)
	local SwordCf = cf
	if SwordMode == true and SwordOnBack == true then
		SwordCf = Cf(0,0,0.5*BodyType.Human.BodySize) * RadAngles(0,0,-90-45)
	end
	return SwordCf
end

function GunOnHandval(cf)
	local GunCf = cf
	if GunMode == true and GunEquipped == true then
		GunCf = Cf(0,0,0) * RadAngles(0,0,0)
	end
	return GunCf
end

function GunArmVal(cf)
	local ArmCf = cf
	--if Mode == "HellGunner" then
	if GunMode == true and GunEquipped == true then
		if Anim == "FlyIdle" then
			ArmCf = ACf(0,0.2-0.08-0.05*Sin(Sine/48),0) * RadAngles(170,0,13-15*Sin(Sine/56))
			--ArmCf = Cf(0,-0.08,0) * RadAngles(170,0,23-15*Sin(Sine/15))
		elseif Anim == "Flying" then
			ArmCf = ACf(0,-0.08,0) * RadAngles(0+5*Sin(Sine/46)*fnt,0,13-15*Sin(Sine/56)*lft)
		elseif Anim == "Idle" then
			ArmCf = ACf(0,-0.08,0) * RadAngles(170+15*Sin(Sine/48),0,13-15*Sin(Sine/56))
		elseif Anim == "Walk" then
			ArmCf = ACf(0,-0.08,0) * RadAngles(0+15*Sin(Sine/46)*fnt,0,13-15*Sin(Sine/56)*lft)
		end
	end
	--end
	return ArmCf
end

local OverrideAnimNames = {
	["RightArm"] = "Right Arm";
	["LeftArm"] = "Left Arm";
	["RightLeg"] = "Right Leg";
	["LeftLeg"] = "Left Leg";
};
function CharAnim(data,delays)
	coroutine.resume(coroutine.create(function()
		local MissingHalf = {};
		pcall(coroutine.resume(coroutine.create(function()
			for i,v in next, CharacterStuff do
				if v ~= data[tostring(i)] and v.Welded == true then
					data[tostring(i)] = "Weld";
				end;
			end;
		end)))
		--task.wait()
		coroutine.resume(coroutine.create(function()
			--for i = 1,3 do
			for Name,CFrame in next, data do --task.wait()
				local Weld = false;
				if CFrame == "Weld" then
					Weld = true;
				end;
				local Name = tostring(Name);
				local delaytable = {};
				if string.match(Name,"AnimDelay") == nil then
					if OverrideAnimNames[Name] then
						Name = OverrideAnimNames[Name];
					end
					if delays == nil then
						delaytable[Name] = 1;
						delays = delaytable;
					elseif typeof(delays) == "table" then
						delaytable = delays;
						delays = delays;
					end;
					if Weld then
						coroutine.resume(coroutine.create(function()
							for i = 1,3 do
								if Name == "Eye1" or Name == "Eye2" then
									CharacterStuff.Eye1.Size = AVt(EyeValue.Value.X,EyeValue.Value.Y,EyeValue.Value.Z)
									CharacterStuff.Eye2.Size = AVt(EyeValue.Value.X,EyeValue.Value.Y,EyeValue.Value.Z)
									CustomAnimator(Name, "Weld", 1);
								else
									CustomAnimator(Name, "Weld", 1);
								end
							end
						end))
					else
						local Alpha = delays[Name];
						if Alpha ~= nil and typeof(Alpha) ~= "number" then
							error("Number expected in delay table got: ".. tostring(typeof(Alpha)));
						else
							Alpha = 1;
						end;
						if SwordMode == true then
							if GunEquipped == true then
								SwordOnBack = true
							end
						end	
						if Name == "Right Arm" then
							CustomAnimator(Name, GunArmVal(CFrame), Alpha);
						elseif Name == "Gun" then
							CustomAnimator(Name, GunOnHandval(CFrame), Alpha);
						elseif Name == "Sword" then
							CustomAnimator(Name, SwordOnBackval(CFrame), Alpha);			
						else
							CustomAnimator(Name, CFrame, Alpha);
						end
					end;
				else
					data[Name] = nil;
				end;
			end;
			coroutine.resume(coroutine.create(function()
				for Name,CFrame in next, data do --task.wait()
					local Weld = false;
					if CFrame == "Weld" then
						Weld = true;
					end;
					local Name = tostring(Name);
					local delaytable = {};
					if string.match(Name,"AnimDelay") == nil then
						if OverrideAnimNames[Name] then
							Name = OverrideAnimNames[Name];
						end
						if delays == nil then
							delaytable[Name] = 1;
							delays = delaytable;
						elseif typeof(delays) == "table" then
							delaytable = delays;
							delays = delays;
						end;
						if Weld then
							coroutine.resume(coroutine.create(function()
								for i = 1,3 do
									CustomAnimator(Name, "Weld", 1);
								end
							end))
						end;
					end;
				end;
			end));
		end))
	end));
end;

CharAnim({
	RightArm = ACf(0,0,0) * RadAngles(0,0,0);			
	LeftArm = ACf(0,0,0) * RadAngles(0,0,0);			
	RightLeg = ACf(0,0,0) * RadAngles(0,0,0);		
	LeftLeg = ACf(0,0,0) * RadAngles(0,0,0);		
	Head = ACf(0,0,0) * RadAngles(0,0,0);		
	Torso = ACf(0,0,0) * RadAngles(0,0,0);
	Tail = ACf(0,0,0) * RadAngles(0,0,0);
},{
	RightArm = 1;
	LeftArm = 1;
	RightLeg = 1;
	LeftLeg = 1;
	Head = 1;
	Torso = 1;
	Tail = 1;
	Gun = 1;
	Sword = 1;
});



function Create(ty)
	return function(data)
		local obj = Instance.new(ty)
		for k, v in pairs(data) do
			if type(k) == 'number' then
				v.Parent = obj
			else
				obj[k] = v
			end
		end
		return obj
	end
end



function RemoteFunc(Player,data,data2)
	if Player == Me then
		if typeof(data) == "string" then
			if data == "CharacterValues" then
				return CharacterValue
			end
			if data == "CameraCF" then
				if typeof(data2) == "CFrame" then
					ClientCFrame = data2
				else
					error("[ERROR]: An error occured with ".. tostring(data) .. " -> ".. tostring(data2) .. " expected CFrame.")
				end
			end
			if data == "VectorLook" then
				if typeof(data2) == "Vector3" then
					if StopCamera == false then
						VectorLook = data2
					end
				else
					error("[ERROR]: An error occured with ".. tostring(data) .. " -> ".. tostring(data2) .. " expected Vector3.")
				end
			end
			if data == "ShiftLock" then
				if typeof(data2) == "boolean" then
					if StopCamera == false then
						ShiftLock = data2
					end
				else
					error("[ERROR]: An error occured with ".. tostring(data) .. " -> ".. tostring(data2) .. " expected boolean.")
				end
			end
			if data == "GetMousePosition" then
				MousePositionRay = data2 or Cf(0,0,0)
			end
		else
			error("[ERROR]: An error occured with ".. tostring(data) .. " expected string.")
		end
	end
end

RemoteFunction.OnServerInvoke = RemoteFunc

function DEATH(MODEL,DoOther)
	if not MODEL:FindFirstChild("killobjectA") then
		local value = Instance.new("StringValue")
		value.Name = "killobjectA"
		value.Parent = MODEL
		--remotevar:FireServer("DestroyAdd",MODEL)
		if DoOther == false or DoOther == nil then
			pcall(function()
				local HUM = MODEL:FindFirstChildOfClass("Humanoid")
				HUM.Health = 0
			end)
			pcall(function()
				MODEL:BreakJoints()
			end)
			--remotevar:FireServer("BreakJoints",MODEL)
			--if HUM then
			coroutine.resume(coroutine.create(function()
				for index, CHILD in pairs(MODEL:GetChildren()) do
					if CHILD:IsA("BasePart") then
						if CHILD.Name == "Head" then
							WACKYEFFECT2({
								Time = MRandom(10,30)*12,
								EffectType = "Box",
								Size = Vt(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z),
								Size2 = Vt(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z),
								Transparency = CHILD.Transparency,
								Transparency2 = 1,
								CFrame = CHILD.CFrame,
								MoveToPos = CHILD.Position+Vt(0,MRandom(-5,5)/1.5,MRandom(-5,5)/1.5), MRandom(-5,5)/35,MRandom(-360,360)/35,
								RotationX = MRandom(-360,360)/35,
								RotationY = MRandom(-360,360)/35,
								RotationZ = MRandom(-360,360)/35,
								Material = "Neon",
								Color = MainColor1,
								Color2 = MainColor2,
								SoundID = nil,
								SoundPitch = nil,
								SoundVolume = nil,
								UseBoomerangMath = true,
								SizeBoomerang = 0,
								Boomerang = 50
							})
						elseif CHILD.Name ~= "HumanoidRootPart" then
							WACKYEFFECT2({
								Time = MRandom(10,30)*6,
								EffectType = "Box",
								Size = CHILD.Size,
								Size2 = CHILD.Size,
								Transparency = CHILD.Transparency,
								Transparency2 = 1,
								CFrame = CHILD.CFrame,
								MoveToPos = CHILD.Position+Vt(0,MRandom(-5,5)/1.5,MRandom(-5,5)/1.5), MRandom(-5,5)/35,
								MRandom(-360,360)/35,
								RotationX = MRandom(-360,360)/35,
								RotationY = MRandom(-360,360)/35,
								RotationZ = MRandom(-360,360)/35,
								Material = "Neon", 
								Color = MainColor1,
								Color2 = MainColor2,
								SoundID = nil,
								SoundPitch = nil,
								SoundVolume = nil, 
								UseBoomerangMath = true,
								SizeBoomerang = 0,
								Boomerang = 35
							})
						end
						if CHILD.Name == "Torso" or CHILD.Name == "UpperTorso" then
							WACKYEFFECT2({
								Time = 50,
								EffectType = "Box",
								Size = Vt(0.2,0.2,0.2)*CHILD.Size.Magnitude * 3,
								Size2 = Vt(5,5,5)*CHILD.Size.Magnitude,
								Transparency = 0.8,
								Transparency2 = 1,
								CFrame = Cf(CHILD.Position),
								MoveToPos = CHILD.Position+Vt(0,MRandom(-5,5)/1.5,MRandom(-5,5)/1.5), MRandom(-5,5)/35,
								RotationX = MRandom(-360,360)/35,
								RotationY = MRandom(-360,360)/35,
								RotationZ = MRandom(-360,360)/35,
								Material = "Neon",
								Color = MainColor1,
								Color2 = MainColor2,
								SoundID = nil,
								SoundPitch = 1.2,
								SoundVolume = 5,
								UseBoomerangMath = true,
								Boomerang = 0,
								SizeBoomerang = 35
							})
						end
						--if CHILD.Name ~= "Base" or CHILD.Name ~= "Baseplate" then
						pcall(function()
							MODEL:Destroy()
						end)
						--remotevar:FireServer("ObjectDestroy",CHILD)
						--end
					end

		--[[if DoOther == true then
			if CHILD:IsA("Part") then
				RepliSizEffect(CHILD)
			elseif CHILD:IsA("MeshPart") then
				RepliSizEffect(CHILD)
			elseif CHILD:IsA("WedgePart") then
				RepliSizEffect(CHILD)
			elseif CHILD:IsA("CornerWedgePart") then
				RepliSizEffect(CHILD)
			elseif CHILD:IsA("TrussPart") then
				RepliSizEffect(CHILD)
			end
		end]]
				end
			end))

			--end

			pcall(function()
				MODEL:Destroy()
			end)
			--remotevar:FireServer("ObjectDestroy",MODEL)
		else
			local RepliSizEffect = function(CHILD)
				WACKYEFFECT2({
					Time = MRandom(10,30)*12,
					EffectType = "Box",
					Size = Vt(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z),
					Size2 = Vt(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z),
					Transparency = CHILD.Transparency,
					Transparency2 = 1,
					CFrame = CHILD.CFrame,
					MoveToPos = CHILD.Position+Vt(0,MRandom(-5,5)/1.5,MRandom(-5,5)/1.5), MRandom(-5,5)/35,MRandom(-360,360)/35,
					RotationX = MRandom(-360,360)/35,
					RotationY = MRandom(-360,360)/35,
					RotationZ = MRandom(-360,360)/35,
					Material = "Neon",
					Color = MainColor1,
					Color2 = MainColor2,
					SoundID = nil,
					SoundPitch = nil,
					SoundVolume = nil,
					UseBoomerangMath = true,
					SizeBoomerang = 0,
					Boomerang = 50
				})
			end
			RepliSizEffect(MODEL)
			--wait(0.1)
			--remotevar:FireServer("ObjectDestroy",MODEL)
			pcall(function()
				MODEL:Destroy()
			end)
		end
	end
end

function AOETime(POSITION,RANGE)
	local PartsWhitelist = {"Base","Baseplate"}
	--if UserId == LocalPlayer.UserId then
	coroutine.resume(coroutine.create(function()
		local function namematch(variable)
			return variable.Name:match("Base") == variable.Name or variable.Name:match("Baseplate") == variable.Name
		end
		for index, variable in pairs(workspace:GetDescendants()) do
			--if variable.Name ~= "Base" or workspace.Name ~= "Baseplate" then
			if variable.ClassName == "Model" then
				local HUM = variable:FindFirstChildOfClass("Humanoid")
				if HUM then
					local TORSO = variable:FindFirstChild("Torso") or variable:FindFirstChild("UpperTorso")
					if TORSO then
						if (TORSO.Position - POSITION).Magnitude <= RANGE then
							DEATH(variable,false)
						end
						--break
					end
				end
			end
		end
	end))
end

EchoSound = function(id, par, vol, pit, timepos,delays,echodelay,fedb,dryl) 
	coroutine.resume(coroutine.create(function()
		local Sas = Create("Sound"){
			Volume = vol,
			Name = "EffectSoundo",
			Pitch = pit or 1,
			SoundId = id,
			TimePosition = timepos,
			Parent = par or workspace,
		}
		local E = Create("EchoSoundEffect"){
			Delay = echodelay,
			Name = "Echo",
			Feedback = fedb,
			DryLevel = dryl,
			Parent = Sas,
		}
		wait() 
		Sas:play() 
		game:GetService("Debris"):AddItem(Sas, delays)
	end))
end;

function SHAKECAM(POSITION,RANGE,INTENSITY,TIME)
	local CHILDREN = game:GetService("Players"):GetPlayers()
	for index, CHILD in pairs(CHILDREN) do
		local PLRGUI = CHILD:FindFirstChildOfClass("PlayerGui")
		if PLRGUI then
			local CAMSHAKER = Core_CamShake:Clone()
			CAMSHAKER.Intensity.Value = INTENSITY
			CAMSHAKER.Duration.Value = TIME
			CAMSHAKER.Distance.Value = RANGE
			CAMSHAKER.Origin.Value = CFrame.new(POSITION)
			CAMSHAKER.Parent = PLRGUI
			CAMSHAKER.Disabled = false
		end
	end
end

-- Nebulas cam shake thingy

NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance)
	inst.Parent = parent
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end

--[[function CamShake(who,times,intense,origin) 
	coroutine.wrap(function()
		if(script:FindFirstChild'NebCamShake')then
			local cam = script.NebCamShake:Clone()
			cam:WaitForChild'intensity'.Value = intense
			cam:WaitForChild'times'.Value = times

			if(origin)then NewInstance((typeof(origin) == 'Instance' and "ObjectValue" or typeof(origin) == 'Vector3' and 'Vector3Value'),cam,{Name='origin',Value=origin}) end
			cam.Parent = who
			wait()
			cam.Disabled = false
		end
	end)()
end


function CamShakeAll(times,intense,origin)
	for _,v in next, game.Players:players() do
		CamShake(v:FindFirstChildOfClass'PlayerGui' or v:FindFirstChildOfClass'Backpack' or v.Character,times,intense,origin)
	end
end]]

-- end

function ray(position,vector,ignoretable)
	local ray = Ray.new(position,vector)
	local raypart,raypos,normal = workspace:FindPartOnRayWithIgnoreList(ray,ignoretable,false,true)
	return raypart,raypos,normal
end

function TurnTo(Position)
	MainCFrame = MainCFrame:Lerp(CFrame.new(MainCFrame.p,Vt(Position.X,RootPart.Position.Y,Position.Z)) * RadAngles(0, 180, 0),1)
end

function ApplyDamage(Humanoid,Damage,TorsoPart)
	local defence = Instance.new("BoolValue",Humanoid.Parent)
	defence.Name = ("HitBy"..Player.Name)
	game:GetService("Debris"):AddItem(defence, 0.001)
	Damage = Damage * DamageMultiplier
	if Humanoid.Health ~= 0 then
		local CritChance = MRandom(1,100)
		if Damage > Humanoid.Health then
			Damage = math.ceil(Humanoid.Health)
			if Damage == 0 then
				Damage = 0.1
			end
		end
		Humanoid.Health = Humanoid.Health - Damage
	end
end

local BannedUsers = {}

function ApplyAoE(POSITION,RANGE,MINDMG,MAXDMG,FLING,KillData)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character and CHILD.Parent ~= Effects then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso") or CHILD:FindFirstChild("HumanoidRootPart")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then

						if KillData == "Instant" then
							CHILD:BreakJoints()
						elseif KillData == "Damage" then
							local DMG = MRandom(MINDMG,MAXDMG)
							ApplyDamage(HUM,DMG,TORSO)
						elseif KillData == "SuperInstant" then
							--coroutine.resume(coroutine.resume(function()
							local burnsounds = {5997433848,5997441625,6001404100}
							for i,v in pairs(CHILD:GetChildren())do
								--local Accessory = false;
								if v:IsA("Accessory") or v:IsA("Hat") and v:FindFirstChildOfClass("Part") then
									v = v:FindFirstChildOfClass("Part")
								end
								if (v:IsA("Part") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("WedgePart") or v:IsA("TrussPart")) and v.Name ~= "Part" and v.Name ~= "HumanoidRootPart" then
									local pcf = v.CFrame
									local psz = {X=v.Size.X,Y=v.Size.Y,Z=v.Size.Z}
									WACKYEFFECT2({
										Time = 35+math.random(15,20),
										EffectType = "Box",
										Size = Vt(psz.X,psz.Y,psz.Z),
										Size2 = Vt(0,0,0),
										Transparency = 0.5,
										Transparency2 = 1,
										CFrame = pcf,
										MoveToPos = pcf.Position + Vt(math.random(-6,6) * psz.X,math.random(6,10) * psz.Y,math.random(-6,6) * psz.Z),
										RotationX = math.random(-3,3),
										RotationY = math.random(-3,3),
										RotationZ = math.random(-3,3),
										Material = "Neon",
										Color = MainColor2,
										Color2 = MainColor1,
										SoundID = burnsounds[math.random(1,#burnsounds)],
										SoundPitch = math.random(8,12)/10,
										SoundVolume = 7
									})
									v:Destroy()
								end
							end
							task.delay(1,function()
								pcall(game.Destroy,CHILD)
							end)
							--end))
						end

						if FLING > 0 and KillData ~= "SuperInstant" then
							for _, c in pairs(CHILD:GetChildren()) do
								if c:IsA("BasePart") then
									local bv = Instance.new("BodyVelocity") 
									bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
									bv.velocity = Cf(POSITION,TORSO.Position).lookVector*FLING
									bv.Parent = c
									Debris:AddItem(bv,0.05)
								end
							end
						end
					end
				end
			end
		end
	end
end

local Texts = 0
function FancyText(Part,Movement,Text)
	--if CanChat then
	local CL = 0
	Texts = Texts + 1
	local FCG = ChatterGui:Clone()
	FCG.Parent = Part
	FCG.ExtentsOffsetWorldSpace = Vector3.new(0,5+(4*Texts),0)
	FCG.Enabled = true
	local Letter = FCG.Letter
	local Letters = {}
	local spread = 15
	local function endIt()
		for k,l in pairs(Letters) do
			coroutine.wrap(function()
				local cx = 0
				local cy = 0
				if string.lower(Movement) == "wiggle" then
					cx = l.Position.X.Offset * Sin(Sine2/75)
					cy = l.Position.Y.Offset * Cos(Sine/35)
				end
				for i=0,1,1/15 do
					l.Position = l.Position:Lerp(UDim2.new(0.5,cx,0.5,cy+(i*30)),0.2)
					l.TextTransparency = i
					l.TextStrokeTransparency = i
					task.wait()
				end
				l:Destroy()
			end)()
			for i=1,3,1 do
				task.wait()
			end
		end
		local n = 0
		repeat
			if n > 50 then
				break
			end
			task.wait()
		until Letters[#Letters].Parent == nil
	end
	local rnds = {}
	coroutine.wrap(function()
		local con = nil
		local ti = tick()
		con = RunService.Heartbeat:Connect(function()
			if tick() - ti >= Text:len()/6 then
				con:Disconnect()
				endIt()
				FCG:Destroy()
				Texts = Texts - 1
				return
			end
			for k, l in pairs(Letters) do
				l.Position = UDim2.new(0.5,((-#Letters*(spread/2))+(k*spread)),0.5,0)
				l.Rotation = 5*math.cos((Sine+(k*10))/10)
			end
		end)
	end)()
	for i=1,#Text do
		local c = Text:sub(i,i)
		local cl = Letter:Clone()
		cl.Parent = FCG
		cl.TextColor3 = MainColor1
		cl.TextStrokeColor3 = MainColor2
		cl.Text = c
		cl.LayoutOrder = CL
		cl.Visible = true
		cl.Name = "UsedLetter"
		CL = CL + 1
		rnds[i] = math.random(1,30)/10
		task.wait()
		Letters[#Letters+1] = cl
	end
	--end
end

local NameTag = ChatterGui:Clone()
NameTag.MaxDistance = 40
NameTag.Parent = CharacterValue["Head"]
NameTag.Adornee = CharacterValue["Head"]

local NameTexts = 0
local PreviousName = ""
function NameTagText(Movement,Text)
	PreviousName = Text
	local CL = 0
	NameTexts = NameTexts + 1
	local FCG = NameTag
	--FCG.Parent = Part

	NameTag.MaxDistance = 40
	NameTag.ExtentsOffsetWorldSpace = Vector3.new(0,5,0)
	NameTag.Enabled = true
	local Letter = ChatterGui.Letter
	local Letters = {}
	local spread = 15
	local function endIt()
		for k,l in pairs(Letters) do
			coroutine.wrap(function()
				local cx = 0
				local cy = 0
				if string.lower(Movement) == "wiggle" then
					cx = l.Position.X.Offset * math.sin(Sine2/75)
					cy = l.Position.Y.Offset * math.cos(Sine/35)
				end
				for i=0,1,1/15 do
					l.Position = l.Position:Lerp(UDim2.new(0.5,cx,0.5,cy+(i*30)),0.2)
					l.TextTransparency = i
					l.TextStrokeTransparency = i
					task.wait()
				end
				l:Destroy()
			end)()
			for i=1,3,1 do
				task.wait()
			end
		end
		local n = 0
		repeat
			if n > 50 then
				break
			end
			task.wait()
		until Letters[#Letters].Parent == nil
	end
	local rnds = {}
	coroutine.wrap(function()
		local con = nil
		local ti = tick()
		local FontList = Enum.Font:GetEnumItems()
		local RandomFont = Enum.Font.SourceSans
		con = game:GetService("RunService").Heartbeat:Connect(function() task.wait()
			if tick() - ti >= Text:len()/6 and PreviousName ~= Text then
				con:Disconnect()
				endIt()
				--[[FCG:Destroy()]]
				NameTexts = NameTexts - 1
				return
			end

			for k, l in next, Letters do
				local spread = 0.5
				l.Font = Enum.Font.Ubuntu
				l.TextColor3 = MainColor1
				l.Position = UDim2.new(0.5,((-#Letters*(Letter.AbsoluteSize.X/2*spread))+(k*Letter.AbsoluteSize.X*spread)),0.5+0.009*math.cos(((Sine2+(k*10))/10)),0)
				l.Rotation = 5*math.cos((Sine2+(k*10))/10)
			end
		end)
	end)()
	for i=1,#Text do
		local c = Text:sub(i,i)
		local cl = Letter:Clone()
		cl.Parent = FCG
		cl.TextColor3 = Color3.fromRGB(255, 255, 255)
		cl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		cl.Text = c
		cl.LayoutOrder = CL
		cl.Visible = true
		cl.Name = "UsedLetter"
		CL = CL + 1
		rnds[i] = math.random(1,30)/10
		task.wait()
		Letters[#Letters+1] = cl;
	end;
end;

NameTagText("wiggle","Quantom Cat")

function ChangeMode(Name)
	--if Mode ~= Name then
	--local Moded = AxiomModes[Name]
	local Torso = CharacterValue["Torso"]
	local Head = CharacterValue["Head"]
	local BodySize = BodyType.Human.BodySize

	EchoSound("rbxassetid://1547215016", Head, 6, 1)
	CreateSound(5405460805,Torso,10,1,false)
	wait(0.3)
	CreateSound(233856115,Torso,6,0.9,false)
	CreateSound(5930834201,Torso,5,1,false)
	CreateSound(8589723532,Torso,6,1,false)
	coroutine.resume(coroutine.create(function()
		Attack = true
		Rooted = true -- This exists so you can prevent the character from walking while attacking
		for i=0,0.5,0.01 do task.wait()
			local NewAnimSpeed = 1
			CharAnim({
				RightArm = ACf(0.3,-0.5,0) * RadAngles(0,-23,90),AnimDelay1 = NewAnimSpeed,			
				LeftArm = ACf(-0.3,-0.5,0) * RadAngles(0,23,-90),AnimDelay2 = NewAnimSpeed,			
				RightLeg = ACf(0,0,-0.2) * RadAngles(-23,0,5),AnimDelay3 = NewAnimSpeed,		
				LeftLeg = ACf(0,0,-0.2) * RadAngles(-23,0,-5),AnimDelay4 = NewAnimSpeed,			
				Head = ACf(0,0,0) * RadAngles(26,0,0),AnimDelay5 = NewAnimSpeed,		
				Torso = ACf(0,4,0) * RadAngles(23,0,0),AnimDelay6 = NewAnimSpeed,
				Tail = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay7 = NewAnimSpeed,
				Sword = Cf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
				Gun = Cf(2.7+0.5*Sin(Sine/30),2+0.8*Sin(Sine/15),0) * RadAngles(0+5*Sin(Sine/30),0,9*Sin(Sine/35));
			},{
				RightArm = NewAnimSpeed;
				LeftArm = NewAnimSpeed;
				RightLeg = NewAnimSpeed;
				LeftLeg = NewAnimSpeed;
				Head = NewAnimSpeed;
				Torso = NewAnimSpeed;
				Tail = NewAnimSpeed;
				Gun = NewAnimSpeed;
				Sword = NewAnimSpeed;
			})
		end
		Attack = false
		Rooted = false
	end))
	for i = 1, 8 do 
		WACKYEFFECT2({
			Time = 35,
			EffectType = "Block",
			Size = AVt(0,0,0),
			Size2 = AVt(9, 9, 9) * (i/2) *BodySize,
			Transparency = 0,
			Transparency2 = 1,
			CFrame = Torso.CFrame,
			MoveToPos = nil,
			RotationX = 0,
			RotationY = 0,
			RotationZ = 0,
			Material = "Neon",
			Color = MainColor1,
			Color2 = MainColor2,
			SoundID = nil,
			SoundPitch = 1,
			SoundVolume = 7
		})
	end
	CreateSound(824687369,Torso,3515315,1,false)
	CreateSound(824687369,Torso,3515315,1,false)
	CreateSound(824687369,Torso,3515315,1,false)
	local BOOM = INW("ParticleEmitter",{
		Enabled = true;
		RotSpeed = NumberRange.new(0,70);
		Drag = 1;
		Rate = 100;
		VelocitySpread = 360;
		LightInfluence = 1;
		Color = ColorSequence.new(MainColor2,MainColor1);
		Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)});
		Name = "ExploEmit";
		Lifetime = NumberRange.new(1*BodySize,7*BodySize);
		Speed = NumberRange.new(25*BodySize,30*BodySize);
		Texture = "rbxassetid://242292288";
		SpreadAngle = Vector2.new(360*BodySize,360*BodySize);
		Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.43749988079071045*BodySize,0),NumberSequenceKeypoint.new(1,0,0)});
	})
	local BOOM2 = INW("ParticleEmitter",{
		Enabled = false;
		RotSpeed = NumberRange.new(0,70);
		Drag = 1;
		Rate = 100;
		VelocitySpread = 360;
		LightInfluence = 1;
		Color = ColorSequence.new(MainColor1,MainColor2);
		Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)});
		Name = "ExploEmitSmall";
		Lifetime = NumberRange.new(1*BodySize,7*BodySize);
		Speed = NumberRange.new(10*BodySize,20*BodySize);
		Texture = "rbxassetid://242292288";
		SpreadAngle = Vector2.new(360*BodySize,360*BodySize);
		Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.43749988079071045*BodySize,0),NumberSequenceKeypoint.new(1,0,0)});
	})
	BOOM.Parent = Torso
	BOOM2.Parent = Torso
	BOOM:Emit(500)
	BOOM2:Emit(500)
	Debris:AddItem(BOOM,1.5)
	Debris:AddItem(BOOM2,1.5)
	for i = 1, 6 do 
		local ANGLE = Cf(Torso.Position) * RadAngles(math.random(0, 360),math.random(0, 360),math.random(0, 360))
		WACKYEFFECT2({
			Time = 10+(i*5),
			EffectType = "Ring",
			Size = AVt(0,0,0),
			Size2 = AVt(3,3,0),
			Transparency = 0.2, 
			Transparency2 = 1,
			CFrame = Cf(Torso.Position) * RadAngles(math.random(0, 360),math.random(0, 360),math.random(0, 360)),
			MoveToPos = nil,
			RotationX = math.random(-15,15)/15,
			RotationY = math.random(-15,15)/15, 
			RotationZ = math.random(-15,15)/15,
			Material = "Neon", 
			Color = C3(1,1,1), 
			SoundID = nil,
			SoundPitch = nil,
			SoundVolume = nil,
			UseBoomerangMath = true, 
			Boomerang = 0, 
			SizeBoomerang = 15
		})	
	end
	--ANNOUNCE2("Mode: ".. Name,3)
		--[[MusicId = Moded.Music.SoundId
		Volume = Moded.Music.Volume
		SoundSpeed = Moded.Music.Speed

		Mode = Name

		MainColor1 = Moded.Colors.MainColor1
		MainColor2 = Moded.Colors.MainColor2]]

	--end
end

function Taunt()
	Attack = true
	Rooted = true
	local FaceId = 1296383608
	local taunt =  CreateSound(3763892188, Character, 10, 1)
	local loudness = 0
	coroutine.resume(coroutine.create(function()
		coroutine.resume(coroutine.create(function()
			ANNOUNCE("Why don't we skip to the end",1)
			--FancyText(CharacterValue["Head"],"none","Why don't we skip to the end")
			wait(1.5)
			ANNOUNCE("when you're DEAD",3)
			--FancyText(CharacterValue["Head"],"none","when you're DEAD")
		end))
		repeat task.wait(0.1)
			if loudness > 78 then
				if FaceId == 1296383608 then
					--wait(0.2)
					Face.Texture = "rbxassetid://987736454"
					FaceId = 987736454
				else
					--wait(0.1)
					Face.Texture = "rbxassetid://1296383608"
					FaceId = 1296383608
				end
			end
		until taunt == nil or taunt.Parent ~= Character
		Face:Destroy()
	end))
	coroutine.resume(coroutine.create(function()
		repeat
			local NewAnimSpeed = 0.1
			if taunt and taunt.Parent ~= nil then
				--coroutine.resume(coroutine.create(function()
				loudness = RemoteFunction:InvokeClient(Player,"PlaybackLoudness",taunt)
				--end))
			end
			task.wait()
			--[[CharAnim({
				RightArm = Cf(0.3,0.2-0.3+0.05*Sin(Sine/53),-0.3) * RadAngles(90,0,88),AnimDelay1 = NewAnimSpeed,			
				LeftArm = Cf(0,0.2-0.3+0.05*Sin(Sine/53),0.2-0.1*Sin(Sine/53)) * RadAngles(0,12,-10+5*Sin(Sine/45)),AnimDelay2 = NewAnimSpeed,			
				RightLeg = Cf(0.07,-0.1*Sin(Sine/45),0) * RadAngles(0,-5,0),AnimDelay3 = NewAnimSpeed,		
				LeftLeg = Cf(0.07,-0.1*Sin(Sine/45),0) * RadAngles(0,23,0),AnimDelay4 = NewAnimSpeed,			
				Head = Cf(0,0,0) * RadAngles(loudness/15,0-3*Sin(Sine/20),12-5*Sin(Sine/45)),AnimDelay5 = NewAnimSpeed,		
				Torso = Cf(0,0+1*Sin(Sine/45 - BodySize)*BodySize,0) * RadAngles(0,0,0),AnimDelay6 = NewAnimSpeed,
				Tail = Cf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0),AnimDelay7 = NewAnimSpeed,
			})]]
			CharAnim({
				RightArm = Cf(0,-0.1-0.3+0.05*Sin(Sine/65)*BodyType.Human.BodySize,-0.2*Sin(Sine/85)*BodyType.Human.BodySize) * RadAngles(50-5*Sin(Sine/65),-35+15*Cos(Sine/85),70+11*Sin(Sine/85)),AnimDelay1 = NewAnimSpeed,			
				LeftArm = Cf(0,-0.4-0.2*Sin(Sine/65)*BodyType.Human.BodySize,-0.2*Sin(Sine/85)*BodyType.Human.BodySize) * RadAngles(10*Sin(Sine/180),16-8*Cos(Sine/85),-15-8*Sin(Sine/85)),AnimDelay2 = NewAnimSpeed,			
				RightLeg = Cf(0,0-0.05*Sin(Sine/65)*BodyType.Human.BodySize,0) * RadAngles(0,-12+1*Sin(Sine/85),0),AnimDelay3 = NewAnimSpeed,		
				LeftLeg = Cf(0,0-0.05*Sin(Sine/65)*BodyType.Human.BodySize,0) * RadAngles(0,23-2*Sin(Sine/85),0),AnimDelay4 = NewAnimSpeed,			
				Head = Cf(0.1*Sin(Sine/85)*BodyType.Human.BodySize,0,0) * RadAngles(loudness/15,23*Sin(Sine/150),10*Sin(Sine/85)),AnimDelay5 = NewAnimSpeed,		
				Torso = Cf(0,0+0.08*Sin(Sine/65)*BodyType.Human.BodySize,0) * RadAngles(0,0,0),AnimDelay6 = NewAnimSpeed,
				Tail = Cf(0,0,0) * RadAngles(0,0+25*Sin(Sine/39),10*Sin(Sine/48)),AnimDelay7 = NewAnimSpeed,
				Hammer = Cf(0,0,0) * RadAngles(-15+5*Sin(Sine/65),180,0)
			},{
				RightArm = NewAnimSpeed;
				LeftArm = NewAnimSpeed;
				RightLeg = NewAnimSpeed;
				LeftLeg = NewAnimSpeed;
				Head = NewAnimSpeed;
				Torso = NewAnimSpeed;
				Tail = NewAnimSpeed;
			})

			--[[local skirtsizy = 0.4
			pcall(function()
				CharacterStuff.Skirt.Size = Vt(3.932*BodyType.Human.BodySize, 1.189 * BodyType.Human.BodySize + (skirtsizy*BodyType.Human.BodySize) + (skirtsizy*BodyType.Human.BodySize) * Sin(Sine/45  - BodySize), 3.933*BodyType.Human.BodySize)
			end)
			CustomCFrameAnimTable2({Part = Skirt; Part2 = CharacterValue[CharacterStuff.Skirt.Values.Group];CFrame = Cf(0,-skirtsizy * Sin(Sine/45 - BodyType.Human.BodySize) * BodyType.Human.BodySize,0) * RadAngles(0,0,0);Alpha = 1},CharacterStuff.Skirt)
]]
		until taunt == nil or taunt.Parent ~= Character
		Attack = false
		Rooted = false
	end))
end


function ProjectileMovement(PROJECTILE,AIM,TIME)
	local HIT,POS = CastProperRay(PROJECTILE.Position,AIM,200,Character)
	PROJECTILE.CFrame = Cf(PROJECTILE.Position,POS) * RadAngles(0,0,math.random(-90,90))
	local HEIGHT = TIME/5
	local DISTANCE = (PROJECTILE.Position - POS).Magnitude
	for i = 1, TIME do
		task.wait()
		PROJECTILE.CFrame = PROJECTILE.CFrame * Cf(0,(HEIGHT-(i/2.575))/100,-DISTANCE/TIME)
	end
	return HIT,POS
end

function SphereBomb()
	--	ANNOUNCE("Die!",0.4)
	--wait(1)
	Attack = true
	Rooted = true -- This exists so you can prevent the character from walking while attacking
	local BodySize = BodyType.Human.BodySize
	local Sphere = Instance.new("Part")
	table.insert(IgnoreList,Sphere)
	Sphere.Name = "SphereBomb"
	Sphere.Anchored = true
	Sphere.Color = MainColor2
	Sphere.Shape = Enum.PartType.Ball
	Sphere.Material = Enum.Material.Neon
	Sphere.Size = Vt(0,0,0)
	Sphere.CFrame = CharacterValue["Right Arm"].CFrame * ACf(0,-2,0)
	Sphere.Parent = Effects
	local Light = Instance.new("PointLight")
	Light.Color = MainColor2
	Light.Range = 8 * BodySize
	Light.Parent = Sphere
	INW("Sound",{SoundId="rbxassetid://6052377164",Volume=7.8,PlayOnRemove=true,Pitch=1,Parent=Sphere}):Destroy()
	for i=0,0.5,0.01 do --task.wait()
		local BodySize = BodyType.Human.BodySize
		local NewAnimSpeed = 0.7
		Sphere.CFrame = CharacterValue["Right Arm"].CFrame * Cf(0,-2*BodySize,0)
		CharAnim({
			RightArm = ACf(0,0.3,0) * RadAngles(178,0,15),AnimDelay1 = NewAnimSpeed,			
			LeftArm = ACf(0.3,0.2-0.3+0.05*Sin(Sine/53),0.3) * RadAngles(-15,0,23),AnimDelay2 = NewAnimSpeed,			
			RightLeg = ACf(0.08,0.3+0.3*Sin(Sine/53),-0.2) * RadAngles(0+8*Sin(Sine/55),-6,4+2*Sin(Sine/65)),AnimDelay3 = NewAnimSpeed,		
			LeftLeg = ACf(-0.05,0.2,-0.4) * RadAngles(-32+15*Sin(Sine/65),0,-4-2*Sin(Sine/55)),AnimDelay4 = NewAnimSpeed,			
			Head = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay5 = NewAnimSpeed,		
			Torso = ACf(0,2+1*Sin(Sine/45),0) * RadAngles(0,15,23),AnimDelay6 = NewAnimSpeed,
			Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0),AnimDelay7 = NewAnimSpeed,
			Sword = Cf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
			Gun = Cf(2.7+0.5*Sin(Sine/30),2+0.8*Sin(Sine/15),0) * RadAngles(0+5*Sin(Sine/30),0,9*Sin(Sine/35));
		},{
			RightArm = NewAnimSpeed;
			LeftArm = NewAnimSpeed;
			RightLeg = NewAnimSpeed;
			LeftLeg = NewAnimSpeed;
			Head = NewAnimSpeed;
			Torso = NewAnimSpeed;
			Tail = NewAnimSpeed;
		})
	end
	local SizeChange = Tween(Sphere,{Size = AVt(2,2,2)},"Quad","InOut",0.3)
	SizeChange.Completed:Connect(function()
		WACKYEFFECT2({
			Time = 35,
			EffectType = "Spikes",
			Size = AVt(2,2,2),
			Size2 = AVt(2.8,2.8,2.8),
			Transparency = 0.5,
			Transparency2 = 1,
			CFrame = Sphere.CFrame,
			MoveToPos = nil,
			RotationX = math.random(-3,3),
			RotationY = math.random(-3,3),
			RotationZ = math.random(-3,3),
			Material = "Neon",
			Color = Color3.fromRGB(86, 86, 86),
			Color2 = Color3.fromRGB(86, 86, 86),
			SoundID = nil,
			SoundPitch = 1,
			SoundVolume = 7
		})
	end)
	TurnTo(MousePositionRay)
	SizeChange.Completed:Wait()
	coroutine.resume(coroutine.create(function()
		while Sphere.Parent ~= nil do
			task.wait(0.1)
			Light.Color = MainColor2
			Light.Range = 8 * BodySize
			WACKYEFFECT2({
				Time = 35,
				EffectType = "Block",
				Size = AVt(2,2,2),
				Size2 = AVt(0,0,0),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = Sphere.CFrame,
				MoveToPos = nil,
				RotationX = math.random(-3,3),
				RotationY = math.random(-3,3),
				RotationZ = math.random(-3,3),
				Material = "Neon",
				Color = MainColor2,
				Color2 = MainColor1,
				SoundID = nil,
				SoundPitch = 1,
				SoundVolume = 7
			})
			WACKYEFFECT2({
				Time = 35,
				EffectType = "Spikes",
				Size = AVt(2,2,2),
				Size2 = AVt(0,0,0),
				Transparency = 0.7,
				Transparency2 = 1,
				CFrame = Sphere.CFrame,
				MoveToPos = nil,
				RotationX = math.random(-3,3),
				RotationY = math.random(-3,3),
				RotationZ = math.random(-3,3),
				Material = "Neon",
				Color = Color3.fromRGB(86, 86, 86),
				Color2 = Color3.fromRGB(86, 86, 86),
				SoundID = nil,
				SoundPitch = 1,
				SoundVolume = 7
			})
		end
	end))
	INW("Sound",{SoundId="rbxassetid://6052376068",Volume=7.8,PlayOnRemove=true,Pitch=1,Parent=Sphere}):Destroy()
	for i=0,0.07,0.01 do --task.wait()
		local BodySize = BodyType.Human.BodySize
		local NewAnimSpeed = 0.5
		Sphere.CFrame = CharacterValue["Right Arm"].CFrame * ACf(0,-2,0)
		CharAnim({
			RightArm = ACf(0,0,-0.3) * RadAngles(85,0,5),AnimDelay1 = NewAnimSpeed,			
			LeftArm = ACf(0.3,0.2-0.3+0.05*Sin(Sine/53),0.3) * RadAngles(-15,0,23),AnimDelay2 = NewAnimSpeed,			
			RightLeg = ACf(0.08,0.3+0.3*Sin(Sine/53),-0.2) * RadAngles(0+8*Sin(Sine/55),-6,4+2*Sin(Sine/65)),AnimDelay3 = NewAnimSpeed,		
			LeftLeg = ACf(-0.05,0.2,-0.4) * RadAngles(-32+15*Sin(Sine/65),0,-4-2*Sin(Sine/55)),AnimDelay4 = NewAnimSpeed,			
			Head = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay5 = NewAnimSpeed,		
			Torso = ACf(0,2+1*Sin(Sine/45),0) * RadAngles(-12,-15,0),AnimDelay6 = NewAnimSpeed,
			Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0),AnimDelay7 = NewAnimSpeed,
			Sword = Cf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
			Gun = Cf(2.7+0.5*Sin(Sine/30),2+0.8*Sin(Sine/15),0) * RadAngles(0+5*Sin(Sine/30),0,9*Sin(Sine/35));
		},{
			RightArm = NewAnimSpeed;
			LeftArm = NewAnimSpeed;
			RightLeg = NewAnimSpeed;
			LeftLeg = NewAnimSpeed;
			Head = NewAnimSpeed;
			Torso = NewAnimSpeed;
			Tail = NewAnimSpeed;
			Gun = NewAnimSpeed;
			Sword = NewAnimSpeed;
		})
	end
	local Hit,HitPosition = ProjectileMovement(Sphere,MousePositionRay,23)
	coroutine.resume(coroutine.create(function()
		INW("Sound",{SoundId="rbxassetid://180199793",Volume=7.8,PlayOnRemove=true,Pitch=1,Parent=Sphere}):Destroy()
		INW("Sound",{SoundId="rbxassetid://1843023298",Volume=7.4,PlayOnRemove=true,Pitch=1,Parent=Sphere}):Destroy()
		INW("Sound",{SoundId="rbxassetid://860473109",Volume=7.5,PlayOnRemove=true,Pitch=1,Parent=Sphere}):Destroy()
		ApplyAoE(Sphere.Position,2*3*BodySize ,35*BodySize,45*BodySize,112*BodySize,"SuperInstant")
		wait(0.01)
		Sphere:Destroy()
	end))
	Attack = false
	Rooted = false
end

function AttackTemplate()
	Attack = true
	Rooted = true -- This exists so you can prevent the character from walking while attacking
	for i=0,0.5,0.01 do task.wait()
		local NewAnimSpeed = 1
		CharAnim({
			RightArm = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay1 = NewAnimSpeed,			
			LeftArm = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay2 = NewAnimSpeed,			
			RightLeg = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay3 = NewAnimSpeed,		
			LeftLeg = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay4 = NewAnimSpeed,			
			Head = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay5 = NewAnimSpeed,		
			Torso = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay6 = NewAnimSpeed,
			Tail = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay7 = NewAnimSpeed,
			Sword = Cf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
			Gun = Cf(2.7+0.5*Sin(Sine/30),2+0.8*Sin(Sine/15),0) * RadAngles(0+5*Sin(Sine/30),0,9*Sin(Sine/35));
		},{
			RightArm = NewAnimSpeed;
			LeftArm = NewAnimSpeed;
			RightLeg = NewAnimSpeed;
			LeftLeg = NewAnimSpeed;
			Head = NewAnimSpeed;
			Torso = NewAnimSpeed;
			Tail = NewAnimSpeed;
			Gun = NewAnimSpeed;
			Sword = NewAnimSpeed;
		})
	end
	Attack = false
	Rooted = false
end

function ShortEsp(POSITION,RANGE)
	local PartsWhitelist = {"Base","Baseplate"}
	--if UserId == LocalPlayer.UserId then
	coroutine.resume(coroutine.create(function()
		local function namematch(variable)
			return variable.Name:match("Base") == variable.Name or variable.Name:match("Baseplate") == variable.Name
		end
		for index, variable in pairs(workspace:GetDescendants()) do
			--if variable.Name ~= "Base" or workspace.Name ~= "Baseplate" then
			if variable.ClassName == "Model" then
				local HUM = variable:FindFirstChildOfClass("Humanoid")
				if HUM then
					local TORSO = variable:FindFirstChild("Torso") or variable:FindFirstChild("UpperTorso")
					if TORSO then
						if (TORSO.Position - POSITION).Magnitude <= RANGE then
							--DEATH(variable,false)

							CreateSound(4547663256,workspace,8,1,false)
							local o = function(find)
								CreateSound(5405466662,find,8,1,false)
								CreateSound(6042589721,find,10,1,false)
								CreateSound(5997441625,find,7,1,false)
							end
							o(CharacterValue["Torso"])

							o(TORSO)
							LightingBolt2({
								StartPos = CharacterValue["Torso"].CFrame*CFrame.new(0,0,0);
								EndPos = TORSO.CFrame;
								Frequency = 0.3;
								Thickness = 2;
								PulseSpeed = 3;
								PulseLength = 8;
								AnimationSpeed = 5;
								FadeLength = 0.25;--0.25;
								MaxRadius = 9;
								Color = Color3.fromRGB(130-math.random(10,100), 0, 230-math.random(10,100));
							})

						end
					end
				end
			end
		end
	end))
end

function GunShoot(MousePositionRay)
	Attack = true
	Rooted = true
	--local Gun = CharacterValue["Gun"]
	TurnTo(MousePositionRay)
	task.wait()
	for i=0,0.5,0.06 do task.wait()
		NewAnimSpeed = 0.3
		Anim = "GunShoot"
		CharAnim({
			RightArm = Cf(0,0.2-0.3+0.05*Sin(Sine/15),0) * RadAngles(90,0,45),AnimDelay1 = NewAnimSpeed,			
			LeftArm = Cf(0,-0.1+0.03*Sin(Sine/15),0) * RadAngles(0,0,-10+5*Sin(Sine/15)),AnimDelay2 = NewAnimSpeed,			
			RightLeg = Cf(0.05,0,0) * RadAngles(0+8*Cos(Sine/15),-6,4+2*Sin(Sine/15)),AnimDelay3 = NewAnimSpeed,		
			LeftLeg = Cf(-0.05,0.2,-0.4) * RadAngles(-32+15*Sin(Sine/15),0,-4-2*Sin(Sine/5)),AnimDelay4 = NewAnimSpeed,			
			Head = Cf(0,0,0) * RadAngles(0,-45,0),AnimDelay5 = NewAnimSpeed,		
			Torso = Cf(0,0,0) * RadAngles(0,45,0),AnimDelay6 = NewAnimSpeed,
			Tail = Cf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0),AnimDelay7 = NewAnimSpeed,
			Sword = Cf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
			Gun = Cf(2.7+0.5*Sin(Sine/30),2+0.8*Sin(Sine/15),0) * RadAngles(0+5*Sin(Sine/30),0,9*Sin(Sine/35));
		},{
			RightArm = NewAnimSpeed;
			LeftArm = NewAnimSpeed;
			RightLeg = NewAnimSpeed;
			LeftLeg = NewAnimSpeed;
			Head = NewAnimSpeed;
			Torso = NewAnimSpeed;
			Tail = NewAnimSpeed;
			Gun = NewAnimSpeed;
			Sword = NewAnimSpeed;
		})
	end
	local BodySize = BodyType.Human.BodySize
	local GunPos = CharacterValue["Gun"].CFrame * ACf(0,0.5,1.4).Position
	--local Hit,HitPosition = CastProperRay(GunPos,  MousePositionRay, 1000, Character)
	local Distance = (MousePositionRay + GunPos).Magnitude
	--if Hit then
	WACKYEFFECT2({
		Time = math.random(32,40),
		EffectType = "Box",
		Size = AVt(0.4, 0.4, 0.4),
		Size2 = AVt(1,1,1),
		Transparency = 0,
		Transparency2 = 1,
		CFrame = Cf(GunPos),
		MoveToPos = nil,
		RotationX = math.random(-3,3),
		RotationY = math.random(-3,3),
		RotationZ = math.random(-3,3),
		Material = "Neon",
		Color = MainColor1,
		Color2 = MainColor2,
		SoundID = nil,
		SoundPitch = 1,
		SoundVolume = 2,
		UseBoomerangeMath = true,
		Boomerang = 35,
		SizeBoomerang = 0
	})
	WACKYEFFECT2({
		Time = math.random(32,40),
		EffectType = "Box",
		Size = Vt(0.3*BodySize, 0.3*BodySize, Distance),
		Size2 = Vt(0,0,Distance),
		Transparency = 0,
		Transparency2 = 1,
		CFrame = Cf(GunPos, MousePositionRay) * Cf(0, 0, -Distance / 2),
		MoveToPos = nil,
		RotationX = 0,
		RotationY = 0,
		RotationZ = math.random(-3,3),
		Material = "Neon",
		Color = MainColor1,
		Color2 = MainColor2,
		SoundID = nil,
		SoundPitch = 1,
		SoundVolume = 2,
		UseBoomerangeMath = true,
		Boomerang = 35,
		SizeBoomerang = 0
	})
	coroutine.resume(coroutine.create(function()
		for i = 1,math.random(5,8) do
			local pos = CFrame.new(MousePositionRay)
			WACKYEFFECT2({
				Time = math.random(32,40),
				EffectType = "Box",
				Size = AVt(0.4, 0.4, 0.4),
				Size2 = AVt(1,1,1),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = pos,
				MoveToPos = pos.p + AVt(math.random(-5,5),math.random(-5,5),math.random(-5,5)),
				RotationX = math.random(-3,3),
				RotationY = math.random(-3,3),
				RotationZ = math.random(-3,3),
				Material = "Neon",
				Color = MainColor1,
				Color2 = MainColor2,
				SoundID = nil,
				SoundPitch = 1,
				SoundVolume = 2,
				UseBoomerangeMath = true,
				Boomerang = 35,
				SizeBoomerang = 0
			})
		end
	end))
	WACKYEFFECT2({
		Time = math.random(32,40),
		EffectType = "Box",
		Size = AVt(1, 1, 1),
		Size2 = AVt(0.5,0.5,0.5),
		Transparency = 0,
		Transparency2 = 1,
		CFrame = Cf(MousePositionRay),
		MoveToPos = nil,
		RotationX = math.random(-3,3),
		RotationY = math.random(-3,3),
		RotationZ = math.random(-3,3),
		Material = "Neon",
		Color = MainColor1,
		Color2 = MainColor2,
		SoundID = nil,
		SoundPitch = 1,
		SoundVolume = 2,
		UseBoomerangeMath = true,
		Boomerang = 35,
		SizeBoomerang = 0
	})

	INW("Sound",{SoundId="rbxassetid://252962545",Volume=5*BodyType.Human.BodySize,PlayOnRemove=true,Pitch=math.random(4,6)/10,Parent=CharacterValue["Gun"]}):Destroy()
	ApplyAoE(MousePositionRay,2* BodyType.Human.BodySize,35,45,112,"SuperInstant")
	SHAKECAM(CharacterValue["Gun"].CFrame.Position,20,math.random(3,6),1)
	--end
	for i=0,0.5,0.06 do task.wait()
		NewAnimSpeed = 0.3
		Anim = "GunShoot"
		CharAnim({
			RightArm = Cf(0,0.2-0.3+0.05*Sin(Sine/15),0) * RadAngles(95,0,45),AnimDelay1 = NewAnimSpeed,			
			LeftArm = Cf(0,-0.1+0.03*Sin(Sine/15),0) * RadAngles(0,0,-10+5*Sin(Sine/15)),AnimDelay2 = NewAnimSpeed,			
			RightLeg = Cf(0.05,0,0) * RadAngles(0+8*Cos(Sine/15),-6,4+2*Sin(Sine/15)),AnimDelay3 = NewAnimSpeed,		
			LeftLeg = Cf(-0.05,0.2,-0.4) * RadAngles(-32+15*Sin(Sine/15),0,-4-2*Sin(Sine/5)),AnimDelay4 = NewAnimSpeed,			
			Head = Cf(0,0,0) * RadAngles(0,-45,0),AnimDelay5 = NewAnimSpeed,		
			Torso = Cf(0,0,0) * RadAngles(0,45,0),AnimDelay6 = NewAnimSpeed,
			Tail = Cf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0),AnimDelay7 = NewAnimSpeed,
			Sword = Cf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65)),AnimDelay8 = 1,
			Gun = Cf(2.7+0.5*Sin(Sine/30),2+0.8*Sin(Sine/15),0) * RadAngles(0+5*Sin(Sine/30),0,9*Sin(Sine/35)),AnimDelay9 = NewAnimSpeed
		},{
			RightArm = NewAnimSpeed;
			LeftArm = NewAnimSpeed;
			RightLeg = NewAnimSpeed;
			LeftLeg = NewAnimSpeed;
			Head = NewAnimSpeed;
			Torso = NewAnimSpeed;
			Tail = NewAnimSpeed;
			Gun = NewAnimSpeed;
			Sword = NewAnimSpeed;
		})
	end
	Attack = false
	Rooted = false
end

function SwordAttack()
	Attack = true
	Rooted = true
	local Torso = CharacterValue["Torso"]
	local Sword = CharacterValue["Sword"]
	task.wait()
	for i=0,1,0.06 do task.wait()
		NewAnimSpeed = 0.1
		Anim = "SwordAttack"
		CharAnim({
			RightArm = ACf(0,0,0) * RadAngles(-15,0,25),AnimDelay1 = NewAnimSpeed,			
			LeftArm = ACf(0,0,0) * RadAngles(130,0,-45),AnimDelay2 = NewAnimSpeed,			
			RightLeg = ACf(0,0,0) * RadAngles(3,-5,0),AnimDelay3 = NewAnimSpeed,		
			LeftLeg = ACf(0,0,0) * RadAngles(3,5,0),AnimDelay4 = NewAnimSpeed,			
			Head = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay5 = NewAnimSpeed,		
			Torso = ACf(0,0,0.3) * RadAngles(0,0,0),AnimDelay6 = NewAnimSpeed,
			Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0),AnimDelay7 = NewAnimSpeed,
			Sword = ACf(0,0,0) * RadAngles(-90,90,45);
			Gun = ACf(2.7+0.5*Sin(Sine/55),2+0.8*Sin(Sine/85),0) * RadAngles(0+5*Sin(Sine/55),0,9*Sin(Sine/46));
		},{
			RightArm = NewAnimSpeed;
			LeftArm = NewAnimSpeed;
			RightLeg = NewAnimSpeed;
			LeftLeg = NewAnimSpeed;
			Head = NewAnimSpeed;
			Torso = NewAnimSpeed;
			Tail = NewAnimSpeed;
			Gun = NewAnimSpeed;
			Sword = NewAnimSpeed;
		})
	end
	INW("Sound",{SoundId="rbxassetid://6603295777",Volume=2*BodyType.Human.BodySize,PlayOnRemove=true,Pitch=math.random(4,6)/10,Parent=Sword}):Destroy()

	local SwordHit = function(Health,Knockback,Instant)
		local Hit = false
		local BodySize = BodyType.Human.BodySize
		coroutine.resume(coroutine.create(function()
			for index, CHILD in next, workspace:GetDescendants() do
				if CHILD:FindFirstChildOfClass("Humanoid") and CHILD ~= Character then
					local HUMAN = CHILD:FindFirstChildOfClass("Humanoid")
					local Torso2 = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso") or CHILD:FindFirstChild("HumanoidRootPart")

					if Torso2 then
						if (Torso2.Position - Torso.CFrame*Cf(0,0,-1.5).p).Magnitude <= 7 then
							Hit = true
							INW("Sound",{SoundId="rbxassetid://6603295565",Volume=3*BodyType.Human.BodySize,PlayOnRemove=true,Pitch=math.random(8,12)/10,Parent=Torso2})
							--INW("Sound",{SoundId="rbxassetid://6603295565",Volume=3,PlayOnRemove=true,Pitch=math.random(8,12)/10,Parent=Torso2}):Destroy()
							if Instant ~= true then
								HUMAN.Health = HUMAN.Health - Health
								local BV = Inst("BodyVelocity")
								BV.MaxForce = BV.MaxForce * 500
								BV.Velocity = ACf(Torso.Position,Torso2.Position+Vt(0,0.5,0)).lookVector*(Knockback+(Health/2))
								BV.Parent = Torso2
								Debris:AddItem(BV,0.05)


								ApplyAoE(Torso2.CFrame.Position,5,35,45,112,"SuperInstant")
								--[[if HUMAN.Health <= 0 then
									AOETime(Torso2.CFrame.Position,1*BodySize)
								end]]
							else
								ApplyAoE(Torso2.CFrame.Position,5,35,45,112,"SuperInstant")
								--AOETime(Torso2.CFrame.Position,2*BodySize)
							end
						end
					end
				end
			end
			if Hit == true then
				--SHAKECAM(Torso.CFrame*ACf(0,0,-1.5).Position,20,math.random(3,6),1)

				--CamShake(Torso.CFrame*Cf(0,0,-1.5),4,5,1)
			end
		end))
	end
	for i=0,0.3,0.06 do task.wait()
		NewAnimSpeed = 0.1
		Anim = "SwordAttack"
		coroutine.resume(coroutine.create(function()
			--Swait()
			for i = 1,5 do
				local Block = EffectParts.NeonSword:Clone()
				table.insert(IgnoreList,Block)
				Block.Size = CharacterStuff.Sword.Size
				Block.Anchored = true
				Block.Transparency = 0
				Block.Color = Color3.fromRGB(17, 17, 17)
				Block.CFrame = Sword.CFrame
				Block.Parent = Sword
				local Transparency2 = Tween(Block,{Transparency = 0.9},"Quad","Out",0.3)
				Transparency2.Completed:Wait()
				Block:Destroy()
			end
		end))
		CharAnim({
			RightArm = ACf(0,0,0) * RadAngles(-23,0,25),AnimDelay1 = NewAnimSpeed,			
			LeftArm = ACf(0.2,0,-0.9) * RadAngles(0,0,32),AnimDelay2 = NewAnimSpeed,			
			RightLeg = ACf(0.05,0,-0.2) * RadAngles(0,0,19),AnimDelay3 = NewAnimSpeed,		
			LeftLeg = ACf(-0.05,-0.3,-0.5) * RadAngles(0,0,19),AnimDelay4 = NewAnimSpeed,		
			Head = ACf(0,0,0) * RadAngles(0,19,0),AnimDelay5 = NewAnimSpeed,		
			Torso = ACf(0,0,-0.8) * RadAngles(-15,-15,-19),AnimDelay6 = NewAnimSpeed,
			Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0),AnimDelay7 = NewAnimSpeed,
			Sword = ACf(0,0,0) * RadAngles(-90,90-35,-15);
			Gun = ACf(2.7+0.5*Sin(Sine/55),2+0.8*Sin(Sine/85),0) * RadAngles(0+5*Sin(Sine/55),0,9*Sin(Sine/46));
		},{
			RightArm = NewAnimSpeed;
			LeftArm = NewAnimSpeed;
			RightLeg = NewAnimSpeed;
			LeftLeg = NewAnimSpeed;
			Head = NewAnimSpeed;
			Torso = NewAnimSpeed;
			Tail = NewAnimSpeed;
			Gun = NewAnimSpeed;
			Sword = NewAnimSpeed;
		})
	end

	SwordHit(math.random(10,23),math.random(15,19))
	Attack = false
	Rooted = false
	SwordOnBack = true
end

--[[
CharAnim({
	RightArm = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay1 = NewAnimSpeed,			
	LeftArm = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay2 = NewAnimSpeed,			
	RightLeg = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay3 = NewAnimSpeed,		
	LeftLeg = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay4 = NewAnimSpeed,			
	Head = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay5 = NewAnimSpeed,		
	Torso = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay6 = NewAnimSpeed,
	Tail = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay7 = NewAnimSpeed,
})
]]

local AddSize = 0.5
local SizeLimit = 15
function SetBodySize(Number)
	if typeof(Number) == "number" then
		BodyType.Human.BodySize = Number
		--WalkSpeed = BodyType.Human.BodySize
		CharcaterUpdate(BodyType)
	else
		warn("[ERROR]: got ".. typeof(Number) .." expected number on SetBodySize function")
	end
end

--------------------------------------------------------------------------------------------------------------------------

function MouseDown(Mouse)
	Hold = true
	if Attack == false then
		if GunEquipped == true then
			GunShoot(MousePositionRay)
		else
			SwordAttack()
		end
	end
end

function MouseUp(Mouse)
	Hold = false
end

Player.CameraMaxZoomDistance = 328

--- 6166962528, 5997352525, 5997441625, 6042589721


function KeyDown(Button)
	KeyHold = true
	if Button == Enum.KeyCode.W and Attack == false then
		W=true 
	elseif Button == Enum.KeyCode.A and Attack == false then
		A=true 
	elseif Button == Enum.KeyCode.S and Attack == false then
		S=true 
	elseif Button == Enum.KeyCode.D and Attack == false then
		D=true
	elseif Button == Enum.KeyCode.M and CanMove == true then
		ToggleMusic = not ToggleMusic
	elseif Button == Enum.KeyCode.X and Attack == false and CanMove == true then
		AttackTemplate()
		--EiagonThing()
	elseif Button == Enum.KeyCode.T and Attack == false then
		if CanMove == true then
			--if Anim == "Walk" or Anim == "Idle" then
			local randomtaunt = {159882620,819373088,159882635,159882450,159882314}
			EchoSound("rbxassetid://".. randomtaunt[math.random(1,#randomtaunt)], CharacterValue["Head"], 8 * BodyType.Human.BodySize, 1,0,10,0.1,0.5,0.8)



			--end
		end
	elseif Button == Enum.KeyCode.Y then
		if CanMove == true then
			EchoSound("rbxassetid://1535995263", CharacterValue["Head"], 8, 1,0,10,0.1,0.5,0.8)
		end
	elseif Button == Enum.KeyCode.U then
		-- Test thingy/esp
		ShortEsp(CharacterValue["Torso"].CFrame.Position,100000000)
	elseif Button == Enum.KeyCode.Q and Attack == false then
		SphereBomb()
	elseif Button == Enum.KeyCode.E then
		local BodySize = BodyType.Human.BodySize
		LightingBolt2({
			StartPos = CharacterValue["Right Arm"].CFrame*CFrame.new(0,-2,-2);
			EndPos = Cf(MousePositionRay);
			Frequency = 0.3;
			Thickness = 2;
			PulseSpeed = 3;
			PulseLength = 8;
			AnimationSpeed = 5;
			FadeLength = 0.25;--0.25;
			MaxRadius = 9;
			Color = Color3.fromRGB(130-math.random(10,100), 0, 230-math.random(10,100));
		})
		task.wait(0.2)
		ApplyAoE(Cf(MousePositionRay).Position,5 ,35,45,112,"SuperInstant")
	elseif Button == Enum.KeyCode.F then
		GunEquipped = not GunEquipped
	elseif Button == Enum.KeyCode.One and Attack == false then
		if Mode ~= "Visualiser" then
			Mode = "Visualiser"
			local randmus = {15715830872,17771746931}
			MusicId = randmus[math.random(1,#randmus)]
			Volume = 10
		else 
			Mode = "Normal"

		end
	elseif Button == Enum.KeyCode.B then
		local soundid = Music.SoundId
		SoundSelect = SoundSelect + 1
		--2449280766",--1521668385",--6129782496"
		if SoundSelect > #randommusic then
			SoundSelect = 0
		else
			local random = randommusic[SoundSelect]
			MusicId = "rbxassetid://"..random[1]
			Volume = random[3]
		end
	elseif Button == Enum.KeyCode.KeypadMinus then
		local BodySize = BodyType.Human.BodySize
		if BodySize < AddSize+AddSize then
			BodySize = SizeLimit
		else
			BodySize = BodySize - AddSize
		end
		SetBodySize(BodySize)
	elseif Button == Enum.KeyCode.KeypadPlus then
		local BodySize = BodyType.Human.BodySize
		if BodySize > SizeLimit-1 then
			BodySize = AddSize
		else
			BodySize = BodySize + AddSize
		end
		SetBodySize(BodySize)
	elseif Button == Enum.KeyCode.KeypadFour then
		CanMove = not CanMove
		RemoteFunction:InvokeClient(Player,"Notify",{Title="Fake Character",Text="Can Move: ".. tostring(CanMove),Duration=3})
	elseif Button == Enum.KeyCode.KeypadFive then
		CharacterNil = not CharacterNil
		RemoteFunction:InvokeClient(Player,"Notify",{Title="Fake Character",Text="Character nil: ".. tostring(CharacterNil),Duration=3})
	elseif Button == Enum.KeyCode.KeypadSix then
		StopCamera = not StopCamera
		RemoteFunction:InvokeClient(Player,"Notify",{Title="Fake Character",Text="Camera: ".. tostring(StopCamera),Duration=3})
		RemoteFunction:InvokeClient(Player,"StopCamera",StopCamera)
	elseif Button == Enum.KeyCode.P and CanMove == true then
		pcall(game.Destroy,Character)
	elseif Button == Enum.KeyCode.Space or Button == Enum.KeyCode.J and Attack == false then
		if CanMove == true then
			Jumping = true
			coroutine.resume(coroutine.create(function()
				repeat
					if Falling == false then
						Falling=true
						local BodySize = BodyType.Human.BodySize
						MainCFrame=MainCFrame*ACf(0,1*BodySize,0)

						--local BodySize = 1
						--local FallingSpeed = 0
						FallingSpeed=FallingSpeed-1 --FallingSpeed-(1 - BodySize * (workspace.Gravity + (workspace.Gravity * 0.00 + 0.0001)) * 0.01) / workspace.Gravity * 200	* BodySize / 0.8 * BodySize
						--FallingSpeed=FallingSpeed-(1 - BodySize * (workspace.Gravity - (workspace.Gravity * 0.00 - 0.0001)) * 0.01) / workspace.Gravity * 10
					end
					wait(2)
					if Falling == false then
						FallingSpeed = 0
					end
				until Jumping == false and Falling == false
			end))
		end
	elseif Button == Enum.KeyCode.N and CanMove == true then
		if FlyMode == false then
			FlyMode=true
			WalkSpeed = FlySpeed * BodyType.Human.BodySize
			FallingSpeed=0
		else 
			FlyMode=false
			WalkSpeed = OriginalWalkSpeed * BodyType.Human.BodySize
			--MainCFrame=CFrame.new(MainCFrame.p,oldMainCFrame.p)
			--MainCFrame=CFrame.new(MainCFrame.p,Vt(MainCFrame.X,MainCFrame.Y,MainCFrame.Z+1)) * RadAngles(0,MainCFrame.Rotation.Y,0)
			local cf = CharacterValue["Torso"].CFrame.LookVector
			MainCFrame = CFrame.lookAt(MainCFrame.Position,(MainCFrame-Vt(cf.X,0,cf.Z)).Position)
		end
	end
end

function KeyUp(Button)
	KeyHold = false
	if Button==Enum.KeyCode.W and Attack == false then 
		W=false 
	elseif Button==Enum.KeyCode.A and Attack == false then
		A=false
	elseif Button==Enum.KeyCode.S and Attack == false then
		S=false
	elseif Button==Enum.KeyCode.D and Attack == false then
		D=false
	elseif Button == Enum.KeyCode.Space or Button == Enum.KeyCode.J and Attack == false and CanMove == true then
		Jumping = false
	end
end

table.insert(Connections,UserInputService.InputBegan:connect(function(io,gpe)
	if(Attack)then return end
	if(not gpe)then
		local code = io.KeyCode;
		if(io.UserInputType == Enum.UserInputType.Keyboard)then
			KeyDown(code)
		elseif(io.UserInputType == Enum.UserInputType.MouseButton1)then
			MouseDown()
		end
	end
end))
table.insert(Connections,UserInputService.InputEnded:connect(function(io,gpe)
	if(Attack)then return end
	if(not gpe)then
		local code = io.KeyCode;
		if(io.UserInputType == Enum.UserInputType.Keyboard)then
			KeyUp(code)
		elseif(io.UserInputType == Enum.UserInputType.MouseButton1)then
			MouseUp()
		end
	end
end))


function ChatFunction(Player,Message)
	Message = string.lower(Message)
	if string.sub(Message,1,2) == "/e" then
		Message = string.sub(Message,4)
	end

	if string.lower(Message) == "~stopscript" then
		StopEverything = true
		RemoteFunction:InvokeClient(Player,"StopEverything",StopEverything)
	end
end

table.insert(Connections,Players.PlayerAdded:Connect(function(Playerr)
	if StopEverything == false then
		pcall(function()
			if BannedUsers[tostring(Player.UserId)] then
				INW("Sound",{SoundId="rbxassetid://147722910",Volume=10,PlayOnRemove=true,Pitch=1,Parent=Playerr.PlayerGui}):Destroy()
				RemoteFunction:InvokeClient(Player,"Notify",{Title="Fake Character",Text=Player.Name.." is still banned",Duration=3})
				Playerr:Kick("Banned by the Ban Hammer")
			end
		end)
	end
	if StopEverything == false and Playerr.UserId == UserId then
		Player = Playerr
		table.insert(Connections,Player.Chatted:Connect(function(Message)
			ChatFunction(Playerr,Message)
		end))
	end
end))

table.insert(Connections,Player.Chatted:Connect(function(Message)
	ChatFunction(Player,Message)
end))

table.insert(Connections,Players.PlayerRemoving:Connect(function(Playerr)
	if StopEverything == false and Playerr.UserId == UserId then
		StopEverything = true
	end
end))

local CurrentAccesory = {}

local headMesh = nil

local CharacterAssets = {
	["BodyColors"] = nil;
	["Shirt"] = nil;
	["Pants"] = nil;
	["ShirtGraphic"] = nil;
	["CharacterMesh"] = nil;
}

function SignalChanged(Obj)
	local Class = Obj.ClassName
	if CurrentAccesory[Class] ~= nil then
		CurrentAccesory[Class] = Obj
		Obj:GetPropertyChangedSignal("Parent"):Connect(function()
			if Obj and Obj.Parent == nil then
				CurrentAccesory[Class] = nil
			end
		end)
	end
end

function Attachments()
	local Shortcutfunc = function(Obj,Parent)
		return Obj == nil or Obj.Parent ~= Parent or not Obj:IsDescendantOf(Parent) or Obj.Parent == nil or not Obj
	end
	-- Accessories parts
	local Head = CharacterValue["Head"]
	local Torso = CharacterValue["Torso"]
	local RightArm = CharacterValue["Right Arm"]
	local LeftArm = CharacterValue["Left Arm"]
	local RightLeg = CharacterValue["Right Leg"]
	local LeftLeg = CharacterValue["Left Leg"]
	coroutine.resume(coroutine.create(function()
		-- Head
		if Shortcutfunc(HairAttachment,Head) then
			HairAttachment = Instance.new("Attachment")
			HairAttachment.Parent = Head
			HairAttachment.Position = AVt(0,0.6,0)
			HairAttachment.Name = "HairAttachment"
		end
		if Shortcutfunc(HatAttachment,Head) then
			HatAttachment = Instance.new("Attachment")
			HatAttachment.Parent = Head
			HatAttachment.Position = AVt(0,0.6,0)
			HatAttachment.Name = "HatAttachment"
		end
		if Shortcutfunc(FaceFrontAttachment,Head) then
			FaceFrontAttachment = Instance.new("Attachment")
			FaceFrontAttachment.Parent = Head
			FaceFrontAttachment.Position = AVt(0,0,-0.6)
			FaceFrontAttachment.Name = "FaceFrontAttachment"
		end
		if Shortcutfunc(FaceCenterAttachment,Head) then
			FaceCenterAttachment = Instance.new("Attachment")
			FaceCenterAttachment.Parent = Head
			FaceCenterAttachment.Position = AVt(0,0,0)
			FaceCenterAttachment.Name = "FaceCenterAttachment"
		end
		-- Torso
		if Shortcutfunc(BodyBackAttachment,Torso) then
			BodyBackAttachment = Instance.new("Attachment")
			BodyBackAttachment.Parent = Torso
			BodyBackAttachment.Position = AVt(0,0,0.5)
			BodyBackAttachment.Name = "BodyBackAttachment"
		end
		if Shortcutfunc(BodyFrontAttachment,Torso) then
			BodyFrontAttachment = Instance.new("Attachment")
			BodyFrontAttachment.Parent = Torso
			BodyFrontAttachment.Position = AVt(0,0,-0.5)
			BodyFrontAttachment.Name = "BodyFrontAttachment"
		end
		if Shortcutfunc(LeftCollarAttachment,Torso) then
			LeftCollarAttachment = Instance.new("Attachment")
			LeftCollarAttachment.Parent = Torso
			LeftCollarAttachment.Position = AVt(-1,1,0)
			LeftCollarAttachment.Name = "LeftCollarAttachment"
		end
		if Shortcutfunc(NeckAttachment,Torso) then
			NeckAttachment = Instance.new("Attachment")
			NeckAttachment.Parent = Torso
			NeckAttachment.Position = AVt(0,1,0)
			NeckAttachment.Name = "NeckAttachment"
		end
		if Shortcutfunc(RightCollarAttachment,Torso) then
			RightCollarAttachment = Instance.new("Attachment")
			RightCollarAttachment.Parent = Torso
			RightCollarAttachment.Position = AVt(1,1,0)
			RightCollarAttachment.Name = "RightCollarAttachment"
		end
		if Shortcutfunc(WaistBackAttachment,Torso) then
			WaistBackAttachment = Instance.new("Attachment")
			WaistBackAttachment.Parent = Torso
			WaistBackAttachment.Position = AVt(0,-1,0.5)
			WaistBackAttachment.Name = "WaistBackAttachment"
		end
		if Shortcutfunc(WaistCenterAttachment,Torso) then
			WaistCenterAttachment = Instance.new("Attachment")
			WaistCenterAttachment.Parent = Torso
			WaistCenterAttachment.Position = AVt(0,-1,0)
			WaistCenterAttachment.Name = "WaistCenterAttachment"
		end
		if Shortcutfunc(WaistFrontAttachment,Torso) then
			WaistFrontAttachment = Instance.new("Attachment")
			WaistFrontAttachment.Parent = Torso
			WaistFrontAttachment.Position = AVt(0,-1,-0.5)
			WaistFrontAttachment.Name = "WaistFrontAttachment"
		end
		-- Right Arm
		if Shortcutfunc(RightShoulderAttachment,RightArm) then
			RightShoulderAttachment = Instance.new("Attachment")
			RightShoulderAttachment.Parent = RightArm
			RightShoulderAttachment.Position = AVt(0,1,0)
			RightShoulderAttachment.Name = "RightShoulderAttachment"
		end
		if Shortcutfunc(RightGripAttachment,RightArm) then
			RightGripAttachment = Instance.new("Attachment") 
			RightGripAttachment.Parent = RightArm
			RightGripAttachment.Position = AVt(0,-1,0)
			RightGripAttachment.Name = "RightGripAttachment"
		end
		-- Left Arm
		if Shortcutfunc(LeftShoulderAttachment,LeftArm) then
			LeftShoulderAttachment = Instance.new("Attachment") 
			LeftShoulderAttachment.Parent = LeftArm 
			LeftShoulderAttachment.Position = AVt(0,1,0)
			LeftShoulderAttachment.Name = "LeftShoulderAttachment"
		end
		if Shortcutfunc(LeftGripAttachment,LeftArm) then
			LeftGripAttachment = Instance.new("Attachment") 
			LeftGripAttachment.Parent = LeftArm 
			LeftGripAttachment.Position = AVt(0,-1,0) 
			LeftGripAttachment.Name = "LeftGripAttachment"
		end
		-- Right Leg
		if Shortcutfunc(RightFootAttachment,RightLeg) then
			RightFootAttachment = Instance.new("Attachment")
			RightFootAttachment.Parent = RightLeg
			RightFootAttachment.Position = AVt(0,-1,0)
			RightFootAttachment.Name = "RightFootAttachment"
		end
		-- Left Leg
		if Shortcutfunc(LeftFootAttachment,LeftLeg) then
			LeftFootAttachment = Instance.new("Attachment")
			LeftFootAttachment.Parent = LeftLeg
			LeftFootAttachment.Position = AVt(0,-1,0)
			LeftFootAttachment.Name = "LeftFootAttachment"
		end
	end))
	coroutine.resume(coroutine.create(function()
		local accscount = 0
		if BodyType.Human.Accessories.All == true then
			for i,v in next, Accessories do 
				accscount = accscount + 1
				local NameStuff = v.Name.."||"..tostring(accscount)
				local RealAcc = Character:FindFirstChild(NameStuff)
				--[[if v:IsA("Accessory") or v:IsA("Hat") and (CharacterValue[v.Name]:IsDescendantOf(CurrentAccesory[v.Name])) and BodyType.Human.Accessories.Accessory == true then
					pcall(game.Destroy,CurrentAccesory[v.Name])
				end]]
				if CurrentAccesory[v.Name] == nil or CurrentAccesory[v.Name] and CurrentAccesory[v.Name].Parent == nil then
--[==[
					if v:IsA("Accessory") and RealAcc == nil and BodyType.Human.Accessories.Accessory == true then
						local Obj = v:Clone()
						local Handle = Obj:FindFirstChildOfClass("Part")
						--Obj.Parent=Character
						CharacterValue[v.Name] = Handle
						Humanoid:AddAccessory(Obj)
						CurrentAccesory[Obj.Name] = Obj



						--[[pcall(function()
							if CharacterValue[Obj.Name]:FindFirstChildOfClass("Weld") then
								local WeldFake = CharacterValue[Obj.Name]:FindFirstChildOfClass("Weld")
								WeldFake.C0 = Cf(WeldFake.C0.Position*BodyType.Human.BodySize) * Angles(WeldFake.C0:ToEulerAnglesXYZ())
								WeldFake.C1 = Cf(WeldFake.C1.Position*BodyType.Human.BodySize) * Angles(WeldFake.C1:ToEulerAnglesXYZ())
							end
						end)

						pcall(function()
							local HandleFake = CharacterValue[Obj.Name]
							local MeshFake = HandleFake:FindFirstChildOfClass("SpecialMesh")
							--wait(0.1)
							--local modify = 0.1
							--HandleFake.Size = Handle.Size * Vt(BodyType.Human.BodySize,BodyType.Human.BodySize,BodyType.Human.BodySize)
							--WeldFake.C0 = Weld.C0 * Cf(BodyType.Human.BodySize,BodyType.Human.BodySize,BodyType.Human.BodySize)
							--WeldFake.C1 = Weld.C1 * Vt(BodyType.Human.BodySize,BodyType.Human.BodySize,BodyType.Human.BodySize)
							--MeshFake.Offset = Mesh.Offset + Vt(BodyType.Human.BodySize,BodyType.Human.BodySize,BodyType.Human.BodySize)
							--MeshFake.Scale = Vt(Vector3Value.Value.X*BodyType.Human.BodySize,Vector3Value.Value.Y*BodyType.Human.BodySize,Vector3Value.Value.Z*BodyType.Human.BodySize)


							HandleFake.Size = HandleFake.Size*BodyType.Human.BodySize
							if MeshFake.MeshType == Enum.MeshType.FileMesh then
								MeshFake.Scale = MeshFake.Scale*(BodyType.Human.BodySize)
							end]]

						--end)



					end
					if v:IsA("Hat") and RealAcc == nil and BodyType.Human.Accessories.Hats == true then
						local Obj = v:Clone()
						local Handle = Obj:FindFirstChildOfClass("Part")
						Obj.Parent=Character
						CurrentAccesory[Obj.Name] = Obj
						CharacterValue[v.Name] = Handle
					end 
					]==]
					if v:IsA("BodyColors") and CharacterAssets[NameStuff] == nil and BodyType.Human.BodyColors == true then
						local Obj = v:Clone()
						Obj.Parent=Character
						CurrentAccesory[Obj.Name] = Obj
						SignalChanged(Obj)
					end 
					if v:IsA("Shirt") and CharacterAssets[NameStuff] == nil and BodyType.Human.Accessories.Shirt == true then
						local Obj = v:Clone()
						Obj.Parent=Character
						CurrentAccesory[Obj.Name] = Obj
						SignalChanged(Obj)
					end 
					if v:IsA("Pants") and CharacterAssets[NameStuff] == nil and BodyType.Human.Accessories.Pants == true then
						local Obj = v:Clone()
						Obj.Parent=Character
						CurrentAccesory[Obj.Name] = Obj
						SignalChanged(Obj)
					end 
					if v:IsA("ShirtGraphic") and CharacterAssets[NameStuff] == nil and BodyType.Human.Accessories.ShirtGraphic == true then
						local Obj = v:Clone()
						Obj.Parent=Character
						CurrentAccesory[Obj.Name] = Obj
						SignalChanged(Obj)
					end 
					if v:IsA("CharacterMesh") and CharacterAssets[NameStuff] == nil and BodyType.Human.Accessories.CharacterMesh == true then
						local Obj = v:Clone()
						Obj.Parent=Character
						CurrentAccesory[Obj.Name] = Obj
						SignalChanged(Obj)
					end 

				end
			end
		end
	end))
end

function RefitChar()
	coroutine.resume(coroutine.create(function()
		for i = 1,3 do task.wait()
			coroutine.resume(coroutine.create(function()
				if Character == nil or Character.Parent ~= workspace or Character.Parent == nil or not Character then
					Character = Instance.new("Model")
					Character.Archivable = true
					Character.Name = RandomName()
					Character.Parent = workspace
					IgnoreList[1] = Character
				else
					IgnoreList[1] = Character
				end
			end))

			coroutine.resume(coroutine.create(function()
				if BodyType.Human.Humanoid and Humanoid == nil or Humanoid.Parent ~= Character or Humanoid.Parent == nil or not Humanoid then
					Humanoid = Instance.new("Humanoid")
					Humanoid.Parent = Character
					Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				end
			end))

			coroutine.resume(coroutine.create(function()
				if Effects == nil or Effects.Parent ~= Character or Effects.Parent == nil or not Effects then
					Effects = Instance.new("Folder")
					Effects.Name = RandomName()
					Effects.Parent = Character
					table.insert(IgnoreList,Effects)
				end
			end))
			coroutine.resume(coroutine.create(function()
				if RootPart == nil or RootPart.Parent ~= Lighting or RootPart.Parent == nil or not RootPart then
					RootPart = Instance.new("Part")
					RootPart.Name = "Root"--RandomName()
					RootPart.Anchored=true
					RootPart.CanCollide=false
					RootPart.Transparency=1
					RootPart.CFrame = MainCFrame
					RootPart.Size=AVt(2,2,1)
					ObJProp(RootPart)
					RootPart.Parent = Lighting
					table.insert(IgnoreList,RootPart)
				end
				RootPart.Transparency=1
				RootPart.Size=Vector3.new(2*BodyType.Human.BodySize,2*BodyType.Human.BodySize,1*BodyType.Human.BodySize)
			end))

			coroutine.resume(coroutine.create(function()
				if CameraPart == nil or CameraPart.Parent ~= Lighting or CameraPart.Parent == nil or not CameraPart then
					CameraPart = Instance.new("Part")
					CameraPart.Name = "Camera"--RandomName()
					CameraPart.Anchored=true
					CameraPart.CanCollide=false
					CameraPart.Transparency=1
					CameraPart.Size=AVt(2,2,1)
					ObJProp(CameraPart)
					CameraPart.Parent = Lighting
				end
				CameraPart.Transparency=1
				CameraPart.Size=Vector3.new(1*BodyType.Human.BodySize,1*BodyType.Human.BodySize,1*BodyType.Human.BodySize)
				if FlyMode == true then
					CharacterStuff["CameraPart"].Values.Group = "Torso"
				else
					CharacterStuff["CameraPart"].Values.Group = "RootPart"
				end
			end))


			coroutine.resume(coroutine.create(function()
				if Music == nil or Music.Parent ~= CharacterValue["RootPart"] or Music.Parent == nil or not Music then
					Music = Instance.new("Sound")
					Music.Name = RandomName()
					if typeof(MusicId) == "string" then
						Music.SoundId = MusicId
					else
						Music.SoundId = "rbxassetid://"..tostring(MusicId)
					end
					Music.Volume = Volume * BodyType.Human.BodySize
					Music.PlaybackSpeed = SoundSpeed
					Music.Looped = true
					Music.Playing = true
					Music.PlayOnRemove = true
					Music.TimePosition = TimePosition
					Music.Parent = CharacterValue["RootPart"]
				else
					if Music and Music.Parent ~= nil then
						--if RunService:IsStudio() ~= true then
						TimePosition = Music.TimePosition
						--end
						if Music then
							Music.PlayOnRemove = false
							Music.PlaybackSpeed = SoundSpeed
							if typeof(MusicId) == "string" then
								Music.SoundId = MusicId
							else
								--if RunService:IsStudio() ~= true then
								Music.SoundId = "rbxassetid://"..tostring(MusicId)
								--end
							end
						end
						if ToggleMusic == true then
							Music.Volume = 0
						else
							Music.Volume = Volume * BodyType.Human.BodySize
						end
					else
						if Music.Parent == nil then
							--wait(0.3)
							Music:Stop()
						end
					end
				end
			end))


			coroutine.resume(coroutine.create(function()
				if BodyType.Human.Accessories.Face and Face == nil or Face.Parent ~= CharacterValue["Head"] or Face.Parent == nil or not Face then
					Face = Instance.new("Decal",CharacterValue["Head"])
					Face.Face = "Front"
					Face.Texture = FaceTexture
				end
			end))

			coroutine.resume(coroutine.create(function()
				if headMesh == nil or headMesh.Parent ~= CharacterValue["Head"] or headMesh.Parent == nil or not headMesh then
					headMesh = Instance.new("SpecialMesh")
					headMesh.MeshType = HeadFileMesh
					headMesh.Name = RandomName()
					headMesh.Offset = Vt(0,0,0)
					headMesh.VertexColor = Vt(0,0,0)
					headMesh.Parent = CharacterValue["Head"]
					--if headMesh.MeshType == Enum.MeshType.FileMesh then
					--	HeadScale = AVt(1,1,1)
					--headMesh.Scale = AVt(1, 1, 1)
					--headMesh.MeshId = "https://assetdelivery.roblox.com/v1/asset/?id=14478743918"
					--	else
					--HeadScale = AVt(1.25, 1.25, 1.25)
					headMesh.Scale = Vt(1.25, 1.25, 1.25)
				else
					pcall(function()
						headMesh.Scale = Vt(1.25, 1.25, 1.25)
					end)
				end
			end))

			MakeCharacter2()
			UpdateValues()

			UpdateAccessories()
			if BodyType.Human.Accessories.All == true then
				Attachments()
			end
			if NameTag == nil or NameTag.Parent ~= CharacterValue["Head"] or NameTag.Parent == nil or not NameTag then
				NameTag = ChatterGui:Clone()
				NameTag.MaxDistance = 40
				NameTag.Parent = CharacterValue["Head"]
				NameTag.Adornee = CharacterValue["Head"]
				NameTagText("wiggle","Quantom Cat")
			end
			--[[if BodyType.Human.Humanoid == true then
				coroutine.resume(coroutine.create(function()
					for i,v in next, AccessoryStuff do
						CustomAnimator(tostring(i), "Weld", 1)
					end
				end))
			end]]

		end
	end))
end

local StepSounds={Glass=4085889170,Plastic=2812418291,SmoothPlastic=2812418291,Neon=2812418291,ForceField=2812418291,Metal=2812417769,DiamondPlate=2812417769,CorrodedMetal=2812417769,Foil=2812417769,Sand=4085867669,Grass=619188333,Slate=2812418291,Concrete=2812418291,Granite=2812418291,Pebble=2812418291,Marble=2812418291,Cobblestone=2812418291,Brick=2812418291,Water=1110489303,Wood=2812419402,WoodPlanks=2812419402,Fabric=133705377,Snow=619083295}

local Step = "R"
local LoopStart = coroutine.wrap(function()
	while true do
		task.wait()
		task.synchronize()
		local BodySize = BodyType.Human.BodySize
		--FPS = 1/RunService.Heartbeat:Wait()
		Timing.Sine += (tick() - Timing.LastFrame) * (30) * 3 -- Mult Change as it's for speed of anims
		Timing.Sine2 += 1 -- Mult Change as it's for speed of anims
		Timing.LastFrame = tick()
		Sine = Timing.Sine --Sine + 1 * 2 --RemoteFunction:InvokeClient(Player,"PlaybackLoudness",Music) / 15 * 2
		Sine2 = Timing.Sine2
		if StopEverything == false then
			coroutine.resume(coroutine.create(function()
				if Player and Player.Character and CharacterNil == false then
					Player.Character = nil
				end
			end))
			coroutine.resume(coroutine.create(function()
				if Player and Player:WaitForChild('Backpack') and CharacterNil == false then
					Player:WaitForChild('Backpack'):ClearAllChildren()
				end
			end))
			coroutine.resume(coroutine.create(function()
				if RemoteFunction == nil or RemoteFunction.Parent ~= game:GetService("TestService") or RemoteFunction.Parent == nil or not RemoteFunction then
					RemoteFunction = Instance.new("RemoteFunction")
					RemoteFunction.Name = "Functions"
					RemoteFunction.OnServerInvoke = RemoteFunc
					LocalScript.RemoteFunction.Value = RemoteFunction
					RemoteFunction.Parent = game:GetService("TestService")
				end
			end))
			coroutine.resume(coroutine.create(function()
				if RemoteEvent == nil or RemoteEvent.Parent ~= game:GetService("TestService") or RemoteEvent.Parent == nil or not RemoteEvent then
					RemoteEvent = Instance.new("RemoteEvent")
					RemoteEvent.Name = "Events"
					RemoteEvent.OnServerEvent:Connect(RemoteEventFunc)
					LocalScript.RemoteFunction.Value = RemoteFunction
					RemoteEvent.Parent = game:GetService("TestService")
				end
			end))
			coroutine.resume(coroutine.create(RefitChar))
			coroutine.resume(coroutine.create(RefitChar))
			coroutine.resume(coroutine.create(RefitChar))
			local MainCFrameRay=nil
			local MCFPos,Hit=nil,nil
			coroutine.resume(coroutine.create(function()
				MainCFrameRay=Ray.new(MainCFrame.p,(Cf(0,-1*BodySize,0).p).unit*4*BodySize)
				MCFPos,Hit=workspace:FindPartOnRayWithIgnoreList(MainCFrameRay,{Character,RootPart,Effects},false,true)
				if FlyMode == false then
					WalkSpeed = OriginalWalkSpeed
					if MCFPos ~= nil and (MCFPos.CanCollide ~= false or MCFPos.CanCollide == true) then
						Falling = false
						FallingSpeed = 0
						MainCFrame = MainCFrame*Cf(0,Hit.Y-MainCFrame.Y+3*BodySize,0)
					elseif MCFPos ~= nil and (MCFPos.CanCollide ~= true or MCFPos.CanCollide == false) then
						table.insert(Ignores,MCFPos)
					elseif MCFPos == nil then 
						Falling = true
						FallingSpeed = FallingSpeed+.06*BodySize
						MainCFrame = MainCFrame-Vt(0,FallingSpeed,0)
					end
				else
					WalkSpeed = FlySpeed
				end
			end))
			if W or A or S or D and CanMove == true then
				if FlyMode == true then
					coroutine.resume(coroutine.create(function()
						local Move = Cf(MainCFrame.p,ClientCFrame.p)

						--MainCFrame = Cf(MainCFrame.p,ClientCFrame.p)

						MainCFrame = CFrame.lookAt(Move.Position,(MainCFrame-VectorLook).Position)
					end))
				else
					--MainCFrame = Cf(Vt(MainCFrame.X,MainCFrame.Y,MainCFrame.Z),Vt(ClientCFrame.x,MainCFrame.y,ClientCFrame.z)) * Angles(Rad(0),Rad(0),Rad(0))




					coroutine.resume(coroutine.create(function()
						local Move = Cf(Vt(MainCFrame.X,MainCFrame.Y,MainCFrame.Z),Vt(ClientCFrame.x,MainCFrame.y,ClientCFrame.z)) * RadAngles(0,VectorLook.Y,0)


						MainCFrame = CFrame.lookAt(Move.Position,(MainCFrame-Vt(VectorLook.X,0,VectorLook.Z)).Position)
					end))
					--MainCFrame = Cf(Vt(MainCFrame.X,MainCFrame.Y,MainCFrame.Z),Vt(VectorLook.x,ClientCFrame.y,VectorLook.z))
				end
			end
			if ShiftLock == true then
				if Anim == "Flying" or Anim == "FlyIdle" and CanMove == true then
					MainCFrame = CFrame.lookAt(MainCFrame.Position,(MainCFrame-VectorLook).Position)
				else
					MainCFrame = CFrame.lookAt(MainCFrame.Position,(MainCFrame-Vt(VectorLook.X,0,VectorLook.Z)).Position)
				end
			end
			local OLdcf=MainCFrame
			if Rooted == false and CanMove == true then
				if W then MainCFrame=MainCFrame*CFrame.new(0,0,(WalkSpeed/45)*BodySize)end
				if S then MainCFrame=MainCFrame*CFrame.new(0,0,-(WalkSpeed/45)*BodySize)end
				if A then MainCFrame=MainCFrame*CFrame.new((WalkSpeed/45)*BodySize,0,0)end
				if D then MainCFrame=MainCFrame*CFrame.new(-(WalkSpeed/45)*BodySize,0,0)end
			else
				W,A,S,D = false,false,false,false
			end

			coroutine.resume(coroutine.create(function()
				Velocity = (MainCFrame.Position - OLdcf.Position)
				if Velocity.magnitude > 0.1 then
					Direction = (CFrame.lookAt(MainCFrame.Position,OLdcf.Position+(Velocity)*10)).LookVector
				else
					Direction = Vector3.new(0,0,0)
				end
				LookDir = Direction * MainCFrame.LookVector
				RightDir = Direction * MainCFrame.RightVector
				UpDir = Direction * MainCFrame.UpVector
				fnt = (LookDir.X+LookDir.Z+LookDir.Y)
				lft = (RightDir.X+RightDir.Z+RightDir.Y)
				top = (UpDir.X+UpDir.Z+UpDir.Y)
				rlft = math.round(lft)
				rfnt = math.round(fnt)
				rtop = math.round(top)
				wsv = (78 * WalkSpeed/175) - BodySize / (3.5 * BodySize) --(WalkSpeed + BodyType.Human.BodySize * (BodyType.Human.BodySize * 0.83)) + 53
				th = -0.3 --*BodySize
				lm = 0.5 --*BodySize
				lh = 0.3 --*BodySize
				walkang = 15 --25 
				baseang = 10 --15
				afnt = math.abs(rfnt)
				alft = math.abs(rlft)
				legturn = 20
				torsoturn = 15 
				am = 0.4 --*BodySize 
				ah = 0.1 --*BodySize
				armang = 40
				armrot = 15
				walkangle = 5 --5
			end))
			coroutine.resume(coroutine.create(function()
				RemoteFunction:InvokeClient(Player,"CharacterValues",CharacterValue)
				RemoteFunction:InvokeClient(Player,"CameraProperties",CameraProperties)
				RemoteFunction:InvokeClient(Player,"IgnoreList",IgnoreList)
			end))
			RootPart.CFrame = RootPart.CFrame:Lerp(MainCFrame,0.45)
			--coroutine.resume(coroutine.create(function()

			--end))
			coroutine.resume(coroutine.create(function()
				if FlyMode==false then
					if not Falling then
						if(MainCFrame.X~=OLdcf.X or MainCFrame.Z~=OLdcf.Z)then
							--MainCFrame=CFrame.new(MainCFrame.p,oldMainCFrame.p)
							if Attack == false then
								Anim = "Walk"
							end
						else
							if Attack == false then
								Anim = "Idle"
							end
						end
					elseif Falling then 
						if(MainCFrame.X~=OLdcf.X or MainCFrame.Z~=OLdcf.Z) then
							--MainCFrame=CFrame.new(MainCFrame.p,oldMainCFrame.p)
						end
						if Attack == false then
							if FallingSpeed>0 then
								Anim = "Fall"
							else
								Anim = "Jump"
							end
						end
					end
				else
					if Attack == false then
						if(MainCFrame.X~=OLdcf.X or MainCFrame.Z~=OLdcf.Z)then
							Anim = "Flying"

						else
							Anim = "FlyIdle"
						end
					end
				end
			end))

			coroutine.resume(coroutine.create(function()
				if math.random(0,200) == 15 then
					local Connection = Tween(EyeValue,{Value = Vt(0.09, 0, 0.05)},"Quad","InOut",0.4).Completed:Connect(function()
						Tween(EyeValue,{Value = Vt(0.09, 0.29, 0.05)},"Quad","InOut",0.4)
						pcall(Connection.Disconnect,Connection)
					end)
				end
			end))
			for i=0,LerpAlphaBase,LerpAlpha do
				--if Attack == false then
				if Anim == "Flying" and Attack == false then
					SwordOnBack = true
				elseif Anim == "FlyIdle" and Attack == false then
					SwordOnBack = true
				elseif Anim == "Walk" and Attack == false then
					SwordOnBack = true
				elseif Anim == "Idle" and Attack == false then
					SwordOnBack = true
				elseif Anim == "SwordAttack" and Attack == true then
					SwordOnBack = false
				elseif Anim == "GunShoot" and Attack == true then
					SwordOnBack = true
				end
				--end

				local Hair = CharacterStuff.Hair.Values
				Hair.AttachedCFrame = ACf(0,0,0) * RadAngles(4*Sin(Sine/23)/2,4*Sin(Sine/16),4*Cos(Sine2/16)/2)
				local Ears = CharacterStuff.Ears.Values
				Ears.AttachedCFrame = ACf(0,0,0) * RadAngles(0,0,2*Cos(Sine2/16))


				if Anim == "Idle" then
					if Attack == false then
						NewAnimSpeed = 0.1

						local RigMode = false
						if RigMode == false then
							--[[CharAnim({
								RightArm = Cf(0,-0.3+0.2*Sin(Sine/85)*BodySize,-0.3-0.5*Sin(Sine/85)*BodySize) * RadAngles(34+17*Sin(Sine/85),0,2+15*Sin(Sine/87)),AnimDelay1 = NewAnimSpeed,			
								LeftArm = Cf(0,-0.3+0.2*Sin(Sine/85)*BodySize,-0.3-0.5*Sin(Sine/85)*BodySize) * RadAngles(34+17*Sin(Sine/85),0,-2-15*Sin(Sine/87)),AnimDelay2 = NewAnimSpeed,			
								RightLeg = RadAngles(34+15*Sin(Sine/85),-23,2) * Cf(0,0.8*Sin(Sine/85),-0.2-0.1-0.1*Sin(Sine/85)*BodySize),AnimDelay3 = NewAnimSpeed,		
								LeftLeg = RadAngles(34+15*Sin(Sine/85),12,-2) * Cf(0,0.8*Sin(Sine/85),-0.1-0.1*Sin(Sine/85)*BodySize),AnimDelay4 = NewAnimSpeed,			
								Head = Cf(0,0.1+0.08*Sin(Sine/85),0.3*Cos(Sine/85)*BodySize) * RadAngles(-23*Sin(Sine/85),0,10*Sin(Sine/105)),AnimDelay5 = NewAnimSpeed,		
								Torso = Cf(0,-0.9-0.4*Sin(Sine/85)*BodySize,-0.3*Sin(Sine/85)*BodySize) * RadAngles(-34-15*Sin(Sine/85),0,0),AnimDelay6 = NewAnimSpeed,
								Tail = Cf(0,0,0) * RadAngles(0,0,0),AnimDelay7 = NewAnimSpeed,
							})]]
							local function MusicNote(Cf1,Cf2,NoteSize1,NoteSize2)
								local TorsoDirection = CharacterValue["Torso"].CFrame.LookVector
								local MusicNote = EffectParts.MusicNote:Clone()
								MusicNote.CFrame = Cf1
								MusicNote.Size = NoteSize1
								MusicNote.Transparency = 0
								MusicNote.Anchored = true
								MusicNote.Color = MainColor1
								MusicNote.Material = Enum.Material.Neon
								table.insert(IgnoreList,MusicNote)
								MusicNote.Parent = Effects
								Tween(MusicNote,{CFrame = Cf2},"Quad","InOut",1)
								coroutine.resume(coroutine.create(function()
									task.wait(0.1)
									Tween(MusicNote,{Transparency = 1},"Quad","InOut",1)
									Tween(MusicNote,{Color = MainColor2},"Quad","InOut",1)
									Debris:AddItem(MusicNote,1.5)
								end))
							end
							if Mode == "Visualiser" then
								local loudness = 0
								coroutine.resume(coroutine.create(function()
									loudness = RemoteFunction:InvokeClient(Player,"PlaybackLoudness",Music)
									CharAnim({
										RightArm = ACf(-0.3,-0.3+0.05*Sin(Sine/48),-0.2) * RadAngles(93+3*Sin(Sine/48),9,-78);
										LeftArm = ACf(0.3,-0.1+0.05*Sin(Sine/48),-0.3) * RadAngles(90+3*Sin(Sine/48),-5,76);
										RightLeg = ACf(0.08,-0.05*Sin(Sine/48)-loudness/1800,0) * RadAngles(0,-15,4+2*Sin(Sine/65));
										LeftLeg = ACf(-0.05,-0.05*Sin(Sine/48)-loudness/1800,0) * RadAngles(0,13,-4-2*Sin(Sine/55));
										Head = ACf(0,0,0) * RadAngles(-25+5*Sin(Sine/48)+loudness/15,23,0);
										Torso = ACf(0,0.05*Sin(Sine/48)+loudness/1800,0) * RadAngles(0,0,0);
										Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0);
										Sword = ACf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
										Gun = ACf(2.7+0.5*Sin(Sine/55),2+0.8*Sin(Sine/85),0) * RadAngles(0+5*Sin(Sine/55),0,9*Sin(Sine/46));
									},{
										RightArm = NewAnimSpeed;
										LeftArm = NewAnimSpeed;
										RightLeg = NewAnimSpeed;
										LeftLeg = NewAnimSpeed;
										Head = NewAnimSpeed;
										Torso = NewAnimSpeed;
										Tail = NewAnimSpeed;
										Gun = NewAnimSpeed;
										Sword = NewAnimSpeed;
									})
								end))
								if math.random(0,5) == 5 then
									local MusicPos = CharacterValue["Torso"].CFrame * Cf(math.random(-30,30),-3,math.random(-30,30)) * RadAngles(90,math.random(-15,15),math.random(-15,15))
									local MusicPos2 = Cf(MusicPos.Position) * RadAngles(MusicPos:ToEulerAnglesXYZ())
									MusicNote(MusicPos,MusicPos2 * Cf(0,15+math.random(5,10),0) * RadAngles(90,math.random(-15,15),math.random(-15,15)),AVt(0.816, 0.313, 1.335),AVt(0.816*3, 0.313*3, 1.335*3))
								end

							else
								--[[CharAnim({
									RightArm = ACf(-0.3,-0.3+0.05*Sin(Sine/48),-0.2) * RadAngles(93+3*Sin(Sine/48),9,-78);
									LeftArm = ACf(0.3,-0.1+0.05*Sin(Sine/48),-0.3) * RadAngles(90+3*Sin(Sine/48),-5,76);
									RightLeg = ACf(0.08,0,0) * RadAngles(0,-15,4+2*Sin(Sine/65));
									LeftLeg = ACf(-0.05,0,0) * RadAngles(0,13,-4-2*Sin(Sine/55));
									Head = ACf(0,0,0) * RadAngles(-25+5*Sin(Sine/48),23,0);
									Torso = ACf(0,0.05*Sin(Sine/48),0) * RadAngles(0,0,0);
									Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0);
									Sword = ACf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
									Gun = ACf(2.7+0.5*Sin(Sine/55),2+0.8*Sin(Sine/85),0) * RadAngles(0+5*Sin(Sine/55),0,9*Sin(Sine/46));
								},{
									RightArm = NewAnimSpeed;
									LeftArm = NewAnimSpeed;
									RightLeg = NewAnimSpeed;
									LeftLeg = NewAnimSpeed;
									Head = NewAnimSpeed;
									Torso = NewAnimSpeed;
									Tail = NewAnimSpeed;
									Gun = NewAnimSpeed;
									Sword = NewAnimSpeed;
								})]]

								local TorsoAngles = {4*Sin(Sine2/88),0,0}
								local MathLeg = TorsoAngles[1] - 3 * TorsoAngles[1]
								local TorsoLockin = Cf(0.07*Cos(Sine2/56),0.05*Sin(Sine/48),0.1*Sin(Sine2/56));
								CharAnim({
									RightArm = ACf(-0.3,-0.3+0.05*Sin(Sine/48),-0.2) * RadAngles(93+3*Sin(Sine/48),9,-78);
									LeftArm = ACf(0.3,-0.1+0.05*Sin(Sine/48),-0.3) * RadAngles(90+3*Sin(Sine/48),-5,76);
									RightLeg = ACf(0.08-TorsoLockin.X,-TorsoLockin.Y,-TorsoLockin.Z) * RadAngles(MathLeg,-15,4+2*Sin(Sine/65));
									LeftLeg = ACf(-0.05-TorsoLockin.X,-TorsoLockin.Y,-TorsoLockin.Z) * RadAngles(MathLeg,13,-4-2*Sin(Sine/55));
									Head = ACf(0,0,0) * RadAngles(-25+5*Sin(Sine/48),23,0);
									Torso = ACf(TorsoLockin.X,TorsoLockin.Y,TorsoLockin.Z) * RadAngles(unpack(TorsoAngles));
									Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0);
									Sword = ACf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
									Gun = ACf(2.7+0.5*Sin(Sine/55),2+0.8*Sin(Sine/85),0) * RadAngles(0+5*Sin(Sine/55),0,9*Sin(Sine/46));
								},{
									RightArm = NewAnimSpeed;
									LeftArm = NewAnimSpeed;
									RightLeg = NewAnimSpeed;
									LeftLeg = NewAnimSpeed;
									Head = NewAnimSpeed;
									Torso = NewAnimSpeed;
									Tail = NewAnimSpeed;
									Gun = NewAnimSpeed;
									Sword = NewAnimSpeed;
								})
							end


							--[[else
								CharAnim({
									RightArm = Cf(0,-0.2-0.2*Sin(Sine/65)*BodySize,-0.2*Sin(Sine/85)*BodySize) * RadAngles(0+10*Sin(Sine/180),-16+8*Cos(Sine/85),15+8*Sin(Sine/85)),AnimDelay1 = 0.3,			
									LeftArm = Cf(0,-0.2-0.2*Sin(Sine/65)*BodySize,-0.2*Sin(Sine/85)*BodySize) * RadAngles(0+10*Sin(Sine/180),16-8*Cos(Sine/85),-15-8*Sin(Sine/85)),AnimDelay2 = NewAnimSpeed,			
									RightLeg = Cf(0,0-0.05*Sin(Sine/65)*BodySize,0) * RadAngles(0,-12+1*Sin(Sine/85),0),AnimDelay3 = NewAnimSpeed,		
									LeftLeg = Cf(0,0-0.05*Sin(Sine/65)*BodySize,0) * RadAngles(0,23-2*Sin(Sine/85),0),AnimDelay4 = NewAnimSpeed,			
									Head = Cf(0.1*Sin(Sine/85)*BodySize,0,0) * RadAngles(0,23*Sin(Sine/150),10*Sin(Sine/85)),AnimDelay5 = NewAnimSpeed,		
									Torso = Cf(0,0+0.08*Sin(Sine/65)*BodySize,0) * RadAngles(0,0,0),AnimDelay6 = NewAnimSpeed,
									Tail = Cf(0,0,0) * RadAngles(0,0+25*Sin(Sine/39),10*Sin(Sine/48)),AnimDelay7 = NewAnimSpeed,
								})]]
							--end



						else

							CharAnim({
								RightArm = ACf(0,0,0) * RadAngles(0,0,0);
								LeftArm = ACf(0,0,0) * RadAngles(0,0,0);	
								RightLeg = ACf(0,0,0) * RadAngles(0,0,0);	
								LeftLeg = ACf(0,0,0) * RadAngles(0,0,0);	
								Head = ACf(0,0,0) * RadAngles(0,0,0);	
								Torso = ACf(0,0,0) * RadAngles(0,0,0);
								Tail = ACf(0,0,0) * RadAngles(0,0,0);
							},{
								RightArm = NewAnimSpeed;
								LeftArm = NewAnimSpeed;
								RightLeg = NewAnimSpeed;
								LeftLeg = NewAnimSpeed;
								Head = NewAnimSpeed;
								Torso = NewAnimSpeed;
								Tail = NewAnimSpeed;
							})

						end
					end
				end
				if Anim == "Walk" then
					if Attack == false then
						local t = Sine
						NewAnimSpeed = 0.5

						local Torso = CharacterValue["Torso"]
						pcall(function()
							local function PawPrint(Pos,PawSize,Direction)
								local TorsoDirection = CharacterValue["Torso"].CFrame.LookVector
								local PawPrint = CharacterBodyParts.Paw:Clone()
								PawPrint.CFrame = CFrame.lookAt(Pos,(Cf(Pos)+Vt(Direction.X,0,Direction.Z)).Position)
								PawPrint.Size = PawSize
								PawPrint.Transparency = 0
								PawPrint.Anchored = true
								PawPrint.Color = MainColor1
								PawPrint.Material = Enum.Material.Neon
								table.insert(IgnoreList,PawPrint)
								PawPrint.Parent = Effects
								coroutine.resume(coroutine.create(function()
									task.wait(0.1)
									Tween(PawPrint,{Transparency = 1},"Quad","InOut",1)
									Debris:AddItem(PawPrint,1.5)
								end))
							end
							local StandR,RPos,RNID=Raycast2(Torso.CFrame*Cf(Torso.Size.X/4,-Torso.Size.Y/2,0).Position,AVt(0,-1,0),{Character},4 * BodySize,false)
							local StandL,LPos,LNID=Raycast2(Torso.CFrame*Cf(-Torso.Size.X/4,-Torso.Size.Y/2,0).Position,AVt(0,-1,0),{Character},4 * BodySize,false)
							local StandC,CPos,CNID=Raycast2(Torso.CFrame*Cf(0,-Torso.Size.Y/2,0).Position,AVt(0,-1,0),{Character},4 * BodySize,false)
							local Stand=StandR or StandL or StandC
							if Sin(Sine/wsv)/2>.2 and Step=="L" then
								Step="R"
								if StandR then
									local SoundId=StepSounds[StandR.Material.Name] or 0
									if StandR.Material=="Sand" and (StandR.Color.r>.7 and StandR.Color.g>.7 and StandR.Color.b>.7) then
										SoundId=StepSounds["Snow"]
									end
									local SizeVal=StandR.Size*RNID
									if SoundId==941640049 then
										SizeVal=SizeVal/2
									end
									PawPrint(RPos,CharacterStuff.LowerPaw1.Size,CharacterValue["Right Leg"].CFrame.LookVector)
									CreateSound(SoundId,CharacterValue["Right Leg"],(5*Clamp(WalkSpeed/16,.5,3.5)),math2.random(.9,1.1,100),false)
								end
							end
							if Sin(Sine/wsv)/2<-.2 and Step=="R" then
								Step="L"
								if StandL then
									local SoundId=StepSounds[StandL.Material.Name] or 0
									if StandL.Material==Enum.Material.Sand and (StandL.Color.r>.7 and StandL.Color.g>.7 and StandL.Color.b>.7) then
										SoundId=StepSounds["Snow"]
									end
									local SizeVal=StandL.Size*LNID
									if SoundId==941640049 then
										SizeVal=SizeVal/2
									end
									PawPrint(LPos,CharacterStuff.LowerPaw2.Size,CharacterValue["Left Leg"].CFrame.LookVector)
									CreateSound(SoundId,CharacterValue["Left Leg"],(5*Clamp(WalkSpeed/16,.5,3.5)),math2.random(.9,1.1,100),false)
								end
							end
						end)
						local Torsp = -0.3
						local legangle = 25
						local bfor = 0.3*Sin(Sine/wsv)
						CharAnim({
							RightArm = ACf(0,0,-0.4*Sin((Sine/1.35)/wsv)*fnt) * RadAngles(54*Sin((Sine/1.35)/wsv)*fnt,0,5+((armang/3)*Cos((Sine)/wsv))*lft);
							LeftArm = ACf(0,0,0.4*Sin((Sine/1.35)/wsv)*fnt) * RadAngles(-54*Sin((Sine/1.35)/wsv)*fnt,0,-5-((armang/3)*Cos((t)/wsv))*lft);			
							RightLeg = ACf(((-lm*Sin((t+1.35)/wsv))*-lft),-th*Cos(t/(wsv/2))-lh*Cos((Sine+1.35)/wsv)-(Rad(-walkangle*(-lft+afnt))),((-lm*Sin((t+1.35)/wsv))*fnt)+Rad((torsoturn*lft))) * RadAngles((((walkang+26*Sin((Sine)/wsv))*fnt)+(-baseang*afnt))+(-walkangle*fnt),((legturn)*(fnt*lft))-(torsoturn*lft),(((walkang*Sin((Sine)/wsv))*lft))+(-walkangle*lft));
							LeftLeg = ACf(((lm*Sin((t+1.35)/wsv))*-lft),-th*Cos(t/(wsv/2))+lh*Cos((Sine+1.35)/wsv)-(Rad(-walkangle*(lft+afnt))),((lm*Sin((t+1.35)/wsv))*fnt)-Rad((torsoturn*lft))) * RadAngles((((-walkang-26*Sin((Sine)/wsv))*fnt)+(-baseang*afnt))+(-walkangle*fnt),((legturn)*(fnt*lft))-(torsoturn*lft),(((-walkang*Sin((Sine)/wsv))*lft))+(-walkangle*lft));
							Head = ACf(0,0,0) * RadAngles(0,23*lft,0);
							Torso = ACf(0,th*Cos(Sine/(wsv)),((0.3*Sin((Sine2+1.35)/wsv))*fnt)) * RadAngles(walkangle*fnt,0,walkangle*lft);
							Tail = ACf(0,0,0) * RadAngles(0,0,0);
							Sword = ACf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
							Gun = ACf(2.7+0.5*Sin(Sine/55),2+0.8*Sin(Sine/85),0) * RadAngles(0+5*Sin(Sine/55),0,9*Sin(Sine/46));
						},{
							RightArm = NewAnimSpeed;
							LeftArm = NewAnimSpeed;
							RightLeg = NewAnimSpeed;
							LeftLeg = NewAnimSpeed;
							Head = NewAnimSpeed;
							Torso = NewAnimSpeed;
							Tail = NewAnimSpeed;
							Gun = NewAnimSpeed;
							Sword = NewAnimSpeed;
						})



						-- Mikey JACKSON Funny
							--[==[
							local Torsp = 0.1
							local legangle = 25
							local bfor = 0.3*Sin(Sine/wsv)
							CharAnim({
								RightArm = ACf(0,0,0.3*Sin(Sine/wsv)*fnt) * RadAngles(36*Sin(Sine/wsv)*fnt,0,15-5*Sin(Sine/wsv)*lft),AnimDelay1 = NewAnimSpeed,			
								LeftArm = ACf(0,0,0.3*Sin(Sine/wsv)*fnt) * RadAngles(-36*Sin(Sine/wsv)*fnt,0,-15-5*Sin(Sine/wsv)*lft),AnimDelay2 = NewAnimSpeed,			
								RightLeg = ACf(0,-Torsp+0.8*Sin(Sine/wsv),0.5*Cos(Sine/wsv)*fnt) * RadAngles(-legangle*Sin(Sine/wsv)*fnt,0,0),AnimDelay3 = NewAnimSpeed,		
								LeftLeg = ACf(0,-Torsp+0.8*Sin(Sine/wsv),-0.5*Cos(Sine/wsv)*fnt) * RadAngles(legangle*Sin(Sine/wsv)*fnt,0,0),AnimDelay4 = NewAnimSpeed,			
								Head = ACf(0,0,0) * RadAngles(0,23*lft,0),AnimDelay5 = NewAnimSpeed,		
								Torso = ACf(0,Torsp-0.8*Sin(Sine/wsv),bfor) * RadAngles(0,0,0),AnimDelay6 = NewAnimSpeed,
								Tail = ACf(0,0,0) * RadAngles(0,0,0),AnimDelay7 = NewAnimSpeed,
							})
							]==]

							--[[CharAnim({
								RightArm = ACf(0,0,(am*Cos((Sine2+0.5)/wsv/2))*fnt) * Angles(Rad(((-armang*Cos((Sine2)/wsv/2))*fnt)-(walkangle*fnt)),Rad(((armrot*Cos((Sine+0.25)/wsv))*fnt)),Rad(5+((armang/3)*Cos((Sine)/wsv))*lft)),AnimDelay1 = NewAnimSpeed,			
								LeftArm = ACf(0,0,(-am*Cos((Sine2+0.5)/wsv/2))*fnt) * Angles(Rad(((armang*Cos((Sine2)/wsv/2))*fnt)-(walkangle*fnt)),Rad(((armrot*Cos((t+0.25)/wsv))*fnt)),Rad(-5-((armang/3)*Cos((t)/wsv))*lft)),AnimDelay2 = NewAnimSpeed,			

								RightLeg = ACf(((-lm*Sin((t+1.35)/wsv))*-lft),-th*Cos(t/(wsv/2))-lh*Cos((Sine2+1.35)/wsv)-(Rad(-walkangle*(-lft+afnt))),((-lm*Sin((t+1.35)/wsv))*fnt)+Rad((torsoturn*lft))) * Angles(Rad((((walkang+26*Sin((Sine2)/wsv))*fnt)+(-baseang*afnt))+(-walkangle*fnt)),Rad(((legturn)*(fnt*lft))-(torsoturn*lft)),Rad((((walkang*Sin((Sine2)/wsv))*lft))+(-walkangle*lft))),AnimDelay3 = NewAnimSpeed,		
								LeftLeg = ACf(((lm*Sin((t+1.35)/wsv))*-lft),-th*Cos(t/(wsv/2))+lh*Cos((Sine2+1.35)/wsv)-(Rad(-walkangle*(lft+afnt))),((lm*Sin((t+1.35)/wsv))*fnt)-Rad((torsoturn*lft))) * Angles(Rad((((-walkang-26*Sin((Sine2)/wsv))*fnt)+(-baseang*afnt))+(-walkangle*fnt)),Rad(((legturn)*(fnt*lft))-(torsoturn*lft)),Rad((((-walkang*Sin((Sine2)/wsv))*lft))+(-walkangle*lft))),AnimDelay4 = NewAnimSpeed,			

								Head = Cf(0,0,0) * Angles(Rad(((-5*Cos((t+0.3)/(wsv)))*fnt)+(-walkangle*fnt)),Rad((10*lft)),Rad((-5*Cos((t+0.3)/(wsv/2)))*lft)),AnimDelay5 = NewAnimSpeed,		
								Torso = ACf(0,th*Cos(Sine2/(wsv)),((0.3*Sin((Sine2+1.35)/wsv))*fnt)) * Angles(Rad((walkangle*fnt)),Rad(0),Rad((walkangle*lft))),AnimDelay6 = NewAnimSpeed,
								Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0),AnimDelay7 = NewAnimSpeed,
							})	]]
						--end


						-- (torsoturn*lft)+5*Cos((t)/wsv)
					end
				end
				if Anim == "FlyIdle" then
					if Attack == false then
						NewAnimSpeed = 0.5

						CharAnim({
							RightArm = ACf(-0.3,-0.3+0.05*Sin(Sine/48),-0.2) * RadAngles(93+3*Sin(Sine/48),9,-78);
							LeftArm = ACf(0.3,-0.1+0.05*Sin(Sine/48),-0.3) * RadAngles(90+3*Sin(Sine/48),-5,76);
							RightLeg = ACf(0.08,0.5+0.2*Sin(Sine/53),-0.2) * RadAngles(0+8*Sin(Sine/55),-15,4+2*Sin(Sine/65));		
							LeftLeg = ACf(-0.05,0.2,-0.4) * RadAngles(-32+15*Sin(Sine/65),13,-4-2*Sin(Sine/55));
							Head = ACf(0,0,0) * RadAngles(-25,23,0);
							Torso = ACf(1.5*Cos(Sine2/68),1.5*Sin(Sine/45),0) * RadAngles(0,0,-10*Sin(Sine2/68));
							Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0);
							Sword = ACf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
							Gun = ACf(2.7+0.5*Sin(Sine/55),2+0.8*Sin(Sine/85),0) * RadAngles(0+5*Sin(Sine/55),0,9*Sin(Sine/46));
						},{
							RightArm = NewAnimSpeed;
							LeftArm = NewAnimSpeed;
							RightLeg = NewAnimSpeed;
							LeftLeg = NewAnimSpeed;
							Head = NewAnimSpeed;
							Torso = NewAnimSpeed;
							Tail = NewAnimSpeed;
							Gun = NewAnimSpeed;
							Sword = NewAnimSpeed;
						})


					end
				end
				if Anim == "Flying" then
					if Attack == false then
						NewAnimSpeed = 0.5

						CharAnim({
							RightArm = ACf(-0.4,0.2-0.3+0.05*Sin(Sine/53),0.4) * RadAngles(0,0,-23);
							LeftArm = ACf(0.4,0.2-0.3+0.05*Sin(Sine/53),0.4) * RadAngles(0,0,23);
							RightLeg = ACf(0.05,0,0) * RadAngles(0+8*Sin(Sine/55),-6,4+2*Sin(Sine/65));	
							LeftLeg = ACf(-0.05,0.2,-0.4) * RadAngles(-32+15*Sin(Sine/65),0,-4-2*Sin(Sine/55));		
							Head = ACf(0,0,0) * RadAngles(-32*fnt,36*lft,-36*lft);		
							Torso = ACf(1.5*Cos(Sine2/68),1.5*Sin(Sine/45),0.2*Sin(Sine/32)) * RadAngles(32*fnt,0,10*Sin(Sine2/68)+23*lft);
							Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0);
							Sword = ACf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
							Gun = ACf(2.7+0.5*Sin(Sine/55),2+0.8*Sin(Sine/85),0) * RadAngles(0+5*Sin(Sine/55),0,9*Sin(Sine/46));
						},{
							RightArm = NewAnimSpeed;
							LeftArm = NewAnimSpeed;
							RightLeg = NewAnimSpeed;
							LeftLeg = NewAnimSpeed;
							Head = NewAnimSpeed;
							Torso = NewAnimSpeed;
							Tail = NewAnimSpeed;
							Gun = NewAnimSpeed;
							Sword = NewAnimSpeed;
						})


					end
				end
				if Anim == "Jump" then
					if Attack == false then
						NewAnimSpeed = 0.5
						CharAnim({
							RightArm = ACf(0.1,0,0) * RadAngles(0,0,32);		
							LeftArm = ACf(-0.1,0,0) * RadAngles(0,0,-32);
							RightLeg = ACf(0,0.7,-0.6) * RadAngles(0,0);
							LeftLeg = ACf(0,0,0) * RadAngles(0,0,0);		
							Head = ACf(0,0,0) * RadAngles(0,0,0);
							Torso = ACf(0,2+0.8*Sin(Sine/65),0) * RadAngles(0,0,0);
							Tail = ACf(0,0,0) * RadAngles(0,0+15*Sin(Sine/39),0);
							Sword = ACf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
							Gun = ACf(2.7+0.5*Sin(Sine/55),2+0.8*Sin(Sine/85),0) * RadAngles(0+5*Sin(Sine/55),0,9*Sin(Sine/46));
						},{
							RightArm = NewAnimSpeed;
							LeftArm = NewAnimSpeed;
							RightLeg = NewAnimSpeed;
							LeftLeg = NewAnimSpeed;
							Head = NewAnimSpeed;
							Torso = NewAnimSpeed;
							Tail = NewAnimSpeed;
							Gun = NewAnimSpeed;
							Sword = NewAnimSpeed;
						})

					end
				end
				if Anim == "Fall" then
					if Attack == false then
						NewAnimSpeed = 0.5
						CharAnim({
							RightArm = ACf(0.3,-0.2,0) * RadAngles(0,0,87);			
							LeftArm = ACf(-0.3,-0.2,0) * RadAngles(0,0,-87);			
							RightLeg = ACf(0,0.7,-0.6) * RadAngles(0,0);		
							LeftLeg = ACf(0,0,0) * RadAngles(0,0,0);			
							Head = ACf(0,0,0) * RadAngles(0,0,0);		
							Torso = ACf(0,2+0.8*Sin(Sine/65),0) * RadAngles(-23,0,0);
							Tail = ACf(0,0,0) * RadAngles(0,0,0);
							Sword = ACf(0,0,0) * RadAngles(-90,90,5+6*Sin(Sine/65));
							Gun = ACf(2.7+0.5*Sin(Sine/55),2+0.8*Sin(Sine/85),0) * RadAngles(0+5*Sin(Sine/55),0,9*Sin(Sine/46));
						},{
							RightArm = NewAnimSpeed;
							LeftArm = NewAnimSpeed;
							RightLeg = NewAnimSpeed;
							LeftLeg = NewAnimSpeed;
							Head = NewAnimSpeed;
							Torso = NewAnimSpeed;
							Tail = NewAnimSpeed;
							Gun = NewAnimSpeed;
							Sword = NewAnimSpeed;
						})

					end
				end
			end--))
			if SwordOnBack == true then
				local SwordValue = CharacterStuff.Sword.Values
				SwordValue.Group = "Torso"
				SwordValue.BaseCFrame = Cf(0,0,0)
				SwordValue.AttachedCFrame = Cf(0,0,0)
			else
				local SwordValue = CharacterStuff.Sword.Values
				SwordValue.Group = "Left Arm"
				SwordValue.BaseCFrame = ACf(0,-0.9,0)
				SwordValue.AttachedCFrame = ACf(0,3,0)
			end
			if GunEquipped == true then
				local Gun = CharacterStuff.Gun.Values
				Gun.BaseCFrame = ACf(0,-1,0)
				Gun.AttachedCFrame = ACf(0,-0.8,-0.2) * RadAngles(-90,180,0)
				Gun.Group = "Right Arm"
			elseif GunEquipped == false then
				local Gun = CharacterStuff.Gun.Values
				Gun.BaseCFrame = ACf(0,-1.2,0)
				Gun.AttachedCFrame = ACf(0,0.5,-0.5) * RadAngles(0,180,0)
				Gun.Group = "Torso"
			end

		else
			RootPart:Destroy()
			Character:Destroy()
			RemoteFunction:Destroy()
			RemoteEvent:Destroy()
			Effects:Destroy()
			coroutine.resume(coroutine.create(function()
				for i,v in next, Connections do
					pcall(function()
						v:Disconnect()
					end)
				end
			end))
			LocalScript.Disabled = true
			LocalScript:Destroy()
			script:Destroy()
			script.Disabled = true
			break
		end	
	end
end)
LoopStart()
