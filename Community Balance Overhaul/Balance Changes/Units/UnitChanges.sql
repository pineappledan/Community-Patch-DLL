-- CIVILIANS AND GREAT PEOPLE

	UPDATE Units SET PurchaseCooldown =     5  WHERE Type = 'UNIT_CARAVAN';
	UPDATE Units SET PurchaseCooldown =     5  WHERE Type = 'UNIT_CARGO_SHIP';
	UPDATE Units SET PurchaseCooldown =     5  WHERE Type = 'UNIT_WORKER';
	UPDATE Units SET PurchaseCooldown =     5  WHERE Type = 'UNIT_SETTLER';
	UPDATE Units SET PurchaseCooldown =     5  WHERE Type = 'UNIT_PIONEER';
	UPDATE Units SET PurchaseCooldown =     5  WHERE Type = 'UNIT_COLONIST';
	UPDATE Units SET PurchaseCooldown =     5  WHERE Type = 'UNIT_WORKBOAT';
	

	-- Moved SS Parts to last 4 techs - makes Science Victory as difficult as other victories.
	UPDATE Units SET PrereqTech = 'TECH_NUCLEAR_FUSION' WHERE Type = 'UNIT_SS_BOOSTER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	UPDATE Units SET PrereqTech = 'TECH_GLOBALIZATION' WHERE Type = 'UNIT_SS_COCKPIT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Caravans moved to Pottery
	UPDATE Units SET PrereqTech = 'TECH_HORSEBACK_RIDING' WHERE Type = 'UNIT_CARAVAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	UPDATE Units SET MilitarySupport = '0' WHERE Type = 'UNIT_CARAVAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Cargo Ship -- Move to Optics

	UPDATE Units SET PrereqTech = 'TECH_OPTICS' WHERE Type = 'UNIT_CARGO_SHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	UPDATE Units SET MilitarySupport = '0' WHERE Type = 'UNIT_CARGO_SHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Units SET ProductionCostAddedPerEra = '75' WHERE Type = 'UNIT_CARGO_SHIP';
	UPDATE Units SET ProductionCostAddedPerEra = '75' WHERE Type = 'UNIT_CARAVAN';

	-- Settler moved to Pottery
	UPDATE Units SET PrereqTech = 'TECH_POTTERY' WHERE Type = 'UNIT_SETTLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Unit_Flavors SET Flavor = '25' WHERE UnitType = 'UNIT_SETTLER';

	-- Workers Reduced Work Rate to slow down early growth
	UPDATE Units SET WorkRate = '90' WHERE Type = 'UNIT_WORKER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Great Prophets no longer capturable
	UPDATE Units Set Capture = NULL WHERE Type = 'UNIT_PROPHET' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Great Writer culture boost lowered slightly.

	UPDATE Units SET BaseCultureTurnsToCount = '5' WHERE Type = 'UNIT_WRITER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Writer added scaling bonus for num owned GWS
	UPDATE Units SET ScaleFromNumGWs = '3' WHERE Type = 'UNIT_WRITER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Great Scientist science boost lowered slightly.

	UPDATE Units SET BaseBeakersTurnsToCount = '3' WHERE Type = 'UNIT_SCIENTIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Admiral movement buff, ability addition
	UPDATE Units SET Moves = '5' WHERE Type = 'UNIT_GREAT_ADMIRAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Units SET NumFreeLux = '2' WHERE Type = 'UNIT_GREAT_ADMIRAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	--Great General Supply Buff
	INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_GREAT_ADMIRAL' , 'PROMOTION_SUPPLY_BOOST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_GREAT_GENERAL' , 'PROMOTION_SUPPLY_BOOST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_MONGOLIAN_KHAN' , 'PROMOTION_SUPPLY_BOOST' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	-- Merchant gold boosted, CS ability buff

	UPDATE Units SET NumGoldPerEra = '150' WHERE Type = 'UNIT_MERCHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Reduced base golden age turns of artist 
	UPDATE Units SET GoldenAgeTurns = '0' WHERE Type = 'UNIT_ARTIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	UPDATE Units SET BaseTurnsForGAPToCount = '10' WHERE Type = 'UNIT_ARTIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	-- Writer added scaling bonus for num themed GWs
	UPDATE Units SET ScaleFromNumThemes = '20' WHERE Type = 'UNIT_ARTIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Engineer production boost nerfed slightly.

	UPDATE Units SET BaseHurry = '100' WHERE Type = 'UNIT_ENGINEER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Units SET HurryMultiplier = '20' WHERE Type = 'UNIT_ENGINEER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Musician changes
	UPDATE Units SET OneShotTourismPercentOthers = '0' WHERE Type = 'UNIT_MUSICIAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	UPDATE Units SET OneShotTourism = '0' WHERE Type = 'UNIT_MUSICIAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	UPDATE Units SET TourismBonusTurns = '10' WHERE Type = 'UNIT_MUSICIAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- work boat sight penalty
	INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_WORKBOAT' , 'PROMOTION_SIGHT_PENALTY' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	UPDATE Units SET BaseSightRange = '1' WHERE Type = 'UNIT_WORKBOAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	UPDATE Units SET Moves = '2' WHERE Type = 'UNIT_WORKBOAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	UPDATE Units SET MilitarySupport = '0' WHERE Type = 'UNIT_WORKBOAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Units
	SET RequiresFaithPurchaseEnabled = '1'
	WHERE Type = 'UNIT_ARCHAEOLOGIST';

