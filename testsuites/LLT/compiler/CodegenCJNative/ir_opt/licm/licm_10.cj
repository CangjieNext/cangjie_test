// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -Woff all --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// random seed:1714143424912
// All global variable need to be defined before use!
public let var_1714143424912_24: Struct_1714143424912_20 = Struct_1714143424912_20()
public const var_1714143424912_58: String = ###"C7!WC,1%fY"###
public let var_1714143424912_61: Int = Int64(UInt8(Int8(-69)))
public const var_1714143424912_94: UInt16 = 159
public const var_1714143424912_153: Unit = ()
const var_1714143424912_265: Int16 = -6
public const var_1714143424912_285: Int16 = -119
let var_1714143424912_337: Int32 = Int32(-107)
public const var_1714143424912_341: UInt32 = 183
public let var_1714143424912_352: Enum_1714143424912_41 = Enum_1714143424912_41.enumValue_1714143424912_354
public const var_1714143424912_368: Bool = false
var var_1714143424912_385: UInt32 = UInt32(159)
public var var_1714143424912_396: Float64 = Float64(-68.0)
public var var_1714143424912_407: Int32 = Int32(UInt16(UInt8(UInt8(221))))
public var var_1714143424912_509: Bool = (Class_1714143424912_7() is Array<UInt64>)

public interface Interface_1714143424912_12 {
    func func_1714143424912_17(namedParam_1714143424912_419!: Bool, namedParam_1714143424912_420!: UInt64,
        namedParam_1714143424912_421!: (Int32) -> Int16, namedParam_1714143424912_424!: UInt32): Bool { // block id: 425
        return true
    };

    func func_1714143424912_17(): UInt16 { // block id: 18
        var loopTimeVar_1714143424912_534: Int64 = 0;
        var_1714143424912_24.func_1714143424912_27<Range<Int32>, Int64>(58.0,
            while ((var_1714143424912_368) && loopTimeVar_1714143424912_534 < 100) {
                loopTimeVar_1714143424912_534++;
                Int16(100);
                ()
            }, var_1714143424912_285);
        var var_1714143424912_559: ?Unit = (Int8(UInt8(Int8(61))) as Unit);
        (Option<Range<UInt32>>.Some(((UInt32(UInt32(120)) & 127)..(UInt32(UInt32(21)) & 127) : (Int64(126) | 1))) ??
            match (if (var_1714143424912_509) { // block id: 546
            let var_1714143424912_549: ?Unit = Option<Unit>.Some(());
            var_1714143424912_549
        } else { // block id: 552
            var_1714143424912_559
        }) {
            case _ => ((UInt32(UInt32(56)) & 127)..(UInt32(UInt32(239)) & 127) : (Int64(122) | 1))
        });
        try { // block id: 569
            var_1714143424912_94
        } finally { // block id: 571
            UInt16(166)
        }
    }
}

public sealed interface Interface_1714143424912_11<T0> <: Interface_1714143424912_12 {
    func func_1714143424912_17(namedParam_1714143424912_419!: Bool, namedParam_1714143424912_420!: UInt64,
        namedParam_1714143424912_421!: (Int32) -> Int16, namedParam_1714143424912_424!: UInt32): Bool { // block id: 425
        return true
    };

    func func_1714143424912_17(): UInt16 { // block id: 18
        return 0
    }
}

public interface Interface_1714143424912_10 <: Interface_1714143424912_11<Float32> {
    func func_1714143424912_17(namedParam_1714143424912_419!: Bool, namedParam_1714143424912_420!: UInt64,
        namedParam_1714143424912_421!: (Int32) -> Int16, namedParam_1714143424912_424!: UInt32): Bool { // block id: 425
        return true
    };

    func func_1714143424912_17(): UInt16 { // block id: 18
        return 0
    }
}

public open class Class_1714143424912_7 <: Interface_1714143424912_10 {
    public init() { // block id: 9

    }

    public open override func func_1714143424912_17(namedParam_1714143424912_419!: Bool,
        namedParam_1714143424912_420!: UInt64, namedParam_1714143424912_421!: (Int32) -> Int16,
        namedParam_1714143424912_424!: UInt32): Bool { // block id: 425
        return true
    };

    public open override func func_1714143424912_17(): UInt16 { // block id: 18
        return 0
    }
}

public struct Struct_1714143424912_20 {
    public init() { // block id: 22

    }

    public let var_1714143424912_334: Interface_1714143424912_12 = Class_1714143424912_7();
    public func func_1714143424912_27<T0, T1>(param_1714143424912_28: Float32, param_1714143424912_29: Unit,
        param_1714143424912_30: Int16): Unit { // block id: 31
        let var_1714143424912_36: Int16 = Int16(UInt8(29));
        UInt32((var_1714143424912_36 << ((var_1714143424912_36) & 7))) << ((match (if (false) {
            Enum_1714143424912_41.enumValue_1714143424912_46(UInt32(177), ###"6\"35D8PCuo"###, Int64(-61), ())
        } else {
            Enum_1714143424912_41.enumValue_1714143424912_46(UInt32(242), var_1714143424912_58, var_1714143424912_61, ())
        }) {
            case _ => UInt32(166)
        }) & 7);
        func_1714143424912_71(
            Int32((var_1714143424912_334, var_1714143424912_337, var_1714143424912_94, var_1714143424912_341)[2]));
        var var_1714143424912_360: UInt = UInt64(Int32(Int8(-127)));
        let var_1714143424912_503: (Int32) -> Int16 = func_1714143424912_71;
        var loopTimeVar_1714143424912_517: Int64 = 0;
        (if (match (var_1714143424912_352) {
            case _ =>
                var_1714143424912_385 *= var_1714143424912_341
                var_1714143424912_368
        }) { // block id: 389
            Option<Unit>.None
        } else if ((var_1714143424912_368, var_1714143424912_396)[0]) { // block id: 399
            Option<Unit>.Some(var_1714143424912_153)
        } else { // block id: 402
            Option<Unit>.Some(())
        } ?? while ((var_1714143424912_334.func_1714143424912_17(namedParam_1714143424912_419: var_1714143424912_368,
                namedParam_1714143424912_420: var_1714143424912_360, namedParam_1714143424912_421: var_1714143424912_503,
                namedParam_1714143424912_424: var_1714143424912_341)) && loopTimeVar_1714143424912_517 < 100) {
            loopTimeVar_1714143424912_517++;
            var_1714143424912_509 &&= false
            var_1714143424912_36 * var_1714143424912_36
        })
    }
}

public enum Enum_1714143424912_41 {
    defaultValue
    | enumValue_1714143424912_46(UInt32, String, Int64, Unit)
    | enumValue_1714143424912_354
}

public const func func_1714143424912_71(param_1714143424912_72: Int32): Int16 { // block id: 73
    return 0
}

main(): Int64 {
    return 0;
}
