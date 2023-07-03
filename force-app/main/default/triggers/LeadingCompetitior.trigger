trigger LeadingCompetitior on Opportunity (before insert, before update) {
	
    for(opportunity opp : Trigger.new){
        List<decimal> prices = new list<decimal>();
        prices.add(opp.competitior_1_price__c);
        prices.add(opp.competitior_2_price__c);
        prices.add(opp.competitior_3_price__c);
        
        list<string> comp = new list<string>();
        comp.add(opp.competitior_1__c);
        comp.add(opp.competitior_2__c);
        comp.add(opp.competitior_3__c);
        
        decimal min = 99999999;
        integer ind = 0;
        for(integer i=0; i<prices.size(); i++){
            if(prices.get(i) < min){
                min = prices.get(i);
                ind = i;
            }
        }
        
        opp.Leading_Competitior__c = comp.get(ind);
        
    }
    
}