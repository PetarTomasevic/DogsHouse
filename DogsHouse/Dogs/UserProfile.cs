using System;
using System.Collections.Generic;

namespace DogsHouse.Dogs;

public partial class UserProfile
{
    public int Id { get; set; }

    public string UserName { get; set; } = null!;

    public string UserAddress { get; set; } = null!;

    public string LoginProfileId { get; set; } = null!;

    public bool? IsBreeder { get; set; }

    public bool? IsOwner { get; set; }

    public virtual ICollection<Dog> DogBreeders { get; } = new List<Dog>();

    public virtual ICollection<Dog> DogOwners { get; } = new List<Dog>();

    public virtual AspNetUser LoginProfile { get; set; } = null!;
}
