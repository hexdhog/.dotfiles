#!/bin/bash
# oh-my-zsh installation might replace our .zshrc symlink
# delete it to avoid stow conflicts
rm -rf ~/.zshrc

exclude=("resources")

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	exclude+=("yabai" "skhd" "sketchybar")
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
	echo "unloading yabai launch agent"
	launchctl unload ~/Library/LaunchAgents/com.yabai.load-sa.plist
fi

for dir in */ ; do
	name=`echo $dir | sed 's/\///g'`
	if [[ ! " ${exclude[*]} " =~ " ${name} " ]]; then
		echo "installing: $name"
		stow -D "${dir}"
		stow "${dir}"
	fi
done

if [[ "$OSTYPE" == "darwin"* ]]; then
	echo "loading yabai launch agent"
	launchctl load ~/Library/LaunchAgents/com.yabai.load-sa.plist
fi
