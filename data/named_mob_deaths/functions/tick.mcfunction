# Check which mobs have custom names
execute as @e[type=#named_mob_deaths:mobs] store success score @s namedmobdeaths_customnameexists run data get entity @s CustomName
execute as @e[type=#named_mob_deaths:mobs,scores={namedmobdeaths_customnameexists=1}] run tag @s add namedmobdeaths_hascustomname

# Create tracking marker
execute as @e[type=#named_mob_deaths:mobs,tag=namedmobdeaths_hascustomname,tag=!namedmobdeaths_ready] at @s anchored eyes run function named_mob_deaths:add_traking_marker

# Update custom name stored in tracking marker
execute as @e[type=#named_mob_deaths:mobs,tag=namedmobdeaths_ready] at @s anchored eyes if entity @e[type=marker,tag=namedmobdeaths_trakingmarker,distance=..1.5] run data modify entity @e[type=marker,tag=namedmobdeaths_trakingmarker,sort=nearest,limit=1] data.namedmobdeaths_name set from entity @s CustomName
#execute as @e[type=#named_mob_deaths:mobs,tag=namedmobdeaths_ready] on passengers if entity @s[type=marker,tag=namedmobdeaths_trakingmarker] run data modify entity @s data.namedmobdeaths_name set from entity @e[type=#named_mob_deaths:mobs,tag=namedmobdeaths_ready,sort=nearest,limit=1] CustomName

# Create trigger
tag @e[type=marker,tag=namedmobdeaths_trakingmarker] add namedmobdeaths_trigger
# Remove trigger if entity still exists
execute as @e[type=#named_mob_deaths:mobs,tag=namedmobdeaths_ready] on passengers if entity @s[type=marker,tag=namedmobdeaths_trakingmarker] run tag @s remove namedmobdeaths_trigger
#execute as @e[type=#named_mob_deaths:mobs,tag=namedmobdeaths_ready] at @s anchored eyes if entity @e[type=marker,tag=namedmobdeaths_trakingmarker,distance=..1.5] run tag @e[type=marker,tag=namedmobdeaths_trakingmarker,distance=..1.5,limit=1] remove namedmobdeaths_trigger

# Execute Trigger
execute as @e[type=marker,tag=namedmobdeaths_trigger] run tellraw @a [{"nbt": "data.namedmobdeaths_name", "entity": "@s", "interpret": true}, " has died!"]
execute as @e[type=marker,tag=namedmobdeaths_trigger] run kill @s
