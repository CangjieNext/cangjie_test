/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.10.2.41
  @Scene: modify
  @Visibility: public
  @Object: struct instance func
  @Behavior: modify public function return type:parent -> sub  A or B  class or interface
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: modify type
// B是A的子类型，且B为interface，A为class
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

public struct Rectangle {
    let width = 10
    let a1: I = Subtractable()

    public func getWidth(): Int64 {
        return width
    }

    public func geta(): I {
        return a1
    }

    public func getb(): I {
        let a2: I = Subtractable()
        return a2
    }

    public func getc(): Subtractable {
        let a3: Subtractable = Subtractable()
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

    public func geta1(): Int16 {
        return 1
    }

    func geta2(): Int16 {
        return 1
    }

    @Frozen
    public func geta3() {
        return geta2()
    }
}
