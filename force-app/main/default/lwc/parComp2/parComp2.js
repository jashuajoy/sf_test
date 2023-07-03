import { LightningElement } from 'lwc';

export default class ParComp2 extends LightningElement {
    occupation;

    getDataHandler(event){
        this.occupation = event.detail;
    }
}