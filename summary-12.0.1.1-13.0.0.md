# Changes

## dataversionr

### With CRAN arrow

```
-- R CMD check results --------------------------------- dataversionr 0.9.0 ----
Duration: 2m 20.5s

0 errors v | 0 warnings v | 0 notes v

```

### With local arrow

```
-- R CMD check results --------------------------------- dataversionr 0.9.0 ----
Duration: 2m 28.9s

> checking tests ...
  See below...

-- Test failures ------------------------------------------------- testthat ----

> library(testthat)
> library(dataversionr)
> 
> test_check("dataversionr")

Attaching package: 'dplyr'

The following object is masked from 'package:testthat':

    matches

The following objects are masked from 'package:stats':

    filter, lag

The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union


Attaching package: 'tidyr'

The following object is masked from 'package:testthat':

    matches

Some features are not enabled in this build of Arrow. Run `arrow_info()` for more information.

Attaching package: 'arrow'

The following object is masked from 'package:testthat':

    matches

The following object is masked from 'package:utils':

    timestamp


Attaching package: 'lubridate'

The following object is masked from 'package:arrow':

    duration

The following objects are masked from 'package:base':

    date, intersect, setdiff, union

Committing diff to dataset...
Verifying diff can be retrieved from dataset...
A parquet file can be read from the target path...
Remote diff is identical to local diff.
Committing diff to dataset...
Verifying diff can be retrieved from dataset...
A parquet file can be read from the target path...
Remote diff is identical to local diff.
Checking that new_df can be diffed...
Diff test passed.
Checking that new_df can be diffed...
Diff test passed.
Checking that new_df can be diffed...
Checking that new_df can be diffed...
Diff test passed.
Checking that new_df can be diffed...
Diff test passed.
destination parameter is a string. Coercing to local FileSystem.
destination parameter is a string. Coercing to local FileSystem.
[ FAIL 6 | WARN 19 | SKIP 0 | PASS 43 ]

══ Failed tests ════════════════════════════════════════════════════════════════
── Failure ('test-backup_ops.R:27:13'): local get backup ───────────────────────
{
    ...
} (`actual`) not equal to `old_df` (`expected`).

`class(actual)`:   "tbl_df" "tbl" "data.frame"
`class(expected)`:                "data.frame"
── Failure ('test-backup_ops.R:161:13'): local read_dv_backup ──────────────────
{
    ...
} (`actual`) not equal to `old_df` (`expected`).

`class(actual)`:   "tbl_df" "tbl" "data.frame"
`class(expected)`:                "data.frame"
── Failure ('test-diff_ops.R:67:3'): local retrieve diff works ─────────────────
... %>% select(-diff_timestamp) (`actual`) not equal to `diff_df` (`expected`).

`class(actual)`:   "tbl_df" "tbl" "data.frame"
`class(expected)`:                "data.frame"
── Failure ('test-dv_ops.R:107:13'): local read_dv ─────────────────────────────
{
    ...
} (`actual`) not equal to `newer_df` (`expected`).

`class(actual)`:   "tbl_df" "tbl" "data.frame"
`class(expected)`:                "data.frame"
── Failure ('test-dv_ops.R:124:13'): local read_dv via backup ──────────────────
{
    ...
} (`actual`) not equal to new_df %>% select(sort(colnames(.))) (`expected`).

`class(actual)`:   "tbl_df" "tbl" "data.frame"
`class(expected)`:                "data.frame"
── Failure ('test-latest_ops.R:29:13'): local get latest ───────────────────────
{
    ...
} (`actual`) not equal to `new_df` (`expected`).

`class(actual)`:   "tbl_df" "tbl" "data.frame"
`class(expected)`:                "data.frame"

[ FAIL 6 | WARN 19 | SKIP 0 | PASS 43 ]
Error: Test failures
Execution halted

1 error x | 0 warnings v | 0 notes v


```

## gbifdb

### With CRAN arrow

```
-- R CMD check results --------------------------------------- gbifdb 0.1.2 ----
Duration: 15.3s

> checking tests ...
  See below...

-- Test failures ------------------------------------------------- testthat ----

> library(testthat)
> library(gbifdb)
> 
> test_check("gbifdb")
[ FAIL 0 | WARN 0 | SKIP 2 | PASS 9 ]

══ Skipped tests (2) ═══════════════════════════════════════════════════════════
• On CRAN (2): 'test_gbifdb.R:53:3', 'test_gbifdb.R:66:3'

[ FAIL 0 | WARN 0 | SKIP 2 | PASS 9 ]
> 
> proc.time()
   user  system elapsed 
  0.711   0.067   0.808 
Warning messages:
1: Connection is garbage-collected, use dbDisconnect() to avoid this. 
2: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
Error: bad value
Execution halted

1 error x | 0 warnings v | 0 notes v

```

