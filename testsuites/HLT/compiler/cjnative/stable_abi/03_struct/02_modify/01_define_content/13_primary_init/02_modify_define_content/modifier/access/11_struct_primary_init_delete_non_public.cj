/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.13.2.11
  @Scene: modify
  @Visibility: non public
  @Object: struct primary init
  @Behavior: modifier: keep non public
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
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

public struct S {
    public var a = 1
    public let width = 10

    public S(b: Int64, let height: Int64) {
        a = b
    }

    public func getWidth(): Int64 {
        return width
    }
}

public struct S2 {
    public var a = 1

    public S2(b: Int64, let height: Int64) {
        a = b
    }
}

public struct S3 {
    public var a = 1
    
    public S3(b: Int64, let height: Int64) {
        a = b
    }
}

public struct S4 {
    public var a = 1
    S4(b: Int64, let height: Int64) {
        a = b
    }
}

public struct S5 {
    public var a = 1
    
    S5(b: Int64, let height: Int64) {
        a = b
    }
}

public struct S6 {
    public var a = 1
    
    S6(b: Int64, let height: Int64) {
        a = b
    }
}

public struct S7 {
    public var a = 1
    
    S7(b: Int64, let height: Int64) {
        a = b
    }
}