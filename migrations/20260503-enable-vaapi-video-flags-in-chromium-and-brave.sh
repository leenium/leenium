echo "Enable VAAPI hardware video decode and encode flags in Chromium and Brave"
MIGRATION_VERSION="1.2.0"

add_flag() {
  local file=$1
  local flag=$2

  [[ -f $file ]] || return
  grep -q -- "$flag" "$file" && return

  if grep -q '^--enable-features=' "$file"; then
    sed -i "s/^--enable-features=\\(.*\\)\$/--enable-features=\\1,$flag/" "$file"
  else
    echo "--enable-features=$flag" >>"$file"
  fi
}

for conf in "$HOME/.config/chromium-flags.conf" "$HOME/.config/brave-flags.conf"; do
  add_flag "$conf" "VaapiVideoDecodeLinuxGL"
  add_flag "$conf" "VaapiVideoEncoder"
done