### With local arrow

```
-- R CMD check results --------------------------------------- gbifdb 0.1.2 ----
Duration: 15.9s

0 errors v | 0 warnings v | 0 notes v


```

## nanoarrow

### With CRAN arrow

```
-- R CMD check results ---------------------------------- nanoarrow 0.2.0.1 ----
Duration: 18.7s

0 errors v | 0 warnings v | 0 notes v

```

### With local arrow

```
-- R CMD check results ---------------------------------- nanoarrow 0.2.0.1 ----
Duration: 19.4s

> checking Rd cross-references ... WARNING
  Missing link or links in documentation object 'as_nanoarrow_array.Rd':
    ‘[arrow:array]{arrow::Array}’ ‘[arrow:array]{arrow::StructArray}’
  
  See section 'Cross-references' in the 'Writing R Extensions' manual.

0 errors v | 1 warning x | 0 notes v


```

## pins

### With CRAN arrow

```
-- R CMD check results ----------------------------------------- pins 1.2.0 ----
Duration: 42.4s

0 errors v | 0 warnings v | 0 notes v

```

### With local arrow

```
-- R CMD check results ----------------------------------------- pins 1.2.0 ----
Duration: 43.1s

> checking tests ...
  See below...

-- Test failures ------------------------------------------------- testthat ----

> library(testthat)
> library(pins)
> 
> test_check("pins")
Guessing `type = 'rds'`
> <http://127.0.0.1:49432/data.txt> is not cacheable
> <http://127.0.0.1:49432/x.rds> is not cacheable
> <http://127.0.0.1:49436/x/20230724T142915Z-c3943/data.txt> is not cacheable
> <http://127.0.0.1:49436/x/20230724T142915Z-c3943/x.json> is not cacheable
> <http://127.0.0.1:49440/y/20230724T142915Z-cba09/data.txt> is not cacheable
> <http://127.0.0.1:49440/y/20230724T142915Z-5026d/data.txt> is not cacheable
[ FAIL 3 | WARN 0 | SKIP 66 | PASS 183 ]

══ Skipped tests (66) ══════════════════════════════════════════════════════════
• On CRAN (52): 'test-board_connect_bundle.R:36:3',
  'test-board_connect_bundle.R:41:3', 'test-board_connect_server.R:22:3',
  'test-board_connect_server.R:31:3', 'test-board_connect_server.R:51:3',
  'test-board_connect_server.R:60:3', ???, ???, 'test-board_folder.R:9:3',
  'test-board_folder.R:34:3', 'test-board_folder.R:42:3',
  'test-board_folder.R:88:3', 'test-board_url.R:54:3',
  'test-board_url.R:154:3', 'test-board_url.R:168:3', 'test-board_url.R:180:3',
  'test-board_url.R:199:3', 'test-board_url.R:218:3', 'test-board_url.R:237:3',
  'test-legacy_board.R:2:3', 'test-legacy_datatxt.R:4:3',
  'test-legacy_datatxt.R:16:3', 'test-legacy_datatxt.R:25:3',
  'test-legacy_datatxt.R:35:3', 'test-legacy_local.R:43:3',
  'test-legacy_packages.R:23:3', 'test-legacy_registry.R:30:3',
  'test-meta.R:13:3', 'test-meta.R:20:3', 'test-meta.R:24:3',
  'test-pin-delete.R:11:3', 'test-pin-meta.R:2:3',
  'test-pin-read-write.R:35:3', 'test-pin-read-write.R:41:3',
  'test-pin-read-write.R:58:3', 'test-pin-read-write.R:80:3',
  'test-pin-read-write.R:88:3', 'test-pin-upload-download.R:17:3',
  'test-pin-upload-download.R:46:3', 'test-pin-upload-download.R:61:3',
  'test-pin.R:76:3', 'test-pin.R:108:3', 'test-pin_info.R:5:3',
  'test-pin_info.R:23:3', 'test-pin_info.R:33:3', 'test-pin_search.R:27:3',
  'test-pin_versions.R:8:3', 'test-pin_versions.R:18:3',
  'test-pin_versions.R:26:3', 'test-pin_versions.R:41:3',
  'test-pin_versions.R:67:3', 'test-pin_versions.R:91:3'
• board_azure() tests require PINS_AZURE_KEY (3):
  'test-board_azure_adls2.R:1:1', 'test-board_azure_blob.R:1:1',
  'test-board_azure_file.R:1:1'
• board_connect() tests requires `creds.rds` (4): 'test-board_connect.R:2:1',
  'test-board_connect_url.R:4:3', 'test-board_connect_url.R:22:3',
  'test-board_connect_url.R:33:3'
• board_gcs() tests require PINS_GCS_PASSWORD (1): 'test-board_gcs.R:1:1'
• board_ms365() tests require PINS_MS365_TEST_DRIVE (1):
  'test-board_ms365.R:1:1'
• board_s3() tests require PINS_AWS_ACCESS_KEY, PINS_AWS_SECRET_ACCESS_KEY (1):
  'test-board_s3.R:1:1'
• legacy_azure() tests require TEST_AZURE_CONTAINER, TEST_AZURE_ACCOUNT,
  TEST_AZURE_KEY (1): 'test-legacy_azure.R:16:1'
• legacy_gcloud() tests require TEST_GOOGLE_BUCKET (1):
  'test-legacy_gcloud.R:12:1'
• legacy_github() tests require TEST_GITHUB_REPO, TEST_GITHUB_BRANCH (1):
  'test-legacy_github.R:1:1'
• legacy_s3() tests require TEST_AWS_BUCKET, TEST_AWS_KEY, TEST_AWS_SECRET,
  TEST_AWS_REGION (1): 'test-legacy_s3.R:14:1'

══ Failed tests ════════════════════════════════════════════════════════════════
── Failure ('test-pin-read-write.R:12:3'): can round trip all types ────────────
pin_read(board, "df-2") (`actual`) not equal to `df` (`expected`).

`class(actual)`:   "tbl_df" "tbl" "data.frame"
`class(expected)`:                "data.frame"
── Failure ('test-pin-read-write.R:15:3'): can round trip all types ────────────
pin_read(board, "df-2") (`actual`) not equal to `df` (`expected`).

`class(actual)`:   "tbl_df" "tbl" "data.frame"
`class(expected)`:                "data.frame"
── Failure ('test-pin-read-write.R:18:3'): can round trip all types ────────────
pin_read(board, "df-3") (`actual`) not equal to `df` (`expected`).

`class(actual)`:   "tbl_df" "tbl" "data.frame"
`class(expected)`:                "data.frame"

[ FAIL 3 | WARN 0 | SKIP 66 | PASS 183 ]
Error: Test failures
Execution halted

1 error x | 0 warnings v | 0 notes v


```

