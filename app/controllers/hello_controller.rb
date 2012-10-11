class HelloController < UIViewController
  extend IB

  attr_accessor :data_source

  ## ib outlets
  outlet :gallary

  BUFFER_SIZE = 1024 * 100


  def send_image_content(sender)
    puts "send_image_content"

    sendImageContent
  end

  def send_news_content(sender)
    puts "send_news_content"
  end

  def send_music_content(sender)
    puts "send_music_content"
  end

  def send_video_content(sender)
    puts "send_video_content"
  end

  def send_text_content(sender)
    puts "send_text_content"
    sendTextContent("hello, wechat")
  end

  def send_app_content(sender)
    puts "send_app_content"
  end

  def sendImageContent
    message = WXMediaMessage.message
    message.setThumbImage(UIImage.imageNamed('tailb.png'))
    ext = WXImageObject.object
    filePath = NSBundle.mainBundle.pathForResource('tailb', ofType:'png')
    ext.imageData = NSData.dataWithContentsOfFile(filePath)
    
    message.mediaObject = ext
    
    req = wrap_req(message)
    
    WXApi.sendReq(req)
  end

  def sendNewsContent
    message = WXMediaMessage.message
    message.title = "Be nice to programmers"
    message.description = 'some description'
    message.setThumbImage(UIImage.imageNamed("tailb.png"))
    
    ext = WXWebpageObject.object
    ext.webpageUrl = "http://edu.mkrecny.com/thoughts/be-nice-to-programmers"
    
    message.mediaObject = ext
    req = wrap_req(message)
    
    WXApi.sendReq(req)
  end

  def sendMusicContent
    message = WXMediaMessage.message
    message.title = "Bang Bang (My Baby Shot Me Down)"
    message.description = "Nancy Sinatra"
    message.setThumbImage(UIImage.imageNamed("tailb.png"))

    ext = WXMusicObject.object
    ext.musicUrl = "http://zhangmenshiting.baidu.com/data2/music/5808389/2685932158400.mp3"
    
    message.mediaObject = ext
    
    req = wrap_req(message)
    
    WXApi.sendReq(req)
  end

  def sendVideoContent
    message = WXMediaMessage.message
    message.title = "Video title"
    message.description = "Bla bla bla bla bla bla bla bla..."
    message setThumbImage(UIImage.imageNamed("tailb.png"))
    
    ext = WXVideoObject.object
    ext.videoUrl = "http://www.tudou.com/programs/view/6vx5h884JHY/?fr=1"
    
    message.mediaObject = ext
    
    req = wrap_req(message)
    
    WXApi.sendReq(req)
  end

  def sendTextContent(message)
    req = wrap_req(message, is_text: true)
    
    WXApi.sendReq(req)
  end

  def sendAppContent
    message = WXMediaMessage.message
    message.title = "This is a App Message"
    message.description = "Bla bla bla bla..."
    message.setThumbImage(UIImage.imageNamed("tailb.png"))
    
    ext = WXAppExtendObject.object
    ext.extInfo = "<xml>test</xml>"
    ext.url = "http://www.qq.com"

    pBuffer = Byte.malloc(BUFFER_SIZE)
    memset(pBuffer, 0, BUFFER_SIZE)

    data = NSData.dataWithBytes(pBuffer, length:BUFFER_SIZE)
    free(pBuffer)
      
    ext.fileData = data   
    message.mediaObject = ext
    
    req = wrap_req(message)
    WXApi.sendReq(req)
  end


  def wrap_req(message, opts = {})
    req = SendMessageToWXReq.alloc.init
    is_text = opts[:is_text] || false
    if is_text
      req.bText = true
      req.text = message
    else
      req.bText = false
      req.message = message
    end
    req.scene = WXSceneSession
    req
  end

  def showImage(view)
    puts view.inspect
    view.image = UIImage.imageNamed('tailb.png')
  end

end