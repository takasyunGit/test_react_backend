class Api::V1::VendorUser::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :name, :vendor_id)
  end

  def account_update_params
    params.permit(:avatar)
  end
end
