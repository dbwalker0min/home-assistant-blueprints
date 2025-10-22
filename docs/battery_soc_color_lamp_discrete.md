# Battery SoC Controlled Lamp — Discrete Colors

[![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint pre-filled.](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fraw.githubusercontent.com%2Fdbwalker0min%2Fhome-assistant-blueprints%2Frefs%2Fheads%2Fmain%2Fblueprints%2Fautomation%2Fdbwalker0min%2Fbattery_soc_color_lamp_discrete.yaml)

A simple Home Assistant blueprint that sets the color of a smart color-changing bulb based on the current battery state of charge (SoC). This makes it easy to glance at a light and know whether your home battery is low, mid, or full — ideal for Powerwall, solar, or any battery integration (though it would be a bit weird to use for your phone!).

In my case, I'm connecting this up to a cute [desk lamp I found on Etsy](https://www.etsy.com/listing/1746498080/sci-fi-wasabi-custom-table-lamp-with?ref=user_profile&frs=1&pro=1) (I haven't gotten it yet :cry:).

##### Features

- Discrete colors defined by user-configurable thresholds  
- Useful for solar systems 
- Fully configurable in the UI — no YAML edits required.

---

## Example Behavior (default thresholds)

| SoC (%) | Color   | Meaning            |
|---------|---------|--------------------|
| ≤ 20%   | 🔴 Red     | Low/empty |
| ≤ 40%   | 🟠 Orange  | Low-mid            |
| ≤ 60%   | 🟡 Yellow  | Mid                |
| ≤ 80%   | 🩵 Cyan    | High but not full |
| ≤100%   | 🟢 Green   | Full               |

You can freely adjust thresholds and colors in the blueprint configuration.

---

## Required Inputs

- **Battery SoC Sensor**  
  A sensor or number entity reporting SoC as a percentage (0–100).  
  Example: `sensor.powerwall_battery_level`.

- **Target Light**  
  Any color-capable light entity. Works with most Zigbee, Thread, and Wi-Fi bulbs. It was tested using a LIFX Wi-Fi bulb.

- **Brightness Control**   
  An `input_number` that controls the brightness of the lamp dynamically.
  
- **Color Map**  
  A mapping between the SOC level and the color used is provided. This is fully editable. The possible colors are: red, orange, yellow, green, blue, indigo, violet, lime, gold, and cyan. The entries in the color map don't need to be in any particular order. The default values correspond to the values above.
  
- **Update interval (seconds)**
  The automation is triggered every so often to keep the bulb color up-to-date.

---

## Blueprint Image

![battery_soc_blueprint_image.png (1143×1085)](https://raw.githubusercontent.com/dbwalker0min/home-assistant-blueprints/refs/heads/main/docs/battery_soc_blueprint_image.png)

## Source

The source for these automations is on GitHub [here]([dbwalker0min/home-assistant-blueprints: A Home Assistant Blueprint to automatically open the garage door when returning home](https://github.com/dbwalker0min/home-assistant-blueprints)).

## Questions

If you have any questions about the blueprint, contact me at [dbwalker0min@gmail.com](mailto:dbwalker0min@gmail.com).
