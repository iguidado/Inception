# Inception 🚀

This repository contains the Inception project, a comprehensive Docker-based environment for web development, focusing on setting up a robust web stack including Nginx, WordPress, MariaDB, and various supporting services.

## Project Overview 📋

Inception aims to provide a self-contained, reproducible development environment using Docker. It focuses on essential components for modern web applications, emphasizing security and efficient resource management.

## Features ✨

*   **Containerized Nginx:** A secure Nginx container configured with TLSv1.2 or TLSv1.3, acting as the primary entry point for the web stack on port 443.
*   **WordPress & PHP-FPM Integration:** Seamless integration of WordPress with PHP-FPM for dynamic content delivery.
*   **MariaDB Database:** A robust MariaDB container with support for multiple database users.
*   **Volume Management:**
    *   A dedicated volume for website data, shared between WordPress and Nginx containers.
    *   A separate volume for database persistence, allowing for data export and import.
*   **Service Linking:** Efficient inter-container communication using Docker's linking capabilities.
*   **Bonus Services:** Includes optional bonus services like Adminer and FTP for enhanced development and management.
*   **Docker Compose Orchestration:** Simplified deployment and management of the entire stack using `docker-compose`.

## Installation 🛠️

This project utilizes Docker and Docker Compose for deployment. Ensure you have Docker and Docker Compose installed on your system.

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/iguidado/Inception.git
    cd Inception
    ```

2.  **Set Up Docker Environment:**
    The `setup_docker.sh` script assists in preparing the necessary Docker environment.
    ```bash
    chmod +x setup_docker.sh
    ./setup_docker.sh
    ```
    *Note: This script may require specific permissions or configurations depending on your operating system.*

3.  **Configure Environment Variables (if applicable):**
    If there are `.env` files within the `srcs` directory, ensure they are correctly configured for your environment. For example, `srcs/.env` might contain database credentials or other sensitive information.

4.  **Build and Run Docker Containers:**
    Use Docker Compose to build the images and start the services.
    ```bash
    docker-compose up -d
    ```
    This command will download necessary images, build custom ones if needed, and start all defined services in detached mode.

## Usage 💡

Once the Docker containers are running, you can access the services:

*   **Nginx:** Accessible via `https://localhost` (or the configured domain) on port 443.
*   **WordPress:** Access the WordPress admin panel and frontend through the Nginx entry point.
*   **MariaDB:** Connect to the MariaDB instance using the credentials defined in your Docker Compose configuration or `.env` files.
*   **Adminer (Bonus):** If enabled, Adminer will be accessible via its designated port, providing a web-based database management interface.
*   **FTP (Bonus):** If enabled, you can connect to the FTP server using the configured credentials for file transfers.

**Example: Accessing WordPress**

After the containers are up, navigate to `https://localhost` in your web browser to begin the WordPress setup process.

**Example: Connecting to MariaDB (from another container or locally if configured)**

```bash
# Example using docker exec to run a mysql client inside the mariadb container
docker exec -it inception_mariadb_1 mysql -u your_db_user -p your_database_name
```
*Replace `inception_mariadb_1`, `your_db_user`, and `your_database_name` with your actual container name and credentials.*
