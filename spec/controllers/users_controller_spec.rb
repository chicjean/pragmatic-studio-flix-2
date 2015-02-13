require 'spec_helper'

describe UsersController do

  before do
    @user = User.create!(user_attributes)
  end

  context "when not signed in" do

    before do
      session[:user_id] = nil
    end

    it "cannot access index" do
      get :index

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access show" do
      get :show, id: @user

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access edit" do
      get :edit, id: @user

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access update" do
      patch :update, id: @user

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access destroy" do
      delete :destroy, id: @user

      expect(response).to redirect_to(new_session_url)
    end

  end

  context "when signed in as the wrong user" do 
  #So add another (second) context to your users_controller_spec.rb file. In the before block of this context, put an actual user's id in the session. Then inside of the context add code examples that try to access the edit, update, and destroy actions respectively, but for a different user. In this context, we expect all the responses to be redirects to the application home page.

    before do
      @wrong_user = User.create!(user_attributes(email: "wrong@example.com", username: "wronguser"))
      session[:user_id] = @wrong_user
    end

    it "cannot edit another user" do
      get :edit, id: @user

      expect(response).to redirect_to(root_url)
    end

    it "cannot update another user" do
      patch :update, id: @user

      expect(response).to redirect_to(root_url)
    end

    it "cannot destroy another user" do
      delete :destroy, id: @user

      expect(response).to redirect_to(root_url)
    end

  end

end