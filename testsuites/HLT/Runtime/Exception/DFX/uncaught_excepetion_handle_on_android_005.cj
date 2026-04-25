// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL: 1
// (host_mac & target_android) EXEC: %compiler %cmp_opt %f -o %output
// (host_mac & target_android) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: scan Exception
// ASSERT: regex at default::test4\(\)\(.*/uncaught_excepetion_handle_on_android_005\.cj:32\)
// ASSERT: regex at default::test3\(\)\(.*/uncaught_excepetion_handle_on_android_005\.cj:29\)
// ASSERT: regex at default::test2\(\)\(.*/uncaught_excepetion_handle_on_android_005\.cj:26\)
// ASSERT: regex at default::test1\(\)\(.*/uncaught_excepetion_handle_on_android_005\.cj:23\)
// ASSERT: regex at default::test\(\)\(.*/uncaught_excepetion_handle_on_android_005\.cj:20\)
// ASSERT: regex at default::main\(\)\(.*/uncaught_excepetion_handle_on_android_001\.cj\:37\)
// ASSERT: scan-not this will not be printed
          
func test() {
   test1()
}
func test1() {
   test2()
}
func test2() {
   test3()
}
func test3() {
   test4()
}
func test4() {
   throw NegativeArraySizeException("test an Exception!")
}


main(): Int64 {
    test()
    println("this will not be printed")
    return 0
}
