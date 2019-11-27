@RestResource(urlMapping='/CaseNum/*')
global class RestResourceDemo {
    @HttpGet
    global static String getCaseNum() {
        Integer caseNum = [SELECT count() FROM Case];

        String ret = 'Total case number is : ' + String.valueOf(caseNum);
		String session = UserInfo.getSessionId();
        return ret;
    }
}