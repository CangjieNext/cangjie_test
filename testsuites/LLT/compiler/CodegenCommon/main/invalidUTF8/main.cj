// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows)DEPENDENCE: invalid_UTF8.tar.gz test.sh
// (not Windows)EXEC: tar -xf invalid_UTF8.tar.gz
// (not Windows)EXEC: chmod +x test.sh
// (not Windows)EXEC: %compiler %cmp_opt %f -o %output
// (not Windows)EXEC-PIPE-0: ./test.sh "%run %output" 2>&1 | compare %f
// (not Windows)ASSERT: scan-346 IllegalArgumentException
// (not Windows)ASSERT: scan-40 [

// There are 366 test cases, among which 346 expect to throw invalid utf8 characters, and 20 test cases pass the test.
import std.process

main(mainArgs: Array<String>) {
    println(mainArgs)
    println(process.Process.current.arguments)
    return 0
}
