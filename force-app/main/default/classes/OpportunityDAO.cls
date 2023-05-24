public with sharing class OpportunityDAO {
  // Esse método busca todas Oportunidades e retorna a quantidade, relacionadas a uma determinada conta.
  public static Integer qtde(Id ident){
    return [SELECT Id FROM Opportunity WHERE AccountId = :ident].size();  
  }
  // Esse método busca as Oportunidades relacionadas à conta, que estão em aberto e retorna a quantidade. 
  public static Integer qtde(Id ident, Boolean closed){
    return [SELECT Id FROM Opportunity WHERE AccountId = :ident AND isClosed = :closed].size();  
  }
  // Esse método busca as Oportunidades relacionadas à conta, que estão fechadas e ganhas, retornando a quantidade.
  public static Integer qtde(Id ident, Boolean ganho){
    return [SELECT Id FROM Opportunity WHERE AccountId = :ident AND isWon = :ganho].size();  
  }
  // Esse método busca as Oportunidades relacionadas à conta, que estão fechadas e não ganhas, retornando a quantidade.     
  public static Integer qtde(Id ident, Boolean closed, Boolean ganho){
    return [SELECT Id FROM Opportunity WHERE AccountId = :ident AND isClosed = :closed AND isWon = :ganho].size();  
  } 
}