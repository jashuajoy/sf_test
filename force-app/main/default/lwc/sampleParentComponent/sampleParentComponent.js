import { LightningElement } from 'lwc';

export default class SampleParentComponent extends LightningElement {
    trucks = [
        {
            Id: 1,
            Img: 'https://upload.wikimedia.org/wikipedia/commons/1/11/Freightliner_M2_106_6x4_2014_%2814240376744%29.jpg',
            Name: 'Truck 1',
            Mileage: '30 kmpl',
            Price: '1000'
        },
        {
            Id: 2,
            Img: 'https://upload.wikimedia.org/wikipedia/commons/1/11/Freightliner_M2_106_6x4_2014_%2814240376744%29.jpg',
            Name: 'Truck 2',
            Mileage: '60 kmpl',
            Price: '3000'
        },
        {
            Id: 3,
            Img: 'https://upload.wikimedia.org/wikipedia/commons/1/11/Freightliner_M2_106_6x4_2014_%2814240376744%29.jpg',
            Name: 'Truck 3',
            Mileage: '40 kmpl',
            Price: '2000'
        },
    ];
}