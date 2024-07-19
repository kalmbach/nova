show_git_branch() {
  local index=$1 # this variable is used by the module loader in order to know the position of this module
  local icon="$(get_tmux_option "@catppuccin_git_branch_icon" "")"
  local color="$(get_tmux_option "@catppuccin_git_branch_color" "$thm_green")"
  local text="$(get_tmux_option "@catppuccin_git_branch_text" "#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
