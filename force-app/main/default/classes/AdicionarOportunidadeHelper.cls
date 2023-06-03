/*
  Exercício: Criar um trigger que adiciona um registro relacionado. 
  No caso de criação de uma conta ou atualização de alguma conta, 
  CASO a conta não possua nenhuma oportunidade relacionada a ela, 
  deverá inserir uma oportunidade em que o nome dessa oportunidade 
  será 'Oportunidade automática da conta '+nomeDaConta. Caso a conta 
  já possua oportunidades relacionadas à ela, não é necessário a criação 
  de nenhuma oportunidade.
*/

public with sharing class AdicionarOportunidadeHelper {
  // Cria oportunidades para as contas que não possuem oportunidades relacionadas.
  public static void criarOportunidades(List<Account> contasComOportunidades) {
      // Lista para armazenar as oportunidades a serem inseridas
      List<Opportunity> opportunitiesToInsert = new List<Opportunity>();
      // Lista para armazenar as contas a serem atualizadas
      List<Account> accountsToUpdate = new List<Account>();

      for (Account acc : contasComOportunidades) {
          // Verifica se a conta não possui oportunidades relacionadas
          if (acc.Opportunities.isEmpty()) {
              // Cria uma nova oportunidade relacionada à conta
              Opportunity opp = new Opportunity();
              opp.Name = 'Oportunidade automática da conta ' + acc.Name;
              opp.AccountId = acc.Id;
              // Define o valor desejado para StageName
              opp.StageName = 'Prospecting'; 
              // Define o valor desejado para CloseDate
              opp.CloseDate = Date.today().addMonths(1); 
              // Adiciona a oportunidade à lista de oportunidades a serem inseridas
              opportunitiesToInsert.add(opp);
              // Adiciona a conta à lista de contas a serem atualizadas (apenas para fins de exemplo)
              accountsToUpdate.add(new Account(Id = acc.Id));
          }
      }
      // Insere as oportunidades, caso haja alguma na lista
      if (!opportunitiesToInsert.isEmpty()) {
          insert opportunitiesToInsert;
      }
      // Atualiza as contas, caso haja alguma na lista (apenas para fins de exemplo)
      if (!accountsToUpdate.isEmpty()) {
          update accountsToUpdate;
      }
  }
}