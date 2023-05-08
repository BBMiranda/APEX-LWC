import { LightningElement, wire } from 'lwc';
import getAllContacts from '@salesforce/apex/ContactManager.buscaTodosContatos';
import getAccountsByBillingStates from '@salesforce/apex/ContactManager.buscaContasPorEstado';
import { NavigationMixin } from 'lightning/navigation';
import getAllAccounts from '@salesforce/apex/ContactManager.getAllAccount';
import getAllContactsFromAnAccount from '@salesforce/apex/ContactManager.buscaContatosPorConta'

export default class ContactMasterDisplay extends NavigationMixin(LightningElement) {
  selectedAccount;
  accountOptions=[];
  errorDetails;
  @wire(getAllAccounts)
  accountProcess({error, data}){
      if(data){
          this.errorDetails = undefined;
          for(var i=0;i<data.length;i++){
            this.accountOptions = [...this.accountOptions, {value:data[i].Id, label:data[i].Name}];
          }
      }else if(error){
          this.data = undefined;
          this.errorDetails = error;
      }
  }

  handleAccountChange(event){
    this.selectedAccount = event.detail.value;
  }

  @wire(getAllContactsFromAnAccount, {accountId: '$selectedAccount'})
  contatosDaConta;
  contactId;
  navigateToDetails(event){
    this.contactId = event.target.value
    this[NavigationMixin.Navigate]({
      type:'standard__recordPage',
      attributes:{
        recordId: this.contactId,
        objectApiName: 'Contact',
        actionName: 'view'
      }
    })
  }





  @wire(getAllContacts)
  contatos;
  contactId;
  navigateToDetails(event){
    this.contactId = event.target.value;
    this[NavigationMixin.Navigate]({
      type:'standard__recordPage',
      attributes:{
        recordId: this.contactId,
        objectApiName: 'Contact',
        actionName: 'view'
      }
    })
  }

  @wire(getAccountsByBillingStates, {estado: 'CA'})
  contas;


  renderedCallback(){
    console.log(this.contatos.data);
    
  }

  
}