# app/graphql/types/user_type.rb

module Types
    class UserType < Types::BaseObject
      description "A user"
  
      field :id, ID, null: true
      field :first_name, String, null: true
      field :last_name, String, null: true
      field :email, String, null: true
      # Add more fields as needed
      
    end
  end
  