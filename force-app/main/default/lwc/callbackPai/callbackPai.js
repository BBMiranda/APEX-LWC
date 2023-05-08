import { LightningElement } from 'lwc';

export default class CallbackPai extends LightningElement {
    show = false;
    handleShowHide(){
        this.show = !this.show;
    }
    renderedCallback(){
        //alert("O pai foi renderizado");
    }
}