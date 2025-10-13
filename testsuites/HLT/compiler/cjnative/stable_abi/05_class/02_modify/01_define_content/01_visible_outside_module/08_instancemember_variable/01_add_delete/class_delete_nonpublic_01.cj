/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.8.1
  @Scene: delete
  @Visibility: non public
  @Object: class instance var
  @Behavior: delete non public/protected class instance var
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
// DEPENDENCE: ../main.cj, ../template.cj
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

// test class: instancemember variable
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public class CC {
    public let a1 = 1
    public var a2 = 2

    internal let b1 = 1
    internal var b2 = 2

    protected let c1 = 1
    protected var c2 = 2

    private let d1 = 1
    private var d2 = 2

    let e1 = 1
    var e2 = 2

    @Version["1.1"]
    public let f1 = 1
    @Version["1.1"]
    public var f2 = 2

    @Deprecated["This variable will be deprecated soon"]
    public let g1 = 1
    @Deprecated["This variable is deprecated", strict: true]
    public let g2 = 2

    let h1 = 1

    @Frozen
    public func h2() {
        h1
    }
}
