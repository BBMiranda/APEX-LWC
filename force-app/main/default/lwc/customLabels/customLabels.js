import { LightningElement } from 'lwc';
// Import Custom Label
import wm from '@salesforce/label/c.Welcome_message';
import dlr from '@salesforce/label/c.Declaration';
import lw from '@salesforce/label/c.Legal_Warning';
// Import Static Resource
import salesforce from '@salesforce/resourceUrl/logo_salesforce';
import sottelli from '@salesforce/resourceUrl/logo_sottelli';
import allImages from '@salesforce/resourceUrl/imagens_zipadas';
export default class CustomLabels extends LightningElement {

    label = {wm, dlr, lw};

    logoSalesforce = salesforce;
    logoSottelli = sottelli;
    logoSottelli2 = allImages+'/logo_sottelli.png'
    
}