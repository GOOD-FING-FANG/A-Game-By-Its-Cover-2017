///generate objects

lettuce_spawn_chance = random_range(1,5000);
lettuce_spawn = lettuce_spawn_chance mod 40;

if (lettuce_spawn < 5)
{
    instance_create(0,320,obj_lettuce);
}
