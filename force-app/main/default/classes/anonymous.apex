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