# Check Summary

## CRAN

```
# A tibble: 40 x 5
   label pkg               notes     warnings  errors   
   <chr> <chr>             <list>    <list>    <list>   
 1 CRAN  analogsea         <chr [0]> <chr [0]> <chr [0]>
 2 CRAN  Andromeda         <NULL>    <NULL>    <NULL>   
 3 CRAN  arkdb             <chr [0]> <chr [0]> <chr [0]>
 4 CRAN  brclimr           <chr [0]> <chr [0]> <chr [0]>
 5 CRAN  CDMConnector      <chr [0]> <chr [0]> <chr [0]>
 6 CRAN  ClickHouseHTTP    <chr [0]> <chr [0]> <chr [0]>
 7 CRAN  CodelistGenerator <chr [0]> <chr [0]> <chr [0]>
 8 CRAN  dataverifyr       <chr [0]> <chr [0]> <chr [0]>
 9 CRAN  dataversionr      <chr [0]> <chr [0]> <chr [0]>
10 CRAN  diffdfs           <chr [0]> <chr [0]> <chr [0]>
11 CRAN  duckdb            <chr [1]> <chr [0]> <chr [0]>
12 CRAN  fastverse         <chr [1]> <chr [0]> <chr [0]>
13 CRAN  foundry           <chr [0]> <chr [0]> <chr [0]>
14 CRAN  gbifdb            <chr [0]> <chr [0]> <chr [1]>
15 CRAN  IGoRRR            <chr [0]> <chr [0]> <chr [0]>
16 CRAN  matric            <chr [0]> <chr [0]> <chr [0]>
17 CRAN  MolgenisArmadillo <chr [0]> <chr [0]> <chr [0]>
18 CRAN  mrgsim.parallel   <chr [0]> <chr [0]> <chr [0]>
19 CRAN  nanoarrow         <chr [0]> <chr [0]> <chr [0]>
20 CRAN  nc                <chr [0]> <chr [0]> <chr [0]>
21 CRAN  nflreadr          <chr [0]> <chr [0]> <chr [0]>
22 CRAN  noctua            <chr [0]> <chr [0]> <chr [0]>
23 CRAN  opencpu           <NULL>    <NULL>    <NULL>   
24 CRAN  parqr             <chr [0]> <chr [0]> <chr [0]>
25 CRAN  parquetize        <chr [0]> <chr [0]> <chr [0]>
26 CRAN  pins              <chr [0]> <chr [0]> <chr [0]>
27 CRAN  plumber           <chr [0]> <chr [0]> <chr [0]>
28 CRAN  pointblank        <chr [1]> <chr [0]> <chr [0]>
29 CRAN  RAthena           <chr [0]> <chr [0]> <chr [0]>
30 CRAN  receptiviti       <chr [0]> <chr [0]> <chr [1]>
31 CRAN  rio               <chr [0]> <chr [0]> <chr [0]>
32 CRAN  sfarrow           <chr [0]> <chr [0]> <chr [0]>
33 CRAN  sparklyr          <chr [1]> <chr [0]> <chr [0]>
34 CRAN  SQL               <chr [0]> <chr [0]> <chr [0]>
35 CRAN  starvz            <chr [0]> <chr [0]> <chr [0]>
36 CRAN  strand            <chr [1]> <chr [0]> <chr [0]>
37 CRAN  targets           <chr [0]> <chr [0]> <chr [0]>
38 CRAN  tidyquery         <chr [0]> <chr [0]> <chr [0]>
39 CRAN  tiledb            <chr [1]> <chr [0]> <chr [0]>
40 CRAN  vetiver           <chr [0]> <chr [0]> <chr [0]>
```

