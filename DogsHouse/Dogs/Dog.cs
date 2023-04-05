using System;
using System.Collections.Generic;

namespace DogsHouse.Dogs;

public partial class Dog
{
    public int Id { get; set; }

    public string? Gender { get; set; }

    public string? Microchip { get; set; }

    public string? BrojRodovnika { get; set; }

    public string? Name { get; set; }

    public int? OwnerId { get; set; }

    public int? BreederId { get; set; }

    public virtual UserProfile? Breeder { get; set; }

    public virtual UserProfile? Owner { get; set; }
}
