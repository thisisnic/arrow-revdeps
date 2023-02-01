# Changes

# Check Summary

## CRAN

```
# A tibble: 32 x 5
   label pkg               notes     warnings  errors   
   <chr> <chr>             <list>    <list>    <list>   
 1 CRAN  analogsea         <chr [0]> <chr [0]> <chr [0]>
 2 CRAN  arkdb             <chr [0]> <chr [0]> <chr [0]>
 3 CRAN  CDMConnector      <chr [0]> <chr [0]> <chr [0]>
 4 CRAN  ClickHouseHTTP    <chr [0]> <chr [0]> <chr [0]>
 5 CRAN  dataversionr      <chr [0]> <chr [0]> <chr [0]>
 6 CRAN  diffdfs           <chr [0]> <chr [0]> <chr [0]>
 7 CRAN  disk.frame        <chr [0]> <chr [0]> <chr [1]>
 8 CRAN  duckdb            <chr [1]> <chr [0]> <chr [0]>
 9 CRAN  fastverse         <chr [1]> <chr [0]> <chr [0]>
10 CRAN  gbifdb            <chr [0]> <chr [0]> <chr [0]>
11 CRAN  MolgenisArmadillo <chr [0]> <chr [0]> <chr [0]>
12 CRAN  mrgsim.parallel   <chr [0]> <chr [0]> <chr [0]>
13 CRAN  nflreadr          <chr [0]> <chr [0]> <chr [0]>
14 CRAN  noctua            <chr [0]> <chr [0]> <chr [0]>
15 CRAN  opencpu           <NULL>    <NULL>    <NULL>   
16 CRAN  parqr             <chr [0]> <chr [0]> <chr [0]>
17 CRAN  parquetize        <chr [1]> <chr [0]> <chr [0]>
18 CRAN  pins              <chr [0]> <chr [0]> <chr [0]>
19 CRAN  plumber           <chr [0]> <chr [0]> <chr [0]>
20 CRAN  pointblank        <chr [1]> <chr [0]> <chr [0]>
21 CRAN  RAthena           <chr [0]> <chr [0]> <chr [0]>
22 CRAN  raveio            <chr [0]> <chr [0]> <chr [0]>
23 CRAN  receptiviti       <chr [0]> <chr [0]> <chr [1]>
24 CRAN  rio               <chr [0]> <chr [0]> <chr [0]>
25 CRAN  sfarrow           <chr [0]> <chr [0]> <chr [0]>
26 CRAN  sparklyr          <chr [1]> <chr [0]> <chr [0]>
27 CRAN  starvz            <chr [0]> <chr [0]> <chr [0]>
28 CRAN  strand            <chr [1]> <chr [0]> <chr [0]>
29 CRAN  targets           <chr [0]> <chr [0]> <chr [0]>
30 CRAN  tidyquery         <chr [0]> <chr [0]> <chr [0]>
31 CRAN  tradestatistics   <chr [0]> <chr [0]> <chr [0]>
32 CRAN  vetiver           <chr [0]> <chr [0]> <chr [0]>
```

## Local

```
# A tibble: 32 x 5
   label pkg               notes     warnings  errors   
   <chr> <chr>             <list>    <list>    <list>   
 1 local analogsea         <chr [0]> <chr [0]> <chr [0]>
 2 local arkdb             <chr [0]> <chr [0]> <chr [0]>
 3 local CDMConnector      <chr [0]> <chr [0]> <chr [0]>
 4 local ClickHouseHTTP    <chr [0]> <chr [0]> <chr [0]>
 5 local dataversionr      <chr [0]> <chr [0]> <chr [0]>
 6 local diffdfs           <chr [0]> <chr [0]> <chr [0]>
 7 local disk.frame        <chr [0]> <chr [0]> <chr [1]>
 8 local duckdb            <chr [1]> <chr [0]> <chr [0]>
 9 local fastverse         <chr [1]> <chr [0]> <chr [0]>
10 local gbifdb            <chr [0]> <chr [0]> <chr [0]>
11 local MolgenisArmadillo <chr [0]> <chr [0]> <chr [0]>
12 local mrgsim.parallel   <chr [0]> <chr [0]> <chr [0]>
13 local nflreadr          <chr [0]> <chr [0]> <chr [0]>
14 local noctua            <chr [0]> <chr [0]> <chr [0]>
15 local opencpu           <NULL>    <NULL>    <NULL>   
16 local parqr             <chr [0]> <chr [0]> <chr [0]>
17 local parquetize        <chr [1]> <chr [0]> <chr [0]>
18 local pins              <chr [0]> <chr [0]> <chr [0]>
19 local plumber           <chr [0]> <chr [0]> <chr [0]>
20 local pointblank        <chr [1]> <chr [0]> <chr [0]>
21 local RAthena           <chr [0]> <chr [0]> <chr [0]>
22 local raveio            <chr [0]> <chr [0]> <chr [0]>
23 local receptiviti       <chr [0]> <chr [0]> <chr [1]>
24 local rio               <chr [0]> <chr [0]> <chr [0]>
25 local sfarrow           <chr [0]> <chr [0]> <chr [0]>
26 local sparklyr          <chr [1]> <chr [0]> <chr [0]>
27 local starvz            <chr [0]> <chr [0]> <chr [0]>
28 local strand            <chr [1]> <chr [0]> <chr [0]>
29 local targets           <chr [0]> <chr [0]> <chr [0]>
30 local tidyquery         <chr [0]> <chr [0]> <chr [0]>
31 local tradestatistics   <chr [0]> <chr [0]> <chr [0]>
32 local vetiver           <chr [0]> <chr [0]> <chr [0]>
```

