Ruby HTTP client memory profile/benchmark

# Results
## Typhoeus

```
Total allocated: 1404635 bytes (16508 objects)
Total retained:  18152 bytes (321 objects)

allocated memory by gem
-----------------------------------
    864496  ethon-0.12.0
    298851  ffi-1.13.1
    206536  typhoeus-1.4.0
     34752  other

retained memory by gem
-----------------------------------
     13056  ethon-0.12.0
      2480  ffi-1.13.1
      2304  typhoeus-1.4.0
       312  other
```

## Http.rb
```
Total allocated: 135638 bytes (1398 objects)
Total retained:  418 bytes (5 objects)

allocated memory by gem
-----------------------------------
     71173  http-4.4.1
     53564  addressable-2.7.0
      6707  http-parser-1.2.1
      2642  connection_pool-2.2.3
      1040  ffi-1.13.1
       432  other
        80  forwardable

retained memory by gem
-----------------------------------
       418  connection_pool-2.2.3
```
