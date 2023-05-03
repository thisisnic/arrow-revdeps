# Changes

## CDMConnector

### With CRAN arrow

```
-- R CMD check results --------------------------------- CDMConnector 0.5.1 ----
Duration: 1m 21.5s

> checking tests ...
  See below...

-- Test failures ------------------------------------------------- testthat ----

> # This file is part of the standard setup for testthat.
> # It is recommended that you do not modify it.
> #
> # Where should you do additional test configuration?
> # Learn more about the roles of various files in:
> # * https://r-pkgs.org/tests.html
> # * https://testthat.r-lib.org/reference/test_package.html#special-files
> 
> library(testthat)
> library(CDMConnector)
> 
> test_check("CDMConnector")
trying URL 'https://raw.githubusercontent.com/darwin-eu/EunomiaDatasets/main/datasets/GiBleed/GiBleed_5.3.zip'
Content type 'application/zip' length 6848518 bytes (6.5 MB)
==================================================
downloaded 6.5 MB

Dataset already exists (/var/folders/p5/sxv05ml96sd1n2p3ssfhzzth0000gn/T//RtmpxCpLkF/file9727e8181d/GiBleed_5.3.zip). Specify overwrite=T to overwrite existing zip archive.attempting to extract and load /var/folders/p5/sxv05ml96sd1n2p3ssfhzzth0000gn/T//RtmpxCpLkF/file9727e8181d/GiBleed_5.3.zip
[ FAIL 3 | WARN 0 | SKIP 53 | PASS 236 ]

══ Skipped tests ═══════════════════════════════════════════════════════════════
• "Databricks" %in% odbc::odbcListDataSources()$name is not TRUE (6)
• "OracleODBC-19" %in% odbc::odbcListDataSources()$name is not TRUE (3)
• "OracleODBC-19" %in% odbc::odbcListDrivers() is not TRUE (1)
• "Snowflake" %in% odbc::odbcListDataSources()$name is not TRUE (3)
• On CRAN (4)
• Sys.getenv("CDM5_POSTGRESQL_USER") == "" is TRUE (10)
• Sys.getenv("CDM5_REDSHIFT_USER") == "" is TRUE (9)
• Sys.getenv("CDM5_SQL_SERVER_USER") == "" is TRUE (10)
• Sys.getenv("LOCAL_POSTGRESQL_USER") == "" is TRUE (3)
• Sys.getenv("REDSHIFT_USER") == "" is TRUE (1)
• Sys.getenv("SNOWFLAKE_USER") == "" is TRUE (1)
• manual test (2)

══ Failed tests ════════════════════════════════════════════════════════════════
── Error ('test-cdmSubset.R:30:5'): duckdb subsetting ──────────────────────────
<purrr_error_indexed/rlang_error/error/condition>
Error in `map(.x, .f, ..., .progress = .progress)`: i In index: 19.
Caused by error:
! rapi_execute: Failed to run query
Error: Conversion Error: extract specifier "" not recognized
Backtrace:
     ▆
  1. ├─CDMConnector::generateCohortSet(cdm, cohortSet = cohortSet, name = "gibleed") at test-cdmSubset.R:30:4
  2. │ └─purrr::walk(sql, ~DBI::dbExecute(con, .x, immediate = TRUE))
  3. │   └─purrr::map(.x, .f, ..., .progress = .progress)
  4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
  5. │       ├─purrr:::with_indexed_errors(...)
  6. │       │ └─base::withCallingHandlers(...)
  7. │       ├─purrr:::call_with_cleanup(...)
  8. │       └─CDMConnector (local) .f(.x[[i]], ...)
  9. │         ├─DBI::dbExecute(con, .x, immediate = TRUE)
 10. │         └─DBI::dbExecute(con, .x, immediate = TRUE)
 11. │           ├─DBI::dbSendStatement(conn, statement, ...)
 12. │           └─DBI::dbSendStatement(conn, statement, ...)
 13. │             ├─DBI::dbSendQuery(conn, statement, ...)
 14. │             └─duckdb::dbSendQuery(conn, statement, ...)
 15. │               └─duckdb (local) .local(conn, statement, ...)
 16. │                 └─duckdb:::duckdb_result(...)
 17. │                   └─duckdb:::duckdb_execute(res)
 18. │                     └─duckdb:::rapi_execute(...)
 19. └─base::.handleSimpleError(...)
 20.   └─purrr (local) h(simpleError(msg, call))
 21.     └─cli::cli_abort(...)
 22.       └─rlang::abort(...)
── Error ('test-generateCohortSet.R:32:3'): duckdb cohort generation ───────────
<purrr_error_indexed/rlang_error/error/condition>
Error in `map(.x, .f, ..., .progress = .progress)`: i In index: 19.
Caused by error:
! rapi_execute: Failed to run query
Error: Conversion Error: extract specifier "" not recognized
Backtrace:
     ▆
  1. ├─CDMConnector::generateCohortSet(...) at test-generateCohortSet.R:32:2
  2. │ └─purrr::walk(sql, ~DBI::dbExecute(con, .x, immediate = TRUE))
  3. │   └─purrr::map(.x, .f, ..., .progress = .progress)
  4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
  5. │       ├─purrr:::with_indexed_errors(...)
  6. │       │ └─base::withCallingHandlers(...)
  7. │       ├─purrr:::call_with_cleanup(...)
  8. │       └─CDMConnector (local) .f(.x[[i]], ...)
  9. │         ├─DBI::dbExecute(con, .x, immediate = TRUE)
 10. │         └─DBI::dbExecute(con, .x, immediate = TRUE)
 11. │           ├─DBI::dbSendStatement(conn, statement, ...)
 12. │           └─DBI::dbSendStatement(conn, statement, ...)
 13. │             ├─DBI::dbSendQuery(conn, statement, ...)
 14. │             └─duckdb::dbSendQuery(conn, statement, ...)
 15. │               └─duckdb (local) .local(conn, statement, ...)
 16. │                 └─duckdb:::duckdb_result(...)
 17. │                   └─duckdb:::duckdb_execute(res)
 18. │                     └─duckdb:::rapi_execute(...)
 19. └─base::.handleSimpleError(...)
 20.   └─purrr (local) h(simpleError(msg, call))
 21.     └─cli::cli_abort(...)
 22.       └─rlang::abort(...)
── Error ('test-generateCohortSet.R:92:3'): duckdb cohort generation with attrition ──
<purrr_error_indexed/rlang_error/error/condition>
Error in `map(.x, .f, ..., .progress = .progress)`: i In index: 19.
Caused by error:
! rapi_execute: Failed to run query
Error: Conversion Error: extract specifier "" not recognized
Backtrace:
     ▆
  1. ├─CDMConnector::generateCohortSet(...) at test-generateCohortSet.R:92:2
  2. │ └─purrr::walk(sql, ~DBI::dbExecute(con, .x, immediate = TRUE))
  3. │   └─purrr::map(.x, .f, ..., .progress = .progress)
  4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
  5. │       ├─purrr:::with_indexed_errors(...)
  6. │       │ └─base::withCallingHandlers(...)
  7. │       ├─purrr:::call_with_cleanup(...)
  8. │       └─CDMConnector (local) .f(.x[[i]], ...)
  9. │         ├─DBI::dbExecute(con, .x, immediate = TRUE)
 10. │         └─DBI::dbExecute(con, .x, immediate = TRUE)
 11. │           ├─DBI::dbSendStatement(conn, statement, ...)
 12. │           └─DBI::dbSendStatement(conn, statement, ...)
 13. │             ├─DBI::dbSendQuery(conn, statement, ...)
 14. │             └─duckdb::dbSendQuery(conn, statement, ...)
 15. │               └─duckdb (local) .local(conn, statement, ...)
 16. │                 └─duckdb:::duckdb_result(...)
 17. │                   └─duckdb:::duckdb_execute(res)
 18. │                     └─duckdb:::rapi_execute(...)
 19. └─base::.handleSimpleError(...)
 20.   └─purrr (local) h(simpleError(msg, call))
 21.     └─cli::cli_abort(...)
 22.       └─rlang::abort(...)

[ FAIL 3 | WARN 0 | SKIP 53 | PASS 236 ]
Error: Test failures
In addition: Warning messages:
1: Connection is garbage-collected, use dbDisconnect() to avoid this. 
2: Connection is garbage-collected, use dbDisconnect() to avoid this. 
3: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
4: Connection is garbage-collected, use dbDisconnect() to avoid this. 
5: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
6: Connection is garbage-collected, use dbDisconnect() to avoid this. 
7: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
Execution halted
Warning messages:
1: Connection is garbage-collected, use dbDisconnect() to avoid this. 
2: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
3: Connection is garbage-collected, use dbDisconnect() to avoid this. 
4: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
5: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 

1 error x | 0 warnings v | 0 notes v

```

