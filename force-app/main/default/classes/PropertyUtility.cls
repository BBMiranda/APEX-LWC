public with sharing class PropertyUtility {
  public static void newListedProperties(){
      List<Property__c> newPropList = [SELECT Id, Name, Broker__r.Email__c, Days_On_Market__c  FROM Property__c WHERE Days_On_Market__c <=30 WITH SECURITY_ENFORCED];
      for(Property__c p:newProplist){
          String propEmail = p.Name + ' : '+ p.Broker__r.Email__c;
          System.debug(propEmail);
      }
  }
}