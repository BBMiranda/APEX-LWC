//EXERCÍCIO: O cliente solicita que exista um meio para que ele recupere todos os registros Account que tiverem sido 
//excluídos no intervalo de determinadas datas, por exemplo, entre e inclusive, da data /mm/yyyy à dd/mm/yyyy. 
//A recuperação, deverá ser feita independentemente se o registro ainda estiver na lixeira, ou não. Os campos que deverão 
//existir nos registros que já foram excluídos da lixeira, deverão ser (Name, AccountNumber, Website, Phone). Deverá ser 
//entregue como resultado uma lista de maps, sendo que os maps que compõem a lista serão: [0]Map dos objetos (registros) 
//que estavam na lixeira e voltaram ao sistema.[1]Map dos objetos (registros) que já haviam sido excluídos da lixeira. 
//Os Maps deverão ter como chave o Id e valor o registro do objeto. O método estático que deverá realizar a tarefa deverá 
// receber como parâmetro as datas do período de recuperação desejado.

public with sharing class AccountRecovery {
    public static List<Map<Id, Account>> recoverDeletedAccounts(Date startDate, Date endDate) {
        List<Map<Id, Account>> recoveredAccounts = new List<Map<Id, Account>>();
        
        // Consulta para recuperar os registros da lixeira que foram excluídos no intervalo de datas
        List<Account> trashAccounts = [SELECT Id, Name, AccountNumber, Website, Phone FROM Account WHERE IsDeleted = true AND SystemModstamp >= :startDate AND SystemModstamp <= :endDate ALL ROWS];
        
        // Consulta para recuperar os registros que já haviam sido excluídos da lixeira no intervalo de datas
        List<Account> permanentlyDeletedAccounts = [SELECT Id, Name, AccountNumber, Website, Phone FROM Account WHERE IsDeleted = true AND SystemModstamp >= :startDate AND SystemModstamp <= :endDate ALL ROWS];
        
        // Mapear os registros recuperados da lixeira
        Map<Id, Account> recoveredTrashAccounts = new Map<Id, Account>();
        for (Account account : trashAccounts) {
            recoveredTrashAccounts.put(account.Id, account);
        }
        
        // Mapear os registros permanentemente excluídos
        Map<Id, Account> permanentlyDeletedMap = new Map<Id, Account>();
        for (Account account : permanentlyDeletedAccounts) {
            permanentlyDeletedMap.put(account.Id, account);
        }
        
        // Adicionar os maps à lista de resultados
        recoveredAccounts.add(recoveredTrashAccounts);
        recoveredAccounts.add(permanentlyDeletedMap);
        
        return recoveredAccounts;
    }
}