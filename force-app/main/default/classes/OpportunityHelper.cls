public with sharing class OpportunityHelper {
  
  public static List<Task> createFollowUpTasks(List<Opportunity> newOpportunities, Map<Id, Opportunity> oldOpportunities) {
        List<Task> tasksToInsert = new List<Task>();
        
        for (Opportunity newOpp : newOpportunities) {
            // Verificar se é uma inserção e o StageName é 'Closed Won'
            if (Trigger.isInsert && newOpp.StageName == 'Closed Won') {
                // Cria uma nova tarefa com o assunto 'Follow up Test Task' e a Oportunidade como pai
                Task newTask = new Task(
                    Subject = 'Follow up Test Task',
                    WhatId = newOpp.Id
                );
                tasksToInsert.add(newTask);
            }
            
            // Verificar se é uma atualização e o StageName está sendo alterado para 'Closed Won'
            if (Trigger.isUpdate && newOpp.StageName == 'Closed Won' && oldOpportunities.get(newOpp.Id).StageName != 'Closed Won') {
                // Cria uma nova tarefa com o assunto 'Follow up Test Task' e a Oportunidade como pai
                Task newTask = new Task(
                    Subject = 'Follow up Test Task',
                    WhatId = newOpp.Id
                );
                tasksToInsert.add(newTask);
            }
        }
        
        return tasksToInsert;
    }
}