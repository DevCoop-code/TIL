using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MainBird : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        Bird bird = new Bird();
        bird.fly();
        
        // Upscaling 하여 사용할 수 있음 
        FlyableInterface birdInterface = new Bird();
        birdInterface.flyTheSky("hello");
    }
}
