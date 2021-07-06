global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{
      
     global Database.QueryLocator start(Database.BatchableContext BC){
		 String query = 'Select Id,Email,LeadSource from Lead';
        return Database.getQueryLocator(query);
    }
    
      global void execute(Database.BatchableContext BC, List<Lead> lstLeadAssignment){
		  List<Lead> lstLead = new List<Lead>();
		  for(Lead obj : lstLeadAssignment){
			  obj.LeadSource = 'Dreamforce';
			  lstLead.add(obj);
		  }
        update lstLead;
      }
    
     global void finish(Database.BatchableContext BC){
        	
    }
}