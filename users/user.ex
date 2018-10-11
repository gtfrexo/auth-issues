defmodule Db.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt


  schema "users" do
    field :email, :string
    field :password, :string
    field :hashed_password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :hashed_password])
    |> validate_required([:email, :password])
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{hashed_password: hashed_password}} = changeset) do
    change(changeset, hashed_password: Bcrypt.hashpwsalt(hashed_password))
  end

  defp put_pass_hash(changeset), do: changeset

end
