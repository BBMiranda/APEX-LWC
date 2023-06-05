@IsTest
public class CarroAPIControllerTest {
    @IsTest
    static void testCalloutAPISucesso() {
        // Defina a resposta de exemplo da API com código de status 200
        String mockResponseBody = '{"carros":["Ferrari","Bugatti","Lamborghini"],"modelos":["esportivo"]}';
        Integer mockStatusCode = 200;

        // Crie uma instância do objeto HttpResponse com a resposta de exemplo
        HttpResponse mockResponse = new HttpResponse();
        mockResponse.setBody(mockResponseBody);
        mockResponse.setStatusCode(mockStatusCode);

        // Crie uma classe de mock para substituir a chamada HTTP real
        Test.setMock(HttpCalloutMock.class, new CarroAPIControllerMock(mockResponse));

        // Chame o método da classe CarroAPIController que faz a chamada à API
        Object result = CarroAPIController.calloutAPI('endpoint');
        Map<String, Object> responseBody = (Map<String, Object>) result;

        // Verifique se a resposta retornada é correta
        Map<String, Object> expectedResponseBody = new Map<String, Object>{
            'carros' => new List<String>{'Ferrari', 'Bugatti', 'Lamborghini'},
            'modelos' => new List<String>{'esportivo'}
        };
        System.assertEquals(expectedResponseBody, responseBody, 'A Resposta da API não corresponde ao esperado');
    }

    @IsTest
    static void testCalloutAPIErro() {
        // Defina a resposta de exemplo da API com código de status 400
        String mockResponseBody = 'Error response';
        Integer mockStatusCode = 400;

        // Crie uma instância do objeto HttpResponse com a resposta de exemplo
        HttpResponse mockResponse = new HttpResponse();
        mockResponse.setBody(mockResponseBody);
        mockResponse.setStatusCode(mockStatusCode);

        // Crie uma classe de mock para substituir a chamada HTTP real
        Test.setMock(HttpCalloutMock.class, new CarroAPIControllerMock(mockResponse));

        // Chame o método da classe CarroAPIController que faz a chamada à API
        try {
            Object result = CarroAPIController.calloutAPI('erro');
            System.assert(false, 'O bloco "else" foi acessado erroneamente.');
        } catch (Exception e) {
            System.assertEquals('Script-thrown exception', e.getMessage(), 'A mensagem de erro não corresponde ao esperado');
        }
    }

    // Classe de mock para substituir a chamada HTTP real
    private class CarroAPIControllerMock implements HttpCalloutMock {
        private HttpResponse response;

        public CarroAPIControllerMock(HttpResponse response) {
            this.response = response;
        }

        public HttpResponse respond(HttpRequest request) {
            return response;
        }
    }
}