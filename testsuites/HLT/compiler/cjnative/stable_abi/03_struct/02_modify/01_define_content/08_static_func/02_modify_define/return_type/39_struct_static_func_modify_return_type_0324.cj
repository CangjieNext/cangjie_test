/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.8.2.39
  @Scene: modify
  @Visibility: non public
  @Object: struct static func
  @Behavior: modify return type: sub type -> parent type & struct/interface
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Modified static variables' type for struct visible outside the module. The two types are compatible only when both are classes or interfaces types.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: modify type
// B是A的子类型，A is interface & B is struct
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
    public static let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public static let a3 : Addable = Subtractable()
    public static let a4 : Addable = Subtractable()
    
    public static func f1() {
        return a1
    }
    
    const static func f2() {
        return a2
    }
    public const static func f22() {
        return f2()
    }
    
    static func f3() {
        return a3
    }
    @Frozen
    public static func f33() {
        return f3()
    }
    
    static func f4() {
        return a4
    }
}

struct S2 {
    public static let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public static let a3 : Addable = Subtractable()
    public static let a4 : Addable = Subtractable()
    
    public static func f1() {
        return a1
    }
    
    const static func f2() {
        return a2
    }
    public const static func f22() {
        return f2()
    }
    
    static func f3() {
        return a3
    }
    @Frozen
    public static func f33() {
        return f3()
    }
    
    static func f4() {
        return a4
    }
}

public struct S22 {
    let s2 = S2()
}

struct S3 {
    public static let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public static let a3 : Addable = Subtractable()
    public static let a4 : Multiplicable = Multiplicable()
    
    public static func f1() {
        return a1
    }
    
    const static func f2() {
        return a2
    }
    public const static func f22() {
        return f2()
    }
    
    static func f3() {
        return a3
    }
    @Frozen
    public static func f33() {
        return f3()
    }
    
    static func f4() {
        return a4
    }
}

public struct S33 {
    @Frozen
    public static func f() {
        let s3 = S3()
    }
}

struct S4 {
    const init() {}
    public static let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public static let a3 : Addable = Subtractable()
    public static let a4 : Addable = Subtractable()
    
    public static func f1() {
        return a1
    }
    
    const static func f2() {
        return a2
    }
    public const static func f22() {
        return f2()
    }
    
    static func f3() {
        return a3
    }
    @Frozen
    public static func f33() {
        return f3()
    }
    
    static func f4() {
        return a4
    }
}

public struct S44 {
    const init() {}
    public const static func f() {
        let s4 = S4()
    }
}

struct S5 {
    public static let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public static let a3 : Addable = Subtractable()
    public static let a4 : Addable = Subtractable()
    
    public static func f1() {
        return a1
    }
    
    const static func f2() {
        return a2
    }
    public const static func f22() {
        return f2()
    }
    
    static func f3() {
        return a3
    }
    @Frozen
    public static func f33() {
        return f3()
    }
    
    static func f4() {
        return a4
    }
}

public func check(){
    return 0
}