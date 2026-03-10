```
sudo docker run -d -p 8081:8081 --restart always --name nexus -v /home/azureuser:/nexus-data -e NEXUS_CONTEXT=nexus sonatype/nexus3
```