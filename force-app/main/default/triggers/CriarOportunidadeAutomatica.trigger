/*
  Exercício: Criar um método para a classe Helper, utilizando esse mesmo trigger, para que 
  no caso de que seja um update de Account, seja verificado se a conta possui 
  alguma oportunidade, e se caso não possua a oportunidade, criar uma Task na 
  conta, dizendo que deve-se analisar a possibilidade de criar oportunidades 
  para essa conta.
*/

// Definição da trigger "CriarOportunidadeAutomatica" para o objeto Account, que será acionada após uma inserção ou atualização.
trigger CriarOportunidadeAutomatica on Account (after insert, after update) {
  
  // Verifica se o acionador está sendo executado após uma inserção de registros
  if (Trigger.isInsert) {
    // Chama o método "criaOportunidade" da classe "HelperTriggerCriaOportunidadeAutomatica"
    // passando o mapa dos novos registros inseridos (Trigger.newMap)
    HelperTriggerCriaOportunidadeAutomatica.criaOportunidade(Trigger.newMap);
  }
  // Verifica se o acionador está sendo executado após uma atualização de registros
  else if (Trigger.isUpdate) {
    // Chama o método "verificaOportunidades" da classe "HelperTriggerCriaOportunidadeAutomatica"
    // passando o mapa dos novos registros atualizados (Trigger.newMap)
    // e o mapa dos registros antigos antes da atualização (Trigger.oldMap)
    HelperTriggerCriaOportunidadeAutomatica.verificaOportunidades(Trigger.newMap, Trigger.oldMap);
  }
}

