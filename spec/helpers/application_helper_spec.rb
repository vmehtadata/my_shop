require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe "#bootstrap_alert_tag" do
    it "renders a Bootstrap alert" do
      expect(helper.bootstrap_alert_tag('Hello, World!')).to match(
        %r{<div class="alert alert-success alert-dismissible" role="alert">}
      ).and(match(
        %r{<button type="button" class="close" title="Close" data-dismiss="alert" aria-label="Close">}
      ).and(match(
        %r{<span aria-hidden="true">×</span>}
      ).and(match(
        %r{Hello, World!}
      ))))
    end

    it "can change style" do
    	expect(helper.bootstrap_alert_tag('Hello, World!', style: 'danger')).to match(/alert-danger/)
    end

    it "can disable dismissible" do
    	expect(helper.bootstrap_alert_tag('Hello, World!', dismissible: false)).not_to match(/alert-dismissible/)
    end

    it "raises an error on invalid keys" do
    	expect {helper.bootstrap_alert_tag('Hello, World!', foo: 'bar')}.to raise_error(ArgumentError)
    end
    
    it "raises an error on invalid styles" do
    	expect {helper.bootstrap_alert_tag('Hello. World!', style: 'bar')}.to raise_error(ArgumentError)
    end	
  end
end