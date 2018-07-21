using System;
using System.Linq;

namespace jindosh_riddle
{
    class Solution
    {
        public readonly Guest[] Guests;

        public Solution()
        {
            Guests = new Guest[5];
            for (var i = 0; i < 5; i++)
            {
                Guests[i] = new Guest();
            }
        }

        public override string ToString() => string.Join(Environment.NewLine, Guests.OrderBy(g => g.Position).Select(g => g.ToString()));
    }
}