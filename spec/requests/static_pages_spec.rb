require 'spec_helper'

describe "Static Pages" do
	describe "Home Page" do
		it "should have the content 'MicroText'" do
				visit '/static_pages/home'
				page.should have_selector('h1', :text => 'MicroText')	
				end	
		it "Should have the right title" do
			visit '/static_pages/home'
			page.should have_selector('title', :text => 'MicroText | Home')
		end	
	end

	describe "Help" do
		it "should have the content 'Help'" do
				visit '/static_pages/help'
				page.should have_selector('h1', :text => 'Help')
				end		
		it "Should have the right title" do
			visit '/static_pages/help'
			page.should have_selector('title', :text => 'MicroText | Help')
		end	
	end

	describe "About Us" do
		it "should have the content 'About Us'" do
				visit '/static_pages/about'
				page.should have_selector('h1', :text => 'About Us')	
				end	
		it "Should have the right title" do
			visit '/static_pages/about'
			page.should have_selector('title', :text => 'MicroText | About Us')
		end		
	end

	describe "Contact Us" do
		it "should have the content 'Contact Us'" do
				visit '/static_pages/contact'
				page.should have_selector('h1', :text => 'Contact Us')	
				end	
		it "Should have the right title" do
			visit '/static_pages/contact'
			page.should have_selector('title', :text => 'MicroText | Contact Us')
		end	
	end

end
