import { LightningElement, wire } from 'lwc';
import findAccounts from '@salesforce/apex/AccountManager.findAllAccount';

export default class AccountMasterDisplay extends LightningElement {
    allAccounts;
    errorDetails;
    @wire(findAccounts)
    processAllAccount({error, data}){
        if(data){
            this.allAccounts = data;
        }else if(error){
            this.errorDetails = error;
        }
    }
    
}