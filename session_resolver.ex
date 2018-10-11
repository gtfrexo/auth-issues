defmodule Db.Session_Resolver do
    alias Db.Users
    alias Db.Users.Guardian

    #def login_user(_,%{input: input},_) do
    #    with {:ok, user <- Users.Session.authenticate{input}}, {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
    #        {:ok, %{token: jwt_token, user: user}}
    #    end
    #   
    #end

    def login_user(_,%{input: input},_) do
       with {:ok, user} <- Users.Session.authenticate(input), {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
            {:ok, %{token: jwt_token, user: user}}
       end
    end

end