### With local arrow

```
-- R CMD check results --------------------------------- CDMConnector 0.5.1 ----
Duration: 1m 7.8s

> checking tests ...
  See below...

-- Test failures ------------------------------------------------- testthat ----

> # This file is part of the standard setup for testthat.
> # It is recommended that you do not modify it.
> #
> # Where should you do additional test configuration?
> # Learn more about the roles of various files in:
> # * https://r-pkgs.org/tests.html
> # * https://testthat.r-lib.org/reference/test_package.html#special-files
> 
> library(testthat)
> library(CDMConnector)
> 
> test_check("CDMConnector")
trying URL 'https://raw.githubusercontent.com/darwin-eu/EunomiaDatasets/main/datasets/GiBleed/GiBleed_5.3.zip'
Content type 'application/zip' length 6848518 bytes (6.5 MB)
==================================================
downloaded 6.5 MB

Dataset already exists (/var/folders/p5/sxv05ml96sd1n2p3ssfhzzth0000gn/T//RtmpsQtpHp/file673e53ee07d4/GiBleed_5.3.zip). Specify overwrite=T to overwrite existing zip archive.attempting to extract and load /var/folders/p5/sxv05ml96sd1n2p3ssfhzzth0000gn/T//RtmpsQtpHp/file673e53ee07d4/GiBleed_5.3.zip
[ FAIL 3 | WARN 0 | SKIP 53 | PASS 236 ]

══ Skipped tests ═══════════════════════════════════════════════════════════════
• "Databricks" %in% odbc::odbcListDataSources()$name is not TRUE (6)
• "OracleODBC-19" %in% odbc::odbcListDataSources()$name is not TRUE (3)
• "OracleODBC-19" %in% odbc::odbcListDrivers() is not TRUE (1)
• "Snowflake" %in% odbc::odbcListDataSources()$name is not TRUE (3)
• On CRAN (4)
• Sys.getenv("CDM5_POSTGRESQL_USER") == "" is TRUE (10)
• Sys.getenv("CDM5_REDSHIFT_USER") == "" is TRUE (9)
• Sys.getenv("CDM5_SQL_SERVER_USER") == "" is TRUE (10)
• Sys.getenv("LOCAL_POSTGRESQL_USER") == "" is TRUE (3)
• Sys.getenv("REDSHIFT_USER") == "" is TRUE (1)
• Sys.getenv("SNOWFLAKE_USER") == "" is TRUE (1)
• manual test (2)

══ Failed tests ════════════════════════════════════════════════════════════════
── Error ('test-cdmSubset.R:30:5'): duckdb subsetting ──────────────────────────
<purrr_error_indexed/rlang_error/error/condition>
Error in `map(.x, .f, ..., .progress = .progress)`: i In index: 19.
Caused by error:
! rapi_execute: Failed to run query
Error: Conversion Error: extract specifier "" not recognized
Backtrace:
     ▆
  1. ├─CDMConnector::generateCohortSet(cdm, cohortSet = cohortSet, name = "gibleed") at test-cdmSubset.R:30:4
  2. │ └─purrr::walk(sql, ~DBI::dbExecute(con, .x, immediate = TRUE))
  3. │   └─purrr::map(.x, .f, ..., .progress = .progress)
  4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
  5. │       ├─purrr:::with_indexed_errors(...)
  6. │       │ └─base::withCallingHandlers(...)
  7. │       ├─purrr:::call_with_cleanup(...)
  8. │       └─CDMConnector (local) .f(.x[[i]], ...)
  9. │         ├─DBI::dbExecute(con, .x, immediate = TRUE)
 10. │         └─DBI::dbExecute(con, .x, immediate = TRUE)
 11. │           ├─DBI::dbSendStatement(conn, statement, ...)
 12. │           └─DBI::dbSendStatement(conn, statement, ...)
 13. │             ├─DBI::dbSendQuery(conn, statement, ...)
 14. │             └─duckdb::dbSendQuery(conn, statement, ...)
 15. │               └─duckdb (local) .local(conn, statement, ...)
 16. │                 └─duckdb:::duckdb_result(...)
 17. │                   └─duckdb:::duckdb_execute(res)
 18. │                     └─duckdb:::rapi_execute(...)
 19. └─base::.handleSimpleError(...)
 20.   └─purrr (local) h(simpleError(msg, call))
 21.     └─cli::cli_abort(...)
 22.       └─rlang::abort(...)
── Error ('test-generateCohortSet.R:32:3'): duckdb cohort generation ───────────
<purrr_error_indexed/rlang_error/error/condition>
Error in `map(.x, .f, ..., .progress = .progress)`: i In index: 19.
Caused by error:
! rapi_execute: Failed to run query
Error: Conversion Error: extract specifier "" not recognized
Backtrace:
     ▆
  1. ├─CDMConnector::generateCohortSet(...) at test-generateCohortSet.R:32:2
  2. │ └─purrr::walk(sql, ~DBI::dbExecute(con, .x, immediate = TRUE))
  3. │   └─purrr::map(.x, .f, ..., .progress = .progress)
  4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
  5. │       ├─purrr:::with_indexed_errors(...)
  6. │       │ └─base::withCallingHandlers(...)
  7. │       ├─purrr:::call_with_cleanup(...)
  8. │       └─CDMConnector (local) .f(.x[[i]], ...)
  9. │         ├─DBI::dbExecute(con, .x, immediate = TRUE)
 10. │         └─DBI::dbExecute(con, .x, immediate = TRUE)
 11. │           ├─DBI::dbSendStatement(conn, statement, ...)
 12. │           └─DBI::dbSendStatement(conn, statement, ...)
 13. │             ├─DBI::dbSendQuery(conn, statement, ...)
 14. │             └─duckdb::dbSendQuery(conn, statement, ...)
 15. │               └─duckdb (local) .local(conn, statement, ...)
 16. │                 └─duckdb:::duckdb_result(...)
 17. │                   └─duckdb:::duckdb_execute(res)
 18. │                     └─duckdb:::rapi_execute(...)
 19. └─base::.handleSimpleError(...)
 20.   └─purrr (local) h(simpleError(msg, call))
 21.     └─cli::cli_abort(...)
 22.       └─rlang::abort(...)
── Error ('test-generateCohortSet.R:92:3'): duckdb cohort generation with attrition ──
<purrr_error_indexed/rlang_error/error/condition>
Error in `map(.x, .f, ..., .progress = .progress)`: i In index: 19.
Caused by error:
! rapi_execute: Failed to run query
Error: Conversion Error: extract specifier "" not recognized
Backtrace:
     ▆
  1. ├─CDMConnector::generateCohortSet(...) at test-generateCohortSet.R:92:2
  2. │ └─purrr::walk(sql, ~DBI::dbExecute(con, .x, immediate = TRUE))
  3. │   └─purrr::map(.x, .f, ..., .progress = .progress)
  4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
  5. │       ├─purrr:::with_indexed_errors(...)
  6. │       │ └─base::withCallingHandlers(...)
  7. │       ├─purrr:::call_with_cleanup(...)
  8. │       └─CDMConnector (local) .f(.x[[i]], ...)
  9. │         ├─DBI::dbExecute(con, .x, immediate = TRUE)
 10. │         └─DBI::dbExecute(con, .x, immediate = TRUE)
 11. │           ├─DBI::dbSendStatement(conn, statement, ...)
 12. │           └─DBI::dbSendStatement(conn, statement, ...)
 13. │             ├─DBI::dbSendQuery(conn, statement, ...)
 14. │             └─duckdb::dbSendQuery(conn, statement, ...)
 15. │               └─duckdb (local) .local(conn, statement, ...)
 16. │                 └─duckdb:::duckdb_result(...)
 17. │                   └─duckdb:::duckdb_execute(res)
 18. │                     └─duckdb:::rapi_execute(...)
 19. └─base::.handleSimpleError(...)
 20.   └─purrr (local) h(simpleError(msg, call))
 21.     └─cli::cli_abort(...)
 22.       └─rlang::abort(...)

[ FAIL 3 | WARN 0 | SKIP 53 | PASS 236 ]
Error: Test failures
In addition: Warning messages:
1: Connection is garbage-collected, use dbDisconnect() to avoid this. 
2: Connection is garbage-collected, use dbDisconnect() to avoid this. 
3: Connection is garbage-collected, use dbDisconnect() to avoid this. 
4: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
5: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
6: Connection is garbage-collected, use dbDisconnect() to avoid this. 
7: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
Execution halted
Warning messages:
1: Connection is garbage-collected, use dbDisconnect() to avoid this. 
2: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
3: Connection is garbage-collected, use dbDisconnect() to avoid this. 
4: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
5: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 

1 error x | 0 warnings v | 0 notes v


```

