# Flask Task Manager

![Python Version](https://img.shields.io/badge/python-3.8+-blue)
![Flask Version](https://img.shields.io/badge/flask-2.0+-lightgrey)
![License](https://img.shields.io/badge/license-MIT-green)

A secure Flask-based web application for task management with user authentication and data persistence.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Testing](#testing)
- [API Reference](#api-reference)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

## Features

✔ **User Authentication**  
- Secure registration and login system  
- Session management  
- Password hashing  

✔ **Task Management**  
- Create, read, update, and delete tasks  
- Task search functionality  
- User-specific task isolation  

✔ **Technical Highlights**  
- Flask-based MVC architecture  
- SQLAlchemy ORM for data persistence  
- Jinja2 templating engine  
- pytest test coverage  

## Prerequisites

- Python 3.8+
- pip 20.0+
- PostgreSQL (or SQLite for development)
- Virtual environment (recommended)
- docker (for container development)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/baladin/flask_project.git
   cd flask_project
   ```

2. Set up a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements
   ```

## Configuration

Create a `.env` file in the root directory:
```ini
FLASK_APP=app.py
FLASK_ENV=development
DATABASE_URL=postgresql://user:password@localhost/dbname
SECRET_KEY=your-secret-key-here
```

## Usage

Start the development server:
```bash
flask run
```

Access the application at `http://localhost:5000`

## Testing

Run the test suite with:
```bash
pytest tests/ -v
```

View coverage report:
```bash
pytest --cov=app tests/
```
Here's a simplified, step-by-step Docker guide focused on installation, image creation, and container management:

---

## **Docker Guide for Flask Task Manager**

### **1. Install Docker**
#### **Windows/macOS:**
1. Download Docker Desktop:  
   https://www.docker.com/products/docker-desktop  
2. Run the installer and follow prompts.  
3. Launch Docker Desktop (wait for the whale icon to show "Docker is running").

#### **Linux (Ubuntu):**
```bash
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
```

Verify installation:  
```bash
docker --version  # Should show Docker version
```

---

### **2. Build Your Docker Image**
1. Navigate to your project folder:  
   ```bash
   cd /path/to/flask_project
   ```

2. Create a `Dockerfile` (no extension) with:
   ```dockerfile
   # Use lightweight Python image
   FROM python:3.8-slim

   # Set working directory
   WORKDIR /app

   # Copy requirements first (for caching)
   COPY requirements .
   RUN pip install --no-cache-dir -r requirements.txt

   # Copy all files
   COPY . .

   # Expose port 5000 (Flask default)
   EXPOSE 5000

   # Run the app
   CMD ["flask", "run", "--host=0.0.0.0"]
   ```

3. Build the image:  
   ```bash
   docker build -t flask-taskmanager .
   ```
   - `-t` names your image (e.g., `flask-taskmanager`).

---

### **3. Run Your Container**
```bash
docker run -d -p 5000:5000 --name myapp flask-taskmanager
```
- `-d`: Runs in background (detached mode).  
- `-p 5000:5000`: Maps your laptop's port 5000 → container's port 5000.  
- `--name`: Names your container (`myapp`).  

Access your app:  
👉 Open http://localhost:5000 in your browser.

---

### **4. Essential Docker Commands**
| Command | Description |
|---------|-------------|
| `docker ps` | List running containers |
| `docker stop myapp` | Stop the container |
| `docker start myapp` | Restart it later |
| `docker rm myapp` | Delete the container |
| `docker rmi flask-taskmanager` | Remove the image |
| `docker logs myapp` | View app logs |

---

### **5. Clean Up**
Stop and remove all containers/images:  
```bash
docker stop $(docker ps -aq)  # Stop all containers
docker system prune -a        # Remove unused images/networks
```

---

### **Troubleshooting**
- **"Port already in use"?**  
  Change the host port (e.g., `-p 5001:5000`).  
- **Missing dependencies?**  
  Rebuild with `--no-cache`:  
  ```bash
  docker build --no-cache -t flask-taskmanager .
  ```

---

### **Why Use Docker?**
- **No setup headaches**: Runs the same everywhere.  
- **Isolation**: No conflicts with other Python projects.  
- **Deployment-ready**: Same image works on AWS/Heroku.  


## API Reference

### Authentication
| Endpoint       | Method | Description           |
|----------------|--------|-----------------------|
| `/register`    | POST   | User registration     |
| `/login`       | POST   | User login            |
| `/logout`      | GET    | User logout           |

### Tasks
| Endpoint       | Method | Description           |
|----------------|--------|-----------------------|
| `/tasks`       | GET    | List all tasks        |
| `/tasks`       | POST   | Create new task       |
| `/tasks/<id>`  | PUT    | Update task           |
| `/tasks/<id>`  | DELETE | Remove task           |

## Deployment

### Heroku
```bash
heroku create
heroku addons:create heroku-postgresql:hobby-dev
git push heroku main
```

### Docker
```bash
docker build -t flask-taskmanager .
docker run -p 5000:5000 flask-taskmanager
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


