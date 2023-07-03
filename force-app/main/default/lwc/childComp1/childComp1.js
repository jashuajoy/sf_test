import { api, LightningElement } from 'lwc';

export default class ChildComp1 extends LightningElement {
    @api myval;
    @api name;
    @api phone;
    @api id;

    @api getDataFromParent(vals){
        this.name = vals.name;
        this.phone = vals.phone;
        this.id = vals.id;
    }

}