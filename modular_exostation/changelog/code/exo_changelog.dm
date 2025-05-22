GLOBAL_DATUM(exo_changelog_tgui, /datum/exo_changelog)
GLOBAL_VAR_INIT(exo_changelog_hash, "")

/datum/exo_changelog
	var/static/list/exo_changelog_items = list()

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
	var/list/data = list( "dates" = list() )
	var/regex/ymlRegex = regex(@"\.yml", "g")

	for(var/archive_file in sort_list(flist("modular_exostation/changelogs/archive/")))
		var/archive_date = ymlRegex.Replace(archive_file, "")
		data["dates"] = list(archive_date) + data["dates"]

	return data


/// CHANGELOG VERB ///

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

/// EXO CHANGELOG ITEM ASSET ///

/datum/asset/exo_changelog_item
	_abstract = /datum/asset/exo_changelog_item
	var/item_filename

/datum/asset/exo_changelog_item/New(date)
	item_filename = SANITIZE_FILENAME("[date].yml")
	SSassets.transport.register_asset(item_filename, file("modular_exostation/changelogs/archive/" + item_filename))

/datum/asset/exo_changelog_item/send(client)
	if (!item_filename)
		return
	. = SSassets.transport.send_assets(client, item_filename)

/datum/asset/exo_changelog_item/get_url_mappings()
	if (!item_filename)
		return
	. = list("[item_filename]" = SSassets.transport.get_asset_url(item_filename))
