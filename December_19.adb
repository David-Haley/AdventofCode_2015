with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Containers.Ordered_Sets;
with Ada.Assertions; use Ada.Assertions;

procedure December_19 is

   Input_File : File_Type;
   Input_Line : Unbounded_String;

   type Rules is record
      Reagent, Product : Unbounded_String;
   end record; -- Rules

   package Rule_Lists is new Ada.Containers.Doubly_Linked_Lists  (Rules);
   use Rule_Lists;

   Rule_List : Rule_Lists.List := Empty_list;

   New_Molicule : Unbounded_String := Null_Unbounded_String;

   package New_Molicule_Sets is new
     Ada.Containers.Ordered_Sets (Unbounded_String);
   use New_Molicule_Sets;

   New_Molicule_Set : New_Molicule_Sets.Set := Empty_Set;

   procedure Read_Rules (Input_File : in out File_Type;
                         Rule_List : in out Rule_Lists.List) is

      Input_Line : Unbounded_String;
      First, Start_At : Positive;
      Last : Natural;
      Rule : Rules;
      Arrow_Set : Character_Set := To_Set ("=>");

   begin -- Read_Rules
      loop
         Start_At := 1;
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         exit when Length (Input_Line) = 0;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First,
                     Last);
         Rule.Reagent := To_Unbounded_String (Slice (Input_Line, First, Last));
         Start_At := Last + 1;
         Find_Token (Input_Line, Arrow_Set, Start_At, Inside, First,
                     Last);
         Assert (Slice (Input_Line, First, Last) = "=>", "Not arrow " &
                   Slice (Input_Line, First, Last));
         Start_At := Last + 1;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First,
                     Last);
         Rule.Product := To_Unbounded_String (Slice (Input_Line, First, Last));
         Append (Rule_List, Rule);
      end loop; -- process one rule
   end Read_Rules;

   procedure Apply_One_Replacement
     (Molicule : in Unbounded_String;
      Rule_List : in Rule_Lists.List;
      New_Molicule_Set : in out New_Molicule_Sets.Set) is

      Start_At : Positive;
      First, Last : Natural;
      New_Molicule : Unbounded_String;

   begin -- Apply_One_Replacement
      for Rule in Rule_List.Iterate loop
         Start_AT := 1;
         while Start_At <= Length (Molicule) loop
            New_Molicule := Null_Unbounded_String;
            First := Index (Molicule, To_String (Rule_List (Rule).Reagent),
                            Start_At);
            if First > 0 then
               Last := First + Length (Rule_List (Rule).Reagent) - 1;
               if First /= 1 then
                  New_Molicule :=
                    To_Unbounded_String (Slice (Molicule, 1, First - 1));
               end  if;  -- First /= 1
               New_Molicule := New_Molicule & Rule_List (Rule).Product;
               if Last < Length (Molicule) then
                  New_Molicule := New_Molicule &
                    Slice (Molicule, Last + 1, Length (Molicule));
               end if; -- Last < Length (Molicule)
               if not Contains (New_Molicule_Set, New_Molicule) then
                  Insert (New_Molicule_Set, New_Molicule);
               end if; -- not Contains (Rule_List, New_Molicule)
               Start_At := Last + 1;
            else
               Start_At := Length (Molicule) + 1;
            end if; --  First > 0
         end loop; -- Start_At <= Length (Molicule)
      end loop; -- for Rule in Rule_List.Iterate loop
   end Apply_One_Replacement;

   function Count_Steps (Product_Molicule : in Unbounded_String;
                          Rule_List : in Rule_Lists.List) return Natural is

      Found : Positive;
      First : Natural;
      Molicule : Unbounded_String := Product_Molicule;
      Best_Match : Rule_Lists.Cursor;
      Longest_Match, Steps: Natural := 0; -- only Steps must be initialised

   begin -- Count_Steps
      while Length (Molicule) > 0 loop
         Longest_Match := 0;
         Best_Match := Rule_Lists.No_Element;
         for Cursor in Rule_List.Iterate loop
            First := Index (Molicule, To_String (Rule_List (Cursor).Product),
                            1, Forward);
            if First > 0 and then
              Longest_Match < Length (Rule_List (Cursor).Product) then
               Best_Match := Cursor;
               Found := First;
               Longest_Match := Length (Rule_List (Cursor).Product);
            end if; -- longest match
         end loop; -- Cursor in Rule_List.Iterate
         Assert (Best_Match /= Rule_Lists.No_Element, "No match" &
                   To_String (Molicule));
         Steps := Steps + 1;
         if Rule_List (Best_Match).Reagent = "e" Then
            Replace_Slice (Molicule, Found, Found +
                             Length (Rule_List (Best_Match).Product) - 1, "");
         else
            Replace_Slice (Molicule, Found, Found +
                             Length (Rule_List (Best_Match).Product) - 1,
                           To_String (Rule_List (Best_Match).Reagent));
         end if; -- Rule_List (Best_Match).Reagent = "e"
      end loop; -- Length (Molicule) > 0
      return Steps;
   end Count_Steps;

begin -- December_19
   Open (Input_File, In_File, "20151219.txt");
   Read_Rules (Input_File, Rule_List);
   Input_Line := To_Unbounded_String (Get_Line (Input_File));
   Close (Input_File);
   Apply_One_Replacement (Input_Line, Rule_List, New_Molicule_Set);
   Put_Line ("Molicules Created:" &
               Count_Type'Image (Length(New_Molicule_Set)));
   Put_Line ("Steps to Create Molicule:" &
               Natural'Image (Count_Steps (Input_Line, Rule_List)));
end December_19;
