# Function run for every entity with CustomName set

# Summon marker
summon marker 0 0 0 {Tags:["namedmobdeaths_trakingmarker","namedmobdeaths_trakingmarker_setup"]}

# Store the mobs data on the marker entity
data modify storage named_mob_deaths:storage mobData set from entity @s
execute as @e[type=marker,tag=namedmobdeaths_trakingmarker_setup] run data modify entity @s data.namedmobdeaths_mobdata set from storage named_mob_deaths:storage mobData

# Save and update the lookup index
scoreboard players operation @s namedmobdeaths_lookup = #lookupIndex namedmobdeaths_values
scoreboard players operation @e[type=marker,tag=namedmobdeaths_trakingmarker_setup] namedmobdeaths_lookup = #lookupIndex namedmobdeaths_values
scoreboard players add #lookupIndex namedmobdeaths_values 1

# Tag this mob as ready
execute as @e[type=marker,tag=namedmobdeaths_trakingmarker_setup] run tag @s remove namedmobdeaths_trakingmarker_setup
tag @s add namedmobdeaths_ready