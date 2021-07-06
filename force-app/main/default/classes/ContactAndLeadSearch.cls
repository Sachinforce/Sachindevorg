public class ContactAndLeadSearch {
    
    
    public static List<List< SObject>> searchContactsAndLeads(String strLastName){
        try{
            String searchquery='FIND \''+strLastName+'\' IN NAME FIELDS RETURNING Lead(Name),Contact(FirstName,LastName)';
            List<List<sObject>> searchList = search.query(searchquery);
            return searchList;
            
        }catch(Exception exp){
            return null;
        }
        
    }

}