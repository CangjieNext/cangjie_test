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
  @Behavior: modify function return type:parent -> sub, B is struct
  @Expect: api compatible & abi incompatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Changed return type of function visible outside the module. The two types are compatible only when both are classes or interfaces types.
// ASSERT: scan-1 [ABI] Change the initial value of member variable when struct/class has the const variable or @Frozen init func.
// ASSERT: scan-1 [API/ABI] Modified member variables' type for struct visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-2 [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: modify type
// B是A的子类型，且B为struct类型
package test_stable_abi

public struct Rectangle {
    let width = 10
    public func getWidth(): Int64{
        return width
    }
}

public interface I {}
public interface Addable <: I {}
public open class Subtractable <: Addable {const init() {}}
public struct Multiplicable <: Addable {const init() {}}

public struct S1 {
    const init() {}
    public let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public let a3 : Addable = Subtractable()
    public let a4 : Addable = Subtractable()
    
    public func f1() {
        return a1
    }
    
    const func f2() {
        return a2
    }
    public const func f22() {
        return f2()
    }
    
    func f3() {
        return a3
    }
    @Frozen
    public func f33() {
        return f3()
    }
    
    func f4() {
        return a4
    }
}

struct S2 {
    const init() {}
    public let a1 : Multiplicable = Multiplicable()
    public static const a2 : Addable = Subtractable()
    public let a3 : Addable = Subtractable()
    public let a4 : Addable = Subtractable()
    
    public func f1() {
        return a1
    }
    
    const func f2() {
        return a2
    }
    public const func f22() {
        return f2()
    }
    
    func f3() {
        return a3
    }
    @Frozen
    public func f33() {
        return f3()
    }
    
    func f4() {
        return a4
    }
}

public struct S22 {
    let s2 = S2()
}

struct S3 {
    const init() {}
    public let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public let a3 : Addable = Subtractable()
    public let a4 : Addable = Subtractable()
    
    public func f1() {
        return a1
    }
    
    const func f2() {
        return a2
    }
    public const func f22() {
        return f2()
    }
    
    func f3() {
        return a3
    }
    @Frozen
    public func f33() {
        return f3()
    }
    
    func f4() {
        return a4
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
    public let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public let a3 : Addable = Subtractable()
    public let a4 : Addable = Subtractable()
    
    public func f1() {
        return a1
    }
    
    const func f2() {
        return a2
    }
    public const func f22() {
        return f2()
    }
    
    func f3() {
        return a3
    }
    @Frozen
    public func f33() {
        return f3()
    }
    
    func f4() {
        return a4
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
    public let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public let a3 : Addable = Subtractable()
    public let a4 : Addable = Subtractable()
    
    public func f1() {
        return a1
    }
    
    const func f2() {
        return a2
    }
    public const func f22() {
        return f2()
    }
    
    func f3() {
        return a3
    }
    @Frozen
    public func f33() {
        return f3()
    }
    
    func f4() {
        return a4
    }
}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    assert(S1().f1() is Addable, true)
    assert(S1().f2() is Addable, true)
    assert(S1().f3() is Addable, true)
    assert(S1().f4() is Addable, true)

    assert(S2().f1() is Multiplicable, true)
    assert(S2().f2() is Addable, true)
    assert(S2().f3() is Addable, true)
    assert(S2().f4() is Addable, true)

    assert(S3().f1() is Addable, true)
    assert(S3().f2() is Addable, true)
    assert(S3().f3() is Addable, true)
    assert(S3().f4() is Addable, true)

    assert(S4().f1() is Addable, true)
    assert(S4().f2() is Addable, true)
    assert(S4().f3() is Addable, true)
    assert(S4().f4() is Addable, true)

    assert(S5().f1() is Addable, true)
    assert(S5().f2() is Addable, true)
    assert(S5().f3() is Addable, true)
    assert(S5().f4() is Addable, true)
    return 0
}