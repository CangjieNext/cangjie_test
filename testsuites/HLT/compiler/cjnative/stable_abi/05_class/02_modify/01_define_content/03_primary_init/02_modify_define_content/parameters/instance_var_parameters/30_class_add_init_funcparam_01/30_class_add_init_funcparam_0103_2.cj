/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.3.2.30
  @Scene: modify
  @Visibility: public class and non public/protected primary_init
  @Object: class primary_init
  @Behavior: add instancemember funcparam
  @Expect: api compatible & abi compatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: constructors--Primary Constructors
open public class Father {}
public class Son <: Father {}

public class Public_PC {
    public var v1: Int64 = 1
    public init() {
    }
    public Public_PC(a: Int64) {
        this.v1 = a
    }
}
public class Protected_PC {
    public var v1: Int64 = 1
    public init() {
    }

    protected Protected_PC(a: Int64) {
        this.v1 = a
    }
}
public class Internal_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2
    }

    internal Internal_PC(a: Int64, public var b!: Int64 = 2) {
        this.v1 = a
    }
}
public class Private_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2
    }

    private Private_PC(a: Int64, public var b!: Int64 = 2) {
        this.v1 = a
    }
}

public class Const_PC {
    public let v1: Int64
    const Const_PC(a: Int64) {
        this.v1 = a
    }
}

public const func global1() {
    let class1 = Const_PC(1)
    class1
}

public class Rely_Frozen_PC {
    var v1 = 1
    public init() {
    }
    Rely_Frozen_PC(a: Int64) {
    }
}

@Frozen
public func global2() {
    let class1 = Rely_Frozen_PC(1)
    class1
}

public class Frozen_PC {
    public var v1 = 0
    @Frozen
    public Frozen_PC(a: Int64) {
        this.v1 = a
    }
}