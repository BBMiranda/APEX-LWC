public without sharing class OpportunitySummaryController {
  public static Integer openCount {get;set;}
  public static Integer wonCount {get;set;}
  public static Integer lostCount {get;set;}
  public static Integer totalCount {get;set;}

  public static Decimal openCountPercent {get;set;}
  public static Decimal wonCountPercent {get;set;}
  public static Decimal lostCountPercent {get;set;}
  public static Decimal totalCountPercent {get;set;}

  public static Decimal openAmount {get;set;}
  public static Decimal wonAmount {get;set;}
  public static Decimal lostAmount {get;set;}
  public static Decimal totalAmount {get;set;}

  public static Decimal openAmountPercent {get;set;}
  public static Decimal wonAmountPercent {get;set;}
  public static Decimal lostAmountPercent {get;set;}
  public static Decimal totalAmountPercent {get;set;}

  public OpportunitySummaryController(){
      Id accountId = (Id)ApexPages.currentPage().getParameters().get('id');
      OpportunityDAO objDAO = new OpportunityDAO();
      openCount = objDAO.qtde(accountId, 'open');
      wonCount = objDAO.qtde(accountId, 'won');
      lostCount = objDAO.qtde(accountId, 'lost');
      totalCount = objDAO.qtde(accountId, 'total');

      openCountPercent = (((Decimal)openCount/(Decimal)totalCount)*100).setScale(2);
      wonCountPercent = (((Decimal)wonCount/(Decimal)totalCount)*100).setScale(2);
      lostCountPercent = (((Decimal)lostCount/(Decimal)totalCount)*100).setScale(2);
      totalCountPercent = (((Decimal)totalCount/(Decimal)totalCount)*100).setScale(2);

      openAmount = objDAO.retornaAmountSum(accountId, 'open');
      wonAmount = objDAO.retornaAmountSum(accountId, 'won');
      lostAmount = objDAO.retornaAmountSum(accountId, 'lost');
      totalAmount = objDAO.retornaAmountSum(accountId, 'total');

      if(totalAmount != 0){
          openAmountPercent = ((openAmount/totalAmount)*100).setScale(2);
          wonAmountPercent = ((wonAmount/totalAmount)*100).setScale(2);
          lostAmountPercent = ((lostAmount/totalAmount)*100).setScale(2);
          totalAmountPercent = ((totalAmount/totalAmount)*100).setScale(2);
      }else{
          openAmountPercent = 0;
          wonAmountPercent = 0;
          lostAmountPercent = 0;
      }
  }
}