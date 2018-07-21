namespace jindosh_riddle
{
    class Guest
    {
        public int Position;
        public GuestName Name;

        public override string ToString() => $"#{Position}: {Name}";
    }
}