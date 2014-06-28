module ApplicationHelper

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def band_params
    params.require(:band).permit(:name)
  end

  def album_params
    params.require(:album).permit(:name, :band_id, :production)
  end

  def track_params
    params.require(:track).permit(:name, :album_id, :band_id, :lyrics, :track_type)
  end
end
