({
	myAction : function(component, event, helper) {
         var action = component.get("c.getPickListValuesIntoList");
        action.setParams({
            objectType: component.get("v.sObjectName"),
            selectedField: component.get("v.fieldName")
        });
        action.setCallback(this, function(response) {
            var list = response.getReturnValue();
            component.set("v.picklistValues", list);
        })
        $A.enqueueAction(action);
		
	},
    doInit : function(component, event, helper) {
         var action = component.get("c.getSObjectList");
       action.setCallback(this, function(response) {
            var list = response.getReturnValue();
            component.set("v.sObjectValues", list);
        })
        $A.enqueueAction(action);
		
	}
})