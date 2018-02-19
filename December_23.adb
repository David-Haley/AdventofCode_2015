with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Sets;
with Ada.Assertions; use Ada.Assertions;
with Interfaces; use Interfaces;

procedure December_23 is

   Input_File, Output_File : File_Type;
   Program_Name : constant String := "Solution_23";
   Source_File_Path : constant String := "..\Source\";
   Indent_1 : constant String := "   ";
   Indent_2 : constant String := "      ";
   Assignment : constant String := " := ";

   type Registers is (a, b);
   Register_Set : constant Character_Set := To_Set ("ab");

   package Register_IO is new Ada.Text_IO.Enumeration_IO (Registers);
   use Register_IO;

   subtype Line_Numbers is Natural;

   package Line_Number_IO is new Ada.Text_IO.Integer_IO (Line_Numbers);

   subtype Offsets is Integer range
     - Line_Numbers'Last .. Line_Numbers'Last;

   package Offset_IO is new Ada.Text_IO.Integer_IO (Offsets);
   use Offset_IO;

   Integer_Set : constant Character_Set := To_Set ("+-0123456789");

   type Op_Codes is (hlf, tpl, inc, jmp, jie, jio);
   Op_Code_Set : constant Character_Set := To_Set ("hlftplincjmpjiejio");

   package OP_Code_IO is new Ada.Text_IO.Enumeration_IO (Op_Codes);
   use Op_Code_IO;

   package Jump_Tables is new Ada.Containers.Ordered_Sets (Line_Numbers);
   use Jump_Tables;

   Jump_Table : Jump_Tables.Set := Empty_Set;

   procedure Put_Context (Output_File : in out File_Type) is

   begin -- Put_context
      Put_Line (Output_File, "with Ada.Text_IO; use Ada.Text_IO;");
      New_Line (Output_File);
      Put_Line (Output_File, "procedure " & Program_Name & " is");
      New_Line (Output_File);
   end Put_Context;

   procedure Build_Jump_Table (Input_File : in out File_Type;
                                 Jump_Table : in out Jump_Tables.Set) is

      Line_Number : Line_Numbers;
      Op_Code : Op_Codes;
      Offset : Offsets;
      Input_Line : Unbounded_String;
      First, Start_At : Positive;
      Last : Natural;

   begin -- Build_Jump_Table
      while not End_Of_File (input_File) loop
         Line_Number := Line_Numbers (Line (Input_File));
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Start_At := 1;
         Find_Token (Input_Line, Op_Code_Set, Start_At, Inside, First, Last);
         Get (Slice (Input_Line, First, Last), Op_Code, Start_At);
         if Op_Code = jmp or Op_Code = jie or Op_Code = jio then
            Find_Token (Input_Line, Integer_Set, Start_At, Inside, First, Last);
            Get (Slice (Input_Line, First, Last), Offset, Start_At);
            Line_Number := Line_Numbers (Offsets (Line_Number) + Offset);
            if not Contains (Jump_Table, Line_Number) then
               Include (Jump_Table, Line_Number);
            end if; -- not Contains (Jump_Table, Line_Number)
         end if; -- Op_Code = jmp or Op_Code = jie or Op_Code = jio
      end loop; -- not End_Of_File (input_File)
   end Build_Jump_Table;

   procedure Put_Register (Output_File : in out File_type;
                           Register : in Registers) is

   begin -- Put_Register
      Put (Output_File, "Register_");
      Put (Output_File, Register);
   end Put_Register;

   procedure Put_Declarations (Output_File : in out File_Type) is

   begin -- Put_Declarations
      for I in Registers loop
         Put (Output_File, Indent_1);
         Put_Register (Output_File, I);
         Put_Line (Output_File, " : Natural" & Assignment & "0;");
      end loop; -- I in Registers
      New_Line (Output_File);
   end Put_Declarations;

   procedure Put_Body (Input_File, Output_File : in out File_Type) is

      Input_Line : Unbounded_String;
      First, Start_At : Positive;
      Last : Natural;
      Label_Prefix : constant String := "Label_";
      Line_Number : Line_Numbers;
      Op_Code : Op_Codes;
      Register : Registers;

      procedure Put_Label (Oitput_File : in out File_Type;
                           Line_Number : in Line_Numbers) is

      begin -- Put_Label
         Put (Output_File, Indent_1 & "<<" & Label_Prefix);
         Line_Number_IO.Put (Output_File, Line_Number, 0);
         Put_Line (Output_File, ">>");
      end Put_Label;

      procedure Get_Register (Input_Line : in Unbounded_String;
                              Register : out Registers;
                              Start_At : in out Positive) is
         First : Positive;
         Last : Natural;

      begin -- Get_Register
         Find_Token (Input_Line, Register_Set, Start_At, Inside, First, Last);
         Get (Slice (Input_Line, First, Last), Register, Start_At);
      end Get_Register;

      procedure Put_goto (Output_File : in out File_Type;
                          Input_Line : in Unbounded_String;
                          Line_Number : in Line_Numbers;
                          Start_At : in out Positive) is

         First : Positive;
         Last : Natural;
         Offset : Offsets;

      begin -- Put_goto
         Put (Output_File, "goto " & Label_Prefix);
         Find_Token (Input_Line, Integer_Set, Start_At, Inside, First, Last);
         Get (Slice (Input_Line, First, Last), Offset, Start_At);
         Put (Output_File, Line_Numbers (Offsets (Line_Number) + Offset), 0);
         Put_Line (Output_File, ";");
      end Put_goto;

   begin -- Put_Body
      Put_Line (Output_File, "begin -- " & Program_Name);
      while not End_Of_File (input_File) loop
         Line_Number := Line_Numbers (Line (Input_File));
         if Contains (Jump_Table, Line_Number) then
            Put_Label (Output_File, Line_Number);
         end if; -- Contains (Jump_Table, Line_Number)
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Put (Output_File, Indent_1 & "--");
         Put (Output_File, Line_Number, 4);
         Put_Line (Output_File, ": " & To_String (Input_Line));
         Start_At := 1;
         Find_Token (Input_Line, Op_Code_Set, Start_At, Inside, First, Last);
         Get (Slice (Input_Line, First, Last), Op_Code, Start_At);
         case Op_Code is
            when hlf | tpl | inc =>
               Get_Register (Input_Line, Register, Start_At);
               Put (Output_File, Indent_1);
               Put_Register (Output_File, Register);
               Put (Output_File, Assignment);
               Put_Register (Output_File, Register);
               if Op_Code = hlf then
                  Put_Line (Output_File, " / 2;");
               elsif Op_Code = tpl then
                  Put_Line (Output_File, " * 3;");
               elsif Op_Code = inc then
                  Put_Line (Output_File, " + 1;");
               end if; -- Op_Code = hlf
            when jmp =>
               Put (Output_File, Indent_1);
               Put_goto (Output_File, Input_Line, Line_Number, Start_At);
            when jie | jio =>
               Put (Output_File, Indent_1 & "if ");
               Get_Register (Input_Line, Register, Start_At);
               Put_Register (Output_File, Register);
               if Op_Code = jie then
                  Put_Line (Output_File, " mod 2 = 0 then");
               else
                  Put_Line (Output_File, " = 1 then");
               end if; -- Op_Code = jie
               Put (Output_File, Indent_2);
               Put_goto (Output_File, Input_Line, Line_Number, Start_At);
               Put_Line (Output_File, Indent_1 & "end if;");
         end case; -- Op_Code
      end loop; -- not End_Of_File (input_File)
      if Last_Element (Jump_Table) > Line_Number then
         Put_Label (Output_File, Last_Element (Jump_Table));
      end if; -- Last_Element (Jump_Table) > Line_Number
      Put (Output_File, Indent_1 & "Put_Line (""");
      Put_Register (Output_File, b);
      Put (Output_File, ":"" & Natural'Image (");
      Put_Register (Output_File, b);
      Put_Line (Output_File, "));");
      Put_Line(Output_File, "end " & Program_Name & ';');
   end Put_Body;

begin -- December_23
   Open (Input_File, In_File, "20151223.txt");
   Create (Output_File, Out_file, Source_File_Path & Program_Name & ".adb");
   Put_Context (Output_File);
   -- first pass to build jump table
   Build_Jump_Table (Input_File, Jump_Table);
   Put_Declarations (Output_File);
   Reset (Input_File);
   -- second pass to generate code
   Put_Body (Input_File, Output_File);
   Close (Output_File);
   Close (Input_File);
end December_23;
