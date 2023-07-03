import { LightningElement, wire } from 'lwc';
import getAllMethod from '@salesforce/apex/StuCls.getAllRecords';

export default class AppGetAllComp extends LightningElement {
    allRecords;
    err;

    @wire(getAllMethod) 
    resource({data, error}){
        if(data){
            this.allRecords = data;
        }

        if(error){
            this.err = error;
        }
    };

    
}