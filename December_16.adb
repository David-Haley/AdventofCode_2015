with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Sets;
with Ada.Assertions; use Ada.Assertions;
with Interfaces; use Interfaces;

procedure December_16 is

   subtype Aunt_Indices is Positive range 1 .. 500;

   type Properties is (Children, Cats, Samoyeds, Pomeranians, Akitas, Vizslas,
                       Goldfish, Trees, Cars, Perfumes);

   subtype Property_Values is Natural range 0 .. 10;

   type Property_Entries is Record
      Property_Value : Property_Values;
      Known : Boolean := False;
   end record;

   Type Aunts is array (Properties) of Property_Entries;

   type Aunt_Lists is Array (Aunt_Indices) of Aunts;

   Aunt_List : Aunt_Lists;

   Aunt_Sue : constant Aunts := (Children => (3, True),
                                 Cats => (7, True),
                                 Samoyeds => (2, True),
                                 Pomeranians => (3, True),
                                 Akitas => (0, True),
                                 Vizslas => (0, True),
                                 Goldfish=> (5, True),
                                 Trees=> (3, True),
                                 Cars=> (2, True),
                                 Perfumes => (1, True));

   procedure Read_Aunts (Aunt_List : out Aunt_Lists) is

      Input_File : File_Type;

      Input_Line : Unbounded_String;

      Start_At, First : Positive;
      Last : Natural;

      Property : Properties;
      Aunt_Index : Aunt_Indices;

   begin -- Read_Aunts
      Open (Input_File, In_File, "20151216.txt");
      while not End_Of_File (Input_File) loop
         Input_Line := To_Unbounded_String (Get_Line (Input_File));
         Start_At := 1;
         Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
         Assert (Slice (Input_Line, First, Last) = "Sue", "Sue" &
                   Slice (Input_Line, First, Last));
         Start_At := Last + 1;
         Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                     Last);
         Aunt_Index := Aunt_Indices'Value (Slice (Input_Line, First, Last));
         loop -- read properties
            Start_At := Last + 1;
            Find_Token (Input_Line, Letter_Set, Start_At, Inside, First, Last);
            exit when Last = 0;
            Property := Properties'Value (Slice (Input_Line, First, Last));
            Start_At := Last + 1;
            Find_Token (Input_Line, Decimal_Digit_Set, Start_At, Inside, First,
                        Last);
            Aunt_List (Aunt_Index) (Property) :=
              (Property_Values'Value (Slice (Input_Line, First, Last)), True);
         end loop; -- read properties
      end loop; --End_Of_File (Input_File)
      Close (Input_File);
   end Read_Aunts;

   function Match (Test, Target : in Aunts) return Boolean is

      Is_Match : Boolean := True;

   begin -- Match
      for Property in Properties loop
         if Test (Property).Known then
            Is_Match := Is_Match and Test (Property).Property_Value =
              Target (Property).Property_Value;
         end if; -- Test (Property).Known
      end loop; --  Property in Properties
      Return Is_Match;
   end Match;

   function Corrected_Match (Test, Target : in Aunts) return Boolean is

      Is_Match : Boolean := True;

   begin -- Corrected_Match
      for Property in Properties loop
         if Test (Property).Known then
            case Property is
               when Cats | Trees =>
                  Is_Match := Is_Match and Test (Property).Property_Value >
                    Target (Property).Property_Value;
               when Pomeranians | Goldfish =>
                  Is_Match := Is_Match and Test (Property).Property_Value <
                    Target (Property).Property_Value;
               when others =>
                  Is_Match := Is_Match and Test (Property).Property_Value =
                    Target (Property).Property_Value;
            end case; --  Property
         end if; -- Test (Property).Known
      end loop; --  Property in Properties
      Return Is_Match;
   end Corrected_Match;

begin -- December_15
   Read_Aunts (Aunt_List);
   for Aunt_Index in Aunt_Indices loop
      if Match (Aunt_List (Aunt_Index), Aunt_Sue) then
         Put_Line ("Matched (part 1)" & Aunt_Indices'Image (Aunt_Index));
      end if; -- Match (Aunt_List (Aunt_Index), Aunt_Sue
      if Corrected_Match (Aunt_List (Aunt_Index), Aunt_Sue) then
         Put_Line ("Corrected Match (part 2)" &
                     Aunt_Indices'Image (Aunt_Index));
      end if; -- Match (Aunt_List (Aunt_Index), Aunt_Sue
   end loop; -- Aurnt_Index in Aunt_Indices
end December_16;
