/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: constructors--Primary Constructors
open public class Father {}
public class Son <: Father {}

open class Public_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2;c = 3
    }
    public Public_PC(a: Int64, var b: Int64, public var c: Int64) {
    }
}

public class Public_PC2 <: Public_PC {
    public var v2: Int64 = 1
    public init() {
    }

    protected Public_PC2(a: Int64) {
        this.v2 = a
    }
}

open class Protected_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2;c = 3
    }

    protected Protected_PC(a: Int64, private var b: Int64, protected var c: Int64) {
        this.v1 = a
    }
}

public class Protected_PC2 <: Protected_PC {
    public var v2: Int64 = 1
    public init() {
    }

    protected Protected_PC2(a: Int64) {
        this.v2 = a
    }
}

open class Internal_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2;c = 3
    }

    internal Internal_PC(a: Int64, var b: Int64, public var c: Int64) {
        this.v1 = a
    }
}

public class Internal_PC2 <: Internal_PC {
    public var v2: Int64 = 1
    public init() {
    }
}

open class Private_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2;c = 3
    }

    private Private_PC(a: Int64, var b: Int64, public var c: Int64) {
        this.v1 = a
    }
}

public class Private_PC2 <: Private_PC {
    public var v2: Int64 = 1
    public init() {
    }
}

open class Const_PC {
    public let v1: Int64
    public const init(){
        this.v1 = 1
        b = 2;c = 3
    }
    const Const_PC(a: Int64, let b: Int64, public let c: Int64) {
        this.v1 = a
    }
    public const func f1() {
        let class1 = Const_PC(1,2,3)
        class1
    }
}

public class Const_PC2 <: Const_PC {
    public let v2: Int64 = 1
    public init() {
    }
}

open class Frozen_PC {
    public var v1 = 1
    public init() {
        b = 2;c = 3
    }
    Frozen_PC(a: Int64, var b: Int64, public var c: Int64) {
    }
    @Frozen
    public func f2() {
        let class1 = Frozen_PC(1,2,3)
        class1
    }
}

public class Frozen_PC2 <: Frozen_PC {
    public var v2 = 1
    public init() {
    }
}

