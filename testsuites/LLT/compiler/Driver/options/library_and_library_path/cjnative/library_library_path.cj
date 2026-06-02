// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/**
 * Test that LIBRARY_PATH works as '--library-path'
 */

// DEPENDENCE: ../../src/package01a ../../src/package01b
//  EXEC: %compiler -p package01a --output-type=staticlib -o libpkg.a
//  EXEC: mkdir lib && %move libpkg.a lib
// (not Windows and CJNATIVE) EXEC: LIBRARY_PATH=lib:$LIBRARY_PATH %compiler %f --library pkg -o %output
// (Windows and CJNATIVE) EXEC: set LIBRARY_PATH=%pwd\lib;%LIBRARY_PATH%&& %compiler %f --library pkg -o %output
//  EXEC: %run %run_opt %output %run_args | compare %f
//  ASSERT: scan I am 01a

internal import package01.*

main() {
    printInfo()
    0
}
