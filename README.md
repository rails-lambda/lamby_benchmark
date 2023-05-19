# LambyBenchmark

- https://lamby.cloud/docs/cold-starts
- https://github.com/theam/aws-lambda-benchmark

```java
fields @initDuration
| filter ispresent(@initDuration)
| stats pct(@initDuration, 5) as p5,
        pct(@initDuration, 50) as p50,
        pct(@initDuration, 95) as p95,
        pct(@initDuration, 99) as p99
  by bin(5m)
```

```
bin(5m)	
2023-05-19 01:35:00.000
p5	2502.6066
p50	2972.0349
p95	3391.1901
p99	3511.9219
```