# Check Summary

## CRAN

```
# A tibble: 42 x 5
   label pkg               notes     warnings  errors   
   <chr> <chr>             <list>    <list>    <list>   
 1 CRAN  analogsea         <chr [0]> <chr [0]> <chr [0]>
 2 CRAN  Andromeda         <NULL>    <NULL>    <NULL>   
 3 CRAN  arkdb             <chr [0]> <chr [0]> <chr [0]>
 4 CRAN  brclimr           <chr [0]> <chr [0]> <chr [0]>
 5 CRAN  CDMConnector      <chr [0]> <chr [0]> <chr [1]>
 6 CRAN  ClickHouseHTTP    <chr [0]> <chr [0]> <chr [0]>
 7 CRAN  CodelistGenerator <chr [0]> <chr [0]> <chr [0]>
 8 CRAN  dataverifyr       <chr [0]> <chr [0]> <chr [0]>
 9 CRAN  dataversionr      <chr [0]> <chr [0]> <chr [0]>
10 CRAN  diffdfs           <chr [0]> <chr [0]> <chr [0]>
11 CRAN  disk.frame        <chr [0]> <chr [0]> <chr [0]>
12 CRAN  duckdb            <chr [1]> <chr [0]> <chr [0]>
13 CRAN  fastverse         <chr [1]> <chr [0]> <chr [0]>
14 CRAN  foundry           <chr [0]> <chr [0]> <chr [0]>
15 CRAN  gbifdb            <chr [0]> <chr [0]> <chr [0]>
16 CRAN  IGoRRR            <chr [0]> <chr [0]> <chr [0]>
17 CRAN  matric            <chr [0]> <chr [0]> <chr [0]>
18 CRAN  MolgenisArmadillo <chr [0]> <chr [0]> <chr [0]>
19 CRAN  mrgsim.parallel   <chr [0]> <chr [0]> <chr [0]>
20 CRAN  nanoarrow         <chr [0]> <chr [0]> <chr [0]>
21 CRAN  nc                <chr [0]> <chr [0]> <chr [0]>
22 CRAN  nflreadr          <chr [0]> <chr [0]> <chr [0]>
23 CRAN  noctua            <chr [0]> <chr [0]> <chr [0]>
24 CRAN  opencpu           <NULL>    <NULL>    <NULL>   
25 CRAN  parqr             <chr [0]> <chr [0]> <chr [0]>
26 CRAN  parquetize        <chr [0]> <chr [0]> <chr [0]>
27 CRAN  pins              <chr [0]> <chr [0]> <chr [0]>
28 CRAN  plumber           <chr [0]> <chr [0]> <chr [0]>
29 CRAN  pointblank        <chr [1]> <chr [0]> <chr [0]>
30 CRAN  RAthena           <chr [0]> <chr [0]> <chr [0]>
31 CRAN  raveio            <chr [0]> <chr [0]> <chr [0]>
32 CRAN  receptiviti       <chr [0]> <chr [0]> <chr [1]>
33 CRAN  rio               <chr [0]> <chr [0]> <chr [0]>
34 CRAN  sfarrow           <chr [0]> <chr [0]> <chr [0]>
35 CRAN  sparklyr          <chr [1]> <chr [0]> <chr [0]>
36 CRAN  SQL               <chr [0]> <chr [0]> <chr [0]>
37 CRAN  starvz            <chr [0]> <chr [0]> <chr [0]>
38 CRAN  strand            <chr [1]> <chr [0]> <chr [0]>
39 CRAN  targets           <chr [0]> <chr [0]> <chr [0]>
40 CRAN  tidyquery         <chr [0]> <chr [0]> <chr [0]>
41 CRAN  tradestatistics   <chr [0]> <chr [0]> <chr [0]>
42 CRAN  vetiver           <chr [0]> <chr [0]> <chr [0]>
```

