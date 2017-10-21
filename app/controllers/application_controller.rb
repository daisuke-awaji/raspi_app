# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def on
    pin_17 = PiPiper::Pin.new :pin => 17, :direction => :out

    1.times do
      pin_17.on
      sleep 1
      pin_17.off
      sleep 1
    end

    # 17番ピンの使用をやめる
    uexp = open("/sys/class/gpio/unexport", "w")
    uexp.write(17)
    uexp.close
    
    render html: "hello Light up on rails. 17番ピンに命令しました。"
  end

end
