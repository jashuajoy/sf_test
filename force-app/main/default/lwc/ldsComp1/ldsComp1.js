import { api, LightningElement } from 'lwc';
import Name from '@salesforce/schema/Account.Name';
import Phone from '@salesforce/schema/Account.Phone';

export default class LdsComp1 extends LightningElement {
    @api objectApiName;
    @api recordId;

    mode = "readonly";
    tmpMd;
    
    fields = [Name, Phone];

    hModeChange(event){
        this.tmpMd = event.target.value;
    }

    handleModeChg(event){
        this.mode = this.tmpMd;
    }
    
}