public class HttpCalloutClass {
    public static HttpResponse postCase(
      String caseOrigin,
      String caseStatus
    ) {
      Http http = new Http();
      HttpRequest request = new HttpRequest();
      request.setEndpoint('callout:NCforAPIDemo/services/apexrest/v1/Case');
      request.setMethod('POST');
      request.setHeader('Content-Type', 'application/json;charset=UTF-8');
      String body =
        '{"Origin":"' +
        caseOrigin +
        '", "Status":"' +
        caseStatus +
        '"}';
      request.setBody(body);
      HttpResponse response = http.send(request);
      // Parse the JSON response
      if (response.getStatusCode() != 201) {
        System.debug(
          'response ' +
            response.getStatusCode() +
            ' ' +
            response.getStatus()
        );
      } else {
        System.debug(response.getBody());
      }
      return response;
    }
      
      
    public static HttpResponse getCaseByNumber(String caseNumber) {
      Http http = new Http();
      HttpRequest request = new HttpRequest();
      request.setEndpoint(
        'callout:NCforAPIDemo/services/apexrest/v1/Case?caseNumber=' +
        caseNumber
      );
      request.setMethod('GET');
      HttpResponse response = http.send(request);
      // If the request is successful, parse the JSON response.
      if (response.getStatusCode() == 200) {
        // Deserializes the JSON string into collections of primitive data types.
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(
          response.getBody()
        );
      }
      return response;
    }
      
  
    public static HttpResponse deleteCaseById(String caseId) {
      Http http = new Http();
      HttpRequest request = new HttpRequest();
      request.setEndpoint(
        'callout:NCforAPIDemo/services/apexrest/v1/Case/' + caseId
      );
      request.setMethod('DELETE');
      HttpResponse response = http.send(request);
      // If the request is successful, parse the JSON response.
      if (response.getStatusCode() == 200) {
        System.debug(caseId);
      }
      return response;
    }
  }