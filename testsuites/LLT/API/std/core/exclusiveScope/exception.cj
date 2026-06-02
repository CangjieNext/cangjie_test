/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f

func testA() {
    throw Exception("this is my test exception")
}
func exception_test() {
    testA()
}

func test2() {
    test1()
}

func test1() {
    test()
}

func test() {
   exclusiveScope {
        exception_test()
   }
}
main() {
    test2()
    ()
}

// ASSERT: regex-begin ExclusiveScopeException
// ASSERT: regex-next \s+at default::test\(\)\(.*exception\.cj:28\)
// ASSERT: regex-next \s+at default::test1\(\)\(.*exception\.cj:24\)
// ASSERT: regex-next \s+at default::test2\(\)\(.*exception\.cj:20\)
// ASSERT: regex-next \s+at default::main\(\)\(.*exception\.cj:33\)
// ASSERT: regex-next Caused by: Exception: this is my test exception
// ASSERT: regex-next \s+at default::testA\(\)\(.*exception\.cj:13\)
// ASSERT: regex-next \s+at default::exception_test\(\)\(.*exception\.cj:16\)
// ASSERT: regex-next \s+at default::test::lambda\.0\(\)\(.*exception\.cj:29\)
