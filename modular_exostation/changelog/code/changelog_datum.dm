GLOBAL_DATUM(exo_changelog_tgui, /datum/exo_changelog)
GLOBAL_VAR_INIT(exo_changelog_hash, "")

/datum/exo_changelog
	/var/static/list/exo_changelog_items = list()

/datum/exo_changelog/ui_state()
	return GLOB.always_state

/datum/exo_changelog/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "ExoChangelog")
		ui.open()

/datum/exo_changelog/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	if(action == "get_month")
		var/datum/asset/exo_changelog_item/exo_changelog_item = exo_changelog_items[params["date"]]
		if (!exo_changelog_item)
			exo_changelog_item = new /datum/asset/exo_changelog_item(params["date"])
			exo_changelog_items[params["date"]] = exo_changelog_item
		return ui.send_asset(exo_changelog_item)

/datum/exo_changelog/ui_static_data()
	var/list/data = list("dates" = list())
	var/static/regex/yml_regex = regex(@"\.yml", "g")

	for(var/archive_file in sort_list(flist("modular_exostation/changelogs/archive/")))
		var/archive_date = yml_regex.Replace(archive_file, "")
		data["dates"] = list(archive_date) + data["dates"]

	return data
