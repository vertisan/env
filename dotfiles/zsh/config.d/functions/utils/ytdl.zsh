ytdl() {

  case $1 in
    playlist)
      youtube-dl --update --extract-audio --audio-format mp3 --audio-quality 320K --output '~/Desktop/youtube-dl-music/%(title)s.%(ext)s' $2
      ;;
    *)
      h2 -n "Unknown option $1"
      ;;
  esac

}
