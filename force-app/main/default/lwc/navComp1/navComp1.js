import { api, LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavComp1 extends NavigationMixin(LightningElement) {
    @api recordId;
    myData;

    // otherCompRef;

    // connectedCallback(){
    //     this.otherCompRef = {
            
    //     };
    // }

    dataHandler(event){
        this.myData = event.target.value;
    }

    buttonHandler(event){
        let targetDest = {
            componentDef: 'c:navComp1Dest',
            attributes: {
                rId: this.recordId,
                myData: this.myData
            }
        }

        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: 'one/one.app#' + btoa(JSON.stringify(targetDest))
            }
        });
    }

}