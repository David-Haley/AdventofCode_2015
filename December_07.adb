with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Sets;
with Ada.Assertions; use Ada.Assertions;
with Interfaces; use Interfaces;

procedure December_07 is

   Input_File, Output_File : File_Type;
   Program_Name : constant String := "Solution_07";

   type Word is new Unsigned_16;

   type Symbols is new Unbounded_String;

   Number_Set : constant Character_Set := To_Set ("0123456789");
   Assignment_Set : constant Character_Set := To_Set ("->");
   Operator_Set : constant Character_Set :=
     To_Set ("ANDORNOTLSHIFTRSHIFT->");
   Symbol_Range : constant Character_Range := ('a', 'z');
   Symbol_Set : constant Character_Set := To_Set (Symbol_Range);
   Symbol_Prefix : constant String := "Wire_";

   package Symbol_Tables is new Ada.Containers.Ordered_Sets (Symbols);
   use Symbol_Tables;

   Symbol_Table : Symbol_Tables.Set := Empty_Set;

   procedure Put_Context (Output_File : in out File_Type) is

   begin -- Put_context
      Put_Line (Output_File, "with Ada.Text_IO; use Ada.Text_IO;");
      Put_Line (Output_File, "with Interfaces; use Interfaces;");
      New_Line (Output_File);
      Put_Line (Output_File, "procedure " & Program_Name & " is");
      New_Line (Output_File);
      Put_Line (Output_File, "   type Wires is record");
      Put_Line (Output_File, "      Value : Unsigned_16 := 0;");
      Put_Line (Output_File,
                "      -- initialised to prevent compiler warnings");
      Put_Line (Output_File, "      Defined : Boolean := False;");
      Put_Line (Output_File, "   end record; -- Wires");
      New_Line (Output_File);
   end Put_Context;

   procedure Build_Symbol_Table (Input_File : in out File_Type;
                                 Symbol_Table : in out Symbol_Tables.Set) is

      Text : Unbounded_String;
      First, Start_At : Positive;
      Last : Natural;
      Symbol : Symbols;

   begin -- Build_Symbol_Table
      while not End_Of_File (input_File) loop
         Text := To_Unbounded_String (Get_Line (Input_File));
         Start_At := 1;
         loop -- process symbols on one line
            Find_Token (Text, Symbol_Set, Start_At, Inside, First, Last);
            if Last = 0 then
               exit; -- no more symbols in this line
            end if; -- Last = 0
            Symbol := To_Unbounded_String (Slice (Text, First, Last));
            if not Contains (Symbol_Table, Symbol) then
               Include (Symbol_Table, Symbol);
            end if; -- not Contains (Symbol_Table, Symbol)
            Start_At := Last + 1;
         end loop; -- process symbols on one line
      end loop; -- not End_Of_File (input_File)
   end Build_Symbol_Table;

   procedure Put_Declarations (Output_File : in out File_Type;
                               Symbol_Table : in Symbol_Tables.Set) is

   begin -- Put_Declarations
      for Cursor in Symbol_Table.Iterate loop
         Put_Line (Output_File, "   " & Symbol_Prefix &
                     To_String (Element (Cursor)) &
                     " : Wires;");
      end loop;
      New_Line (Output_File);
   end Put_Declarations;

   procedure Put_Body (Input_File, Output_File : in out File_Type) is

      Text : Unbounded_String;
      First, Start_At : Positive;
      Last : Natural;

      function Get_Operand (Text : in Unbounded_String;
                            Start_At : in Positive) return String is

         First : Positive;
         Last : Natural;

      begin -- Get_Operand
         Find_Token (Text, Symbol_Set, Start_At, Inside, First, Last);
         return Symbol_Prefix & Slice (Text, First, Last);
      end Get_Operand;

      function Is_Immediate (Text : in Unbounded_String;
                             Start_At, End_At : in Positive) return Boolean is

         First : Positive;
         Last : Natural;

      begin -- Is_Immediate
         Find_Token (Text, Number_Set, Start_At, Inside, First, Last);
         return Last > 0 and Last <= End_At;
      end Is_Immediate;

      function Get_Immediate (Text : in Unbounded_String;
                              Start_At : in Positive) return String is

         First : Positive;
         Last : Natural;

      begin -- Get_Immediate
         Find_Token (Text, Number_Set, Start_At, Inside, First, Last);
         return Slice (Text, First, Last);
      end Get_Immediate;




   begin -- Put_Body
      Put_Line (Output_File, "begin -- " & Program_Name);
      Put_Line (Output_File, "   for I in Positive range 1 .. 1000 loop");
      while not End_Of_File (input_File) loop
         Text := To_Unbounded_String (Get_Line (Input_File));
         Put_Line (Output_File, "      -- " & To_String (Text));
         -- test if operands defined
         Put (Output_File, "      if ");
         Start_At := 1;
         Find_Token (Text, Operator_Set, Start_At, Inside, First, Last);
         if Slice (Text, First, Last) = "NOT" then
            if Is_Immediate (Text, Last + 1, Length (Text)) then
               Put (Output_File, "True");
            else
               Put (Output_File, Get_Operand (Text, Last + 1) & ".Defined");
            end if; -- Is_Immediate (Text, 1, First - 1)
         else
            if Is_Immediate (Text, 1, First - 1) then
               Put (Output_File, "True");
            else
               Put (Output_File, Get_Operand (Text, 1) & ".Defined");
            end if; -- Is_Immediate (Text, 1, First - 1)
         end if; -- Slice (Text, First, Last) = "NOT"
         if Slice (Text, First, Last) = "OR" or
           Slice (Text, First, Last) = "AND" or
           Slice (Text, First, Last) = "LSHIFT" or
           Slice (Text, First, Last) = "RSHIFT" then
            -- second operand to be tested
            Put (Output_File, " and ");
            if Is_Immediate (Text, Last + 1, Length (Text)) then
               Put (Output_File, "True");
            else
               Put (Output_File, Get_Operand (Text, Last + 1) & ".Defined");
            end if; -- Is_Immediate (Text, Last + 1, Length (Text))
         end if; -- binary operator
         Put_Line (Output_File, " then");
         Start_At := 1;
         Find_Token (Text, Assignment_Set, Start_At, Inside, First, Last);
         Assert (Last > 0, "Find -> " & To_String (Text));
         Start_At := Last + 1;
         Find_Token (Text, Symbol_Set, Start_At, Inside, First, Last);
         Put_Line (Output_File, "         " &
                Symbol_Prefix & Slice (Text, First, Last) &
                ".Defined := True;");
         Put (Output_File, "         " &
                Symbol_Prefix & Slice (Text, First, Last) & ".Value := ");
         Start_At := 1;
         Find_Token (Text, Operator_Set, Start_At, Inside, First, Last);
         if Slice (Text, First, Last) = "->" then
            if Is_Immediate (Text, 1, First - 1) then
               Put (Output_File, Get_Immediate (Text, 1));
            else
               Put (Output_File, Get_Operand (Text, 1) & ".Value");
            end if; -- Is_Immediate (Text, 1, First - 1)
         elsif Slice (Text, First, Last) = "NOT" then
            if Is_Immediate (Text, Last + 1, Length (Text)) then
               Put (Output_File, "not " & Get_Immediate (Text, 1));
            else
               Put (Output_File, "not " & Get_Operand (Text, Last + 1) &
                      ".Value");
            end if; -- Is_Immediate (Text, 1, First - 1)
         elsif Slice (Text, First, Last) = "OR" then
            -- first operand
            if Is_Immediate (Text, 1, First - 1) then
               Put (Output_File, Get_Immediate (Text, 1));
            else
               Put (Output_File, Get_Operand (Text, 1) & ".Value");
            end if; -- Is_Immediate (Text, 1, First - 1)
            Put (Output_File, " or ");
            -- second operand
            if Is_Immediate (Text, Last + 1, Length (Text)) then
               Put (Output_File, Get_Immediate (Text, Last + 1));
            else
               Put (Output_File, Get_Operand (Text, Last + 1) & ".Value");
            end if; -- Is_Immediate (Text, Last + 1, Length (Text))
         elsif Slice (Text, First, Last) = "AND" then
            -- first operand
            if Is_Immediate (Text, 1, First - 1) then
               Put (Output_File, Get_Immediate (Text, 1));
            else
               Put (Output_File, Get_Operand (Text, 1) & ".Value");
            end if; -- Is_Immediate (Text, 1, First - 1)
            Put (Output_File, " and ");
            -- second operand
            if Is_Immediate (Text, Last + 1, Length (Text)) then
               Put (Output_File, Get_Immediate (Text, Last + 1));
            else
               Put (Output_File, Get_Operand (Text, Last + 1) & ".Value");
            end if; -- Is_Immediate (Text, Last + 1, Length (Text))
         elsif Slice (Text, First, Last) = "LSHIFT" then
            Put (Output_File, "Shift_Left (");
            -- first operand
            if Is_Immediate (Text, 1, First - 1) then
               Put (Output_File, Get_Immediate (Text, 1));
            else
               Put (Output_File, Get_Operand (Text, 1) & ".Value");
            end if; -- Is_Immediate (Text, 1, First - 1)
            Put (Output_File, ", ");
            -- second operand
            if Is_Immediate (Text, Last + 1, Length (Text)) then
               Put (Output_File, Get_Immediate (Text, Last + 1));
            else
               Put (Output_File, Get_Operand (Text, Last + 1) & ".Value");
            end if; -- Is_Immediate (Text, Last + 1, Length (Text))
            Put (Output_File, ')');
         elsif Slice (Text, First, Last) = "RSHIFT" then
            Put (Output_File, "Shift_Right (");
            -- first operand
            if Is_Immediate (Text, 1, First - 1) then
               Put (Output_File, Get_Immediate (Text, 1));
            else
               Put (Output_File, Get_Operand (Text, 1) & ".Value");
            end if; -- Is_Immediate (Text, 1, First - 1)
            Put (Output_File, ", ");
            -- second operand
            if Is_Immediate (Text, Last + 1, Length (Text)) then
               Put (Output_File, Get_Immediate (Text, Last + 1));
            else
               Put (Output_File, Get_Operand (Text, Last + 1) & ".Value");
            end if; -- Is_Immediate (Text, Last + 1, Length (Text))
            Put (Output_File, ')');
         end if; -- selection based on operator
         Put_Line (Output_File, ";");
         Put_Line (Output_File, "      end if;");
      end loop; -- not End_Of_File (input_File)
      Put_Line (Output_File, "   end loop; -- I in Positive range 1 .. 1000");
      Put_Line (Output_File, "   Put_Line (""a:"" & Unsigned_16'Image (" &
                  Symbol_Prefix & "a.Value));");
      Put_Line(Output_File, "end " & Program_Name & ';');
   end Put_Body;

begin -- December_07
   Open (Input_File, In_File, "20151207.txt");
   Create (Output_File, Out_file, Program_Name & ".adb");
   Put_Context (Output_File);
   -- first pass to build symbol table
   Build_Symbol_Table (Input_File, Symbol_Table);
   Put_Declarations (Output_File, Symbol_Table);
   Reset (Input_File);
   -- second pass to generate code
   Put_Body (Input_File, Output_File);
   Close (Output_File);
   Close (Input_File);
end December_07;
