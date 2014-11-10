Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "aa4eTcnbEy8colXES3KddjzGF", "ABsfoo6Li4dn0RVCRwZBUuyxGiTBOZHlRH7YfNiyZLDlPBEvAb",
    {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'true',
        :lang => 'pt'
      }
    }
end
