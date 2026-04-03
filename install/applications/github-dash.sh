if ! gh extension list | grep -q "dlvhdr/gh-dash"; then
  p "installing gh-dash extension..."
  gh extension install dlvhdr/gh-dash | log
else
  p "found gh-dash $(gh extension list | grep 'dlvhdr/gh-dash' | awk '{print $4}')"
fi
