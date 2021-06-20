module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "<h1>test #{question.test.title}: Create new question</h1>".html_safe
    else
      "<h1>test #{question.test.title}: Edit question</h1>".html_safe
    end
  end
end
