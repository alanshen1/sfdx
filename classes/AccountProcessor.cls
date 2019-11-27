public class AccountProcessor 
{
  @future
  public static void countContacts(Set<id> setId) 
  {
      List<Account> lstAccount = [select id, Name, Number_of_Contacts__c , (select id from contacts ) from account where id in :setId ];
      for( Account acc : lstAccount )
      {
          List<Contact> lstCont = acc.contacts ;
          acc.Number_of_Contacts__c = lstCont.size();
          System.Debug('@@Account Name: ' + acc.Name + ' Number of Contacts: ' + String.valueOf(acc.Number_of_Contacts__c));
      }
      
      update lstAccount;
  }
}