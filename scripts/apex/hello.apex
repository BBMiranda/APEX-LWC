// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// Material de Estudos APEX e LWC

ClasseExternaJr externa = new ClasseExternaJr(50);
ClasseExternaJr.classeInterna interna = new ClasseExternaJr.classeInterna(externa);

interna.exibirNumeroAdvindoClasseExterna();

ClasseExternaJr2 externa = new ClasseExternaJr2();
ClasseExternaJr2.ClasseInterna interna = new ClasseExternaJr2.ClasseInterna(20);
externa.exibirNumeroInternoDaClasseInterna(interna);