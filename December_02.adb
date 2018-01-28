with Ada.Text_IO; use Ada.Text_IO;
with Ada.Assertions; use Ada.Assertions;

procedure December_02 is

Input_File : File_Type;
   Area, Ribbon_Length : Natural := 0;
   X, Y, Z : Natural;
   X_Char : Character;

   package Natural_IO is new Ada.Text_IO.Integer_IO (Natural); use Natural_IO;

begin -- December_02
   Open (Input_File, In_File, "20151202.txt");
   while not End_Of_File (Input_File) loop
      Get (Input_File, X);
      Get (Input_File, X_Char);
      Assert (X_Char = 'x', "First x was " & X_Char);
      Get (Input_File, Y);
      Get (Input_File, X_Char);
      Assert (X_Char = 'x', "second x was " & X_Char);
      Get (Input_File, Z);
      Skip_Line (Input_File);
      Area := Area + 2 * (X * Y + Y * Z + Z * X);
      -- find smallest area face
      if X * Y <= Y * Z and X * Y <= X * Z then
         Area := Area + X * Y;
      elsif Y * Z <= X * Y and Y * Z <= Z * X then
         Area := Area + Y * Z;
      else
         Area := Area + Z * X;
      end if;
      -- find smallest perimiter face
      if X + Y <= Y + Z and X + Y <= X + Z then
         Ribbon_Length := Ribbon_Length + 2 * (X + Y);
      elsif Y + Z <= X + Y and Y + Z <= Z + X then
         Ribbon_Length := Ribbon_Length + 2 * (Y + Z);
      else
         Ribbon_Length := Ribbon_Length + 2 * (Z + X);
      end if;
      Ribbon_Length := Ribbon_Length + X * Y * Z;
   end loop;
   Put_Line ("Total Area:" & Natural'Image (Area));
   Put_Line ("Total Ribbon:" & Natural'Image (Ribbon_Length));
   Close (Input_File);
end December_02;
