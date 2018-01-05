# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $("a[data-remote]").on "ajax:success", (event) ->
    alert "The article was deleted."

corruption = -4
crime = -4
economy = -4
law = -4
lore = -4
society = -4
spellcasting = 1
danger = -10
baseValue = 50
purchaseLimit = 500
minorItems = "1d4"
mediumItems = "-"
majorItems = "-"
magicItemCatigory = 1

gov_catigory = ->
  pop = $('#population_input').val()
  result = switch
    when pop <= 20 then "thorpe"
    when pop <= 60 then "hamlet"
    when pop <= 200 then "village"
    when pop <= 2000 then "small town"
    when pop <= 5000 then "large town"
    when pop <= 10000 then "small city"
    when pop <= 25000 then "large city"
    else "metropolis"

@updateSettlement = (element) ->
  updateValues()
  $("label[for='dynamic_name_label']").text($('#name_input').val())
  $("label[for='dynamic_population_label']").text($('#population_input').val())
  $("label[for='dynamic_alignment_label']").text($('#alignment_input').val())
  $("label[for='dynamic_government_label']").text($('#government_input').val())
  $("label[for='dynamic_city_catigory_label']").text(gov_catigory())
  $("label[for='corruption']").text(corruption)
  $("label[for='crime']").text(crime)
  $("label[for='economy']").text(economy)
  $("label[for='law']").text(law)
  $("label[for='lore']").text(lore)
  $("label[for='society']").text(society)
  $("label[for='dynamic_danger_label']").text(danger)
  $("label[for='dynamic_base_value_label']").text(baseValue)
  $("label[for='dynamic_purchase_limit_label']").text(purchaseLimit)
  $("label[for='dynamic_minor_items_label']").text(minorItems)
  $("label[for='dynamic_medium_items_label']").text(mediumItems)
  $("label[for='dynamic_major_items_label']").text(majorItems)
  if spellcasting <= 0
    $("label[for='dynamic_spellcasting_label']").text("0")
  else
    $("label[for='dynamic_spellcasting_label']").text(spellcasting)

updateValues = ->
  magicItemCatigory = getCityCatigory()
  updateValuesFromPopulation()
  updateValuesFromGovernment()
  updateValuesFromDisadvantages()
  updateValuesFromQualities()
  updateMagicItems()

getCityCatigory = ->
  pop = $('#population_input').val()
  if pop <= 20
    cat = 1
  else if pop <= 60
    cat = 2
  else if pop <= 200
    cat = 3
  else if pop <= 2000
    cat = 4
  else if pop <= 5000
    cat = 5
  else if pop <= 10000
    cat = 6
  else if pop <= 25000
    cat = 7
  else
    cat = 8

updateValuesFromPopulation = ->
  cat = getCityCatigory()
  val = parseInt(4 / Math.pow(2,8 - cat),10) - parseInt((4 / Math.pow(2,(cat - 1))),10)
  corruption = val
  crime = val
  economy = val
  law = val
  lore = val
  society = val
  if cat <= 1
    danger = -10
    baseValue = 50
    purchaseLimit = 500
    spellcasting = 1
  else if cat is 2
    danger = -5
    baseValue = 200
    purchaseLimit = 1000
    spellcasting = 2
  else if cat is 3
    danger = -0
    baseValue = 500
    purchaseLimit = 2500
    spellcasting = 3
  else if cat is 4
    danger = 0
    baseValue = 1000
    purchaseLimit = 5000
    spellcasting = 4
  else if cat is 5
    danger = 5
    baseValue = 2000
    purchaseLimit = 10000
    spellcasting = 5
  else if cat is 6
    danger = 5
    baseValue = 4000
    purchaseLimit = 25000
    spellcasting = 6
  else if cat is 7
    danger = 10
    baseValue = 8000
    purchaseLimit = 50000
    spellcasting = 7
  else
    danger = 10
    baseValue = 16000
    purchaseLimit = 100000
    spellcasting = 8

updateMagicItems =  ->
  if magicItemCatigory <= 0
    minorItems = "-"
    mediumItems = "-"
    majorItems = "-"
  else if magicItemCatigory is 1
    minorItems = "1d4"
    mediumItems = "-"
    majorItems = "-"
  else if magicItemCatigory is 2
    minorItems = "1d6"
    mediumItems = "-"
    majorItems = "-"
  else if magicItemCatigory is 3
    minorItems = "2d4"
    mediumItems = "1d4"
    majorItems = "-"
  else if magicItemCatigory is 4
    minorItems = "3d4"
    mediumItems = "1d6"
    majorItems = "-"
  else if magicItemCatigory is 5
    minorItems = "3d4"
    mediumItems = "2d4"
    majorItems = "1d4"
  else if magicItemCatigory is 6
    minorItems = "4d4"
    mediumItems = "3d4"
    majorItems = "1d6"
  else if magicItemCatigory is 7
    minorItems = "4d4"
    mediumItems = "3d4"
    majorItems = "2d4"
  else
    minorItems = "nearly all"
    mediumItems = "4d4"
    majorItems = "3d4"


