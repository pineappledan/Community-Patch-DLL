-- America -- MOMA

UPDATE Traits
SET BuyOwnedTiles = '1'
WHERE Type = 'TRAIT_RIVER_EXPANSION';

UPDATE Traits
SET PlotBuyCostModifier = '-25'
WHERE Type = 'TRAIT_RIVER_EXPANSION';

INSERT INTO BuildingClasses 	
			(Type,										Description,							DefaultBuilding,						MaxPlayerInstances)
VALUES		('BUILDINGCLASS_AMERICA_SMITHSONIAN',		'TXT_KEY_BUILDING_MOMA', 				'BUILDING_AMERICA_SMITHSONIAN',			1),
			('BUILDINGCLASS_AMERICA_WESTPOINT',			'TXT_KEY_BUILDING_AMERICA_WESTPOINT',	'BUILDING_AMERICA_WESTPOINT',			1),
			('BUILDINGCLASS_AMERICA_HOOVERDAM',			'TXT_KEY_BUILDING_AMERICA_HOOVERDAM',	'BUILDING_AMERICA_HOOVERDAM',			1);

INSERT INTO Buildings 	
			(Type,									Help,												ThemingBonusHelp, 								Description,									Civilopedia,										Strategy,												PolicyCostModifier, BuildingClass, 				Cost, 	CultureRateModifier, 	GreatWorkSlotType, 				GreatWorkCount, NeverCapture, 	PrereqTech, 			ArtDefineTag, 							MinAreaSize, 	ConquestProb, 	HurryCostModifier, 	NationalPopRequired, 	NumCityCostMod, NukeImmune, IconAtlas,				PortraitIndex)
VALUES		('BUILDING_AMERICA_INDEPENDENCEHALL',	'TXT_KEY_BUILDING_AMERICA_INDEPENDENCEHALL_HELP',	'TXT_KEY_THEMING_BONUS_INDEPENDENCEHALL_HELP', 	'TXT_KEY_BUILDING_AMERICA_INDEPENDENCEHALL', 	'TXT_KEY_BUILDING_AMERICA_INDEPENDENCEHALL_TEXT',	'TXT_KEY_BUILDING_AMERICA_INDEPENDENCEHALL_STRATEGY',	-5, 				'BUILDINGCLASS_HERMITAGE', 	125, 	10, 					'GREAT_WORK_SLOT_ART_ARTIFACT', 2, 				1, 			'TECH_ARCHITECTURE', 	'ART_DEF_BUILDING_MILITARY_ACADEMY', 	-1, 			0, 				-1, 				40, 					10, 			1, 			'COMMUNITY_2_ATLAS',	19);

INSERT INTO Buildings 	
			(Type,								CivilizationRequired, 	BuildingClass,							Description,							Help, 											Civilopedia, 												Strategy, 											ArtDefineTag, 					GlobalPlotBuyCostModifier, 	GoldMaintenance,	Cost,	FaithCost,	MutuallyExclusiveGroup, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,				PortraitIndex)
VALUES		('BUILDING_AMERICA_SMITHSONIAN',	'CIVILIZATION_AMERICA', 'BUILDINGCLASS_AMERICA_SMITHSONIAN',	'TXT_KEY_BUILDING_MOMA',				'TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP',	'TXT_KEY_CIV5_BUILDINGS_MOMA_TEXT', 						'TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_STRATEGY',	'ART_DEF_BUILDING_UNIVERSITY',	-25, 						0,					1500,	0,			15, 					1,				1,			0,				-5,					'COMMUNITY_2_ATLAS',	10),
			('BUILDING_AMERICA_WESTPOINT',		'CIVILIZATION_AMERICA', 'BUILDINGCLASS_AMERICA_WESTPOINT',		'TXT_KEY_BUILDING_AMERICA_WESTPOINT',	'TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP',		'TXT_KEY_CIVILOPEDIA_BUILDINGS_AMERICA_WESTPOINT_TEXT', 	'TXT_KEY_BUILDING_AMERICA_WESTPOINT_STRATEGY',		'ART_DEF_BUILDING_UNIVERSITY',	-25, 						0,					1500,	0,			15, 					1,				1,			0,				-5,					'COMMUNITY_2_ATLAS',	20),
			('BUILDING_AMERICA_HOOVERDAM',		'CIVILIZATION_AMERICA', 'BUILDINGCLASS_AMERICA_HOOVERDAM',		'TXT_KEY_BUILDING_AMERICA_HOOVERDAM',	'TXT_KEY_BUILDING_AMERICA_HOOVERDAM_HELP',		'TXT_KEY_CIVILOPEDIA_BUILDINGS_AMERICA_HOOVERDAM_TEXT', 	'TXT_KEY_BUILDING_AMERICA_HOOVERDAM_STRATEGY',		'ART_DEF_BUILDING_UNIVERSITY',	-25, 						0,					1500,	0,			15, 					1,				1,			0,				-5,					'COMMUNITY_2_ATLAS',	21);

UPDATE Buildings SET
	PrereqTech 						= 'TECH_BIOLOGY',
	FreeBuilding					= 'BUILDINGCLASS_MUSEUM'
WHERE Type = 'BUILDING_AMERICA_SMITHSONIAN';

UPDATE Buildings SET
	PrereqTech 						= 'TECH_REPLACEABLE_PARTS', 
	FreePromotion 					= 'PROMOTION_SPLASH'
WHERE Type = 'BUILDING_AMERICA_WESTPOINT';

UPDATE Buildings SET
	PrereqTech 						= 'TECH_ELECTRICITY', 
	TRTurnModGlobal 				= -25, 
	FreshWater 						= 1, 
	FreeBuildingThisCity 			= 'BUILDINGCLASS_HYDRO_PLANT', 
	GlobalLandmarksTourismPercent 	= 25 
WHERE Type = 'BUILDING_AMERICA_HOOVERDAM';

-- Arabia -- Trade Route distance mod Instead of Luxury Doubling from Bazaar -- Units move faster in Desert -- Bonus yields from TR/Connections over desert.
UPDATE Buildings
SET ExtraLuxuries = '0'
WHERE Type = 'BUILDING_BAZAAR';

UPDATE Buildings
SET TradeRouteLandDistanceModifier = '50'
WHERE Type = 'BUILDING_BAZAAR';

UPDATE Building_YieldChanges
SET Yield = '3'
WHERE BuildingType = 'BUILDING_BAZAAR' AND YieldType = 'YIELD_GOLD';

