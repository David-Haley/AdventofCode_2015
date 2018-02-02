with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Assertions; use Ada.Assertions;

procedure December_18 is

   subtype Coordinates is Natural range 1 .. 100;
   type Displays is array (Coordinates, Coordinates) of Boolean;
   Current_Display, Next_Display : Displays;

   subtype Lamp_Counts is Natural range 0 .. Coordinates'Last ** 2;

   procedure Read_Display (Display : out Displays) is

      Input_File : File_Type;

      Light : Character;

   begin -- Read_Display
      Open (Input_File, In_File, "20151218.txt");
      for Y in Coordinates loop
         for X in Coordinates loop
            Get (Input_File, Light);
            if Light = '#' then
               Display (X, Y) := True;
            else
               Display (X, Y) := False;
            end if; -- Light = '#'
         end loop; --X in Coordinates
         Skip_Line (Input_File);
      end loop; --Y in Coordinates
      Close (Input_File);
   end Read_Display;

   procedure Update_Display (Current_Display : in Displays;
                             Next_Display : out Displays) is

      subtype Neighbour_Counts is Natural range 0 .. 8;

      function Lit_Neighbours (X, Y : in Coordinates) return Neighbour_Counts is

         Count : Neighbour_Counts := 0;

      begin -- Lit_Neighbours
         if Y + 1 <= Coordinates'Last then
            if X - 1 >= Coordinates'First and then
              Current_Display (X - 1, Y + 1) then
               Count := Count + 1;
            end if;
            if Current_Display (X, Y + 1) then
               Count := Count + 1;
            end if;
            if X + 1 <= Coordinates'Last and then
              Current_Display (X + 1, Y + 1) then
               Count := Count + 1;
            end if;
         end if; --  Y + 1 <= Coordinates'Last
         if X - 1 >= Coordinates'First and then
           Current_Display (X - 1, Y) then
            Count := Count + 1;
         end if;
         if X + 1 <= Coordinates'Last and then
           Current_Display (X + 1, Y) then
            Count := Count + 1;
         end if;
         if Y - 1 >= Coordinates'First then
            if X - 1 >= Coordinates'First and then
              Current_Display (X - 1, Y - 1) then
               Count := Count + 1;
            end if;
            if Current_Display (X, Y - 1) then
               Count := Count + 1;
            end if;
            if X + 1 <= Coordinates'Last and then
              Current_Display (X + 1, Y - 1) then
               Count := Count + 1;
            end if;
         end if; -- Y - 1 >= Coordinates'First
         return Count;
      end Lit_Neighbours;

   begin -- Update_Display
      for Y in Coordinates loop
         for X in Coordinates loop
            if Current_Display (X, Y) then
               if Lit_Neighbours (X, Y) = 2 or Lit_Neighbours (X, Y) = 3 then
                  Next_Display (X, Y) := True;
               else
                  Next_Display (X, Y) := False;
               end if; -- Lit_Neighbours (X, Y) = 2 or Lit_Neighbours (X, Y) = 3
            else
               if Lit_Neighbours (X, Y) = 3 then
                  Next_Display (X, Y) := True;
               else
                  Next_Display (X, Y) := False;
               end if; -- Lit_Neighbours (X, Y) = 2 or Lit_Neighbours (X, Y) = 3
            end if; -- Current_Display (X, Y)
         end loop; --X in Coordinates
      end loop; --Y in Coordinates
   end Update_Display;

   function Lit_Count (Display : in Displays) return Lamp_Counts is

      Count : Lamp_Counts := 0;

   begin -- Lit_Count
      for Y in Coordinates loop
         for X in Coordinates loop
            if Display (X, Y) then
               Count := Count + 1;
            end if; -- Light = '#'
         end loop; --X in Coordinates
      end loop; --Y in Coordinates
      Return Count;
   end  Lit_Count;

   procedure Stuck_Corners (Display : in out Displays) is

   begin -- Stuck_Corners
      Display (Coordinates'First, Coordinates'First) := True;
      Display (Coordinates'Last, Coordinates'First) := True;
      Display (Coordinates'First, Coordinates'Last) := True;
      Display (Coordinates'Last, Coordinates'Last) := True;
   end Stuck_Corners;

begin -- December_18
   Read_Display (Current_Display);
   for I in Positive range 1 .. 100 loop
      Update_Display (Current_Display, Next_Display);
      Current_Display := Next_Display;
   end loop; -- I in Positive range 1 .. 100
   Put_Line ("Lights lit:" & Lamp_Counts'Image (Lit_Count (Current_Display)));
   Read_Display (Current_Display);
   Stuck_Corners (Current_Display);
   for I in Positive range 1 .. 100 loop
      Update_Display (Current_Display, Next_Display);
      Stuck_Corners (Next_Display);
      Current_Display := Next_Display;
   end loop; -- I in Positive range 1 .. 100
   Put_Line ("Lights lit (with stuck corners):" & Lamp_Counts'Image (Lit_Count (Current_Display)));
end December_18;
