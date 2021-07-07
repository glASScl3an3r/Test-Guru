class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials.github_token)
  end

  def call
    res = @client.create_gist(gist_params)
    { success: @client.last_response.status, url: res.html_url }
  end

  private

  def gist_params
    {
      description: "question from test: #{@test.title}",
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
