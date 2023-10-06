# Create scoreboards
scoreboard objectives add namedmobdeaths_customnameexists dummy
scoreboard objectives add namedmobdeaths_variables dummy

# Setup Variables
scoreboard players set #tickCount namedmobdeaths_variables 0
scoreboard players set #reloadDelay namedmobdeaths_variables 200

# Setup the tracking markers initially
function named_mob_deaths:reload_tracking_markers