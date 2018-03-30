

#### /VAR/VCAP/STORE/CONTAINERS/GITLAB/GITLAB.RB

 gitlab_rails['omniauth_enabled'] = true
 gitlab_rails['omniauth_allow_single_sign_on'] = ['oauth2_generic']
# gitlab_rails['omniauth_sync_email_from_provider'] = 'saml'
# gitlab_rails['omniauth_sync_profile_from_provider'] = ['saml']
# gitlab_rails['omniauth_sync_profile_attributes'] = ['email']
# gitlab_rails['omniauth_auto_sign_in_with_provider'] = 'saml'
 gitlab_rails['omniauth_block_auto_created_users'] = true
# gitlab_rails['omniauth_auto_link_ldap_user'] = false
# gitlab_rails['omniauth_auto_link_saml_user'] = false
# gitlab_rails['omniauth_external_providers'] = ['twitter', 'google_oauth2']
 gitlab_rails['omniauth_providers'] = [
   {
     "name" => "oauth2_generic",
     "app_id" => "gitlab",
     "app_secret" => "foobar",
     'args' => {
       client_options: {
         'site' => 'https://192.168.50.6:8443', # including port if necessary
         'user_info_url' => '/userinfo'
       },
       user_response_structure: {
         #root_path: ['data', 'user'], # i.e. if attributes are returned in JsonAPI format (in a 'user' node nested under a 'data' node)
         attributes: { nickname: 'user_name' } # if the nickname attribute of a user is called 'username'
       },
       # optionally, you can add the following two lines to "white label" the display name
       # of this strategy (appears in urls and Gitlab login buttons)
       # If you do this, you must also replace oauth2_generic, everywhere it appears above, with the new name. 
    #   name: 'Satorix', # display name for this strategy
     #  strategy_class: "OmniAuth::Strategies::OAuth2Generic", # Devise-specific config option Gitlab uses to find renamed strategy
       redirect_url: 'http://10.244.0.2/users/auth/oauth2_generic/callback'
     }
   }
 ]




######## UUAC

 uaac client get gitlab                                                                       
  scope: scim.userids openid oauth.approvals
  client_id: gitlab
  resource_ids: none
  authorized_grant_types: refresh_token authorization_code
  redirect_uri: http://10.244.0.2/users/auth/oauth2_generic/callback
  autoapprove: true
  authorities: uaa.none
  name: gitlab
  lastmodified: 1522335054357


######## GET/PLACE SSL CERT
### https://docs.gitlab.com/omnibus/settings/ssl.html
# Place your custom (Root CA) or a self-signed certificate in the /etc/gitlab/trusted-certs/ directory; For example, /etc/gitlab/trusted-certs/customcacert.pem. 
# Note: The certificate must be either DER- or PEM-encoded.
# Run gitlab-ctl reconfigure

get the uaa_ssl from ../bucc/state/creds.yml

`bosh int ~/workspace/bucc/state/creds.yml --path /uaa_ssl/ca > uaa.pem'

`bosh ssh -d gitlab`
copy file to /var/vcap/store/containers/gitlab/trusted-certs/