DELETE FROM Building_ResourceYieldChanges
WHERE ResourceType = 'RESOURCE_OIL' AND BuildingType = 'BUILDING_BAZAAR';

DELETE FROM Building_FeatureYieldChanges
WHERE FeatureType = 'FEATURE_OASIS' AND BuildingType = 'BUILDING_BAZAAR';

UPDATE Buildings
SET FinishLandTRTourism = '6'
WHERE Type = 'BUILDING_BAZAAR';

UPDATE Buildings
SET FinishSeaTRTourism = '6'
WHERE Type = 'BUILDING_BAZAAR';

UPDATE Traits
SET EventTourismBoost = '0'
WHERE Type = 'TRAIT_LAND_TRADE_GOLD';

UPDATE Traits
SET EventGP = '15'
WHERE Type = 'TRAIT_LAND_TRADE_GOLD';

UPDATE Traits
SET TradeReligionModifier = '0'
WHERE Type = 'TRAIT_LAND_TRADE_GOLD';

UPDATE Traits
SET LandTradeRouteRangeBonus = '0'
WHERE Type = 'TRAIT_LAND_TRADE_GOLD';

DELETE FROM Trait_ResourceQuantityModifiers
WHERE TraitType = 'TRAIT_LAND_TRADE_GOLD';

UPDATE Traits
SET TradeRouteOnly = '1'
WHERE Type = 'TRAIT_LAND_TRADE_GOLD';

-- Aztec -- Set Floating Garden to +1 Food per 3 citizens instead of +15%

UPDATE Buildings
SET FreshWater = '0'
WHERE Type = 'BUILDING_FLOATING_GARDENS';

UPDATE Buildings
SET MinAreaSize = '-1'
WHERE Type = 'BUILDING_FLOATING_GARDENS';

UPDATE Buildings
SET PrereqTech = 'TECH_CONSTRUCTION'
WHERE Type = 'BUILDING_FLOATING_GARDENS';

UPDATE Traits
SET GoldenAgeFromVictory = '10'
WHERE Type = 'TRAIT_CULTURE_FROM_KILLS';

UPDATE Traits
SET CultureFromKills = '0'
WHERE Type = 'TRAIT_CULTURE_FROM_KILLS';

INSERT INTO Civilization_BuildingClassOverrides
	(CivilizationType, BuildingClassType, BuildingType)
VALUES
	('CIVILIZATION_AZTEC', 'BUILDINGCLASS_WELL', NULL);

UPDATE Building_YieldChanges
SET Yield = '3'
WHERE BuildingType = 'BUILDING_FLOATING_GARDENS';

INSERT INTO Building_GoldenAgeYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FLOATING_GARDENS', 'YIELD_FOOD', 10);

-- Askia -- Boost Mosque
DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_MUD_PYRAMID_MOSQUE' AND YieldType = 'YIELD_FAITH';

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_MUD_PYRAMID_MOSQUE' AND YieldType = 'YIELD_CULTURE';

UPDATE Buildings
SET PrereqTech = 'TECH_MASONRY'
WHERE Type = 'BUILDING_MUD_PYRAMID_MOSQUE';

UPDATE Buildings
SET BuildingProductionModifier = '10'
WHERE Type = 'BUILDING_MUD_PYRAMID_MOSQUE';

UPDATE Buildings
SET AllowsProductionTradeRoutes = '1'
WHERE Type = 'BUILDING_MUD_PYRAMID_MOSQUE';

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_MUD_PYRAMID_MOSQUE';

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_STONE_WORKS'
WHERE Type = 'BUILDING_MUD_PYRAMID_MOSQUE';

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_STONE_WORKS'
WHERE BuildingType = 'BUILDING_MUD_PYRAMID_MOSQUE';

UPDATE Traits
SET RiverTradeRoad = '1'
WHERE Type = 'TRAIT_AMPHIB_WARLORD';

UPDATE Traits
SET FasterAlongRiver = '1'
WHERE Type = 'TRAIT_AMPHIB_WARLORD';

-- Catherine -- Move Krepost, give bonus
DELETE FROM Building_DomainFreeExperiences
WHERE BuildingType = 'BUILDING_KREPOST';

UPDATE Buildings
SET PrereqTech = 'TECH_RIFLING'
WHERE Type = 'BUILDING_KREPOST';

UPDATE Buildings
SET ExtraCityHitPoints = '150'
WHERE Type = 'BUILDING_KREPOST';

UPDATE Buildings
SET BorderObstacleCity = '1'
WHERE Type = 'BUILDING_KREPOST';

UPDATE Buildings
SET PrereqTech = 'TECH_METALLURGY'
WHERE Type = 'BUILDING_KREPOST';

UPDATE Buildings
SET PlotCultureCostModifier = '0'
WHERE Type = 'BUILDING_KREPOST';

UPDATE Buildings
SET PlotBuyCostModifier = '0'
WHERE Type = 'BUILDING_KREPOST';

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_KREPOST', 'RESOURCE_HORSE', 'YIELD_GOLD', 1),
	('BUILDING_KREPOST', 'RESOURCE_HORSE', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'RESOURCE_IRON', 'YIELD_GOLD', 1),
	('BUILDING_KREPOST', 'RESOURCE_IRON', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'RESOURCE_COAL', 'YIELD_GOLD', 1),
	('BUILDING_KREPOST', 'RESOURCE_COAL', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'RESOURCE_OIL', 'YIELD_GOLD', 1),
	('BUILDING_KREPOST', 'RESOURCE_OIL', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'RESOURCE_ALUMINUM', 'YIELD_GOLD', 1),
	('BUILDING_KREPOST', 'RESOURCE_ALUMINUM', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'RESOURCE_URANIUM', 'YIELD_GOLD', 1),
	('BUILDING_KREPOST', 'RESOURCE_URANIUM', 'YIELD_PRODUCTION', 1);

UPDATE Buildings
SET CitySupplyModifier = '15'
WHERE Type = 'BUILDING_KREPOST';

UPDATE Buildings
SET HealRateChange = '10'
WHERE Type = 'BUILDING_KREPOST';

UPDATE Buildings
SET CityRangedStrikeRange = '1'
WHERE Type = 'BUILDING_KREPOST';

