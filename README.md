
```markdown
# Auto Database Backup and GitHub Sync

This project automates the process of creating backups of a PostgreSQL database and pushing them to a GitHub repository for secure storage and versioning.

## Features
- Automates PostgreSQL database backups.
- Pushes the backup files to a GitHub repository.
- Supports configuration via a secure external config file.
- Ensures sensitive information like database credentials is not hardcoded in scripts.

## Prerequisites
1. PostgreSQL installed and running.
2. Git installed and configured.
3. A GitHub repository set up for storing backups.
4. Access to the PostgreSQL database with valid credentials.

## Setup

### 1. Clone the Repository
Clone this repository to your local machine:
```bash
git clone https://github.com/Nish1102/backup_cronjob.git
cd backup_cronjob
```

### 2. Configure Database Credentials
Create a configuration file `db_config.conf` in the project directory:
```bash
nano /home/nishant/Project/db-config/db_config.conf
```

Add the following lines:
```plaintext
POSTGRES_USER=postgres
POSTGRES_DB=cricket
POSTGRES_PASSWORD=your_postgres_password
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
```

Make the file secure:
```bash
chmod 600 /home/nishant/Project/db-config/db_config.conf
```

### 3. Update Backup Script
Ensure the script `backup_to_github.sh` points to the correct configuration file:
```bash
source /home/nishant/Project/db-config/db_config.conf
```

### 4. Automate the Backup
Set up a cron job to automate the script execution:
```bash
crontab -e
```

Add the following line to run the script daily at 2:00 AM:
```bash
0 2 * * * /home/nishant/Project/data-backup/backup_to_github.sh >> /home/nishant/Project/data-backup/backup.log 2>&1
```

Save and exit.

## Usage
To manually run the backup:
```bash
/home/nishant/Project/data-backup/backup_to_github.sh
```

Check the `backup.log` file for execution details:
```bash
cat /home/nishant/Project/data-backup/backup.log
```

## Repository Structure
```
backup_cronjob/
├── backup_to_github.sh    # Script to automate database backup and push to GitHub
├── db_config.conf         # Configuration file for database credentials
├── backups/               # Directory where backups are stored
└── README.md              # Project documentation
```

## Contributions
Feel free to fork the repository, open issues, or submit pull requests for improvements.

## Contact
For any questions or issues, reach out to [Nishant](mailto:nishantamar09@gmail.com).
```


