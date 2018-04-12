# Environment
For this lab we will be using the following systems:

| Name | Url |
| --- | --- |
| UAA       | https://146.148.24.245:8443 |
| Concourse | https://146.148.24.245      |
| Gitlab    | http://104.155.34.223       |
| jumpbox   | 35.205.178.58:22            |

For all systems use your UAA account credentials

# Setup

## lab repo in gitlab
Login as gitlab root user
Create a lab group via the gitlab ui.
Import the https://github.com/starkandwayne/cfsummit-labs repo under the lab group.
Make sure the make the cfsummit-labs repo public.

## gitlab admin token in credhub
Login as gitlab root user
Go to: http://104.155.34.223/profile/personal_access_tokens
create a token named `ci` with `api` scope.

```
credhub set -n /concourse/main/git_token -t value -v {token}
credhub set -n /concourse/main/git_name -t value -v root
credhub set -n /concourse/main/git_pass -t value -v {admin_password}
```

# Issues
