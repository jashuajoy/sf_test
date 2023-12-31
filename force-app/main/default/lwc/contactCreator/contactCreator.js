import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import contObj from '@salesforce/schema/Contact';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';


export default class ContactCreator extends LightningElement {
    objectApiName = contObj;

    fields = [FirstName, LastName, Email];

    handleSuccess(event){
        const toastEvent = new ShowToastEvent({
            title: "Contact Created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });

        this.dispatchEvent(toastEvent);
    }
}