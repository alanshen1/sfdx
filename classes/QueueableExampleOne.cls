public class QueueableExampleOne implements Queueable, Database.AllowsCallouts {
    public Integer max;
    private Integer counter = 1;
    public void execute(QueueableContext context){
        System.debug('Counter: '+counter);
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://requestb.in/10x02w41');
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse resp = http.send(req);
        String html = resp.getBody();
        System.debug('Request: ' + req.toString());
        System.debug('Body: ' + html);
        QueueableExampleOne job = new QueueableExampleOne();
        job.max = max;
        job.counter = counter+1;
        if(max >= job.counter) {
        System.enqueueJob(job);    
        }
    }
}