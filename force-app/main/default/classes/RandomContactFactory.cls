public class RandomContactFactory {
    
    
    public static List<Contact> generateRandomContacts(Integer num,String str){
        List<Contact> lstContact = new List<Contact>();
        for(Integer i=1;i<=num;i++){
            Contact cont = new Contact(FirstName = 'Test '+i);
            lstContact.add(cont);
        }
      return lstContact;  
    }

}