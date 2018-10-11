defmodule Db.Users.Session do
    alias Db.Users.User
    alias Db.Repo

    def authenticate(args) do
        user = Repo.get_by(User, args.email)
        case check_password(user, args) do
            true -> {:ok, user}
            _ -> {:error, "Incorrect login credentials."}
        end
    end

    defp check_password(user, args) do
        case user do
            nil -> Comeonin.Bcrypt.dummy_checkpw()
            _ -> Comeonin.Bcrypt.checkpw(args.password, user.hashed_password)
        end
    end
end