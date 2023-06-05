public with sharing class CarroAPIController {
<<<<<<< HEAD
  // Método para realizar uma chamada à API externa
  @AuraEnabled(cacheable=true)
  public static Object calloutAPI(String endpoint) {
      // Criação de uma instância da classe Http para realizar a chamada HTTP
      Http http = new Http();
      HttpRequest request = new HttpRequest();
      
      // Definição do endpoint da API
      request.setEndpoint('https://cambuinfo.com.br/api_carros/' + endpoint);
      
      // Definição do método GET para a chamada HTTP
      request.setMethod('GET');

      // Envio da requisição HTTP e obtenção da resposta
      HttpResponse response = http.send(request);
      System.debug('Resposta da API: ' + response.getBody());

      // Verificação do código de status da resposta
      if (response.getStatusCode() == 200) {
          // Deserialização do corpo da resposta em um objeto genérico
          return (Object) JSON.deserializeUntyped(response.getBody());
      } else {
          // Lançamento de uma exceção caso ocorra um erro na chamada à API
          throw new AuraHandledException('Erro na chamada à API');
      }
  }
}
=======
  
  // Método para realizar uma chamada à API externa
  @AuraEnabled(cacheable=true)
  public static Map<String, Object> calloutAPI(String endpoint) {

    // Criação de uma instância da classe Http para realizar a chamada HTTP
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    
    // Definição do endpoint da API
    request.setEndpoint('https://cambuinfo.com.br/api_carros/' + endpoint);
    
    // Definição do método GET para a chamada HTTP
    request.setMethod('GET');

    // Envio da requisição HTTP e obtenção da resposta
    HttpResponse response = http.send(request);

    // Verificação do código de status da resposta
    if (response.getStatusCode() == 200) {
      
      // Deserialização do corpo da resposta em um Map genérico
      return (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    
    } else {
      
      // Lançamento de uma exceção caso ocorra um erro na chamada à API
      throw new AuraHandledException('Erro na chamada à API');
    }
  }
}
>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
