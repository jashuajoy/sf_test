public with sharing class StuCls {

    @AuraEnabled(cacheable=true)
    public static List<student__c> getAllRecords() {
        List<student__c> res;
        try{
            res =  [SELECT Name, number__c, email__c, joindate__c, course__c
            FROM Student__c WITH SECURITY_ENFORCED
            ORDER BY Name ASC];

        }catch(Exception e){
            System.debug(e.getMessage());
        }

        return res;
    }

    @AuraEnabled
    public static Id addRecord(String name, String num, String email, String joinDate, String course){
        Date cnvDate = Date.valueOf(joinDate);
        System.debug(cnvDate);
        
        Student__c s = new Student__c(
                Name = name,
                number__c = num,
                email__c = email,
                joindate__c = cnvDate,
                course__c = course
            );

        try{
            insert s;
        }catch(Exception e){
            System.debug(e.getMessage());
        }

        return s.Id;
    }

    @AuraEnabled(cacheable=true)
    public static List<Student__c> searchRecord(String searchString){
        List<Student__c> res;
        
        try{
            searchString = '%' + searchString + '%';
            res = [SELECT Name, number__c, email__c, joindate__c, course__c
                    FROM Student__c
                    WHERE Name LIKE :searchString  WITH SECURITY_ENFORCED
                    ORDER BY Name ASC];
            System.debug('records sent');
        }catch(Exception e){
            System.debug(e.getMessage());
        }

        return res;
    }

    @AuraEnabled
    public static void deleteRecord(String Id){
        Student__c rec;

        try{
            rec =  [SELECT Id
                        FROM Student__c
                        WHERE Id = :Id WITH SECURITY_ENFORCED];

            delete rec;
            System.debug('deleted');

        }catch(Exception e){
            System.debug(e.getMessage());
        }

        System.debug('deleted and returning the id');
    }
}