codeunit 50102 "BCT SubscriptionInstall"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    begin
        // Instantiate variables needed for the extension
        pba_test();
    end;

    trigger OnInstallAppPerDatabase();
    begin
        // Instantiate variables needed for the extension

    end;

    local procedure pba_test()
    var
        PBA_Test : Record "PBA Test";
    begin
        PBA_Test.Code:='PBA';
        PBA_Test.Description:='PBA Test';
        if PBA_Test.Insert() then ;
    end;
}