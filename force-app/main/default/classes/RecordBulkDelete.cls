@RestResource(urlMapping='/ContactAPI2/*')
global with sharing class RecordBulkDelete {
    // bulk delete method
    @HTTPDelete
    global static Map<String, String> deleteContacts() {
        // Initializing the response map
        Map<String, String> responseMap = new Map<String, String>();
        // Initializing the request parameter with the incoming request
        RestRequest contactRequest = RestContext.request;
        // Getting the request URI
        String contactRequestURI = contactRequest.requestURI;
        // Getting the contact id from the request URI
        // Integer count = Integer.valueOf(contactRequestURI.substring(contactRequestURI.lastIndexOf('/') + 1));

        // List<Contact> contacts = [select Id, Name, (select Id from cases) from contact];

        // List<contact> delCons = new List<contact>();

        // for(Contact con : contacts){
        //     if(con.cases.size() == 0){
        //         delCons.add(con);
        //         if(delCons.size() == 2){
        //             break;
        //         }
        //     }
        // }

        List<Id> conIds = (contactRequestURI.substring(contactRequestURI.lastIndexOf('/') + 1)).split(',');

        List<Contact> delCons = [select Id from contact where Id = :conIds];
        
        // Initializing contact to delete
        // Contact contact = new Contact(Id=contactId);
        // Deleting contact
        try {
            delete delCons;
            responseMap.put('success', '1');
            responseMap.put('message', delCons.size() + ' Records Deleted Successfully');
        } catch(DmlException ex) {
            responseMap.put('success', '0');
            responseMap.put('message', ex.getMessage());
        }
        // Returning the response map in the response
        return responseMap;
    }
}