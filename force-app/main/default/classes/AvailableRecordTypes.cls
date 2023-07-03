public class AvailableRecordTypes{
public static List<String> GetAvailableRecordTypeNamesForSObject(){
    Schema.SObjectType objType = Case.SObjectType;
    List<String> names = new List<String>();
    List<RecordTypeInfo> infos = objType.getDescribe().getRecordTypeInfos();
    // If there are 2 or more RecordTypes...
    if (infos.size() > 1) {
        for (RecordTypeInfo i : infos) {
            if (i.isAvailable()){
                // Ignore the Master Record Type, whose Id always ends with 'AAA'.
                // We check the Id because Name can change depending on the user's language.
            
                names.add(i.getName());
                System.debug(i.getName() + ' <===> ' + i.getRecordTypeId());
                
            }
            
            /*if (i.isAvailable()){
           // Ignore the Master Record Type, whose Id always ends with 'AAA'.
           // We check the Id because Name can change depending on the user's language.
            
                names.add(i.getName());
                
            }*/
        }
    }else{
    // Otherwise there's just the Master record type,
    // so add it in, since it MUST always be available
        System.debug(infos[0].getName() + ' <===> ' + infos[0].getRecordTypeId());
        names.add(infos[0].getName());
    }
    return names;
    }
    
}