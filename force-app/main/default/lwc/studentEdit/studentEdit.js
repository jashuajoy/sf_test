import { LightningElement, api } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class StudentEdit extends LightningElement {
    @api recordId;
    @api objectApiName;
  
    handleSuccess(e) {
        // Close the modal window
        this.dispatchEvent(new CloseActionScreenEvent());

        // and display a success toast message
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Record Edited!',
                variant: 'success'
            })
        );
    }
}