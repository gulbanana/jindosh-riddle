class Guest
{
    public int Position;
    public GuestName Name;
    public GuestColour Colour;
    public GuestOrigin Origin;

    public override string ToString() => $"#{Position}: {Name} of {Origin}";
}