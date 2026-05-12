/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.3.4
  @Scene: modify
  @Visibility: public
  @Object: class
  @Behavior: class add open modifier 
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: open/sealed modifier

open public class A {}

open public class B {}

public abstract class C0 {}

sealed abstract public class D0 {}

public class C <: C0 {}

public class D <: D0 {}

sealed abstract class E0 {}

public class E <: E0 {}

open public class F0 {}

class F <: F0 {}

open class G0 {}

public class G <: G0 {}

open abstract public class H0 {}

class H <: H0 {}

open abstract class I0 {}

public class I <: I0 {}

public func checker(): Int64 {
    A()
    B()
    C()
    D()
    E()
    F0()
    F()
    G0()
    G()
    H()
    I()
    0
}