#/bin/bash

uaac client add gitlab \
  --scope=scim.userids openid oauth.approvals \
  --client_id: gitlab \
  --authorized_grant_types=refresh_token authorization_code \
  --redirect_uri=http://10.244.0.2/users/auth/oauth2_generic/callback \
  --authorities: uaa.none
