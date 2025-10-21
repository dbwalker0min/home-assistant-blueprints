
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

