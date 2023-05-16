// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// Material de Estudos APEX e LWC

// Criar uma nova conta com a flag "Criar_oportunidade_automaticamente__c" definida como verdadeira
Account novaConta = new Account();
novaConta.Name = 'Nova Conta';
//novaConta.Criar_oportunidade_automaticamente__c = true;
insert novaConta;

// Criar uma nova conta com a flag "Criar_oportunidade_automaticamente__c" definida como falsa
Account outraConta = new Account();
outraConta.Name = 'Outra Conta';
//outraConta.Criar_oportunidade_automaticamente__c = false;
insert outraConta;

// Chamar o método criaOportunidade para criar oportunidades automaticamente
Map<Id, Account> mapContasNew = new Map<Id, Account>();
mapContasNew.put(novaConta.Id, novaConta);
mapContasNew.put(outraConta.Id, outraConta);
HelperTriggerCriaOportunidadeAutomatica.criaOportunidade(mapContasNew);

// Chamar o método verificaOportunidades para verificar oportunidades existentes
Map<Id, Account> mapContasOld = new Map<Id, Account>();
mapContasOld.put(novaConta.Id, novaConta);
mapContasOld.put(outraConta.Id, outraConta);
HelperTriggerCriaOportunidadeAutomatica.verificaOportunidades(mapContasNew, mapContasOld);
