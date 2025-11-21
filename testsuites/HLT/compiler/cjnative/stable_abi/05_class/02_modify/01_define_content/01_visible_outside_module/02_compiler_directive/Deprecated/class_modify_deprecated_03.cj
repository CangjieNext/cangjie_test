/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.2
  @Scene: modify
  @Visibility: public
  @Object: class
  @Behavior: modify @Deprecated to invisible
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible
// ASSERT: scan-2 [API/ABI] Modified class deprecated annotation with compilation error.
// ASSERT: scan-2 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: @Deprecated

public class B1 {}
public class BG1<T> {}

@Deprecated["This API will be deprecated soon", strict: true]
public class C1 {}
@Deprecated["This API will be deprecated soon", strict: true]
public class CG1<T> {}

@Deprecated["This API is deprecated", strict: true]
public class D1 {}
@Deprecated["This API is deprecated", strict: true]
public class DG1<T> {}

public func checker(b1: B1, bg1: BG1<UInt64>): Int64 {
    B1()
    BG1<UInt64>()
    0
}