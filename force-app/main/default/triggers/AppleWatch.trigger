trigger AppleWatch on Opportunity (after insert) {
    List<Task> tsk = new List<Task>();
    for(Opportunity opp: Trigger.new){
        Task t = new Task();
        t.subject = 'Apple Watch Promo';
        t.Description = 'Send them one ASAP';
        t.priority = 'High';
        t.WhatId = opp.Id;
        tsk.add(t);
    }
    
    insert tsk;
}