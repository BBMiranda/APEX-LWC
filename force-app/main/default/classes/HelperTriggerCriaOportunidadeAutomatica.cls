//Essa classe está encarregada de separar a lógica do Trigger para que aqui sejam criadas as oportunidades automaticamente para somente quando criadas contas em que foi selecionado o checkbox para que uma oportunidade fosse criada quando criada uma nova conta.
public with sharing class HelperTriggerCriaOportunidadeAutomatica {
  
  public static void criaOportunidade(Map<Id, Account> mapContasNew) {
    List<Opportunity> oportunidades = new List<Opportunity>(); // Cria uma lista vazia para armazenar as oportunidades
    
    for (Id ident : mapContasNew.keySet()) { // Itera sobre cada ID de conta no mapa de contas fornecido
        Account a = mapContasNew.get(ident); // Obtém a conta com base no ID
        
        if (a.Criar_oportunidade_automaticamente__c == true) {
            // Verifica se a conta tem a flag "Criar_oportunidade_automaticamente__c" definida como verdadeira
            
            String nomeOportunidade = 'Oportunidade da conta: ' + a.Name; // Define o nome da oportunidade como "Oportunidade da conta:" seguido pelo nome da conta
            Opportunity opp = new Opportunity(); // Cria um novo objeto Opportunity
            
            opp.Name = nomeOportunidade; // Define o nome da oportunidade
            opp.CloseDate = Date.Today().addDays(30); // Define a data de fechamento da oportunidade como 30 dias a partir de hoje
            opp.StageName = 'Prospecting'; // Define o estágio da oportunidade como "Prospecting"
            opp.AccountId = ident; // Define o ID da conta associada à oportunidade
            
            oportunidades.add(opp); // Adiciona a oportunidade à lista de oportunidades
        }
    }
    
    if (oportunidades.size() > 0) { // Verifica se existem oportunidades na lista
        DAOTriggers dao = new DAOTriggers(); // Cria uma instância de DAOTriggers (classe responsável por manipular operações de banco de dados)
        dao.insereOportunidadesOptadasNaConta(oportunidades); // Chama o método insereOportunidadesOptadasNaConta para inserir as oportunidades no banco de dados
    }
  }

  
  public static void verificaOportunidades(Map<Id, Account> mapContasNew, Map<Id, Account> mapContasOld) {
    List<Task> tarefas = new List<Task>(); // Cria uma lista de tarefas vazia
    
    for (Id ident : mapContasNew.keySet()) {
        Account newAccount = mapContasNew.get(ident); // Obtém a nova conta com base no ID
        Account oldAccount = mapContasOld.get(ident); // Obtém a conta antiga com base no ID
        
        List<Opportunity> oportunidades = [SELECT Id FROM Opportunity WHERE AccountId = :ident];
        // Realiza uma consulta para obter todas as oportunidades relacionadas à conta
        
        if (oportunidades.isEmpty()) { // Verifica se não há oportunidades associadas à conta
            Task task = new Task(); // Cria uma nova tarefa
            task.Subject = 'Analisar criação de oportunidades para a conta TESTE: ' + newAccount.Name;
            // Define o assunto da tarefa como "Analisar criação de oportunidades para a conta TESTE:" seguido pelo nome da nova conta
            task.WhatId = newAccount.Id; // Define o ID do objeto relacionado à tarefa como o ID da nova conta
            task.OwnerId = UserInfo.getUserId(); // Define o ID do proprietário da tarefa como o ID do usuário atual
            task.Status = 'In Progress'; // Define o status da tarefa como "Em progresso"
            task.Priority = 'High'; // Define a prioridade da tarefa como "Alta"
            
            tarefas.add(task); // Adiciona a tarefa à lista de tarefas
        }
    }
    
    if (tarefas.size() > 0) { // Verifica se existem tarefas na lista
        insert tarefas; // Insere as tarefas no banco de dados
    }
  }
}