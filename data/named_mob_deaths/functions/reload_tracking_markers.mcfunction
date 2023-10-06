# Clear old tracking markers
kill @e[type=marker,tag=namedmobdeaths_trakingmarker]
tag @e[tag=namedmobdeaths_ready] remove namedmobdeaths_ready

# Check which mobs have custom names add tracking marker
execute as @e[type=#named_mob_deaths:mobs] store success score @s namedmobdeaths_customnameexists run data get entity @s CustomName
execute as @e[type=#named_mob_deaths:mobs,scores={namedmobdeaths_customnameexists=1}] if entity @s[tag=!namedmobdeaths_ready] at @s anchored eyes run function named_mob_deaths:add_traking_marker

# Set the tickCount to 0
scoreboard players set #tickCount namedmobdeaths_variables 0