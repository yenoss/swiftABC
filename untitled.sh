git filter-branch --env-filter '
WRONG_EMAIL="yenos@yenosui-MacBook-Pro-2.local"
NEW_NAME="yenoss"
NEW_EMAIL="cpg0504@gmail.com"

if [ "$GIT_COMMITTER_EMAIL" = "$WRONG_EMAIL" ]
then
export GIT_COMMITTER_NAME="$NEW_NAME"
export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$WRONG_EMAIL" ]
then
export GIT_AUTHOR_NAME="$NEW_NAME"
export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter  cat -- --branches --tags 
