trigger CaseAssignment on Case (before insert) {
    //Variable decleration
    List<Case> caseList = new List<Case>();
    List<User> integrationUserObj = new List<User>();
    List<Id> integrationUserIds = new List<Id>();
    
    //Fetching the assignment rules on case
    AssignmentRule AR = new AssignmentRule();
    AR = [select id from AssignmentRule where SobjectType = 'Case' and Active = true limit 1];

    //Creating the DMLOptions for "Assign using active assignment rules" checkbox
    //Database.DMLOptions dmlOpts = new Database.DMLOptions();
    //dmlOpts.assignmentRuleHeader.assignmentRuleId= AR.id;   
    Database.DMLOptions dmlOpts = new Database.DMLOptions();
   	dmlOpts.AssignmentRuleHeader.useDefaultRule = true;

    
    //if(Trigger.isAfter && Trigger.isInsert){
    if(Trigger.isInsert){
        //Fetching the Community User details
        integrationUserObj = [SELECT Id, Name FROM User where Profileid='00e5g0000055W90'];
        System.debug('************users*************');
        System.debug(integrationUserObj);
        for(User u : integrationUserObj){
            integrationUserIds.add(u.Id);
        }
           
        for (Case caseObj : Trigger.new) {
            System.debug(caseObj.OwnerId + ' ' + integrationUserIds.contains(caseObj.OwnerId));
            //if (integrationUserIds.contains(caseObj.OwnerId)) {
             //Case newCase = new Case(Status = 'New');
                //Setting the DMLOption on Case instance
                caseObj.setOptions(dmlOpts);
                caseList.add(caseObj);
            //}
        }        
        //Database.update(caseList, dmlOpts);
        
        System.debug('*************************');
    }
}