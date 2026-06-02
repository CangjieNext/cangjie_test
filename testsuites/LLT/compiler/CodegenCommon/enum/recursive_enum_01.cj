// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %overflowOpt %f
public var var_1702636574584_303: Unit = ()
public const var_1702636574584_1030: UInt64 = 133
var var_1702636574584_1959: Bool = true

public struct Struct_1702636574584_8 {
    public static prop var_1702636574584_998: Interface_1702636574584_209 { // block id: 999
        get() { // block id: 1001
            Class_1702636574584_203()
        }
    }
    mut prop var_1702636574584_1059: Option<(Int16, Interface_1702636574584_206, Enum_1702636574584_129, 
        Interface_1702636574584_207, Rune, Interface_1702636574584_207)> { // block id: 1060
        get() { // block id: 1062
            var_1702636574584_2405
        }
        set(Value) { // block id: 1072
            var_1702636574584_2405 = Value
        }
    }
    public static func func_1702636574584_13(): (Int64, Int16, Int8, Unit) { // block id: 17
        (50, 50, 50, ())
    }
    var var_1702636574584_2405: Option<(Int16, Interface_1702636574584_206, Enum_1702636574584_129, 
        Interface_1702636574584_207, Rune, Interface_1702636574584_207)> = Option<(Int16, Interface_1702636574584_206, 
            Enum_1702636574584_129, Interface_1702636574584_207, Rune, Interface_1702636574584_207)>.None
}

public enum Enum_1702636574584_129 {
    defaultValue
    | enumValue_1702636574584_134((Int64, Int16, Int8, Unit))
    | enumValue_1702636574584_495(UInt64, Struct_1702636574584_8)
    | enumValue_1702636574584_1199(Option<Array<UInt64>>, Int32)
}

public sealed interface Interface_1702636574584_208 {}

public interface Interface_1702636574584_209 <: Interface_1702636574584_208 {}

public interface Interface_1702636574584_207 <: Interface_1702636574584_208 & Interface_1702636574584_209 {
    func func_1702636574584_680(namedParam_1702636574584_681!: String): Range<UInt8> { // block id: 682
        ((UInt8(UInt8(245)) & 127)..(UInt8(UInt8(89)) & 127) : (Int64(115) | 1))
    }
    func func_1702636574584_680(param_1702636574584_698: UInt64, param_1702636574584_699: Int16,
        namedParam_1702636574584_700!: Int8): (Enum_1702636574584_688, Enum_1702636574584_688, Range<Int32>, Float64) { // block id: 701
        (Enum_1702636574584_688.enumValue_1702636574584_1924, Enum_1702636574584_688.enumValue_1702636574584_1924, (1..2),
            1.1)
    }
}

public interface Interface_1702636574584_206 <: Interface_1702636574584_207 & Interface_1702636574584_209 {
    func func_1702636574584_680(namedParam_1702636574584_681!: String): Range<UInt8> { // block id: 682
        ((UInt8(UInt8(245)) & 127)..(UInt8(UInt8(89)) & 127) : (Int64(115) | 1))
    }
    func func_1702636574584_680(param_1702636574584_698: UInt64, param_1702636574584_699: Int16,
        namedParam_1702636574584_700!: Int8): (Enum_1702636574584_688, Enum_1702636574584_688, Range<Int32>, Float64) { // block id: 701
        (Enum_1702636574584_688.enumValue_1702636574584_1924, Enum_1702636574584_688.enumValue_1702636574584_1924, (1..2),
            1.1)
    }
}

public open class Class_1702636574584_203 <: Interface_1702636574584_206 & Interface_1702636574584_208 & Resource {
    public init() { // block id: 205

    }
    public static let var_1702636574584_212: UInt8
    public open override func func_1702636574584_680(namedParam_1702636574584_681!: String): Range<UInt8> { // block id: 682
        ((UInt8(UInt8(245)) & 127)..(UInt8(UInt8(89)) & 127) : (Int64(115) | 1))
    }
    public open override func func_1702636574584_680(param_1702636574584_698: UInt64, param_1702636574584_699: Int16,
        namedParam_1702636574584_700!: Int8): (Enum_1702636574584_688, Enum_1702636574584_688, Range<Int32>, Float64) { // block id: 701
        (Enum_1702636574584_688.enumValue_1702636574584_1924, Enum_1702636574584_688.enumValue_1702636574584_1924, (1..2),
            1.1)
    }
    static init() {
        var_1702636574584_212 = UInt8(90)
    }
    public func isClosed(): Bool {
        return false
    }
    public func close(): Unit {}
}

func func_1702636574584_299(param_1702636574584_300: Range<UInt8>): Unit { // block id: 301
    var_1702636574584_303
}

public enum Enum_1702636574584_324 {
    defaultValue
    | enumValue_1702636574584_333(Range<Int16>, Interface_1702636574584_207, Int32)
    | enumValue_1702636574584_630(Range<Int16>, Array<UInt64>, Array<Range<UInt16>>)
}

public enum Enum_1702636574584_688 {
    defaultValue
    | enumValue_1702636574584_786(Interface_1702636574584_208)
    | enumValue_1702636574584_790(Float64, Range<UInt32>)
    | enumValue_1702636574584_1227(Int32, Option<Array<UInt64>>, String, Bool)
    | enumValue_1702636574584_1245((Range<UInt8>) -> Unit, Array<Range<UInt16>>, Array<Int16>,
        Interface_1702636574584_208)
    | enumValue_1702636574584_1924
}

public open class Class_1702636574584_970 <: Class_1702636574584_203 {
    public open override func func_1702636574584_680(namedParam_1702636574584_681!: String): Range<UInt8> { // block id: 682
        ((UInt8(UInt8(245)) & 127)..(UInt8(UInt8(89)) & 127) : (Int64(115) | 1))
    }
    public open override func func_1702636574584_680(param_1702636574584_698: UInt64, param_1702636574584_699: Int16,
        namedParam_1702636574584_700!: Int8): (Enum_1702636574584_688, Enum_1702636574584_688, Range<Int32>, Float64) { // block id: 701
        (Enum_1702636574584_688.enumValue_1702636574584_1924, Enum_1702636574584_688.enumValue_1702636574584_1924, (1..2),
            1.1)
    }
}

main(): Int64 {
    try {
        Struct_1702636574584_8.func_1702636574584_13()[0];
        var var_1702636574584_2363: Option<UInt64> = Option<UInt64>.Some(UInt64(251));
        Int64((if (var_1702636574584_1959) { // block id: 2358
            var_1702636574584_2363
        } else if (true) { // block id: 2367
            if (false) {
                var_1702636574584_2363
            } else {
                Option<UInt64>.None
            }
        } else { // block id: 2372
            if (var_1702636574584_1959) {
                Option<UInt64>.Some(UInt64(159))
            } else {
                Option<UInt64>.Some(UInt64(103))
            }
        } ?? (var_1702636574584_2363 ?? var_1702636574584_1030)))
        ()
    } catch (e: NoneValueException) {
        println("Exception: NoneValueException")
    }

    return 0;
}
