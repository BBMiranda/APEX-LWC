public with sharing class Boletim {
    // Declaração das variáveis de instância privadas(não podem ser acessadas fora da classe)que armazenam as notas:
    private Decimal nota1, nota2, nota3, nota4;
    
    // Construtor que recebe as notas como parâmetros e inicializa as variáveis de instância:
    public Boletim(Decimal n1, Decimal n2, Decimal n3, Decimal n4) {
        nota1 = n1;
        nota2 = n2;
        nota3 = n3;
        nota4 = n4;
    }
    
    // Construtor padrão que inicializa as notas como zero:
    public Boletim() {
        nota1 = 0;
        nota2 = 0;
        nota3 = 0;
        nota4 = 0;
    }
        
    // Método setter para notas:
    public void setNotas(Decimal n1, Decimal n2,Decimal n3,Decimal n4) {
        nota1 = n1;
        nota2 = n2;
        nota3 = n3;
        nota4 = n4;
    }
    
    // Método getter para a primeira nota:
    public Decimal getNota1() {
        return nota1;
    }

    // Método getter para a segunda nota
    public Decimal getNota2() {
        return nota2;
    }
    
    // Método getter para a terceira nota
    public Decimal getNota3() {
        return nota3;
    }
    
    // Método getter para a quarta nota
    public Decimal getNota4() {
        return nota4;
    }
    
    // Método que calcula a média das notas e retorna a string com o resultado
    public String resultado() {
        Decimal media = (nota1 + nota2 + nota3 + nota4) / 4;
        
        if(media >= 0 && media < 4){
            return 'Reprovado: ' + media ;
        } else if(media >= 4 && media <= 5){
            return 'Recuperação: ' + media;
        } else if(media > 5 && media <= 10){
            return 'Aprovado: ' + media;
        } else {
            return 'A média so pode ser entre 0 e 10!';
        }
    }
}