import { LightningElement } from 'lwc';

export default class SampleComponent extends LightningElement {
    name = "Joy";
    isInputVisible = false;

    handleChange(event){
        this.name = event.target.value;
    }

    handleChangeCheck(event){
        this.isInputVisible = event.target.checked;
    }

    get name(){
        return this.name;
    }


}