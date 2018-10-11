defmodule DbWeb.Schema.Types do

    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Db.Repo
    import Absinthe.Resolution.Helpers
    import_types(Absinthe.Type.Custom)

    object :context_val do #

        field :id, non_null(:id)
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :emoji_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
        field :inserted_at, :datetime
        field :updated_at, :datetime

    end

    object :gender do #

        field :id, non_null(:id)
        field :is_male, non_null(:boolean)
        field :is_female, non_null(:boolean)
        field :person, :person, resolve: dataloader(:db)
        field :test, :test, resolve: dataloader(:db)
        field :inserted_at, :datetime
        field :updated_at, :datetime

    end

    object :location do

        field :id, non_null(:id)
        field :address, :string#
        field :address_full, :string#
        field :city, :string#
        field :country, :string#
        field :lat, non_null(:float)#
        field :lon, non_null(:float)#
        field :state, :string#
        field :zip, :string#
        field :event, :event, resolve: dataloader(:db)###
        field :venue, :venue, resolve: dataloader(:db)#
        field :inserted_at, :datetime
        field :updated_at, :datetime

    end

    object :version do #

        field :id, non_null(:id)
        field :current_version, :string
        field :target_version, :string
        field :inserted_at, :datetime
        field :updated_at, :datetime

    end

    object :host do #
        
        field :id, non_null(:id)
        field :description, :string
        field :name, non_null(:string)
        field :name_full, :string
        field :venue, :venue, resolve: dataloader(:db)
        field :event, :event, resolve: dataloader(:db)
        field :inserted_at, :datetime
        field :updated_at, :datetime

    end

    object :media do #
        
        field :id, non_null(:id)
        field :deleted_at, :datetime#
        field :description, :string#
        field :media_type, :string
        field :url, non_null(:string)#
        field :event, :event, resolve: dataloader(:db)#
        field :event_media, :event, resolve: dataloader(:db)#
        field :venue, :venue, resolve: dataloader(:db)#
        field :venue_media, :venue, resolve: dataloader(:db)#
        field :person, :person, resolve: dataloader(:db)#
        field :person_media, :person, resolve: dataloader(:db)#
        field :inserted_at, :datetime
        field :updated_at, :datetime


    end

    object :message do
        
        field :id, non_null(:id)
        field :content, non_null(:string)#
        field :read_at, :datetime#
        field :from_person, :person, resolve: dataloader(:db)#
        field :to_person, :person, resolve: dataloader(:db)#
        field :sent_at, non_null(:datetime)###
        field :inserted_at, :datetime
        field :updated_at, :datetime
        
    end

    object :profile_content do #

        field :id, non_null(:id)
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :emoji_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
        field :person, :person, resolve: dataloader(:db)
        field :inserted_at, :datetime
        field :updated_at, :datetime

    end

    object :event do
        
        field :id, non_null(:id)
        field :created_by, :person, resolve: dataloader(:db)#
        field :location, :location, resolve: dataloader(:db)###
        field :pic, :media, resolve: dataloader(:db)#
        field :category, :string#
        field :description, :string###
        field :end_time, :datetime#
        field :start_time, non_null(:datetime)#
        field :title, non_null(:string)#
        field :title_full, :string#
        field :created_at, non_null(:datetime)###
        field :pool, :pool, resolve: dataloader(:db)#
        field :host, :host, resolve: dataloader(:db)###
        field :images, list_of(:media), resolve: dataloader(:db)#
        field :venues, list_of(:venue), resolve: dataloader(:db)#
        field :venue, :venue, resolve: dataloader(:db)###
        field :inserted_at, :datetime
        field :updated_at, :datetime
        field :is_private, :boolean
        field :deleted_by, :person, resolve: dataloader(:db)
        field :updated_by, :person, resolve: dataloader(:db)

    end

    object :person do
        
        field :id, non_null(:id)
        field :birthday, non_null(:datetime)#
        field :email, non_null(:string)###
        field :gender, :gender, resolve: dataloader(:db)###
        field :name, non_null(:string)#
        field :name_full, non_null(:string)#
        field :target_gender, :string###
        field :target_relationship, :string###
        field :token, :string###
        field :id_token, :string###
        field :auth_token, :string###
        field :email_verified, :boolean###
        field :profile_content, :profile_content, resolve: dataloader(:db)###
        field :profile_pic, :media, resolve: dataloader(:db)#
        field :auth0_me_id, :string###
        field :bio, :string#
        field :currently_blocking, list_of(:person), resolve: dataloader(:db)###
        field :blocked_by, list_of(:person), resolve: dataloader(:db)#
        field :created_events, list_of(:event), resolve: dataloader(:db)#
        field :sent_messages, list_of(:message), resolve: dataloader(:db)#
        field :received_messages, list_of(:message), resolve: dataloader(:db)#
        field :chatting_with, list_of(:person), resolve: dataloader(:db)#
        field :interested_pools, list_of(:pool), resolve: dataloader(:db)#
        field :viewed_pools, list_of(:pool), resolve: dataloader(:db)#
        field :attending_pools, list_of(:pool), resolve: dataloader(:db)#
        field :images, list_of(:media), resolve: dataloader(:db)#
        field :inserted_at, :datetime
        field :updated_at, :datetime
        field :password, :string

    end

    object :pool do
        
        field :id, non_null(:id)
        field :event, :event, resolve: dataloader(:db)#
        field :seatgeek_id, :string#
        field :eventbrite_id, :string#
        field :interested_persons, list_of(:person), resolve: dataloader(:db)#
        field :attending_persons, list_of(:person), resolve: dataloader(:db)#
        field :viewed_persons, list_of(:person), resolve: dataloader(:db)#

    end

    object :venue do
        
        field :id, non_null(:id)
        field :category, :string#
        field :description, :string#
        field :name, non_null(:string)#
        field :name_full, :string#
        field :location, :location, resolve: dataloader(:db)#
        field :pic, :media, resolve: dataloader(:db)#
        field :events, list_of(:event), resolve: dataloader(:db)#
        field :hosts, list_of(:host), resolve: dataloader(:db)###
        field :images, list_of(:media), resolve: dataloader(:db)#
        field :event, :event, resolve: dataloader(:db)###
        field :inserted_at, :datetime
        field :updated_at, :datetime

        field :create_pool, type: :pool do
            arg :eventbrite_id, :string
            arg :seatgeek_id, :string
            arg :event_id, :id
            arg :interested_persons_id, :id
            arg :attending_persons_id, :id
            arg :viewed_persons_id, :id
            
            resolve &Db.Pool_Resolver.create/2
        end

    end

    object :test do

        field :id, non_null(:id)
        field :testing, :string
        field :gender, :gender, resolve: dataloader(:db)
        field :inserted_at, :datetime
        field :updated_at, :datetime

        field :create_gender, type: :gender do
            arg :is_male, non_null(:boolean)
            arg :is_female, non_null(:boolean)
            arg :person_id, :id

            resolve &Db.Gender_Resolver.create/2
        end
        

    end

    object :user do
        field :id, non_null(:id)
        field :email, :string
        field :password, :string
        field :hashed_password, :string
    end

    object :session do
        field :token, :string
        field :user, :user
    end


end