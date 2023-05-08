import { LightningElement } from 'lwc';

export default class CallbackFilho extends LightningElement {

    connectedCallback(){
        //alert("connectedCallback do Filho chamado");
    }
    disconnectedCallback(){
        //alert('disconnectedCallback do Filho chamado')
    }
    renderedCallback(){
        //alert("O filho foi renderizado");
    }
}