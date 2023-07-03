@RestResource(urlMapping='/AccountAPI/*')
global with sharing class AccountResource {
    // Get Method
    @HTTPGet
    global static List<Account> getAccountNames() {
        // Initializing the request parameter with the incoming request
        RestRequest accountRequest = RestContext.request;
        // Getting the request URI
        String accountRequestURI = accountRequest.requestURI;
        // Getting the limit from the request URI
        Id AccountId = Id.valueOf(accountRequestURI.substring(accountRequestURI.lastIndexOf('/') + 1));
        // Querying accounts
        List<Account> accountList = [SELECT Id, Name, (SELECT Id, Title, Name FROM Contacts) FROM Account WHERE Id = :AccountId];
        // Returning the accounts in the response
        return accountList;
    }
}