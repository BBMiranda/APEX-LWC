@IsTest
public class CarroAPIControllerTest {
    @IsTest
    static void testCalloutAPISucesso() {
        
        String mockResponseBody = '{"carros":["Ferrari","Bugatti","Lamborghini"],"modelos":["esportivo"]}';
        Integer mockStatusCode = 200;

        
        HttpResponse mockResponse = new HttpResponse();
        mockResponse.setBody(mockResponseBody);
        mockResponse.setStatusCode(mockStatusCode);

        
        Test.setMock(HttpCalloutMock.class, new CarroAPIControllerMock(mockResponse));

        
        Object result = CarroAPIController.calloutAPI('endpoint');
        Map<String, Object> responseBody = (Map<String, Object>) result;

        
        Map<String, Object> expectedResponseBody = new Map<String, Object>{
            'carros' => new List<String>{'Ferrari', 'Bugatti', 'Lamborghini'},
            'modelos' => new List<String>{'esportivo'}
        };
        System.assertEquals(expectedResponseBody, responseBody, 'A Resposta da API não corresponde ao esperado');
    }

    @IsTest
    static void testCalloutAPIErro() {
        
        String mockResponseBody = 'Error response';
        Integer mockStatusCode = 400;

        
        HttpResponse mockResponse = new HttpResponse();
        mockResponse.setBody(mockResponseBody);
        mockResponse.setStatusCode(mockStatusCode);

        
        Test.setMock(HttpCalloutMock.class, new CarroAPIControllerMock(mockResponse));

        
        try {
            Object result = CarroAPIController.calloutAPI('erro');
            System.assert(false, 'O bloco "else" foi acessado erroneamente.');
        } catch (Exception e) {
            System.assertEquals('Script-thrown exception', e.getMessage(), 'A mensagem de erro não corresponde ao esperado');
        }
    }

    
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