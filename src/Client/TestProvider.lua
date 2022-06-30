local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Glue = require(ReplicatedStorage.Packages.Glue)

local TestProvider = { Name = "TestProvider" }

function TestProvider:onCreate()
    print("TestProvider created.")
end

function TestProvider:onStart()
    print("TestProvider started.")
end

return Glue.Provider(TestProvider)