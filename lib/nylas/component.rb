# frozen_string_literal: true

module Nylas
  # Structure to represent a the Component Schema.
  class Component
    include Model
    allows_operations(creatable: true, listable: true, filterable: true, showable: true, updatable: true,
                      destroyable: true)

    attribute :id, :string, read_only: true
    attribute :account_id, :string
    attribute :name, :string
    attribute :type, :string
    attribute :action, :integer
    attribute :active, :boolean
    attribute :settings, :hash
    attribute :public_account_id, :string
    attribute :public_token_id, :string
    attribute :public_application_id, :string, read_only: true
    attribute :access_token, :string
    attribute :created_at, :date, read_only: true
    attribute :updated_at, :date, read_only: true

    has_n_of_attribute :allowed_domains, :string

    def resources_path(*)
      "/component/#{api.client.app_id}"
    end
  end
end
