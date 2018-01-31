with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Sets;
with Ada.Assertions; use Ada.Assertions;
with Interfaces; use Interfaces;

procedure December_15 is

   type Ingredients is (Sprinkles, PeanutButter, Frosting, Sugar);

   type Properties is (Capacity, Durability, Flavor, Texture, Calories);

   subtype Property_Values is Integer range -1 .. 9;

   type Ingredient_Tables is Array (Ingredients, Properties) of Property_Values;

   Ingredient_Table : Ingredient_Tables;

   subtype Spoons is Integer range 0 .. 100;

   type Spoon_Tables is array (Ingredients) of Spoons;

   Spoon_Table : Spoon_Tables;

   Best_Score, Best_500_Calorie_Score : Natural := 0;

   procedure Read_Ingredients (Ingredient_Table : out Ingredient_Tables) is

      Input_File : File_Type;

      Input_Line : Unbounded_String;

      Integer_Set : Character_Set := To_Set ("-0123456789");
      Start_At, First : Positive;
      Last : Natural;

      Ingredient : Ingredients;
      Property : Properties;

   begin -- Read_Ingredients
      Open (Input_File, In_File, "20151215.txt");
      while not End_Of_File (Input_File) loop
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Start_At := 1;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
         Ingredient := Ingredients'Value (Slice (Input_Line, First, Last));
         loop
            Start_At := Last + 1;
            Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
            Property := Properties'Value (Slice (Input_Line, First, Last));
            Start_At := Last + 1;
            Find_Token (Input_Line, Integer_Set, Start_At, Inside, First, Last);
            Ingredient_Table (Ingredient, Property) :=
              Property_Values'Value (Slice (Input_Line, First, Last));
            exit when Property = Properties'Last;
         end loop;
      end loop; --End_Of_File (Input_File)
      Close (Input_File);
   end Read_Ingredients;

   function Score (Spoon_Table : in Spoon_Tables;
                  Ingredient_Table : in Ingredient_Tables) return Natural is

      Score_Table : array (Properties) of Integer := (others => 0);
      Result : Natural := 1;

   begin -- Score
      if Spoon_Table (Sprinkles) + Spoon_Table (PeanutButter) +
        Spoon_Table (Frosting) + Spoon_Table (Sugar)
        <= Spoons'Last then
         for Ingredient in Ingredients loop
            for Property in Properties range Capacity .. Texture loop
               Score_Table (Property) := Score_Table (Property) +
                 Ingredient_Table (Ingredient, Property) *
                 Spoon_Table (Ingredient);
            end loop; --  Property in Properties range Capacity .. Texture
         end loop; -- Ingredient in Ingredients
         for Property in Properties range Capacity .. Texture loop
            if Score_Table (Property) > 0 then
               Result := Result * Natural (Score_Table (Property));
            else
               return 0;
            end if;
         end loop; --  Property in Properties  range Capacity .. Texture
         return Result;
      else
         return 0;
      end if; -- acceptable total quantities
   end Score;

   function Calorie_Count  (Spoon_Table : in Spoon_Tables;
                            Ingredient_Table : in Ingredient_Tables)
                            return Natural is

      Result : Natural := 0;

   begin -- Calorie_Count
      for Ingredient in Ingredients loop
         Result := Result + Ingredient_Table (Ingredient, Calories) *
           Spoon_Table (Ingredient);
      end loop; -- Ingredient in Ingredients
      return Result;
   end Calorie_Count;

begin -- December_15
   Read_Ingredients (Ingredient_Table);
   for Sperinkles_Spoons in Spoons loop
      for PeanutButter_Spoons in Spoons loop
         for Frosting_Spoons in Spoons loop
            for Sugar_Spoons in Spoons loop
               Spoon_Table := (Sperinkles_Spoons, PeanutButter_Spoons,
                               Frosting_Spoons, Sugar_Spoons);
               if Best_Score < Score (Spoon_Table, Ingredient_Table) then
                  Best_Score := Score (Spoon_Table, Ingredient_Table);
               end if; -- Best_Score < Score (Spoon_Table, Ingredient_Table)
               if Calorie_Count (Spoon_Table, Ingredient_Table) = 500 and then
                 Best_500_Calorie_Score < Score (Spoon_Table, Ingredient_Table)
               then
                  Best_500_Calorie_Score :=
                    Score (Spoon_Table, Ingredient_Table);
               end if; -- best low cal
            end loop; -- Sugar_Spoons in Spoons
         end loop; --Frosting_Spoons
      end loop; -- PeanutButter_Spoons in Spoons
   end loop; -- Sperinkles_Spoons in Spoons
   Put_Line ("Best Score:" & Natural'Image (Best_Score));
   Put_Line ("Best 500 Cal Score:" & Natural'Image (Best_500_Calorie_Score));
end December_15;
