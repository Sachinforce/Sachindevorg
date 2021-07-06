public class DataSearchController {
  @AuraEnabled        
    public static List<String> getSObjectList(){
        List<String> objectValuesList = new List<String>();
        for ( Schema.SObjectType o : Schema.getGlobalDescribe().values() )
        {
            Schema.DescribeSObjectResult objResult = o.getDescribe();
            system.debug( 'Sobject: ' + objResult );
            system.debug( 'Sobject API Name: ' + objResult.getName() );
            system.debug( 'Sobject Label Name: ' + objResult.getLabel() );
            if(objResult.createable == true){
            objectValuesList.add(objResult.getLabel());
            }
        }
        return objectValuesList;
    }
}