UPDATE Buildings
SET CityIndirectFire = '1'
WHERE Type = 'BUILDING_KREPOST';

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_ARSENAL'
WHERE Type = 'BUILDING_KREPOST';

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_ARSENAL'
WHERE BuildingType = 'BUILDING_KREPOST';

UPDATE Trait_YieldChangesStrategicResources
SET YieldType = 'YIELD_SCIENCE'
WHERE TraitType = 'TRAIT_STRATEGIC_RICHES';

UPDATE Traits
SET PlotCultureCostModifier = '-25'
WHERE Type = 'TRAIT_STRATEGIC_RICHES';

DELETE FROM Trait_YieldChangesStrategicResources
WHERE TraitType = 'TRAIT_STRATEGIC_RICHES';

-- Darius -- Adjust Satrap
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_COURTHOUSE'
WHERE BuildingType = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_COURTHOUSE'
WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings SET ConquestProb = '0' WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET BuildAnywhere = '1'
WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET NeverCapture = '1'
WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET PrereqTech = 'TECH_PHILOSOPHY'
WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET HurryCostModifier = '66'
WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET NumCityCostMod = '5'
WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET GoldMaintenance = '0'
WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET NoOccupiedUnhappiness = '1'
WHERE Type = 'BUILDING_SATRAPS_COURT';

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET TradeRouteRecipientBonus = '0'
WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET TradeRouteTargetBonus = '0'
WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Buildings
SET Happiness = '1'
WHERE Type = 'BUILDING_SATRAPS_COURT';

UPDATE Building_YieldChanges
SET Yield = '1'
WHERE BuildingType = 'BUILDING_SATRAPS_COURT';

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_SATRAPS_COURT', 'SPECIALIST_MERCHANT', 'YIELD_GOLD', 1),
	('BUILDING_SATRAPS_COURT', 'SPECIALIST_SCIENTIST', 'YIELD_GOLD', 1),
	('BUILDING_SATRAPS_COURT', 'SPECIALIST_ENGINEER', 'YIELD_GOLD', 1);

-- Darius -- Stronger Units during Golden Ages

UPDATE Traits
SET GoldenAgeCombatModifier = '15'
WHERE Type = 'TRAIT_ENHANCED_GOLDEN_AGES';

UPDATE Traits
SET GoldToGAP = '10'
WHERE Type = 'TRAIT_ENHANCED_GOLDEN_AGES';

-- Egypt -- Buff Burial Tomb, +1 Production in all cities.
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_CARAVANSARY'
WHERE BuildingType = 'BUILDING_BURIAL_TOMB';

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_CARAVANSARY'
WHERE Type = 'BUILDING_BURIAL_TOMB';

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_BURIAL_TOMB';

UPDATE Buildings
SET PrereqTech = 'TECH_CURRENCY'
WHERE Type = 'BUILDING_BURIAL_TOMB';

UPDATE Buildings
SET TradeRouteLandGoldBonus = '300'
WHERE Type = 'BUILDING_BURIAL_TOMB';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_BURIAL_TOMB', 'YIELD_GOLD', 1);

UPDATE Buildings
SET TradeRouteLandDistanceModifier = '50'
WHERE Type = 'BUILDING_BURIAL_TOMB';

UPDATE Buildings
SET CapturePlunderModifier = '0'
WHERE Type = 'BUILDING_BURIAL_TOMB';

INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_BURIAL_TOMB', 'TERRAIN_DESERT', 'YIELD_FOOD', 50),
	('BUILDING_BURIAL_TOMB', 'TERRAIN_DESERT', 'YIELD_GOLD', 50),
	('BUILDING_BURIAL_TOMB', 'TERRAIN_TUNDRA', 'YIELD_FOOD', 50),
	('BUILDING_BURIAL_TOMB', 'TERRAIN_TUNDRA', 'YIELD_GOLD', 50);

UPDATE Buildings
SET FinishLandTRTourism = '6'
WHERE Type = 'BUILDING_BURIAL_TOMB';

UPDATE Buildings
SET Happiness = '0'
WHERE Type = 'BUILDING_BURIAL_TOMB';

UPDATE Buildings
SET FreeArtifacts = '1'
WHERE Type = 'BUILDING_BURIAL_TOMB';

UPDATE Buildings
SET GreatWorkCount = '1'
WHERE Type = 'BUILDING_BURIAL_TOMB';

UPDATE Buildings
SET GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT'
WHERE Type = 'BUILDING_BURIAL_TOMB';

UPDATE Traits
SET WonderProductionModGA = '20'
WHERE Type = 'TRAIT_WONDER_BUILDER';

-- England

UPDATE Traits
Set NavalUnitMaintenanceModifier = '-25'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT';

UPDATE Traits
Set StartingSpies = '1'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT';

UPDATE Traits
Set ExtraSpies = '0'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT';

UPDATE Traits
Set SpyMoveRateModifier = '3'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT';

UPDATE Traits
Set SpyExtraRankBonus = '1'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT';

UPDATE Traits
Set EspionageRateModifier = '-25'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT';

UPDATE Traits
Set ExtraEmbarkMoves = '1'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT';

INSERT INTO GreatWorks 
			(Type, 							GreatWorkClassType,	Description,								Quote,												Audio,	Image)
VALUES		('GREAT_WORK_THE_CROWN_JEWELS', 'GREAT_WORK_ART',	'TXT_KEY_GREAT_WORK_THE_CROWN_JEWELS',		'TXT_KEY_GREAT_WORK_THE_CROWN_JEWELS_QUOTE',		'AS2D_GREAT_ARTIST_ARTWORK',	'TheJewelSplash.dds');

-- Germany -- New UA

-- Bismarck -- Hanse Yield Per Pop

UPDATE Buildings
SET FinishLandTRTourism = '0'
WHERE Type = 'BUILDING_HANSE';

UPDATE Buildings
SET FinishSeaTRTourism = '0'
WHERE Type = 'BUILDING_HANSE';

UPDATE Buildings
SET CityStateTradeRouteProductionModifier = '5'
WHERE Type = 'BUILDING_HANSE';

UPDATE Buildings
SET TradeRouteRecipientBonus = '3'
WHERE Type = 'BUILDING_HANSE';

UPDATE Buildings
SET TradeRouteTargetBonus = '3'
WHERE Type = 'BUILDING_HANSE';

UPDATE Buildings
SET PrereqTech = 'TECH_GUILDS'
WHERE Type = 'BUILDING_HANSE';

