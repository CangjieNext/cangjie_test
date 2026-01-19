/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.10.2.36
  @Scene: modify
  @Visibility: used in public const declare
  @Object: struct instance func
  @Behavior: modify function parameter type: sub -> parent
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Changed parameter type of function visible outside the module.
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-not [API]
// ASSERT: scan-2 [ABI]
// ASSERT: scan-not [API/ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: modify function parameter type: sub -> parent
package test_stable_abi

public struct Rectangle {
    let width = 10
    public func getWidth(): Int64{
        return width
    }
}

open public class A {const init() {}}
public class B <: A {const init() {}}
public class C <: A {const init() {}}

public struct S1 {
    const init() {}
    public func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    @Frozen
    public func f33() {
        return f3(1.1, B(), c:1, d:3)
    }

    func f4(a:Float64, b:B, c!:Int64, d!:Int64 = 4) {
        return a
    }
}

struct S2 {
    const init() {}
    public func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const func f2(a:Float64, b:A, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    @Frozen
    public func f33() {
        return f3(1.1, B(), c:1, d:3)
    }

    func f4(a:Float64, b:B, c!:Int64, d!:Int64 = 4) {
        return a
    }
}

public struct S22 {
    let s2 = S2()
}

struct S3 {
    const init() {}
    public func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    @Frozen
    public func f33() {
        return f3(1.1, B(), c:1, d:3)
    }

    func f4(a:Float64, b:B, c!:Int64, d!:Int64 = 4) {
        return a
    }
}

public struct S33 {
    @Frozen
    public func f() {
        let s3 = S3()
    }
}

struct S4 {
    const init() {}
    public func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    @Frozen
    public func f33() {
        return f3(1.1, B(), c:1, d:3)
    }

    func f4(a:Float64, b:B, c!:Int64, d!:Int64 = 4) {
        return a
    }
}

public struct S44 {
    const init() {}
    public const func f() {
        let s4 = S4()
    }
}

struct S5 {
    const init() {}
    public func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    @Frozen
    public func f33() {
        return f3(1.1, B(), c:1, d:3)
    }

    func f4(a:Float64, b:B, c!:Int64, d!:Int64 = 4) {
        return a
    }
}