defmodule DbWeb.Schema do

    use Absinthe.Schema
    import_types DbWeb.Schema.Types

    query do

        #LIST
        field :context_vals, non_null(list_of(non_null(:context_val))) do
            resolve &Db.Context_Val_Resolver.all/2
        end

        field :genders, non_null(list_of(non_null(:gender))) do
            resolve &Db.Gender_Resolver.all/2
        end

        field :locations, non_null(list_of(non_null(:location))) do
            resolve &Db.Location_Resolver.all/2
        end

        field :versions, non_null(list_of(non_null(:version))) do
            resolve &Db.Version_Resolver.all/2
        end

        field :hosts, list_of(:host) do
            resolve &Db.Host_Resolver.all/2
        end

        field :medias, non_null(list_of(non_null(:media))) do
            resolve &Db.Media_Resolver.all/2
        end

        field :messages, non_null(list_of(non_null(:message))) do
            resolve &Db.Message_Resolver.all/2
        end

        field :profile_contents, non_null(list_of(non_null(:profile_content))) do
            resolve &Db.Profile_Content_Resolver.all/2
        end

        field :events, non_null(list_of(non_null(:event))) do
            resolve &Db.Event_Resolver.all/2
        end

        field :persons, non_null(list_of(non_null(:person))) do
            resolve &Db.Person_Resolver.all/2
        end

        field :pools, non_null(list_of(non_null(:pool))) do
            resolve &Db.Pool_Resolver.all/2
        end

        field :venues, list_of(:venue) do
            resolve &Db.Venue_Resolver.all/2
        end

        field :tests, non_null(list_of(non_null(:test))) do
            resolve &Db.Test_Resolver.all/2
        end

        field :users, non_null(list_of(non_null(:user))) do
            resolve &Db.User_Resolver.all/2
        end

        #FIND
        field :context_val, type: :context_val do
            arg :id, non_null(:id)
            resolve &Db.Context_Val_Resolver.find/2
        end

        field :gender, type: :gender do
            arg :id, non_null(:id)
            resolve &Db.Gender_Resolver.find/2
        end

        field :location, type: :location do
            arg :id, non_null(:id)
            resolve &Db.Location_Resolver.find/2
        end

        field :version, type: :version do
            arg :id, non_null(:id)
            resolve &Db.Version_Resolver.find/2
        end

        field :host, type: :host do
            arg :id, non_null(:id)
            resolve &Db.Host_Resolver.find/2
        end

        field :media, type: :media do
            arg :id, non_null(:id)
            resolve &Db.Media_Resolver.find/2
        end

        field :message, type: :message do
            arg :id, non_null(:id)
            resolve &Db.Message_Resolver.find/2
        end

        field :profile_content, type: :profile_content do
            arg :id, non_null(:id)
            resolve &Db.Profile_Content_Resolver.find/2
        end

        field :event, type: :event do
            arg :id, non_null(:id)
            resolve &Db.Event_Resolver.find/2
        end

        field :person, type: :person do
            arg :id, non_null(:id)
            resolve &Db.Person_Resolver.find/2
        end

        field :pool, type: :pool do
            arg :id, non_null(:id)
            resolve &Db.Pool_Resolver.find/2
        end

        field :venue, type: :venue do
            arg :id, non_null(:id)
            resolve &Db.Venue_Resolver.find/2
        end

        field :test, type: :test do
            arg :id, non_null(:id)
            resolve &Db.Test_Resolver.find/2
        end

        field :user, type: :user do
            arg :id, non_null(:id)
            resolve &Db.User_Resolver.find/2
        end

    end

    #UPDATE PARAMS
    input_object :update_context_val_params do
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :emoji_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
    end

    input_object :update_gender_params do
        field :is_male, non_null(:boolean)
        field :is_female, non_null(:boolean)
        field :person_id, :id
    end

    input_object :update_location_params do
        field :address, :string
        field :address_full, :string
        field :city, :string
        field :country, :string
        field :lat, :float
        field :lon, :float
        field :state, :string
        field :zip, :string
        field :event_id, :id
        field :venue_id, :id
    end

    input_object :update_version_params do
        field :current_version, :string
        field :target_version, :string
    end

    input_object :update_host_params do
        field :description, :string
        field :name, :string
        field :name_full, :string
        field :venue_id, :id
        field :event_id, :id
    end

    input_object :update_media_params do
        field :created_at, :datetime
        field :deleted_at, :datetime
        field :description, :string
        field :media_type, :string
        field :url, :string
        field :venue_id, :id
        field :venue_media_id, :id
        field :event_id, :id
        field :event_media_id, :id
        field :person_id, :id
        field :person_media_id, :id
    end

    input_object :update_message_params do
        field :content, :string
        field :read_at, :datetime
        field :sent_at, :datetime
        field :from_person_id, :id
        field :to_person_id, :id
    end

    input_object :update_profile_content_params do
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :emoji_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
        field :person_id, :id
    end

    input_object :update_event_params do
        field :category, :string
        field :description, :string
        field :end_time, :datetime
        field :start_time, :datetime
        field :title, :string
        field :title_full, :string
        field :created_at, :datetime
        field :created_by_id, :id
        field :venue_id, :id
        field :is_private, :boolean
        field :deleted_by_id, :id
        field :updated_by_id, :id
    end

    input_object :update_person_params do
        field :auth0_me_id, :string
        field :auth_token, :string
        field :bio, :string
        field :birthday, :datetime
        field :email, :string
        field :email_verified, :boolean
        field :id_token, :string
        field :name, :string
        field :name_full, :string
        field :target_gender, :string
        field :target_relationship, :string
        field :token, :string
        field :password, :string
    end

    input_object :update_pool_params do
        field :eventbrite_id, :string
        field :seatgeek_id, :string
        field :event_id, :integer
        field :interested_persons_id, :id
        field :attending_persons_id, :id
        field :viewed_persons_id, :id
    end

    input_object :update_venue_params do
        field :category, :string
        field :description, :string
        field :name, :string
        field :name_full, :string
        field :event_id, :id
    end

    input_object :update_test_params do
        field :testing, :string
        field :gender_id, :id

        #resolve &Db.Gender_Resolver.create/2
    end

    input_object :update_user_params do
        field :email, :string
        field :password, :string
        field :hashed_password, :string
    end

    mutation do

        field :login_user, type: :session do
            arg :email, :string
            arg :password, :string
            #arg :hashed_password, :string

            resolve &Db.Session_Resolver.login_user/3
        end

        #CREATE
        field :create_context_val, type: :context_val do
            arg :animal_blurb, :string
            arg :boat_blurb, :string
            arg :education_blurb, :string
            arg :eggs_blurb, :string
            arg :emoji_blurb, :string
            arg :occupation_blurb, :string
            arg :worst_pickup_blurb, :string

            resolve &Db.Context_Val_Resolver.create/2
        end

        field :create_gender, type: :gender do
            arg :is_male, non_null(:boolean)
            arg :is_female, non_null(:boolean)
            arg :person_id, :id

            resolve &Db.Gender_Resolver.create/2
        end

        field :create_location, type: :location do
            arg :address, :string
            arg :address_full, :string
            arg :city, :string
            arg :country, :string
            arg :lat, non_null(:float)
            arg :lon, non_null(:float)
            arg :state, :string
            arg :zip, :string
            arg :event_id, :id
            arg :venue_id, :id

            resolve &Db.Location_Resolver.create/2
        end

        field :create_version, type: :version do
            arg :current_version, :string
            arg :target_version, :string

            resolve &Db.Version_Resolver.create/2
        end

        field :create_host, type: :host do
            arg :description, :string
            arg :name, non_null(:string)
            arg :name_full, :string
            arg :venue_id, :id
            arg :event_id, :id

            resolve &Db.Host_Resolver.create/2
        end

        field :create_media, type: :media do
            arg :created_at, non_null(:datetime)
            arg :deleted_at, :datetime
            arg :description, :string
            arg :media_type, :string
            arg :url, non_null(:string)
            arg :venue_id, :id
            arg :venue_media_id, :id
            arg :event_id, :id
            arg :event_media_id, :id
            arg :person_id, :id
            arg :person_media_id, :id

            resolve &Db.Media_Resolver.create/2
        end

        field :create_message, type: :message do
            arg :content, non_null(:string)
            arg :read_at, :datetime
            arg :sent_at, non_null(:datetime)
            arg :from_person_id, :id
            arg :to_person_id, :id

            resolve &Db.Message_Resolver.create/2
        end

        field :create_profile_content, type: :profile_content do
            arg :animal_blurb, :string
            arg :boat_blurb, :string
            arg :education_blurb, :string
            arg :eggs_blurb, :string
            arg :emoji_blurb, :string
            arg :occupation_blurb, :string
            arg :worst_pickup_blurb, :string
            arg :person_id, :id

            resolve &Db.Profile_Content_Resolver.create/2
        end

        field :create_event, type: :event do
            arg :category, :string
            arg :description, :string
            arg :end_time, :datetime
            arg :start_time, non_null(:datetime)
            arg :title, non_null(:string)
            arg :title_full, :string
            arg :created_at, non_null(:datetime)
            arg :created_by_id, :id
            arg :venue_id, :id
            arg :is_private, :boolean
            arg :deleted_by_id, :id
            arg :updated_by_id, :id

            resolve &Db.Event_Resolver.create/2
        end

        field :create_person, type: :person do
            arg :auth0_me_id, :string
            arg :auth_token, :string
            arg :bio, :string
            arg :birthday, non_null(:datetime)
            arg :email, non_null(:string)
            arg :email_verified, :boolean
            arg :id_token, :string
            arg :name, non_null(:string)
            arg :name_full, :string
            arg :target_gender, :string
            arg :target_relationship, :string
            arg :token, :string
            arg :password, :string

            resolve &Db.Person_Resolver.create/2
        end

        field :create_pool, type: :pool do
            arg :eventbrite_id, :string
            arg :seatgeek_id, :string
            arg :event_id, :id
            arg :interested_persons_id, :id
            arg :attending_persons_id, :id
            arg :viewed_persons_id, :id
            
            resolve &Db.Pool_Resolver.create/2
        end

        field :create_venue, type: :venue do
            arg :category, :string
            arg :description, :string
            arg :name, non_null(:string)
            arg :name_full, :string
            arg :event_id, :id

            resolve &Db.Venue_Resolver.create/2
        end

        field :create_test, type: :test do
            arg :testing, :string
            arg :gender_id, :id
            #arg :create_gender, :update_gender_params
        
            resolve &Db.Test_Resolver.create/2
        end

        field :create_user, type: :user do
            arg :email, :string
            arg :password, :string
            arg :hashed_password, :string

            resolve &Db.User_Resolver.create/2
        end

        #UPDATE
        field :update_context_val, type: :context_val do
            arg :id, non_null(:id)
            arg :context_val, :update_context_val_params

            resolve &Db.Context_Val_Resolver.update/2
        end

        field :update_gender, type: :gender do
            arg :id, non_null(:id)
            arg :gender, :update_gender_params

            resolve &Db.Gender_Resolver.update/2
        end

        field :update_location, type: :location do
            arg :id, non_null(:id)
            arg :location, :update_location_params

            resolve &Db.Location_Resolver.update/2
        end

        field :update_version, type: :version do
            arg :id, non_null(:id)
            arg :version, :update_version_params

            resolve &Db.Version_Resolver.update/2
        end

        field :update_host, type: :host do
            arg :id, non_null(:id)
            arg :host, :update_host_params

            resolve &Db.Host_Resolver.update/2
        end

        field :update_media, type: :media do
            arg :id, non_null(:id)
            arg :media, :update_media_params

            resolve &Db.Media_Resolver.update/2
        end

        field :update_message, type: :message do
            arg :id, non_null(:id)
            arg :media, :update_message_params

            resolve &Db.Message_Resolver.update/2
        end

        field :update_profile_content, type: :profile_content do
            arg :id, non_null(:id)
            arg :profile_content, :update_profile_content_params

            resolve &Db.Profile_Content_Resolver.update/2
        end

        field :update_event, type: :event do
            arg :id, non_null(:id)
            arg :event, :update_event_params

            resolve &Db.Event_Resolver.update/2
        end

        field :update_person, type: :person do
            arg :id, non_null(:id)
            arg :person, :update_person_params

            resolve &Db.Person_Resolver.update/2
        end

        field :update_pool, type: :pool do
            arg :id, non_null(:id)
            arg :pool, :update_pool_params

            resolve &Db.Pool_Resolver.update/2
        end

        field :update_venue, type: :venue do
            arg :id, non_null(:id)
            arg :venue, :update_venue_params

            resolve &Db.Venue_Resolver.update/2
        end

        field :update_test, type: :test do
            arg :id, non_null(:id)
            arg :test, :update_test_params

            resolve &Db.Test_Resolver.update/2
        end

        field :update_user, type: :user do
            arg :id, non_null(:id)
            arg :user, :update_user_params

            resolve &Db.User_Resolver.update/2
        end

        #DELETE
        field :delete_context_val, type: :context_val do
            arg :id, non_null(:id)
            
            resolve &Db.Context_Val_Resolver.delete/2
        end

        field :delete_gender, type: :gender do
            arg :id, non_null(:id)

            resolve &Db.Gender_Resolver.delete/2
        end

        field :delete_location, type: :location do
            arg :id, non_null(:id)

            resolve &Db.Location_Resolver.delete/2
        end

        field :delete_version, type: :version do
            arg :id, non_null(:id)

            resolve &Db.Version_Resolver.delete/2
        end

        field :delete_host, type: :host do
            arg :id, non_null(:id)

            resolve &Db.Host_Resolver.delete/2
        end

        field :delete_media, type: :media do
            arg :id, non_null(:id)

            resolve &Db.Media_Resolver.delete/2
        end

        field :delete_message, type: :message do
            arg :id, non_null(:id)

            resolve &Db.Message_Resolver.delete/2
        end

        field :delete_profile_content, type: :profile_content do
            arg :id, non_null(:id)

            resolve &Db.Profile_Content_Resolver.delete/2
        end

        field :delete_event, type: :event do
            arg :id, non_null(:id)

            resolve &Db.Event_Resolver.delete/2
        end

        field :delete_person, type: :person do
            arg :id, non_null(:id)

            resolve &Db.Person_Resolver.delete/2
        end

        field :delete_pool, type: :pool do
            arg :id, non_null(:id)

            resolve &Db.Pool_Resolver.delete/2
        end

        field :delete_venue, type: :venue do
            arg :id, non_null(:id)

            resolve &Db.Venue_Resolver.delete/2
        end

        field :delete_test, type: :test do
            arg :id, non_null(:id)

            resolve &Db.Test_Resolver.delete/2
        end

        field :delete_user, type: :user do
            arg :id, non_null(:id)

            resolve &Db.User_Resolver.delete/2
        end

    end

    def loader do
        Dataloader.new
        |> Dataloader.add_source(:db, Db.data)
    end

    def context(ctx) do
        Map.put(ctx, :loader, loader())
    end

    def plugins do
        [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
    end

end

