import { LightningElement, track } from 'lwc';
import searchRecord from '@salesforce/apex/StuCls.searchRecord';
import deleteRecord from '@salesforce/apex/StuCls.deleteRecord';

export default class AppSearchComp extends LightningElement {
    name;
    @track allRecords;
    error;
    noRecords;
    delId;
    delError;
    ind;
    isDel;

    // for deleting
    handleDelete(event){
        console.log("in handle delete");
        this.delId = event.target.value;
        this.ind = event.target.id;
        this.delete();
    }


    // for searching
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

    // search for records
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
                this.allRecords = JSON.parse(JSON.stringify(result));
                this.error = undefined;
                this.noRecords = false;
            }else{
                this.allRecords = undefined;
                this.noRecords = true;
            }
        })
        .catch((error) => {
            console.log("got error");
            this.error = error;
            this.allRecords = undefined;
        });

    }

    // delete record
    delete(){
        const obj = {
            Id: this.delId
        };

        deleteRecord(obj)
        .then(()=>{
            console.log("successfully deleted the record with id: " + obj.Id);
            this.remove();
        })
        .catch((error)=>{
            this.delError = error;
            console.log("error while deleting");
            console.log(this.delError);
        });

    }

    remove(){
        this.allRecords.splice(this.ind, 1);
        console.log("deleted");
        this.isDel = true;
    }
}