updateValuesFromGovernment = ->
  gov = $('#government_input').val()
  if gov is "Council"
    society = society + 4
    law = law - 2
    lore = lore - 2
  else if gov is "Magical"
    lore = lore + 2
    corruption = corruption - 2
    society = society - 2
    spellcasting = spellcasting + 1
  else if gov is "Overlord"
    corruption = corruption + 2
    law = law + 2
    crime = crime - 2
    society = society - 2
  else if gov is "Secret Syndicate"
    corruption = corruption + 2
    economy = economy + 2
    crime = crime + 2
    law = law - 6

updateValuesFromDisadvantages = ->
  if $('#Anarchy').is(':checked')
    corruption = corruption + 4
    crime = crime + 4
    economy = economy - 4
    society = society - 4
    law = law - 6
    danger = danger + 20
  if $('#Cursed').is(':checked')
    curse = $('#cursed_select').val()
    if curse is "Corruption"
      corruption = corruption - 4
    else if curse is "Crime"
      crime = crime - 4
    else if curse is "Economy"
      economy = economy - 4
    else if curse is "Law"
      law = law - 4
    else if curse is "Lore"
      lore = lore - 4
    else if curse is "Society"
      society = society - 4
  if $('#Heavily_Taxed').is(':checked')
    society = society - 2
    baseValue = baseValue * .9
    purchaseLimit = purchaseLimit / 2
    spellcasting = spellcasting - 2
    magicItemCatigory = magicItemCatigory - 1
  if $('#Hunted').is(':checked')
    economy = economy - 4
    society = society - 4
    law = law - 4
    danger = danger + 20
    baseValue = baseValue * .8
  if $('#Impoverished').is(':checked')
    corruption = corruption + 1
    crime = crime + 1
    baseValue = baseValue / 2
    magicItemCatigory = magicItemCatigory - 2
  if $('#Martial_Law').is(':checked')
    law = law + 2
    corruption = corruption - 4
    crime = crime - 2
    economy = economy - 4
    danger = danger + 10
    purchaseLimit = purchaseLimit / 2
    baseValue = baseValue / 2
    magicItemCatigory = magicItemCatigory - 2
  if $('#Oppressed').is(':checked')
    lore = lore - 6
    society = society - 6
  if $('#Plagued').is(':checked')
    corruption = corruption - 2
    crime = crime - 2
    economy = economy - 2
    law = law - 2
    lore = lore - 2
    society = society - 2
  if $('.disadvantages_checkbox:checked').length > 0
    $("#disadvantages_container").show()
  else
    $("#disadvantages_container").hide()

updateValuesFromQualities = ->
  if $('#Academic').is(':checked')
    lore = lore + 1
    spellcasting = spellcasting + 1
  if $('#Adventure_Site').is(':checked')
    society = society + 2
    purchaseLimit = purchaseLimit * 1.5
  if $('#Artifact_Gatherer').is(':checked')
    economy = economy + 2
    baseValue = baseValue * .5
  if $('#Broad_Minded').is(':checked')
    lore = lore + 1
    society = society + 1
  if $('#Cultured').is(':checked')
    society = society + 1
    law = law - 1
  if $('#Darkvision').is(':checked')
    economy = economy + 1
    crime = crime - 1
  if $('#Deep_Traditions').is(':checked')
    law = law + 2
    society = society - 2
    crime = crime - 2
  if $('#Defiant').is(':checked')
    law = law - 1
    society = society + 1
  if $('#Holy_Site').is(':checked')
    corruption = corruption - 2
    spellcasting = spellcasting + 2
  if $('#Insular').is(':checked')
    law = law + 1
    crime = crime - 1
  if $('#Magically_Attuned').is(':checked')
    baseValue = baseValue * 1.2
    purchaseLimit = purchaseLimit * 1.2
    spellcasting = spellcasting + 2
  if $('#Militarized').is(':checked')
    law = law + 4
    society = society - 4
  if $('#Mythic_Sanctum').is(':checked')
    corruption = corruption - 2
  if $('#No_Questions_Asked').is(':checked')
    society = society + 1
    lore = lore - 1
  if $('#Notorious').is(':checked')
    crime = crime + 1
    danger = danger + 10
    law = law - 1
    baseValue = baseValue * 1.3
    purchaseLimit = purchaseLimit * 1.5
  if $('#Pious').is(':checked')
    spellcasting = spellcasting + 1
  if $('#Prosperous').is(':checked')
    economy = economy + 1
    baseValue = baseValue * 1.3
    purchaseLimit = purchaseLimit * 1.5
  if $('#Restrictive').is(':checked')
    lore = lore - 1
    corruption = corruption - 1
  if $('#Rule_of_Might').is(':checked')
    law = law + 2
    society = society - 2
  if $('#Rumormongering_Citizens').is(':checked')
    lore = lore + 1
    society = society - 1
  if $('#Strategic_Location').is(':checked')
    economy = economy + 1
    baseValue = baseValue * 2
  if $('#Subterranean').is(':checked')
    law = law + 1
    lore = lore - 1
    danger = danger - 5
  if $('#Superstitious').is(':checked')
    law = law - 2
    society = society + 2
    crime = crime - 4
    spellcasting = spellcasting + 2
  if $('#Supportive').is(':checked')
    society = society + 2
  if $('#Timid_Citizens').is(':checked')
    crime = crime + 2
    lore = lore - 2
  if $('#Tourist_Attraction').is(':checked')
    economy = economy + 1
    baseValue = baseValue * 1.2
  if $('#Wealth_Disparity').is(':checked')
    corruption = corruption + 2