## Local

```
# A tibble: 42 x 5
   label pkg               notes     warnings  errors   
   <chr> <chr>             <list>    <list>    <list>   
 1 local analogsea         <chr [0]> <chr [0]> <chr [0]>
 2 local Andromeda         <NULL>    <NULL>    <NULL>   
 3 local arkdb             <chr [0]> <chr [0]> <chr [0]>
 4 local brclimr           <chr [0]> <chr [0]> <chr [0]>
 5 local CDMConnector      <chr [0]> <chr [0]> <chr [1]>
 6 local ClickHouseHTTP    <chr [0]> <chr [0]> <chr [0]>
 7 local CodelistGenerator <chr [0]> <chr [0]> <chr [0]>
 8 local dataverifyr       <chr [0]> <chr [0]> <chr [0]>
 9 local dataversionr      <chr [0]> <chr [0]> <chr [0]>
10 local diffdfs           <chr [0]> <chr [0]> <chr [0]>
11 local disk.frame        <chr [0]> <chr [0]> <chr [0]>
12 local duckdb            <chr [1]> <chr [0]> <chr [0]>
13 local fastverse         <chr [1]> <chr [0]> <chr [0]>
14 local foundry           <chr [0]> <chr [0]> <chr [0]>
15 local gbifdb            <chr [0]> <chr [0]> <chr [0]>
16 local IGoRRR            <chr [0]> <chr [0]> <chr [0]>
17 local matric            <chr [0]> <chr [0]> <chr [0]>
18 local MolgenisArmadillo <chr [0]> <chr [0]> <chr [0]>
19 local mrgsim.parallel   <chr [0]> <chr [0]> <chr [0]>
20 local nanoarrow         <chr [0]> <chr [0]> <chr [0]>
21 local nc                <chr [0]> <chr [0]> <chr [0]>
22 local nflreadr          <chr [0]> <chr [0]> <chr [0]>
23 local noctua            <chr [0]> <chr [0]> <chr [0]>
24 local opencpu           <NULL>    <NULL>    <NULL>   
25 local parqr             <chr [0]> <chr [0]> <chr [0]>
26 local parquetize        <chr [0]> <chr [0]> <chr [0]>
27 local pins              <chr [0]> <chr [0]> <chr [0]>
28 local plumber           <chr [0]> <chr [0]> <chr [0]>
29 local pointblank        <chr [1]> <chr [0]> <chr [0]>
30 local RAthena           <chr [0]> <chr [0]> <chr [0]>
31 local raveio            <chr [0]> <chr [0]> <chr [0]>
32 local receptiviti       <chr [0]> <chr [0]> <chr [1]>
33 local rio               <chr [0]> <chr [0]> <chr [0]>
34 local sfarrow           <chr [0]> <chr [0]> <chr [0]>
35 local sparklyr          <chr [1]> <chr [0]> <chr [0]>
36 local SQL               <chr [0]> <chr [0]> <chr [0]>
37 local starvz            <chr [0]> <chr [0]> <chr [0]>
38 local strand            <chr [1]> <chr [0]> <chr [0]>
39 local targets           <chr [0]> <chr [0]> <chr [0]>
40 local tidyquery         <chr [0]> <chr [0]> <chr [0]>
41 local tradestatistics   <chr [0]> <chr [0]> <chr [0]>
42 local vetiver           <chr [0]> <chr [0]> <chr [0]>
```

