class SocialNetwork < ApplicationRecord
  belongs_to :profile

  before_save :set_link_or_handle

  SERVICES = %w{LinkedIn Facebook Twitter Google+ GitHub DevPost StackOverflow}
  def self.services
    {
      "LinkedIn" => "https://www.linkedin.com/in/",
      "Facebook" => "https://www.facebook.com/",
      "Twitter" => "https://twitter.com/",
      "Google+" => "", 
      "GitHub" => "https://github.com/",
      "DevPost" => "", 
      "StackOverflow" => ""
    }

  end

  def set_link_or_handle
    if handle.present?
      if link.blank?
        self.link = handle_to_link
      end
    elsif link.present?
      self.handle = link_to_handle
    end
  end

  def handle_to_link
    if SocialNetwork.services[name].present?
      SocialNetwork.services[name] + handle
    end
  end

  def link_to_handle
    if SocialNetwork.services[name].present?
      link.split('/').last
    end
  end

end
