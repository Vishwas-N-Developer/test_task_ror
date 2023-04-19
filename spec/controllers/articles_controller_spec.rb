require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new article" do
  #       expect {
  #         post :create, params: { article: { title: "Test Article", description: "This is a test article." } }
  #       }.to change(Article, :count).by(1)
  #     end

  #     it "redirects to the created article" do
  #       post :create, params: { article: { title: "Test Article", description: "This is a test article." } }
  #       expect(response).to redirect_to(article_url(Article.last))
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, params: { article: { title: nil, description: nil } }
  #       expect(response).to be_successful
  #     end

  #     it "does not create a new article" do
  #       expect {
  #         post :create, params: { article: { title: nil, description: nil } }
  #       }.not_to change(Article, :count)
  #     end
  #   end
  # end
end
