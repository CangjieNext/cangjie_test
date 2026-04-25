// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (host_mac & target_android) EXEC: %compiler %cmp_opt %f -o %output
// (host_mac & target_android) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: scan Exception
// ASSERT: regex at default::B::init\(\)\(.*/uncaught_excepetion_handle_on_android_004\.cj:15\)
// ASSERT: regex at default::B::test\(\)\(.*/uncaught_excepetion_handle_on_android_004\.cj:18\)
// ASSERT: regex at default::main\(\)\(.*/uncaught_excepetion_handle_on_android_004\.cj\:23\)
// ASSERT: scan-not this will not be printed
          
class A <: Exception {}

class B {
    public func test(input!: Int64 = throw A()):Unit {
    }
}

main() {
    B().test()
    println("this will not be printed")
    return 0
}
