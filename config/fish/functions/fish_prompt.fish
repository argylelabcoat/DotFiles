function fish_prompt
  set duration (math -s6 "$CMD_DURATION / 1000")
  eval powerline-go -condensed -error $status -duration $duration -shell bare -newline -modules cwd,docker,dotenv,venv,plenv,fossil,git,hg,svn,jobs,node,vgo,duration
end
