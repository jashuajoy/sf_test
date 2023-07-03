import { api, LightningElement } from 'lwc';

export default class ChildComp3 extends LightningElement {
    @api member;

    selectHandler(event){
        event.preventDefault();

        const myEvent = new CustomEvent("memberclicked", {
            detail: this.member.id
        });

        this.dispatchEvent(myEvent);
    }
}