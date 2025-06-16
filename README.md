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
└── README.md
```

Each script file in the `scripts/` directory is intended for use in Intune deployment scenarios. Detailed information about each script is provided below.

---

## Scripts

### 1. 7-Zip Custom Detection Script
- **Overview:**  
  This PowerShell script is intended for use as a custom detection rule when deploying 7-Zip as a Win32 app via Microsoft Intune. In scenarios where standard detection rules fall short—particularly when needing to verify specific version details for instances where older versions of 7-Zip have been previously deployed—this script provides a tailored solution to accurately detect the installed version.

- **Usage:**  
  1. Prepare your 7-Zip installer (EXE or MSI) by wrapping it into an `.intunewin` package. For detailed instructions on this process, please refer to Microsoft Learn documentation.  
  2. In the Intune portal, when configuring the Win32 app deployment, choose to use a custom detection script under the detection rules section.  
  3. Upload this script as your detection method to ensure that the correct version of 7-Zip is identified on target devices.
  
- **Note:**  
  This script addresses the limitation of standard detection rules, which may not capture version details effectively if a previous version of 7-Zip was installed. Customize the script further as needed to suit your environment's specific requirements.


### 2. Monthly MFA Report Script
- **Overview:**
  Retrieves a list of user registration details for multi-factor authentication (MFA) using Microsoft Graph and exports the data to a CSV file.

- **Usage:**
  1. Ensure the executing account has the `Reports.Read.All` permission.
  2. Run `monthly-mfa-report.ps1`. The script connects to Microsoft Graph and saves the report as `monthly_mfa_report.csv` in the same directory.

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

