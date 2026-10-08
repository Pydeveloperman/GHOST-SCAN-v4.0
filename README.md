# 📡 GHOST-SCAN v4.0: AI Smart Port Exploiter & Dynamic Connector

![GitHub License](https://shields.io)
![Bash Version](https://shields.io)
![Platform](https://shields.io)

**GHOST-SCAN v4.0** — bu mahalliy tarmoqlar (Wi-Fi/LAN) va tashqi serverlardagi ochiq portlarni skanerlash, xizmatlar versiyasini aniqlash, xavfsizlik zaifliklarini kashf etish hamda ularga dinamik ulanish uchun yaratilgan mukammal konsol qurolidir. Dastur kiber-xavfsizlik mutaxassislari uchun jarayonlarni to'liq avtomatlashtirib beradi.

> [!WARNING]
> **Ogohlantirish:** Ushbu loyiha faqat qonuniy kiber-audit (Penetration Testing) va ta'lim maqsadlarida foydalanish uchun mo'ljallangan. Ruxsatsiz begona tizimlarni skanerlash va ularga hujum qilish qonunan javobgarlikka sabab bo'ladi!

---

## 🔥 Asosiy Imkoniyatlari (Features)

*   **Host Discovery:** Tarmoqdagi barcha faol qurilmalarni (IP, NetBIOS nomlari bilan) tezkor aniqlash.
*   **Quick & Advanced Scan:** Eng ko'p foydalaniladigan portlarni yoki operatsion tizim (OS) hamda drayverlar versiyasini chuqur skanerlash.
*   **Vulnerability Detection (CVE):** Nmap NSE skriptlari yordamida tizimdagi ma'lum bo'lgan xavfli zaifliklarni avtomatik qidirish va natijalarni faylga saqlash.
*   **Automated Exploitation:** `Metasploit` bilan integratsiya orqali ochiq portlarga (masalan: SMB/445 uchun EternalBlue yoki FTP/21 uchun Backdoor) qarshi avtomatlashtirilgan exploit ishga tushirish.
*   **Hydra Cracking:** SSH, FTP, Telnet kabi protokollarga qarshi Wordlist orqali parollarni tekshirish (Brute Force).
*   **🌐 Smart Port Connector (8-modul):** Eng asosiy innovatsion modul! Skanerlash natijasida topilgan port raqamini kiritishingiz bilan tizim avtomatik ravishda mos ulanish protokolini (`SSH`, `FTP`, `Telnet`, `Curl` yoki `SMBClient`) tanlab, maqsadli tizimga ulanadi.

---

## 🛠️ Tizim Talablari (Requirements)

Skript ishga tushganda quyidagi kiber-qurollarning tizimda mavjudligini tekshiradi va yetishmayotganlarini avtomatik o'rnatadi:
`nmap`, `hydra`, `metasploit-framework`, `nbtscan`, `netcat`, `telnet`, `openssh-client`, `ftp`, `curl`, `smbclient`.

---

## 🚀 O'rnatish va Ishga Tushirish (Installation)

Terminalingizni oching va quyidagi buyruqlarni ketma-ket kiriting:

```bash
# 1. Loyihani GitHub'dan yuklab oling
git clone https://github.com

# 2. Loyiha papkasiga o'ting
cd ghost-scan

# 3. Skriptga ishga tushirish ruxsatini bering
chmod +x ghost_scan.sh

# 4. Skriptni administrator (root) huquqi bilan ishga tushiring
sudo ./ghost_scan.sh
```

---

## 📖 Skrinshotlar va Interfeys (UI)

Skript ishga tushganda sizni quyidagicha chiroyli radar grafikali ASCII banner va qulay menyu qarshi oladi:

```text
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

====================================================
          GHOST-SCAN v4.0: AI PORT ANALYZER
====================================================
Joriy nishon (Target): 192.168.1.1
----------------------------------------------------
1)  Nishonni o'zgartirish (Yakka IP yoki Butun Tarmoq)
2)  WI-FI TARMOQDAGI BARCHA QURILMALARNI QIDIRISH
...
8)  🌐 SMART PORT CONNECTOR - Avtomatik Aniqlash
9)  📖 PORT VA NETWORK QO'LLANMASI
10) Chiqish
====================================================
```

---

## 💡 Aqlli Ulanish Strategiyasi (Smart Connector Guide)

Dasturning **8-bandi** orqali har bir portga xos avtomatlashtirilgan ulanish ssenariylari ishlaydi:
*   **Port 21:** To'g'ridan-to'g'ri FTP fayl tizimiga kirish seansini ochadi.
*   **Port 22:** Login so'rab, darhol SSH konsolini ishga tushiradi.
*   **Port 23:** Telnet orqali xavfsiz bo'lmagan terminal ulanishini sinaydi.
*   **Port 80/443:** Veb-sayt sarlavhalarini (Headers) o'qib, brauzer orqali qanday kirishni o'rgatadi.
*   **Port 139/445:** Tarmoqdagi umumiy baham ko'rilgan (Shared) Samba papkalar ro'yxatini chiqaradi.
*   **Boshqa portlar:** `Netcat (NC)` yordamida universal raw-ulanish hosil qiladi.

---

## 📜 Litsenziya (License)

Ushbu loyiha [MIT](LICENSE) litsenziyasi bo'yicha tarqatiladi. Uni o'zgartirish va shaxsiy maqsadlarda rivojlantirish mutlaqo bepul.

---
**👨‍💻 Dasturchi:** [@Pydeveloperman](https://github.com/pydevloperman)  
Agar ushbu kiber-skaner sizga foydali bo'lgan bo'lsa, loyihaga **Star (⭐️)** bosishni unutmang!
