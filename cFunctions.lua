--//-----------------------------------------------\\
--||   Project      : Coffin Dance
--||   Author       : Lorenzo(DorteY)
--\\-----------------------------------------------//


local CoffinTable={
	ObjectID=2896,
	
	CoffinX=871,
	CoffinY=-1102,
	CoffinZ=25.25,
	
	Path={
		Music=":"..getResourceName(getThisResource()).."/Files/Sounds/Music.mp3",
		TXD=":"..getResourceName(getThisResource()).."/Files/Skins/213.txd",
		DFF=":"..getResourceName(getThisResource()).."/Files/Skins/213.dff",
	}
}

addEvent("Sync->Coffin->Stuff",true)
addEventHandler("Sync->Coffin->Stuff",root,function(Ped)
	SelectedPed=Ped
	
	if(isElement(Coffin))then
		destroyElement(Coffin)
	end
	if(isElement(CoffinSound))then
		destroyElement(CoffinSound)
	end
	
	Coffin=createObject(CoffinTable.ObjectID,CoffinTable.CoffinX,CoffinTable.CoffinY,CoffinTable.CoffinZ)
	setElementCollisionsEnabled(Coffin,false)
	setElementDoubleSided(Coffin,true)
	
	if(fileExists(CoffinTable.Path.Music))then
		CoffinSound=playSound3D(CoffinTable.Path.Music,CoffinTable.CoffinX,CoffinTable.CoffinY,CoffinTable.CoffinZ,true)
		setSoundMaxDistance(CoffinSound,tonumber(20))
	end
	
	removeEventHandler("onClientRender",root,syncCoffinObject)
	addEventHandler("onClientRender",root,syncCoffinObject)
end)

function syncCoffinObject()
	if(isElement(SelectedPed)and isElement(Coffin))then
		local x,y,z=getElementPosition(Coffin)
		local sx,sy,sz=getPedBonePosition(SelectedPed,32)
		
		if(x and y and z and sz)then
			setElementPosition(Coffin,x,y,sz+0.38)
		end
	end
end


addEventHandler("onClientPedDamage",root,function()
	if(getElementData(source,"Ped->Damage")==false)then
		cancelEvent()
	end
end)

addEventHandler("onClientResourceStart",root,function()
	if(fileExists(CoffinTable.Path.TXD))then
		TXD=engineLoadTXD(CoffinTable.Path.TXD)
		engineImportTXD(TXD,213)
	end
	
	if(fileExists(CoffinTable.Path.DFF))then
		DFF=engineLoadDFF(CoffinTable.Path.DFF)
		engineReplaceModel(DFF,213)
	end
end)