import { LightningElement, track } from 'lwc';

export default class Tracking extends LightningElement {
nome = 'Airton';
sobrenome = 'Miguel Junior';

@track fullNameObj = {name: 'Airton', surname: 'Miguel Junior'};

atualizaNome(event){
    this.nome = event.target.value
};

atualizaSobrenome(event){
    this.nome = event.target.value
};

updateName(event){
    this.fullNameObj.name = event.target.value
};

updateSurname(event){
    this.fullNameObj.surname = event.target.value
}

}