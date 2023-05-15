//Material de Estudos APEX e LWC
//Delete
Listt<Account> contas = [SELECT Name FROM Account WHERE Name LIKE 'teste%'];
for(Account a:contas){
  System.debug(a.Name);
}

delete contas;
System.debug('Contas excluídas: ');
for(Account c:contas){
  System.debug(c.name+' - '+c.id);
}

//Undelete
Listt<Account> contas = [SELECT Name FROM Account WHERE Name LIKE 'teste%'];
for(Account a:contas){
  System.debug(a.Name);
}

delete contas;
System.debug('Contas excluídas: ');
for(Account c:contas){
  System.debug(c.name+' - '+c.id);
}

ContactUtility.viewContacts();

PropertyUtility.newListedProperties();

// Database.DeleteResult com Lista:
List<Account> lista [SELECT Name FROM Account WHERE Name LIKE 'teste_'];

//Database.merge
Account contaMaster = [SELECT Name, Phone, AccountNumber FROM Account WHERE AccountNumber = '12345677'];

System.debug(contaMaster);
List<Account> contasMerges = [SELECT Name, Phone, AccountNumber, FROM Account WHERE Name 'teste1' AND AccountNumber = '12345678'];
for(Account conta:contasMerges){
  System.debug(conta.Name+' - '+conta.AccountNumber);
} 
Savepoint sp = Database.setSavePoint();
Database.MergeResult[] resultadoMerge = Database.merge(contaMaster, contasMerges);
for(Databae.MergeResult resultadoCadaRegistro:resultadoMerge){
  if(resultadoCadaRegistro.isSuccess()){
    System.debug('ID registro merged: ' + resultadoCadaRegistro.getId());
  }
}
list<Account> contasAposMerge = [SELECT Name, AccountNumber FROM Account WHERE Name = 'teste1'];
for(Account a:contasAposMerge){
  System.debug(a.name+ ' - ' + a.Id);
}

Database.rollback(sp);


// Define as datas de início e fim do período desejado
Date startDate = Date.newInstance(2023, 5, 1);
Date endDate = Date.newInstance(2023, 5, 15);

// Chama o método para recuperar as contas deletadas no período especificado
List<Map<Id, Account>> recoveredAccounts = AccountRecovery.recoverDeletedAccounts(startDate, endDate);

// Imprime os registros recuperados da lixeira
System.debug('Recovered Trash Accounts: ' + recoveredAccounts[0]);
// Imprime os registros permanentemente deletados
System.debug('Permanently Deleted Accounts: ' + recoveredAccounts[1]);

