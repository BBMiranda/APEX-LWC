import { LightningElement, api } from 'lwc';

export default class CompositionFilho extends LightningElement {
   @api nomeDoCurso = 'Lightning Web Component';
   @api valorDoCurso = 10000;
   @api atualizaValor(){
    this.valorDoCurso = parseFloat(this.valorDoCurso) * 2;
   }
   mudaValorDoCurso(event){
    this.valorDoCurso = event.target.value;
   }
}