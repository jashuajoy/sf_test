trigger DedupeRemainder on Account (after insert) {
    List<case> c = new List<case>();
    for(Account acc : trigger.new){
        case ca = new case();
        ca.subject = 'Dedupe the Account';
        ca.ownerId = '0055g00000E5aigAAB';
        ca.AccountId = acc.Id;
        
        c.add(ca);
    }
    
    insert c;
}