import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavegarHomeAccount extends NavigationMixin(LightningElement) {

    navegarHomeAccount(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes:{
                objectApiName: 'Account',
                actionName: 'home'
            }
        })
    }
    navegarRecently(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes:{
                objectApiName: 'Account',
                actionName: 'list'
            },
            state:{
                filterName: 'Recent'
            }
        })
    }
    insertNewAccount(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes:{
                objectApiName: 'Account',
                actionName: 'new'
            },
            state:{
                defaultFieldValues: 'AccountNumber=1235,Name=Salesforce,NumberOfEmployees=1250',
                nooverride: '1'
            }
        })
    }
    navegarParaVerRegistro(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0018b00002P67igAAB',
                objectApiName: 'Account',
                actionName: 'view'
            }
        })
    }
    navegarParaEditarRegistro(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0018b00002P67igAAB',
                objectApiName: 'Account',
                actionName: 'edit'
            }
        })
    }
}