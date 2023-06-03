public with sharing class OpportunityDAO {

  public Integer qtde(Id ident, String tipo){
      switch on tipo{
          when 'open'{
              return [SELECT Id FROM Opportunity WHERE AccountId = :ident AND isClosed = false].size();
          }
          when 'won'{
              return [SELECT Id FROM Opportunity WHERE AccountId = :ident AND isWon = true].size();
          }
          when 'lost'{
              return [SELECT Id FROM Opportunity WHERE AccountId = :ident AND isClosed = true AND isWon = false].size();
          }
          when 'total'{
              return [SELECT Id FROM Opportunity WHERE AccountId = :ident].size();
          }
          when else{
              return 0;
          }
      }
  }
      public Decimal retornaAmountSum(Id ident, String tipo){
          switch on tipo{
              when 'open'{
                  List<AggregateResult> somaOportunidades = [SELECT SUM(Amount) oAmount FROM Opportunity WHERE AccountId = :ident AND isClosed = false WITH SECURITY_ENFORCED];
                  Decimal openAmount = (Decimal)somaOportunidades[0].get('oAmount');
                  return (openAmount==null)?0:openAmount.setScale(2);
              }
              when 'won'{
                  List<AggregateResult> somaOportunidades = [SELECT SUM(Amount) wAmount FROM Opportunity WHERE AccountId = :ident AND isWon = true WITH SECURITY_ENFORCED];
                  Decimal wonAmount = (Decimal)somaOportunidades[0].get('wAmount');
                  return (wonAmount==null)?0:wonAmount.setScale(2);
              }
              when 'lost'{
                  List<AggregateResult> somaOportunidades = [SELECT SUM(Amount) lAmount FROM Opportunity WHERE AccountId = :ident AND isClosed = true AND isWon = false WITH SECURITY_ENFORCED];
                  Decimal lostAmount = (Decimal)somaOportunidades[0].get('lAmount');
                  return (lostAmount==null)?0:lostAmount.setScale(2);
              }
              when 'total'{
                  List<AggregateResult> somaOportunidades = [SELECT SUM(Amount) tAmount FROM Opportunity WHERE AccountId = :ident WITH SECURITY_ENFORCED];
                  Decimal totalAmount = (Decimal)somaOportunidades[0].get('tAmount');
                  return (totalAmount==null)?0:totalAmount.setScale(2);
              }
              when else{
                  return 0;
              }
      }
  }
}