# All notes and errors

## CDMConnector

```
-- R CMD check results --------------------------------- CDMConnector 0.5.1 ----
Duration: 1m 21.5s

> checking tests ...
  See below...

-- Test failures ------------------------------------------------- testthat ----

> # This file is part of the standard setup for testthat.
> # It is recommended that you do not modify it.
> #
> # Where should you do additional test configuration?
> # Learn more about the roles of various files in:
> # * https://r-pkgs.org/tests.html
> # * https://testthat.r-lib.org/reference/test_package.html#special-files
> 
> library(testthat)
> library(CDMConnector)
> 
> test_check("CDMConnector")
trying URL 'https://raw.githubusercontent.com/darwin-eu/EunomiaDatasets/main/datasets/GiBleed/GiBleed_5.3.zip'
Content type 'application/zip' length 6848518 bytes (6.5 MB)
==================================================
downloaded 6.5 MB

Dataset already exists (/var/folders/p5/sxv05ml96sd1n2p3ssfhzzth0000gn/T//RtmpxCpLkF/file9727e8181d/GiBleed_5.3.zip). Specify overwrite=T to overwrite existing zip archive.attempting to extract and load /var/folders/p5/sxv05ml96sd1n2p3ssfhzzth0000gn/T//RtmpxCpLkF/file9727e8181d/GiBleed_5.3.zip
[ FAIL 3 | WARN 0 | SKIP 53 | PASS 236 ]

══ Skipped tests ═══════════════════════════════════════════════════════════════
• "Databricks" %in% odbc::odbcListDataSources()$name is not TRUE (6)
• "OracleODBC-19" %in% odbc::odbcListDataSources()$name is not TRUE (3)
• "OracleODBC-19" %in% odbc::odbcListDrivers() is not TRUE (1)
• "Snowflake" %in% odbc::odbcListDataSources()$name is not TRUE (3)
• On CRAN (4)
• Sys.getenv("CDM5_POSTGRESQL_USER") == "" is TRUE (10)
• Sys.getenv("CDM5_REDSHIFT_USER") == "" is TRUE (9)
• Sys.getenv("CDM5_SQL_SERVER_USER") == "" is TRUE (10)
• Sys.getenv("LOCAL_POSTGRESQL_USER") == "" is TRUE (3)
• Sys.getenv("REDSHIFT_USER") == "" is TRUE (1)
• Sys.getenv("SNOWFLAKE_USER") == "" is TRUE (1)
• manual test (2)

══ Failed tests ════════════════════════════════════════════════════════════════
── Error ('test-cdmSubset.R:30:5'): duckdb subsetting ──────────────────────────
<purrr_error_indexed/rlang_error/error/condition>
Error in `map(.x, .f, ..., .progress = .progress)`: i In index: 19.
Caused by error:
! rapi_execute: Failed to run query
Error: Conversion Error: extract specifier "" not recognized
Backtrace:
     ▆
  1. ├─CDMConnector::generateCohortSet(cdm, cohortSet = cohortSet, name = "gibleed") at test-cdmSubset.R:30:4
  2. │ └─purrr::walk(sql, ~DBI::dbExecute(con, .x, immediate = TRUE))
  3. │   └─purrr::map(.x, .f, ..., .progress = .progress)
  4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
  5. │       ├─purrr:::with_indexed_errors(...)
  6. │       │ └─base::withCallingHandlers(...)
  7. │       ├─purrr:::call_with_cleanup(...)
  8. │       └─CDMConnector (local) .f(.x[[i]], ...)
  9. │         ├─DBI::dbExecute(con, .x, immediate = TRUE)
 10. │         └─DBI::dbExecute(con, .x, immediate = TRUE)
 11. │           ├─DBI::dbSendStatement(conn, statement, ...)
 12. │           └─DBI::dbSendStatement(conn, statement, ...)
 13. │             ├─DBI::dbSendQuery(conn, statement, ...)
 14. │             └─duckdb::dbSendQuery(conn, statement, ...)
 15. │               └─duckdb (local) .local(conn, statement, ...)
 16. │                 └─duckdb:::duckdb_result(...)
 17. │                   └─duckdb:::duckdb_execute(res)
 18. │                     └─duckdb:::rapi_execute(...)
 19. └─base::.handleSimpleError(...)
 20.   └─purrr (local) h(simpleError(msg, call))
 21.     └─cli::cli_abort(...)
 22.       └─rlang::abort(...)
── Error ('test-generateCohortSet.R:32:3'): duckdb cohort generation ───────────
<purrr_error_indexed/rlang_error/error/condition>
Error in `map(.x, .f, ..., .progress = .progress)`: i In index: 19.
Caused by error:
! rapi_execute: Failed to run query
Error: Conversion Error: extract specifier "" not recognized
Backtrace:
     ▆
  1. ├─CDMConnector::generateCohortSet(...) at test-generateCohortSet.R:32:2
  2. │ └─purrr::walk(sql, ~DBI::dbExecute(con, .x, immediate = TRUE))
  3. │   └─purrr::map(.x, .f, ..., .progress = .progress)
  4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
  5. │       ├─purrr:::with_indexed_errors(...)
  6. │       │ └─base::withCallingHandlers(...)
  7. │       ├─purrr:::call_with_cleanup(...)
  8. │       └─CDMConnector (local) .f(.x[[i]], ...)
  9. │         ├─DBI::dbExecute(con, .x, immediate = TRUE)
 10. │         └─DBI::dbExecute(con, .x, immediate = TRUE)
 11. │           ├─DBI::dbSendStatement(conn, statement, ...)
 12. │           └─DBI::dbSendStatement(conn, statement, ...)
 13. │             ├─DBI::dbSendQuery(conn, statement, ...)
 14. │             └─duckdb::dbSendQuery(conn, statement, ...)
 15. │               └─duckdb (local) .local(conn, statement, ...)
 16. │                 └─duckdb:::duckdb_result(...)
 17. │                   └─duckdb:::duckdb_execute(res)
 18. │                     └─duckdb:::rapi_execute(...)
 19. └─base::.handleSimpleError(...)
 20.   └─purrr (local) h(simpleError(msg, call))
 21.     └─cli::cli_abort(...)
 22.       └─rlang::abort(...)
── Error ('test-generateCohortSet.R:92:3'): duckdb cohort generation with attrition ──
<purrr_error_indexed/rlang_error/error/condition>
Error in `map(.x, .f, ..., .progress = .progress)`: i In index: 19.
Caused by error:
! rapi_execute: Failed to run query
Error: Conversion Error: extract specifier "" not recognized
Backtrace:
     ▆
  1. ├─CDMConnector::generateCohortSet(...) at test-generateCohortSet.R:92:2
  2. │ └─purrr::walk(sql, ~DBI::dbExecute(con, .x, immediate = TRUE))
  3. │   └─purrr::map(.x, .f, ..., .progress = .progress)
  4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
  5. │       ├─purrr:::with_indexed_errors(...)
  6. │       │ └─base::withCallingHandlers(...)
  7. │       ├─purrr:::call_with_cleanup(...)
  8. │       └─CDMConnector (local) .f(.x[[i]], ...)
  9. │         ├─DBI::dbExecute(con, .x, immediate = TRUE)
 10. │         └─DBI::dbExecute(con, .x, immediate = TRUE)
 11. │           ├─DBI::dbSendStatement(conn, statement, ...)
 12. │           └─DBI::dbSendStatement(conn, statement, ...)
 13. │             ├─DBI::dbSendQuery(conn, statement, ...)
 14. │             └─duckdb::dbSendQuery(conn, statement, ...)
 15. │               └─duckdb (local) .local(conn, statement, ...)
 16. │                 └─duckdb:::duckdb_result(...)
 17. │                   └─duckdb:::duckdb_execute(res)
 18. │                     └─duckdb:::rapi_execute(...)
 19. └─base::.handleSimpleError(...)
 20.   └─purrr (local) h(simpleError(msg, call))
 21.     └─cli::cli_abort(...)
 22.       └─rlang::abort(...)

[ FAIL 3 | WARN 0 | SKIP 53 | PASS 236 ]
Error: Test failures
In addition: Warning messages:
1: Connection is garbage-collected, use dbDisconnect() to avoid this. 
2: Connection is garbage-collected, use dbDisconnect() to avoid this. 
3: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
4: Connection is garbage-collected, use dbDisconnect() to avoid this. 
5: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
6: Connection is garbage-collected, use dbDisconnect() to avoid this. 
7: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
Execution halted
Warning messages:
1: Connection is garbage-collected, use dbDisconnect() to avoid this. 
2: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
3: Connection is garbage-collected, use dbDisconnect() to avoid this. 
4: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 
5: Database is garbage-collected, use dbDisconnect(con, shutdown=TRUE) or duckdb::duckdb_shutdown(drv) to avoid this. 

1 error x | 0 warnings v | 0 notes v


```

