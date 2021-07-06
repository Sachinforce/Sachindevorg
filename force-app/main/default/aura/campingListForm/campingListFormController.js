({
	clickCreateItem : function(component, event, helper) {
	var validExpense = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validExpense){
            // Create the new expense
            var newItem = component.get("v.newItem");
            console.log("Create expense: " + JSON.stringify(newItem));
            // var items = component.get("v.items");
              helper.createItem(component,newItem);
        // Copy the expense to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
        /*var newItemCamping = JSON.parse(JSON.stringify(newItem));
 
       console.log("Expenses before 'create': " + JSON.stringify(items));
		items.push(newItemCamping);
		component.set("v.items", items);
		console.log("Expenses after 'create': " + JSON.stringify(items));*/
               }
    },
})