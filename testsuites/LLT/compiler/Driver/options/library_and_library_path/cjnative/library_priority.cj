// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/**
 * Test that '--library-path' has higher priority than LIBRARY_PATH
 */

// DEPENDENCE: ../../src/package01a ../../src/package01b
//  EXEC: %compiler -p package01b --output-type=staticlib -o libpkg.a
//  EXEC: mkdir lib && %move libpkg.a lib
//  EXEC: %compiler -p package01a --output-type=staticlib -o libpkg.a
// (not Windows and CJNATIVE) EXEC: LIBRARY_PATH=.:$LIBRARY_PATH %compiler %f --library-path lib --library pkg -o %output
// (Windows and CJNATIVE) EXEC: set LIBRARY_PATH=%cd%;%LIBRARY_PATH%&&%compiler %f --library-path lib --library pkg -o %output
//  EXEC: %run %run_opt %output %run_args | compare %f
//  ASSERT: scan I am 01b

internal import package01.*

main() {
    printInfo()
}
