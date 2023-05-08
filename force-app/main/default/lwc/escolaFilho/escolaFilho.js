import { LightningElement, api } from 'lwc';

export default class EscolaFilho extends LightningElement {

    @api detalhesDoCurso = {
        nomeDoCurso: 'Curso de Python',
        duracaoDoCurso: '30 dias',
        valor: 5000,
        avaliacao: '****'
    }
}