with Ada.Text_IO; use Ada.Text_IO;

procedure December_20 is

   Input_File : File_Type;
   Required_Number : Natural;

   subtype Elf_Numbers is Natural range 1 .. 1000000;
   subtype House_Numbers is Positive range 1 .. Elf_Numbers'Last;

   Deliver_At : Positive;

   Present_Count : array (House_Numbers) of Natural;

begin -- December_20
   Open (Input_File, In_File, "20151220.txt");
   Required_Number := Natural'Value (Get_Line (Input_File));
   Close (Input_File);
   declare -- Part 1

      Delivery_Factor : constant Natural := 10;

   begin -- Part 1
      Present_Count := (others => 0);
      for Elf_Number in Elf_Numbers loop
         Deliver_At := Elf_Number;
         while Deliver_At <= House_Numbers'Last loop
            Present_Count (Deliver_At) := Present_Count (Deliver_At) +
              Elf_Number * Delivery_Factor;
            Deliver_At := Deliver_At + Elf_Number;
         end loop; -- Deliver_At <= House_Numbers'Last
      end loop; -- Elf_Number in Elf_Numbers
      for I in House_Numbers loop
         if Present_Count (I) >= Required_Number then
            Put_Line ("House number part one (infinite deliveries):" &
                        House_Numbers'Image (I));
            exit; -- result found
         end if;
      end loop;
   end; -- Part 1
   declare -- Part 2

      Delivery_Factor : constant Natural := 11;

      Deliveries_Per_Elf : constant Natural := 50;

   begin -- Part 2
      Present_Count := (others => 0);
      for Elf_Number in Elf_Numbers loop
         Deliver_At := Elf_Number;
         while Deliver_At <= Elf_Number * Deliveries_Per_Elf
           and Deliver_At <= House_Numbers'Last loop
            Present_Count (Deliver_At) := Present_Count (Deliver_At) +
              Elf_Number * Delivery_Factor;
            Deliver_At := Deliver_At + Elf_Number;
         end loop; -- Deliver_At <= House_Numbers'Last
      end loop; -- Elf_Number in Elf_Numbers
      for I in House_Numbers loop
         if Present_Count (I) >= Required_Number then
            Put_Line ("House number part two (limited deliveries):" &
                        House_Numbers'Image (I));
            exit; -- result found
         end if;
      end loop;
   end; -- Part 2
end December_20;
