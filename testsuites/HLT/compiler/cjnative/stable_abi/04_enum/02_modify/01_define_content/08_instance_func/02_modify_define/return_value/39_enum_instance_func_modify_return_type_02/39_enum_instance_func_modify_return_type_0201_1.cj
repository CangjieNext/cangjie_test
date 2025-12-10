/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.8.2.39
  @Scene: modify
  @Visibility: non-public enum used in class member variable and public instance func
  @Object: enum instance func
  @Behavior: modify function return type: non parent -> sub
  @Expect: api incompatible & abi incompatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed return type of function visible outside the module. The new return type is not a subtype of the old return type.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test enum: modify public function return type: non parent -> sub
package test_stable_abi


public interface I {
    func f(): Int64
}

public interface Addable <: I {
    func add(other: Int64): Int64
}

public open class Subtractable <: Addable {

    public open func add(other: Int64): Int64 {
        return 0
    }

    public open func sub(other: Int64): Int64 {
        return 0
    }

    public open func f(): Int64 {
        return 0
    }
}

public class MyInt <: Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }

    public func f(): Int64 {
        return 0
    }
}

public class A {
    let a = Rectangle.Red
}

public func testEnum() {
    let r = Rectangle.Red
    let g = Rectangle.Green
    let b = Rectangle.Blue(100)
}

enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    public func geta(): I {
        let a1: I = Subtractable()
        return a1
    }

    public func getb(): I {
        let a2: I = Subtractable()
        return a2
    }

    public func getc(): Addable {
        let a3: Addable = Subtractable()
        return a3
    }

    public func getd(): Subtractable {
        let a4 = Subtractable()
        return a4
    }

    public func gete(): Subtractable {
        let a5 = Subtractable()
        return a5
    }

    public func getf(): ToString {
        return "hello"
    }

    func getg(): ToString {
        return "hello"
    }

    @Frozen
    public func geth() {
        return getg()
    }

    func geti(): ToString {
        return "hello"
    }

    const func getj(): ToString {
        return "hello"
    }

    public const func getk() {
        return getj()
    }

    public func geta1(): Int64 {
        return 1
    }

    func geta2(): Int16 {
        return 1
    }

    @Frozen
    public func geta3() {
        return geta2()
    }

    const func geta4(): Int16 {
        return 1
    }

    public const func geta5() {
        return geta4()
    }

    func geta6(): Int16 {
        return 1
    }
}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(Red.geta() is I, true)
    assert(Red.getb() is I, true)
    assert(Red.getc() is Addable, true)
    assert(Red.getd() is Subtractable, true)
    assert(Red.gete() is Subtractable, true)
}
