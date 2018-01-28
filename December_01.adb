with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure December_01 is

Input_File : File_Type;
Input_Text : Unbounded_String;
   Sum : Integer := 0;
   First_Time_in_Basment : Boolean := True;
   First_Basment_Entry : Positive;

begin -- December_01
   Open (Input_File, In_File, "20151201.txt");
     Input_Text := To_Unbounded_String (Get_Line (Input_File));
   Close (Input_File);
   for Index in Positive range 1 .. Length (Input_Text) loop
      if Element (Input_Text, Index) = '(' then
         Sum := Sum + 1;
      elsif Element (Input_Text, Index) = ')' then
         Sum := Sum - 1;
      end if;
      if Sum = -1 and First_Time_in_Basment then
         First_Basment_Entry := Index;
         First_Time_in_Basment := False;
      end if; -- Sum = -1 and First_Time_in_Basment
   end loop;
   Put_Line ("Floor:" & Integer'Image (Sum));
   Put_Line ("First Basment Entry:" & Positive'Image (First_Basment_Entry));
end December_01;
