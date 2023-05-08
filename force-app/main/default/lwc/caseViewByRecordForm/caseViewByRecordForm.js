import { LightningElement } from 'lwc';
import CASE_OBJECT from '@salesforce/schema/Case';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import CASE_REASON_FIELD from '@salesforce/schema/Case.Reason';
import CASE_NUMBER_FIELD from '@salesforce/schema/Case.CaseNumber';
//import CASEADDINFO_FIELD from '@salesforce/schema/Case.Case_Add_Info__c';



export default class CaseViewByRecordForm extends LightningElement {

  caseObject = CASE_OBJECT
  caseRecordId = '5008b00002IejW6AAJ'
  caseRecordId2 = '5008b00002IejW6AAJ'
  //Para o penúltimo div, em que escolhemos os campos a serem apresentados e editados
  arrayComCampos = [SUBJECT_FIELD, DESCRIPTION_FIELD, ORIGIN_FIELD, CASE_REASON_FIELD];

  //Para o último div para somente visualização
  caseNumberField = CASE_NUMBER_FIELD;
  subjectField = SUBJECT_FIELD;
  caseDescriptionField = DESCRIPTION_FIELD;
}