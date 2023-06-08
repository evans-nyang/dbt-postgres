# dbt-postgres

This is a sample project that demonstrates how to run a DBT (Data Build Tool) project using Docker and Docker Compose.

## Prerequisites

Before running the project, ensure that you have the following prerequisites installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

To get started with the project, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/evans-nyang/dbt-postgres.git
    ```

2. Navigate to the project directory:

   ```bash
   cd dbt-postgres
   ```

3. Set up environment variables:
    - Create a `.env` file in the root of the project directory
    - Add the following environment variables to the `.env` file:

        ```bash
        POSTGRES_USER=your_username
        POSTGRES_PASSWORD=your_password
        POSTGRES_DB=your_database
        PORT=your_app_port
        DB_PORT=your_db_port
        DB_HOST=your_db_host

        ```

    - Replace your_username, your_password, your_database, your_app_port, your_db_port, and your_db_host with your desired values.

4. Create the Docker network:

   ```bash
   docker network create dbtnet
   ```

5. Build and run the project using Docker Compose:

   ```bash
   docker compose up --build
   ```

6. Access the running project:
    Once the containers are up and running, you can access the project using your web browser or API client at `http://localhost:your_app_port`.

7. Shutting down the project:
    To stop the project, press `Ctrl + C` in the terminal where the project is running. Then, run the following command to remove the containers:

    ```bash
    docker compose down -v
    ```

    Note that the data stored in the PostgreSQL container will persist even after shutting down the project. To remove the data, run the following command:

    ```bash
    docker volume rm dbt-postgres_dbt-postgres-data
    ```

## Additional Information

- **Project Configuration**: The `dbt_project.yml` file in the project directory contains the project configuration. You can modify it according to your requirements. It specifies the project name, version, and other settings.
- **DBT Profile**: The `.dbt/profiles.yml` file in the project directory contains the DBT profile configuration. It defines the database connection details and credentials for connecting to the PostgreSQL database. Update this file with your specific database information if necessary.

## Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
- Learn more about docker [in the docs](https://docs.docker.com/) and docker compose [in the docs](https://docs.docker.com/compose/)

## License

 This project is licensed under the [MIT License](LICENSE). Please review the license file for more details on the permissions and limitations it provides.

 Feel free to explore and customize this project according to your specific needs and requirements. If you have any questions or need further assistance, please don't hesitate to reach out.
