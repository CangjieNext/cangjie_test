/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.5.1
  @Scene: add
  @Visibility: used in public @Frozen declare
  @Object: struct
  @Behavior: add interface 
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
package test_stable_abi


open class Base {}
public class c1 <: Base {}

interface I {
    func f(): Base
}

interface Addable {
    func add(other: Int64): Int64
}

interface Subtractable {
    func sub(other: Int64): Int64
}

interface Multiplicable {
    func mul(other: Int64): Int64
}

public struct MyInt <: Addable & Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

}


struct MyInt1 <: Addable & Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }
}

struct S2 <: Addable & Subtractable  {
    var value = 0

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

}

public struct MyInt2 <: Addable & Subtractable {
    let x = S2();
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

    public func getX(): Int64 {
        return x.value
    }

}

struct S3 <: Addable & Subtractable  {
    var value = 0
    public const init() {}

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

}

public struct MyInt3 <: Addable & Subtractable {
    let x = S3();
    var value = 0
    public const init() {}

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }


    public const func getX(): Int64 {
        return x.value
    }

}

struct S4 <: Addable & Subtractable & Multiplicable {
    var value = 0
    public const init() {}

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

    public func mul(other: Int64): Int64 {
            value * other
    }
}

public struct MyInt4 <: Addable & Subtractable {
    let x = S4();
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    
    public func sub(other: Int64): Int64 {
        value - other
    }

    @Frozen
    public func getX(): Int64 {
        return x.value
    }

}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    var s1 = MyInt()
    var s2 = MyInt1()
    var s3 = S2()
    var s4 = S3()
    var s5 = S4()

    assert(s1.add(1), 1)
    assert(s1.sub(0), 0)

    assert(s2.add(1), 1)
    assert(s2.sub(0), 0)
    
    assert(s3.add(1), 1)
    assert(s3.sub(0), 0)

    assert(s4.add(1), 1)
    assert(s4.sub(0), 0)

    assert(s5.add(1), 1)
    assert(s5.sub(0), 0)
    assert(s5.mul(2), 0)
    return 0
}