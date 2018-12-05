with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Sets;
with Ada.Assertions; use Ada.Assertions;
with Interfaces; use Interfaces;

procedure December_14 is

   Input_File : File_Type;

   type Rein_Deers is record
      Name : Unbounded_String := Null_Unbounded_String;
      Speed : Natural;
      Flying_Time : Natural;
      Rest_Time : Natural;
      Distance_Travelled : Natural := 0;
      Points : Natural := 0;
   end record; -- Rein_Deers

   function "<" (Left, Right : Rein_Deers) return Boolean is

   begin -- "<"
      return Left.Name < Right.Name;
   end "<";

   function "=" (Left, Right : Rein_Deers) return Boolean is

   begin -- "="
      return Left.Name = Right.Name;
   end "=";

   function Rein_Deer_Name_Key (Element : Rein_Deers) return Unbounded_String is

   begin -- Rein_Deer_Name_Key
      return Element.Name;
   end Rein_Deer_Name_Key;

   package Rein_Deer_Lists is new Ada.Containers.Ordered_Sets (Rein_Deers);
   use Rein_Deer_Lists;

   package Rein_Deer_Key is new Rein_Deer_Lists.Generic_Keys (Unbounded_String,
                                                    Rein_Deer_Name_Key);
   use Rein_Deer_Key;

   Time : constant Natural := 2503;

   Rein_Deer_List : Rein_Deer_Lists.Set := Rein_Deer_Lists.Empty_Set;

   Longest_Distance, Greatest_Points : Natural := 0;

   procedure Build_Rein_Deer_List (Input_File : in out File_Type;
                               Rein_Deer_list : in out Rein_Deer_Lists.Set) is

      Can_Fly : constant String := "can fly";
      Speed_For : constant String :="km/s for";
      Seconds_Rest : constant String := "seconds, but then must rest for";

      Input_Line, Current_Rein_Deer_Name : Unbounded_String;
      Start_At, First : Positive;
      Last, Substring_Start : Natural;
      Rein_Deer : Rein_Deers;

   begin -- Build_Rein_Deer_List
      while not End_Of_File (Input_File) loop
         -- add origin to list
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Start_At := 1;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
         Rein_Deer.Name := To_Unbounded_String (Slice (Input_Line, First, Last));
         Start_At := Last + 1;
         Substring_Start := Index (Input_Line, Can_Fly, Start_At);
         Start_At := Substring_Start + Can_Fly'Last;
         Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                     Last);
         Rein_Deer.Speed := Natural'Value (Slice (Input_Line, First, Last));
         Start_At := Last + 1;
         Substring_Start := Index (Input_Line, Speed_For, Start_At);
         Start_At := Substring_Start + Speed_For'Last;
         Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                     Last);
         Rein_Deer.Flying_Time := Natural'Value (Slice (Input_Line, First,
                                                Last));
         Start_At := Last + 1;
         Substring_Start := Index (Input_Line, Seconds_Rest, Start_At);
         Start_At := Substring_Start + Seconds_Rest'Last;
         Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                     Last);
         Rein_Deer.Rest_Time := Natural'Value (Slice (Input_Line, First,
                                                Last));
         Include (Rein_Deer_list, Rein_Deer);
      end loop; --End_Of_File (Input_File)
   end Build_Rein_Deer_List;

   function Is_Flying (Rein_Deer_List : in Rein_Deer_Lists.Set;
                              Cursor : in Rein_Deer_Lists.Cursor;
                       Time : in Natural) return Boolean is

      Cycle_Time : Natural;

   begin -- Is_Flying
      Cycle_Time := Rein_Deer_List (Cursor).Flying_Time +
        Rein_Deer_List (Cursor).Rest_Time;
      return (Time - 1) mod Cycle_Time < Rein_Deer_List (Cursor).Flying_Time;
   end Is_Flying;

begin -- December_14
   Open (Input_File, In_File, "20151214.txt");
   Build_Rein_Deer_List (Input_File, Rein_Deer_list);
   Close (Input_File);
   for Tick in Natural range 1 .. Time loop
      for Cursor in Rein_Deer_List.Iterate loop
         if Is_Flying (Rein_Deer_list, Cursor, Tick) then
            Rein_Deer_List (Cursor).Distance_Travelled :=
              Rein_Deer_List (Cursor).Distance_Travelled +
              Rein_Deer_List (Cursor).Speed; -- one second flying
         end if;
         if Rein_Deer_List (Cursor).Distance_Travelled > Longest_Distance then
            Longest_Distance := Rein_Deer_List (Cursor).Distance_Travelled;
         end if;
      end loop; -- Cursor in Rein_Deer_List.Iterate
      for Cursor in Rein_Deer_List.Iterate loop
         if Rein_Deer_List (Cursor).Distance_Travelled = Longest_Distance then
            Rein_Deer_List (Cursor).Points :=
              Rein_Deer_List (Cursor).Points + 1;
         end if; -- Rein_Deer_List (Cursor).Distance_Travelled = Longest_Distance
      end loop; -- Cursor in Rein_Deer_List.Iterate
   end loop;
   for Cursor in Rein_Deer_List.Iterate loop
      Put_Line ( To_String (Rein_Deer_list (Cursor).Name) & " distance" &
                   Natural'Image (Rein_Deer_List (Cursor).Distance_Travelled) &
                   " points" &
                   Natural'Image (Rein_Deer_List (Cursor).Points));
      if Rein_Deer_List (Cursor).Distance_Travelled > Longest_Distance then
         Longest_Distance := Rein_Deer_List (Cursor).Distance_Travelled;
      end if; -- Rein_Deer_List (Cursor).Distance_Travelled > Longest_Distance
      if Rein_Deer_List (Cursor).Points > Greatest_Points then
         Greatest_Points := Rein_Deer_List (Cursor).Points;
      end if; -- Rein_Deer_List (Cursor).Points > Greatest_Points
   end loop; -- Cursor in Rein_Deer_List.Iterate
   Put_Line ("Longest Distance: " & Natural'Image (Longest_Distance));
   Put_Line ("Greatest Points: " & Natural'Image (Greatest_Points));
end December_14;
