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

local RemoteFunction0 = script.RemoteFunction
local RemoteEvent0 = script.RemoteEvent

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

GetMousePosition = function(Range : "10000")
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
