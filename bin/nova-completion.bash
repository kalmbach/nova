_nova_completion() {
  local cur sub
  cur="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "new tidy jump help" -- "$cur") )
    return
  fi

  sub="${COMP_WORDS[1]}"
  case "$sub" in
    jump)
      local current branches
      current=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
      branches=$(git branch --format="%(refname:short)" 2>/dev/null \
        | grep -vx "${current:-}" \
        | tr '\n' ' ')
      COMPREPLY=( $(compgen -W "$branches" -- "$cur") )
      ;;
  esac
}

complete -F _nova_completion nova
