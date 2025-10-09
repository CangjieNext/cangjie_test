/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.1.2
  @Scene: delete
  @Visibility: public
  @Object: extend
  @Behavior: delete unexported extend
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

// test extend: delete extend-exported/unexported
private interface I1 {}
internal interface I2 {}
protected interface I3 {}
public interface I4 {}

extend Int64 <: I4 {
    public func foo3() {
        3
    }
}

public class Foo<T> {}

extend<T> Foo<T> where T <: I1 {
    public func f1() {}
}

extend<T> Foo<T> where T <: I2 {
    public func f2() {}
}

extend<T> Foo<T> where T <: I3 {
    public func f3() {}
}

extend<T> Foo<T> where T <: I4 {
    public func f4() {
        4
    } // exported
}

extend<T> Foo<T> where T <: I3 & I4 {
    public func f5() {
        5
    }
}

public struct SS<T> {}

extend<T> SS<T> where T <: I1 {
    public func f1() {}
}

extend<T> SS<T> where T <: I2 {
    public func f2() {}
}

extend<T> SS<T> where T <: I3 {
    public func f3() {}
}

extend<T> SS<T> where T <: I4 {
    public func f4() {
        4
    } // exported
}

extend<T> SS<T> where T <: I3 & I4 {
    public func f5() {}
}