with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Sets;
with Ada.Assertions; use Ada.Assertions;
with Interfaces; use Interfaces;

procedure December_13 is

   Input_File : File_Type;

   type Next_Guests is record
      Name : Unbounded_String := Null_Unbounded_String;
      Happiness : Integer;
   end record; -- Next_Guests

   function "<" (Left, Right : Next_Guests) return Boolean is

   begin -- "<"
      return Left.Name < Right.Name;
   end "<";

   function "=" (Left, Right : Next_Guests) return Boolean is

   begin -- "="
      return Left.Name < Right.Name;
   end "=";

   function Next_Name_Key (Element : Next_Guests) return Unbounded_String is

   begin --  Next_Name_Key
      return Element.Name;
   end  Next_Name_Key;

   package Next_Guest_Lists is new Ada.Containers.Ordered_Sets (Next_Guests);
   use Next_Guest_Lists;

   package Next_Guest_Key is new Next_Guest_Lists.Generic_Keys (Unbounded_String,
                                                              Next_Name_Key);
   use Next_Guest_Key;

   type Guests is record
      Name : Unbounded_String := Null_Unbounded_String;
      Seated : Boolean := False;
      Next_Guest : Next_Guest_Lists.Set := Empty_Set;
   end record; -- Guests

   function "<" (Left, Right : Guests) return Boolean is

   begin -- "<"
      return Left.Name < Right.Name;
   end "<";

   function "=" (Left, Right : Guests) return Boolean is

   begin -- "="
      return Left.Name = Right.Name;
   end "=";

   function Guest_Name_Key (Element : Guests) return Unbounded_String is

   begin -- Guest_Name_Key
      return Element.Name;
   end Guest_Name_Key;

   package Guest_Lists is new Ada.Containers.Ordered_Sets (Guests);
   use Guest_Lists;

   package Guest_Key is new Guest_Lists.Generic_Keys (Unbounded_String,
                                                    Guest_Name_Key);
   use Guest_Key;

   Guest_List : Guest_Lists.Set := Guest_Lists.Empty_Set;
   Happiness : Integer := 0;
   Greatest_Happiness : Integer := Integer'First;

   procedure Build_Guest_List (Input_File : in out File_Type;
                               Guest_list : in out Guest_Lists.Set) is


      Would_Set : constant Character_Set := To_Set ("would");
      Sign_Set : constant Character_Set := To_Set ("gainlose");
      Search_String : constant String := "happiness units by sitting next to";

      Input_Line, Current_Guest_Name : Unbounded_String;
      Start_At, First : Positive;
      Last : Natural;
      Guest : Guests;
      Next_Guest : Next_Guests;
      Guest_Cursor : Guest_Lists.Cursor;
      Loss : Boolean;

   begin -- Build_Guest_List
      -- find Guest names
      while not End_Of_File (Input_File) loop
         -- add origin to list
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Start_At := 1;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
         Guest.Name := To_Unbounded_String (Slice (Input_Line, First, Last));
         if not Contains (Guest_list, Guest) then
            Include (Guest_list, Guest);
         end if; -- not Contains (Guest_list, Guest)
      end loop; --End_Of_File (Input_File)
      Reset (Input_File);
      while not End_Of_File (Input_File) loop
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Start_At := 1;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
         Current_Guest_Name := To_Unbounded_String (Slice (Input_Line, First,
                                                   Last));
         Guest_Cursor := Find (Guest_List, Current_Guest_Name);
         Assert (Guest_Cursor /= Guest_Lists.No_Element,
                 "Current Guest: " & To_String (Current_Guest_Name));
         Start_At := Last + 1;
         Find_Token (Input_Line, Would_Set, Start_At, Inside, First, Last);
         Assert (Slice (Input_Line, First, Last) = "would",
                 "would " & To_String (Input_Line));
         Start_At := Last + 1;
         Find_Token (Input_Line, Sign_Set, Start_At, Inside, First, Last);
         Loss := Slice (Input_Line, First, Last) = "lose";
         Assert (Loss or Slice (Input_Line, First, Last) = "gain", "gain " &
           Slice (Input_Line, First, Last));
         Start_At := Last + 1;
         Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                     Last);
         if Loss then
            Next_Guest.Happiness := - Integer'Value (Slice (Input_Line, First,
                                                     Last));
         else
            Next_Guest.Happiness := Integer'Value (Slice (Input_Line, First,
                                                   Last));
         end if; -- Loss
         Start_At := Last + 1;
         Last := Index (Input_Line, Search_String, Start_At);
         -- actually this returns the first matching character if found
         -- return type is Natural which is not compatible with First
         Assert (Last > 0,
                 "... to " & Slice (Input_Line, Start_At, Length (Input_Line)));
         Start_At := Last + Search_String'Last;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
         Next_Guest.Name := To_Unbounded_String (Slice (Input_Line, First,
                                                Last));
         Include (Guest_List (Guest_Cursor).Next_Guest, Next_Guest);
      end loop; --End_Of_File (Input_File)
   end Build_Guest_List;

   procedure Add_Neutral_Person (Guest_List : in out Guest_Lists.Set) is

      Neutral_Person_Name : constant String := "Zero_Person";

      Guest : Guests := (Name => To_Unbounded_String (Neutral_Person_Name),
                         Seated => False,
                         Next_Guest => Next_Guest_Lists.Empty_Set);
      Next_Guest : Next_Guests :=
        (Name => To_Unbounded_String (Neutral_Person_Name), Happiness => 0);

   begin -- Add_Neutral_Person
      for Guest_Cursor in Guest_List.Iterate loop
         Include (Guest_List (Guest_Cursor).Next_Guest, Next_Guest);
      end loop; -- Guest_List (Guest_Cursor).Name /= Neutral_Person_Name
      for Guest_Cursor in Guest_List.Iterate loop
         Next_Guest.Name := Guest_List (Guest_Cursor).Name;
         Include (Guest.Next_Guest, Next_Guest);
      end loop; -- Guest_List (Guest_Cursor).Name /= Neutral_Person_Name
      Include (Guest_list, Guest);
   end Add_Neutral_Person;

   procedure Next_Seating (Guest_List : in out Guest_Lists.Set;
                           Seated_Cursor : in Guest_Lists.Cursor;
                           Happiness : in out Integer;
                           Greatest_Happiness : in out Integer;
                           First_Seated : in Unbounded_String) is

      function All_Seated (Guest_List : in Guest_Lists.Set) return Boolean is

         Result : Boolean := True;

      begin -- All_Seated
         for Cursor in Guest_List.Iterate loop
            Result := Result and Guest_List (Cursor).Seated;
         end loop; -- Cursor in Guest_List.Iterate
         return Result;
      end All_Seated;

      Seating_Cursor, First_Cursor : Guest_Lists.Cursor;
      First_Cursor_Next, Reverse_Next_Cursor : Next_Guest_Lists.Cursor;

   begin -- Next_Seating
      Guest_List (Seated_Cursor).Seated := True;
      if All_Seated (Guest_List) then
         First_Cursor := Find (Guest_List, First_Seated);
         Reverse_Next_Cursor := Find (Guest_List (First_Cursor).Next_Guest,
                               Guest_List (Seated_Cursor).Name);
         First_Cursor_Next := Find (Guest_List (Seated_Cursor).Next_Guest,
                               First_Seated);
         Happiness := Happiness +
           Guest_List (Seated_Cursor).Next_Guest (First_Cursor_Next).Happiness +
           Guest_List (First_Cursor).Next_Guest (Reverse_Next_Cursor).Happiness;
         -- account for Happiness due to last sitting next first
         if Happiness > Greatest_Happiness then
            Greatest_Happiness := Happiness;
         end if; -- Happiness > Greatest_Happiness
         Happiness := Happiness -
           Guest_List (Seated_Cursor).Next_Guest (First_Cursor_Next).Happiness -
           Guest_List (First_Cursor).Next_Guest (Reverse_Next_Cursor).Happiness;
      else
         for Next_Cursor in
           Guest_List (Seated_Cursor).Next_Guest.Iterate loop
            Seating_Cursor := Find
              (Guest_List,
               Guest_List (Seated_Cursor).Next_Guest(Next_Cursor).Name);
            if not Guest_List (Seating_Cursor).Seated then
               Reverse_Next_Cursor := Find
                 (Guest_List (Seating_Cursor).Next_Guest,
                  Guest_List (Seated_Cursor).Name);
               Happiness := Happiness +
                 Guest_List (Seated_Cursor).Next_Guest(Next_Cursor).Happiness +
                 Guest_List (Seating_Cursor).Next_Guest(Reverse_Next_Cursor).
                 Happiness;
               Next_Seating (Guest_List, Seating_Cursor, Happiness,
                             Greatest_Happiness, First_Seated);
               Happiness := Happiness -
                 Guest_List (Seated_Cursor).Next_Guest(Next_Cursor).Happiness -
                 Guest_List (Seating_Cursor).Next_Guest(Reverse_Next_Cursor).
                 Happiness;
            end if; -- not Guest_List (Seating_Cursor).Seated
         end loop; -- Next_Cursor
      end if; -- All_Seated (Guest_List)
      Guest_List (Seated_Cursor).Seated := False;
   end Next_Seating;

