// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// Material de Estudos APEX e LWC

SomeClass.someFutureMethod();

List<Account> accounts = [Select Id, Name from Account];
    // process account records to do awesome stuff
    System.debug(accounts);