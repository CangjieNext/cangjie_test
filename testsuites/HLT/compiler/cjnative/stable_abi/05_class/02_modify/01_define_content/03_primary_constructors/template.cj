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
public open class Father {}

public class Son <: Father {}

public class Public_PC {
    public var v1: Int64 = 1
    public Public_PC() {
    }

    public init(a: Int64) {
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
    }

    internal Internal_PC(a: Int64) {
        this.v1 = a
    }
}

public class Private_PC {
    public var v1: Int64 = 1
    public init() {
    }

    private Private_PC(a: Int64) {
        this.v1 = a
    }
}

public class Rely_Frozen_PC {
    var v1 = 0
    public init(a: Int64) {
        this.v1 = a
    }
    Rely_Frozen_PC() {
    }
}

@Frozen
public func global2() {
    let class1 = Rely_Frozen_PC()
    class1
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

public class Const_PC {
    public let v1: Int64
    public const Const_PC(a: Int64) {
        this.v1 = a
    }
}

public class Generics_PC1<X, Y, Z> where X <: ToString, Y <: ToString, Z <: Son {
    public Generics_PC1(a: X, b!: Y, c!: Z) {}
}

public class Generics_PC2<X, Y, Z> where X <: ToString, Z <: Father {
    public Generics_PC2(a: X, b: Y, c: Z) {}
}

public class Param_PC1 {
    public Param_PC1(a: Int64, b!: Int64, c!: Int64 = 1, public var d!: Int64 = 2, private var e!: Int64 = 3) {
    }
}

public class Param_PC2 {
    public Param_PC2(a: Int64, internal var a0: Int64, public var d!: Int64 = 2, private var e!: Int64 = 3) {
    }
}

public class Param_PC3 {
    public Param_PC3(a: Int64, b!: Int64 = 2) {
    }

    public init(a: UInt64) {}
}

public class Param_PC5 {
    public Param_PC5(a: Son, b!: Son, c!: Son = Son(), public var d!: Son = Son()) {
    }
}

public class Param_PC6 {
    public Param_PC6(a: Father, b!: Father, c!: Father = Father(), public var d!: Father = Father()) {
    }
}
