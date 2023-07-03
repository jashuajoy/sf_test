public with sharing class UseCallouts {
    @AuraEnabled(Cacheable=true)
    public static Map<String, Object> getDataToComp() {
        try{
            Map<String, Object> data = Callout1.getData();

            if(data != null){
                return data;
            }


        }catch(Exception e){
            system.debug(e.getMessage());
        }

        return null;
    }
}