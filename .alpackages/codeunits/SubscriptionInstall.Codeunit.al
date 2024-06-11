codeunit 50103 "Subscription Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        DMTest: Record DM_Table;
    begin
        if not DMTest.Get('DM1') then begin
            DMTest.Init();
            DMTest.Code := 'DM1';
            DMTest.Description := 'testy mctest';
            DMTest.Insert();
        end;
    end;
}
