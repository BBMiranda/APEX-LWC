//EXERCÍCIO: O cliente solicita que exista um meio para que ele recupere todos os registros Account que tiverem sido 
//excluídos no intervalo de determinadas datas, por exemplo, entre e inclusive, da data /mm/yyyy à dd/mm/yyyy. 
//A recuperação, deverá ser feita independentemente se o registro ainda estiver na lixeira, ou não. Os campos que deverão 
//existir nos registros que já foram excluídos da lixeira, deverão ser (Name, AccountNumber, Website, Phone). Deverá ser 
//entregue como resultado uma lista de maps, sendo que os maps que compõem a lista serão: [0]Map dos objetos (registros) 
//que estavam na lixeira e voltaram ao sistema.[1]Map dos objetos (registros) que já haviam sido excluídos da lixeira. 
//Os Maps deverão ter como chave o Id e valor o registro do objeto. O método estático que deverá realizar a tarefa deverá 
// receber como parâmetro as datas do período de recuperação desejado.

public with sharing class AccountRecovery {
    // Método para recuperar contas excluídas dentro de um intervalo de datas especificado
    public static List<Map<Id, Account>> recoverDeletedAccounts(Date startDate, Date endDate) {
        // Cria uma lista vazia de mapas que mapeiam Id para Account.
        List<Map<Id, Account>> recoveredAccounts = new List<Map<Id, Account>>();
        
        // Realiza uma consulta para recuperar as contas deletadas no período especificado.
        // SystemModstamp é campo ele armazena a data e hora da última modificação feita no registro:
        List<Account> trashAccounts = [SELECT Id, Name, AccountNumber, Website, Phone FROM Account WHERE IsDeleted = true AND SystemModstamp >= :startDate AND SystemModstamp <= :endDate WITH SECURITY_ENFORCED ALL ROWS];
        
        // Realiza a operação de undelete nas contas recuperadas e armazena o resultado.
        Database.UndeleteResult[] resultadoUndelete = Database.undelete(trashAccounts, false);
    
        // Consulta as contas que foram permanentemente deletadas no período especificado.
        List<Account> permanentlyDeletedAccounts = [SELECT Id, Name, AccountNumber, Website, Phone FROM Account WHERE IsDeleted = true AND SystemModstamp >= :startDate AND SystemModstamp <= :endDate WITH SECURITY_ENFORCED ALL ROWS];
        
        // Cria uma lista de contas para serem recuperadas com novos valores para o campo AccountNumber.
        List<Account> contasParaRecuperacao = new List<Account>();
        for(Account a:permanentlyDeletedAccounts){
            System.debug(a.Id+' - '+a.Name);
            Account co = new Account();
            co = a.clone();
            co.accountNumber = '12345678';
            contasParaRecuperacao.add(co);
        }
        
        // Cria um mapa que mapeia o Id da conta para a própria conta recuperada da lixeira.
        Map<Id, Account> recoveredTrashAccounts = new Map<Id, Account>();
        for (Account account : trashAccounts) {
            recoveredTrashAccounts.put(account.Id, account);
        }
        
        // Cria um mapa que mapeia o Id da conta para a própria conta permanentemente deletada.
        Map<Id, Account> permanentlyDeletedMap = new Map<Id, Account>();
        for (Account account : permanentlyDeletedAccounts) {
            permanentlyDeletedMap.put(account.Id, account);
        }
        
        // Adiciona os mapas criados na lista de mapas de contas recuperadas.
        recoveredAccounts.add(recoveredTrashAccounts);
        recoveredAccounts.add(permanentlyDeletedMap);
        
        // Retorna a lista de mapas de contas recuperadas.
        return recoveredAccounts;
    }
}

/* 
O código acima recupera as contas deletadas do Salesforce em um determinado período e as retorna 
em uma lista de mapas. Essa lista contém dois mapas, um para as contas recuperadas da lixeira e 
outro para as contas permanentemente deletadas. As contas recuperadas da lixeira são recuperadas 
usando o método Database.undelete. Em seguida, a lista de contas permanentemente deletadas é 
consultada para criar uma nova lista de contas com um novo valor para o campo AccountNumber.
Finalmente, o código cria dois mapas, um mapeando o Id da conta para a própria conta recuperada 
da lixeira e outro mapeando o Id da conta para a própria conta permanentemente deletada. 
Esses mapas são adicionados à lista de mapas de contas recuperadas, que é retornada pelo método.
*/