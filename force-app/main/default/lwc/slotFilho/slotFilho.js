import { LightningElement, api } from 'lwc';

export default class SlotFilho extends LightningElement {
    @api courseDetailInfo={
        courseName: 'Salesforce LWC',
        courseFee: 20000,
        duration: 2
    }
    @api displayCourseInfo = false;
}