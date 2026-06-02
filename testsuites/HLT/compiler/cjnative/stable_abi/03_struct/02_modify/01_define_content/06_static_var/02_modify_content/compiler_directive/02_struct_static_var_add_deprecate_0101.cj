/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.6.2.2
  @Scene: add
  @Visibility: public
  @Object: struct static var
  @Behavior: add @Deprecated，strict: true
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Struct member added variable deprecated annotation with compilation error.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: add @Deprecated
// 基于 @Deprecated 的参数条件，当前struct在下游模块中不可用
package test_stable_abi


public struct Rectangle {
    static let width = 10
    static let a1 = 20
    static public let a2 = 20
    @Deprecated["this value is deprecated", strict: false] static let a3 = 20
    @Deprecated["this value is deprecated", strict: false] static public let a4 = 20
    @Deprecated["this value is deprecated", strict: true] static public let a5 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle1 {
    static let width = 10
    @Deprecated["this value is deprecated", strict: true] static public let a6 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle2 {
    static let width = 10
    static const a7 = 20

    static const init() {
        let degree = 180
    }

    public const func getWidth(): Int64{
        return a7
    }
}

public struct Rectangle3 {
    static let width = 10
    @Deprecated["this value is deprecated", strict: false] static public let a8 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle4 {
    static let width = 10
    @Deprecated["this value is deprecated", strict: false] static const a9 = 20

    static const init() {
        let degree = 180
    }

    public const func getWidth(): Int64{
        return a9
    }
}

public struct Rectangle5 {
    static let width = 10
    @Deprecated["this value is deprecated", strict: true] static const a9 = 20
    @Deprecated["this value is deprecated", strict: true] static const a10 = 202

    static const init() {
        let degree = 180
    }

    @Deprecated["this value is deprecated", strict: true]
    public const func getWidth(): Int64{
        return a9
    }
}

public func f(){
    return 0
}