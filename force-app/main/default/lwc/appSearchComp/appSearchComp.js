import { LightningElement } from 'lwc';
import searchRecord from '@salesforce/apex/StuCls.searchRecord';

export default class AppSearchComp extends LightningElement {
    name;
    allRecords;
    error;
    noRecords;

    handleInput(event){
        this.name = event.target.value;
    }

    handleGetRecords(event){
        console.log("in get records");
        this.search();
    }

    handleKeyUp(evt) {
        const isEnterKey = evt.keyCode === 13;

        if (isEnterKey) {
            this.name = evt.target.value;
            this.search();
        }
    }

    search(){
        const obj = {
            searchString: this.name
        };
        
        console.log("in search");
        
        console.log(obj);
        
        searchRecord(obj)
        .then((result) => {
            console.log("got result");
            if(result.length > 0){
                this.allRecords = result;
                this.error = undefined;
                this.noRecords = false;
            }else{
                this.allRecords = undefined;
                this.noRecords = true;
            }
            // console.log(result);
            // this.allRecords = result;
            // this.error = undefined;
            // this.noRecords = false;
        })
        .catch((error) => {
            console.log("got error");
            this.error = error;
            this.allRecords = undefined;
        });

    }
    
}