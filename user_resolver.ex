defmodule Db.User_Resolver do

    alias Db.Users

    def all(_args, _info) do
        {:ok, Users.list_users}
    end

    def find(%{id: id}, _info) do
        case Users.get_user!(id) do
            nil -> {:error, "user with id #{id} not found."}
            user -> {:ok, user}
        end
    end

    def create(args, _info) do
        Users.create_user(args)
        #Db.Genders.create_gender(args)
    end

    def update(%{id: id, user: user_params}, _info) do
        Users.get_user!(id)
        |> Users.update_user(user_params)
    end

    def delete(%{id: id}, _info) do
        Users.get_user!(id)
        |> Users.delete_user
    end

end