import { LightningElement, api} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';


export default class Navtab extends NavigationMixin(LightningElement) {
    @api tabName = 'Student_UI_2';
    @api label = 'Navigate to tab2';
    url = '/lightning/n/Student_UI_2';
    navigateNext() {
        this[NavigationMixin.Navigate]({
            // type: 'standard__navItemPage',
            // attributes: {
            //     apiName: this.tabName,
            // }
            type: 'standard__webPage',
            attributes: {
                url: this.url
            }
        });
    }

}