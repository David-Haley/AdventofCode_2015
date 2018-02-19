with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Assertions; use Ada.Assertions;

procedure December_25 is

   Required_X, Required_Y : Positive;

   type Codes is mod 33554393;
   Code : Codes := 20151125;
   Multiplyer : Constant Codes := 252533;

   procedure Get_Row_Column (Required_X, Required_Y : out Positive) is

      Input_File : File_Type;
      Input_Line : Unbounded_String;
      Start_At, First : Positive;
      Last : Natural;

   begin -- Get_Row_Column
      Open (Input_File, In_File, "20151225.txt");
      Input_Line := To_Unbounded_String (Get_Line (Input_File));
      Close (Input_File);
      Start_At := 1;
      Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First, Last);
      Required_Y := Positive'Value (Slice (Input_Line, First, Last));
      Start_At := Last + 1;
      Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First, Last);
      Required_X := Positive'Value (Slice (Input_Line, First, Last));
   end Get_Row_Column;

   function Triangular_Number (Required_X, Required_Y : in Positive)
                               return Positive is

      X, Result : Positive := 1;
      Limit : Positive := 3;
      Y : Positive := Limit - X;

   begin -- Triangular_Number
      Assert (X > 1 or Y > 1, " not valid for X = 1 and Y = 1");
      loop
         Result := Result + 1;
         exit when X = Required_X and Y = Required_Y;
         if Y > 1 then
            Y := Y - 1;
            X := X + 1;
         else
            Limit := Limit + 1;
            X := 1;
            Y := Limit - X;
         end if; --  Y > 1
      end loop; -- until result found
      return Result;
   end Triangular_Number;

begin -- December_25
   Get_Row_Column (Required_X, Required_Y);
   for I in positive range 2 .. Triangular_Number (Required_X, Required_Y) loop
      Code := Code * Multiplyer;
   end loop;
   Put_Line ("Code is:" & Codes'Image (Code));
end December_25;
