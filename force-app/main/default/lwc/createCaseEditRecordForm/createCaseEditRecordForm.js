import { LightningElement } from 'lwc';
import CASE_OBJECT from '@salesforce/schema/Case';
import CASENUMBER_FIELD from '@salesforce/schema/Case.CaseNumber';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
// import CASEADDINFO_FIELD from '@salesforce/schema/Case.Case_Add_Info__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateCaseEditRecordForm extends LightningElement {

  caseObject = CASE_OBJECT
  statusField = STATUS_FIELD
  originField = ORIGIN_FIELD
  //addInfoField = CASEADDINFO_FIELD
  subjectField = SUBJECT_FIELD
  descField = DESCRIPTION_FIELD
  //addInfoDfltValue = 'This is sample value'
  originValue = 'Phone'

  handleCaseCreated(event){
    const evt = new ShowToastEvent({
      title: 'Case Created',
      message: 'Record Id '+event.detail.id,
      variant: "success"
    })
    this.dispatchEvent(evt);
  }

  handleCancel(event){
    const inputFields = this.template.querySelectorAll('lightning-input-field')
    if(inputFields){
      inputFields.forEach(field => {
        field.reset()
      })
    }
  }
}