UPDATE Building_YieldChanges
SET Yield = '5'
WHERE BuildingType = 'BUILDING_HANSE' AND YieldType = 'YIELD_GOLD';

UPDATE Buildings
SET SpecialistCount = '1'
WHERE Type = 'BUILDING_HANSE';

UPDATE Traits
SET VotePerXCSAlliance = '3'
WHERE Type = 'TRAIT_CONVERTS_LAND_BARBARIANS';

UPDATE Traits
SET LandBarbarianConversionPercent = '0'
WHERE Type = 'TRAIT_CONVERTS_LAND_BARBARIANS';

UPDATE Traits
SET LandUnitMaintenanceModifier = '0'
WHERE Type = 'TRAIT_CONVERTS_LAND_BARBARIANS';

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_MINT'
WHERE BuildingType = 'BUILDING_HANSE';

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_MINT'
WHERE Type = 'BUILDING_HANSE';

-- Greece -- CS Alliances boost CS -- Odeon

UPDATE Traits
SET AllianceCSStrength = '5'
WHERE Type = 'TRAIT_CITY_STATE_FRIENDSHIP';

-- India -- Indus Sanitation (replace Mughal Fort) -- Unhappiness from Poverty and Illiteracy reduced by 25% 
DELETE FROM Buildings
WHERE Type = 'BUILDING_MUGHAL_FORT';

DELETE FROM Civilization_BuildingClassOverrides
WHERE BuildingType = 'BUILDING_MUGHAL_FORT';

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_MUGHAL_FORT';

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_MUGHAL_FORT';

DELETE FROM Building_TechEnhancedYieldChanges
WHERE BuildingType = 'BUILDING_MUGHAL_FORT';

UPDATE Traits
SET PopulationUnhappinessModifier = '0'
WHERE Type = 'TRAIT_POPULATION_GROWTH';

UPDATE Traits
SET CityUnhappinessModifier = '0'
WHERE Type = 'TRAIT_POPULATION_GROWTH';

UPDATE Traits
SET PopulationBoostReligion = '1'
WHERE Type = 'TRAIT_POPULATION_GROWTH';

UPDATE Traits
SET IsNoReligiousStrife = '1'
WHERE Type = 'TRAIT_POPULATION_GROWTH';

-- Iroquois -- All units receive Woodsman promotion

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_LONGHOUSE';

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_HERBALIST'
WHERE BuildingType = 'BUILDING_LONGHOUSE';

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_HERBALIST'
WHERE Type = 'BUILDING_LONGHOUSE';

UPDATE Buildings
SET SpecialistCount = '0'
WHERE Type = 'BUILDING_LONGHOUSE';

UPDATE Buildings
SET PrereqTech = 'TECH_CALENDAR'
WHERE Type = 'BUILDING_LONGHOUSE';

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_LONGHOUSE';

UPDATE Buildings
SET AllowsProductionTradeRoutes = '0'
WHERE Type = 'BUILDING_LONGHOUSE';

DELETE FROM Building_FeatureYieldChanges
WHERE BuildingType = 'BUILDING_LONGHOUSE';

-- Japan -- Dojo -- New UA

UPDATE Traits
SET FightWellDamaged = '0'
WHERE Type = 'TRAIT_FIGHT_WELL_DAMAGED';

DELETE FROM Trait_ImprovementYieldChanges
WHERE TraitType = 'TRAIT_FIGHT_WELL_DAMAGED';

DELETE FROM Trait_UnimprovedFeatureYieldChanges
WHERE TraitType = 'TRAIT_FIGHT_WELL_DAMAGED';

UPDATE Buildings
SET CitySupplyFlat = '2'
WHERE Type = 'BUILDING_DOJO';

-- Napoleon -- GWAM from combat!
UPDATE Traits
SET CultureBonusModifierConquest = '40'
WHERE Type = 'TRAIT_ENHANCED_CULTURE';

UPDATE Traits
SET ProductionBonusModifierConquest = '40'
WHERE Type = 'TRAIT_ENHANCED_CULTURE';

UPDATE Traits
SET CapitalThemingBonusModifier = '0'
WHERE Type = 'TRAIT_ENHANCED_CULTURE';

UPDATE Traits
SET MultipleAttackBonus = '10'
WHERE Type = 'TRAIT_ENHANCED_CULTURE';

UPDATE Traits
SET CityConquestGWAM = '50'
WHERE Type = 'TRAIT_ENHANCED_CULTURE';

-- Ottomans -- Receive a free Caravansary in all cities, and Trade Routes generate yields when finishing a Trade Route. 

UPDATE Traits
SET NavalUnitMaintenanceModifier = '0'
WHERE Type = 'TRAIT_CONVERTS_SEA_BARBARIANS';

DELETE FROM Trait_FreePromotionUnitCombats
WHERE TraitType = 'TRAIT_CONVERTS_SEA_BARBARIANS';

-- Rome -- Unique Monument (Flavian Amphitheater) -- Receive Culture boost when you conquer a City.

UPDATE Traits
SET CapitalBuildingModifier = '15'
WHERE Type = 'TRAIT_CAPITAL_BUILDINGS_CHEAPER';

UPDATE Traits
SET ExtraConqueredCityTerritoryClaimRange = '4'
WHERE Type = 'TRAIT_CAPITAL_BUILDINGS_CHEAPER';

UPDATE Traits
SET KeepConqueredBuildings = '1'
WHERE Type = 'TRAIT_CAPITAL_BUILDINGS_CHEAPER';

-- Siam -- adjust Wat
DELETE FROM Building_FeatureYieldChanges
WHERE BuildingType = 'BUILDING_WAT' AND YieldType = 'YIELD_SCIENCE';

UPDATE Buildings
SET Defense = '0'
WHERE Type = 'BUILDING_WAT';

UPDATE Buildings
SET EspionageModifier = '-50'
WHERE Type = 'BUILDING_WAT';

UPDATE Buildings
SET SpecialistCount = '1'
WHERE Type = 'BUILDING_WAT';

UPDATE Buildings
SET Espionage = '1'
WHERE Type = 'BUILDING_WAT';

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST'
WHERE Type = 'BUILDING_WAT';

UPDATE Buildings
SET PrereqTech = 'TECH_THEOLOGY'
WHERE Type = 'BUILDING_WAT';

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_WAT';

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_CONSTABLE'
WHERE BuildingType = 'BUILDING_WAT';

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_CONSTABLE'
WHERE Type = 'BUILDING_WAT';

