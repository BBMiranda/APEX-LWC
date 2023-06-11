// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// Material de Estudos APEX e LWC

//System.debug(AnimalLocator.getAnimalNameById(1));

//Consulta dos dados da API pela Classe CarApi:  
String endpoint = 'modelos/esportivo';
Map<String, Object> result = CarroAPIController.calloutAPI(endpoint);
System.debug(result.solidas.branco); 

String endpoint = 'modelos/esportivo/Ferrari/cores/';
Map<String, Object> result = CarroAPIController.calloutAPI(endpoint);

List<Object> metalicas = (List<Object>) result.get('metalicas');
List<Object> solidas = (List<Object>) result.get('solidas');

// Percorrer e exibir os valores da lista "metalicas"
for (Object cor : metalicas) {
  System.debug((String) cor);
}

// Percorrer e exibir os valores da lista "solidas"
for (Object cor : solidas) {
  System.debug((String) cor);
}