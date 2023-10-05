summon marker ~ ~ ~ {Tags:["namedmobdeaths_trakingmarker"]}
ride @e[type=marker,tag=namedmobdeaths_trakingmarker,sort=nearest,limit=1] mount @s
#data modify entity @e[type=marker,tag=namedmobdeaths_trakingmarker,distance=..1.5,sort=nearest,limit=1] data.tracking set from entity @s UUID
tag @s add namedmobdeaths_ready