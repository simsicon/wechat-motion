class HelloController < UIViewController
  extend IB

  attr_accessor :data_source


  ## ib outlets
  outlet :scroller, UIScrollView
  outlet :btn_hello
  outlet :switcher_hi


  def say_hello(sender)
    puts "hello"
    sendImageContent
  end

  def say_hi(sender)
    puts "hi"
  end

  def sendImageContent
    message = WXMediaMessage.message
    message.setThumbImage(UIImage.imageNamed('talib.png'))
    ext = WXImageObject.object
    filePath = NSBundle.mainBundle.pathForResource('talib', ofType:'png')
    ext.imageData = NSData.dataWithContentsOfFile(filePath)
    
    message.mediaObject = ext
    
    req = SendMessageToWXReq.alloc.init
    req.bText = false
    req.message = message
    req.scene = WXSceneSession
    
    WXApi.sendReq(req)
  end

end