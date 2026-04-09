// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Android) EXEC: %compiler %cmp_opt %f -o %output
// (Android) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: scan NegativeArraySizeException: test an Exception!
// ASSERT: regex at default::test\(\)\(.*/excepetion_handle_on_android\.cj:16\)
// ASSERT: regex at default::main\(\)\(.*/excepetion_handle_on_android\.cj\:20\)
// ASSERT: scan-not this will not be printed
          
func test() {
   throw NegativeArraySizeException("test an Exception!")
}

main(): Int64 {
    test()
    println("this will not be printed")
    return 0
}
