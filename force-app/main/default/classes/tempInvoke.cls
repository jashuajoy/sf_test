public class tempInvoke {
	@invocableMethod
    public static void ins(list<id> ids){
        system.debug('invocable from other method.');
    }
    
    public static void use(){
        ins(null);
    }
}