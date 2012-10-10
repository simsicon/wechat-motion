class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds

    register_WXApi

    storyboard = UIStoryboard.storyboardWithName "Storyboard", bundle: nil
    @window.rootViewController = storyboard.instantiateInitialViewController
    @window.makeKeyAndVisible
    true
  end

  def application(application, openURL:url, sourceApplication:sourceApplication, annotation:annotation)
    WXApi.handleOpenURL(url, delegate:self)
  end

  def register_WXApi
    WXApi.registerApp 'wxf196cffb7e9c49df'
  end

  def onReq(req)
    puts "req"
  end

  def onResp(resp)
    puts "resp"
  end

  
end
