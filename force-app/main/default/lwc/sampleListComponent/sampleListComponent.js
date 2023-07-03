import { LightningElement, track } from 'lwc';

export default class SampleListComponent extends LightningElement {

    // @track
    contacts = [
        {
            Id: 1,
            Name: 'Amy Harry',
            Phone: '123'
        },
        {
            Id: 2,
            Name: 'Michael Jo',
            Phone: '123'

        },
        {
            Id: 3,
            Name: 'Jennifer Wong',
            Phone: '123'

        },
    ];
    
    Name = '';
    Phone = '';
    Id = 0;

    handleName(event){
        this.Name = event.target.value;
    }

    handlePhone(event){
        this.Phone = event.target.value;
    }

    handleId(event){
        this.Id = event.target.value;
    }

    handleAdd(){
        this.contacts.push({
            Id: this.Id,
            Name: this.Name,
            Phone: this.Phone
        });

        console.log(this.contacts);
    }

    handleDelete(event){
        this.contacts.splice(event.target.id, 1);
    }

}