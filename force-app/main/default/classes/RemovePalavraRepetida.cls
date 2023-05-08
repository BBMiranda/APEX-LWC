public class RemovePalavraRepetida {
    // Método estático que recebe uma lista de palavras e uma palavra a ser removida as repetições
    public static List<String> removePalavra(List<String> palavrasList, String palavra) {
        // Loop que itera pela lista de palavras
        for(Integer i = 0; i < palavrasList.size(); i++) {
            // Verifica se o elemento atual é igual à palavra especificada
            if(palavrasList[i] == palavra) {
                // Se for, remove o elemento da lista e interrompe o loop
                palavrasList.remove(i);
                break;
            }
        }
        // Retorna a lista modificada, com apenas uma ocorrência da palavra especificada
        return palavrasList;
    }
}