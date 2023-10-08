# Death Trigger
# Add and test trigger
execute as @e[type=area_effect_cloud,tag=namedmobdeaths_trackingmarker] run function named_mob_deaths:test_death_trigger

# Update all tracked mobs
function named_mob_deaths:reload_tracking_markers