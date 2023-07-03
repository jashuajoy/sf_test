import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
import { reduceErrors } from 'c/ldsUtils';


const fields = [
    {label : 'Contact First Name', fieldName : FirstName.fieldApiName, type : 'text'},
    {label : 'Contact Last Name', fieldName : LastName.fieldApiName, type : 'text'},
    {label : 'Contact Email', fieldName : Email.fieldApiName, type : 'email'}
];


export default class ContactList extends LightningElement {
    cons;
    errors;

    columns = fields;

    @wire(getContacts)
    response({data, error}){
        if(data){
            this.cons = data;
            console.log(data);
        }
        if(error){
            this.errors = error;
            console.log(this.errors);
        }
    }

    get errors(){
        return (this.errors) ? 
            reduceErrors(this.errors) : [];
    }
}