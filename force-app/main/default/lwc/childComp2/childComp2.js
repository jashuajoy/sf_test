import { LightningElement, track } from 'lwc';

export default class ChildComp2 extends LightningElement {
    // @track
    myVal;

    handleInput(event){
        this.myVal = event.target.value;
    }

    sendDataToParentHandler(event){
        const myCustomEvent = new CustomEvent("getdata", { detail: this.myVal });
        this.dispatchEvent(myCustomEvent);
    }

}