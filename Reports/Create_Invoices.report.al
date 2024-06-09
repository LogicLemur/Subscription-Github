report 50100 "BCT Create Invoices"
{
    ProcessingOnly = true;
    Caption = 'Create Invoices';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Customer Subscription"; "BCT Customer Subscription")
        {
            RequestFilterFields = "Customer No", "Item No";
            trigger OnPreDataItem();
            begin
                IF not Confirm(CreateWarningTxt) THEN
                    CurrReport.Quit;
                "Customer Subscription".SetRange(Active, true);
                "Customer Subscription".SetFilter("Next Invoicing Date", '<=%1', WorkDate);
            end;

            trigger OnAfterGetRecord();
            var
                SalesLine: Record "Sales Line";
                OldCustomer: Code[20];
                OldInvoiceDate: Date;
                NextLineNo: Integer;

            begin
                IF (OldCustomer <> "Customer Subscription"."Customer No") OR
                  (OldInvoiceDate <> "Customer Subscription"."Next Invoicing Date") THEN begin
                    OldCustomer := "Customer Subscription"."Customer No";
                    OldInvoiceDate := "Customer Subscription"."Next Invoicing Date";
                    NextLineNo := 0;
                    Clear(SalesHeader);
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
                    SalesHeader.SetRange("Sell-to Customer No.", "Customer Subscription"."Customer No");
                    SalesHeader.Validate("Location Code", '');
                    SalesHeader.Validate("Posting Date", "Customer Subscription"."Next Invoicing Date");
                    SalesHeader.Insert(true);
                    InvoiceCounter += 1;
                end;
                NextLineNo += 10000;
                SalesLine.Init;
                SalesLine."Line No." := NextLineNo;
                SalesLine."Document Type" := SalesHeader."Document Type";
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine.Validate("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
                SalesLine.Insert;
                SalesLine.Validate(Type, SalesLine.Type::Item);
                SalesLine.Validate("No.", "Customer Subscription"."Item No");
                SalesLine.Validate(Quantity, 1);
                SalesLine.Validate("Allow Line Disc.", "Customer Subscription"."Allow Line Discount");
                SalesLine.Validate("Unit Price", "Customer Subscription"."Invoicing Price");
                SalesLine.Modify;
            end;

            trigger OnPostDataItem();
            begin
                Message(InvCounterTxt, InvoiceCounter, SalesHeader."Document Type");
            end;
        }
    }
    var
        SalesHeader: Record "Sales Header";
        InvoiceCounter: Integer;
        CreateWarningTxt: label 'Create subscriptions for all customers?';
        InvCounterTxt: Label '%1 %2(s) Created';
}