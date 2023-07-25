using System.Collections;
using System.Collections.Generic;

interface FlyableInterface
{
    // Class Variable
    private static string name;
    // Property
    public string Name
    {
        get
        {
            return name;
        }
        set
        {
            name = value;
        }
    }

    void fly();

    public void flyTheSky(string name)
    {
        Name = name;
    }
}
