require 'watir'
require 'webdrivers'

args = ['--headless', '--no-sandbox', '--window-size=1280,1024', '--duser-agent=Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36']
b = Watir::Browser.new :chrome, options: {args: args}
b.goto 'http://a.testaddressbook.com'
b.link(text: "Sign in").click
b.text_field(id: 'session_email').set 'watir_example@example.com'
b.text_field(id: 'session_password').set 'password'
b.button(name: 'commit').click
puts b.h1.text