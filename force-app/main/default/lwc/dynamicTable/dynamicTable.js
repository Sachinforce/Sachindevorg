import { LightningElement, track } from 'lwc';

export default class DynamicTable extends LightningElement {

    @track rowItems = [{FirstName: '', LastName:'', RowNumber:1, display:true}];
    // processedListWithDisplay = [{FirstName: '', LastName:'', RowNumber:1, display:false}];
    // {FirstName:'', LastName:'', RowNumber:'', display:false}
    @track rowIndex = 1;

    addRowHandler(event){
        console.log('addRowHandler-Row-Index ' + this.rowIndex);
        const newRowNumber = this.rowIndex + 1;
        this.rowItems.push({FirstName:'',LastName:'', RowNumber:newRowNumber, display:false});
        console.log('this.rowItems Array after inserting' + JSON.stringify(this.rowItems));
        this.rowIndex = this.rowIndex + 1;
    }
    deleteRowHandler(event){
        console.log('deleteev ' +event.currentTarget.dataset.id);
        console.log('deleteindex ' + this.ariaRowIndex);


    }
    onSaveHandler(event){
    }
    firstNameHandler(event){
    }
    lastNameHandler(event){
    }

    get processedList(){
        //         return this.rowItems.map((item, index) =>{
        //         console.log('in map method ' + item + JSON.stringify(item) + 'index ' + index);
        //         const FirstName = item.FirstName;
        //         const LastName = item.LastName;
        //         const RowNumber = item.RowNumber;
        //         const display = index === 0 ? true : false;
        //         this.processedListWithDisplay.push({FirstName:FirstName, LastName:LastName, RowNumber:RowNumber, display:display});
        //         console.log('processedListWithDisplay ' + this.processedListWithDisplay + 'json - ' + JSON.stringify(this.processedListWithDisplay));
        //         //return this.processedListWithDisplay;
        //         return {
        //             FirstName,
        //             LastName,
        //             RowNumber,
        //             display
        //         };
        //     });
    
        //     this.rowItems.forEach(element => {
        //         this.processedListWithDisplay.push({
        //             FirstName:element.FirstName, 
        //             LastName:element.LastName,
        //             RowNumber: element.RowNumber,
        //             display:element.rowindex===0?true:false
                    
        //         })
        //     });
    
        //this.processedListWithDisplay = [];
        // console.log('1');
        // this.rowItems.forEach(function(element, index){
        //     console.log('2');
        //     this.processedListWithDisplay.push({
        //         FirstName:element.FirstName, 
        //         LastName:element.LastName,
        //         RowNumber: element.RowNumber,
        //         display:index===0?true:false
        //     });
        //     console.log('4');
        //     console.log('array ' + this.processedListWithDisplay);
        // });
        // console.log('5');
        // console.log('length ' + this.processedListWithDisplay.length);
        // return this.processedListWithDisplay;
    }
}