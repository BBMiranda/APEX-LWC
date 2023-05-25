/*
A classe DAOTriggers contém um método chamado insereOportunidadesOptadasNaConta, que recebe uma lista de oportunidades como parâmetro. 
Esse método realiza a inserção das oportunidades no banco de dados por meio do método Database.insert. Em seguida, ele itera 
sobre os resultados do salvamento e, se o salvamento for bem-sucedido, exibe o ID da oportunidade no log. 
Caso ocorra um erro durante o salvamento, ele obtém os erros retornados e exibe as mensagens correspondentes.        
*/

public with sharing class DAOTriggers {
  public void insereOportunidadesOptadasNaConta(List<Opportunity> ops) {
      // Insere as oportunidades no banco de dados e retorna os resultados
      Database.SaveResult[] resultados = Database.insert(ops, false);
      
      // Itera sobre os resultados de salvamento
      for (Database.SaveResult dr : resultados) {
          if (dr.isSuccess()) {
              // Se o salvamento for bem-sucedido, exibe o ID da oportunidade no log
              System.debug('Oportunidade Id ' + dr.getId());
          } else {
              // Se ocorrer um erro durante o salvamento, obtém os erros e exibe as mensagens.
              List<Database.Error> erros = dr.getErrors();
              for (Database.Error dbe : erros) {
                  System.debug(dbe.getMessage());
              }
          }
      }
  }
}


