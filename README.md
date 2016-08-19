# Steps:
1. rackup -p 4002
2. ngrok http 4002
3. update signature in wechat.html: (will expire in 2 hours)
    * access token: 
```bash    
curl 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx896e08f0cac4122b&secret=24402383f5917760adf6be3620b67761'
```
    * ticket: 
```bash    
curl 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&&access_token=GSDjr0gpiy9Dwb2KtFEMQWihjZB8-neuO-8Nd1oQc5VWn82xMC0q1C-ddk7nEibtozSuPAQIr3eDyZ-F68RIl_s05m1bdqcyql95VOr7rprMqpOD0Xp-JsFvUwY7gKm8LKQgAGAVUA'
```
    * sha1: 
```ruby
require 'digest/sha1'
str = 'jsapi_ticket=kgt8ON7yVITDhtdwci0qeYo3hhp3ncv99vGCfYqFemuoqix3QgV7KrDFmpc1kVi_rGDTXJfU3kbW4UN3qJRCAQ&noncestr=david&timestamp=1471594625&url=http://48d152ec.ngrok.io/wechat.html'
Digest::SHA1.hexdigest str
```


