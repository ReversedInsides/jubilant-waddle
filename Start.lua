local Player = game.Players.jh0nd0eone

local HttpService = game:GetService("HttpService")

local getfenv = getfenv;
local setfenv = setfenv;
local Sandbox = getfenv(0)

local Git = "https://raw.githubusercontent.com/ReversedInsides/jubilant-waddle/main"
local MainScriptSource = HttpService:GetAsync(Git.."/MainScript.lua")

local Accessories = Instance.new("Folder")
Accessories.Name = "Accessories"
Accessories.Parent = script

local RemoteEvent = Instance.new("ObjectValue")
RemoteEvent.Name = "RemoteEvent"

local RemoteFunction = Instance.new("ObjectValue")
RemoteFunction.Name = "RemoteFunction"

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

local EffectParts = require(17824908373):Clone()
local Stuff = require(17824903531):Clone()
local CamShake = require(17824980593):Clone()
local LBolt = require(17824996942):Clone()

local script = setmetatable({
	EffectParts = EffectParts,
	Stuff = Stuff,
	CamShake = CamShake,
	LBolt = LBolt
}, {
	__index = script
})
Sandbox.owner = Player
Sandbox.script = script

setfenv(1,Sandbox)

loadstring(MainScriptSource)()
