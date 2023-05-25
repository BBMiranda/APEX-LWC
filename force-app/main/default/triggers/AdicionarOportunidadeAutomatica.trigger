/**
  O trigger AdicionarOportunidadeAutomatica é acionado após a inserção e atualização de registros da entidade Account.
  Ele é responsável por adicionar oportunidades automaticamente a contas que não possuem oportunidades relacionadas.
*/

trigger AdicionarOportunidadeAutomatica on Account (after insert, after update) {
  // Obtém os IDs das contas afetadas pelo trigger
  Set<Id> accountIds = Trigger.newMap.keySet();
  // Recupera as contas com suas oportunidades relacionadas
  List<Account> contasComOportunidades = AccountDAO.getAccountsWithOpportunities(accountIds);

  // Verifica se há contas sem oportunidades relacionadas
  if (!contasComOportunidades.isEmpty()) {
      // Cria oportunidades automaticamente para as contas
      AdicionarOportunidadeHelper.criarOportunidades(contasComOportunidades);
  }
}