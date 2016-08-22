# Steps:
1. ngrok http 4002
2. setup domain_url like '81329b1f.ngrok.io' on sandbox_page(http://mp.weixin.qq.com/debug/cgi-bin/sandboxinfo?action=showinfo&t=sandbox/index)
3. edit: config/settings.yml
4. bundle exec rackup -p 4002
5. open url 'http://xxxx.ngrok.io/wechat' inside wechat app
