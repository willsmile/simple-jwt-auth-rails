# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :login_id, presence: true, uniqueness: true
end
