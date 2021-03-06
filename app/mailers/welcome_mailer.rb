class WelcomeMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'welcome_mailer' # to make sure that your mailer uses the devise views
  
  def confirmation_instructions(user, token, opts)
    my_mail = Mailjet::Send.create(messages: [{
        'From'=> {
         'Email'=> Rails.application.credentials.default_email,
         'Name'=> 'Alim-Alo'
         },
        'To'=> [{
            'Email'=> user.email,
            'Name'=> "User <3"
        }],
        'Subject'=> 'Merci de votre inscription.',
        'HTMLPart'=> "<h1>Merci de votre inscription!</h1>
        <a href= '#{user_confirmation_url(@resource, confirmation_token: token)}'>Confirmer mon compte</a>"
        }]
    )

  end

end
