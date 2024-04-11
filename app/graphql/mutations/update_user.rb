module Mutations
    class UpdateUser < BaseMutation
      argument :id, ID, required: true
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :email, String, required: false
  
      field :user, Types::UserType, null: true
      field :errors, [String], null: false
  
      def resolve(id:, first_name: nil, last_name: nil, email: nil)
        user = User.find_by(id: id)
        return { user: nil, errors: ["User not found"] } unless user
  
        if user.update(first_name: first_name, last_name: last_name, email: email)
          { user: user, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        end
      end
    end
  end
  