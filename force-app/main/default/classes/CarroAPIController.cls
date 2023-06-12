public with sharing class CarroAPIController {
  
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
          throw new AuraHandledException('Erro na chamada à API');
      }
  }
}