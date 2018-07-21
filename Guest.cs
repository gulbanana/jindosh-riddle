class Guest
{
    public int Position;
    public GuestName Name;
    public GuestColour Colour;

    public override string ToString() => $"#{Position}: {Name}";
}