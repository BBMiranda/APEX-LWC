public with sharing class ExercicioTipos {
  public static void triagem(List<SObject> lista){
    List<Account> acc = new List<Account>();
    List<Opportunity> opp = new List<Opportunity>();
        for(SObject sobj:lista){
            if(sobj instanceof Account){
                Account a = (Account)sobj;
                Double aleatorio = Math.random();
                String aleatorioString = String.valueOf(aleatorio);
                a.AccountNumber = aleatorioString.right(8);
                System.debug(a.AccountNumber);
                acc.add(a);
            }else{
                Opportunity o = (Opportunity)sobj;
                opp.add(o);
            }
        }
        insert acc;
        insert opp;
  } 
}