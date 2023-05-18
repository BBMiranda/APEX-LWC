trigger AdicionarOportunidadeAutomatica on Account (after insert, after update) {
  Set<Id> accountIds = Trigger.newMap.keySet();
  List<Account> contasComOportunidades = AccountDAO.getAccountsWithOpportunities(accountIds);

  if (!contasComOportunidades.isEmpty()) {
      AdicionarOportunidadeHelper.criarOportunidades(contasComOportunidades);
  }
}