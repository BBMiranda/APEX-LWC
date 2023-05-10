public class ContactUtility {
	public static void viewContacts(){
		List<Contact> listOfContacts = [SELECT FirstName, LastName FROM Contact ORDER BY Name ASC];
    for (Contact con : listOfContacts){
      String fullName = 'First Name: ' + con.FirstName + ', Last Name: ' + con.LastName;
      System.debug(fullName);
		}
    }
}