///generate objects

spawn_chance = random_range(1,5000);
spawn = spawn_chance mod 40;

if (spawn < 20)
{
    random_spawn = spawn mod 4;
    if(random_spawn < 1) instance_create(0,320,obj_lettuce);
    if(random_spawn >= 1 && random_spawn < 2) instance_create(0,320,obj_tomato);
    if(random_spawn >= 2 && random_spawn < 3) instance_create(0,320,obj_pickle);
    if(random_spawn >= 3 && random_spawn < 4) instance_create(0,320,obj_cheese);
    else instance_create(0,320,obj_onion);
}
