import { LightningElement, api } from 'lwc';

export default class CompositionPai extends LightningElement {

    @api nomeCursoPai = 'Salesforce Aura Component';
    @api valorCursoPai = '4900';
    atualizaValorPai(){
        this.template.querySelector('c-composition-filho').atualizaValor();
    }
}