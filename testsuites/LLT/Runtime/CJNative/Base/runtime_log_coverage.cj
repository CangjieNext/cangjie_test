// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.cpp runtime_base_test.h
// (Linux) EXEC: %clang++ %stdc++_opt %n.cpp %cffi_runtime_link -lgcc_s -o %output
// (not Windows and not Linux) EXEC: %clang++ %stdc++_opt %n.cpp %cffi_runtime_link -o %output
// (not Windows) RUN-EXEC-PIPE: %run env -u MRT_LOG_PATH -u MRT_LOG_FILE_SIZE %run_opt %output terminal %run_args 2>&1 | compare %f
// (not Windows) RUN-EXEC-PIPE: %run env MRT_LOG_PATH=./runtime_log_output.txt MRT_LOG_FILE_SIZE=1kb %run_opt %output file %run_args 2>&1 | compare %f
// (not Windows) RUN-EXEC-PIPE: %run env MRT_LOG_PATH=/dev/null/runtime_log_coverage.out %run_opt %output invalid %run_args 2>&1 | compare %f
// (not Windows) RUN-EXEC-PIPE: %run env -u MRT_LOG_PATH MRT_REPORT=./runtime_report_output.txt MRT_LOG_CJTHREAD=./runtime_cjthread_output.txt MRT_LOG_FILE_SIZE=1kb %run_opt %output logfile %run_args 2>&1 | compare %f
// (not Windows) RUN-EXEC-PIPE: %run env -u MRT_LOG_PATH -u MRT_LOG_CJTHREAD MRT_REPORT=/dev/null/runtime_report_output.txt %run_opt %output logfile-invalid %run_args 2>&1 | compare %f
// ASSERT: scan runtime log coverage pass

main(): Int64 {
    return 0
}
