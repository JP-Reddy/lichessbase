class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # before_action :find_or_create_player, only: [:create]
  before_action :check_params, only: [:create]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
      puts "Coming"
      build_resource(sign_up_params)
      player=Player.find_by(pname: resource.username)
      if player.nil?
        check_player=HTTParty.get("https://lichess.org/api/user/#{resource.username}").code
        if check_player==200
          liplayer=JSON.parse(HTTParty.get("https://lichess.org/api/user/#{resource.username}").body)
          brating=(liplayer['perfs']['bullet']['rating'].to_i+liplayer['perfs']['blitz']['rating'].to_i)/2
          player=Player.new(pname: resource.username, 
            BRating: brating, SRating: liplayer['perfs']['classical']['rating'])
          if !liplayer['profile'].nil?
            player.country=liplayer['profile']['country']  
          end
          player.save
          puts sign_up_params['username']
          # last_id=Player.last.id
          resource.player_id=player.id      
          resource.save
        end
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
        puts "Responded"
      end

      # yield resource if block_given?
      # if resource.persisted?
      #   if resource.active_for_authentication?
      #     set_flash_message! :notice, :signed_up
      #     sign_up(resource_name, resource)
      #     respond_with resource, location: after_sign_up_path_for(resource)
      #   else
      #     set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
      #     expire_data_after_sign_in!
      #     respond_with resource, location: after_inactive_sign_up_path_for(resource)
      #   end
      # else
      #   clean_up_passwords resource
      #   set_minimum_password_length
      #   respond_with resource
      # end

      # player.user=resource
  end
        # player=Player.create(pname: liplayer['username'], country: liplayer['profile']['country'], 
        #   BRating: BRating, SRating: liplayer['perfs']['classical']['rating'])

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def check_params
    puts sign_up_params
    puts("**********")
    puts sign_up_params['username']
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # def find_or_create_players
  #   player=Player.find_by(pname: params[:username])
  #   if player.nil?
  #     liplayer=JSON.parse(HTTParty.get("https://lichess.org/api/user/#{params[:username]}").body)
  #     BRating=(liplayer['perfs']['bullet']['rating'].to_i+liplayer['perfs']['blitz']['rating'])/2
  #     player=Player.create(pname: params[:username], country: liplayer['profile']['country'], 
  #       BRating: BRating, SRating: liplayer['perfs']['classical']['rating'])
  #   end
  # end

  # def link_player_to_user

  # end  
end
