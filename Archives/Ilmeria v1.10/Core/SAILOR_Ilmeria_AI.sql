--=============================================
-- Ilmeria / AI
--=============================================
-----------------------------------------------	
-- AiListTypes
-----------------------------------------------	
INSERT INTO AiListTypes	
		(ListType)
VALUES	('SAILOR_ILMERIA_Civics'),
		('SAILOR_ILMERIA_Techs'),
		('SAILOR_ILMERIA_Buildings'),
		('SAILOR_ILMERIA_Districts'),
		('SAILOR_ILMERIA_Improvements'),
		('SAILOR_ILMERIA_PseudoYields'),
		('SAILOR_ILMERIA_Yields'),
		('SAILOR_ILMERIA_Units'),
		('SAILOR_ILMERIA_Settle'),
		('SAILOR_ILMERIA_Alliances'),
		('SAILOR_ILMERIA_Diploaction'),
		('SAILOR_ILMERIA_Discussions'),
		('SAILOR_ILMERIA_Resolutions');

-----------------------------------------------	
-- AiLists
-----------------------------------------------	
INSERT INTO AiLists	
		(ListType,							AgendaType,							System)
VALUES	('SAILOR_ILMERIA_Civics',			'TRAIT_AGENDA_SAILOR_ILMERIA',		'Civics'),
		('SAILOR_ILMERIA_Techs',			'TRAIT_AGENDA_SAILOR_ILMERIA',		'Technologies'),
		('SAILOR_ILMERIA_Buildings',		'TRAIT_AGENDA_SAILOR_ILMERIA',		'Buildings'),
		('SAILOR_ILMERIA_Districts',		'TRAIT_AGENDA_SAILOR_ILMERIA',		'Districts'),
		('SAILOR_ILMERIA_Improvements',		'TRAIT_AGENDA_SAILOR_ILMERIA',		'Improvements'),
		('SAILOR_ILMERIA_PseudoYields',		'TRAIT_AGENDA_SAILOR_ILMERIA',		'PseudoYields'),
		('SAILOR_ILMERIA_Yields',			'TRAIT_AGENDA_SAILOR_ILMERIA',		'Yields'),
		('SAILOR_ILMERIA_Units',			'TRAIT_AGENDA_SAILOR_ILMERIA',		'Units'),
		('SAILOR_ILMERIA_Settle',			'TRAIT_AGENDA_SAILOR_ILMERIA',		'Settle'),
		('SAILOR_ILMERIA_Alliances',		'TRAIT_AGENDA_SAILOR_ILMERIA',		'Alliances'),
		('SAILOR_ILMERIA_Diploaction',		'TRAIT_AGENDA_SAILOR_ILMERIA',		'DiplomaticActions'),
		('SAILOR_ILMERIA_Discussions',		'TRAIT_AGENDA_SAILOR_ILMERIA',		'Discussions'),
		('SAILOR_ILMERIA_Resolutions',		'TRAIT_AGENDA_SAILOR_ILMERIA',		'Resolutions');

-----------------------------------------------	
-- AiFavoredItems
-----------------------------------------------
INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Item,								Value)
VALUES	
-- YIELDS
		('SAILOR_ILMERIA_Yields',			1,			'YIELD_FOOD',						0),		
		('SAILOR_ILMERIA_Yields',			1,			'YIELD_SCIENCE',					0),		
-- PSEUDOYIELDS
		('SAILOR_ILMERIA_PseudoYields',		1,			'PSEUDOYIELD_GPP_SCIENTIST',		25),
		('SAILOR_ILMERIA_PseudoYields',		1,			'PSEUDOYIELD_GPP_ENGINEER',			25),
		('SAILOR_ILMERIA_PseudoYields',		1,			'PSEUDOYIELD_GPP_MERCHANT',			25),
		('SAILOR_ILMERIA_PseudoYields',		1,			'PSEUDOYIELD_SPACE_RACE',			0),
		('SAILOR_ILMERIA_PseudoYields',		1,			'PSEUDOYIELD_TECHNOLOGY',			0),
-- UNITS
		('SAILOR_ILMERIA_Units',			1,			'UNIT_SAILOR_ATLEER_UU',			30),
		('SAILOR_ILMERIA_Units',			1,			'UNIT_RANGER',						-200),
-- BUILDINGS & DISTRICTS
		('SAILOR_ILMERIA_Districts',		1,			'DISTRICT_COMMERCIAL_HUB',			25),				
		('SAILOR_ILMERIA_Districts',		1,			'DISTRICT_CAMPUS',					25),	
		('SAILOR_ILMERIA_Districts',		1,			'DISTRICT_INDUSTRIAL_ZONE',			25),	
-- IMPROVEMENTS
		('SAILOR_ILMERIA_Improvements',		1,			'IMPROVEMENT_SAILOR_ATLEER_UI',		50),
-- WONDERS
		('SAILOR_ILMERIA_Buildings',		1,			'BUILDING_BIG_BEN',					0),
		('SAILOR_ILMERIA_Buildings',		1,			'BUILDING_GREAT_LIBRARY',			0),
		('SAILOR_ILMERIA_Buildings',		1,			'BUILDING_GREAT_ZIMBABWE',			0),
		('SAILOR_ILMERIA_Buildings',		1,			'BUILDING_OXFORD_UNIVERSITY',		0),
		('SAILOR_ILMERIA_Buildings',		1,			'BUILDING_RUHR_VALLEY',				0),
