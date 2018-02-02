with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Generic_Constrained_Array_Sort;
with Ada.Assertions; use Ada.Assertions;
with Interfaces; use Interfaces;

procedure December_17 is

   Required_Storage : constant Natural := 150;

   subtype Container_Indices is Natural range 0 .. 19; -- 20 containers
   subtype Container_Counts is Natural range 0 .. Container_Indices'Last +  1;

   type Containers is record
      Capacity : Natural;
      Used : Boolean := False;
   end record; -- Containers

   Type Container_Lists is array (Container_Indices) of Containers;

   Container_List : Container_Lists;

   Solution_Count : Natural;

   function "<" (Left, Right : Containers) return Boolean is

   begin -- "<"
      return Left.Capacity < Right.Capacity;
   end "<";

   procedure Sort is new Ada.Containers.Generic_Constrained_Array_Sort
     (Container_Indices, Containers, Container_Lists);

   procedure Read_Containers (Container_List : in out Container_Lists) is

      Input_File : File_Type;

   begin -- Read_Containers
      Open (Input_File, In_File, "20151217.txt");
      for I in Container_Indices loop
         Container_List (i).Capacity := Natural'Value (Get_Line (Input_File));
      end loop; --End_Of_File (Input_File)
      Close (Input_File);
      Sort (Container_List);
   end Read_Containers;

   procedure Store_Solution is

   begin -- Store_Solution
      Solution_Count := Solution_Count + 1;
   end Store_Solution;

   procedure Next_Container (Container_List : in out Container_Lists;
                             Current : in Container_Indices;
                             Stored_Eggnog : in Natural;
                             Remaining_Containers : in Container_Counts) is

   begin -- Next_Container
      Container_List (Current).Used := True;
      if  Remaining_Containers > 1  and then
        Stored_Eggnog + Container_List (Current).Capacity <
        Required_Storage then
         for I in reverse Container_Indices range
           Container_Indices'First .. Current loop
            if not Container_List (I).Used  then
               Next_Container (Container_List, I,
                               Stored_Eggnog +
                                 Container_List (Current).Capacity,
                               Remaining_Containers - 1);
            end if; -- not Container_List (I).Used
         end loop; -- iterate over container list
      elsif Stored_Eggnog + Container_List (Current).Capacity =
        Required_Storage then
         -- Solution found
         Store_Solution;
      end if; -- test remaining capacity
      Container_List (Current).Used := False;
   end Next_Container;

begin -- December_17
   Read_Containers (Container_List);
   Solution_Count := 0;
   for I in reverse Container_Indices loop
      Next_Container (Container_List, I, 0, 20);
   end loop; -- I in reverse Container_List.Iterate
   Put_Line ("Solutions using all available containers:" &
               Natural'Image (Solution_Count));
   for Containers_To_Use in Container_Counts loop
      Solution_Count := 0;
      for I in reverse Container_Indices loop
         Next_Container (Container_List, I, 0, Containers_To_Use);
      end loop; -- I in reverse Container_List.Iterate
      Put_Line (Natural'Image (Solution_Count) &
                  " solutions using" &
                  Container_Counts'Image (Containers_To_Use) &
                  " containers");
      exit when Solution_Count > 0;
   end loop; -- Containers_To_Use in Container_Counts
end December_17;
