# Set identification from install inputs
if [[ -n ${LEENIUM_USER_NAME//[[:space:]]/} ]]; then
  git config --global user.name "$LEENIUM_USER_NAME"
fi

if [[ -n ${LEENIUM_USER_EMAIL//[[:space:]]/} ]]; then
  git config --global user.email "$LEENIUM_USER_EMAIL"
fi
