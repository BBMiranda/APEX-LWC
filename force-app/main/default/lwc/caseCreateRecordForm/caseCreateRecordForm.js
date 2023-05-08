import { LightningElement } from 'lwc';
import CASE_OBJECT from '@salesforce/schema/Case';

import CASENUMBER_FIELD from '@salesforce/schema/Case.CaseNumber';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
//import CASEADDINFO_FIELD from '@salesforce/schema/Case.Case_Add_Info__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CaseCreateRecordForm extends LightningElement {

  caseObject = CASE_OBJECT;

  caseFields = [CASENUMBER_FIELD, STATUS_FIELD, ORIGIN_FIELD, SUBJECT_FIELD, DESCRIPTION_FIELD]

  handleCaseCreated(event){
    const evt = new ShowToastEvent({
      title: 'Case Created',
      message: 'Record Id '+event.detail.id,
      variant: "success"
    })
    this.dispatchEvent(evt);
  }

}