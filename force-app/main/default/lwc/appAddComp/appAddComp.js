import { LightningElement } from 'lwc';
import addRecordOne from '@salesforce/apex/StuCls.addRecord';

export default class AppAddComp extends LightningElement {
    name;
    phone;
    email;
    date;
    course;
    // outObj = {};
    id;
    error;

    handleName(event){
        this.name = event.target.value;
    }

    handlePhone(event){
        this.phone = event.target.value;
    }

    handleEmail(event){
        this.email = event.target.value;
    }

    handleDate(event){
        this.date = event.target.value;
        console.log(this.date);

    }

    handleCourse(event){
        this.course = event.target.value;
    }


    handleClick(){
        const obj = {
            name: this.name,
            num: this.phone,
            email: this.email,
            joinDate: this.date,
            course: this.course
        };

        console.log("in output");
        console.log(this.name, this.phone, this.email, this.date, this.course);
        console.log(obj);

        addRecordOne(obj)
            .then((result) => {
                this.id = result;
                this.error = undefined;
                console.log(this.id, this.error);
            })
            .catch((error) => {
                this.error = error;
                this.id = undefined;
                console.log(this.id, this.error);
            });
    }
}