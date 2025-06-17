# Library Management System - Microservices Architecture

This is a comprehensive Library Management System built using Java Spring Boot with microservices architecture. The system allows users to manage book collections, member registrations, borrowing and returning of books, and overdue tracking.

## Architecture Overview

The system follows a microservices architecture with the following services:

### Services
1. **API Gateway** (Port 8080) - Routes requests to appropriate microservices
2. **Book Service** (Port 8081) - Manages book collection and inventory
3. **Member Service** (Port 8082) - Handles member registration and profiles
4. **Transaction Service** (Port 8083) - Manages borrowing and returning processes
5. **Fine Service** (Port 8084) - Tracks overdue books and manages fines
6. **Notification Service** (Port 8085) - Sends notifications and alerts via email

### Key Features
- **Book Management**: Add, update, delete, and search books
- **Member Management**: Register members, update profiles, manage membership status
- **Borrowing System**: Borrow and return books with due date tracking
- **Fine Management**: Automatic fine calculation for overdue books
- **Notifications**: Alerts for due dates, overdue books, and fines
- **Service Discovery**: Using Netflix Eureka
- **API Gateway**: Centralized routing and load balancing

## Technology Stack
- **Framework**: Spring Boot 3.2.0
- **Java Version**: JDK 21
- **Database**: MySQL 8.0
- **Service Discovery**: Netflix Eureka Server
- **API Gateway**: Spring Cloud Gateway
- **Inter-service Communication**: OpenFeign
- **ORM**: Spring Data JPA
- **API Documentation**: OpenAPI 3.0 (Swagger)
- **Caching**: Caffeine Cache
- **Email Service**: Spring Mail with Thymeleaf templates
- **Validation**: Bean Validation
- **Build Tool**: Maven

## Database Schema

Each microservice has its own database:

### Book Service Database
- **books**: Stores book information (title, author, genre, ISBN, availability)

### Member Service Database  
- **members**: Stores member information (name, email, phone, address, status)

### Transaction Service Database
- **borrowing_transactions**: Tracks borrowing and return transactions

### Fine Service Database
- **fines**: Manages fine records for overdue books

### Notification Service Database
- **notifications**: Stores notification records

## Getting Started

### Prerequisites
- Java 21 or higher
- Maven 3.9+
- MySQL 8.0+
- SMTP Server configuration (for email notifications)

### Setup Instructions

