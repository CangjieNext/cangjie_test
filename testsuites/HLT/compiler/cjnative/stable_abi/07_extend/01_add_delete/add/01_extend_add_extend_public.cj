/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 7.1.1
  @Scene: add
  @Visibility: public
  @Object: extend
  @Behavior: add extend
  @Expect: api compatible & abi compatible
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

// test extend: add extend
public interface I1 {
    func f1(): Int64
    func f2() {
        2
    }
}

private interface I2 {}

public open class C1 {}

public class C2 {
    public const init() {}
}

public open class C3<T, U> where T <: ToString {}

public class C4 <: C1 {}

public class C5<T, U> <: C3<T, U> where T <: ToString {}

public struct S1 {}

public struct S2<T, U> where U <: C1 {}

extend C1 {
    public func f_c1() {
        1
    }
}

extend C2 {
    public func f_c2() {
        2
    }
}

extend<T, U> C3<T, U> {
    public func f_c3() {
        3
    }
}

extend C4 {
    public func f_c4() {
        4
    }
}

extend C5<Int64, I1> {
    public func f_c5() {
        5
    }
}

extend S1 {
    public func f_s1() {
        1
    }
}

extend<X, Y> S2<X, Y> {
    public func f_s2() {
        2
    }
}
/*-------------------------------*/

extend C1 {
    public func f__c1() {
        1
    }
}

extend C2 {
    public func f__c2() {
        2
    }
}

extend<X, Y> C3<X, Y> {
    public func f__c3() {
        3
    }
}

extend C4 {
    public func f__c4() {
        4
    }
}

extend C5<Int64, Int64> {
    public func f__c5() {
        5
    }
}

extend S1 {
    public func f__s1() {
        1
    }
}

extend<A, B> S2<A, B> {
    public func f__s2() {
        2
    }
}

/*----------------*/
extend Array<UInt64> {
    public func test_ABI_add_extend_1() {
        1
    }
}

extend Array<Int64> {
    func test_ABI_add_extend_2() {
        1
    }
}

extend<T> Array<T> {
    public func test_ABI_add_extend_3() {
        1
    }
}

/*---------------------------*/
extend<T> Array<T> where T <: I2 {
    public func unexported_foo1() {
        1
    }
}

extend C5<Int64, I2> {
    public func unexported_foo2() {
        5
    }
}