-- CIVICS & TECHS
		('SAILOR_ILMERIA_Civics',			1,			'CIVIC_CRAFTSMANSHIP',				0), 
		('SAILOR_ILMERIA_Civics',			1,			'CIVIC_RECORDED_HISTORY',			0), 
		('SAILOR_ILMERIA_Civics',			1,			'CIVIC_GUILDS',						0), 
		('SAILOR_ILMERIA_Civics',			1,			'CIVIC_THE_ENLIGHTENMENT',			0), 
		('SAILOR_ILMERIA_Techs',			1,			'TECH_WRITING',						0), 
		('SAILOR_ILMERIA_Techs',			1,			'TECH_CURRENCY',					0), 
		('SAILOR_ILMERIA_Techs',			1,			'TECH_MATHEMATICS',					0),
		('SAILOR_ILMERIA_Techs',			1,			'TECH_EDUCATION',					0),
		('SAILOR_ILMERIA_Techs',			1,			'TECH_SCIENTIFIC_THEORY',			0),
		('SAILOR_ILMERIA_Techs',			1,			'TECH_ECONOMICS',					0),
		('SAILOR_ILMERIA_Techs',			1,			'TECH_CHEMISTRY',					0),
-- ALLIANCES
		('SAILOR_ILMERIA_Alliances',		1,			'ALLIANCE_RESEARCH',				0),
		('SAILOR_ILMERIA_Alliances',		1,			'ALLIANCE_ECONOMIC',				0),
-- DIPLOACTION
		('SAILOR_ILMERIA_Diploaction',		1,			'DIPLOACTION_ALLIANCE_RESEARCH',	0),
		('SAILOR_ILMERIA_Diploaction',		1,			'DIPLOACTION_ALLIANCE_ECONOMIC',	0),
-- DISCUSSIONS
		('SAILOR_ILMERIA_Discussions',		0,			'WC_EMERGENCY_MILITARY',			0),
		('SAILOR_ILMERIA_Discussions',		1,			'WC_EMERGENCY_CITY_STATE',			0),
		('SAILOR_ILMERIA_Discussions',		1,			'WC_EMERGENCY_NOBEL_PRIZE_PHYSICS',	0),
		('SAILOR_ILMERIA_Discussions',		1,			'WC_EMERGENCY_CLIMATE_ACCORDS',		0),
		('SAILOR_ILMERIA_Discussions',		1,			'WC_EMERGENCY_WORLD_FAIR',			0),
		('SAILOR_ILMERIA_Discussions',		1,			'WC_EMERGENCY_SPACE_STATION',		0),
		('SAILOR_ILMERIA_Discussions',		0,			'WC_EMERGENCY_RELIGIOUS',			0),
		('SAILOR_ILMERIA_Discussions',		0,			'WC_EMERGENCY_BACKSTAB',			0),
		('SAILOR_ILMERIA_Discussions',		0,			'WC_EMERGENCY_REQUEST_AID',			0),
		('SAILOR_ILMERIA_Discussions',		0,			'WC_EMERGENCY_NUCLEAR',				0),
		('SAILOR_ILMERIA_Discussions',		0,			'WC_EMERGENCY_WORLD_GAMES',			0),
-- RESOLUTIONS
		('SAILOR_ILMERIA_Resolutions',		1,			'WC_RES_LUXURY',					0),
		('SAILOR_ILMERIA_Resolutions',		1,			'WC_RES_PATRONAGE',					0);
-- SETTLE
INSERT INTO AiFavoredItems
		(ListType,					Item,				Favored,		StringVal,					Value)
VALUES  ('SAILOR_ILMERIA_Settle',	'Resource Class',	1,				'RESOURCECLASS_BONUS',		50),
		('SAILOR_ILMERIA_Settle',	'Resource Class',	1,				'RESOURCECLASS_STRATEGIC',	50),
		('SAILOR_ILMERIA_Settle',	'Resource Class',	1,				'RESOURCECLASS_LUXURY',		50);
-- UNITS
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item,				Value)
SELECT	'SAILOR_ILMERIA_Units',			1,			'UNIT_SKIRMISHER',	-200
FROM Units WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SKIRMISHER');
-- BUILDINGS
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item,				Value)
SELECT	'SAILOR_ILMERIA_Buildings',		1,			BuildingType,		25
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS';

INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item,				Value)
SELECT	'SAILOR_ILMERIA_Buildings',		1,			BuildingType,		25
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB';

INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item,				Value)
SELECT	'SAILOR_ILMERIA_Buildings',		1,			BuildingType,		25
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE';
-- WONDERS
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item,									Value)
SELECT	'SAILOR_ILMERIA_Buildings',		1,			'BUILDING_HALICARNASSUS_MAUSOLEUM',		0
FROM Buildings WHERE EXISTS (SELECT 1 FROM Buildings WHERE BuildingType = 'BUILDING_HALICARNASSUS_MAUSOLEUM');