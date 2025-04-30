# Task Management System

A comprehensive Spring Boot-based task management system featuring role-based access control, real-time notifications, analytics, and a RESTful API.

## Features

- **User Authentication & Authorization**
  - JWT-based authentication
  - Role-based access control (Admin, Manager, User)
  - Secure password handling

- **Task Management**
  - Create, read, update, and delete tasks
  - Task assignment and reassignment
  - Status tracking with customizable workflows
  - Priority management
  - Due date tracking
  - File attachments
  - Comments and discussions

- **Real-time Features**
  - WebSocket notifications for task updates
  - Live task status changes
  - Instant comment notifications

- **Reporting & Analytics**
  - Task completion metrics
  - User productivity analysis
  - Overdue task tracking
  - Customizable dashboards

- **API Documentation**
  - OpenAPI/Swagger integration
  - Interactive API testing interface

## Technology Stack

- **Backend**
  - Java 24
  - Spring Boot 3.4.x
  - Spring Security with JWT
  - Spring Data JPA
  - Spring WebSocket
  - PostgreSQL/H2 Database

- **Build Tools**
  - Maven
  - Flyway for database migrations

- **Testing**
  - JUnit 5
  - Mockito
  - Spring Boot Test

- **Documentation**
  - SpringDoc OpenAPI

## Getting Started

### Prerequisites

- JDK 24 or later
- Maven
- PostgreSQL Server
- IDE (IntelliJ IDEA, Eclipse, VS Code)

### Database Setup

1. Create a PostgreSQL database:
   ```sql
   CREATE DATABASE task_management;
   ```

2. Update the database configuration in `application.properties` if needed:
   ```properties
   spring.datasource.url=jdbc:postgresql://localhost:5432/task_management
   spring.datasource.username=your_username
   spring.datasource.password=your_password
   ```

### Running the Application

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/task-management-system.git
   cd task-management-system
   ```

2. Build the project:
   ```bash
   mvn clean install
   ```

3. Run the application:
   ```bash
   mvn spring-boot:run
   ```

4. Access the application:
   - API Base URL: http://localhost:8080/api
   - Swagger UI: http://localhost:8080/api/swagger-ui.html

### Default Credentials

The system will be initialized with the following user:
- Admin User:
  - Username: admin
  - Password: admin123
  - Role: ADMIN

## API Endpoints

### Authentication

- `POST /api/auth/signin` - Authenticate user and get token
- `POST /api/auth/signup` - Register a new user
- `POST /api/auth/refreshtoken` - Refresh authentication token

### Tasks

- `GET /api/tasks` - Get all tasks (paginated)
- `GET /api/tasks/{id}` - Get a specific task
- `POST /api/tasks` - Create a new task
- `PUT /api/tasks/{id}` - Update a task
- `DELETE /api/tasks/{id}` - Delete a task
- `GET /api/tasks/status/{status}` - Get tasks by status
- `GET /api/tasks/search` - Search tasks
- `GET /api/tasks/my-tasks` - Get current user's assigned tasks
- `PATCH /api/tasks/{id}/status` - Update task status

### Users

- `GET /api/users` - Get all users (Admin only)
- `GET /api/users/{id}` - Get user details
- `PUT /api/users/{id}` - Update user details
- `GET /api/users/me` - Get current user profile

### Analytics

- `GET /api/analytics/task-stats` - Get task statistics
- `GET /api/analytics/user-performance` - Get user performance data
- `GET /api/analytics/overdue-tasks` - Get overdue tasks report

## Project Structure

```
src/main/java/com/yourname/taskmanagement/
├── config/         # Configuration classes
├── controller/     # REST controllers 
├── dto/            # Data Transfer Objects
├── exception/      # Custom exceptions
├── mapper/         # DTO-Entity mappers
├── model/          # Entity classes
├── repository/     # JPA repositories
├── security/       # Security configurations
├── service/        # Business logic
└── util/           # Utility classes
```

## Security

This application implements several security measures:
- JWT token authentication
- Password encryption using BCrypt
- Role-based access control
- HTTPS support (in production)
- CSRF protection
- Input validation

## Deployment

### Docker

```bash
# Build Docker image
docker build -t task-management-system .

# Run container
docker run -p 8080:8080 task-management-system
```

### Environment Variables

The application can be configured using the following environment variables:

| Variable | Description | Default |
|----------|-------------|---------|
| `POSTGRES_HOST` | PostgreSQL host | localhost |
| `POSTGRES_PORT` | PostgreSQL port | 5432 |
| `POSTGRES_DB` | PostgreSQL database name | task_management |
| `POSTGRES_USER` | PostgreSQL username | postgres |
| `POSTGRES_PASSWORD` | PostgreSQL password | password |
| `JWT_SECRET` | JWT secret key | yourSecretKey... |
| `JWT_EXPIRATION` | JWT expiration (ms) | 86400000 |

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Spring Boot team for the amazing framework
- All contributors who participate in this project