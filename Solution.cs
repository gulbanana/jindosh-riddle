using System;
using System.Linq;

class Solution
{
    public readonly Guest[] Guests = new Guest[5];

    public override string ToString() => string.Join(Environment.NewLine, Guests.OrderBy(g => g.Position).Select(g => g.ToString()));
}