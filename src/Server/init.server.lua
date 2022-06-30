-- Bootstrap.client.lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Glue = require(ReplicatedStorage.Packages.Glue)

local Providers = script
local SharedModules = ReplicatedStorage.Shared
local ServerModules = ServerScriptService.Modules
local Imports = {ServerModules, SharedModules}

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
    print("Server Bootstrap complete.")
end)