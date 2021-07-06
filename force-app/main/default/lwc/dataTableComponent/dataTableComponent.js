/* eslint-disable no-alert */
/* eslint-disable no-unused-vars */
import { LightningElement, track, wire, api } from 'lwc';
import getContactList from '@salesforce/apex/LWCDemoContact.getContactList';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {refreshApex} from '@salesforce/apex';
import { NavigationMixin } from 'lightning/navigation';
const columns = [
    { label: 'Name', fieldName: 'name' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' }
];

const actions = [
    { label: 'Edit', name: 'edit' },
    { label: 'Delete', name: 'delete' },
];

export default class DataTableCOntact extends LightningElement {
    /*@track data = [];
    @track columns = columns;

    async connectedCallback() {
        const data = await dataTableCOntactHelper({ amountOfRecords: 100 });
        this.data = data;
    }
    columns = [
        { label: 'Id', fieldName: 'Id' },
        { label: 'Name', fieldName: 'Name', type: 'text', sortable: true },
        { label: 'AccountId', fieldName: 'AccountId', type: 'Id' },
        { label: 'Email', fieldName: 'Email', type: 'email' },
    ];*/

    @track contacts;
    @track columns = [
        { label: 'Id', fieldName: 'Id' },
        { label: 'Name', fieldName: 'Name', type: 'text', sortable: true },
        { label: 'AccountId', fieldName: 'AccountId', type: 'Id' },
        { label: 'Email', fieldName: 'Email', type: 'email' },
        {
            type: 'action',
            typeAttributes: { rowActions: actions },
        }
    ];
    @track error;
    @track record = [];
    @track bShowModal = false;
    @track currentRecordId;
    @track isEditForm = false;
    @track showLoadingSpinner = false;
    refreshTable;

    @wire(getContactList)
    wiredContacts({ error, data }) {
        //alert(JSON.stringify(data));
        if (data) {
            this.contacts = data;
            this.refreshTable = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        switch (actionName) {
            case 'delete':
                this.deleteRow(row);
                break;
            case 'edit':
                this.editRecord(row);
                break;
            default:
        }
    }

    deleteRow(currentRow) {
        deleteRecord(currentRow.Id)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Record deleted',
                        variant: 'success'
                    })
                );
                // Navigate to a record home page after
                // the record is deleted, such as to the
                // contact home page
                /*this[NavigationMixin.Navigate]({
                    type: 'standard__objectPage',
                    attributes: {
                        objectApiName: 'Contact',
                        actionName: 'home',
                    },
                });*/
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting record',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }

    editRecord(currentRow){
         // open modal box
         this.bShowModal = true;
         this.isEditForm = true;
 
         // assign record id to the record edit form
         this.currentRecordId = currentRow.Id;
    
    }
    handleSuccess() {
        //return refreshApex(this.refreshTable);
    }
    handleSubmit(event) {
        // prevending default type sumbit of record edit form
        event.preventDefault();

        // querying the record edit form and submiting fields to form
        this.template.querySelector('lightning-record-edit-form').submit(event.detail.fields);

        // closing modal
        this.bShowModal = false;

        // showing success message
        this.dispatchEvent(new ShowToastEvent({
            title: 'Success!!',
            message: event.detail.fields.FirstName + ' '+ event.detail.fields.LastName +' Contact updated Successfully!!.',
            variant: 'success'
        }),);

    }

}