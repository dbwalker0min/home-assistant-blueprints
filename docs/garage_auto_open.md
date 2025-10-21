# 🚗 Garage Auto Open Blueprint

This Home Assistant blueprint opens your garage door automatically when a person arrives home — but only if they've been away for a configurable amount of time, and a toggle (`input_boolean`) is enabled.

You can also configure it to **close the garage** when the automation is armed, and to **disable itself automatically** after use.

The usecase (at least for me) is that you're going out for a bike ride. When I come home, I want the garage door to open for me, and not pull out my phone, etc. When I leave, I click on the button on my Home Assistant page. This (can) will close the garage door. I leave for a certain amount of time, and when I return home, the garage door magically opens! 

---

## 🎯 Features

- 🚪 Opens your garage when someone arrives
- ⏳ Only triggers if they've been away for a minimum time (default: 3 minutes)
- 🔘 Controlled by an `input_boolean` for manual arming/disarming
- 🔒 Optional auto-disable after activation
- 👋 Closes garage when enabling the toggle (to safely arm the system)
- 🕓 5-second delay prevents flapping/retriggers

---

## 🧰 Required Entities

- `person` entity — to detect arrival
- `input_boolean` — acts as an enable/disable switch
- `cover` entity — your garage door

---

## 🛠 Inputs

| Input              | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| `person_entity`    | The person to monitor for arrival                                           |
| `enable_boolean`   | An `input_boolean` used to enable/disable the automation                    |
| `garage_cover`     | The cover entity for the garage door                                        |
| `min_away_seconds` | How long the person must be away to trigger on return (default: 180 sec)   |
| `turn_off_boolean` | If true, disables the `input_boolean` after triggering (default: true)     |

---

## 📦 Installation

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

