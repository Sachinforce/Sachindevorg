({
	packItem  : function(component, event, helper) {
        var btnSource = event.getSource().get("v.disabled");
        var itemVar = component.get("v.item");
        itemVar.Packed__c = true;
        component.set("v.item",itemVar);
        btnSource.set("v.disabled",true);
		
	}
})