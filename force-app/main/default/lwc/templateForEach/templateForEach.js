import { LightningElement } from 'lwc';

export default class TemplateForEach extends LightningElement {

    cursos = [
        {nome: 'LWC', duracao: '10hrs'},
        {nome: 'JavaScript', duracao: '8hrs'},
        {nome: 'Apex', duracao: '20hrs'},
        {nome: 'VisualForce', duracao: '10hrs'}
    ]
}