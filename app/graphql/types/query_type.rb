module Types
  QueryType = GraphQL::ObjectType.define do
    name "Query"

    field :testField, types.String do
      description "An example field added by the generator"
      resolve ->(obj, args, ctx) {
        "Hello World!"
      }
    end

    field :me, Types::UserType do
      description "the current user"
      resolve ->(obj, args, ctx) {
        ctx[:current_user]
      }
    end

    field :projects, types[Types::ProjectType] do
      description "the projects for the current user"
      resolve ->(obj, args, ctx) { Project.all }
    end

    field :my_projects, types[Types::ProjectType] do
      description "the projects for the current user"
      resolve ->(obj, args, ctx) { ctx[:current_user].projects }
    end
  end
end