-- Boost UA
UPDATE Traits
SET InfluenceMeetCS = '40'
WHERE Type = 'TRAIT_CITY_STATE_BONUSES';

UPDATE Traits
SET CityStateBonusModifier = '100'
WHERE Type = 'TRAIT_CITY_STATE_BONUSES';

UPDATE Traits
SET AllianceCSDefense = '25'
WHERE Type = 'TRAIT_CITY_STATE_BONUSES';

-- China
UPDATE Building_YieldChangesPerPop
SET Yield = '25'
WHERE BuildingType = 'BUILDING_PAPER_MAKER';

UPDATE Building_YieldChangesPerPop
SET YieldType = 'YIELD_GOLD'
WHERE BuildingType = 'BUILDING_PAPER_MAKER';

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_PAPER_MAKER';

UPDATE Buildings
SET SpecialistCount = '1'
WHERE Type = 'BUILDING_PAPER_MAKER';

UPDATE Buildings
SET NoUnhappfromXSpecialists = '1'
WHERE Type = 'BUILDING_PAPER_MAKER';

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST'
WHERE Type = 'BUILDING_PAPER_MAKER';

UPDATE Traits
SET GreatGeneralRateModifier = '0'
WHERE Type = 'TRAIT_ART_OF_WAR';

UPDATE Traits
SET GreatGeneralExtraBonus = '0'
WHERE Type = 'TRAIT_ART_OF_WAR';

UPDATE Traits
SET GreatWorkWLTKD = '1'
WHERE Type = 'TRAIT_ART_OF_WAR';

UPDATE Traits
SET ExpansionWLTKD = '1'
WHERE Type = 'TRAIT_ART_OF_WAR';

UPDATE Traits
SET PermanentYieldsDecreaseEveryEra = '1'
WHERE Type = 'TRAIT_ART_OF_WAR';

UPDATE Traits
SET GrowthBoon = '10'
WHERE Type = 'TRAIT_ART_OF_WAR';

INSERT INTO Building_WLTKDYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PAPER_MAKER', 'YIELD_GOLD', 10);

INSERT INTO Trait_PermanentYieldChangeWLTKD
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_ART_OF_WAR', 'YIELD_GOLD', 1),
	('TRAIT_ART_OF_WAR', 'YIELD_FOOD', 1);

-- New Vanilla Leader Data and Yields

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_INDUS_CANAL', 'YIELD_PRODUCTION', 3),
	('BUILDING_INDUS_CANAL', 'YIELD_FOOD', 3),
	('BUILDING_ODEON', 'YIELD_CULTURE', 3),
	('BUILDING_ODEON', 'YIELD_TOURISM', 3),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_PRODUCTION', 3),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_CULTURE', 3),
	('BUILDING_WHITE_TOWER', 'YIELD_CULTURE', 2),
	('BUILDING_WHITE_TOWER',	'YIELD_SCIENCE', 	2),
	('BUILDING_WHITE_TOWER',	'YIELD_GOLD', 		2),
	('BUILDING_WHITE_TOWER',	'YIELD_PRODUCTION', 10),
	('BUILDING_SIEGE_WORKSHOP', 'YIELD_PRODUCTION', 3),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'YIELD_CULTURE', 1),
	('BUILDING_BURIAL_TOMB', 'YIELD_FAITH', 1),
	('BUILDING_FLOATING_GARDENS', 'YIELD_CULTURE', 2),
	('BUILDING_LONGHOUSE', 'YIELD_FOOD', 2),
	('BUILDING_LONGHOUSE', 'YIELD_CULTURE', 1),
	('BUILDING_HANSE', 'YIELD_CULTURE', 3),
	('BUILDING_WAT', 'YIELD_SCIENCE', 2),
	('BUILDING_WAT', 'YIELD_FAITH', 1),
	('BUILDING_WAT', 'YIELD_CULTURE', 1),
	('BUILDING_KREPOST', 'YIELD_PRODUCTION', 3),
	('BUILDING_BAZAAR', 'YIELD_FAITH', 2),
	('BUILDING_BAZAAR', 'YIELD_SCIENCE', 2),
	('BUILDING_SIEGE_WORKSHOP', 'YIELD_SCIENCE', 1),
	('BUILDING_PAPER_MAKER', 'YIELD_CULTURE', 1),
	('BUILDING_PAPER_MAKER', 'YIELD_SCIENCE', 2),
	('BUILDING_DOJO', 'YIELD_SCIENCE', 5),
	('BUILDING_DOJO', 'YIELD_CULTURE', 3),
	('BUILDING_AMERICA_INDEPENDENCEHALL',	'YIELD_CULTURE',				2),
	('BUILDING_AMERICA_SMITHSONIAN',		'YIELD_CULTURE',				2),
	('BUILDING_AMERICA_SMITHSONIAN',		'YIELD_SCIENCE',				2),
	('BUILDING_AMERICA_HOOVERDAM',			'YIELD_GOLD',					2),
	('BUILDING_AMERICA_HOOVERDAM',			'YIELD_PRODUCTION',				2),
	('BUILDING_AMERICA_WESTPOINT',			'YIELD_PRODUCTION',				2),
	('BUILDING_AMERICA_WESTPOINT',			'YIELD_SCIENCE',				2);

INSERT INTO Building_YieldFromConstruction
		(BuildingType, 				YieldType, 			Yield)
VALUES	('BUILDING_WHITE_TOWER', 	'YIELD_SCIENCE', 	25),
		('BUILDING_WHITE_TOWER', 	'YIELD_GOLD', 		25);

INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
VALUES
	('BUILDING_WHITE_TOWER', 'RESOURCE_IRON', 2),
	('BUILDING_AMERICA_WESTPOINT', 'RESOURCE_IRON', 3);

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_BURIAL_TOMB', 'SPECIALIST_MERCHANT', 'YIELD_GOLD', 1);

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_INDUS_CANAL', 'YIELD_PRODUCTION', 25);

INSERT INTO Building_YieldFromUnitProduction
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SIEGE_WORKSHOP', 'YIELD_SCIENCE', 20);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_INDUS_CANAL', 'FEATURE_OASIS', 'YIELD_FOOD', 2);

INSERT INTO Building_LakePlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_INDUS_CANAL', 'YIELD_FOOD', 2);

