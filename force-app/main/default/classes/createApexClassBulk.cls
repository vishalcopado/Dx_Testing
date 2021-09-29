public class createApexClassBulk {
	public void createApexClass(integer no_of_class, integer start_index)
    {
        for (integer i = start_index; i < (start_index + no_of_class); i++) {
            String classJson = '{ "Name" : "PromoteCheck' + String.valueOf(i) + '", "Body" : "public class PromoteCheck' + String.valueOf(i) + ' { public PromoteCheck' + String.valueOf(i) + '(){ integer i = 0; } }" }';
            
            // HttpRequest creation and HttpResponse handling
            HttpRequest req = buildHttpRequest(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v51.0/tooling/sobjects/ApexClass/','POST');
            req.setBody(classJson);
            
            HttpResponse res = buildHttpResponse(req);
            System.Debug('**** ApexClass Response: ' + res.getBody());
        }
    }
    
    public void createApexTestClass(integer no_of_class, integer start_index)
    {
        for (integer i = start_index; i < (start_index + no_of_class); i++) {
            String testClassJson = '{ "Name" : "TestPromoteCheck' + String.valueOf(i) + '", "Body" : "@isTest public class TestPromoteCheck' + String.valueOf(i) + ' { @isTest static void myTest() { PromoteCheck' + String.valueOf(i) + ' tp = new PromoteCheck'+ String.valueOf(i) + '(); system.assert(true);}}" }';
            
            HttpRequest req2 = buildHttpRequest(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v51.0/tooling/sobjects/ApexClass/','POST');
            req2.setBody(testClassJson); 
            
            HttpResponse res2 = buildHttpResponse(req2);
            System.Debug('**** ApexClass Response (Test Class): ' + res2.getBody());
        }
    }
	
    public HttpRequest buildHttpRequest(String endpoint, String method){
        HttpRequest request = new HttpRequest();
        request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        request.setHeader('Content-Type', 'application/json');
        request.setEndpoint(endpoint);
        request.setMethod(method);
        return request;
    }
    
    public HttpResponse buildHttpResponse(HttpRequest sendRequest){
        Http poll = new Http();
        HttpResponse pollResponse = poll.send(sendRequest);
        return pollResponse;
    }
}