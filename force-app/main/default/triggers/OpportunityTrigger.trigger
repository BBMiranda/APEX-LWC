/*
  OpportunityTrigger é um gatilho (trigger) que é executado após a inserção ou atualização de registros de Oportunidade.
  Ele cria tarefas de acompanhamento com base nas oportunidades afetadas.
*/
trigger OpportunityTrigger on Opportunity (after insert, after update) {
    // Mapa para armazenar as oportunidades antigas para eventos de atualização
    Map<Id, Opportunity> oldOpportunities = new Map<Id, Opportunity>();
    
    // Verifica se é um evento de atualização e preenche o mapa oldOpportunities
    if (Trigger.isUpdate) {
        oldOpportunities = new Map<Id, Opportunity>(Trigger.old);
    }
    
    // Cria tarefas de acompanhamento com base nas novas oportunidades e oportunidades antigas
    List<Task> tasksToInsert = OpportunityHelper.createFollowUpTasks(Trigger.new, oldOpportunities);
    
    // Insere as tarefas no banco de dados
    oppDAO.insertTasks(tasksToInsert);
}