table 50210 DM_Table
{

    fields
    {

        field(10; Code; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(20; Description; Text[50])
        {
            DataClassification = CustomerContent;
        }

        field(50200; "DM_Test"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}