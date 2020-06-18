--//-----------------------------------------------\\
--||   Project      : Coffin Dance
--||   Author       : Lorenzo(DorteY)
--\\-----------------------------------------------//


--X,Y,Z,ROT
local Peds={
	{870.4,-1102.699,24.5,270},
	{871.8,-1102.699,24.5,270},
	{870.4,-1101.299,24.5,270},
	{871.8,-1101.299,24.5,270},
}


addEventHandler("onResourceStart",resourceRoot,function()
	for i,v in pairs(Peds)do
		if(#Peds>=1)then
			Peds[i]=createPed(0,v[1],v[2],v[3],v[4])
			
			setElementData(Peds[i],"Ped->Damage",false)
			
			setTimer(function()
				setPedAnimation(Peds[i],"dancing","dan_left_a",-1,true,false,false)
			end,8000,0)
			
			addEventHandler("onPlayerJoin",root,function()
				for _,v in pairs(getElementsByType("player"))do
					triggerClientEvent(v,"Sync->Coffin->Object",v,Peds[i])
				end
			end)
			
			setTimer(function()
				for _,v in pairs(getElementsByType("player"))do
					triggerClientEvent(v,"Sync->Coffin->Object",v,Peds[i])
				end
			end,1000,1)
		end
	end
end)