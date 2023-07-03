import { LightningElement } from 'lwc';

export default class ParComp1 extends LightningElement {
    Name = '';
    Phone = '';
    Id;

    handleName(event){
        this.Name = event.target.value;
    }

    handlePhone(event){
        this.Phone = event.target.value;
    }

    handleId(event){
        this.Id = event.target.value;
    }

    sendToChild(){
        let childComp = this.template.querySelector('c-child-comp1');
        let vals = {
            name: this.Name,
            phone: this.Phone,
            id: this.Id
        };

        childComp.getDataFromParent(vals);
    }


}