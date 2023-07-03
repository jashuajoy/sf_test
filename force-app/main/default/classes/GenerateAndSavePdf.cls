public class GenerateAndSavePdf {
    public static void savePdf(){
		String testData = ' ';
        ContentVersion cv = new ContentVersion();
        cv.ContentLocation = 'S';
        cv.Title = 'TestFile';
        cv.PathOnClient = cv.Title + '.pdf';
        cv.VersionData = Blob.toPdf(testData);
        insert cv;
        
        id cDocument = [Select ContentDocumentId from ContentVersion where Id=:cv.Id].contentDocumentId;
        System.debug(cDocument);
        
        //ContentDocumentLink cdLink = new ContentDocumentLink();
        //cdLink.contentDocumentId = cDocument;
    }
}