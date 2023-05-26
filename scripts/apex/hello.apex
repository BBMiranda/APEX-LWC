// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// Material de Estudos APEX e LWC
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    // Cast the values in the 'animals' key as a list
    List<Object> animals = (List<Object>) results.get('animals');
    System.debug('Received the following animals:');
    for(Object animal: animals) {
        System.debug(animal);
    }
}

// Define as datas de início e fim do período desejado
Date startDate = Date.newInstance(2023, 4, 26);
Date endDate = Date.newInstance(2023, 5, 15);

// Chama o método para recuperar as contas deletadas no período especificado
List<Map<Id, Account>> recoveredAccounts = AccountRecovery.recoverDeletedAccounts(startDate, endDate);

// Imprime os registros recuperados da lixeira
System.debug('Recovered Trash Accounts: ' + recoveredAccounts[0]);
// Imprime os registros permanentemente deletados
System.debug('Permanently Deleted Accounts: ' + recoveredAccounts[1]); 