class Notifications < ActionMailer::Base

    def forgot_password(to, login, pass, sent_at = Time.now)
    @subject	= "Your lost password"
    @body['login']=login
    @body['pass']=pass
    @recipients = to
    @from = 'you@your_isp.com'
    @sent_on = sent_at
    @content_type = "text/html"
    end
    
    def activate(to, name, surname, id, sent_at = Time.now)
    @subject	= 'Account activation at Authenticate'
    @body['name']=name
    @body['surname']=surname
    @body['email']=to
    @body['id']=id
    @recipients = to
    @from = 'you@your_isp.com'
    @sent_on = sent_at
    @content_type = "text/html"
    end
    end