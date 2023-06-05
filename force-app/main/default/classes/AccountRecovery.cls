public with sharing class AccountRecovery {
  // Método para recuperar contas excluídas dentro de um intervalo de datas especificado
  public static List<Map<Id, Account>> recoverDeletedAccounts(Date startDate, Date endDate) {
      // Cria uma lista vazia de mapas que mapeiam Id para Account.
      List<Map<Id, Account>> recoveredAccounts = new List<Map<Id, Account>>();
      
      // Realiza uma consulta para recuperar as contas deletadas no período especificado.
      // SystemModstamp é campo ele armazena a data e hora da última modificação feita no registro:
      List<Account> trashAccounts = [SELECT Id, Name, AccountNumber, Website, Phone FROM Account WHERE IsDeleted = true AND SystemModstamp >= :startDate AND SystemModstamp <= :endDate WITH SECURITY_ENFORCED ALL ROWS];
      
      // Realiza a operação de undelete nas contas recuperadas e armazena o resultado.
      Database.UndeleteResult[] resultadoUndelete = Database.undelete(trashAccounts, false);
  
      // Consulta as contas que foram permanentemente deletadas no período especificado.
      List<Account> permanentlyDeletedAccounts = [SELECT Id, Name, AccountNumber, Website, Phone FROM Account WHERE IsDeleted = true AND SystemModstamp >= :startDate AND SystemModstamp <= :endDate WITH SECURITY_ENFORCED ALL ROWS];
      
      // Cria uma lista de contas para serem recuperadas com novos valores para o campo AccountNumber.
      List<Account> contasParaRecuperacao = new List<Account>();
      for(Account a:permanentlyDeletedAccounts){
          System.debug(a.Id+' - '+a.Name);
          Account co = new Account();
          co = a.clone();
          co.accountNumber = '12345678';
          
          contasParaRecuperacao.add(co);
      }
      insert contasParaRecuperacao;

      // Cria um mapa que mapeia o Id da conta para a própria conta recuperada da lixeira.
      Map<Id, Account> recoveredTrashAccounts = new Map<Id, Account>();
      for (Account account : trashAccounts) {
          recoveredTrashAccounts.put(account.Id, account);
      }
      
      // Cria um mapa que mapeia o Id da conta para a própria conta permanentemente deletada.
      Map<Id, Account> permanentlyDeletedMap = new Map<Id, Account>();
      for (Account account : permanentlyDeletedAccounts) {
          permanentlyDeletedMap.put(account.Id, account);
      }
      
      // Adiciona os mapas criados na lista de mapas de contas recuperadas.
      recoveredAccounts.add(recoveredTrashAccounts);
      recoveredAccounts.add(permanentlyDeletedMap);
      
      // Retorna a lista de mapas de contas recuperadas.
      return recoveredAccounts;
  }
}