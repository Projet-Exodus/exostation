/datum/modpack/changelog
	name = "Changelog"
	desc = "Changelog pour le développement des fonctionnalités spécifiques à Exostation"
	author = "Thravalgur"

/datum/modpack/changelog/initialize()
	var/latest_exo_changelog = file("[global.config.directory]/../modular_exostation/changelogs/archive/" + time2text(world.timeofday, "YYYY-MM") + ".yml")
	GLOB.exo_changelog_hash = fexists(latest_exo_changelog) ? md5(latest_exo_changelog) : 0
