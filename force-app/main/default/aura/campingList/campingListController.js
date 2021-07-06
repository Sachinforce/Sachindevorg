({
	
        handleAddItem : function(component, event, helper) {
        var item = event.getParam("item");
            var action = component.get("c.saveItem");
        action.setParams({
            "camping": item
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var expenses = component.get("v.items");
                expenses.push(response.getReturnValue());
                component.set("v.items", item);
            }
        });
        $A.enqueueAction(action);
       // helper.createItem(component, newCamping);
    },

       // Load expenses from Salesforce
    doInit : function(component, event, helper) {
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
})