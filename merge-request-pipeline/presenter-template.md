# Environment

# Setup
git clone <cfsummit-repo-url>
cd <repo>

vi merge-request-pipeline/ci/pipeline.yml #Set Pipeline Credentials
fly -t <target> sp -p merge-request-example -c merge-request-pipeline/ci/pipeline.yml -l merge-request-pipeline/ci/creds.yml

# Issues
Beware the resource requires GITLAB API Token. If you are using a UAA User for auth, the password needs to be the UAA Token.
UAA_USER:
  git_username: uaa_username
  git_password: git_ap_token_for_uaa_user
  git_token: git_ap_token_for_uaa_user
GIT_NATIVE_USER:
  git_username: git_username
  git_password: git_password
  git_token: git_ap_token_for_uaa_user  