-- cap for archaeologists
UPDATE UnitClasses SET MaxPlayerInstances = '3' WHERE Type = 'UNITCLASS_ARCHAEOLOGIST';

--modder please note still does +2 turns just like custom house, but weird bug i dont ask why.
INSERT INTO Unit_ScalingFromOwnedImprovements
	(UnitType, ImprovementType, Amount)
VALUES
	('UNIT_SCIENTIST', 'IMPROVEMENT_ACADEMY', '10'),
	('UNIT_ENGINEER', 'IMPROVEMENT_MANUFACTORY', '25'),
	('UNIT_MERCHANT', 'IMPROVEMENT_CUSTOMS_HOUSE', '25'),
	('UNIT_VENETIAN_MERCHANT', 'IMPROVEMENT_CUSTOMS_HOUSE', '25');

INSERT INTO Unit_AITypes
	(UnitType, UnitAIType)
VALUES
-- defense seems to be better suited for melee in the code
--	('UNIT_GATLINGGUN', 'UNITAI_DEFENSE'),
--	('UNIT_BAZOOKA', 'UNITAI_DEFENSE'),
--	('UNIT_MACHINE_GUN', 'UNITAI_DEFENSE'),
	('UNIT_GATLINGGUN', 'UNITAI_RANGED'),
	('UNIT_BAZOOKA', 'UNITAI_RANGED'),
	('UNIT_IRONCLAD', 'UNITAI_EXPLORE_SEA'),
	('UNIT_FRIGATE', 'UNITAI_EXPLORE_SEA'),
	('UNIT_ENGLISH_SHIPOFTHELINE', 'UNITAI_EXPLORE_SEA'),
	('UNIT_BATTLESHIP', 'UNITAI_EXPLORE_SEA'),
--	('UNIT_SUBMARINE', 'UNITAI_EXPLORE_SEA'),
--	('UNIT_NUCLEAR_SUBMARINE', 'UNITAI_EXPLORE_SEA'),
	('UNIT_MISSILE_CRUISER', 'UNITAI_EXPLORE_SEA'),
	('UNIT_BYZANTINE_DROMON', 'UNITAI_EXPLORE_SEA'),
	('UNIT_GALLEASS', 'UNITAI_EXPLORE_SEA'),
	('UNIT_VENETIAN_GALLEASS', 'UNITAI_EXPLORE_SEA'),
	('UNIT_CRUISER', 'UNITAI_EXPLORE_SEA'),
-- add missing explore to melee units
	('UNIT_BARBARIAN_SWORDSMAN', 'UNITAI_EXPLORE'),
	('UNIT_DANISH_BERSERKER', 'UNITAI_EXPLORE'),
	('UNIT_FCOMPANY', 'UNITAI_EXPLORE'),
	('UNIT_FCOMPANY', 'UNITAI_COUNTER'),
	('UNIT_IROQUOIAN_MOHAWKWARRIOR', 'UNITAI_EXPLORE'),
	('UNIT_KRIS_SWORDSMAN', 'UNITAI_EXPLORE'),
	('UNIT_LONGSWORDSMAN', 'UNITAI_EXPLORE'),	
	('UNIT_ROMAN_LEGION', 'UNITAI_EXPLORE'),
	('UNIT_SWORDSMAN', 'UNITAI_EXPLORE'),
