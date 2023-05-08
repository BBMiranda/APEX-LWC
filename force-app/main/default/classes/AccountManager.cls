public with sharing class AccountManager {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> findAllAccount(){
        try {
            return [SELECT Id, Name, AccountNumber, Phone, website FROM Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}