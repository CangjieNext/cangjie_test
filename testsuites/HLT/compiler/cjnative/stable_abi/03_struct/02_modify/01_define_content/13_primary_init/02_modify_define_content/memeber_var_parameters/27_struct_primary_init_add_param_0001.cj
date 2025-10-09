/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.13.2.27
  @Scene: add
  @Visibility: public
  @Object: struct primary init
  @Behavior: add memeber var parameter
  @Expect: api incompatible & abi incompatible
*/

// LEVEL: 1
// Expect: API Incompatible & ABI Incompatible
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed number of parameters of function visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI] Added member variable to a struct.
// ASSERT: scan-1 [API/ABI]
package test_stable_abi

public open class A{}
public class B <: A{}
public class C{}

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

    public S2(b: Int64, let height: Int64, let c!: Int64 = 2, let d!: Int64 = 3) {
        a = b
    }
}

public struct S3 {
    public var a = 1

    @Frozen
    public init(a: Int64, c: Int64, e!:Int64) {
        this.a = a
        this.c = c
        this.e = e
    }

    public S3(let c: Int64, let e!: Int64) {
        a = c
    }
}

public struct S4 {
    public var a = 1
    
    @Frozen
    public S4(b: Int64, let c: B, let e!: Int64 = 2) {
        a = b
    }
}

public struct S5 {
    public var a = 1
    
    public const S5(b: Int64, let c!: Float64, let e!: Int64 = 2) {
        a = b
    }
}

public struct S6 {
    public var a = 1
    
    public S6(b: Int64, let c!: Float64, let e!: Int64) {
        a = b
    }
}

public struct S7 {
    public var a = 1
    
    public S7(b: Int64, let e:Int64, public let c: Int64, public let d: Int64) {
        a = b
    }
}

public struct S8 {
    public var a = 1
    
    private S8(b: Int64, e: Int64, let c: Int64, let d: Int64) {
        a = b
    }
}