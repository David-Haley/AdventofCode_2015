with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with GNAT.MD5;

procedure December_04 is

   Hash : String ( 1 .. 32);
   My_Input : constant String := "ckczppom";
   I : Natural := 0;

begin -- December_04
   loop
   Hash := GNAT.MD5.Digest (My_Input & Trim (Natural'Image (I) , Left));
      if Hash (1 .. 5) = "00000" then
         exit;
      end if;
      I := I + 1;
   end loop;
   Put_Line ("Hash: " & Hash & " Appended Number:" & Natural'Image (I));
   I := 0;
   loop
   Hash := GNAT.MD5.Digest (My_Input & Trim (Natural'Image (I) , Left));
      if Hash (1 .. 6) = "000000" then
         exit;
      end if;
      I := I + 1;
   end loop;
   Put_Line ("Hash: " & Hash & " Appended Number:" & Natural'Image (I));
end December_04;
