# Design Description : 

- JSON data from different Iot RMQ instance are pushed into AWS RMQ usign RMQ shovel.
- lamba to consume data from rabbitmq to elasticsearch
- same or different lambda to consume data from rabbit mq and publish to s3 in csv or parquate format.
- With s3 usage, provides capacity for scalability and increased storage capacity.
- enable Index life cycle management policy in ES for archiving.
- AWS Glue/Athena to enable SQL based query of the data in s3.
- Data science team would write custom script in python to query database. 
