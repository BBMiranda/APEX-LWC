public with sharing class ContactManager {

    @AuraEnabled(cacheable=true)
    public static List<Contact> buscaTodosContatos(){
        try {
            return [SELECT Id, Name, Phone, Email, Account.Name FROM Contact];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> buscaContasPorEstado(String estado){
        try {
            if (String.isNotBlank(estado)){
                return [SELECT Id, Name, Phone, website, AccountNumber FROM Account WHERE billingstate = :estado];  
            }else{
                return null;
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAllAccount(){
        try {
            return [SELECT Id, Name FROM Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> buscaContatosPorConta(String accountId){
        try {
            if(String.isNotBlank(accountId)){
                return [SELECT Id, Name, Phone, Email, Account.Name FROM Contact WHERE AccountId =:accountId];
            } else {
                return null;
            }        
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}