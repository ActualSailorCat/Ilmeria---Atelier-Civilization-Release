--=============================================
-- Ilmeria Lessons by SailorCat
--=============================================
--------------------
-- Table Setup
--------------------
-- All Applicable Buildings
local ilmeriaBuildings = {}
local ilmeriaBuildingQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict IN ('DISTRICT_CAMPUS', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_INDUSTRIAL_ZONE')")
for i, ilBuild in ipairs(ilmeriaBuildingQuery) do
	local ilBuildIndex = GameInfo.Buildings[ilBuild.BuildingType].Index
	ilmeriaBuildings[i] = ilBuildIndex
end

-- Campus Buildings
local ilmeriaCampus = {}
local ilmeriaCampusQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS'")
for i, ilCamp in ipairs(ilmeriaCampusQuery) do
	local ilCampIndex = GameInfo.Buildings[ilCamp.BuildingType].Index
	ilmeriaCampus[i] = ilCampIndex
end

-- Commercial Hub Buildings
local ilmeriaCommHub = {}
local ilmeriaCommQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB'")
for i, ilComm in ipairs(ilmeriaCommQuery) do
	local ilCommIndex = GameInfo.Buildings[ilComm.BuildingType].Index
	ilmeriaCommHub[i] = ilCommIndex
end

-- Industrial Zone Buildings
local ilmeriaIndustrial = {}
local ilmeriaIndustQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE'")
for i, ilIndu in ipairs(ilmeriaIndustQuery) do
	local ilInduIndex = GameInfo.Buildings[ilIndu.BuildingType].Index
	ilmeriaIndustrial[i] = ilInduIndex
end

--------------------
-- Function
--------------------
local ilmeriaMod = (GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier)/100
function Sailor_Ilmeria_Lessons (playerID, cityID, buildingID, ImprovementID, plotID, bCancelled, bOriginalConstruction, iBuildType, iX, iY)
	local bILMERIALeader = false
	local pPlayer = Players[playerID]
	local pPlayerCities = pPlayer:GetCities()
	local pCity = pPlayerCities:FindID(cityID)
	local pOwner = pCity:GetOwner()
	if pOwner ~= -1 then
		local pPlayerConfig = PlayerConfigurations[pOwner]
		local sLeader = pPlayerConfig:GetLeaderTypeName()
		if sLeader == 'LEADER_SAILOR_ILMERIA' then
			bILMERIALeader = true
		end
	end

	if bILMERIALeader == true then
		--//// Gathering buildings...
		local iBuilt = GameInfo.Buildings[buildingID].Index
		for i, iBuild in ipairs(ilmeriaBuildings) do
			if iBuild == GameInfo.Buildings[buildingID].Index then

			--//// Checking for adjacent Atelier...
				local pPlayerCities = pPlayer:GetCities()
				local pCity = pPlayerCities:FindID(cityID)
				local pCityBuildings = pCity:GetBuildings()
				local pPlot = Map.GetPlotByIndex(pCityBuildings:GetBuildingLocation(buildingID))
				local iX, iY = pPlot:GetX(), pPlot:GetY()
				local iNumberofAtelier = 0
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.GetAdjacentPlot(iX, iY, direction)
					if pAdjacentPlot then
						local pAdjImprovement = pAdjacentPlot:GetImprovementType()
						if pAdjImprovement > -1 then
							local pAdjImprovementIndex = GameInfo.Buildings[pAdjImprovement].Index
							local pAdjImprovementType = GameInfo.Improvements[pAdjImprovementIndex].ImprovementType
							if pAdjImprovementType == 'IMPROVEMENT_SAILOR_ATLEER_UI' then
								iNumberofAtelier = iNumberofAtelier + 1
							end
						end
					end
				end
				--//// Time for treats...
				if iNumberofAtelier > 0 then
					local pPoints = pPlayer:GetEra() + 10
					local pGPP = ((pPoints * iNumberofAtelier) * ilmeriaMod)
					local pPlayerGP = pPlayer:GetGreatPeoplePoints()
					-- Campus
					for k, iAlch in ipairs(ilmeriaCampus) do
						if iAlch == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_SCIENTIST"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatScientist]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end
					-- Commercial Hub
					for k, iCoin in ipairs(ilmeriaCommHub) do
						if iCoin == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_MERCHANT"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatMerchant]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end
					-- Industrial Zone
					for k, iSteam in ipairs(ilmeriaIndustrial) do
						if iSteam == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_ENGINEER"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatEngineer]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end
					break
				end
			end
		end
	end
end
--=============================================
-- Leader Present Detection by SeelingCat
--=============================================
local bILMERIAPresent = false

for k, v in ipairs(PlayerManager.GetWasEverAliveIDs()) do
    if bILMERIAPresent == false then
        local sLeaderType = PlayerConfigurations[v]:GetLeaderTypeName()
        if sLeaderType == 'LEADER_SAILOR_ILMERIA' then
			bILMERIAPresent = true
        end
    end
end
if bILMERIAPresent == true then
    print ("///// Ilmeria detected. Loading lua functions...")
	GameEvents.BuildingConstructed.Add(Sailor_Ilmeria_Lessons)
else
    print ("///// Ilmeria not detected.")
end