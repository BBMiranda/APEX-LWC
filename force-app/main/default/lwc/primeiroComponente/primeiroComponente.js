import { LightningElement } from 'lwc';

export default class PrimeiroComponente extends LightningElement {


    greeting = 'Mundo';

    changeHandler(event){
        this.greeting = event.target.value;
}

}