import { LightningElement, api } from 'lwc';
import option1 from './someHTML.html';
import option2 from './anotherHTML.html';

export default class TesteRender extends LightningElement {
  @api whichone = 'first';

  swapTemplate() {
    this.whichone = this.whichone === 'first' ? 'second' : 'first';
  }

  render() {
    return this.whichone === 'first' ? option1 : option2;
  }

}