## Local

```
# A tibble: 40 x 5
   label pkg               notes     warnings  errors   
   <chr> <chr>             <list>    <list>    <list>   
 1 local analogsea         <chr [0]> <chr [0]> <chr [0]>
 2 local Andromeda         <NULL>    <NULL>    <NULL>   
 3 local arkdb             <chr [0]> <chr [0]> <chr [0]>
 4 local brclimr           <chr [0]> <chr [0]> <chr [0]>
 5 local CDMConnector      <chr [0]> <chr [0]> <chr [0]>
 6 local ClickHouseHTTP    <chr [0]> <chr [0]> <chr [0]>
 7 local CodelistGenerator <chr [0]> <chr [0]> <chr [0]>
 8 local dataverifyr       <chr [0]> <chr [0]> <chr [0]>
 9 local dataversionr      <chr [0]> <chr [0]> <chr [1]>
10 local diffdfs           <chr [0]> <chr [0]> <chr [0]>
11 local duckdb            <chr [1]> <chr [0]> <chr [0]>
12 local fastverse         <chr [1]> <chr [0]> <chr [0]>
13 local foundry           <chr [0]> <chr [0]> <chr [0]>
14 local gbifdb            <chr [0]> <chr [0]> <chr [0]>
15 local IGoRRR            <chr [0]> <chr [0]> <chr [0]>
16 local matric            <chr [0]> <chr [0]> <chr [0]>
17 local MolgenisArmadillo <chr [0]> <chr [0]> <chr [0]>
18 local mrgsim.parallel   <chr [0]> <chr [0]> <chr [0]>
19 local nanoarrow         <chr [0]> <chr [1]> <chr [0]>
20 local nc                <chr [0]> <chr [0]> <chr [0]>
21 local nflreadr          <chr [0]> <chr [0]> <chr [0]>
22 local noctua            <chr [0]> <chr [0]> <chr [0]>
23 local opencpu           <NULL>    <NULL>    <NULL>   
24 local parqr             <chr [0]> <chr [0]> <chr [0]>
25 local parquetize        <chr [0]> <chr [0]> <chr [0]>
26 local pins              <chr [0]> <chr [0]> <chr [1]>
27 local plumber           <chr [0]> <chr [0]> <chr [0]>
28 local pointblank        <chr [1]> <chr [0]> <chr [0]>
29 local RAthena           <chr [0]> <chr [0]> <chr [0]>
30 local receptiviti       <chr [0]> <chr [0]> <chr [1]>
31 local rio               <chr [0]> <chr [0]> <chr [0]>
32 local sfarrow           <chr [0]> <chr [0]> <chr [0]>
33 local sparklyr          <chr [1]> <chr [0]> <chr [0]>
34 local SQL               <chr [0]> <chr [0]> <chr [0]>
35 local starvz            <chr [0]> <chr [0]> <chr [0]>
36 local strand            <chr [1]> <chr [0]> <chr [0]>
37 local targets           <chr [0]> <chr [0]> <chr [0]>
38 local tidyquery         <chr [0]> <chr [0]> <chr [0]>
39 local tiledb            <chr [1]> <chr [0]> <chr [0]>
40 local vetiver           <chr [0]> <chr [0]> <chr [0]>
```

