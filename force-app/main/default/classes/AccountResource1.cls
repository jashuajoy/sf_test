@RestResource(urlMapping='/AccountAPI1/*')
global with sharing class AccountResource1 {
    // Get Method
    @HTTPGet
    global static List<Account> getAccountNameAndIndustry() {
        // Initializing the request parameter with the incoming request
        RestRequest accountRequest = RestContext.request;
        // Getting the URL parameters from the request
        Map<String, String> accountRequestParams = accountRequest.params;
        // Getting the limit and Industry from the request URL params
        Integer accountLimit = Integer.valueOf(accountRequestParams.get('limit'));
        String Industry = accountRequestParams.get('Industry');
        // Querying accounts
        List<Account> accountList = [SELECT Id, Name, Industry FROM Account WHERE Industry =:Industry LIMIT :accountLimit];
        // Returning the accounts in the response
        return accountList;
    }
}