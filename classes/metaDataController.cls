public class metaDataController {

    @AuraEnabled
    public static String getsObjectMetadata(String pSobject) {
        	System.debug(pSobject);
            List<SObjectMetadata> sObjectMetadataList = new List<SObjectMetadata>();
            Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(pSobject).getDescribe().fields.getMap();
            for(Schema.SObjectField ft : fieldMap.values()) {
                Schema.DescribeFieldResult fd = ft.getDescribe();
                sObjectMetadataList.add(new SObjectMetadata(fd.getName(), fd.getType(), pSobject));
            }
        String strRet = JSON.serialize(sObjectMetadataList);
        System.debug(strRet);
    	return strRet;
    }
}