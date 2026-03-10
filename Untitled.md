```
sudo docker run -d -p 8081:8081 --restart always --name nexus -v /home/azureuser/nexus-data:/nexus-data -e NEXUS_CONTEXT=nexus sonatype/nexus3

<repositories>
    <repository>
        <id>maven-group</id>
        <url>https://apache-acit4850-group17.westus3.cloudapp.azure.com/nexus/repository/maven-group/</url>
        <releases>
            <enabled>true</enabled>
        </releases>
        <snapshots>
            <enabled>true</enabled>
        </snapshots>
    </repository>
</repositories>

<distributionManagement>
    <snapshotRepository>
        <id>nexus-snapshots</id>
        <url>https://apache-acit4850-group17.westus3.cloudapp.azure.com/nexus/repository/maven-snapshots/</url>
    </snapshotRepository>
    <repository>
        <id>nexus-releases</id>
        <url>https://apache-acit4850-group17.westus3.cloudapp.azure.com/nexus/repository/maven-releases/</url>
    </repository>
</distributionManagement>


stage('Deploy') {  
	steps {  
		sh 'mvn -B -DskipTests -s settings.xml clean deploy'  
	}  
}
```