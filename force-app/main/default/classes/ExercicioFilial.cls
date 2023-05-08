public with sharing class ExercicioFilial {
  
  // Método estático para criar as filiais
  public static void createFilials(List<Account> accounts) {
        
        // Lista vazia para armazenar as filiais que serão criadas
        List<Filial__c> filialsToInsert = new List<Filial__c>();
        
        // Loop pelas contas recebidas como parâmetro
        for (Account acc : accounts) {
            
            // Verifica se o campo de checkbox personalizado "Filial" está marcado como verdadeiro
            if (acc.Filial__c) {
                
                // Cria um nome para a filial, que inclui o nome da conta
                String filialName = 'Filial da conta ' + acc.Name;
                
                // Cria um novo registro de Filial
                Filial__c filial = new Filial__c();
                
                // Define o nome da filial
                filial.Name = filialName;
                
                // Define o Id da conta relacionada
                filial.Account__c = acc.Id;
                
                // Define o telefone da filial como o telefone da conta
                filial.Phone__c = acc.Phone;
                
                // Define o email da filial, usando a primeira palavra do nome da conta e o domínio da conta
                String textoSemAcento = 
                acc.Name.replaceAll('[áàâãä]', 'a')
                .replaceAll('[éèêë]', 'e')
                .replaceAll('[íìîï]', 'i')
                .replaceAll('[óòôõö]', 'o')
                .replaceAll('[úùûü]', 'u')
                .replaceAll('[ç]', 'c')
                .replaceAll('[ÁÀÂÃÄ]', 'A')
                .replaceAll('[ÉÈÊË]', 'E')
                .replaceAll('[ÍÌÎÏ]', 'I')
                .replaceAll('[ÓÒÔÕÖ]', 'O')
                .replaceAll('[ÚÙÛÜ]', 'U')
                .replaceAll('[Ç]', 'C');
                System.debug(textoSemAcento);
                filial.Email__c = textoSemAcento.split(' ')[0].toLowerCase() + '.filial@' + acc.Website;
                
                // Adiciona a filial à lista de filiais que serão inseridas
                filialsToInsert.add(filial);
            }
        }
        
        // Se a lista de filiais a serem inseridas não estiver vazia, faz a inserção
        if (!filialsToInsert.isEmpty()) {
            insert filialsToInsert;
        }
    }
}