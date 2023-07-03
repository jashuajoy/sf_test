public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static list<contact> getContacts(){
        try {
            list<contact> cons = [select FirstName, LastName, Email from Contact];

            // return cons;
            throw new AuraHandledException('Forced Error');
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        // return null;

    }
    
}