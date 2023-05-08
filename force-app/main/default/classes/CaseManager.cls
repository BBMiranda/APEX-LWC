public with sharing class CaseManager {
    
  @AuraEnabled
  public static List<Case> buscaCasosComNomeInicial(String inicial){
    try {
      if(String.isNotBlank(inicial)){
        String stringDeProcura = inicial+'%';
        return [SELECT Id, Account.Name, CaseNumber, IsClosed, Description, Subject, Status FROM Case WHERE Subject LIKE :stringDeProcura];
      }else {
        return null;
      }
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }

  @AuraEnabled
  public static string closeCase(String caseId){
    String message;
    try {
      Case cs = new Case(Id=caseId);
      cs.status = 'Closed';
      update cs;
      message = 'Success';
      return message;
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}