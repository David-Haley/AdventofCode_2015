with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure December_03 is

   Input_File : File_Type;
   Input_Text : Unbounded_String;

   Grid_Limit : constant Integer := 2000;
   subtype Coordinates is Integer range -Grid_Limit .. Grid_Limit;
   type Grids is array (Coordinates, Coordinates) of Boolean;
   Grid : Grids;
   Santa_X, Santa_Y, Robo_X, Robo_Y : Coordinates;

   House_Count : Natural;

   procedure Move (Index : in Positive; X, Y : in out Coordinates;
                  Grid : in out Grids) is

   begin -- Move
      case Element (Input_Text, Index) is
         when '^' =>
            Y := Y + 1;
         when '>' =>
            X := X + 1;
         when 'v' =>
            Y := Y - 1;
         when '<' =>
            X := X - 1;
         when others =>
            Put_Line ("Unexpected character: " &  Element (Input_Text, Index));
      end case; -- Element (Input_Text, Index)
      Grid (X, Y) := True;
   end Move;

begin -- December_03
   Open (Input_File, In_File, "20151203.txt");
   Input_Text := To_Unbounded_String (Get_Line (Input_File));
   Close (Input_File);
   Santa_X := 0;
   Santa_Y := 0;
   Grid := ( others => (others => False));
   Grid (0, 0) := True; -- delivered to starting point
   For Index in Positive range 1 .. Length (Input_Text) loop
      Move (Index, Santa_X, Santa_Y, Grid);
   end loop; -- Index in Positive range 1 .. Length (Input_Text)
   House_Count := 0;
   for X in Coordinates loop
      for Y in Coordinates loop
         if Grid (X, Y) then
            House_Count := House_Count + 1;
         end if; -- Grid (X, Y)
      end loop; -- Y in Coordinates
   end loop; -- X in Coordinates
   Put_Line ("House Count (Santa only):" & Integer'Image (House_Count));
   Santa_X := 0;
   Santa_Y := 0;
   Robo_X := 0;
   Robo_Y := 0;
   Grid := ( others => (others => False));
   Grid (0, 0) := True; -- delivered to starting point
   For Index in Positive range 1 .. Length (Input_Text) loop
      if Index mod 2 = 0 then
         Move (Index, Robo_X, Robo_Y, Grid);
      else
         Move (Index, Santa_X, Santa_Y, Grid);
      end if; -- Index mod 2 = 0
   end loop; -- Index in Positive range 1 .. Length (Input_Text)
   House_Count := 0;
   for X in Coordinates loop
      for Y in Coordinates loop
         if Grid (X, Y) then
            House_Count := House_Count + 1;
         end if; -- Grid (X, Y)
      end loop; -- Y in Coordinates
   end loop; -- X in Coordinates
   Put_Line ("House Count (Santa and Robo Santa):" & Integer'Image (House_Count));
end December_03;
