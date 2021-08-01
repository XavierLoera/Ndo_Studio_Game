local inputservice = game:GetService("UserInputService")

inputservice.InputBegan:connect(function(i,g)
	if i.UserInputType == Enum.UserInputType.Keyboard then
		if i.KeyCode == Enum.KeyCode.E then
			for _,Door in pairs(workspace.Doors:GetChildren()) do
			Door.Event:FireServer()
			break
		end
	end
		end
end)



while wait() do
    script.Parent.ImageLabel.Visible = false 
    for i,v in pairs(game.Workspace.Doors:GetChildren()) do 
        local mag = (v.Center.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude 
        if mag <= 10 then 
            local WSP = game.Workspace.CurrentCamera:WorldToScreenPoint(v.Center.Position) 
            script.Parent.ImageLabel.Visible = true
            script.Parent.ImageLabel.Position = UDim2.new(0,WSP.X,0,WSP.Y)
        end
    end
end