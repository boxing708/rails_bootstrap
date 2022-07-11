class NoticeMailer < ApplicationMailer
  def sendmail_blog(blog)
      @blog = blog #インスタンス変数に代入
      mail to: "naoya.shishikura@super-studio.jp", subject: "新規ブログが作成されました"
    end
end
