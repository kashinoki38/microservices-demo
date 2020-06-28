## container image list

```bash
$ k images
[Summary]: 1 namespaces, 14 pods, 43 containers and 15 different images
+------------------------------+-------------------+--------------------------------------+
|           PodName            |   ContainerName   |            ContainerImage            |
+------------------------------+-------------------+--------------------------------------+
| carts-77bf98444c-r79zj       | carts             | weaveworksdemos/carts:0.4.8          |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| carts-db-6ffbb968d6-28lwm    | carts-db          | mongo                                |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| catalogue-57b8556478-mcbkt   | catalogue         | weaveworksdemos/catalogue:0.3.5      |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| catalogue-db-945c74ccf-nnkjs | catalogue-db      | weaveworksdemos/catalogue-db:0.3.0   |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| front-end-5d5f5c6c8-dtcx5    | front-end         | weaveworksdemos/front-end:0.3.12     |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| orders-7ddfccdcfb-869tl      | orders            | weaveworksdemos/orders:0.4.7         |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| orders-db-85cbc88cd-qdklt    | orders-db         | mongo                                |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| payment-5bb59c674c-v9mmj     | payment           | weaveworksdemos/payment:0.4.3        |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| queue-master-ddf6457bb-jnhsn | queue-master      | weaveworksdemos/queue-master:0.3.1   |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| rabbitmq-6b8c78979c-q4mtv    | rabbitmq          | rabbitmq:3.6.8-management            |
+                              +-------------------+--------------------------------------+
|                              | rabbitmq-exporter | kbudde/rabbitmq-exporter             |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| session-db-868bf6964c-hgxz2  | session-db        | redis:alpine                         |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| shipping-774579578-5zll4     | shipping          | weaveworksdemos/shipping:0.4.8       |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| user-58bcfcc885-8fm8t        | user              | weaveworksdemos/user:0.4.7           |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
| user-db-6d6547fbbd-vxg7c     | user-db           | weaveworksdemos/user-db:0.3.0        |
+                              +-------------------+--------------------------------------+
|                              | istio-proxy       | gke.gcr.io/istio/proxyv2:1.4.6-gke.0 |
+                              +-------------------+                                      +
|                              | (init) istio-init |                                      |
+------------------------------+-------------------+--------------------------------------+
```

## catalogue-db

### MySQL

```sql
mysql> show tables;
+-------------------+
| Tables_in_socksdb |
+-------------------+
| sock              |
| sock_tag          |
| tag               |
+-------------------+

mysql> desc sock;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| sock_id     | varchar(40)  | NO   | PRI | NULL    |       |
| name        | varchar(20)  | YES  |     | NULL    |       |
| description | varchar(200) | YES  |     | NULL    |       |
| price       | float        | YES  |     | NULL    |       |
| count       | int(11)      | YES  |     | NULL    |       |
| image_url_1 | varchar(40)  | YES  |     | NULL    |       |
| image_url_2 | varchar(40)  | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+

mysql> desc sock_tag;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| sock_id | varchar(40)  | YES  | MUL | NULL    |       |
| tag_id  | mediumint(9) | NO   | MUL | NULL    |       |
+---------+--------------+------+-----+---------+-------+

mysql> desc tag;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| tag_id | mediumint(9) | NO   | PRI | NULL    | auto_increment |
| name   | varchar(20)  | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
```

```sql
mysql> select sock_id,count,name from sock;
+--------------------------------------+-------+---------------+
| sock_id                              | count | name          |
+--------------------------------------+-------+---------------+
| 03fef6ac-1896-4ce8-bd69-b798f85c6e0b |     1 | Holy          |
| 3395a43e-2d88-40de-b95f-e00e1502085b |   438 | Colourful     |
| 510a0d7e-8e83-4193-b483-e27e09ddc34d |   820 | SuperSport XL |
| 808a2de1-1aaa-4c25-a9b9-6612e8f29a38 |   738 | Crossed       |
| 819e1fbf-8b7e-4f6d-811f-693534916a8b |   808 | Figueroa      |
| 837ab141-399e-4c1f-9abc-bace40296bac |   175 | Cat socks     |
| a0a4f044-b040-410d-8ead-4de0446aec7e |   115 | Nerd leg      |
| d3588630-ad8e-49df-bbd7-3167f7efb246 |   801 | YouTube.sock  |
| zzz4f044-b040-410d-8ead-4de0446aec7e |   127 | Classic       |
+--------------------------------------+-------+---------------+

mysql> select sock.sock_id,sock.count,sock.name, tag.name from sock inner join sock_tag on sock.sock_id = sock_tag.sock_id inner join tag on sock_tag.tag_id = tag.tag_id order by tag.name;
+--------------------------------------+-------+---------------+--------+
| sock_id                              | count | name          | name   |
+--------------------------------------+-------+---------------+--------+
| 03fef6ac-1896-4ce8-bd69-b798f85c6e0b |     1 | Holy          | action |
| 808a2de1-1aaa-4c25-a9b9-6612e8f29a38 |   738 | Crossed       | action |
| 510a0d7e-8e83-4193-b483-e27e09ddc34d |   820 | SuperSport XL | black  |
| 819e1fbf-8b7e-4f6d-811f-693534916a8b |   808 | Figueroa      | blue   |
| 808a2de1-1aaa-4c25-a9b9-6612e8f29a38 |   738 | Crossed       | blue   |
| a0a4f044-b040-410d-8ead-4de0446aec7e |   115 | Nerd leg      | blue   |
| 3395a43e-2d88-40de-b95f-e00e1502085b |   438 | Colourful     | blue   |
| 3395a43e-2d88-40de-b95f-e00e1502085b |   438 | Colourful     | brown  |
| zzz4f044-b040-410d-8ead-4de0446aec7e |   127 | Classic       | brown  |
| 837ab141-399e-4c1f-9abc-bace40296bac |   175 | Cat socks     | brown  |
| 808a2de1-1aaa-4c25-a9b9-6612e8f29a38 |   738 | Crossed       | formal |
| 819e1fbf-8b7e-4f6d-811f-693534916a8b |   808 | Figueroa      | formal |
| 510a0d7e-8e83-4193-b483-e27e09ddc34d |   820 | SuperSport XL | formal |
| 837ab141-399e-4c1f-9abc-bace40296bac |   175 | Cat socks     | formal |
| d3588630-ad8e-49df-bbd7-3167f7efb246 |   801 | YouTube.sock  | formal |
| d3588630-ad8e-49df-bbd7-3167f7efb246 |   801 | YouTube.sock  | geek   |
| 837ab141-399e-4c1f-9abc-bace40296bac |   175 | Cat socks     | green  |
| 819e1fbf-8b7e-4f6d-811f-693534916a8b |   808 | Figueroa      | green  |
| zzz4f044-b040-410d-8ead-4de0446aec7e |   127 | Classic       | green  |
| 03fef6ac-1896-4ce8-bd69-b798f85c6e0b |     1 | Holy          | magic  |
| 808a2de1-1aaa-4c25-a9b9-6612e8f29a38 |   738 | Crossed       | red    |
| a0a4f044-b040-410d-8ead-4de0446aec7e |   115 | Nerd leg      | skin   |
| 510a0d7e-8e83-4193-b483-e27e09ddc34d |   820 | SuperSport XL | sport  |
+--------------------------------------+-------+---------------+--------+

```
