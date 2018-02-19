if type xdg-open > /dev/null 2>&1 ; then
    export XDG_DESKTOP_DIR="${HOME}"
    export XDG_CONFIG_HOME="${HOME}/.config"
    export XDG_DOCUMENTS_DIR="${HOME}/files"
    export XDG_DOWNLOAD_DIR="${HOME}/downloads"
    export XDG_MUSIC_DIR="${HOME}/music"
    export XDG_PICTURES_DIR="${HOME}/images"
    export XDG_VIDEOS_DIR="${HOME}/videos"
    export XDG_PUBLICSHARE_DIR="/non/existent"
fi
