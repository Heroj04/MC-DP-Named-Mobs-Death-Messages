# run as each tracking marker

# Get the lookup index
execute store result score #searchLookupIndex namedmobdeaths_values run scoreboard players get @s namedmobdeaths_lookup

# Add the trigger if the tracked entity does not exist
execute as @e[tag=namedmobdeaths_ready] if score @s namedmobdeaths_lookup = #searchLookupIndex namedmobdeaths_values run scoreboard players set #mobAlive namedmobdeaths_values 1
execute if score #mobAlive namedmobdeaths_values = #CONST_0 namedmobdeaths_values run tag @s add namedmobdeaths_trigger

# Reset mobAlive check
scoreboard players set #mobAlive namedmobdeaths_values 0

# Update the name field if the mob does exist
execute as @e[tag=namedmobdeaths_ready] if score @s namedmobdeaths_lookup = #searchLookupIndex namedmobdeaths_values run data modify storage named_mob_deaths:storage mobData set from entity @s
execute if entity @s[tag=!namedmobdeaths_trigger] run data modify entity @s data.namedmobdeaths_mobdata set from storage named_mob_deaths:storage mobData

# Execute Trigger
execute if entity @s[tag=namedmobdeaths_trigger] run function named_mob_deaths:death_trigger