INSERT INTO Civilization_BuildingClassOverrides
	(CivilizationType, BuildingClassType, BuildingType)
VALUES
	('CIVILIZATION_INDIA', 'BUILDINGCLASS_AQUEDUCT', 'BUILDING_INDUS_CANAL'),
	('CIVILIZATION_JAPAN', 'BUILDINGCLASS_ARMORY', 'BUILDING_DOJO'),
	('CIVILIZATION_GREECE', 'BUILDINGCLASS_AMPHITHEATER', 'BUILDING_ODEON'),
	('CIVILIZATION_ROME', 'BUILDINGCLASS_COLOSSEUM', 'BUILDING_FLAVIAN_COLOSSEUM'),
	('CIVILIZATION_ENGLAND', 'BUILDINGCLASS_IRONWORKS', 'BUILDING_WHITE_TOWER'),
	('CIVILIZATION_OTTOMAN', 'BUILDINGCLASS_FORGE', 'BUILDING_SIEGE_WORKSHOP'),
	('CIVILIZATION_AMERICA', 'BUILDINGCLASS_HERMITAGE', 'BUILDING_AMERICA_INDEPENDENCEHALL');

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_ODEON', 'BUILDINGCLASS_MONUMENT'),
	('BUILDING_WHITE_TOWER', 'BUILDINGCLASS_FORGE');

INSERT INTO Building_ClassNeededAnywhere 	
			(BuildingType, 						BuildingClassType)
VALUES		('BUILDING_AMERICA_SMITHSONIAN',	'BUILDINGCLASS_HERMITAGE'),
			('BUILDING_AMERICA_WESTPOINT',		'BUILDINGCLASS_HERMITAGE'),
			('BUILDING_AMERICA_HOOVERDAM',		'BUILDINGCLASS_HERMITAGE');

INSERT INTO Building_ClassNeededNowhere 	
			(BuildingType, 						BuildingClassType)
VALUES		('BUILDING_AMERICA_HOOVERDAM',		'BUILDINGCLASS_AMERICA_SMITHSONIAN'),
			('BUILDING_AMERICA_HOOVERDAM',		'BUILDINGCLASS_AMERICA_WESTPOINT'),
			('BUILDING_AMERICA_SMITHSONIAN',	'BUILDINGCLASS_AMERICA_HOOVERDAM'),
			('BUILDING_AMERICA_SMITHSONIAN',	'BUILDINGCLASS_AMERICA_WESTPOINT'),
			('BUILDING_AMERICA_WESTPOINT',		'BUILDINGCLASS_AMERICA_HOOVERDAM'),
			('BUILDING_AMERICA_WESTPOINT',		'BUILDINGCLASS_AMERICA_SMITHSONIAN');

INSERT INTO Building_FreeUnits
			(BuildingType,					UnitType,			NumUnits)
VALUES		('BUILDING_AMERICA_WESTPOINT',	'UNIT_ARTILLERY',	3);

INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FLOATING_GARDENS', 'YIELD_FOOD', 25),
	('BUILDING_FLOATING_GARDENS', 'YIELD_PRODUCTION', 25),
	('BUILDING_SATRAPS_COURT', 'YIELD_GOLD', 20),
	('BUILDING_SATRAPS_COURT', 'YIELD_GOLDEN_AGE_POINTS', 20),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_TOURISM', 34),
	('BUILDING_AMERICA_INDEPENDENCEHALL', 'YIELD_CULTURE', 25);

INSERT INTO Building_YieldFromYieldPercent
		(BuildingType, 		YieldIn, 		YieldOut, 		Value)
VALUES	('BUILDING_HANSE', 	'YIELD_GOLD', 	'YIELD_SCIENCE', 10);
	
INSERT INTO Building_YieldFromYieldPercentGlobal
		(BuildingType, 						YieldIn, 		YieldOut, 			Value)
VALUES	('BUILDING_AMERICA_SMITHSONIAN', 	'YIELD_GOLD', 	'YIELD_CULTURE', 	10),
		('BUILDING_AMERICA_HOOVERDAM', 		'YIELD_GOLD', 	'YIELD_PRODUCTION', 10),
		('BUILDING_AMERICA_WESTPOINT', 		'YIELD_GOLD', 	'YIELD_SCIENCE', 	10);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_SIEGE_WORKSHOP', 'IMPROVEMENT_MINE', 'YIELD_PRODUCTION', 2);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_BAZAAR', 'RESOURCE_SPICES', 'YIELD_FOOD', 1),
	('BUILDING_BAZAAR', 'RESOURCE_SPICES', 'YIELD_PRODUCTION', 1),
	('BUILDING_BAZAAR', 'RESOURCE_SUGAR', 'YIELD_FOOD', 1),
	('BUILDING_BAZAAR', 'RESOURCE_SUGAR', 'YIELD_GOLD', 1),
	('BUILDING_ODEON', 'RESOURCE_DYE', 'YIELD_CULTURE', 1),
	('BUILDING_ODEON', 'RESOURCE_DYE', 'YIELD_GOLD', 1),
	('BUILDING_ODEON', 'RESOURCE_SILK', 'YIELD_CULTURE', 1),
	('BUILDING_ODEON', 'RESOURCE_SILK', 'YIELD_GOLD', 1),
	('BUILDING_SIEGE_WORKSHOP', 'RESOURCE_COPPER', 'YIELD_PRODUCTION', 1),
	('BUILDING_SIEGE_WORKSHOP', 'RESOURCE_COPPER', 'YIELD_GOLD', 1),
	('BUILDING_SIEGE_WORKSHOP', 'RESOURCE_IRON', 'YIELD_PRODUCTION', 1),
	('BUILDING_SIEGE_WORKSHOP', 'RESOURCE_IRON', 'YIELD_GOLD', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'RESOURCE_STONE', 'YIELD_PRODUCTION', 2),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'RESOURCE_MARBLE', 'YIELD_PRODUCTION', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'RESOURCE_MARBLE', 'YIELD_GOLD', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'RESOURCE_SALT', 'YIELD_PRODUCTION', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'RESOURCE_SALT', 'YIELD_GOLD', 1),
	('BUILDING_BURIAL_TOMB', 'RESOURCE_TRUFFLES', 'YIELD_GOLD', 2),
	('BUILDING_BURIAL_TOMB', 'RESOURCE_COTTON', 'YIELD_CULTURE', 1),
	('BUILDING_BURIAL_TOMB', 'RESOURCE_COTTON', 'YIELD_PRODUCTION', 1),
	('BUILDING_BURIAL_TOMB', 'RESOURCE_FUR', 'YIELD_GOLD', 1),
	('BUILDING_BURIAL_TOMB', 'RESOURCE_FUR', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_INDUS_CANAL', 'FEATURE_FLOOD_PLAINS', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_INDUS_CANAL', 'IMPROVEMENT_FARM', 'YIELD_PRODUCTION', 1),
	('BUILDING_INDUS_CANAL', 'IMPROVEMENT_FARM', 'YIELD_FOOD', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_LUMBERMILL', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_LUMBERMILL_JUNGLE', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_MINE', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_CAMP', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_LUMBERMILL', 'YIELD_GOLD', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_LUMBERMILL_JUNGLE', 'YIELD_GOLD', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_MINE', 'YIELD_GOLD', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_CAMP', 'YIELD_GOLD', 1);

