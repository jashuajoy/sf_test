import { LightningElement } from 'lwc';
import setAcc from '@salesforce/apex/Data1Cls.setAccount';

export default class CompData1Inp extends LightningElement {
    name;
    phone;
    Id;
    error;

    handleName(event){
        this.name = event.target.value;
    }
    handlePhone(event){
        this.phone = event.target.value;
    }

    handleInput(event){
        setAcc({ name: this.name, phone: this.phone })
        .then((data) => { this.Id = data; })
        .catch((err) => { this.error = err; });
    }
    
}