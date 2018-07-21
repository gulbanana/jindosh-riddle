using System;
using System.Collections.Generic;
using System.Linq;
using Combinatorics.Collections;

namespace jindosh_riddle
{
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
                    var s = new Solution();
                    for (var i = 0; i < 5; i++)
                    {
                        s.Guests[i].Position = positionP[i];
                        s.Guests[i].Name = (GuestName)nameP[i];
                    }

                    if (IsValid(s)) solutions.Add(s);
                }
            }
            
            Console.WriteLine($"{solutions.Count} valid solutions:");
            foreach (var s in solutions)
            {
                Console.WriteLine(new string('-', 80));
                Console.WriteLine(s);
            }
        }

        static bool IsValid(Solution s)
        {
            if (!s.Guests.All(IsValid)) return false;
            return true;
        }

        static bool IsValid(Guest g)
        {
            if (g.Name == GuestName.CountessContee && g.Position != 0) return false;
            return true;
        }
    }
}
