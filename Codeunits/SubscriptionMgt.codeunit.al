codeunit 50100 "BCT Subscription Management"
{
    trigger OnRun();
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterPostSalesDoc', '', false, false)]
    local procedure UpdateSubscriptions(VAR SalesHeader: Record "Sales Header"; VAR GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20])
    var
        CustomerSubscription: Record "BCT Customer Subscription";
        SalesInvLine: Record "Sales Invoice Line";
        Subscription: Record "BCT Subscription";
    begin
        if (SalesInvHdrNo <> '') THEN begin
            SalesInvLine.SetRange("Document No.", SalesInvHdrNo);
            SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
            IF SalesInvLine.FindSet THEN
                REPEAT
                    CustomerSubscription.SetRange("Item No", SalesInvLine."No.");
                    CustomerSubscription.SetRange(Active, true);
                    IF CustomerSubscription.FindFirst() THEN begin
                        Subscription.Get(CustomerSubscription."Subscription Code");
                        CustomerSubscription."Last Invoice Date" := SalesHeader."Posting Date";
                        CustomerSubscription."Next Invoicing Date" := CalcDate(Subscription."Invoicing Frequence", SalesHeader."Posting Date");
                        CustomerSubscription.Modify;
                    end;
                UNTIL SalesInvLine.Next = 0;
        end;
    end;
}