-- recon gets fast attack for pillaging
	('UNIT_COMMANDO', 'UNITAI_FAST_ATTACK'),
	('UNIT_MARINE', 'UNITAI_FAST_ATTACK'),
	('UNIT_PARATROOPER', 'UNITAI_FAST_ATTACK'),
	('UNIT_XCOM_SQUAD', 'UNITAI_FAST_ATTACK');


INSERT INTO Missions
	(Type, Description, Help, DisabledHelp, EntityEventType, Time, Target, Build, Sound, HotKey, AltDown, ShiftDown, CtrlDown, HotKeyPriority, HotKeyAlt, AltDownAlt, ShiftDownAlt, CtrlDownAlt, HotKeyPriorityAlt, OrderPriority, Visible, IconIndex, IconAtlas)
VALUES
	('MISSION_FREE_LUXURY', 'TXT_KEY_MISSION_FREE_LUXURY', 'TXT_KEY_MISSION_FREE_LUXURY_HELP', 'TXT_KEY_MISSION_FREE_LUXURY_HELP_DISABLED', 'ENTITY_EVENT_GREAT_EVENT', 20, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 199, 1, 16, 'UNIT_ACTION_ATLAS');

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_NUCLEAR_MISSILE' , 'PROMOTION_NUCLEAR_SILO' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- All civs start with a pathfinder

--Replace Starting Warrior with a Pathfinder
UPDATE Eras SET StartingDefenseUnits='1' Where Type='ERA_ANCIENT';
UPDATE Eras SET StartingExploreUnits='1' Where Type='ERA_ANCIENT';

--Assigns UnitCombatInfos to civilian units -- Can now grant production bonuses and free promotions via buildings, traits and policies
INSERT INTO UnitCombatInfos  	
			(Type,					Description)
VALUES		
	('UNITCOMBAT_SETTLER',	'TXT_KEY_UNITCOMBAT_SETTLER'),
	('UNITCOMBAT_WORKER',	'TXT_KEY_UNITCOMBAT_WORKER'),
	('UNITCOMBAT_WORKBOAT',	'TXT_KEY_UNITCOMBAT_WORKBOAT'),
	('UNITCOMBAT_CARGO',	'TXT_KEY_UNITCOMBAT_CARGO'),
	('UNITCOMBAT_CARAVAN',	'TXT_KEY_UNITCOMBAT_CARAVAN'),
	('UNITCOMBAT_INQUISITOR',	'TXT_KEY_UNITCOMBAT_INQUISITOR'),
	('UNITCOMBAT_MISSIONARY',	'TXT_KEY_UNITCOMBAT_MISSIONARY');
	
UPDATE Units SET CombatClass = 'UNITCOMBAT_SETTLER' WHERE Type = 'UNIT_SETTLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
UPDATE Units SET CombatClass = 'UNITCOMBAT_SETTLER' WHERE Type = 'UNIT_PIONEER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
UPDATE Units SET CombatClass = 'UNITCOMBAT_SETTLER' WHERE Type = 'UNIT_COLONIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
UPDATE Units SET CombatClass = 'UNITCOMBAT_WORKER' WHERE Type = 'UNIT_WORKER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
UPDATE Units SET CombatClass = 'UNITCOMBAT_WORKBOAT' WHERE Type = 'UNIT_WORKBOAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
UPDATE Units SET CombatClass = 'UNITCOMBAT_CARGO' WHERE Type = 'UNIT_CARGO_SHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
UPDATE Units SET CombatClass = 'UNITCOMBAT_CARAVAN' WHERE Type = 'UNIT_CARAVAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
UPDATE Units SET CombatClass = 'UNITCOMBAT_INQUISITOR' WHERE Type = 'UNIT_INQUISITOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSIONARY' WHERE Type = 'UNIT_MISSIONARY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
