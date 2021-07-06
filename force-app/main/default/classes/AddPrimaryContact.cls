public class AddPrimaryContact implements Queueable {
    private Contact Contacts;
    private String State;
    
    public AddPrimaryContact(Contact records, String sts) {
        this.Contacts = records;
        this.State = sts;
    }

    public void execute(QueueableContext context) {
        List<Contact> contLst = new List<Contact>();
        Integer i =0;
        for (Account account : [Select Id from Account Where BillingState = :State Limit 200]) {
             Contact cont = Contacts.clone();
            cont.AccountId = account.Id;
            cont.Email = 'test'+i+'@gmail.com';
            contLst.add(cont);
        }
       insert contlst;
    }
    
}