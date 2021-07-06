@IsTest
private class AccountManagerTest {

    @isTest static void testGetCaseById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://sachintrestingapi-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        AccountManager.getAccount();
        
       
    }

    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account caseTest = new Account(
            Name='Test record');
        insert caseTest;
        Contact caseTestCon = new Contact(
            LastName='Test recordContact',AccountId=caseTest.Id);
        insert caseTestCon;
        return caseTest.Id;
    }          

}