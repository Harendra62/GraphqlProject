# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :blogs, [Types::BlogType], null: true, description: "Fetches all the blogs"
def blogs
  Blog.all
end

field :blog, Types::BlogType, null: false, description: "Fetch blog for some id" do
  argument :id, ID, required: true
end
def blog(id:)
  Blog.find(id)
end

field :users, [Types::UserType], null: false, description: "List of users"
def users
  User.all
end

# field :user, Types::UserType, null: true, description: "Fetch user for some id" do
#   argument :id, ID, required: true
# def user(id:)
#   User.find(id)
# end
  end
end
