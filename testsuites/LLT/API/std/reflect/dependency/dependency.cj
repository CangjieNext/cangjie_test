/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package module0.a.b.c

// numeric types
// Signed integer types
// Int8
public let i8_0 = 12i8
public let i8_1 = -128i8
public let i8_2 = 127i8
// Int16
public let i16_0 = 2012i16
// Int32
public let i32_0 = 2012i32
// Int64
public let i64_0 = 2012
// IntNative
public let in_0: IntNative = 2012
public var int_0 = 2012

// Unsigned integer types
// UInt8
public let u8_0 = 12u8
// UInt16
public let u16_0 = 2012u16
// UInt32
public let u32_0 = 2012u32
// UInt64
public let u64_0 = 2012u64
// UIntNative
public let un_0: UIntNative = 12
public var uint_0 = 2012u64

// float
public let f16_0 = 1.2f16
public let f32_0 = 1.2f32
public let f64_0 = 1.2
public var float_0 = 1.2

// bool
public let b_0 = false
public let b_1 = true
public var b_2 = true

// char
public let c_0 = 'a'
public let c_1 = '\\'
public let c_2 = '\b'
public let c_3 = '\u{4f60}'
public let c_4 = '\u{597d}'
public var c_5 = 'b'

// Unit
public let u: Unit = ()

// String
public let s_0: String = ""
public let s_1: String = "abc"
public let s_2: String = """
Hello
World
"""
public let s_3: String = "def"

public class C0 {}

public open class C1 {
    public var c2_pimv0 = "cangjie"
    public let c2_pimc0 = 12
    public static var c2_psmv0 = "Hello World"
    public static let c2_psmc0 = 13

    public init() {}
    public init(p0: Int64) {}
    public init(p0: Bool, p1: Rune) {}

    public open func poimf0(): Int16 {
        12
    }
    public open func poimf1(): Int16 {
        12
    }

    public func pimf0(): Int16 {
        12
    }
    public func pimf1(): Int16 {
        12
    }

    public static func psmf0(): Int16 {
        12
    }
    public static func psmf1(): Int16 {
        12
    }
}

public abstract sealed open class C2 {
    public var c2_pimv0 = "cangjie"
    public let c2_pimc0 = 12
    public static var c2_psmv0 = "Hello World"
    public static let c2_psmc0 = 13

    public func paimf0(): Int16
    // public func paimf1(p0: Int8, p1: E1): Int32

    public open func poaimf0(): Int16
    public open func poaimf1(): Int16

    public open func poimf0(): Int16 {
        12
    }
    public open func poimf1(): Int16 {
        12
    }

    public func pimf0(): Int16 {
        12
    }
    public func pimf1(): Int16 {
        12
    }

    public static func psmf0(): Int16 {
        12
    }
    public static func psmf1(): Int16 {
        12
    }
}

public open class C3 <: C1 {
    public var c3_pimv0 = "cangjie"
    public let c3_pimc0 = 12
    public static var c3_psmv0 = "Hello World"
    public static let c3_psmc0 = 13

    public init() {}
    public init(p0: Int64) {}
    public init(p0: Float32) {}
    public init(p0: Float64) {}
    public open func poimf2(): Int16 {
        12
    }
}

public abstract open class C4 {
    public var c4_pimv0 = "cangjie"
    public let c4_pimc0 = 12
    public static var c4_psmv0 = "Hello World"
    public static let c4_psmc0 = 13

    public init() {}
    public init(p0: Int64) {}
    public init(p0: Bool, p1: Rune) {}

    public func paimf0(): Int16
    // public func paimf1(p0: Int8, p1: E1): Int32

    public open func poaimf0(): Int16
    public open func poaimf1(): Int16

    public open func poimf0(): Int16 {
        12
    }
    public open func poimf1(): Int16 {
        12
    }

    public func pimf0(): Int16 {
        12
    }
    public func pimf1(): Int16 {
        12
    }

    public static func psmf0(): Int16 {
        12
    }
    public static func psmf1(): Int16 {
        12
    }
}

public abstract class C5 {
    public var c5_pimv0 = "cangjie"
    public let c5_pimc0 = 12
    public static var c5_psmv0 = "Hello World"
    public static let c5_psmc0 = 13

    public func paimf0(): Int16
    // public func paimf1(p0: Int8, p1: E1): Int32

    public open func poaimf0(): Int16
    public open func poaimf1(): Int16

    public open func poimf0(): Int16 {
        12
    }
    public open func poimf1(): Int16 {
        12
    }

    public func pimf0(): Int16 {
        12
    }
    public func pimf1(): Int16 {
        12
    }

    public static func psmf0(): Int16 {
        12
    }
    public static func psmf1(): Int16 {
        12
    }
}

public class C6 {
    var mv0: String = "_mv0_"
    // var mv1: E1 = E1.A2

    public prop prmp0: String {
        get() {
            mv0
        }
    }

    public init() {
    }

    public init(mv0: String) {
        this.mv0 = mv0
    }
}

public class C7 {
    public static var gsmv0 = "cangjie"
    public static var gsmv1 = 1
    public static var gsmv2 = C0()
    public static let gsmc0 = 2
    public static let gsmc1 = "Hello World"
    public static let gsmc2 = C1()

