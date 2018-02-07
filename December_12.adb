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

   First, Start_At, Resume_At : Positive;
   Last : Natural;
   Total : Integer;

   Integer_Set : Character_Set := To_Set ("-0123456789");

   procedure Process_Text (Input_Line : in Unbounded_String;
                           Start_At : in Positive;
                           Resume_At : out Positive;
                           Total : out Integer) is

      Local_Total : Integer := 0;
      Returned_Total : Integer;
      Index, First : Positive;
      Last : Natural;
      Red_Found : Boolean := False;
      Current_Character : Character;

   begin -- Process_Text
      Index := Start_At;
      while index <= Length (Input_Line) loop
         Current_Character := Element (Input_Line, Index);
         case Current_Character is
            when 'a' .. 'z' | '"' =>
               Find_Token (Input_Line, Letter_Set, Index, Inside, First, Last);
               Red_Found := Red_Found or
                 "red" = Slice (Input_Line, First, Last);
               Assert (Element (Input_Line, Last + 1) = '"',
                       "Letter" & Natural'Image (Last));
               Index := Last + 2; -- skip the '"'
            when '0' .. '9' | '-' =>
               Find_Token (Input_Line, Integer_Set, Index, Inside, First, Last);
               Local_Total := Local_Total +
                 Integer'Value (Slice (Input_Line, First, Last));
               Index := Last + 1;
            when '{' | '[' =>
               if Index = 1 then
                  Index := Index + 1;
               else
                  Returned_Total := 0;
                  Process_Text (Input_Line, Index + 1, Index, Returned_Total);
                  Local_Total := Local_Total + Returned_Total;
               end if; -- Index = 1
            when '}' =>
               if not Red_Found then
                  Total := Local_Total;
               else
                  Total := 0;
               end if; -- not Red_Found
               Resume_At := Index + 1;
               exit;
            when ']' =>
               Total := Local_Total;
               Resume_At := Index + 1;
               exit;
            when others =>
               Assert (Current_Character = ',' or Current_Character = ':',
                       "others" & Positive'Image (Index));
               Index := Index + 1;
         end case; -- Current_Character
      end loop; -- index <= Length (Input_Line)
   end Process_Text;

begin -- December_12
   Open (Input_File, In_File, "20151212.txt");
   Input_Line := To_Unbounded_String (Get_Line (Input_File));
   Close (Input_File);
   Total := 0;
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
   Put_Line ("Total part one (all):" & Integer'Image (Total));
   Total := 0;
   Start_At := 1;
   Process_Text (Input_Line, Start_At, Resume_At, Total);
   Put_Line ("Total part two (not red):" & Integer'Image (Total));
end December_12;
