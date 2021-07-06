global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        	List<Lead> listLead = new List<Lead>();
        for(Lead opp : [SELECT Id, Name,LeadSource FROM Lead Where LeadSource ='' LIMIT 200]){
		    opp.LeadSource = 'Dreamforce';
			listLead.add(opp);
		}
       update listLead;
    }
    
}