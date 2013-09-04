require 'spec_helper'

describe ApplicationHelper do
	describe "full title" do
		it "should include the page title" do
			full_title('foo').should =~ /foo/
		end

		it "should have the base title" do
			full_title('foo').should =~/^MicroText/
		end

		it "shuld not include a bar on the home page " do
			full_title('').should_not =~ /\|/
		end
 	end
end