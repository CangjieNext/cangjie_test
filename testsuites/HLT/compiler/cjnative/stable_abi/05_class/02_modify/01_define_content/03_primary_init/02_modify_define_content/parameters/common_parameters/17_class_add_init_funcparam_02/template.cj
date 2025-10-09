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

public class Public_PC {
    public var v1: Int64 = 1
    public Public_PC() {
    }

    public init(a: Int64) {
        this.v1 = a
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
    }

    internal Internal_PC(a: Int64) {
        this.v1 = a
    }
}

public class Internal_PC1 <: Internal_PC {
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

public class Private_PC1 <: Private_PC {
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

public class Const_PC3 <: Const_PC {
    let v2: Int64
    public init(a: Int64) {
        super(1)
        this.v2 = a
    }
    const Const_PC3() {
        super(1)
        this.v2 = 2
    }
}

open class Rely_Frozen_PC {
    var v1 = 0
    public init(a: Int64) {
        this.v1 = a
    }
    Rely_Frozen_PC() {
    }
    @Frozen
    public func f2() {
        let class1 = Rely_Frozen_PC()
        class1
    }
}

public class Rely_Frozen_PC2 <: Rely_Frozen_PC {
    var v2 = 0
    public init(a: Int64) {
        this.v2 = a
    }
    Rely_Frozen_PC2() {
    }
}

public class Deprecated_PC1 {
    public let v1: Int64
    @Deprecated["This Init will be deprecated soon"]
    public Deprecated_PC1(a: Int64) {
        this.v1 = a
    }
}
public class Deprecated_PC2 {
    public let v1: Int64
    @Deprecated["This Init is deprecated", strict: true]
    public Deprecated_PC2(a: Int64) {
        this.v1 = a
    }
}

public class Frozen_PC {
    public var v1 = 0
    @Frozen
    public Frozen_PC(a: Int64) {
        this.v1 = a
    }
}

open class Const_PC1 {
    public let v1: Int64
    public const init() {
        this.v1 = 1
    }
    public const Const_PC1(a: Int64) {
        this.v1 = a
    }
}

public class Const_PC2 <: Const_PC1 {
    public let v2: Int64
    public const Const_PC2(a: Int64) {
        this.v2 = a
    }
}

open class Param_PC1 {
    public init() {
        this.d = 1
        this.e = 2
    }
    public Param_PC1(a: Int64, b!: Int64, c!: Int64 = 1, public var d!: Int64 = 2, private var e!: Int64 = 3) {
    }
}

public class Param_PC2 <: Param_PC1 {
    public Param_PC2(a: Int64) {
        super()
    }
}

