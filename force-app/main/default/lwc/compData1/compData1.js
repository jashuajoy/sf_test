import { LightningElement, wire } from 'lwc';
import dataMethod from '@salesforce/apex/Data1Cls.dataMethod';

export default class CompData1 extends LightningElement {
    accs;
    err;

    @wire(dataMethod)
    result({data, error}){
        if(data){
            this.accs = data;
        }else if(error){
            console.log(error);
            this.err = error;
        }
    }
}