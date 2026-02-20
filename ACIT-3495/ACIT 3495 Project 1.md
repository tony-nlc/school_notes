Technical Architecture Report: ACIT-3495 Video Streaming and Storage System

1. Executive Overview and Technology Stack

This report provides a comprehensive architectural analysis of the ACIT-3495 video streaming and storage system. The platform is engineered as a polyglot microservices ecosystem designed to decouple the ingestion, management, and delivery of video content. By separating concerns between metadata handling, authentication, and binary storage, the system achieves a modular and scalable architecture.

The technical foundation relies on a strategic split between TypeScript and Go, with a deployment model centered on containerization. According to repository analysis, the codebase is distributed primarily between TypeScript (~40.7%) and Go (~34.5%), reflecting a specialized approach where frontend applications and backend logic are optimized for their respective roles.

Core Technology Stack

|Category|Technology|Role|
|---|---|---|
|Programming Languages (Backend)|Go|Core backend service logic and high-performance file management.|
|Programming Languages (Web)|TypeScript, JavaScript|Client-side application logic and frontend interactivity.|
|Web Components|CSS, HTML|User interface presentation, styling, and structural layout.|
|Infrastructure & DevOps|Docker, Docker-Compose|Containerized service isolation and environment orchestration.|

2. Component Architecture and Service Definitions

The system's folder structure (including `auth-service`, `file-service`, `streaming-app`, and `upload-app`) confirms a microservices architecture. A clear distinction is made between "apps"—the client-facing interfaces—and "services"—the backend logic.

• **Authentication Service (****auth-service****):** An identity verification microservice responsible for validating user credentials. It serves as the primary security gatekeeper for the delivery layer.

• **File System Service (****file-service****):** This serves as the Storage Abstraction Layer. It manages complex file I/O operations, providing a unified interface to read and write binary data across multiple backends, including local Hard Disk Drives (HDD) and AWS S3 buckets.

• **MySQL DB Service (****mysql-db****):** The System of Record for Metadata. This relational database maintains the mapping between video identifiers and their physical storage locations.

• **Upload Ingestion Layer (****upload-app** **&** **upload-service****):** The `upload-app` provides the TypeScript-based user interface for content submission. The `upload-service` manages the backend logic required to process these submissions and coordinate with storage and database components.

• **Streaming Delivery Layer (****streaming-app** **&** **streaming-service****):** The `streaming-app` is the web-based playback interface for the end-user. The `streaming-service` coordinates the retrieval of metadata and binary video data for real-time delivery.

3. Data Persistence and Storage Mapping

The architecture utilizes a pointer-based storage strategy, ensuring that heavy binary objects are stored separately from lightweight relational metadata.

• **MySQL DB Service:** Stores video names and their corresponding pointers, specifically the file paths or URLs where the media is persisted.

• **File Storage:** Persists the raw video files as binary objects, accessed exclusively through the File System Service.

4. Operational Workflow: Video Ingestion (Upload)

The ingestion of new video content into the system follows a strict sequential pipeline:

1. **User Submission:** The user interacts with the `upload-app` interface to initiate a file transfer.

2. **Metadata Registration:** The system registers the video name and its intended storage path within the MySQL DB Service, establishing the record before the binary transfer is finalized.

3. **Binary Data Persistence:** The raw video file is written to the designated storage backend (HDD or AWS S3) via the `file-service`.

4. Operational Workflow: Video Consumption (Playback)

The delivery layer coordinates multiple microservices to ensure secure and efficient video playback:

1. **Identity Validation:** The user's credentials are authenticated via the `auth-service` to authorize the session.

2. **Metadata Retrieval:** The system fetches the list of available videos and their physical location pointers from the MySQL DB Service.

3. **Binary Retrieval:** The `file-service` reads the raw video file from the physical storage backend based on the retrieved pointer.

4. **Interface Delivery:** The binary stream is delivered to the `streaming-app` for user viewing.

5. Deployment and Containerization Strategy

The system utilizes Docker for service orchestration, as defined in the `dockerfile` and `docker-compose.yml` configurations. This container-centric approach is vital for managing the system's polyglot nature.

• **Service Isolation:** Docker ensures that Go-based backend services (like the `file-service`) and TypeScript-based web applications (like the `streaming-app`) coexist within the same host environment without runtime dependency conflicts.

• **Modular Scalability:** The multi-service folder structure allows individual components of the ingestion or delivery layers to be updated or scaled independently.

• **Environmental Parity:** Containerization guarantees that the specific configurations for the MySQL database and the various microservices remain consistent across development and production environments.

7. Conclusion

The ACIT-3495 architecture represents a modular streaming environment where TypeScript and Go services collaborate through a decoupled microservices design. By abstracting file storage and centralizing metadata management within a dedicated MySQL service, the system provides a robust framework for managing the complete video lifecycle, from ingestion to secure delivery.