@isTest
public class HelloWorldTest {
	@isTest
    static void HelloWorldTest_1(){
        lead mylead = new lead();
        mylead.FirstName = 'H';
        mylead.LastName = 'W';
       	mylead.Company = 'wfh inc.';
        insert mylead;
        
        mylead.company = 'wxh inc.';
        update mylead;
        
    }
}