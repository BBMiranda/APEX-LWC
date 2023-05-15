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


