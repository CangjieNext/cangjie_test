/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.8.2.2
  @Scene: add
  @Visibility: public
  @Object: enum instance func
  @Behavior: add @Deprecated, strict: true
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed member function's annotation of enum visible outside the module. Deprecated strict added.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test enum: add @Deprecate with public member function: Unavailable
package test_stable_abi


public enum Rectangle {
    | Red | Green | Blue(UInt8)

    @Deprecated["this function is deprecated", strict: true]
    public func getWidth(): Int64{
        return 11
    }
    func geta1() {
        return 0
    }

    public func geta2() {
        return 1
    }

    @Deprecated["this function is deprecated", strict: false]
    func geta3() {
        return 2
    }

    @Deprecated["this function is deprecated", strict: false]
    public func geta4() {
        return 3
    }

    @Deprecated["this function is deprecated", strict: true]
    public func geta5() {
        return 4
    }

    @Frozen
    public func get5() {
        let x = geta1()
        return x
    }

    @Frozen
    public func get6() {
        let x = geta3()
        return x
    }
}

