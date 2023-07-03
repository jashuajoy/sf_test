public with sharing class Data1Cls {
    @AuraEnabled(cacheable=true)
    public static List<Account> dataMethod(){
        try {
            List<Account> records = [SELECT Id, Name,Phone FROM Account WITH SECURITY_ENFORCED ORDER BY Name];
            return records;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Id setAccount(String name, String phone){
        try {
            Account ob = new Account(Name=name, Phone=phone);
            // if(Schema.SObjectType.Account.isCreateable()){
            //     insert ob;
            // }
            insert ob;
            return ob.Id;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}