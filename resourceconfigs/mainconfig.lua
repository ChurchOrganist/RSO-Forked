require("resourceconfigs.vanilla")  -- vanilla ore/liquids (no enemies)
require("resourceconfigs.vanilla_enemies")
require("resourceconfigs.roadworks")
require("resourceconfigs.dytech")
require("resourceconfigs.bobores")
require("resourceconfigs.bobenemies")
require("resourceconfigs.peacemod")
require("resourceconfigs.yuoki_industries")
require("resourceconfigs.replicators")
require("resourceconfigs.uraniumpower")
require("resourceconfigs.homeworld")
require("resourceconfigs.groundsulfur")
require("resourceconfigs.evolution")
require("resourceconfigs.replicators")
require("resourceconfigs.darkmatter")
require("resourceconfigs.springwater")
require("resourceconfigs.sulfuricacid")
require("resourceconfigs.naturalgas")
require("resourceconfigs.deepores")
require("resourceconfigs.angelsores")
require("resourceconfigs.hardcrafting")
require("resourceconfigs.5dimores")
require("resourceconfigs.thunderstone")
require("resourceconfigs.reactor")
require("resourceconfigs.narmod")
require("resourceconfigs.alienwall")
require("resourceconfigs.senpais")
require("resourceconfigs.beyond")
require("resourceconfigs.andrew")
require("resourceconfigs.bukket")
require("resourceconfigs.infinium")
require("resourceconfigs.anonymods")
require("resourceconfigs.sulfurmod")
require("resourceconfigs.primordialooze")
require("resourceconfigs.omnimatter")
require("resourceconfigs.portalresearch")
require("resourceconfigs.sigmaonenuclear")
require("resourceconfigs.xander")
require("resourceconfigs.darkstar")
require("resourceconfigs.dyworld")
require("resourceconfigs.pyfusion")
require("resourceconfigs.druglab")
require("resourceconfigs.hydraulicpumpjacks")
require("resourceconfigs.napus")
require("resourceconfigs.fpp")
require("resourceconfigs.iceore")
require("resourceconfigs.clownsores")
require("resourceconfigs.liquidscience")
require("resourceconfigs.pycoal")
require("resourceconfigs.pyhightech")
require("resourceconfigs.cncssulfur")
require("resourceconfigs.dp77sulfur")
require("resourceconfigs.allminable")
-- require("resourceconfigs.yaiom")

function loadResourceConfig()
	
	local config={}
	
	fillVanillaConfig(config)
	
	--[[ MODS SUPPORT ]]--
	if game.active_mods["fpp"] then
		fillFppConfig(config)
	end
	
	if not game.entity_prototypes["alien-ore"] or useEnemiesInPeaceMod then  -- if the user has peacemod installed he probably doesn't want that RSO spawns them either. remote.interfaces["peacemod"]
		if game.entity_prototypes["bob-big-explosive-worm-turret"] and game.entity_prototypes["bob-big-fire-worm-turret"] and game.entity_prototypes["bob-big-poison-worm-turret"] then
			fillBobEnemies(config)
		else
			fillEnemies(config)
		end
	end
	
	-- Roadworks mod
	if game.entity_prototypes["RW_limestone"] then
		fillRoadworksConfig(config)
	end
	
	-- DyTech
	-- i moved everything even the checks there, i think it's cleaner this way
	fillDytechConfig(config)
	
	-- Andrew's mods (ores)
	if game.active_mods["andrew-ore"] then
		fillAndrewConfig(config)
	end
	
	if game.entity_prototypes["natural-gas"] then
		fillNaturalGasConfig(config)
	end

	-- BobOres
	if game.active_mods["bobores"] then
		fillBoboresConfig(config)
	elseif game.active_mods["5dim_ores"] then
		fill5dimConfig(config)
	end
	
	-- peace mod
	if game.entity_prototypes["alien-ore"] then
		fillPeaceConfig(config)
	end  
	
	--yuoki industries mod
	if game.entity_prototypes["y-res1"] then
		fillYuokiConfig(config)
	end
	
	--replicators mod
	if game.entity_prototypes["rare-earth"] then
		fillReplicatorsConfig(config)
	end
	
	--uranium power mod
	if game.entity_prototypes["uraninite"] then
		fillUraniumpowerConfig(config)
	end

	-- ground sulfur, need to check for autoplace since bob's mods use same ore name
	if game.entity_prototypes["sulfur"] and game.entity_prototypes["sulfur"].autoplace_specification ~= nil then
		fillGroundSulfurConfig(config)
	end
	
	-- evolution
	if game.entity_prototypes["alien-artifacts"] then
		fillEvolutionConfig(config)
	end
	
	-- replicators
	if game.entity_prototypes["creatine"] then
		fillReplicatorsConfig(config)
	end
	
	-- homeworld
	if game.entity_prototypes["sand-source"] then
		fillHomeworldConfig(config)
	end
	
	-- dark matter replicators
	if game.entity_prototypes["tenemut"] then
		fillDarkMatterConfig(config)
	end

	-- spring water
	if game.entity_prototypes["spring-water"] then
		fillSpringWaterConfig(config)
	end
	
	-- sulfruric acid
	if game.entity_prototypes["sulfuric-acid"] then
		fillSulfuricAcidConfig(config)
	end

	-- deep ores
	if game.entity_prototypes["deep-copper-ore"] and game.entity_prototypes["deep-iron-ore"] then
		fillDeepOresConfig(config)
	end
	
	-- hard crafting
	if game.entity_prototypes["rich-copper-ore"] then
		if game.active_mods["BukketMod"] then
			fillBukketConfig(config)
		else
			fillHardCraftingConfig(config)
		end
	end
	
	-- angels ores
	if game.entity_prototypes["angels-ore1"] then
		fillAngelsOresConfig(config)
		-- remove no longer needed ores
		config["copper-ore"] = nil
		config["iron-ore"] = nil
		config["stone"] = nil
	end
	
	if game.entity_prototypes["monazite-ore"] then
		fillThunderStoneConfig(config)
	end
	
	if game.entity_prototypes["nuclear-ores"] then
