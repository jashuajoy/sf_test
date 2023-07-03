@isTest
public class AvailableRecordTypesTest {
@isTest
public static void GetAvailableRecordTypeNamesForSObjectTest1(){
    //User u = [Select Id, Name, Profile.Name, ProfileId, isActive from User where Profile.Name='CustomBBManager' limit 1];
    User u = [Select Id, Name, Profile.Name, ProfileId, isActive from User where Profile.Name='System Administrator' limit 1];
    System.runAs(u){
        AvailableRecordTypes.GetAvailableRecordTypeNamesForSObject();
    }
}
}