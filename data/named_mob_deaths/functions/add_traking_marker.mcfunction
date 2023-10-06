# Function run for every entity with CustomName set

# Summon marker entity riding
summon marker ~ ~ ~ {Tags:["namedmobdeaths_trakingmarker","namedmobdeaths_trakingmarker_setup"]}
ride @e[type=marker,tag=namedmobdeaths_trakingmarker_setup,sort=nearest,limit=1] mount @s

# Store the custom name on the marker entity
data modify storage named_mob_deaths:storage name set from entity @s CustomName
execute on passengers if entity @s[type=marker,tag=namedmobdeaths_trakingmarker_setup] run data modify entity @s data.namedmobdeaths_name set from storage named_mob_deaths:storage name
execute on passengers if entity @s[type=marker,tag=namedmobdeaths_trakingmarker_setup] run tag @s remove namedmobdeaths_trakingmarker_setup

# Tag this mob as ready
tag @s add namedmobdeaths_ready