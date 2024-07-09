#!/bin/sh


option=$(echo -e "Trading\nTradingJournal\nChatGPT\nNetflix\nBooks\nYoutube\nMusic\nAnime\nManga\nLocal" | dmenu -c -i -l 10)


case $option in

    Music)
        # st ytermusic
        ;;
    Youtube)
        choice=$(echo -e "Watch\nDownload" | dmenu -c -i -l 10)
        case $choice in
            Watch)
                ytfzf -D -f
                ;;
            Download)
                ytfzf -D -f -d
                ;;
            *)
                echo -n "unknown"
                ;;
        esac
        ;;
    Anime)
        choice=$(echo -e "Watch\nDownload" | dmenu -c -i -l 10)
        case $choice in
            Watch)
                st -e ani-cli &
                ;;
            Download)
                st ani-cli -d &
                ;;
            *)
                echo -n "unknown"
                ;;
        esac
        ;;
    Manga)
        choice=$(echo -e "Online\nLocal" | dmenu -c -i -l 10)
        case $choice in
            Online)
                st manga-cli &
                ;;
            Local)
                zathura "$(echo $(ls ~/.cache/manga-cli/* | dmenu -c -i -l 10) | tr ' ' '\ ')"
                ;;
            *)
                echo -n "unknown"
                ;;
        esac
        ;;
    Local)
        mpv "$(echo "$(ls ~/Videos/*/*.mp4 | dmenu -c -i -l 10)" | tr ' ' '\ ')"
        ;;
    Books)
        choice=$(echo -e "Continue\nSelect" | dmenu -c -i -l 10)
        case $choice in
            Continue)
                zathura ~/Books/Reading/*.pdf
                ;;
            Select)
                zathura "$(echo $(ls ~/Books/* | dmenu -c -i -l 10) | tr ' ' '\ ')"
                ;;
            *)
                echo -n "unknown"
                ;;
        esac
        ;;
    TradingJournal)
        choice=$(echo -e "View\nEdit" | dmenu -c -i -l 10)
        case $choice in
            View)
                zathura "$(echo $(ls ~/Documents/TradingJournal/*/*.pdf | dmenu -c -i -l 10) | tr ' ' '\ ')"
                ;;
            Edit)
                st nvim --cmd ":cd %:h" "$(echo $(ls ~/Documents/TradingJournal/Journal/*.md | dmenu -c -i -l 10) | tr ' ' '\ ')"
                ;;
            *)
                echo -n "unknown"
                ;;
        esac
        ;;
    Trading)
        choice=$(echo -e "Forex\nNepse" | dmenu -c -i -l 10)
        case $choice in
            Forex)
                chromium https://www.tradingview.com/chart/?symbol=FX%3AEURUSD
                ;;
            Nepse)
                chromium https://app.npstocks.com/main/
                ;;
            *)
                echo -n "unknown"
                ;;
        esac
        ;;
    Netflix)
        chromium --kiosk https://netflix.com
        ;;
    ChatGPT)
        chromium --kiosk https://chatgpt.com/
        ;;
    *)
        echo -n "unknown"
        ;;
esac
