## Table of Contents

1. [IAM & AWS CLI](#1-iam--aws-cli)

2. [EC2](#2-ec2)

3. [EC2 Storage](#3-ec2-storage)

4. [High Availability & Scalability](#4-high-availability--scalability)

5. [RDS, Aurora & ElastiCache](#5-rds-aurora--elasticache)

6. [Route 53](#6-route-53)

7. [S3](#7-s3)

8. [CloudFront](#8-cloudfront)

9. [AWS Global Accelerator](#9-aws-global-accelerator)

10. [Decoupling Applications](#10-decoupling-applications-sqs-sns-kinesis)

11. [Serverless](#11-serverless)

12. [Databases](#12-databases)

13. [Monitoring & Analytics](#13-monitoring--analytics)

14. [VPC & Networking](#14-vpc--networking)

15. [Security & Encryption](#15-security--encryption)

  

---

  

## 1. IAM & AWS CLI

  

### IAM (Identity and Access Management)

- **Global service** - applies to all regions

- **Root account** - never use for daily work, enable MFA

- **Users** - physical people, can belong to groups

- **Groups** - containers for users with similar permissions

- **Roles** - for AWS services or cross-account access

- **Policies** - JSON documents defining permissions

  

### IAM Policy Structure

```json

{

  "Version": "2012-10-17",

  "Statement": [

    {

      "Effect": "Allow|Deny",

      "Action": ["ec2:Describe*"],

      "Resource": "*",

      "Condition": {

        "IpAddress": {"aws:SourceIp": "10.0.0.0/8"}

      }

    }

  ]

}

```

  

### IAM Best Practices

- **Least privilege** - give minimum permissions needed

- **Use IAM roles** for EC2, Lambda, etc.

- **Enable MFA** for root and IAM users

- **Use access keys** for CLI, secret keys for SDK

- **Never share credentials**

- **Rotate credentials** regularly

- **Use IAM Permission Boundaries** to limit max permissions

  

### AWS CLI

```bash

# Configure CLI

aws configure

aws configure set region us-west-2

  

# IAM commands

aws iam list-users

aws iam create-user --user-name Name

aws iam attach-user-policy --user-name Name --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

  

# STS (Security Token Service)

aws sts get-caller-identity

```

  

### AWS Organizations

- **OU (Organizational Unit)** - group accounts

- **SCP (Service Control Policy)** - restrict account permissions

- **CSS (CloudWatch Logs)** - cross-account logging

  

---

  

## 2. EC2

  

### EC2 Fundamentals

- **EC2** = Elastic Compute Cloud

- **On-Demand** - pay per hour/second, no commitment

- **Reserved** - 1-3 year commitment, up to 72% discount

  - Standard Reserved - specific instance type

  - Convertible Reserved - can change instance type

  - Scheduled Reserved - for recurring schedules

- **Spot** - up to 90% discount, can be terminated anytime

  - Spot Block - runs for 1-6 hours without interruption

  - Spot Fleet - set of Spot instances + optional On-Demand

- **Dedicated Hosts** - physical server, bring your own license

- **Dedicated Instances** - hardware dedicated to your account

  

### EC2 Instance Types

| Family  | Purpose                    | Examples             |
| ------- | -------------------------- | -------------------- |
| **t**   | General purpose            | t3.micro, t3.medium  |
| **m**   | General purpose (bigger)   | m5.large, m5.xlarge  |
| **c**   | Compute optimized          | c5.large, c5n.large  |
| **r**   | Memory optimized           | r5.large, r5.xlarge  |
| **i**   | Storage optimized          | i3.large, i3en.large |
| **g**   | GPU optimized              | g4dn.xlarge          |
| **p**   | GPU (general purpose)      | p3.2xlarge           |
| **hpc** | High performance computing | hpc6a.32xlarge       |

  

### EC2 Storage

- **Instance Store** - ephemeral, attached to host

- **EBS (Elastic Block Store)** - persistent network storage

  - gp2/gp3 (SSD) - general purpose

  - io1/io2 (SSD) - high performance

  - st1 (HDD) - throughput optimized

  - sc1 (HDD) - cold storage

- **EBS Snapshots** - backup EBS volumes

  

### EC2 Networking

- **ENI (Elastic Network Interface)** - virtual network card

- **Security Groups** - stateful firewall

  - Only Allow rules (no deny rules)

  - Reference by security group ID or CIDR

- **Public IP** - changes on stop/start

- **Elastic IP** - persistent IP address (cost if unused)

  

### EC2 User Data

```bash

#!/bin/bash

yum update -y

yum install -y httpd

systemctl start httpd

systemctl enable httpd

echo "<h1>Hello from EC2</h1>" > /var/www/html/index.html

```

  

### EC2 Placement Groups

- **Cluster** - same AZ, low latency, high throughput

- **Partition** - spread across partitions (hardware racks)

- **Spread** - across distinct hardware, max 7 instances per AZ

  

---

  

## 3. EC2 Storage

  

### EBS (Elastic Block Store)

- **gp3** - 3000 IOPS base, 125 MB/s, scalable

- **gp2** - 3 IOPS/GB, max 16000 IOPS

- **io2 Block Express** - 256000 IOPS, 64 TB

- **io1/io2** - 64000 IOPS (io1), 256000 IOPS (io2)

- **st1** - max 500 IOPS, 500 MB/s, 125 GB min

- **sc1** - max 250 IOPS, 250 MB/s, 125 GB min

  

### EBS vs Instance Store

| Feature                      | EBS                                | Instance Store        |
| ---------------------------- | ---------------------------------- | --------------------- |
| Persistence                  | Yes (separate from instance)       | No (tied to instance) |
| Data retained on termination | Yes (if DeleteOnTermination=false) | No                    |
| Performance                  | Network attached                   | Local (faster)        |
| Snapshots                    | Yes                                | No                    |
| Resize                       | Easy                               | N/A                   |

  

### EFS (Elastic File System)

- **NFSv4** protocol

- **Multi-AZ** - scales automatically

- **Pay per use** (no capacity planning)

- **EFS-IA** - Infrequent Access (cost optimization)

- **EFS One Zone** - single AZ, cheaper

- Compatible with Linux only

  

### FSx

- **FSx for Windows** - SMB, Windows File Server

- **FSx for Lustre** - HPC, parallel file system

- **FSx for NetApp ONTAP** - NFS, SMB, iSCSI

- **FSx for OpenZFS** - ZFS-based file system

  

### Storage Gateway

- **File Gateway** - S3 as file storage

- **Volume Gateway** - block storage (iSCSI)

- **Tape Gateway** - virtual tape library

  

---

  

## 4. High Availability & Scalability

  

### ELB (Elastic Load Balancer)

- **Application Load Balancer (ALB)**

  - Layer 7 (HTTP/HTTPS)

  - Host-based, path-based routing

  - Target groups

  - WebSocket support

- **Network Load Balancer (NLB)**

  - Layer 4 (TCP/UDP)

  - Ultra-low latency

  - Static IP

- **Gateway Load Balancer**

  - Deploy firewall, intrusion detection

  - GENEVE protocol on port 6081

  

### ELB Features

- **Health Checks** - ping path, port, protocol

- **Cross-Zone Load Balancing** - enabled by default (ALB), disabled by default (NLB)

- **SSL Certificates** - managed via ACM

- **Sticky Sessions** - route same client to same target

- **Deregistration Delay** - in-flight requests complete

- **Connection Draining** - same as deregistration delay

  

### ASG (Auto Scaling Group)

- **Launch Template** - defines what to launch

- **Scaling Policies**

  - Target Tracking - e.g., CPU at 70%

  - Simple Scaling - based on CloudWatch alarm

  - Step Scaling - graduated response

  - Scheduled Scaling - time-based

- **Metrics** - CPU, Network In/Out, Request Count

- **Lifecycle Hooks** - actions at launch/terminate

- **Warm Pool** - pre-launch instances

  

### ASG Best Practices

- **Multiple AZ** - for high availability

- **ELB health checks** - use for better detection

- **Cooldown period** - default 300 seconds

- **Scaling processes** - Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance

  

---

  

## 5. RDS, Aurora & ElastiCache

  

### RDS (Relational Database Service)

- **Supported engines**: MySQL, PostgreSQL, MariaDB, Oracle, SQL Server

- **Features**:

  - Multi-AZ (automatic failover)

  - Read Replicas (async replication)

  - Automated backups (1-35 days)

  - Manual snapshots

  - Encryption at rest (KMS)

  - IAM authentication

  - Parameter groups

  - Option groups

  

### RDS Multi-AZ

- **Synchronous replication** to standby

- **Automatic failover** (< 60 seconds)

- **Same region** (different AZ)

- **One DNS endpoint** - automatic failover

  

### Read Replicas

- **Asynchronous replication**

- **Up to 5 read replicas**

- **Cross-region replication** supported

- **Can be promoted to standalone**

- **Use for read scaling, not HA**

  

### Aurora

- **MySQL/PostgreSQL compatible**

- **Storage**: 6 copies across 3 AZs (each 10GB)

- **Serverless**: pay per second

- **Global Database**: cross-region replication

- **Multi-Master**: write to multiple AZs

- **Backtrack**: restore to point in time

- **Auto scaling** storage (10GB-128TB)

  

### ElastiCache

- **Redis** - advanced, pub/sub, sorted sets, persistence

- **Memcached** - simple, distributed memory object caching

- **Patterns**:

  - Lazy loading - read-through cache

  - Write-through - cache on write

- **Redis Cluster** - automatic sharding

- **Memcached** - multi-node partitioning

  

---

  

## 6. Route 53

  

### DNS Fundamentals

- **A Record** - domain to IPv4

- **AAAA Record** - domain to IPv6

- **CNAME** - domain to domain (can't use for apex)

- **Alias** - AWS-specific (can use for apex)

- **MX Record** - mail servers

- **TXT Record** - SPF, verification

- **PTR Record** - reverse DNS

  

### Routing Policies

- **Simple** - single record, random if multiple

- **Weighted** - percentage-based routing

- **Latency** - lowest latency endpoint

- **Failover** - primary/secondary (active-passive)

- **Geolocation** - location-based

- **Geoproximity** - bias-based (traffic flow)

- **Multi-Value** - health checks, return multiple

  

### Health Checks

- **HTTP/HTTPS/TCP** checks

- **30 seconds** default (10 seconds fast)

- **Endpoint**, **CloudWatch**, **calculated**

- **3 OK threshold** (default)

- **3 failure threshold** (default)

  

---

  

## 7. S3

  

### S3 Basics

- **Objects** - key (filename), value (data), version ID, metadata

- **Buckets** - globally unique names, region-specific

- **URL format**: https://bucket.s3.region.amazonaws.com/key

  

### S3 Storage Classes

| Class                    | Durability    | Availability | Use Case                |
| ------------------------ | ------------- | ------------ | ----------------------- |
| **Standard**             | 99.999999999% | 99.99%       | Frequent access         |
| **IA**                   | 99.999999999% | 99.9%        | Infrequent access       |
| **One Zone-IA**          | 99.999999999% | 99.5%        | Non-critical            |
| **Glacier Instant**      | 99.999999999% | 99.9%        | Archive, < 90 days      |
| **Glacier Flexible**     | 99.999999999% | 99.99%       | Archive, 90+ days       |
| **Glacier Deep Archive** | 99.999999999% | 99.99%       | Long-term, 180+ days    |
| **Intelligent-Tiering**  | 99.999999999% | 99.9%        | Unknown access patterns |

  

### S3 Features

- **Versioning** - enabled at bucket level

- **Server-side encryption** - AES-256, KMS, SSE-C

- **Replication** - CRR (cross-region), SRR (same-region)

- **Lifecycle Rules** - transition between classes

- **Object Lock** - WORM (write once, read many)

- **Access Points** - dedicated access policies

- **Pre-signed URLs** - temporary access

  

### S3 Performance

- **Prefix** - split across prefixes for parallelism

- **Multipart upload** - > 100MB recommended

- **S3 Transfer Acceleration** - CloudFront edge

- **S3 Select** - filter at object level

- **S3 Batch Operations** - bulk operations

  

### S3 Security

- **Block Public Access** - account/bucket level

- **Bucket Policies** - JSON-based

- **IAM Policies** - user/role-based

- **ACLs** - legacy, less common

- **VPC Endpoint** - private access

- **Access Analyzer** - review cross-account access

  

---

  

## 8. CloudFront

  

### CloudFront Basics

- **CDN** - content delivery network

- **Edge Locations** - 450+ globally

- **Regional Edge Cache** - fewer than edge

- **Origins** - S3, ALB, custom HTTP

  

### CloudFront Features

- **SSL** - free via ACM or custom

- **Geo-restriction** - whitelist/blacklist countries

- **Signed URLs/Cookies** - private content

- **Field-level encryption** - sensitive data

- **Lambda@Edge** - customize at edge

- **Cache Invalidation** - remove cached content

  

### CloudFront vs S3 Cross-Region Replication

| Feature   | CloudFront       | CRR                   |
| --------- | ---------------- | --------------------- |
| Global    | Yes              | No (per-region)       |
| Files     | All in bucket    | Only designated       |
| Real-time | No (propagation) | Yes                   |
| Cost      | Pay per request  | Per request + storage |

  

---

  

## 9. AWS Global Accelerator

  

### Global Accelerator

- **AnyCast IP** - two IP addresses

- **Edge Locations** - 100+ locations

- **DDoS protection** - AWS Shield

- **Static IPs** - bring your own

- **Traffic Flow** - intelligent routing

  

### vs CloudFront

- **Global Accelerator** - TCP/UDP, static IP, DDoS

- **CloudFront** - HTTP/HTTPS, cache, geo-based

  

---

  

## 10. Decoupling Applications (SQS, SNS, Kinesis)

  

### SQS (Simple Queue Service)

- **Standard Queue** - unlimited TPS, at-least-once delivery

- **FIFO Queue** - exactly-once processing, 300 TPS limit

- **Message Retention** - 1 minute to 14 days (default 4 days)

- **Visibility Timeout** - default 30 seconds (max 12 hours)

- **Dead Letter Queue** - failed messages

- **Delay Queue** - postpone delivery

- **Long Polling** - reduce empty responses

- **Encryption** - at rest (KMS), in transit

  

### SNS (Simple Notification Service)

- **Pub/Sub** - publish to topic, subscribe receives

- **Push** - immediate delivery

- **Types**: Email, SMS, HTTP/S, SQS, Lambda, Platform Endpoint

- **FIFO Topic** - ordered delivery

- **Message Filtering** - filter by attributes

- **Encryption** - KMS at rest

  

### SQS vs SNS

| Feature     | SQS                | SNS               |
| ----------- | ------------------ | ----------------- |
| Delivery    | Pull               | Push              |
| Persistence | Yes (configurable) | No                |
| Consumers   | Multiple           | Multiple (fanout) |
| Processing  | Batch              | Real-time         |
| Order       | FIFO option        | FIFO option       |

  

### Kinesis

- **Data Streams** - real-time streaming, 1MB/record, 1000 records/put

- **Data Firehose** - load to S3/ES/Redshift/Splunk

- **Data Analytics** - SQL on streams

- **Video Streams** - camera feeds

  

---

  

## 11. Serverless

  

### Lambda

- **Languages**: Python, Node.js, Java, Go, C#, Ruby, PowerShell

- **Execution**: up to 15 minutes

- **Memory**: 128MB - 10GB

- **Concurrency**: 1000 (default), can burst

- **Cold Start**: ~500ms (provisioned concurrency)

- **Layers** - share code/dependencies

- **Environment Variables** - up to 4KB

- **VPC**: optional, adds cold start

- **Dead Letter Queue** - failed async invocations

- **Reserved Concurrency** - guarantee capacity

  

### Lambda@Edge

- **Trigger**: CloudFront events

- **Use Cases**: modify headers, redirects, auth, A/B testing

  

### DynamoDB

- **NoSQL** - key-value, document

- **Tables**: Primary key (partition key, optional sort key)

- **Partition Key**: determines data distribution

- **Capacity Modes**:

  - Provisioned - RCU/WCU

  - On-Demand - pay per request

- **DAX** - in-memory cache (< 1ms)

- **Streams** - change data capture

- **TTL** - auto-expire items

- **Global Tables** - multi-region, multi-master

- **Backup/Restore** - point-in-time recovery

  

### API Gateway

- **REST API** - RESTful

- **HTTP API** - lightweight (V2)

- **WebSocket API** - real-time (wss://)

- **Stages** - v1, v2, prod

- **Integration**: Lambda, HTTP, AWS Service, VPC Link

- **Caching** - default 300 seconds

- **Throttling**: 10000 req/s, burst limit

- **Custom Domain** - Route 53 + ACM

- **WAF Integration** - protect against attacks

  

### Cognito

- **User Pools** - sign up/sign in, managed UI

- **Identity Pools** - temporary AWS credentials

- **Cognito Streams** - Kinesis

- **Cognito Events** - Lambda triggers

  

---

  

## 12. Databases

  

### DynamoDB

- **Partition Key (PK)** - determines partition

- **Sort Key (SK)** - ordering within partition

- **GSI** - for different access patterns

- **LSI** - same partition, different sort

- **On-Demand**: 1M RCU/WCU burst

- **Provisioned**: RCU/WCU per second

- **DAX**: clustered, multi-node

  

### Aurora

- **Serverless**: auto scaling

- **Multi-Master**: write scaling

- **Global Database**: < 1 second replication

- **Backtrack**: restore to point in time

- **Auto Scaling**: storage (10GB-128TB)

  

### Redshift

- **OLAP** - analytics, data warehousing

- **Columnar storage** - compression

- **Massively Parallel (MPP)** - across nodes

- **RA3** - managed storage

- **Spectrum** - query S3 directly

- **Serverless** - pay per query

  

### Neptune

- **Graph database** - social, recommendations

- **Gremlin/SPARQL** - query languages

- **Multi-Master** - high write availability

  

### DocumentDB

- **MongoDB compatible**

- **Fully managed**

- **Storage**: 10GB-64TB

  

---

  

## 13. Monitoring & Analytics

  

### CloudWatch

- **Metrics** - collected every 5 minutes (1 minute detailed)

- **Unified Agent** - system-level metrics

- **Logs** - from EC2, Lambda, VPC Flow Logs

- **Log Insights** - query language

- **Anomaly Detection** - ML-based

- **Alarms** - threshold-based

- **Dashboards** - visualize metrics

  

### CloudWatch Metrics

- **EC2**: CPU, Network, Status Check

- **EBS**: Read/Write IOPS, throughput

- **S3**: BucketSizeBytes, NumberOfObjects

- **Lambda**: Invocations, Duration, Errors

- **RDS**: CPU, Connections, Storage

  

### CloudTrail

- **API Activity** - who did what, when

- **Events**: Management, Data, Insight

- **Log File Integrity** - validate logs

- **Region**: global (by default)

- **Organization**: trail for entire org

  

### X-Ray

- **Distributed Tracing**

- **Service Map** - visualize architecture

- **Traces** - request flow

- **Segments/Subsegments** - timing details

  

### AWS Config

- **Resource Inventory** - what you have

- **Compliance Tracking** - rules

- **Change History** - timeline

- **Remediation** - SSM Automation

  

---

  

## 14. VPC & Networking

  

### VPC Basics

- **CIDR Block**: 10.0.0.0/16 (max /16, min /28)

- **Subnet**: AZ-specific

- **Public Subnet**: has route to IGW

- **Private Subnet**: no direct internet

- **VPN-only Subnet**: has route to VPG

  

### VPC Components

- **Internet Gateway (IGW)** - internet access

- **NAT Gateway** - outbound internet (AZ-specific)

- **NAT Instance** - old way, self-managed

- **Egress-Only IGW** - IPv6 outbound

- **VPC Endpoints**:

  - Gateway (S3, DynamoDB) - free

  - Interface (other services) - \$\$\$

  

### Routing

- **Route Tables** - control traffic

- **Main Route Table** - default

- **Custom Route Tables** - for subnets

- **Propagate** - for VPN/Direct Connect

  

### Security

- **Security Groups** - stateful, instance-level

- **NACLs** - stateless, subnet-level

- **Flow Logs** - VPC/Subnet/ENI level

  

### VPC Peering

- **Cross-account/region**

- **No transitive peering**

- **Same IP ranges not allowed**

  

### Direct Connect

- **Dedicated connection** - 1/10/100 Gbps

- **Virtual Private Gateway** - attach to VPC

- **Transit Gateway** - connect multiple VPCs

  

### Transit Gateway

- **Hub-and-spoke** - simplify VPC connectivity

- **Cross-region** - connect VPCs globally

- **VPN Attachment** - on-prem connectivity

  

---

  

## 15. Security & Encryption

  

### Encryption

- **At Rest**: KMS, SSE

- **In Transit**: TLS/SSL, Certificate Manager

- **Key Types**:

  - Symmetric (AES-256)

  - Asymmetric (RSA, ECC)

  

### KMS (Key Management Service)

- **CMK** - Customer Master Key

- **Aliases** - friendly names

- **Key Policies** - who can use

- **Grants** - temporary permissions

- **Rotation** - automatic (yearly)

- **Multi-Region** - global keys

  

### Secrets Manager

- **Rotation** - built-in (RDS, etc.)

- **Automatic Secret Generation**

- **Integration** - Lambda, CloudFormation

  

### SSM Parameter Store

- **Plaintext/SecureString**

- **Hierarchy** - /prod/db/host

- **Versioning** - track changes

- **No rotation** - manual or Lambda

  

### IAM Best Practices (Review)

- Least privilege

- Use groups

- IAM Access Analyzer

- Password policy

- MFA everywhere

- Access keys rotation

  

### AWS Shield

- **Standard**: free, DDoS protection

- **Advanced**: $3k/month, more protection, WAF

  

### WAF (Web Application Firewall)

- **Rule Groups** - reusable

- **Web ACLs** - attach to CloudFront/ALB/API GW

- **Rules**: IP matching, geo, size, SQLi, XSS

  

---

  

## Exam Tips

  

### High-Value Topics (Most Likely to Be Tested)

1. **S3** - Storage classes, versioning, replication, security

2. **EC2** - Instance types, pricing, storage, security groups

3. **RDS/Aurora** - Multi-AZ, Read Replicas, backups

4. **VPC** - Subnets, NACLs, Security Groups, Endpoints

5. **IAM** - Policies, Roles, Best Practices

6. **Lambda** - Limits, VPC, Cold Starts

7. **ELB/ASG** - Health checks, scaling policies

  

### Common Trap Areas

- S3 durability vs availability

- Synchronous vs asynchronous replication

- Security Groups (stateful) vs NACLs (stateless)

- SQS (pull) vs SNS (push)

- On-Demand (pay per use) vs Reserved (commitment)

  

### Know These Numbers

- **S3**: 5TB/object, unlimited objects

- **Lambda**: 15 min timeout, 10GB memory

- **RDS**: 100DB per account

- **VPC**: /16 max, /28 min

- **EBS**: 16TB max volume

- **CloudFront**: 450+ edge locations

  

### Time Management

- 130 questions, 180 minutes

- ~1.5 minutes per question

- Flag difficult questions, come back

- Read carefully - "NOT", "EXCEPT" questions

  
