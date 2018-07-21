using System;
using System.Collections.Generic;
using System.Linq;
using Combinatorics.Collections;

class Program
{
    // naive search: create all possible solutions, then check them against all the constraints
    static void Main(string[] args)
    {
        var indices = new int[] {0, 1, 2, 3, 4};
        var permutations = new Permutations<int>(indices);

        var solutions = new List<Solution>();

        foreach (var positionP in permutations)
        {
            foreach (var nameP in permutations)
            {
                foreach (var colourP in permutations)
                {
                    var s = new Solution();
                    for (var i = 0; i < 5; i++)
                    {
                        s.Guests[i] = new Guest
                        {
                            Position = positionP[i],
                            Name = (GuestName)nameP[i],
                            Colour = (GuestColour)colourP[i],
                        };
                    }

                    if (Constraints.IsValid(s)) solutions.Add(s);
                }
            }
        }
        
        if (solutions.Count > 0)
        {
            Console.WriteLine($"{solutions.Count} valid solutions.");
        }
        else
        {
            Console.WriteLine(solutions.Single());
        }
    }
}