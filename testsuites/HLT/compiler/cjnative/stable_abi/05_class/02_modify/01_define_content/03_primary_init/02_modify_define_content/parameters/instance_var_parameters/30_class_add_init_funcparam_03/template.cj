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
    }
    public Public_PC(a: Int64) {
        this.v1 = a
    }
}

public class Public_PC2 {
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
    }

    protected Protected_PC(a: Int64) {
        this.v1 = a
    }
}

public class Protected_PC2 {
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
    }

    internal Internal_PC(a: Int64) {
        this.v1 = a
    }
}

public class Internal_PC2 {
    public var v2: Int64 = 1
    public init() {
    }
}

open class Private_PC {
    public var v1: Int64 = 1
    public init() {
    }

    private Private_PC(a: Int64) {
        this.v1 = a
    }
}

public class Private_PC2 {
    public var v2: Int64 = 1
    public init() {
    }
}

open class Const_PC {
    public let v1: Int64
    const Const_PC(a: Int64) {
        this.v1 = a
    }
    public const func f1() {
        let class1 = Const_PC(1)
        class1
    }
}

public class Const_PC2 {
    let v2: Int64
    public init(a: Int64) {
        this.v2 = a
    }
    const Const_PC2() {
        this.v2 = 2
    }
}

open class Rely_Frozen_PC {
    var v1 = 1
    public init() {
    }
    Rely_Frozen_PC(a: Int64) {
    }
    @Frozen
    public func f2() {
        let class1 = Rely_Frozen_PC(1)
        class1
    }
}

public class Rely_Frozen_PC2 {
    var v2 = 0
    public init(a: Int64) {
        this.v2 = a
    }
    Rely_Frozen_PC2() {
    }
}

public class Frozen_PC {
    public var v1 = 0
    @Frozen
    public Frozen_PC(a: Int64) {
        this.v1 = a
    }
}

