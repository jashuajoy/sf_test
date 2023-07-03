import { LightningElement, wire } from 'lwc';
import getDataToComp from '@salesforce/apex/UseCallouts.getDataToComp';

export default class CalloutComp1 extends LightningElement {
    reqData;
    error;
    people;

    @wire(getDataToComp) 
    resource({data, error}){
        if(data){
            this.reqData = data;
            // console.log(this.reqData.per_page);
            this.people = this.reqData.data;
        }
        if(error){
            this.error = error;
            console.log(this.error);
        }
    };

}