## receptiviti

```
-- R CMD check results ---------------------------------- receptiviti 0.1.3 ----
Duration: 60s

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
── Error ('test-receptiviti_status.R:4:3'): failures works ─────────────────────
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
-- R CMD check results ------------------------------------- duckdb 0.7.1-1 ----
Duration: 4m 32.8s

> checking installed package size ... NOTE
    installed size is 31.3Mb
    sub-directories of 1Mb or more:
      libs  30.6Mb

0 errors v | 0 warnings v | 1 note x


```

## fastverse

```
-- R CMD check results ------------------------------------ fastverse 0.3.1 ----
Duration: 30.4s

> checking dependencies in R code ... NOTE
  Namespaces in Imports field not imported from:
    ‘collapse’ ‘data.table’ ‘kit’ ‘magrittr’
    All declared Imports should be used.

0 errors v | 0 warnings v | 1 note x


```

## pointblank

```
-- R CMD check results ---------------------------------- pointblank 0.11.3 ----
Duration: 1m 19.3s

> checking data for non-ASCII characters ... NOTE
    Note: found 1 marked UTF-8 string

0 errors v | 0 warnings v | 1 note x


```

## sparklyr

```
-- R CMD check results ------------------------------------- sparklyr 1.8.1 ----
Duration: 1m 30.9s

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
Duration: 1m 55.1s

> checking data for non-ASCII characters ... NOTE
    Note: found 1 marked UTF-8 string

0 errors v | 0 warnings v | 1 note x


```