begin -- December_13
   Open (Input_File, In_File, "20151213.txt");
   Build_Guest_List (Input_File, Guest_list);
   Close (Input_File);
   -- display Guest list
   Happiness := 0;
   Greatest_Happiness := Integer'First;
   for Cursor in Guest_List.Iterate loop
      Put_Line ( To_String (Guest_list (Cursor).Name));
      for Next_Cursor in Guest_List (Cursor).Next_Guest.Iterate loop
         Put_Line ("   " &
                   To_String (Guest_List (Cursor).Next_Guest (Next_Cursor).Name)
                   & ' ' & Integer'Image
                     (Guest_List (Cursor).Next_Guest (Next_Cursor).Happiness));
      end loop; -- Next_Cursor in Guest_List (Cursor).Next_Guest.Iterate
   end loop; -- Cursor in Guest_List.Iterate
   for Cursor in Guest_List.Iterate loop
      Next_Seating (Guest_List, Cursor, Happiness, Greatest_Happiness,
                    Guest_list (Cursor).Name);
   end loop; -- Cursor in Guest_List.Iterate
   Put_Line ("Greatest Happiness: " & Integer'Image (Greatest_Happiness));
   Add_Neutral_Person (Guest_List);
   -- display Guest list
   Happiness := 0;
   Greatest_Happiness := Integer'First;
   for Cursor in Guest_List.Iterate loop
      Put_Line ( To_String (Guest_list (Cursor).Name));
      for Next_Cursor in Guest_List (Cursor).Next_Guest.Iterate loop
         Put_Line ("   " &
                   To_String (Guest_List (Cursor).Next_Guest (Next_Cursor).Name)
                   & ' ' & Integer'Image
                     (Guest_List (Cursor).Next_Guest (Next_Cursor).Happiness));
      end loop; -- Next_Cursor in Guest_List (Cursor).Next_Guest.Iterate
   end loop; -- Cursor in Guest_List.Iterate
   for Cursor in Guest_List.Iterate loop
      Next_Seating (Guest_List, Cursor, Happiness, Greatest_Happiness,
                    Guest_list (Cursor).Name);
   end loop; -- Cursor in Guest_List.Iterate
   Put_Line ("Greatest Happiness: " & Integer'Image (Greatest_Happiness));
end December_13;
