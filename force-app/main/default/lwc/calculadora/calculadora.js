import { LightningElement } from 'lwc';

export default class Calculadora extends LightningElement {
    priNumero;
    segNumero;
    total;

    priNumeroChange(event){
        this.priNumero = event.target.value;
    }

    segNumeroChange(event){
        this.segNumero = event.target.value;
    }

    somar(event){
        this.total = Number(this.priNumero)+Number(this.segNumero);
    }
    subtrair(event){
        this.total = Number(this.priNumero)-Number(this.segNumero);
    }
    multiplicar(event){
        this.total = Number(this.priNumero)*Number(this.segNumero);
    }
    dividir(event){
        this.total = Number(this.priNumero)/Number(this.segNumero);
    }
    limpar(event){
            this.priNumero = null;
            this.segNumero = null;
            this.total = null;
    }
}