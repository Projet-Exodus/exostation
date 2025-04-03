/client/verb/exo_changelog()
	set name = "Exostation Changelog"
	set category = "OOC"
	if(!GLOB.exo_changelog_tgui)
		GLOB.exo_changelog_tgui = new /datum/exo_changelog()

	GLOB.exo_changelog_tgui.ui_interact(mob)
	if(prefs.last_exo_changelog != GLOB.exo_changelog_hash)
		prefs.last_exo_changelog = GLOB.exo_changelog_hash
		prefs.save_preferences()
		winset(src, "infowindow.changelog", "font-style=;")