# All notes and errors

## dataversionr

```
-- R CMD check results --------------------------------- dataversionr 0.9.0 ----
Duration: 2m 20.5s

0 errors v | 0 warnings v | 0 notes v


```

## pins

```
-- R CMD check results ----------------------------------------- pins 1.2.0 ----
Duration: 42.4s

0 errors v | 0 warnings v | 0 notes v


```

## receptiviti

```
-- R CMD check results ---------------------------------- receptiviti 0.1.4 ----
Duration: 17.4s

> checking tests ...
  See below...

-- Test failures ------------------------------------------------- testthat ----

> library(testthat)
> library(receptiviti)
> 
> test_check("receptiviti")
[ FAIL 1 | WARN 0 | SKIP 2 | PASS 13 ]

══ Skipped tests (2) ═══════════════════════════════════════════════════════════
• no API key (2): 'test-receptiviti.R:32:1', 'test-receptiviti_status.R:16:1'

══ Failed tests ════════════════════════════════════════════════════════════════
── Error ('test-receptiviti_status.R:5:3'): failures works ─────────────────────
Error in `curl_fetch_memory(url, handler)`: Could not resolve host: example.com
Backtrace:
    ▆
 1. ├─testthat::expect_identical(...) at test-receptiviti_status.R:5:2
 2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
 3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
 4. ├─utils::capture.output(...)
 5. │ └─base::withVisible(...elt(i))
 6. └─receptiviti::receptiviti_status("example.com", key = 123, secret = 123)
 7.   └─curl::curl_fetch_memory(url, handler)

[ FAIL 1 | WARN 0 | SKIP 2 | PASS 13 ]
Error: Test failures
Execution halted

1 error x | 0 warnings v | 0 notes v


```

## nanoarrow

```
-- R CMD check results ---------------------------------- nanoarrow 0.2.0.1 ----
Duration: 18.7s

0 errors v | 0 warnings v | 0 notes v


```

## duckdb

```
-- R CMD check results ------------------------------------- duckdb 0.8.1-1 ----
Duration: 2m 38.7s

> checking installed package size ... NOTE
    installed size is 33.5Mb
    sub-directories of 1Mb or more:
      libs  32.9Mb

0 errors v | 0 warnings v | 1 note x


```

## fastverse

```
-- R CMD check results ------------------------------------ fastverse 0.3.1 ----
Duration: 16.2s

> checking dependencies in R code ... NOTE
  Namespaces in Imports field not imported from:
    ‘collapse’ ‘data.table’ ‘kit’ ‘magrittr’
    All declared Imports should be used.

0 errors v | 0 warnings v | 1 note x


```

## pointblank

```
-- R CMD check results ---------------------------------- pointblank 0.11.4 ----
Duration: 39.5s

> checking data for non-ASCII characters ... NOTE
    Note: found 1 marked UTF-8 string

0 errors v | 0 warnings v | 1 note x


```

## sparklyr

```
-- R CMD check results ------------------------------------- sparklyr 1.8.2 ----
Duration: 44.3s

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
Duration: 56.7s

> checking data for non-ASCII characters ... NOTE
    Note: found 1 marked UTF-8 string

0 errors v | 0 warnings v | 1 note x


```

## tiledb

```
-- R CMD check results -------------------------------------- tiledb 0.20.1 ----
Duration: 1m 7.9s

> checking installed package size ... NOTE
    installed size is 53.2Mb
    sub-directories of 1Mb or more:
      libs     1.8Mb
      tiledb  49.2Mb

0 errors v | 0 warnings v | 1 note x


```

