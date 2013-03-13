# Default Theme

if patched_font_in_use; then
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
else
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'235'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'255'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}


# Format: segment_name background_color foreground_color [non_default_separator]
# 131 - String red
# 72 - Vim error green
# 108 - Comment green
# 237 - Background light grey
# 235 - Gutter dark grey
# 223 - Keyword beige
# 187 - Keyword green
# 109 - Folder grey blue
# 116 - Value light blue
# 247 - Gutter white line numbers
# 251 - Plain white text
# Other..
# 24 - Nice blue color..
# 235 - Nice light brown..
if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"tmux_session_info 237 108" \
		"hostname 237 109" \
		#"ifstat 30 255" \
		#"ifstat_sys 30 255" \
		#"lan_ip 235 247 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
		#"wan_ip 235 247" \
    #"vcs_branch 235 247" \
    #"vcs_compare 60 255" \
    #"vcs_staged 64 255" \
    #"vcs_modified 187 235" \
		#"vcs_others 245 0" \
	)
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		#"earthquake 3 0" \
		#"pwd 89 211" \
		#"mailcount 9 255" \
		#"now_playing 234 37" \
    #"cpu 240 136" \
    #"battery 235 136" \
		#"load 237 167" \
    #"tmux_mem_cpu_load 234 136" \
    "lan_ip 237 109" \
		#"rainbarf 0 0" \
		#"xkb_layout 125 117" \
		"date_day 237 108" \
		"date 237 108" \
		"time 237 108" \
    "weather 237 108" \
    #"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
	)
fi
