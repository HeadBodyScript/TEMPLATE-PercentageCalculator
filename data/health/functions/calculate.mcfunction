# Sets the bossbar max and value based on player data
execute store result bossbar minecraft:health max run attribute @s minecraft:generic.max_health get
execute store result bossbar minecraft:health value run data get entity @s Health

# Stores the players current and max health in scoreboards
execute store result score @s Health.Current run data get entity @s Health
execute store result score @s Health.Max run attribute @s minecraft:generic.max_health get

# this calculates the % percentage health
scoreboard players set @s Percentage 100
scoreboard players operation @s Visual = @s Health.Current
scoreboard players operation @s Visual *= @s Percentage
scoreboard players operation @s Percentage = @s Health.Max
scoreboard players operation @s Visual /= @s Percentage

# Updates the name of the bossbar based on the players health (curent health / max health)
bossbar set minecraft:health name ["",{"score":{"name":"@s","objective":"Health.Current"}},{"text":" / "},{"score":{"name":"@s","objective":"Health.Max"}}]

# Not important
item replace entity @s container.0 with minecraft:potion{CustomPotionEffects:[{Id:7,Duration:-1,ShowParticles:0b}],CustomPotionColor:0,display:{Name:"\"Instant Damage\"",Lore:["\"Take damage to see the Boss bar update and % do down or up based on your health\""]}}
item replace entity @s container.1 with minecraft:potion{CustomPotionEffects:[{Id:6,Duration:-1,ShowParticles:0b}],CustomPotionColor:16720959,display:{Name:"\"Instant Health\"",Lore:["\"Heal to see the Boss bar update and % do down or up based on your health\""]}}
item replace entity @s container.2 with minecraft:potion{CustomPotionEffects:[{Id:21,Duration:600,ShowParticles:0b}],CustomPotionColor:16056508,display:{Name:"\"Health boost\"",Lore:["\"Gain bonus health to see the Boss bar update and % do down or up based on your health\""]}}
item replace entity @s container.8 with minecraft:milk_bucket
