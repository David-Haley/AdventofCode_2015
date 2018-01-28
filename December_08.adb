with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Assertions; use Ada.Assertions;

procedure December_08 is

   Input_File : File_Type;
   Input_Line : Unbounded_String;
   Character_Count : Natural := 0;
   Memory_Count : Natural := 0;
   Extended_Count : Natural := 0;
   Index : Positive;

begin -- December_08
   Open (Input_File, In_File, "20151208.txt");
   while not End_Of_File (input_File) loop
      Input_Line := To_Unbounded_String (Get_Line (Input_File));
      Character_Count := Character_Count + Length (Input_Line);
      Assert (Element (Input_Line, 1) = '"' and
                Element (Input_Line, Length (Input_Line)) = '"',
              "enclosing quotes " & To_String (Input_Line));
      Index := 2;
      while Index < Length (Input_Line) loop
         if Element (Input_Line, Index) = '\' then
            Index := Index + 1;
            if Element (Input_Line, Index) = 'x' then
               Index := Index + 2;
               -- skip next two characters
            end if; -- Element (Input_Line, Index) = 'x'
         end if; -- Element (Input_Line, Index) = '\'
         Memory_Count := Memory_Count + 1;
         Index := Index + 1;
      end loop; -- Index < Length (Input_Line)
      Extended_Count := Extended_Count + 2;
      -- allow for two aditional quotes per line
      for Index in Positive range 1 .. Length (Input_Line) loop
         if Element (Input_Line, Index) = '"' or
           Element (Input_Line, Index) = '\' then
            Extended_Count := Extended_Count + 2;
         else
            Extended_Count := Extended_Count + 1;
         end if; -- escape characters
      end loop; -- Index in Positive range 2 .. Length (Input_Line) - 1
   end loop; -- not End_Of_File (input_File)
   Put_Line ("Character and Memory Count Difference:" &
               Natural'Image (Character_Count - Memory_Count));
   Put_Line ("Extended Character and Character Count Difference:" &
               Natural'Image (Extended_Count - Character_Count));
   Close (Input_File);
end December_08;
