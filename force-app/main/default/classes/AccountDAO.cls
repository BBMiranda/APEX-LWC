public with sharing class AccountDAO {
  public static List<Account> getAccountsWithOpportunities(Set<Id> accountIds) {
    return [SELECT Id, Name, (SELECT Id FROM Opportunities) 
            FROM Account 
            WHERE Id IN :accountIds];
  }
}