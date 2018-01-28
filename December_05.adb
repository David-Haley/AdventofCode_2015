with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure December_05 is

   Input_File : File_Type;

   String_Length : constant Positive := 16;
   subtype String_Indices is Positive range 1 .. String_Length;
   subtype Santa_Strings is String (String_Indices);
   Santa_String : Santa_Strings;

   Vowel_Set : Character_Set := To_Set ("aeiou");
   Required_Vowel_Count : constant Natural := 3;

   Nice, Naughty, Repeat, Separated_Repeat : Boolean;
   Nice_Count : Natural;

begin -- December_05
   Open (Input_File, In_File, "20151205.txt");
   Nice_Count := 0;
   while not End_Of_File (Input_File) loop
      Get (Input_File, Santa_String);
      Skip_line (Input_File);
      Naughty := False;
      Repeat := False;
      for I in String_Indices range 1 .. String_Indices'Last - 1 loop
         Repeat := Repeat or Santa_String (I) = Santa_String (I + 1);
         Naughty := Naughty or Santa_String (I .. I + 1) = "ab" or
           Santa_String (I .. I + 1) = "cd" or
           Santa_String (I .. I + 1) = "pq" or
           Santa_String (I .. I + 1) = "xy";
      end loop; --I in String_Indices range 1 .. String_Indices'Last - 1
      Nice :=  Ada.Strings.Fixed.Count (Santa_String, Vowel_Set) >=
        Required_Vowel_Count and Repeat and not Naughty;
      if Nice then
         Nice_Count := Nice_Count + 1;
      end if;
   end loop;
   Reset (Input_File);
   Nice_Count := 0;
   while not End_Of_File (Input_File) loop
      Get (Input_File, Santa_String);
      Skip_line (Input_File);
      Repeat := False;
      for I in String_Indices range 1 .. String_Indices'Last - 1 loop
         Repeat := Repeat or
           Ada.Strings.Fixed.Count (Santa_String,
                                    Santa_String (I .. I + 1)) >= 2;
      end loop; -- I in String_Indices range 1 .. String_Indices'Last - 1
      Separated_Repeat := False;
      for I in String_Indices range 1 .. String_Indices'Last - 2 loop
         Separated_Repeat := Separated_Repeat or Santa_String (I) =
           Santa_String (I + 2);
      end loop; -- I in String_Indices range 1 .. String_Indices'Last - 2
      Nice := Repeat and Separated_Repeat;
      if Nice then
         Nice_Count := Nice_Count + 1;
      end if;
   end loop;
   Put_Line ("Nice_Count (Second Part Rules):" & Natural'Image (Nice_Count));
   Close (Input_File);
end December_05;
