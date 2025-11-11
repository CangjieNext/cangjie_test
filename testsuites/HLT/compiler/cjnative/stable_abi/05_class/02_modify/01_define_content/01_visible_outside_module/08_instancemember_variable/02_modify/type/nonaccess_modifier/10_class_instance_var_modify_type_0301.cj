/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.8.3.10
  @Scene: modify
  @Visibility: private/internal
  @Object: class instance var
  @Behavior: modify the type of variable
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
 
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: staticmember variable
open public class Father {
    const init() {}
}

public class Son <: Father {
    const init() {}
}

public class CC {
    private let a1: Int8 = 1
    private var a2: Int32 = 2

    internal let c1: Int8 = 1
    internal var c2: Int32 = 2
}

open class baseClass {
    private let a1: Int8 = 1
    private var a2: Int32 = 2

    internal let c1: Int8 = 1
    internal var c2: Int32 = 2
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    private let a1: Int64 = 1
    private var a2: Int64 = 2

    internal let c1: Int64 = 1
    internal var c2: Int64 = 2
}
