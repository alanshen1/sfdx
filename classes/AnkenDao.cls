public with sharing class AnkenDao {
    /*
     * 機能名：案件レコード件数の取得
     * @param strSoqlWhere 検索条件
     * @param limitInt 最大件数
     * @return 案件レコード件数
     */
    public static Integer getAnkenCount (String strSoqlWhere, integer limitInt) {
        String strSoqlSelect = 'select count() from Anken__c ';
        String strSoqlOther = ' limit :limitInt ';
        system.debug('strSoqlSelect + strSoqlWhere + strSoqlOther = ' + strSoqlSelect + strSoqlWhere + strSoqlOther);
        Integer ankenCount = database.countQuery(strSoqlSelect + strSoqlWhere + strSoqlOther);
        return ankenCount;
    }
    /*
     * 機能名：案件レコードの取得
     * @param strSoqlWhere 検索条件
     * @param limitInt 最大件数
     * @param offsetInt soqlのoffset
     * @return 案件レコードリスト
     */
    public static List<Anken__c> getAnkenListByCondition (String strSoqlWhere, integer limitInt, integer offsetInt) {
        List<Anken__c> AnkenList = new List<Anken__c>();
        String strSoqlSelect = 'select Id, Name, Account__c,Anken__c.Account__r.Name, Level__c,Confirm__c,AnkenPlanStartDay__c,MonthTimeFrom__c,MonthTimeTo__c,MonthPriceFrom__c,MonthPriceTo__c,Station__c,Address__c,JavaCheck__c,JavaYears__c,DotNetCheck__c,DotNetYears__c,CLanguageCheck__c,CLanguageYears__c,CobolCheck__c,CobolYears__c,SAPCheck__c,SAPYears__c,SFDCCheck__c,SFDCYears__c,AnkenInfo__c from Anken__c ';
        String strSoqlOther = ' Order by Level__c asc nulls last, Confirm__c asc nulls last limit :limitInt offset :offsetInt ';
        AnkenList = database.query(strSoqlSelect + strSoqlWhere + strSoqlOther);
        return AnkenList;
    }
    /*
     * 機能名：案件レコードの取得
     * @param id 案件Id
     * @return 案件レコードリスト
     */
    public static List<Anken__c> getAnkenListById(String id) {
        List<Anken__c> AnkenList = [select Id, Name, Account__c,Anken__c.Account__r.Name, Level__c,Confirm__c,AnkenPlanStartDay__c,MonthTimeFrom__c,MonthTimeTo__c,MonthPriceFrom__c,MonthPriceTo__c,Station__c,Address__c,JavaCheck__c,JavaYears__c,DotNetCheck__c,DotNetYears__c,CLanguageCheck__c,CLanguageYears__c,CobolCheck__c,CobolYears__c,SAPCheck__c,SAPYears__c,SFDCCheck__c,SFDCYears__c,AnkenInfo__c from Anken__c where id = :id];
        return AnkenList;
    }
}