# All notes and errors

## disk.frame

```
-- R CMD check results ----------------------------------- disk.frame 0.7.2 ----
Duration: 51.9s

> checking examples ... ERROR
  Running examples in ‘disk.frame-Ex.R’ failed
  The error most likely occurred in:
  
  > ### Name: anti_join.disk.frame
  > ### Title: Performs join/merge for disk.frames
  > ### Aliases: anti_join.disk.frame full_join.disk.frame
  > ###   inner_join.disk.frame left_join.disk.frame semi_join.disk.frame
  > 
  > ### ** Examples
  > 
  > df.df = as.disk.frame(data.frame(x = 1:3, y = 4:6), overwrite = TRUE)
  > df2.df = as.disk.frame(data.frame(x = 1:2, z = 10:11), overwrite = TRUE)
  > 
  > anti_joined.df = anti_join(df.df, df2.df) 
  Warning in anti_join.disk.frame(df.df, df2.df) :
    merge_by_chunk_id = FALSE. This will take significantly longer and the preparations needed are performed eagerly which may lead to poor performance. Consider making y a data.frame or set merge_by_chunk_id = TRUE for better performance.
  Appending disk.frames: 
  Appending disk.frames: 
  Error in anti_join(.x, .y, by = by, copy = copy, ..., overwrite = overwrite) : 
    `...` must be empty.
  ✖ Problematic arguments:
  • ..1 = xch
  • ..2 = ych
  • overwrite = overwrite
  ℹ Did you forget to name an argument?
  Calls: anti_join ... resolve.list -> signalConditionsASAP -> signalConditions
  Execution halted

1 error x | 0 warnings v | 0 notes v


```

## receptiviti

```
-- R CMD check results ---------------------------------- receptiviti 0.1.3 ----
Duration: 24.4s

> checking tests ...
  See below...

-- Test failures ------------------------------------------------- testthat ----

> library(testthat)
> library(receptiviti)
> 
> test_check("receptiviti")
[ FAIL 1 | WARN 0 | SKIP 2 | PASS 12 ]

══ Skipped tests ═══════════════════════════════════════════════════════════════
• no API key (2)

══ Failed tests ════════════════════════════════════════════════════════════════
── Error ('test-receptiviti_status.R:4'): failures works ───────────────────────
Error in `curl_fetch_memory(url, handler)`: Could not resolve host: example.com
Backtrace:
    ▆
 1. ├─testthat::expect_identical(...) at test-receptiviti_status.R:4:2
 2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
 3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
 4. ├─utils::capture.output(...)
 5. │ └─base::withVisible(...elt(i))
 6. └─receptiviti::receptiviti_status("example.com", key = 123, secret = 123)
 7.   └─curl::curl_fetch_memory(url, handler)

[ FAIL 1 | WARN 0 | SKIP 2 | PASS 12 ]
Error: Test failures
Execution halted

1 error x | 0 warnings v | 0 notes v


```

## duckdb

```
-- R CMD check results --------------------------------------- duckdb 0.6.2 ----
Duration: 2m 37.1s

> checking installed package size ... NOTE
    installed size is 32.5Mb
    sub-directories of 1Mb or more:
      libs  31.9Mb

0 errors v | 0 warnings v | 1 note x


```

## fastverse

```
-- R CMD check results ------------------------------------ fastverse 0.3.1 ----
Duration: 31.1s

> checking dependencies in R code ... NOTE
  Namespaces in Imports field not imported from:
    ‘collapse’ ‘data.table’ ‘kit’ ‘magrittr’
    All declared Imports should be used.

0 errors v | 0 warnings v | 1 note x


```

## parquetize

```
-- R CMD check results ----------------------------------- parquetize 0.5.1 ----
Duration: 1m 0.5s

> checking dependencies in R code ... NOTE
  Namespace in Imports field not imported from: ‘dplyr’
    All declared Imports should be used.

0 errors v | 0 warnings v | 1 note x


```

## pointblank

```
-- R CMD check results ---------------------------------- pointblank 0.11.2 ----
Duration: 1m 10.6s

> checking data for non-ASCII characters ... NOTE
    Note: found 1 marked UTF-8 string

0 errors v | 0 warnings v | 1 note x


```

## sparklyr

```
-- R CMD check results ------------------------------------- sparklyr 1.7.9 ----
Duration: 1m 20.5s

> checking installed package size ... NOTE
    installed size is  6.8Mb
    sub-directories of 1Mb or more:
      R      2.1Mb
      java   3.4Mb

0 errors v | 0 warnings v | 1 note x


```

## strand

```
-- R CMD check results --------------------------------------- strand 0.2.0 ----
Duration: 2m 57.9s

> checking data for non-ASCII characters ... NOTE
    Note: found 1 marked UTF-8 string

0 errors v | 0 warnings v | 1 note x


```

