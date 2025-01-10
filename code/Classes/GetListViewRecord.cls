public with sharing class GetListViewRecord {
    public String listViewId { get; set; }
    public String NameExecel { get; set; }
    public String objectApiName { get; set; }
    public String rawRecordsCsv { get; set; }

    public ExportTo() {

        listViewId = ApexPages.currentPage().getParameters().get('listViewId');  // Example ListView ID
        

        ListView listViewRecord = [
            SELECT Name, SobjectType, DeveloperName 
            FROM ListView 
            WHERE Id = :listViewId
        ];
        objectApiName = listViewRecord.SobjectType;
        NameExecel = listViewRecord.Name;


        List<sObject> recordList = fetchListViewRecords();
        rawRecordsCsv= JSON.serialize(recordList);
        system.debug('Fetched records: ' + recordList);
    }

    private List<sObject> fetchListViewRecords() {
        List<sObject> sobjectList = new List<sObject>();
        try {
            String queryUrl = '/services/data/v57.0/sobjects/' + objectApiName + '/listviews/' + listViewId + '/describe';
            system.debug(queryUrl);
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(URL.getOrgDomainUrl().toExternalForm() + queryUrl);
            request.setMethod('GET');
            request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
            request.setHeader('Content-Type', 'application/json');
             system.debug(request);

            HttpResponse response = http.send(request);
            Map<String, Object> tokenResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug(tokenResponse);
            String query = (String) tokenResponse.get('query');
            
           
            sobjectList = Database.query(query);


            system.debug('Fetched records: ' + sobjectList);
            return sobjectList;
        } catch (Exception e) {
            System.debug('Error fetching ListView records: ' + e.getMessage());
        }
        return sobjectList;
    }

}
