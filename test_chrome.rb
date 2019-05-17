require 'watir'
require 'webdrivers'

HEADLESS = ENV['headless'] == 'false' ? false : true
WIDTH = ENV['width'] || 1280
HEIGHT = ENV['height'] || 1280

args = ['--no-sandbox', "--window-size=#{WIDTH},#{HEIGHT}", "--ignore-certificate-errors"]
args << '--headless' if HEADLESS

prefs = {
    download: {
        prompt_for_download: false,
        default_directory: File.join(__dir__, 'downloads')
    }
}

b = Watir::Browser.new :chrome, options: {args: args, prefs: prefs}

b.goto 'https://a.testaddressbook.com'
b.link(text: "Sign in").click
b.text_field(id: 'session_email').set 'watir_example@example.com'
b.text_field(id: 'session_password').set 'password'
b.button(name: 'commit').click
puts b.h1.text
b.screenshot.save File.join(__dir__, 'screenshots', 'chrome.png')