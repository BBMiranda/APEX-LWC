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
Map<String,Object> result = CarApi.calloutAPI(endpoint);
System.debug(result);
