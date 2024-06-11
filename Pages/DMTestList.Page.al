page 50104 "DM_Test_List"
{
    SourceTable = DM_Table;
    UsageCategory = Lists;
    ApplicationArea = aLL;
    PageType = List;

    layout
    {

        area(content)
        {

            repeater(DM)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}