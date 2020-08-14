function fish_prompt
  eval powerline-go -error $status -shell bare -modules venv,ssh,cwd,perms,git,hg,fossil,time,root
end