INSERT INTO Building_DomainFreeExperiences
	(BuildingType, DomainType, Experience)
VALUES
	('BUILDING_DOJO', 'DOMAIN_LAND', 25),
	('BUILDING_DOJO', 'DOMAIN_SEA', 25),
	('BUILDING_DOJO', 'DOMAIN_AIR', 25);

INSERT INTO Building_YieldFromVictory
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ODEON', 'YIELD_CULTURE', 25),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_GREAT_GENERAL_POINTS', 10),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_GREAT_ADMIRAL_POINTS', 10);

INSERT INTO Building_YieldFromVictoryGlobal
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ODEON', 'YIELD_CULTURE_LOCAL', 5),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_GOLDEN_AGE_POINTS', 5);

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
VALUES
	('BUILDING_ODEON', 'SPECIALIST_WRITER', 33);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_FLAVIAN_COLOSSEUM', 'BUILDINGCLASS_BARRACKS', 'YIELD_PRODUCTION', 2),
	('BUILDING_FLAVIAN_COLOSSEUM', 'BUILDINGCLASS_FORGE', 'YIELD_PRODUCTION', 2),
	('BUILDING_FLAVIAN_COLOSSEUM', 'BUILDINGCLASS_ARMORY', 'YIELD_PRODUCTION', 2);

INSERT INTO Building_UnitCombatProductionModifiers
	(BuildingType, UnitCombatType, Modifier)
VALUES
	('BUILDING_SIEGE_WORKSHOP', 'UNITCOMBAT_SIEGE', 50);

INSERT INTO Building_ThemingBonuses
	(BuildingType, Description, Bonus, RequiresOwner, RequiresAnyButOwner,  AIPriority)
VALUES
	('BUILDING_ODEON', 'TXT_KEY_THEMING_BONUS_AMPHITHEATER_NATIONAL', 4, 1, 0, 2),
	('BUILDING_ODEON', 'TXT_KEY_THEMING_BONUS_AMPHITHEATER_GLOBAL', 6, 0, 1, 3);

INSERT INTO Building_ThemingBonuses	
			(BuildingType,							Description,								Bonus,	RequiresOwner,	MustBeArt,	AIPriority)
VALUES		('BUILDING_AMERICA_INDEPENDENCEHALL',	'TXT_KEY_THEMING_BONUS_INDEPENDENCEHALL',	8,		1,				1,			4);


INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ODEON', 'YIELD_CULTURE', 2),
	('BUILDING_AMERICA_INDEPENDENCEHALL', 'YIELD_CULTURE', 3),
	('BUILDING_AMERICA_INDEPENDENCEHALL', 'YIELD_GOLD',	3);
	
INSERT INTO Trait_YieldFromHistoricEvent
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_LAND_TRADE_GOLD', 'YIELD_CULTURE', 1),
	('TRAIT_LAND_TRADE_GOLD', 'YIELD_SCIENCE', 1);

INSERT INTO Building_RiverPlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FLOATING_GARDENS', 'YIELD_FOOD', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'YIELD_PRODUCTION', 1);

INSERT INTO Trait_YieldFromKills
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_CULTURE_FROM_KILLS', 'YIELD_FAITH', 150),
	('TRAIT_CULTURE_FROM_KILLS', 'YIELD_GOLD', 150);

INSERT INTO Trait_ArtifactYieldChanges
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_WONDER_BUILDER', 'YIELD_CULTURE', 5),
	('TRAIT_WONDER_BUILDER', 'YIELD_SCIENCE', 5);

INSERT INTO Trait_ImprovementYieldChanges
	(TraitType, ImprovementType, YieldType, Yield)
VALUES
	('TRAIT_WONDER_BUILDER', 'IMPROVEMENT_LANDMARK', 'YIELD_TOURISM', 5),
	('TRAIT_WONDER_BUILDER', 'IMPROVEMENT_LANDMARK', 'YIELD_GOLD', 5);

INSERT INTO Trait_TradeRouteEndYield
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_CONVERTS_SEA_BARBARIANS', 'YIELD_SCIENCE', 150),
	('TRAIT_CONVERTS_SEA_BARBARIANS', 'YIELD_FOOD', 150),
	('TRAIT_CONVERTS_SEA_BARBARIANS', 'YIELD_CULTURE', 150),
	('TRAIT_CONVERTS_SEA_BARBARIANS', 'YIELD_GOLD', 150);

INSERT INTO Trait_YieldFromCSAlly
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_CONVERTS_LAND_BARBARIANS', 'YIELD_CULTURE', 3),
	('TRAIT_CONVERTS_LAND_BARBARIANS', 'YIELD_GOLDEN_AGE_POINTS', 3);

