//Essa classe está encarregada de separar a lógica do Trigger para que aqui sejam criadas as oportunidades automaticamente para somente quando criadas contas em que foi selecionado o checkbox para que uma oportunidade fosse criada quando criada uma nova conta.

public with sharing class HelperTriggerCriaOportunidadeAutomatica {
  
  // Cria uma lista vazia para armazenar as oportunidades
  public static void criaOportunidade(Map<Id, Account> mapContasNew) {
    List<Opportunity> oportunidades = new List<Opportunity>(); 
    
    // Itera sobre cada ID de conta no mapa de contas fornecido
    for (Id ident : mapContasNew.keySet()) { 
      // Obtém a conta com base no ID  
      Account a = mapContasNew.get(ident); 
        
        // Verifica se a conta tem a flag "Criar_oportunidade_automaticamente__c" definida como verdadeira
        if (a.Criar_oportunidade_automaticamente__c == true) {
            
            // Define o nome da oportunidade como "Oportunidade da conta:" seguido pelo nome da conta
            String nomeOportunidade = 'Oportunidade da conta: ' + a.Name;
            // Cria um novo objeto Opportunity
            Opportunity opp = new Opportunity(); 
            // Define o nome da oportunidade
            opp.Name = nomeOportunidade;
            // Define a data de fechamento da oportunidade como 30 dias a partir de hoje 
            opp.CloseDate = Date.Today().addDays(30); 
            // Define o estágio da oportunidade como "Prospecting"
            opp.StageName = 'Prospecting'; 
            // Define o ID da conta associada à oportunidade
            opp.AccountId = ident; 
            // Adiciona a oportunidade à lista de oportunidades          
            oportunidades.add(opp); 
        }
    }
    
    // Verifica se existem oportunidades na lista
    if (oportunidades.size() > 0) {
        // Cria uma instância de DAOTriggers (classe responsável por manipular operações de banco de dados)
        DAOTriggers dao = new DAOTriggers();
        // Chama o método insereOportunidadesOptadasNaConta para inserir as oportunidades no banco de dados
        dao.insereOportunidadesOptadasNaConta(oportunidades); 
    }
  }

  
  public static void verificaOportunidades(Map<Id, Account> mapContasNew, Map<Id, Account> mapContasOld) {
    // Cria uma lista de tarefas vazia
    List<Task> tarefas = new List<Task>();
    
    
    for (Id ident : mapContasNew.keySet()) {
        
        // Obtém a nova conta com base no ID
        Account newAccount = mapContasNew.get(ident);
        // Obtém a conta antiga com base no ID 
        Account oldAccount = mapContasOld.get(ident); 
        
        // Realiza uma consulta para obter todas as oportunidades relacionadas à conta
        List<Opportunity> oportunidades = [SELECT Id FROM Opportunity WHERE AccountId = :ident WITH SECURITY_ENFORCED];
        
        // Verifica se não há oportunidades associadas à conta
        if (oportunidades.isEmpty()) { 
            // Cria uma nova tarefa
            Task task = new Task(); 
            // Define o assunto da tarefa como "Analisar criação de oportunidades para a conta TESTE:" seguido pelo nome da nova conta
            task.Subject = 'Analisar criação de oportunidades para a conta TESTE: ' + newAccount.Name;
            // Define o ID do objeto relacionado à tarefa como o ID da nova conta
            task.WhatId = newAccount.Id;
            // Define o ID do proprietário da tarefa como o ID do usuário atual 
            task.OwnerId = UserInfo.getUserId(); 
            // Define o status da tarefa como "Em progresso"
            task.Status = 'In Progress';
            // Define a prioridade da tarefa como "Alta" 
            task.Priority = 'High'; 
            // Adiciona a tarefa à lista de tarefas
            tarefas.add(task); 
        }
    }
    // Verifica se existem tarefas na lista
    if (tarefas.size() > 0) { 
        // Insere as tarefas no banco de dados  
        insert tarefas; 
    }
  }
}