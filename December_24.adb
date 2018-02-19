with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Generic_Constrained_Array_Sort;
with Ada.Assertions; use Ada.Assertions;
with Interfaces; use Interfaces;

procedure December_24 is

   Required_Weight, Total_Weight : Natural;

   subtype Present_Indices is Natural range 0 .. 28; -- 20 Presents
   subtype Present_Counts is Natural range 0 .. Present_Indices'Last +  1;

   Minimum_Presents : Present_Counts;
   Minimum_Entanglement : array (Present_Counts) of Unsigned_64 :=
     (others => Unsigned_64'Last);

   type Presents is record
      Weight : Natural;
      Packed : Boolean := False;
   end record; -- Presents

   Type Present_Lists is array (Present_Indices) of Presents;

   Present_List : Present_Lists;

   function "<" (Left, Right : Presents) return Boolean is

   begin -- "<"
      return Left.Weight < Right.Weight;
   end "<";

   procedure Sort is new Ada.Containers.Generic_Constrained_Array_Sort
     (Present_Indices, Presents, Present_Lists);

   procedure Read_Presents (Present_List : in out Present_Lists) is

      Input_File : File_Type;

   begin -- Read_Presents
      Open (Input_File, In_File, "20151224.txt");
      for I in Present_Indices loop
         Present_List (i).Weight := Natural'Value (Get_Line (Input_File));
      end loop; --End_Of_File (Input_File)
      Close (Input_File);
      Sort (Present_List);
   end Read_Presents;

   procedure Store_Solution (Present_Count : in Present_Counts;
                             Quantum_Entanglement : in Unsigned_64) is

   begin -- Store_Solution
      if Present_Count < Minimum_Presents then
         Minimum_Presents := Present_Count;
      end if; -- Present_Count < Minimum_Presents
      if Quantum_Entanglement < Minimum_Entanglement (Present_Count) then
         Minimum_Entanglement (Present_Count) := Quantum_Entanglement;
      end if; -- Quantum_Entanglement < Minimum_Entanglement (Present_Count)
   end Store_Solution;

   procedure Next_Present (Present_List : in out Present_Lists;
                           Current : in Present_Indices;
                           Packed_Weight : in Natural;
                           Packed_Presents : in Present_Counts;
                           Quantum_Entanglement : in Unsigned_64) is

   begin -- Next_Present
      Present_List (Current).Packed := True;
      if Packed_Weight + Present_List (Current).Weight < Required_Weight then
         for I in reverse Present_Indices range
           Present_Indices'First .. Current loop
            if not Present_List (I).Packed  then
               Next_Present (Present_List, I,
                             Packed_Weight + Present_List (Current).Weight,
                             Packed_Presents + 1,
                             Quantum_Entanglement *
                               Unsigned_64 (Present_List (Current).Weight));
            end if; -- not Present_List (I).Packed
         end loop; -- iterate over Present list
      elsif Packed_Weight + Present_List (Current).Weight = Required_Weight then
         -- Solution found
         Store_Solution (Packed_Presents, Quantum_Entanglement *
                           Unsigned_64 (Present_List (Current).Weight));
      end if; -- test remaining Weight
      Present_List (Current).Packed := False;
   end Next_Present;

begin -- December_24
   Read_Presents (Present_List);
   Total_Weight := 0;
   for I in Present_Indices loop
      Total_Weight := Total_Weight + Present_List (I).Weight;
   end loop; -- I in Present_Indices
   Required_Weight := Total_Weight / 3;
   Minimum_Entanglement := (others => Unsigned_64'Last);
   Minimum_Presents := Present_Counts'Last;
   for I in reverse Present_Indices loop
      Next_Present (Present_List, I, 0, 1, 1);
   end loop; -- I in reverse Present_List.Iterate
   for I in Present_Indices loop
      if Minimum_Entanglement (I) < Unsigned_64'Last then
         Put_Line ("Quantum Entanglement:" &
                     Unsigned_64'Image (Minimum_Entanglement (I)));
         exit;
      end if; -- Minimum_Entanglement (I) < Unsigned_64'Last
   end loop; -- I in Present_Indices
   -- Part Two
   Required_Weight := Total_Weight / 4;
   Minimum_Entanglement := (others => Unsigned_64'Last);
   Minimum_Presents := Present_Counts'Last;
   for I in reverse Present_Indices loop
      Next_Present (Present_List, I, 0, 1, 1);
   end loop; -- I in reverse Present_List.Iterate
   for I in Present_Indices loop
      if Minimum_Entanglement (I) < Unsigned_64'Last then
         Put_Line ("Quantum Entanglement (Part 2):" &
                     Unsigned_64'Image (Minimum_Entanglement (I)));
         exit;
      end if; -- Minimum_Entanglement (I) < Unsigned_64'Last
   end loop; -- I in Present_Indices
end December_24;
