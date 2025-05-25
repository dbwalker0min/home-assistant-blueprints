# 📋 Changelog

All notable changes to this blueprint will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org/).

---

## [1.0.0] - 2025-05-24

🎉 Initial release

- Opens the garage door when a person arrives home after being away for a minimum amount of time
- Automation is gated behind an `input_boolean` enable switch
- Optionally closes the garage when the switch is enabled
- Includes a 5-second delay to avoid flapping or accidental retriggers
- Automatically disables itself after triggering (optional)
- Fully configurable via UI with selectors
- HACS-compatible structure and metadata
