public with sharing class AdicionarOportunidadeHelper {
  public static void criarOportunidades(List<Account> contasComOportunidades) {
      List<Opportunity> opportunitiesToInsert = new List<Opportunity>();
      List<Account> accountsToUpdate = new List<Account>();

      for (Account acc : contasComOportunidades) {
          if (acc.Opportunities.isEmpty()) {
              Opportunity opp = new Opportunity();
              opp.Name = 'Oportunidade automática da conta ' + acc.Name;
              opp.AccountId = acc.Id;
              opp.StageName = 'Prospecting'; // Define o valor desejado para StageName
              opp.CloseDate = Date.today().addMonths(1); // Define o valor desejado para CloseDate

              opportunitiesToInsert.add(opp);
              accountsToUpdate.add(new Account(Id = acc.Id));
          }
      }

      if (!opportunitiesToInsert.isEmpty()) {
          insert opportunitiesToInsert;
      }

      if (!accountsToUpdate.isEmpty()) {
          update accountsToUpdate;
      }
  }
}