with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Assertions; use Ada.Assertions;

procedure December_11 is

   Input_File : File_Type;

   Password_Length : constant Positive := 8;
   subtype Password_Indices is Positive range 1 .. Password_Length;
   subtype Passwords is String (Password_Indices);
   First_Lower : constant Character := 'a';
   Last_Lower : constant Character := 'z';

   Old_Password, New_Password, Second_Password : Passwords;

   procedure Increment_Password (Password : in out Passwords) is

      Carry : Boolean;

   begin -- Increment_Password
      for I in reverse Password_Indices loop
         Carry := False;
         Password (I) := Character'Succ (Password (I));
         if Password (I) = 'i' or  Password (I) = 'o' or  Password (I) = 'l'
         then
            -- apply rule 2 must mot contain 'i' 'o' 'l'
            Password (I) := Character'Succ (Password (I));
            -- will not exceed 'z'
         elsif  Password (I) > Last_Lower then
            Password (I) := First_Lower;
            Carry := True;
         end if; -- Password (I) = 'i' or  Password (I) = 'o' or  Password (I)
         exit when not Carry;
      end loop;
   end Increment_Password;

   function Contains_Run  (Password : in out Passwords) return Boolean is
      -- Rule 1 contains run of there consecuiive characters e.g. "abc"

      Result : Boolean := False;

   begin -- Contains_Run
      for I in Password_Indices range 1 .. Password_Indices'Last - 2 loop
         Result := Result or
           (Password (I + 1) = Character'Succ (Password (I)) and
           Password (I + 2) = Character'Succ (Password (I + 1)));
      end loop; -- I in Password_Indices range 1 .. Password_Indices - 2
      return Result;
   end Contains_Run;

   function Contains_Two_Repeats  (Password : in out Passwords) return Boolean is
      -- Rule 3 contains at least two non overlapping pairs e.g. aa bb ...

      Result : Boolean := False;
      Test_String : String (1 .. 2);
      Pair_Count : Natural := 0;

   begin -- Contains_Two_Repeats
      for Char in Character range First_Lower .. Last_Lower loop
         Test_String := (others => Char);
         Pair_Count := Pair_Count +
           Ada.Strings.Fixed.Count (Password, Test_String);
      end loop; -- Char in lower case range
      return Pair_Count >= 2;
   end Contains_Two_Repeats;

   function Next_Password (Old_Password : in Passwords) return Passwords is

      Result : Passwords := Old_Password;

   begin -- Next_Password
      loop
         Increment_Password (Result);
         exit when Contains_Run (Result) and Contains_Two_Repeats (Result);
      end loop;
      return Result;
   end Next_Password;

begin -- December_11
   Open (Input_File, In_File, "20151211.txt");
   Get (Input_File, Old_Password);
   Close (Input_File);
   Put_Line ("Old Password: " & Old_Password);
   New_Password := Next_Password (Old_Password);
   Put_Line ("New Password: " & New_Password);
   Second_Password := Next_Password (New_Password);
   Put_Line ("Second Password: " & Second_Password);
end December_11;
