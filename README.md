# BUAA-WiFi-Captive-Portal-Auto-Login
Step 1: Close the Pop-up about captive portal

    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -boolean false
    
Step 2: Use the assistant from reference 1, a good project given by Jeff, this can be used or update in the future.

Step 3: Change some part of example.sh, create your own dynamic.sh or just use my version of dynamic.sh.
    
    ****Please change 12345678 into your campus number, and abcdefgh into your network password****
    A small thing, I just keep some part like RTX or ShadowsocksX for better use.

Citation: 

    1.https://github.com/Jeff2Ma/launchd-with-networkchange
    2.https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html

Reference:(Something about network connection)
    
    1.http://buaabt.cn/showtopic.aspx?topicid=475731&postid=4158655#4158655
    2.https://www.jianshu.com/p/a5f179bb46af (useful for iOS developer)
    3.https://devework.com/mac-automatic-network.html
    4. use w3m or links to connect wifi in Linux
    5.https://zhuanlan.zhihu.com/p/21412687
