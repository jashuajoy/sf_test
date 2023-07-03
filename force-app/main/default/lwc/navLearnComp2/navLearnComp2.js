import { LightningElement, api} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';


export default class Navtab extends NavigationMixin(LightningElement) {
    @api tabName;
    @api label;

    navigateNext() {
        // Opens the passed tab name if the name is valid
        // else it will show a popup with invalid url message.
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: this.tabName,
            }
        });
    }

    navigateToNewRecordPage() {
        // Opens the new Account record modal
        // to create an Account.
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            }
        });
    }

}