@isTest
public class AppleWatchTrigger {
	@isTest
    static void AppleWatchTrigger_1(){
        Opportunity[] opp = new list<Opportunity>();
        
        for(Integer i = 1; i < 3; i++){
            opp.add(new Opportunity(name='Opportunity ' + i, closedate=date.newInstance(1998, 1, 1), stagename='Prospecting'));
        }
        
        insert opp;
    }
    
}