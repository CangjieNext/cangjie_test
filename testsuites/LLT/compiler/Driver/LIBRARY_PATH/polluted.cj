// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %rmdir lib && mkdir lib
// EXEC: %touch lib/libcangjie-std-core.%dylib_suffix
// (not Windows) EXEC: LIBRARY_PATH=lib:$LIBRARY_PATH %compiler %f -o %output
// (Windows) EXEC: set LIBRARY_PATH=lib&& %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args

main() {
    return 0
}
