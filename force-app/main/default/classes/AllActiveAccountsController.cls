public with sharing class AllActiveAccountsController {
    public static list<Account> getActiveAccounts() {
        return [SELECT Id from Account where Active__c = 'Yes'];
    }
}