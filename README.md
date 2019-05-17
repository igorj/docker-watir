# Installation

Install Docker for your system: https://docs.docker.com/install

# Usage

Create a docker image based on Ubuntu 16.04 with Chrome, Firefox and Ruby installed: 
    ```docker image build -t ubuntu .```
    
Caution: You have to recreate the image every time you change something in the Dockerfile or in the Gemfile

Run the test_chrome.rb in the container:  
    ```docker run --rm -v $(pwd):/webtests/ ubuntu ruby test_chrome.rb```
    
Start the console in the container:
    ```docker run --rm -it -v $(pwd):/webtests/ ubuntu /bin/bash```
    
Run the test_chrome.rb locally or in the container headless: 
    ```ruby test_chrome.rb```    
        
Run the test_firefox.rb locally or in the container headless: 
    ```ruby test_firefox.rb```       
    
Run the test_chrome.rb locally with gui: 
    ```headless=false ruby test_chrome.rb```    
    
Run the test_firefox.rb locally with gui: 
    ```headless=false ruby test_firefox.rb```        