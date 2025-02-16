# intune-scripts-toolbox
This repository is a collection of custom scripts designed to streamline and enhance the management of applications via Microsoft Intune.

---

## Overview

This repository contains various custom scripts for automating and simplifying tasks within Microsoft Intune. Each script is accompanied by a brief overview, usage instructions, and other relevant details. Contributions and improvements are welcome!

---

## Repository Structure

```
intune-scripts-toolbox/
├── scripts/
│ ├── 7zip-detection.ps1
│ └── ... (other scripts)
├── docs/
│ └── (additional documentation)
└── README.md
```

Each script file in the `scripts/` directory is intended for use in Intune deployment scenarios. Detailed information about each script is provided below.

---

## Scripts

### 1. 7-Zip Custom Detection Script
- **Overview:**  
  A PowerShell script that detects the presence of 7-Zip on a target device. This script can be used within Intune to validate application installations and ensure compliance with deployment requirements.
  
- **Usage:**  
  1. Upload the script to your Intune portal under **Devices > Scripts**.  
  2. Configure the script settings according to your deployment needs.  
  3. Deploy the script to the target device groups.
  
- **Note:**  
  The script is designed to serve as a template and can be customized further to meet specific organizational requirements.

### 2. (Additional Script Name)
- **Overview:**  
  Brief description of what the script does.
  
- **Usage:**  
  Step-by-step instructions on how to implement this script in an Intune environment.

*Feel free to add new scripts following the structure above.*

---

## How to Contribute

Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Add your script along with a corresponding entry in the README.
4. Submit a pull request for review.

Please follow the existing code style and documentation format.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

