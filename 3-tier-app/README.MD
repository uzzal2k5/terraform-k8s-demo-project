Create a Nodejs Web App -

Requirement -
1) The frontend will be hosted using Nginx.
2) Clicking the counter button on index.html will increment the count and store it in a PostgreSQL database.
3) The backend (business layer) will be a Node.js application.
4) The database will be named counterdb, and the app_data table schema will be managed in PostgreSQL.
5) Separate Docker images will be created for both the frontend and backend.
6) Nginx will be configured using default.conf.
7) Deployment will be handled using Docker Compose.
8) A proper folder structure will be maintained.

Functionality of application -

The web interface should include a button, a text string, and a counter display.
Clicking the button should increase the counter, with the updated value stored in the database. However, the counter does not need to update automatically when the database changes.
Administrators should be able to configure the text string without modifying the application.


3-tier-app/
├── backend/
│   ├── node_modules/
│   ├── package.json
│   ├── server.js
│   └── Dockerfile
├── frontend/
│   ├── index.html
│   ├── styles.css
│   └──
Dockerfile
├── db/
│   └── init.sql (for creating the `app_data` table)
├── docker-compose.yml
└── nginx/
    ├── default.conf
    └── Dockerfile

