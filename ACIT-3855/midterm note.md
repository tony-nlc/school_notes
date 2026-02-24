**1. Microservices & Service-Oriented Architecture (SOA)**

• **Service Definition:** A discrete unit of functionality accessed remotely that logically represents a business activity (Single Responsibility Principle).

• **Microservices:** A form of SOA where services are fine-grained and **independently deployable**.

    ◦ **Benefits:** Strong module boundaries, technology diversity (different languages/DBs), and independent scalability.

    ◦ **Costs:** Complexity of distribution (slow/failing remote calls), **eventual consistency**, and increased operational complexity.

• **Loose Coupling:** Services should interact only through well-defined **Public Interfaces (APIs)** and remain independent of other services' internal implementations.

• **Edge Service:** A service exposed to the public internet (e.g., the **Receiver Service**) that routes external requests to internal services, often acting as an API Gateway.

**2. RESTful APIs & OpenAPI Specification**

• **HTTP Methods:** **POST** (create/report), **GET** (retrieve, no side effects), **PUT** (update), and **DELETE** (remove).

• **OpenAPI 3.0:** A standard for documenting APIs using YAML.

    ◦ **paths**: Defines the endpoints.

    ◦ **operationId**: Links the YAML endpoint to a specific Python function.

    ◦ **components/schemas**: Defines reusable data objects; use **$ref** to point to these schemas.

• **Connexion Framework:** Built on top of **Flask**; it automatically routes requests to functions based on the `operationId`.

    ◦ **Parameter naming:** The argument for the payload data in your Python function must be named **body**.

**3. Data Management & SQLAlchemy (ORM)**

• **Database Per Service:** Each service has its own persistent store to ensure loose coupling and technology independence.

• **SQLite vs. MySQL:** SQLite is used for development but is unsuitable for high concurrent load. **MySQL** is preferred for production as it handles many concurrent user threads better.

• **SQLAlchemy ORM:** Maps database tables to **Python classes**.

    ◦ **Core Components:** `create_engine`, `sessionmaker`, and `DeclarativeBase`.

    ◦ **Persistence:** Use `session.add(event)` and `session.commit()` to save data.

    ◦ **Database Independence:** Using an ORM allows switching from SQLite to MySQL with minimal code changes (mostly updating the resource string).

**4. Communication Patterns**

• **Synchronous:** Client blocks and waits for a response (e.g., RESTful HTTP calls using **httpx**).

• **Asynchronous:** Client does not wait for a response; involves a **Message Broker** like Kafka.

    ◦ **Producers (Publishers):** Send messages to a **Topic**.

    ◦ **Consumers (Subscribers):** Read messages from a Topic.

    ◦ **Dumb Pipes & Smart Endpoints:** Kafka (the pipe) is a simple transport mechanism; the services (endpoints) hold the logic for processing messages.

**5. Configuration, Logging, and Tracing**

• **External Configuration:** Defining parameters (URLs, DB credentials) in YAML files (`app_conf.yml`) so System Admins can adjust settings without modifying source code.

• **Logging Levels:** **CRITICAL** (crashes), **ERROR** (non-2XX responses), **WARNING** (unexpected but manageable), **INFO** (flow of code), and **DEBUG** (diagnostic data).

• **Trace ID:** A unique identifier added to an external request and carried through internal APIs to follow a request across multiple services in logs.

**6. Specialized Service Logic**

• **Periodic Processing:** Use the **apscheduler** library's `BackgroundScheduler` to run tasks (like statistics calculations) at fixed intervals without blocking API threads.

• **Event Sourcing:** Modeling changes as a sequence of events (e.g., the **Analyzer Service** reading Kafka message history).

**7. Testing Tools**
• **Postman/Bruno:** Used for functional testing of RESTful endpoints.

• **Apache jMeter:** A Java-based tool for **load testing**; simulates concurrent users and can generate randomized data for requests.