@isTest
public class WarrantySummaryTest {
	@isTest
    static void test1(){
		Case c = new case();
        c.Origin = 'Phone';
        c.Product_Purchase_Date__c = Date.newInstance(2021, 10, 26);
        c.Product_Total_Warranty__c = 10;
        c.Product_Has_Extended_Warranty__c = false;
        
        insert c;
    }
}