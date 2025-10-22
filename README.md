# 🧰 Home Assistant Blueprints by dbwalker0min

[![hacs_badge](https://img.shields.io/badge/HACS-Default-orange.svg?style=for-the-badge)](https://hacs.xyz/docs/use)
[![Add to HACS](https://my.home-assistant.io/badges/hacs_repository.svg)](https://my.home-assistant.io/redirect/hacs_repository/?owner=dbwalker0min&repository=home-assistant-blueprints&category=template)

This repository contains several automation blueprints for Home Assistant.

- Battery SOC Controlled Lamp
  Sets a color bulb based on the battery state of charge. 0% = red, 100% = green, with a smooth gradient in between. Brightness is controllable, and the shape of the curve can be changed as well.
- Garage Auto Open
  

---

## 📥 Manual import (optional)

[![Import Battery SoC Color Lamp](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?url=https://raw.githubusercontent.com/dbwalker0min/home-assistant-blueprints/main/blueprints/automation/dbwalker0min/battery_soc_color_lamp.yaml)

[![Import Garage Auto Open](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?url=https://raw.githubusercontent.com/dbwalker0min/home-assistant-blueprints/main/blueprints/automation/dbwalker0min/garage_auto_open.yaml)





## 📦 Installation

[![hacs_badge](https://img.shields.io/badge/HACS-Default-orange.svg?style=for-the-badge)](https://hacs.xyz/docs/use)

1. **Add this repository as a [custom repo in HACS](https://hacs.xyz/docs/faq/custom_repositories)** (category: `automation`)
2. Go to **HACS → Automations → Download** this blueprint
3. Go to **Settings → Automations → Blueprints → Create automation from blueprint**
4. Select **"Garage Auto Open Blueprint"** and configure the inputs

---

## 💡 Example Use Case

- Arm the automation (`input_boolean.garage_auto_open_david`) before heading out.
- When arming the automation (toggle ON), the garage closes for security.
- When you return home (based on iPhone location), if you've been gone >3 minutes, the garage opens.
- The automation disables itself automatically to avoid retriggers.

## 🚴 Real-World Use Case: Going for a Ride

The use case (at least for me) is going out for a bike ride. When I come home, I want the garage door to open automatically — no need to pull out my phone or use a remote. Before I leave, I simply click a button on my Home Assistant dashboard. This arms the automation and (optionally) closes the garage door if it’s still open. Then, after being away for a certain amount of time, I return — and the garage door magically opens!

---

## 📸 Screenshots

> _Add screenshots here of the blueprint input screen and automation trigger in action._

---

## 🧪 Testing Tips

- Simulate presence by changing the `person` state via Developer Tools.
- Toggle the `input_boolean` manually to test the close action.
- Observe the `cover` and `logbook` for behavior validation.

---

## 📄 License

MIT License

---

## 🙋‍♂️ Author

David Walker – [@dbwalker](https://github.com/dbwalker)