--		fillReactorConfig(config)
	end
	
	-- NARMod
	if game.entity_prototypes["brine-pool"] then
		fillNARModConfig(config)
	end
	
	if game.entity_prototypes["alien-biomass"] then
		fillAlienWallConfig(config)
	end
	
	if game.active_mods["SenpaisOverhall"] then
		fillSenpaisConfig(config)
	end
	
	if game.active_mods["Beyond"] then
		fillBeyondConfig(config)
	end
	
	if game.active_mods["infinium-ore"] then
		fillInfiniumConfig(config)
	end

	if game.active_mods["AnonyMods"] then
		fillAnonyModsConfig(config)
	end

	if game.active_mods["cncs_Sulfur_Mod"] then
		fillSulfurConfig(config)
	end
	
	if game.active_mods["PrimordialOoze"] then
		fillPrimordialOozeConfig(config)
	end

	if game.active_mods["omnimatter"] then
		fillOmnimatterConfig(config)
	end

	if game.active_mods["portal-research"] then
		fillPortalResearchConfig(config)
	end

	if game.active_mods["SigmaOne_Nuclear"] then
		fillSigmaOneNuclearConfig(config)
	end

	if game.active_mods["xander-mod"] then
		fillXanderConfig(config)
	end

	if game.active_mods["Darkstar_utilities"] or game.active_mods["Darkstar_utilities_Low_Spec"] then
		fillDarkstarConfig(config)
	end

	if game.active_mods["DyWorld"] then
		fillDyWorldConfig(config)
	end

	if game.active_mods["pyfusionenergy"] then
		fillPyFusionConfig(config)
	end

	if game.active_mods["druglab"] then
		fillDrugLabConfig(config)
	end

	if game.active_mods["HydraulicPumpjacks"] then
		fillHydraulicPumpjacksConfig(config)
	end
	
	if game.active_mods["NapusMod"] then
		fillNapusConfig(config)
	end
	
	if game.active_mods["IceOre"] then
		fillIceOreConfig(config)
	end

	if game.active_mods["Clowns-Extended-Minerals"] then
		fillClownsMineralsConfig(config)
	end

	if game.active_mods["liquid-science"] then
		fillLiquidScienceConfig(config)
	end

	if game.active_mods["pycoalprocessing"] then
		fillPyCoalConfig(config)
	end

	if game.active_mods["pyhightech"] then
		fillPyHighTechConfig(config)
	end

	if game.active_mods["cncs_Sulfur_Mod"] then
		fillCncsSulfurConfig(config)
	end

	if game.active_mods["Dp77s-Sulfur-Mod"] then
		fillDp77SulfurConfig(config)
	end
	
	if game.active_mods["AllMinable"] then
		fillAllMinableConfig(config)
	end

	if game.active_mods["yaiom"] then
--		fillYaiomConfig(config)
	end

	return config
end