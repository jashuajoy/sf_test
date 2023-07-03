public with sharing class RecUtility {
    @AuraEnabled
    public static void utilityMethod(){
        try {
            getRecTypesAvailable(Case.SObjectType);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public static void getRecTypesAvailable(Schema.SObjectType objType) {
        List<String> names = new List<String>();
    List<RecordTypeInfo> infos = objType.getDescribe().getRecordTypeInfos();
    // If there are 2 or more RecordTypes...
    if (infos.size() > 1) {
        for (RecordTypeInfo i : infos) {
            if (i.isAvailable()){
                names.add(i.getName());
                System.debug(i.getName() + ' <===> ' + i.getRecordTypeId());
                
            }
        }
    }else{
    // Otherwise there's just the Master record type,
    // so add it in, since it MUST always be available
        names.add(infos[0].getName());
    }
    //return names;
    }
}