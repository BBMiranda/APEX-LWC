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
=======
  @AuraEnabled(cacheable=true)
  public static Object calloutAPI(String endpoint) {
      Http http = new Http();
      HttpRequest request = new HttpRequest();
      request.setEndpoint('https://cambuinfo.com.br/api_carros/' + endpoint);
      request.setMethod('GET');
      HttpResponse response = http.send(request);
      System.debug('Resposta da API: ' + response.getBody());
      if (response.getStatusCode() == 200) {
          return (Object) JSON.deserializeUntyped(response.getBody());
      } else {
>>>>>>> f845c1e1a04d2c176366ded9bd4e553418129617
          throw new AuraHandledException('Erro na chamada à API');
      }
  }
}