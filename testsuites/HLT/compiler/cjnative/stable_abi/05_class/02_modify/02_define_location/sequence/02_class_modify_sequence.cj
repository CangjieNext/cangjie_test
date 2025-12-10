/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.3.2
  @Scene: modify
  @Visibility: public
  @Object: class
  @Behavior: modify class order
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
// DEPENDENCE: ./main.cj, ./template.cj
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

// test class: class order

public class GGrandSon<T> <: GSon<T> {}
public class GrandSon <: Son {}
protected class GC2<T> {}
internal class GC3<T> {}
class GC4<T> {}
open public class Son <: Father {}
open public class GSon<T> <: GFather<T> {}
open public class Father {}
public class C1 {}
protected class C2 {}
private class GC5<T> {}
private class C5 {}
internal class C3 {}
class C4 {}
public class GC1<T> {}
open public class GFather<T> {}
