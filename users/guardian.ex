defmodule Db.Users.Guardian do
    use Guardian, otp_app: :db
    alias Db.Users
    def subject_for_token(user, _claims) do
      {:ok, to_string(user.id)}
    end
    def resource_from_claims(claims) do
      user = claims["sub"]
      |> Users.get_user!
      {:ok, user}
      # If something goes wrong here return {:error, reason}
    end
  end