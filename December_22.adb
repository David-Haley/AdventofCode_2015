with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Assertions; use Ada.Assertions;

procedure December_22 is

   type Properties is (Cost, Damage, Armor, Effective, Hit_Recharge,
                       Mana_Recharge);
   type Spells is (Magic_Missile, Drain, Shield, Poison, Recharge);

   subtype Property_Values is Natural;

   type Spell_Tables is array (Spells, Properties) of Property_Values;
   Spell_Table : constant Spell_Tables :=
     (Magic_Missile => (53,  4, 0, 1, 0, 0),
      Drain =>         (73,  2, 0, 1, 2, 0),
      Shield =>        (113, 0, 7, 6, 0, 0),
      Poison =>        (173, 3, 0, 6, 0, 0),
      Recharge =>      (229, 0, 0, 5, 0, 101));

   type Inventories is array (Spells) of Property_Values;

   type Players is record
      Hit : Integer;
      Mana : Integer;
      Inventory : Inventories;
   end record; -- Players

   Reset : constant Players :=
     (Hit => 50, Mana => 500, Inventory => (0, 0, 0, 0, 0));
   Player : Players;

   type Bosses is record
      Hit : Integer;
      Damage :Property_Values;
   end record; -- Bosses

   Boss : Bosses;

   Least_Cost : Property_values;

   procedure Take_Turn (Player : In Players;
                        Player_Turn : in Boolean;
                        Boss : in Bosses;
                        Accumulated_Cost : in Property_Values;
                        Least_Cost : in out Property_Values;
                        Hard : in Boolean) is

      Current_Player_Damage : Property_Values := 0;
      Current_Player_Armor : Property_Values := 0;
      Effective_Spell : array (Spells) of Boolean;
      Entry_Player : Players := Player;
      Next_Turn_Player : Players;
      Next_Turn_Boss : Bosses := Boss;

   begin -- Take_Turn
      if Player_Turn and Hard then
         Entry_Player.Hit := Entry_Player.Hit - 1;
      end if; -- Player_Turn and Hard
      if Entry_Player.Hit > 0 then
         for Spell in Spells loop
            if Player.Inventory (Spell) > 0 then
               Current_Player_Damage := Current_Player_Damage +
                 Spell_Table (Spell, Damage);
               Current_Player_Armor := Current_Player_Armor +
                 Spell_Table (Spell, Armor);
               Entry_Player.Hit := Entry_Player.Hit +
                 Spell_Table (Spell, Hit_Recharge);
               Entry_Player.Mana := Entry_Player.Mana +
                 Spell_Table (Spell, Mana_Recharge);
               Entry_Player.Inventory (Spell) :=
                 Entry_Player.Inventory (Spell) - 1;
            end if; -- Player.Inventory (Spell) > 0
            Effective_Spell (Spell) := Player.Inventory (Spell) > 0;
         end loop; -- Spell in Spells
      end if; -- Entry_Player.Hit > 0
      Next_Turn_Boss.Hit := Boss.Hit - Current_Player_Damage;
      if not Player_Turn then
         if Current_Player_Armor - Boss.Damage < 0 then
            Entry_Player.Hit := Entry_Player.Hit
              + Current_Player_Armor - Boss.Damage;
         else
            Entry_Player.Hit := Entry_Player.Hit - 1;
         end if; -- Current_Player_Armor - Boss.Damage < 0
      end if; -- not Player_Turn
      if Next_Turn_Boss.Hit <= 0 or Entry_Player.Hit <= 0 then
         if Entry_Player.Hit > 0 and Accumulated_Cost < Least_Cost then
            Least_cost := Accumulated_Cost;
         end if; -- Player.Hit > 0 and Cost < Least_Cost
      else
         if Player_Turn then
            For Next_Spell in Spells loop
               if not Effective_Spell (Next_Spell) and
                 Spell_Table (NexT_Spell, Cost) < Entry_Player.Mana then
                  Next_Turn_Player := Entry_Player;
                  Next_Turn_Player.Inventory (Next_Spell) :=
                    Spell_Table (Next_Spell, Effective);
                  Next_Turn_Player.Mana := Next_Turn_Player.Mana -
                    Spell_Table (Next_Spell, Cost);
                  Take_Turn (Next_Turn_Player, False, Next_Turn_Boss,
                             Accumulated_Cost + Spell_Table (Next_Spell, Cost),
                             Least_Cost, Hard);
               end if; -- Available Spell
            end loop; -- Next_Spell in Spells
         else
            Next_Turn_Player := Entry_Player;
            Take_Turn (Next_Turn_Player, True, Next_Turn_Boss, Accumulated_Cost,
                       Least_Cost, Hard);
         end if; -- Player_Turn
      end if; -- Boss.Hit <= 0 or Player.Hit <= 0
   end Take_Turn;

   procedure Read_Boss (Boss : out Bosses) is

      Input_File : File_Type;
      Input_Line : Unbounded_String;
      First, Start_At : Positive;
      Last : Natural;

   begin -- Read_Boss
      Open (Input_File, In_File, "20151222.txt");
      Start_At := 1;
      while not End_Of_File (Input_File) loop
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First,
                     Last);
         if "Hit" = Slice (Input_Line, First, Last) then
            Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                        Last);
            Boss.Hit := integer'Value (Slice (Input_Line, First, Last));
         elsif "Damage" = Slice (Input_Line, First, Last) then
            Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                        Last);
            Boss.Damage :=
              Property_Values'Value (Slice (Input_Line, First, Last));
         else
            Assert (False, "Boss value " & To_String (Input_Line));
         end if;
      end loop; -- not End_Of_File (Input_File)
      Close (Input_File);
   end Read_Boss;

begin -- December_22
   Read_Boss (Boss);
   For First_Spell in Spells loop
      Player := Reset;
      Player.Inventory (First_Spell) := Spell_Table (First_Spell, Effective);
      Player.Mana := Player.Mana - Spell_Table (First_Spell, Cost);
      Least_Cost := Property_Values'Last;
      Take_Turn (Player, True, Boss, Spell_Table (First_Spell, Cost),
                 Least_Cost, False);
   end loop; --  First_Spell in Spells
   Put_Line ("Least cost to win:" & Property_Values'Image (Least_Cost));
   -- Part Two
   For First_Spell in Spells loop
      Player := Reset;
      Player.Inventory (First_Spell) := Spell_Table (First_Spell, Effective);
      Player.Mana := Player.Mana - Spell_Table (First_Spell, Cost);
      Least_Cost := Property_Values'Last;
      Take_Turn (Player, True, Boss, Spell_Table (First_Spell, Cost),
                 Least_Cost, True);
   end loop; --  First_Spell in Spells
   Put_Line ("Least cost to win (Hard):" & Property_Values'Image (Least_Cost));
end December_22;
