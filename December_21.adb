with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Assertions; use Ada.Assertions;

procedure December_21 is

   type Properties is (Cost, Damage, Armor);
   type Weapons is (Dagger, Shortsword, Warhammer, Longsword, Greataxe);
   type Armors is (Leather,  Chainmail, Splintmail, Bandedmail,Platemail,
                   No_Armor);
   type Rings is (Damage_1, Damage_2, Damage_3, Defense_1, Defense_2,
                  Defense_3, No_Ring_1, No_Ring_2);

   subtype Property_Values is Natural;

   type Weapon_Tables is array (Weapons, Properties) of Property_Values;
   Weapon_Table : constant Weapon_Tables := (Dagger =>     (8,  4, 0),
                                             Shortsword => (10, 5, 0),
                                             Warhammer =>  (25, 6, 0),
                                             Longsword =>  (40, 7, 0),
                                             Greataxe =>   (74, 8, 0));

   type Armor_Tables is array (Armors, Properties) of Property_Values;
   Armor_Table : constant Armor_Tables := (Leather =>    (13,  0, 1),
                                           Chainmail =>  (31,  0, 2),
                                           Splintmail => (53,  0, 3),
                                           Bandedmail => (75,  0, 4),
                                           Platemail =>  (102, 0, 5),
                                           No_Armor =>   (0,   0, 0));

   type Ring_Tables is array (Rings, Properties) of Property_Values;
   Ring_Table : constant Ring_Tables := (Damage_1 =>  (25,  1, 0),
                                         Damage_2 =>  (50,  2, 0),
                                         Damage_3 =>  (100, 3, 0),
                                         Defense_1 => (20,  0, 1),
                                         Defense_2 => (40,  0, 2),
                                         Defense_3 => (80,  0, 3),
                                         No_Ring_1 => (0,   0, 0),
                                         No_Ring_2 => (0,   0, 0));

   type Players is (Player, Boss);
   type Inventories is array (Properties) of Property_Values;

   type Player_Record is record
      Hit : Integer := 100;
      Inventory : Inventories;
   end record; -- Player_Record

   type Player_Arrays is array (Players) of Player_Record;

   Player_Array : Player_Arrays;

   Least_Cost : Property_values := Property_Values'Last;
   Greatest_Cost : Property_values := Property_Values'First;

   function Player_Wins (Global_Player_Array : in Player_Arrays)
                         return Boolean is

      Player_Array : Player_Arrays := Global_Player_Array;
      Attacker : Players := Player;
      Attacked : Players;

   begin --  Player_Wins
      while Player_Array (Player).Hit > 0 and
        Player_Array (Boss).Hit > 0 loop
         if Attacker = Player then
            Attacked := Boss;
         else
            Attacked := Player;
         end if; -- Attacker = Player
         if Player_Array (Attacked).Inventory (Armor) -
           Player_Array (Attacker).Inventory (Damage) < - 1 then
            Player_Array (Attacked).Hit :=
              Player_Array (Attacked).Hit +
              Player_Array (Attacked).Inventory (Armor) -
              Player_Array (Attacker).Inventory (Damage);
         else
            Player_Array (Attacked).Hit :=
              Player_Array (Attacked).Hit - 1;
         end if;
         -- take alternate turns at attacking
         if Attacker = Player then
            Attacker := Boss;
         else
            Attacker := Player;
         end if;  -- Attacker = Player
      end loop; -- both Boss and Player Hit > 0
      return Player_Array (Player).Hit > 0;
   end Player_Wins;

   procedure Read_Boss (Player_Array : in out Player_Arrays) is

      Input_File : File_Type;
      Input_Line : Unbounded_String;
      First, Start_At : Positive;
      Last : Natural;

   begin -- Read_Boss
      Open (Input_File, In_File, "20151221.txt");
      Start_At := 1;
      while not End_Of_File (Input_File) loop
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First,
                     Last);
         if "Hit" = Slice (Input_Line, First, Last) then
            Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                        Last);
            Player_Array (Boss).Hit :=
              integer'Value (Slice (Input_Line, First, Last));
         elsif "Damage" = Slice (Input_Line, First, Last) then
            Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                        Last);
            Player_Array (Boss).Inventory (Damage) :=
              Property_Values'Value (Slice (Input_Line, First, Last));
         elsif "Armor" = Slice (Input_Line, First, Last) then
            Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                        Last);
            Player_Array (Boss).Inventory (Armor) :=
              Property_Values'Value (Slice (Input_Line, First, Last));
         else
            Assert (False, "Boss value " & To_String (Input_Line));
         end if;
      end loop; -- not End_Of_File (Input_File)
      Close (Input_File);
      Player_Array (Boss).Inventory (Cost) := 0;
      -- not used
   end Read_Boss;

begin -- December_21
   Read_Boss (Player_Array);
   for Weapon in Weapons loop
      for Current_Armor in Armors loop
         for Ring_1 in Rings range Rings'First .. No_Ring_1 loop
            for Ring_2 in Rings range Rings'Succ (Ring_1) .. Rings'Last Loop
               For Property in Properties loop
                  Player_Array (Player).Inventory (Property) :=
                    Weapon_Table (Weapon, Property) +
                    Armor_Table (Current_Armor, Property) +
                    Ring_Table (Ring_1, Property) +
                    Ring_Table (Ring_2, Property);
               end loop; -- Property in Properties
               if Player_Wins (Player_Array) then
                  if Player_Array (Player).Inventory (Cost) < Least_Cost then
                     Least_Cost := Player_Array (Player).Inventory (Cost);
                  end if; -- Player_Array (Player).Inventory (Cost) < Least_Cost
               else
                  if Player_Array (Player).Inventory (Cost) > Greatest_Cost then
                     Greatest_Cost := Player_Array (Player).Inventory (Cost);
                  end if; -- Player_Array (Player).Inventory (Cost) > Greatest_Cost
               end if; -- Player_Wins (Player_Array)
            end loop; -- Ring_2 in Rings range Rings'Succ (Ring_1) .. Rings'Last
         end loop; -- Ring_1 in Rings range Rings'First .. No_Ring_1
      end loop; -- Current_Armor in Armors
   end loop; -- Weapon in Weapons
   Put_Line ("Least cost to win:" & Property_Values'Image (Least_Cost));
   Put_Line ("Greatest cost to lose:" & Property_Values'Image (Greatest_Cost));
end December_21;
