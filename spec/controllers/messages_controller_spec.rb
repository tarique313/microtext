require 'spec_helper'

describe MessagesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'sent'" do
    it "returns http success" do
      get 'sent'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'reply'" do
    it "returns http success" do
      get 'reply'
      response.should be_success
    end
  end

  describe "GET 'trash'" do
    it "returns http success" do
      get 'trash'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "GET 'empty_trash'" do
    it "returns http success" do
      get 'empty_trash'
      response.should be_success
    end
  end

  describe "GET 'message'" do
    it "returns http success" do
      get 'message'
      response.should be_success
    end
  end

  describe "GET 'message_params'" do
    it "returns http success" do
      get 'message_params'
      response.should be_success
    end
  end

  describe "GET 'send_message'" do
    it "returns http success" do
      get 'send_message'
      response.should be_success
    end
  end

  describe "GET 'mailbox_name'" do
    it "returns http success" do
      get 'mailbox_name'
      response.should be_success
    end
  end

  describe "GET 'can_view_message'" do
    it "returns http success" do
      get 'can_view_message'
      response.should be_success
    end
  end

end
