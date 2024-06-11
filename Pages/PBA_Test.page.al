page 50220 "PBA Test List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "PBA Test";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code;Rec.Code)
                {
                    ApplicationArea = All;
                    
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = All;
                    
                }
            }
        }
        area(Factboxes)
        {
            
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
}