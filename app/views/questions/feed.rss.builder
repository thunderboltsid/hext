#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Hext"
    xml.author "Sebastian Muszynski, Siddharth Shukla"
    xml.description "Questions and answers help app"
    xml.link "https://hacktbilisi-hext.herokuapp.com"
    xml.language "en"

    for question in @questions
      xml.item do
        if question.message
          xml.title question.message
        else
          xml.title ""
        end
        xml.author question.phone_number
        xml.pubDate question.created_at.to_s(:rfc822)
        xml.link "https://hacktbilisi-hext.herokuapp.com/questions/#{question.id}/answers/new"
        xml.guid question.id

        shorten_url = Google::UrlShortener.shorten!(new_question_answer_url(question.id))
        text = question.message + " " + shorten_url

        xml.description "<p>" + text + "</p>"
      end
    end
  end
end
