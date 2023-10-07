# Create scoreboards
scoreboard objectives add namedmobdeaths_values dummy
scoreboard objectives add namedmobdeaths_lookup dummy

# Set any values
scoreboard players set #CONST_0 namedmobdeaths_values 0
execute unless score #lookupIndex namedmobdeaths_values >= #CONST_0 namedmobdeaths_values run scoreboard players set #lookupIndex namedmobdeaths_values 0

# Setup the tracking markers initially
function named_mob_deaths:reload_tracking_markers