    protected static var bsmv0 = 1
    protected static var bsmv1 = 1

    private static var ssmv0 = 1
    private static var ssmv1 = 1

    static var qsmv0 = 1
    static var qsmv1 = 1

    public var pimv0 = 1
    public var pimv1 = "white"
    public let pimv2 = 1
    public let pimv3 = "white"

    var imv0 = 100
    var imv1 = 100

    public init() {
        pimv0 = 2
    }
    public init(pimv0: Int64) {
        this.pimv0 = pimv0
    }
    public init(pimv0: Int64, pimv1: String) {
        this.pimv0 = pimv0
        this.pimv1 = pimv1
    }

    public static func psmf0(): Int16 {
        12
    }
    public static func psmf1(p1: Int64, p2: Bool): Int64 {
        if (p1 == 1) {
            1
        } else {
            2
        }
    }
    public static func psmf2(): Bool {
        true
    }

    protected static func bsmf0(): Int16 {
        12
    }

    private static func ssmf0(): Int16 {
        12
    }

    static func qsmf0(): Int16 {
        12
    }

    public func pimf0(): Int16 {
        12
    }
    public func pimf1(p0: Int64): Int64 {
        if (p0 < 100) {
            1
        } else {
            2
        }
    }

    protected func bimf0(): Int16 {
        12
    }

    private func simf0(): Int16 {
        12
    }

    func qimf0(): Int16 {
        12
    }

    public prop girmp0: Int8 {
        get() {
            1
        }
    }

    protected prop birmp0: Int8 {
        get() {
            1
        }
    }

    public mut static prop pmsmp0: String {
        get() {
            gsmv0
        }
        set(v) {
            gsmv0 = v
        }
    }

    public mut prop pmmp0: Int64 {
        get() {
            pimv0
        }
        set(v) {
            pimv0 = v
        }
    }
    public mut prop pmmp1: Int64 {
        get() {
            imv0
        }
        set(v) {
            imv0 = v
        }
    }
}

public class C8 <: I1 {
    var mv0: Int8 = 2
    var mv1: Int8 = 3
    var mc0: String = "kiki"
    var mc1: String = "do you love me"

    public func imf0(): Int16 {
        12
    }
    public func imf1(p0: Int64, p1: Bool): Int16 {
        12
    }

    public func oimf0(): Int16 {
        12
    }
    public func oimf1(p0: Bool, p1: Int64): Int16 {
        12
    }

    public static func smf0(): Int16 {
        12
    }
    public static func smf1(p0: Int64, p1: Bool): Int16 {
        12
    }
    public static func osmf0(): Int16 {
        12
    }
    public static func osmf1(p0: Rune, p1: Float64): Int16 {
        12
    }

    public mut prop mmp0: Int8 {
        get() {
            mv0
        }
        set(v) {
            mv0 = v
        }
    }
    public mut prop mmp1: Int8 {
        get() {
            mv1
        }
        set(v) {
            mv1 = v
        }
    }

    public mut prop ommp0: Int8 {
        get() {
            mv0
        }
        set(v) {
            mv0 = v
        }
    }
    public mut prop ommp1: Int8 {
        get() {
            mv1
        }
        set(v) {
            mv1 = v
        }
    }

    public prop rmp0: String {
        get() {
            mc0
        }
    }
    public prop rmp1: String {
        get() {
            mc1
        }
    }

    public prop ormp0: String {
        get() {
            mc0
        }
    }
    public prop ormp1: String {
        get() {
            mc1
        }
    }
}

abstract sealed class C9 {}

public class C10 <: I3 & I4 & I5 {}

public class C11 <: C1 {}

public class C12 {
    public func a(): Int64 {
        12
    }
    public func b(p0: Bool, p1: Int16): Int8 {
        8
    }
    public func b0(p0: Int64): Int64 {
        12
    }
    public static func c(): Int64 {
        12
    }
    public static func d(p0: Int8, p1: Int16): Bool {
        true
    }
}

public abstract open class C13 {}

public interface I0 {}

public interface I1 {
    func imf0(): Int16
    func imf1(p0: Int64, p1: Bool): Int16

    open func oimf0(): Int16
    open func oimf1(p0: Bool, p1: Int64): Int16

    static func smf0(): Int16
    static func smf1(p0: Int64, p1: Bool): Int16

    static func osmf0(): Int16
    static func osmf1(p0: Rune, p1: Float64): Int16

    mut prop mmp0: Int8
    mut prop mmp1: Int8

    mut open prop ommp0: Int8
    mut open prop ommp1: Int8

    prop rmp0: String
    prop rmp1: String

    open prop ormp0: String
    open prop ormp1: String
}

sealed interface I2 {}

public interface I3 {}

public interface I4 {}

public interface I5 {}

public interface I6 <: I3 & I4 & I5 {}

sealed interface I7 <: I1 {}

sealed interface I8 <: I6 {}

sealed interface I9 <: I7 & I8 {}

public func f1(parm: Int64): Int64 {
    return parm
}

public func f2(parm: Int64): Int64 {
    return parm
}

public func f1(parm1: Int64, parm2: Int64): Int64 {
    return parm1 + parm2
}

public func f2(parm: C1): C1 {
    return parm
}
