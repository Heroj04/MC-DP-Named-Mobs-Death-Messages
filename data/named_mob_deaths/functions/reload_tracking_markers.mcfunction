# Check which mobs have custom names add tracking marker
execute as @e[type=#named_mob_deaths:mobs,tag=!namedmobdeaths_ready] if data entity @s CustomName run function named_mob_deaths:add_tracking_marker

# Reset tracking
advancement revoke @a only named_mob_deaths:event_nametag_used