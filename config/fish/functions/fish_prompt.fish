function fish_prompt
  eval powerline-go -newline -error $status -shell bare -modules venv,ssh,cwd,perms,git,hg,fossil,time,root
end
