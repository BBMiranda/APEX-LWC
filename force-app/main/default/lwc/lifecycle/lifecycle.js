import { LightningElement, api } from 'lwc';

export default class Lifecycle extends LightningElement {

    @api message = "Bem vindo!";
    constructor(){
        super();
        console.log("Conteúdo da variável antes de ser alterado: " + this.message);
        this.message = this.message + "ao ciclo de vida do componente";
        console.log("Conteúdo após concatenação: " + this.message);
        this.message = "Sottelli";
        console.log("Reatribuição do valor de message para Sottelli: " + this.message);
    }

    connectedCallback(){
        console.log("message atribuída antes da atribuição dentro do connectedCallback: " + this.message);
        this.message = "Sotters";
        console.log("message atribuída dentro do connectedCallback: " + this.message);
    }

}