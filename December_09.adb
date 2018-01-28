with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Sets;
with Ada.Assertions; use Ada.Assertions;
with Interfaces; use Interfaces;

procedure December_09 is

   Input_File : File_Type;

   type Next_Cities is record
      Name : Unbounded_String := Null_Unbounded_String;
      Distance : Natural;
   end record; -- Next_Cities

   function "<" (Left, Right : Next_Cities) return Boolean is

   begin -- "<"
      return Left.Name < Right.Name;
   end "<";

   function "=" (Left, Right : Next_Cities) return Boolean is

   begin -- "="
      return Left.Name < Right.Name;
   end "=";

   function Next_Name_Key (Element : Next_Cities) return Unbounded_String is

   begin --  Next_Name_Key
      return Element.Name;
   end  Next_Name_Key;

   package Next_City_Lists is new Ada.Containers.Ordered_Sets (Next_Cities);
   use Next_City_Lists;

   package Next_City_Key is new Next_City_Lists.Generic_Keys (Unbounded_String,
                                                              Next_Name_Key);
   use Next_City_Key;

   type Cities is record
      Name : Unbounded_String := Null_Unbounded_String;
      Visited : Boolean := False;
      Next_City : Next_City_Lists.Set := Empty_Set;
   end record; -- Cities

   function "<" (Left, Right : Cities) return Boolean is

   begin -- "<"
      return Left.Name < Right.Name;
   end "<";

   function "=" (Left, Right : Cities) return Boolean is

   begin -- "="
      return Left.Name < Right.Name;
   end "=";

   function City_Name_Key (Element : Cities) return Unbounded_String is

   begin -- City_Name_Key
      return Element.Name;
   end City_Name_Key;

   package City_Lists is new Ada.Containers.Ordered_Sets (Cities);
   use City_Lists;

   package City_Key is new City_Lists.Generic_Keys (Unbounded_String,
                                                    City_Name_Key);
   use City_Key;

   City_List : City_Lists.Set := City_Lists.Empty_Set;

   To_Character_Set : constant Character_Set := To_Set ("to");

   Shortest_Distance : Natural := Natural'Last;
   Longest_Distance, Distance : Natural := Natural'First;

   procedure Build_City_List (Input_File : in out File_Type;
                              City_list : in out City_Lists.Set) is

      Input_Line, Current_City_Name : Unbounded_String;
      Start_At, First : Positive;
      Last : Natural;
      City : Cities;
      Next_City : Next_Cities;
      City_Cursor : City_Lists.Cursor;

   begin -- Build_City_List
      -- find city names
      while not End_Of_File (Input_File) loop
         -- add origin to list
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Start_At := 1;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
         City.Name := To_Unbounded_String (Slice (Input_Line, First, Last));
         if not Contains (City_list, City) then
            Include (City_list, City);
         end if; -- not Contains (City_list, City)
         -- add destination to list
         Start_At := Last + 1;
         Find_Token (Input_Line, To_Character_Set, Start_At, Inside, First,
                     Last);
         Assert (Slice (Input_Line, First, Last) = "to",
                 "to " & To_String (Input_Line));
         Start_At := Last + 1;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
         City.Name := To_Unbounded_String (Slice (Input_Line, First, Last));
         if not Contains (City_list, City) then
            Include (City_list, City);
         end if; -- not Contains (City_list, City)
      end loop; --End_Of_File (Input_File)
      Reset (Input_File);
      while not End_Of_File (Input_File) loop
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Start_At := 1;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
         Current_City_Name := To_Unbounded_String (Slice (Input_Line, First,
                                                   Last));
         City_Cursor := Find (City_List, Current_City_Name);
         Assert (City_Cursor /= City_Lists.No_Element,
                 "Current City: " & To_String (Current_City_Name));
         Start_At := Last + 1;
         Find_Token (Input_Line, To_Character_Set, Start_At, Inside, First,
                     Last);
         Assert (Slice (Input_Line, First, Last) = "to",
                 "to " & To_String (Input_Line));
         Start_At := Last + 1;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
         Next_City.Name := To_Unbounded_String (Slice (Input_Line, First,
                                                Last));
         Start_At := Last + 1;
         Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                     Last);
         Next_City.Distance := Natural'Value (Slice (Input_Line, First, Last));
         Include (City_List (City_Cursor).Next_City, Next_City);
         City_Cursor := Find (City_List, Next_City.Name);
         Assert (City_Cursor /= City_Lists.No_Element,
                 "Destination City: " & To_String (Next_City.Name));
         -- update destination city's next ciyu list
         Next_City.Name := Current_City_Name;
         Include (City_List (City_Cursor).Next_City, Next_City);
      end loop; --End_Of_File (Input_File)
   end Build_City_List;

   procedure Next_Destination (City_List : in out City_Lists.Set;
                               Origin_Cursor : in City_Lists.Cursor;
                               Distance : in out Natural;
                               Shortest_Distance : in out Natural;
                               Longest_Distance : in out Natural) is

      function All_Visited (City_List : in City_Lists.Set) return Boolean is

         Result : Boolean := True;

      begin -- All_Visited
         for Cursor in City_List.Iterate loop
            Result := Result and City_List (Cursor).Visited;
         end loop; -- Cursor in City_List.Iterate
         return Result;
      end All_Visited;

      Destination_Cursor : City_Lists.Cursor;

   begin -- Next_Destination
      City_List (Origin_Cursor).Visited := True;
      if All_Visited (City_List) then
         if Distance < Shortest_Distance then
            Shortest_Distance := Distance;
         end if; -- Distance < Shortest_Distance
         if Distance > Longest_Distance then
            Longest_Distance := Distance;
         end if; -- Distance > Longest_Distance
      else
         for Next_Cursor in
           City_List (Origin_Cursor).Next_City.Iterate loop
            Destination_Cursor := Find
              (City_List,
               City_List (Origin_Cursor).Next_City(Next_Cursor).Name);
            Assert (Destination_Cursor /= City_Lists.No_Element, "call: " &
                      To_String (City_List (Origin_Cursor).
                        Next_City(Next_Cursor).Name));
            if not City_List (Destination_Cursor).Visited then
               Distance := Distance +
                 City_List (Origin_Cursor).Next_City(Next_Cursor).Distance;
               Next_Destination (City_List, Destination_Cursor, Distance,
                                 Shortest_Distance, Longest_Distance);
               Distance := Distance -
                 City_List (Origin_Cursor).Next_City(Next_Cursor).Distance;
            end if; -- not City_List (Destination_Cursor).Visited
         end loop; -- Next_Cursor
      end if; -- All_Visited (City_List)
      City_List (Origin_Cursor).Visited := False;
   end Next_Destination;

begin -- December_09
   Open (Input_File, In_File, "20151209.txt");
   Build_City_List (Input_File, City_list);
   Close (Input_File);
   -- display city list
   for Cursor in City_List.Iterate loop
      Put_Line ( To_String (City_list (Cursor).Name));
      for Next_Cursor in City_List (Cursor).Next_City.Iterate loop
         Put_Line ("   " &
                   To_String (City_List (Cursor).Next_City (Next_Cursor).Name)
                   & Natural'Image
                     (City_List (Cursor).Next_City (Next_Cursor).Distance));
      end loop; -- Next_Cursor in City_List (Cursor).Next_City.Iterate
   end loop; -- Cursor in City_List.Iterate
   for Cursor in City_List.Iterate loop
      Next_Destination (City_List, Cursor, Distance, Shortest_Distance,
                        Longest_Distance);
   end loop; -- Cursor in City_List.Iterate
   Put_Line ("Shortest Distance:" & Natural'Image (Shortest_Distance));
   Put_Line ("Longest Distance:" & Natural'Image (Longest_Distance));
end December_09;
