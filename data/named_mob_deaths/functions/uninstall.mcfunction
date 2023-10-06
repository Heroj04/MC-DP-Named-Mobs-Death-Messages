# Kill any tracking markers
kill @e[type=marker,tag=namedmobdeaths_trakingmarker]
# Clear tags on mobs
tag @e remove namedmobdeaths_ready
# Clean up scoreboards
scoreboard objectives remove namedmobdeaths_customnameexists
scoreboard objectives remove namedmobdeaths_variables