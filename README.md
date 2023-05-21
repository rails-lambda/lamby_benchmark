# LambyBenchmark

Simple benchmarks testing latest AWS Lambda Ruby 3.2 image. This test makes use of the various techniques. It is not an AWS Ruby 2.7 to 3.2. Did not have time for that.

- https://lamby.cloud/docs/cold-starts
- https://github.com/theam/aws-lambda-benchmark

Each test using Artillery via the `benchmark/run` script generated ~150 cold starts.

```java
fields @initDuration
| filter ispresent(@initDuration)
| stats pct(@initDuration, 5) as p5,
        pct(@initDuration, 50) as p50,
        pct(@initDuration, 95) as p95,
        pct(@initDuration, 99) as p99
  by bin(5m)
```

### FROM ruby:3.2-bullseye (380MB)

```
| percentile | data      |
| ---------- | --------- |
| p5         | 2502.6066 |
| p50        | 2972.0349 |
| p95        | 3391.1901 |
| p99        | 3511.9219 |
```

### FROM public.ecr.aws/lambda/ruby:3.2 (390MB)

```
| percentile | data      |
| ---------- | --------- |
| p5         | 2287.3131 |
| p50        | 2638.7527 |
| p95        | 3041.1490 |
| p99        | 3184.2361 |
```

### FROM public.ecr.aws/lambda/ruby:2.7 (370MB)

```
| percentile | data      |
| ---------- | --------- |
| p5         | 2260.0429 |
| p50        | 2591.7034 |
| p95        | 2939.5379 |
| p99        | 3216.2221 |
```
