import { LightningElement } from 'lwc';

export default class ParComp3 extends LightningElement {
    // listIsNotEmpty = true;
    selectedMember;

    members = [
        {
            id: 1,
            name: 'Employee 1',
            role: 'Manager'
        },
        {
            id: 2,
            name: 'Employee 2',
            role: 'Assistant Manager'
        },
        {
            id: 3,
            name: 'Employee 3',
            role: 'Team Lead'
        },
        {
            id: 4,
            name: 'Employee 4',
            role: 'Emp Cadre 1'
        },
        {
            id: 5,
            name: 'Employee 5',
            role: 'Emp Cadre 2'
        }
    ];

    get listIsNotEmpty(){
        return this.members.length > 0 && this.members && Array.isArray(this.members);
    }

    memberSelected(event){
        const id = event.detail;

        this.selectedMember = this.members.find(member => member.id === id);
        console.log(this.selectedMember);
    }

}