public with sharing class ContactUtility {
    // Importa a classe Schema no escopo global da classe
    public static void viewContacts(){
        if (Schema.sObjectType.Contact.isAccessible()) {
            List<Contact> listOfContacts = [SELECT FirstName, LastName FROM Contact];
            for (Contact con : listOfContacts){
                String fullName = 'First Name: ' + con.FirstName + ', Last Name: ' + con.LastName;
                system.debug(fullName);
            }
        }
    }
}