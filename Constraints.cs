using System.Linq;

static class Constraints
{
    public static bool IsValid(Solution s)
    {
        var valid = s.Guests.All(IsValid);

        // green is left of purple
        valid = valid && s.Guests.Single(g => g.Colour == GuestColour.Green).Position <= s.Guests.Single(g => g.Colour == GuestColour.Purple).Position;

        return valid;
    }

    static bool IsValid(Guest g)
    {
        if (g.Name == GuestName.MadamNatsiou && g.Colour != GuestColour.Blue) return false; // natsiou wears blue
        
        // contee is far left, next to a white guest
        if (g.Name == GuestName.CountessContee && g.Position != 0) return false;
        if (g.Name == GuestName.CountessContee && g.Colour == GuestColour.White) return false; 
        if (g.Colour == GuestColour.White && g.Position != 1) return false;

        // traveller from karnaca is dressed in red
        if (g.Origin == GuestOrigin.Karnaca && g.Colour != GuestColour.Red) return false; 
        
        // fraeporter and marcolla both react to the ring
        if (g.Name == GuestName.DoctorMarcolla && g.Origin == GuestOrigin.Fraeport) return false;

        // winslow grew up in baleton
        if (g.Name == GuestName.DoctorMarcolla && g.Origin != GuestOrigin.Baleton) return false;

        return true;
    } 
}