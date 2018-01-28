with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Assertions; use Ada.Assertions;

procedure December_12 is

   Input_File : File_Type;
   Input_Line : Unbounded_String;

   Integer_Set : constant Character_Set := To_Set ("-0123456789");
   First, Start_At : Positive;
   Last : Natural;
   Total : Integer := 0;

begin -- December_12
   Open (Input_File, In_File, "20151212.txt");
   Input_Line := To_Unbounded_String (Get_Line (Input_File));
   Close (Input_File);
   Start_At := 1;
   loop
      Find_Token (Input_Line, Integer_Set, Start_At, Inside, First, Last);
      If Last > 0 then
         Total := Total + Integer'Value (Slice (Input_Line, First, Last));
         Start_At := Last + 1;
      else
         exit; -- no more numbers
      end if; -- Last > 0
   end loop; -- find numbers
   Put_Line ("Total:" & Integer'Image (Total));
end December_12;
