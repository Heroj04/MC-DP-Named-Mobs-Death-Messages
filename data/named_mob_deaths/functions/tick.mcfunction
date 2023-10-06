# Death Trigger
# Create trigger
tag @e[type=marker,tag=namedmobdeaths_trakingmarker] add namedmobdeaths_trigger
# Remove trigger if entity still exists
execute as @e[type=#named_mob_deaths:mobs,tag=namedmobdeaths_ready] on passengers if entity @s[type=marker,tag=namedmobdeaths_trakingmarker] run tag @s remove namedmobdeaths_trigger
# Execute Trigger
execute as @e[type=marker,tag=namedmobdeaths_trigger] run function named_mob_deaths:death_trigger

# Check Reload Delay
# Increase tickCount
scoreboard players add #tickCount namedmobdeaths_variables 1
# Run reload if tickCount is high enough
execute if score #tickCount namedmobdeaths_variables >= #reloadDelay namedmobdeaths_variables run function named_mob_deaths:reload_tracking_markers