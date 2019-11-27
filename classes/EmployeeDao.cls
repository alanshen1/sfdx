public class EmployeeDao {
   /*
     * 機能名：社員レコードの取得
     * @param employeeId 社員レコードのsfid
     * @return 社員レコードリスト
     */
    public static List<Employee__c> getEmployeeRecById (String employeeId) {
        List<Employee__c> EmployeeList = new List<Employee__c>();
        EmployeeList = [select Id,
                               Name,
                               FirstName__c,
                               LastName__c,
                               FirstName_Kana__c,
                               LastName_Kana__c,
                               Birthday__c,
                               Age__c,
                               Sex__c,
                               Phone__c,
                               Mail__c,
                               ZipCode__c,
                               Prefecture__c,
                               City__c,
                               Address__c,
                               Building__c,
                               JoinDate__c,
                               LastGraduatedSchool__c,
                               Department__c,
                               EmergencyContact__c,
                               EmergencyPhone__c,
                               EmployeeDivision__c,
                               JavaCheck__c,
                               JavaYears__c,
                               DotNetCheck__c,
                               DotNetYears__c,
                               CLanguageCheck__c,
                               CLanguageYears__c,
                               CobolCheck__c,
                               CobolYears__c,
                               SAPCheck__c,
                               SAPYears__c,
                               SFDCCheck__c,
                               SFDCYears__c,
                               Specialty__c,
                               JapaneseLevel__c,
                               Salary__c,
                               StartJobDay__c,
                               HopeMonthSalary__c,
                        	   SmallMonthPrice__c,
                               BigMonthPrice__c
                         from
                               Employee__c
                        where
                               id = :employeeId];
        return EmployeeList;
    }
}