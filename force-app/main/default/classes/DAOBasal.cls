public with sharing class DAOBasal {
  
  @AuraEnabled
  public static string methodName(){
    try {
      
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
  public static Boolean gravaDados(String nome, String condicao, String genero, Decimal peso, Decimal altura, Integer idade, Decimal resultado){
    try{
      Basal__c b = new Basal__c();
      b.Name = nome;
      b.Condition__c = condicao;
      b.Gender__c = genero;
      b.Weight__c = peso;
      b_Height__c = altura;
      b.Age__c = idade;
      b.Calories__c = resultado;
      insert b;
      if ((b.Id != null)) {
        return true;
      } else {
        return false;
      }
      
    }catch(Exception e){
      System.debug(e.getMessage());
      return false;
    } 
  }
}