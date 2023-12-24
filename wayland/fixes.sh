compositor=$(loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type)
if [[ $compositor = 'Type=wayland' ]]; then
	# Fix neovim copy to clipboard when current compositor is wayland
	# https://github.com/neovim/neovim/blob/77dc891bfbdcdb84f919f6ff5b535b385c121007/runtime/autoload/provider/clipboard.vim
	# https://unix.stackexchange.com/questions/202891/how-to-know-whether-wayland-or-x11-is-being-used
	export XDG_SESSION_TYPE=wayland
	export WAYLAND_DISPLAY=wayland-0

	# Fix slack share screen on Wayland
	# https://github.com/flathub/com.slack.Slack/issues/101#issuecomment-1808323806
	sudo sed -i -e 's/,"WebRTCPipeWireCapturer"/,"LebRTCPipeWireCapturer"/' /usr/lib/slack/resources/app.asar
	sudo sed -i -e 's#Exec=/usr/bin/slack %U#Exec=/usr/bin/slack\ %U\ --enable-features=WebRTCPipeWireCapturer#' /usr/share/applications/slack.desktop

	keyd_exists=$(whereis keyd | grep bin)
	if [[ $keyd_exists ]]; then
		echo "keyd exists, start the systemcl process"
	fi
fi
