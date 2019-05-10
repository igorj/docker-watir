require 'watir'
require 'webdrivers'

prefs = {
    download: {
        prompt_for_download: false,
        default_directory: '/path/to/dir'
    }
}

browser = Watir::Browser.new :chrome,
                             headless: false,
                             options: {prefs: prefs}

browser.goto 'watir.com'
browser.screenshot.save 'screenshot.png'
sleep 3