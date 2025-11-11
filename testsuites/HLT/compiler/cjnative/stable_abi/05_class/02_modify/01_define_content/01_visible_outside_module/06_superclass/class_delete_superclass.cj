/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.6
  @Scene: modify
  @Visibility: public
  @Object: class
  @Behavior: class delete super class
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
// ASSERT: scan-1 [API/ABI] Deleted superclasses that class inherited.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: super class
public open class Father1 {}

public open class Father2 {}

public class Son1 {
    public func f1() {
        100
    }
}

public class Son2 {
    public func f2() {
        1001
    }
}

public func checker(): Int64 {
    let f1 = Father1()
    let f2 = Father2()
    let c1 = Son1()
    let c2 = Son2()

    if (c1.f1() == 100 && c2.f2() == 1001) {
    } else {
        return 1
    }
    0
}
