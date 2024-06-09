pageextension 50104 "Item List Ext" extends "Item List"
{
    layout
    {
        addfirst(FactBoxes)
        {
            part("BCT Subscription Factbox"; "BCT Subscription Factbox")
            {
                SubPageLink = "Item No" = field("No.");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action("BCT Subscriptions")
            {
                ApplicationArea = All;
                Caption = 'Subscriptions';
                RunObject = page "BCT Customer Subscriptions";
                RunPageLink = "Item No" = field("No.");
                image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
            }
        }
    }
}