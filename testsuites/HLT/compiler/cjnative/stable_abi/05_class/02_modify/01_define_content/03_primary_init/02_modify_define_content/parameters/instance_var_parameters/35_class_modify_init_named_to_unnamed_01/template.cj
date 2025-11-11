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
open public class Father {
    const init(){}
}
public class Son <: Father {
    const init(){}
}

public class Public_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }
    public Public_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}
public class Protected_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }

    protected Protected_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}
public class Internal_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }

    internal Internal_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}
public class Private_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }

    private Private_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}

public class Const_PC {
    public let v1: Int64
    public init() {
        this.v1 = 1
        b = Son()
        c = Son()
    }
    const Const_PC(a: Int64, public let b: Son, public let c!: Father) {
        this.v1 = a
    }
}

public const func global1() {
    let class1 = Const_PC(1, Son(), c:Father())
    class1
}

public class Frozen_PC {
    public var v1 = 1
    public init() {
        b = Son()
        c = Son()
    }
    Frozen_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}

@Frozen
public func global2() {
    let class1 = Frozen_PC(1, Son(), c:Father())
    class1
}

