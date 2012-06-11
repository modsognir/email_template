module EmailTemplate
  class Template
    attr_accessor :file, :mailer, :template, :html

    def initialize(file, mailer)
      @file = File.new(EmailTemplate.template_path(mailer) + file)
      @mailer = mailer
    end

    def template
      @template ||= file.read.to_s
    end

    def dynamic_elements
      template.scan(/(\#\{.*?\})/).flatten
    end

    def safe_template
      temp = template.dup
      dynamic_elements.each do |element|
        temp.gsub!(element, "{{VARIABLE}}")
      end
      temp.gsub!(/\s@[a-z]*/, "::EmailTemplate::NullObject.new")
      temp.gsub!(/#/, "# ")
      temp
    end

    def to_html
      @html ||= Haml::Engine.new(safe_template).render(PrinceObject.new)
    end
  end
end