import { LightningElement } from 'lwc';
import buscaCasePorInicial from '@salesforce/apex/CaseManager.buscaCasosComNomeInicial';
import closeCase from '@salesforce/apex/CaseManager.closeCase';

export default class BuscaCases extends LightningElement {
  inicial;
  cases;
  errorDetails;
  caseId;
  caseCloseMessage;
  fechado;

  mudaInicial(event){
    this.inicial = event.target.value;
    buscaCasePorInicial({inicial: this.inicial})
      .then(result => {
        this.cases = result;
      })
      .catch(error => {
        this.errorDetails = error;
      })
  }

  passCaseToClose(event){
    this.caseId = event.target.name;
    closeCase({caseId: this.caseId})
      .then(result=>{
        this.caseCloseMessage = result;
        alert(this.caseCloseMessage);
        return buscaCasePorInicial({inicial: this.inicial});
      })
      .then(result => {
        this.cases = result; 
      })
      .catch(error=>{
        this.errorDetails = error;
      })
  }

}