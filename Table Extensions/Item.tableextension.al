tableextension 50101 "BCT Item Ext" extends Item
{
    fields
    {
        field(50100; "BCT Subscription Item"; Boolean)
        {
            Caption = 'Subscription Item';
            FieldClass = FlowField;
            CalcFormula = Exist("BCT Customer Subscription" where("Item No" = field("No."), Active = const(true)));
            Editable = false;
        }
    }
}