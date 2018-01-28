with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Assertions; use Ada.Assertions;

procedure December_10 is

   Input_File : File_Type;

   Current_Call : Unbounded_String;

   function Elves_Call (In_Sequence : in Unbounded_String) return
     Unbounded_String is

      Result : Unbounded_String := Null_Unbounded_String;
      Start_At : Positive := 1;

      function Consecutive_Count (In_Sequence : in Unbounded_String;
                                  Start_At : in Positive) return Positive is
         Count : Natural := 0;
         Index : Positive := Start_At;

      begin -- Consecutive_Count
         while Index <= Length (In_Sequence) and then
           Element (In_Sequence, Start_At) = Element (In_Sequence, Index) loop
            Count := Count + 1;
            Index := Index + 1;
         end loop;
         return Count;
      end Consecutive_Count;

   begin -- Elves_Call
      while Start_At <= Length (In_Sequence) loop
         Result := Result & Delete
           (Positive'Image (Consecutive_Count (In_Sequence, Start_At)), 1, 1) &
           Slice (In_Sequence, Start_At, Start_At);
         Start_At := Start_At + Consecutive_Count (In_Sequence, Start_At);
      end loop; -- Start_At < Length (In_Sequence)
      return Result;
   end Elves_Call;

begin -- December_10
   Open (Input_File, In_File, "20151210.txt");
   Current_Call := To_Unbounded_String (Get_Line (Input_File));
   Close (Input_File);
   Put_Line (To_String (Current_Call));
   for I in Positive range 1 .. 50 loop
      Current_Call := Elves_Call (Current_Call);
      Put_Line ("Length after" & Positive'Image (I) & " iterations:" &
                  Natural'Image (Length (Current_Call)));
   end loop; -- I in Positive range 1 .. 50
end December_10;
