# BUAA-WiFi-Captive-Portal-Auto-Login
Step 1: Close the Pop-up about captive portal

    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -boolean false
    
Step 2: Use the assistant from reference 1, a good project given by Jeff, this can be used or update in the future.

Step 3: Change some part of example.sh, create your own dynamic.sh or just use my version of dynamic.sh.
    
    ****Please change 12345678 into your campus number, and abcdefgh into your network password****
    A small thing, I just keep some part like RTX or ShadowsocksX for better use.

Reference: 

    1.https://github.com/Jeff2Ma/launchd-with-networkchange
    2.https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html
