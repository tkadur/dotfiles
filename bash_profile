# Print a random, hopefully interesting, adage.
if [ -x "$(command -v fortune)" ] && [ -x "$(command -v cowsay)" ]; then
  if [[ -t 0 || -t 1 ]]; then
  	fortune -s | cowsay
    printf ""
  fi
fi

source ~/.bashrc
