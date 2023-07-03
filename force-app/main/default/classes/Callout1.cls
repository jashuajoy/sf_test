public with sharing class Callout1 {
    public static Map<String, Object> getData() {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        
        // attach endpoint to request
        req.setEndpoint('https://reqres.in/api/users?page=2');
        // set the method
        req.setMethod('GET');

        // send the response and receive a request back
        HttpResponse res = http.send(req);

        if(res.getStatusCode() == 200){
            // deserialize the body and assign it to a map object of type <string, object>
            Map<String, Object> resBody = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

            Map<String, Object> resRet = new Map<String, Object>();

            for(String key : resBody.keySet()){
                if(!key.equals('support')){
                    resRet.put(key, resBody.get(key));
                }
            }

            return resRet;

        }

        return null;
    }
}