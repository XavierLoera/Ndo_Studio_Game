local door = script.Parent
local door1 = door.Door1 
local door2 = door.Door2 
local ret1 = door1.CFrame 
local ret2 = door2.CFrame 
local spd = script.Parent.Parent.Speed.Value
for i = 1, 58/(10*spd) do 
wait() 
door1.CFrame = door1.CFrame+spd*door1.CFrame.lookVector 
door2.CFrame = door2.CFrame-spd*door1.CFrame.lookVector 
end 
wait(3)
for i = 1, 58/(15*spd) do
wait()
door1.CFrame = door1.CFrame-spd*door1.CFrame.lookVector
door2.CFrame = door2.CFrame+spd*door1.CFrame.lookVector 
end 
game:getService("Debris"):AddItem(script,0.1)
door2.CFrame = ret2
door1.CFrame = ret1 

