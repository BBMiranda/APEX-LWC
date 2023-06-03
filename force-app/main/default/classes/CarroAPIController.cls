public with sharing class CarroAPIController {
    // Método exposto como serviço remoto e cacheável para realizar a chamada à API:
    @AuraEnabled(cacheable=true)
    public static Map<String, Object> calloutAPI(String endpoint) {
        // Criação dos objetos para fazer a chamada HTTP:
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://cambuinfo.com.br/api_carros/' + endpoint);
        request.setMethod('GET');

        // Envio da requisição e obtenção da resposta:
        HttpResponse response = http.send(request);

        
        if (response.getStatusCode() == 200) {
        // Se a requisição for bem-sucedida (código de status 200), retorna os dados da resposta.  
            return (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        
        } else {
        // Caso contrário, lança uma exceção para tratar o erro na chamada à API:    
            throw new AuraHandledException('Erro na chamada à API');
        }
    }
}