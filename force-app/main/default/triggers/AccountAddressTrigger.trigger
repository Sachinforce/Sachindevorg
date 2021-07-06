trigger AccountAddressTrigger on Account (before insert) {
    
    for(Account obj : Trigger.New){
        if(obj.Match_Billing_Address__c == true){
           obj.BillingPostalCode = obj.ShippingPostalCode; 
        }
        system.debug('---OwnerId--'+obj.OwnerId);
    }

}