-- Bootstrap.client.lua

local StarterPlayer = game:GetService("StarterPlayer")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Glue = require(ReplicatedStorage.Packages.Glue)

local Providers = script
local ClientModules = StarterPlayer.Modules
local SharedModules = ReplicatedStorage.Shared
local Imports = {ClientModules, SharedModules}

local function requireProviders(Directory: Instance)
    for _, descendant in ipairs(Directory:GetDescendants()) do
        if (descendant:IsA("ModuleScript")) then
            require(descendant)
        end
    end
end

Glue.Imports(Imports)
requireProviders(Providers)

Glue.Stick():andThen(function()
    print("Client Bootstrap complete.")
end)