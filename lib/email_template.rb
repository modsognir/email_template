require "active_support"
require "action_mailer"
require "email_template/version"
require "email_template/template"
require "email_template/null_object"

module EmailTemplate
  extend self

  def all(mailers=ActionMailer::Base.subclasses)
    [mailers].flatten.map do |mailer|
      files(mailer).map do |file|
        EmailTemplate::Template.new(file, mailer)
      end
    end.flatten
	end
  
  def template_path(mailer)
    Pathname.new(mailer.template_root.to_s).join(mailer.to_s.underscore)
  end

  def files(mailer)
    template_path(mailer).entries.reject {|e| e.to_s.match(/\.\z|\A\_/).present? }
  end

	def mailers
		ActionMailer::Base.subclasses
	end
end
