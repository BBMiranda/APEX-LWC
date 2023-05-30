// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// Material de Estudos APEX e LWC
// Define as datas de início e fim do período desejado
Date startDate = Date.newInstance(2023, 4, 26);
Date endDate = Date.newInstance(2023, 5, 15);

// Chama o método para recuperar as contas deletadas no período especificado
List<Map<Id, Account>> recoveredAccounts = AccountRecovery.recoverDeletedAccounts(startDate, endDate);

// Imprime os registros recuperados da lixeira
System.debug('Recovered Trash Accounts: ' + recoveredAccounts[0]);
// Imprime os registros permanentemente deletados
System.debug('Permanently Deleted Accounts: ' + recoveredAccounts[1]); 