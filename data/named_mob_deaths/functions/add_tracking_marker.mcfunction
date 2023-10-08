# Function run for every entity with CustomName set

# Summon marker
summon area_effect_cloud ~ ~ ~ {Tags:["namedmobdeaths_trackingmarker","namedmobdeaths_trackingmarker_setup"],Duration:2147483647}

# Store the mobs data on the marker entity
data modify entity @e[type=area_effect_cloud,tag=namedmobdeaths_trackingmarker_setup,limit=1] Owner set from entity @s UUID
data modify entity @e[type=area_effect_cloud,tag=namedmobdeaths_trackingmarker_setup,limit=1] CustomName set from entity @s CustomName

# Tag this mob as ready
tag @e[type=area_effect_cloud,tag=namedmobdeaths_trackingmarker_setup] remove namedmobdeaths_trackingmarker_setup
tag @s add namedmobdeaths_ready