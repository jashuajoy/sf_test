import { LightningElement, wire, track } from 'lwc';
import getAllMethod from '@salesforce/apex/StuCls.getAllRecords';

const Fcolumns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Phone', fieldName: 'number__c', type: 'Phone' },
    { label: 'Email', fieldName: 'email__c', type: 'Email' },
    { label: 'Join Date', fieldName: 'joindate__c', type: 'Date' },
    { label: 'Course', fieldName: 'course__c' },
];

export default class AppGetAllPageComp extends LightningElement {
    allRecords;
    err;

    @wire(getAllMethod)
    resource({ data, error }) {
        if (data) {
            this.allRecords = data;
            this.setPages(this.allRecords);
        }

        if (error) {
            this.err = error;
        }
    };

    // data=[];
    @track page = 1;
    perpage = 100;
    @track pages = [];
    set_size = 5;

    columns = Fcolumns;

    renderedCallback() {
        this.renderButtons();
    }
    renderButtons = () => {
        this.template.querySelectorAll('button').forEach((but) => {
            but.style.backgroundColor = this.page === parseInt(but.dataset.id, 10) ? 'yellow' : 'white';
        });
    }

    get pagesList() {
        let mid = Math.floor(this.set_size / 2) + 1;
        if (this.page > mid) {
            return this.pages.slice(this.page - mid, this.page + mid - 1);
        }
        return this.pages.slice(0, this.set_size);
    }

    connectedCallback() {
        // this.data = await getAccountList();
        
    }

    pageData = () => {
        let page = this.page;
        let perpage = this.perpage;
        let startIndex = (page * perpage) - perpage;
        let endIndex = (page * perpage);
        return this.allRecords.slice(startIndex, endIndex);
    }

    setPages = (data) => {
        let numberOfPages = Math.ceil(data.length / this.perpage);
        for (let index = 1; index <= numberOfPages; index++) {
            this.pages.push(index);
        }
    }

    get hasPrev() {
        return this.page > 1;
    }

    get hasNext() {
        return this.page < this.pages.length
    }

    onNext = () => {
        ++this.page;
    }

    onPrev = () => {
        --this.page;
    }

    onPageClick = (e) => {
        this.page = parseInt(e.target.dataset.id, 10);

    }

    get currentPageData() {
        return this.pageData();
    }

}