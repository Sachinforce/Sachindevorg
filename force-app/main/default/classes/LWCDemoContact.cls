public with sharing class LWCDemoContact {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        try {
            List<Contact> contacts =
            [SELECT Id, Name, Phone, Email, AccountId FROM Contact limit 50];
        return contacts;
            
        } catch (Exception exp) {
            return null;
        }
       
    }
}