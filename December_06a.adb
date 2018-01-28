with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Assertions; use Ada.Assertions;

procedure December_06a is

   Input_File : File_Type;

   subtype Coordinates is Natural range 0 .. 1000;
   type Displays is array (Coordinates, Coordinates) of Natural;
   Display : Displays;

   procedure Process_Line (Input_File : in out File_Type;
                           Display : in out Displays) is

      type Actions is (Turn_On, Turn_Off, Toggle_Light);

      Turn : constant String := "turn";
      Toggle : constant String := "toggle";
      On : constant String := "on";
      Off : constant String := "off";
      Through : constant String := "through";
      Command_Set : constant Character_Set := To_Set (Turn & Toggle);
      State_Set : constant Character_Set := To_Set (On & Off);
      Natural_Set : constant Character_Set := To_Set ("0123456789");
      Through_Set : constant Character_Set := To_Set (Through);
      Action : Actions;

      Input_Line : Unbounded_String;

      First : Positive;
      Start_At : Positive := 1;
      Last : Natural;

      X1, Y1, X2, Y2 : Coordinates;

      procedure Update_Area (X1, Y1, X2, Y2 : in Coordinates;
                             Action : in Actions;
                             Display : in out Displays) is

      begin -- Update_Area
         for Y in Coordinates range Y1 .. Y2 loop
            for X in Coordinates range X1 .. X2 loop
               case Action is
                  when Turn_on =>
                     Display (X, Y) := Display (X, Y) + 1;
                  when Turn_Off =>
                     if Display (X, Y) > 0 then
                        Display (X, Y) := Display (X, Y) - 1;
                     end if; -- Display (X, Y) > 0
                  when Toggle_Light =>
                     Display (X, Y) := Display (X, Y) + 2;
               end case; -- Action
            end loop; -- X in Coordinates range X1 .. X2
         end loop; -- Y in Coordinates range Y1 .. Y2
      end Update_Area;

   begin -- Process_Line
      Input_Line := To_Unbounded_String (Get_Line (Input_File));
      Find_Token (Input_Line, Command_Set, Start_At, Inside, First, Last);
      if Slice (Input_Line, First, Last) = Turn then
         Start_At := Last + 1;
         Find_Token (Input_Line, State_Set, Start_At, Inside, First, Last);
         if Slice (Input_Line, First, Last) = On then
            Action := Turn_On;
         elsif Slice (Input_Line, First, Last) = Off then
            Action := Turn_Off;
         else
            Assert (False, "Unknown State " & Slice (Input_Line, First, Last));
         end if; -- State
      elsif Slice (Input_Line, First, Last) = Toggle then
         Action := Toggle_Light;
      else
         Assert (False, "Unkmown Command " & Slice (Input_Line, First, Last));
      end if; -- Command
      Start_At := Last + 1;
      Find_Token (Input_Line, Natural_Set, Start_At, Inside, First, Last);
      X1 := Coordinates'Value (Slice (Input_Line, First, Last));
      Start_At := Last + 1;
      Find_Token (Input_Line, Natural_Set, Start_At, Inside, First, Last);
      Y1 := Coordinates'Value (Slice (Input_Line, First, Last));
      Start_At := Last + 1;
      Find_Token (Input_Line, Through_Set, Start_At, Inside, First, Last);
      Assert (Slice (Input_Line, First, Last) = Through, "Expected " & Through &
                "and found" & Slice (Input_Line, First, Last));
      Start_At := Last + 1;
      Find_Token (Input_Line, Natural_Set, Start_At, Inside, First, Last);
      X2 := Coordinates'Value (Slice (Input_Line, First, Last));
      Start_At := Last + 1;
      Find_Token (Input_Line, Natural_Set, Start_At, Inside, First, Last);
      Y2 := Coordinates'Value (Slice (Input_Line, First, Last));
      Update_Area (X1, Y1, X2, Y2, Action, Display);
   end Process_Line;

   function Total_Brightness (Display : in Displays) return Natural is

      Result : Natural := 0;

   begin -- Total_Brightness
      for Y in Coordinates loop
         for X in Coordinates loop
            Result := Result + Display (X, Y);
         end loop; -- X in Coordinates
      end loop; -- Y in Coordinates
      return Result;
   end Total_Brightness;

begin -- December_06a
   Open (Input_File, In_File, "20151206.txt");
   Display := (others => (others => 0));
   while not End_Of_File (input_File) loop
      Process_Line (Input_File, Display);
   end loop; -- not End_Of_File (input_File)
   Put_Line ("total Brightness:" & Natural'Image (Total_Brightness (Display)));
   Close (Input_File);
end December_06a;
