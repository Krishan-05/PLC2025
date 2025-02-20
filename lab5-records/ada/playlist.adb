with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure PlayList is

    -- Define variant type for Item
    type Item_Variant_Type is (PIECE, PAUSE);

    -- Define Person record
    type Person is record
        name : Unbounded_String;
    end record;

    -- Procedure to print a Person
    procedure Put_Person (p : Person) is
    begin
        Put (To_String (p.name));
    end Put_Person;

    -- Variant record for Item
    type Item (item_variant : Item_Variant_Type) is record
        length_secs : Float;
        case item_variant is
            when PIECE =>
                name      : Unbounded_String;
                performer : Person;
            when PAUSE =>
                null;
        end case;
    end record;

    -- Procedure to print an Item
    procedure Put_Item (i : Item) is
    begin
        case i.item_variant is
            when PIECE =>
                Put (To_String (i.name));
                Put (" by ");
                Put_Person (i.performer);
                Put (" (");
                Put (i.length_secs, aft => 1, exp => 0);
                Put ("s)");
            when PAUSE =>
                Put ("Pause ( ");
                Put (i.length_secs, aft => 1, exp => 0);
                Put ("s)");
        end case;
        Put_Line ("");  -- Ensure each item is printed on a new line
    end Put_Item;

    -- Define a Piece Item
    piece1 : Item := 
       ( item_variant => PIECE,
         name => To_Unbounded_String ("Moonlight Sonata"),
         performer => (name => To_Unbounded_String ("Claudio Arrau")),
         length_secs => 17.0 * 60.0 + 26.0
       );

    -- Define a Pause Item
    pause1 : Item := 
      ( item_variant => PAUSE,
        length_secs => 5.0
      );

begin
    -- Print only piece1 and pause1
    Put_Item (piece1);
    Put_Item (pause1);
end PlayList;
