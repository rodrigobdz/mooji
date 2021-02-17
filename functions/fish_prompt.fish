set fish_prompt_pwd_dir_length 1
set __fish_git_prompt_show_informative_status 1

# Fish command and parameter colors
set fish_color_command green
set fish_color_param $fish_color_normal

# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'

set __fish_git_prompt_color_branch brown
set __fish_git_prompt_color_dirtystate FCBC47
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream cyan
set __fish_git_prompt_color_cleanstate green
set __fish_git_prompt_color_invalidstate red

# Git Characters
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_untrackedfiles ' …'
set __fish_git_prompt_char_cleanstate '✓'
set __fish_git_prompt_char_stagedstate '⇢ '
set __fish_git_prompt_char_conflictedstate "✕"

set __fish_git_prompt_char_upstream_prefix ''
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '⇡'
set __fish_git_prompt_char_upstream_behind '⇣'
set __fish_git_prompt_char_upstream_diverged '⇡⇣'

function _print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]

  set_color $color
  printf $string
  set_color normal
end

function _prompt_color_for_status
  if test $argv[1] -eq 0
    echo magenta
  else
    echo red
  end
end

function fish_prompt
  set -l last_status $status

  _print_in_color ""(prompt_pwd) blue

  __fish_git_prompt " (%s)"

  _print_in_color " ❯ " (_prompt_color_for_status $last_status)
end