1. **Database Setup**
   \`\`\`bash
   # Run the SQL scripts to create databases and tables
   mysql -u root -p < scripts/01-create-databases.sql
   mysql -u root -p < scripts/02-seed-data.sql
   \`\`\`

2. **Start Eureka Server**
   - Download and start Netflix Eureka Server on port 8761
   - Or use Spring Cloud Eureka Server starter

3. **Configure Database Connection**
   - Update database credentials in each service's `application.yml`
   - Default: username=root, password=password

4. **Start Services**

5. **Start Eureka Server**
   \`\`\`bash
   cd eureka-server && mvn spring-boot:run
   \`\`\`

6. **Configure Email Settings (Optional)**
   - Update notification-service application.yml with your SMTP settings
   - Set environment variables: MAIL_USERNAME and MAIL_PASSWORD
   \`\`\`bash
   # Start services in this order
   cd eureka-server && mvn spring-boot:run
   cd api-gateway && mvn spring-boot:run
   cd book-service && mvn spring-boot:run  
   cd member-service && mvn spring-boot:run
   cd transaction-service && mvn spring-boot:run
   cd fine-service && mvn spring-boot:run
   cd notification-service && mvn spring-boot:run
   \`\`\`

## API Documentation

Each service provides comprehensive API documentation using OpenAPI 3.0 (Swagger):

- **API Gateway Swagger UI**: http://localhost:8080/swagger-ui.html
- **Book Service**: http://localhost:8081/swagger-ui.html
- **Member Service**: http://localhost:8082/swagger-ui.html
- **Transaction Service**: http://localhost:8083/swagger-ui.html
- **Fine Service**: http://localhost:8084/swagger-ui.html
- **Notification Service**: http://localhost:8085/swagger-ui.html

## API Endpoints

### Through API Gateway (http://localhost:8080)

#### Book Management
- `GET /api/books` - Get all books
- `GET /api/books/{id}` - Get book by ID
- `GET /api/books/search?title=&author=&genre=` - Search books
- `POST /api/books` - Create new book
- `PUT /api/books/{id}` - Update book
- `DELETE /api/books/{id}` - Delete book

#### Member Management
- `GET /api/members` - Get all members
- `GET /api/members/{id}` - Get member by ID
- `POST /api/members` - Register new member
- `PUT /api/members/{id}` - Update member
- `PUT /api/members/{id}/status` - Update membership status

#### Transaction Management
- `GET /api/transactions` - Get all transactions
- `GET /api/transactions/member/{memberId}` - Get member's transactions
- `POST /api/transactions/borrow` - Borrow a book
- `PUT /api/transactions/{id}/return` - Return a book
- `GET /api/transactions/overdue` - Get overdue transactions

#### Fine Management
- `GET /api/fines` - Get all fines
- `GET /api/fines/member/{memberId}` - Get member's fines
- `POST /api/fines` - Create fine
- `PUT /api/fines/{id}/pay` - Pay fine

#### Notification Management
- `GET /api/notifications` - Get all notifications
- `GET /api/notifications/{id}` - Get notification by ID
- `GET /api/notifications/member/{memberId}` - Get member's notifications
- `POST /api/notifications` - Create notification
- `POST /api/notifications/due-reminder` - Create due reminder
- `POST /api/notifications/overdue-alert` - Create overdue alert
- `POST /api/notifications/fine-notice` - Create fine notice
- `GET /api/notifications/stats` - Get notification statistics

## Business Rules

1. **Borrowing Limits**: Members can borrow maximum 5 books at a time
2. **Borrowing Period**: Default borrowing period is 14 days
3. **Fine Calculation**: $1.00 per day for overdue books
4. **Book Availability**: System automatically manages book availability
5. **Member Status**: Only ACTIVE members can borrow books

## Microservices Communication

- **Synchronous**: REST API calls using OpenFeign clients
- **Service Discovery**: Netflix Eureka for service registration and discovery
- **Load Balancing**: Client-side load balancing through Ribbon
- **Circuit Breaker**: Can be implemented using Hystrix or Resilience4j

## Monitoring and Health Checks

Each service exposes actuator endpoints:
- `/actuator/health` - Health check
- `/actuator/info` - Service information

## New Features (JDK 21 Enhanced)

### 🚀 **Enhanced Backend Features**
- **OpenAPI 3.0 Documentation** - Complete API documentation with Swagger UI
- **Eureka Service Discovery** - Centralized service registry and discovery
- **Email Notifications** - HTML email templates with Thymeleaf
- **Caching Layer** - Caffeine cache for improved performance
- **Async Processing** - Asynchronous notification processing
- **Scheduled Tasks** - Automated overdue processing and reminders
- **Global Exception Handling** - Consistent error responses across services
- **Health Checks & Metrics** - Comprehensive monitoring endpoints

### 📧 **Notification System**
- **Email Templates** - Professional HTML email templates
- **Retry Mechanism** - Failed notification retry with exponential backoff
- **Notification Types** - Due reminders, overdue alerts, fine notices
- **Statistics Dashboard** - Notification metrics and analytics
- **Async Processing** - Non-blocking notification delivery

### 🔧 **Technical Enhancements**
- **JDK 21 Compatibility** - Latest Java features and performance improvements
- **Enhanced Security** - CORS configuration and security headers
- **Improved Logging** - Structured logging with correlation IDs
- **Configuration Management** - Externalized configuration with profiles
- **Database Optimization** - Connection pooling and query optimization

## Future Enhancements

1. **Authentication & Authorization**: JWT-based security
2. **Event-Driven Architecture**: Message queues for async communication
3. **Caching**: Redis for improved performance
4. **Monitoring**: ELK stack for logging and monitoring
5. **Containerization**: Docker and Kubernetes deployment
6. **Frontend**: Angular/React web application
7. **Mobile App**: Native mobile applications

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License.
