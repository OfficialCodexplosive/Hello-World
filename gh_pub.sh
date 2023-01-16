AUTH_TOKEN="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"

GIT_OWNER="OfficialCodexplosive"
REPO_NAME="Hello-World"
REPO_DESC="This is your first repo!"
REPO_HOME="https://github.com"
REPO_PRIV=false
REPO_TEMP=false

JSON_STR='{"name":"'${REPO_NAME}'","description":"'${REPO_DESC}'","homepage":"'${REPO_HOME}'","private":'${REPO_PRIV}',"is_template":'${REPO_TEMP}'}'
echo $JSON_STR

# CREATE A REPO
curl \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${AUTH_TOKEN}"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user/repos \
  -d "${JSON_STR}"

# INITIALIZE 
git init
git config user.name "$GIT_OWNER@DataDesc"
git config user.email "<>"
git add .
git commit -m "Initial commit"

# LINK
git remote add origin https://$GIT_OWNER:$AUTH_TOKEN@github.com/$GIT_OWNER/$REPO_NAME.git
git push -u origin master