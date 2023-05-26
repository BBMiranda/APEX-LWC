//A classe OpportunityDAO fornece um método auxiliar para inserir tarefas no Salesforce.
public with sharing class oppDAO {
  
  public static void insertTasks(List<Task> tasks) {
        // Verifica se a lista de tarefas não está vazia
        if (!tasks.isEmpty()) {
            // Insere as tarefas no Salesforce
            insert tasks;
        }
    }
}