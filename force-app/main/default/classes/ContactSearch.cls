public class ContactSearch {
    
    
    public static List<Contact> searchForContacts(String strLastName,String strPostalCode){
        try{
            List<Contact> lstContact = [Select Id,Name,AccountId from Contact WHERE LastName =:strLastName AND MailingPostalCode =:strPostalCode];
            return lstContact;
            
        }catch(Exception exp){
            return null;
        }
        
    }

}