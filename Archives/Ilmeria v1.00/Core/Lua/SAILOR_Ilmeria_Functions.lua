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

--[[ Encampment Buildings
local ilmeriaEncampment = {}
local ilmeriaEncampmentQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_ENCAMPMENT'")
for i, ilEncamp in ipairs(ilmeriaEncampmentQuery) do
	local ilEncampIndex = GameInfo.Buildings[ilEncamp.BuildingType].Index
	ilmeriaEncampment[i] = ilEncampIndex
end

Holy Site Buildings
local ilmeriaHoly = {}
local ilmeriaHolyQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE'")
for i, ilHoly in ipairs(ilmeriaHolyQuery) do
	local ilHolyIndex = GameInfo.Buildings[ilHoly.BuildingType].Index
	ilmeriaHoly[i] = ilHolyIndex
end]]--

-- Commercial Hub Buildings
local ilmeriaCommHub = {}
local ilmeriaCommQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB'")
for i, ilComm in ipairs(ilmeriaCommQuery) do
	local ilCommIndex = GameInfo.Buildings[ilComm.BuildingType].Index
	ilmeriaCommHub[i] = ilCommIndex
end

--[[ Harbor Buildings
local ilmeriaHarbor = {}
local ilmeriaHarborQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HARBOR'")
for i, ilHarb in ipairs(ilmeriaHarborQuery) do
	local ilHarbIndex = GameInfo.Buildings[ilHarb.BuildingType].Index
	ilmeriaHarbor[i] = ilHarbIndex
end]]--

-- Industrial Zone Buildings
local ilmeriaIndustrial = {}
local ilmeriaIndustQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE'")
for i, ilIndu in ipairs(ilmeriaIndustQuery) do
	local ilInduIndex = GameInfo.Buildings[ilIndu.BuildingType].Index
	ilmeriaIndustrial[i] = ilInduIndex
end

--[[ Theater Buildings
local ilmeriaTheater = {}
local ilmeriaTheaterQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER'")
for i, ilThea in ipairs(ilmeriaTheaterQuery) do
	local ilTheaIndex = GameInfo.Buildings[ilThea.BuildingType].Index
	ilmeriaTheater[i] = ilTheaIndex
end]]--

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
		print("ILMERIA ACTIVATED")
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
					print(iNumberofAtelier, "Ateliers detected.")
					local pPoints = math.floor((pPlayer:GetEra()+5)*1.5)
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
					--[[ Encampment
					for k, iEncamp in ipairs(ilmeriaEncampment) do
						if iEncamp == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_GENERAL"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatGeneral]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end
					Holy Site
					for k, iThou in ipairs(ilmeriaHoly) do
						if iThou == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_PROPHET"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatProphet]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end]]--
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
					--[[ Harbor
					for k, iShip in ipairs(ilmeriaHarbor) do
						if iShip == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_ADMIRAL"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatAdmiral]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end]]--
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
					--[[ Theater
					for k, iCurtain in ipairs(ilmeriaTheater) do
						if iCurtain == GameInfo.Buildings[buildingID].Index then
							local iGPerson1 = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_WRITER"].Index
							local iGPerson2 = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_ARTIST"].Index
							local iGPerson3 = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_MUSICIAN"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatArtist]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatWriter]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatMusician]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end]]--
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