pageextension 50105 "Bus. Mgr RC DM" extends "Business Manager Role Center"
{
    actions
    {
        addlast(embedding)
        {
            action("DM_Test")
            {
                Caption = 'DM Test';
                image = Import;
                RunObject = page DM_Test_List;
                ApplicationArea = All;
            }
        }

    }

}