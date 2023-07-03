import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigationLinkExample extends NavigationMixin(LightningElement) {

    url;
    accountHomePageRef;

    connectedCallback() {
        // PageReference object
        this.accountHomePageRef = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'list'
            },
            state: {
                filterName: 'Recent'
            }
        };

        this[NavigationMixin.GenerateUrl](this.accountHomePageRef)
            .then(url => this.url = url);
    }

    handleClick(evt) {
        evt.preventDefault();
        evt.stopPropagation();

        this[NavigationMixin.Navigate](this.accountHomePageRef);
    }
}