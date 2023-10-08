# run as each tracking marker

# Reset the check score
scoreboard players set #mobAlive namedmobdeaths_values 0

# Add the trigger if the tracked entity does not exist
execute on origin if entity @s run scoreboard players set #mobAlive namedmobdeaths_values 1
execute if score #mobAlive namedmobdeaths_values = #CONST_0 namedmobdeaths_values run tag @s add namedmobdeaths_trigger

# Update the name field if the mob does exist
execute on origin run data modify storage named_mob_deaths:storage CustomName set from entity @s CustomName
execute if entity @s[tag=!namedmobdeaths_trigger] run data modify entity @s CustomName set from storage named_mob_deaths:storage CustomName

# Update the tracking marker position
execute on origin run data modify storage named_mob_deaths:storage CustomName set from entity @s CustomName
execute on origin run data modify storage named_mob_deaths:storage Pos set from entity @s Pos
execute if entity @s[tag=!namedmobdeaths_trigger] run data modify entity @s CustomName set from storage named_mob_deaths:storage CustomName
execute if entity @s[tag=!namedmobdeaths_trigger] run data modify entity @s Pos set from storage named_mob_deaths:storage Pos

# Execute Trigger
execute if entity @s[tag=namedmobdeaths_trigger] run function named_mob_deaths:death_trigger

# Update the cloud age
data modify entity @s Age set value 0