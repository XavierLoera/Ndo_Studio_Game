local elevating = false
local arrived = false

function getAllParts(obj,dist)
	if #obj:getChildren() > 0 then
		for i, v in pairs(obj:getChildren()) do
			getAllParts(v, dist)
		end
	end
	if obj:IsA("BasePart") then
		delay(0, function()
			local c = obj.CFrame
			if dist>0 then
				obj.Velocity = Vector3.new(0,10.25,0)
				for i = 0, dist, 0.3 do
					obj.CFrame = c+Vector3.new(0,i,0)
					game:getService("RunService").Stepped:wait()
				end
			else
				obj.Velocity = Vector3.new(0,-10,0)
				for i = 0,dist,-0.3 do
					obj.CFrame = c+Vector3.new(0,i,0)
					game:getService("RunService").Stepped:wait()
				end
			end
			arrived = true
			obj.Velocity = Vector3.new(0,0,0)
		end)
	end
end

function openDoors(door)
local opener = script.DoorOpener:Clone()
opener.Disabled = false
opener.Parent = door.Door
end

function elevate(floor)
arrived = false
elevating = true
local dist = floor.Floor.Position.y-script.Parent.Base.Position.y
print(dist)
getAllParts(script.Parent,dist)
repeat wait(1) until arrived
openDoors(script.Parent.Doors)
openDoors(floor.Doors)
delay(5,function() elevating = false end)
end

for i, v in pairs(script.Parent.Buttons:getChildren()) do
v.ClickDetector.MouseClick:connect(function()
if not elevating then
v.Reflectance = 1
local floor =  script.Parent.Parent["Floor " .. v.Name]
elevate(floor)
repeat wait(1) until arrived
v.Reflectance = 0
else
v.BrickColor = BrickColor.new("Bright red")
wait(.25)
v.BrickColor = BrickColor.new("Institutional white")
end
end)
end


for i, v in pairs(script.Parent.Parent:getChildren()) do
if v.Name:sub(1,5) == "Floor" then
v.Button.ClickDetector.MouseClick:connect(function()
if not elevating then
v.Button.Reflectance = 1
local floor = v
elevate(floor)
repeat wait(1) until arrived
v.Button.Reflectance = 0
else
v.Button.BrickColor = BrickColor.new("Bright red")
wait(.25)
v.Button.BrickColor = BrickColor.new("Institutional white")
end
end)
end
end
