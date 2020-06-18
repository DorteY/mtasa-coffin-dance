--//-----------------------------------------------\\
--||   Project      : Coffin Dance
--||   Author       : Lorenzo(DorteY)
--\\-----------------------------------------------//


local CoffinX,CoffinY,CoffinZ=871,-1102,25.25

addEvent("Sync->Coffin->Object",true)
addEventHandler("Sync->Coffin->Object",root,function(Ped)
	SelectedPed=Ped
	if(isElement(Coffin))then
		destroyElement(Coffin)
	end
	Coffin=createObject(2896,CoffinX,CoffinY,CoffinZ)
	setElementCollisionsEnabled(Coffin,false)
	setElementDoubleSided(Coffin,true)
	
	removeEventHandler("onClientRender",root,syncCoffinObject)
	addEventHandler("onClientRender",root,syncCoffinObject)
	
	if(isElement(CoffinSound))then
		destroyElement(CoffinSound)
	end
	CoffinSound=playSound3D(":"..getResourceName(getThisResource()).."/Files/Sounds/Music.mp3",CoffinX,CoffinY,CoffinZ,true)
	setSoundMaxDistance(CoffinSound,tonumber(20))
end)

function syncCoffinObject()
	local x,y,z=getElementPosition(Coffin)
	local sx,sy,sz=getPedBonePosition(SelectedPed,32)
	setElementPosition(Coffin,x,y,sz+0.38)
end


addEventHandler("onClientPedDamage",root,function()
	if(getElementData(source,"Ped->Damage")==false)then
		cancelEvent()
	end
end)

addEventHandler("onClientResourceStart",root,function()
	TXD=engineLoadTXD(":"..getResourceName(getThisResource()).."/Files/Skins/213.txd")
	engineImportTXD(TXD,213)
	
	DFF=engineLoadDFF(":"..getResourceName(getThisResource()).."/Files/Skins/213.dff")
	engineReplaceModel(DFF,213)
end)