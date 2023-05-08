import { LightningElement } from 'lwc';
import Id from '@salesforce/user/Id';
import guest from '@salesforce/user/isGuest';
export default class UserInfo extends LightningElement {

userId;
tipo;

tipoUsuario(){
    if(guest){
        this.tipo = 'É convidado.'
        this.userId = '';
    } else {
        this.tipo = 'Não é convidado.'
        this.userId = Id;
    }
}
connectedCallback(){
    this.tipoUsuario();

}

}