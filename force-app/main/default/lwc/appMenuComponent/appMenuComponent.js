import { LightningElement } from 'lwc';

export default class AppMenuComponent extends LightningElement {
    isAdd = false;
    isDel = false;
    isGetAll = true;
    isSearch = false;

    handleAdd(event){
        this.isAdd = !this.isAdd;
        this.isDel = false;
        this.isGetAll = false;
        this.isSearch = false;
    }

    handleDelete(event){
        this.isDel = !this.isDel;
        this.isAdd = false;
        this.isGetAll = false;
        this.isSearch = false;
    }

    handleGetAll(event){
        this.isGetAll = !this.isGetAll;
        this.isAdd = false;
        this.isDel = false;
        this.isSearch = false;
    }

    handleSearch(event){
        this.isSearch = !this.isSearch;
        this.isAdd = false;
        this.isDel = false;
        this.isGetAll = false;
    }
}