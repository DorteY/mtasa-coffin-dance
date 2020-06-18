--//-----------------------------------------------\\
--||   Project      : Coffin Dance
--||   Author       : Lorenzo(DorteY)
--\\-----------------------------------------------//


addEvent("Sync->Coffin->Object",true)
addEventHandler("Sync->Coffin->Object",root,function(Ped)
	SelectedPed=Ped
	if(isElement(theCoffin))then
		destroyElement(theCoffin)
	end
	theCoffin=createObject(2896,871,-1102,25.25)
    setElementCollisionsEnabled(theCoffin,false)
	setElementDoubleSided(theCoffin,true)
	
	removeEventHandler("onClientRender",root,syncCoffigObject)
	addEventHandler("onClientRender",root,syncCoffigObject)
end)

function syncCoffigObject()
	local x,y,z=getElementPosition(theCoffin)
	local sx,sy,sz=getPedBonePosition(SelectedPed,32)
	setElementPosition(theCoffin,x,y,sz+0.38)
end


addEventHandler("onClientPedDamage",root,function()
	if(getElementData(source,"Ped->Damage")==false)then
		cancelEvent()
	end
end)

addEventHandler("onClientResourceStart",root,function()
	TXD=engineLoadTXD("Files/Skins/213.txd")
	engineImportTXD(TXD,213)
	
	DFF=engineLoadDFF("Files/Skins/213.dff")
	engineReplaceModel(DFF,213)
end)