INSERT INTO Trait_YieldFromCSFriend
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_CONVERTS_LAND_BARBARIANS', 'YIELD_SCIENCE', 3),
	('TRAIT_CONVERTS_LAND_BARBARIANS', 'YIELD_GOLDEN_AGE_POINTS', 3);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_WAT', 'BUILDINGCLASS_TEMPLE', 'YIELD_SCIENCE', 2),
	('BUILDING_WAT', 'BUILDINGCLASS_SHRINE', 'YIELD_SCIENCE', 2);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_LONGHOUSE', 'FEATURE_JUNGLE', 'YIELD_PRODUCTION', 1),
	('BUILDING_LONGHOUSE', 'FEATURE_JUNGLE', 'YIELD_FOOD', 1),
	('BUILDING_LONGHOUSE', 'FEATURE_FOREST', 'YIELD_PRODUCTION', 1),
	('BUILDING_LONGHOUSE', 'FEATURE_FOREST', 'YIELD_FOOD', 1),
	('BUILDING_WAT', 'FEATURE_FOREST', 'YIELD_CULTURE', 1),
	('BUILDING_WAT', 'FEATURE_JUNGLE', 'YIELD_CULTURE', 1);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_LONGHOUSE', 'IMPROVEMENT_CAMP', 'YIELD_PRODUCTION', 1),
	('BUILDING_LONGHOUSE', 'IMPROVEMENT_PLANTATION', 'YIELD_FOOD', 1),
	('BUILDING_LONGHOUSE', 'IMPROVEMENT_PLANTATION', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_ODEON', 					'BUILDINGCLASS_WRITERS_GUILD', 		'YIELD_GOLD', 		1),
	('BUILDING_AMERICA_SMITHSONIAN',	'BUILDINGCLASS_MUSEUM',				'YIELD_CULTURE',	5),
	('BUILDING_AMERICA_SMITHSONIAN',	'BUILDINGCLASS_MUSEUM',				'YIELD_SCIENCE',	5),
	('BUILDING_AMERICA_SMITHSONIAN',	'BUILDINGCLASS_LABORATORY',			'YIELD_CULTURE',	5),
	('BUILDING_AMERICA_SMITHSONIAN',	'BUILDINGCLASS_LABORATORY',			'YIELD_SCIENCE',	5),
	('BUILDING_AMERICA_HOOVERDAM',		'BUILDINGCLASS_HOTEL',				'YIELD_GOLD',		5),
	('BUILDING_AMERICA_HOOVERDAM',		'BUILDINGCLASS_HOTEL',				'YIELD_PRODUCTION',	5),
	('BUILDING_AMERICA_HOOVERDAM',		'BUILDINGCLASS_STADIUM',			'YIELD_GOLD',		5),
	('BUILDING_AMERICA_HOOVERDAM',		'BUILDINGCLASS_STADIUM',			'YIELD_PRODUCTION',	5),
	('BUILDING_AMERICA_WESTPOINT',		'BUILDINGCLASS_MILITARY_ACADEMY',	'YIELD_PRODUCTION',	5),
	('BUILDING_AMERICA_WESTPOINT',		'BUILDINGCLASS_MILITARY_ACADEMY',	'YIELD_SCIENCE',	5),
	('BUILDING_AMERICA_WESTPOINT',		'BUILDINGCLASS_MILITARY_BASE',		'YIELD_PRODUCTION',	5),
	('BUILDING_AMERICA_WESTPOINT',		'BUILDINGCLASS_MILITARY_BASE',		'YIELD_SCIENCE',	5);

INSERT INTO Building_YieldChangeWorldWonderGlobal	
	(BuildingType,						YieldType,			Yield)
VALUES
	('BUILDING_AMERICA_SMITHSONIAN',	'YIELD_CULTURE',	2),
	('BUILDING_AMERICA_SMITHSONIAN',	'YIELD_SCIENCE',	2),
	('BUILDING_AMERICA_HOOVERDAM',		'YIELD_GOLD',		2),
	('BUILDING_AMERICA_HOOVERDAM',		'YIELD_PRODUCTION',	2),
	('BUILDING_AMERICA_WESTPOINT',		'YIELD_PRODUCTION',	2),
	('BUILDING_AMERICA_WESTPOINT',		'YIELD_SCIENCE',	2);

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_PAPER_MAKER', 'BUILDINGCLASS_GROVE');

INSERT INTO Trait_YieldFromTilePurchase
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_RIVER_EXPANSION', 'YIELD_PRODUCTION', 20);

INSERT INTO Trait_YieldFromTileEarn
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_STRATEGIC_RICHES', 'YIELD_SCIENCE', 20);

INSERT INTO Trait_ResourceQuantityModifiers
	(TraitType, ResourceType, ResourceQuantityModifier)
VALUES
	('TRAIT_STRATEGIC_RICHES', 'RESOURCE_OIL', 100),
	('TRAIT_STRATEGIC_RICHES', 'RESOURCE_COAL', 100),
	('TRAIT_STRATEGIC_RICHES', 'RESOURCE_ALUMINUM', 100);

INSERT INTO Building_YieldFromUnitLevelUp
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_DOJO', 'YIELD_CULTURE', 4),
	('BUILDING_DOJO', 'YIELD_SCIENCE', 4);

INSERT INTO Trait_BuildingClassYieldChanges
	(TraitType, BuildingClassType, YieldType, YieldChange)
VALUES
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_BARRACKS', 'YIELD_FAITH', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_BARRACKS', 'YIELD_CULTURE', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_ARMORY', 'YIELD_FAITH', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_ARMORY', 'YIELD_CULTURE', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_MILITARY_ACADEMY', 'YIELD_FAITH', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_MILITARY_ACADEMY', 'YIELD_CULTURE', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_WALLS', 'YIELD_FAITH', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_WALLS', 'YIELD_CULTURE', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_CASTLE', 'YIELD_FAITH', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_CASTLE', 'YIELD_CULTURE', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_ARSENAL', 'YIELD_FAITH', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_ARSENAL', 'YIELD_CULTURE', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_MILITARY_BASE', 'YIELD_FAITH', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_MILITARY_BASE', 'YIELD_CULTURE', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_MINEFIELD', 'YIELD_FAITH', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_MINEFIELD', 'YIELD_CULTURE', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_BOMB_SHELTER', 'YIELD_FAITH', 1),
	('TRAIT_FIGHT_WELL_DAMAGED', 'BUILDINGCLASS_BOMB_SHELTER', 'YIELD_CULTURE', 1);

INSERT INTO Trait_GreatPersonBirthGWAM
	(TraitType, GreatPersonType, Value)
VALUES
	('TRAIT_FIGHT_WELL_DAMAGED', 'GREATPERSON_GENERAL', '50'),
	('TRAIT_FIGHT_WELL_DAMAGED', 'GREATPERSON_ADMIRAL', '50');

INSERT INTO Trait_GreatPersonCostReduction
	(TraitType, GreatPersonType, Modifier)
VALUES
	('TRAIT_POPULATION_GROWTH', 'GREATPERSON_PROPHET', -35);
