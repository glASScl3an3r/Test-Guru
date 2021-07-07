class GistQuestionService

  Result = Struct.new(:status_code, :url) do

    def success?
      status_code.to_i == 201 #created 201
    end

  end

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials.github_token)
  end

  def call
    res = @client.create_gist(gist_params)
    Result.new(@client.last_response.status, res.html_url)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description'),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.text, *@question.answers.pluck(:text)].join("\n")
  end

end
