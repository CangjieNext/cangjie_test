/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// random seed:1770288552946
// All global variable need to be defined before use!
import std.collection.*
import std.runtime.*
import std.time.*

@Deprecated
public let var_1770288552946_40: ?Int8 = Option<Int8>.None
@Deprecated
public const var_1770288552946_45: Int8 = -34
public let var_1770288552946_69: Struct_1770288552946_65 = Struct_1770288552946_65()
public const var_1770288552946_83: UInt16 = 61
public let var_1770288552946_125: Class_1770288552946_117 = Class_1770288552946_117()
public var var_1770288552946_155: Unit = ()
public var var_1770288552946_210: Array<Option<Int8>> = [(Int8(-24) as Int8), Option<Int8>.None,
    ([("""
U*nRI
rDpkz
""" as Int8), (() as Int8),
    (((UInt32(UInt32(150)) & 127)..=(UInt32(UInt32(201)) & 127) : (Int64(-58) | 1)) as Int8), Option<Int8>.None,
    (Int64(109) as Int8), Option<Int8>.None, (Int16(117) as Int8),
    (((UInt16(UInt16(76)) & 127)..(UInt16(UInt16(33)) & 127) : (Int64(-77) | 1)) as Int8), Option<Int8>.None,
    (Struct_1770288552946_65() as Int8)] as Int8), Option<Int8>.None, (Float32(Float32(Float32(-85.0))) as Int8),
    Option<Int8>.None, (((UInt8(UInt8(209)) & 127)..(UInt8(UInt8(UInt8(176))) & 127) : (Int64(Int32(-70)) | 1)) as Int8),
    (Class_1770288552946_117() as Int8), Option<Int8>.None, Option<Int8>.None]
@Deprecated
internal var var_1770288552946_261: Unit = ()
@Deprecated
public var var_1770288552946_289: Option<(Option<Int8>, Float32, Range<UInt16>, Range<Int8>)> = Option<(Option<Int8>, 
        Float32, Range<UInt16>, Range<Int8>)>.None
public var var_1770288552946_334: (Option<Int8>, Float32, Range<UInt16>, Range<Int8>) = ((Class_1770288552946_117() as Int8),
    Float32(-44.0), ((UInt16(UInt16(62)) & 127)..(UInt16(UInt16(Int8(Int8(-106)))) & 127) : (Int64(Int16(-38)) | 1)), ((Int8(Int8(5)) &
        127)..=(Int8(Int8(31)) & 127) : (Int64(-123) | 1)))
@Deprecated
public let var_1770288552946_382: (UInt32, Array<Range<Int8>>) = (UInt32(Int8(UInt8(8))), [((Int8(Int8(-48)) & 127)..(Int8(Int8(Int8(115))) &
        127) : (Int64(-101) | 1)), ((Int8(Int8(UInt8(50))) & 127)..=(Int8(Int8(Int8(62))) & 127) : (Int64(-13) | 1)),
        ((Int8(Int8(-18)) & 127)..=(Int8(Int8(UInt8(251))) & 127) : (Int64(UInt16(221)) | 1)),
        ((Int8(Int8(70)) & 127)..=(Int8(Int8(14)) & 127) : (Int64(-24) | 1)),
        ((Int8(Int8(UInt8(13))) & 127)..=(Int8(Int8(UInt8(74))) & 127) : (Int64(-16) | 1)),
        ((Int8(Int8(28)) & 127)..(Int8(Int8(Int8(8))) & 127) : (Int64(3) | 1)),
        ((Int8(Int8(-11)) & 127)..=(Int8(Int8(Int8(123))) & 127) : (Int64(-90) | 1)),
        ((Int8(Int8(-89)) & 127)..(Int8(Int8(8)) & 127) : (Int64(36) | 1)),
        ((Int8(Int8(-27)) & 127)..=(Int8(Int8(120)) & 127) : (Int64(-52) | 1)),
        ((Int8(Int8(-22)) & 127)..=(Int8(Int8(-8)) & 127) : (Int64(-77) | 1))])
@Deprecated
public const var_1770288552946_436: Float32 = 71.0
@Deprecated
public let var_1770288552946_444: (Float32, (UInt32, Array<Range<Int8>>), (Bool, UInt64, Float32, Option<(Option<Int8>, 
    Float32, Range<UInt16>, Range<Int8>)>), Option<Array<UInt64>>, Int16, Option<Int8>, Array<Range<Int8>>, Range<Int32>) = (Float32(-9.0),
    (UInt32(Int16(111)), [((Int8(Int8(-34)) & 127)..(Int8(Int8(-15)) & 127) : (Int64(-11) | 1)),
            ((Int8(Int8(-59)) & 127)..=(Int8(Int8(-78)) & 127) : (Int64(-60) | 1)),
            ((Int8(Int8(-88)) & 127)..(Int8(Int8(-50)) & 127) : (Int64(-87) | 1)),
            ((Int8(Int8(-37)) & 127)..(Int8(Int8(59)) & 127) : (Int64(-21) | 1)),
            ((Int8(Int8(13)) & 127)..(Int8(Int8(50)) & 127) : (Int64(86) | 1)),
            ((Int8(Int8(-40)) & 127)..(Int8(Int8(-66)) & 127) : (Int64(-74) | 1)),
            ((Int8(Int8(76)) & 127)..(Int8(Int8(-39)) & 127) : (Int64(69) | 1)),
            ((Int8(Int8(-28)) & 127)..=(Int8(Int8(-91)) & 127) : (Int64(50) | 1)),
            ((Int8(Int8(-112)) & 127)..(Int8(Int8(94)) & 127) : (Int64(79) | 1)),
            ((Int8(Int8(-25)) & 127)..=(Int8(Int8(-96)) & 127) : (Int64(114) | 1))]), ((Option<Array<UInt64>>.None is Interface_1770288552946_122),
        UInt64(Int8(UInt8(141))), Float32(Float32(Float32(29.0))), Option<(Option<Int8>, Float32, Range<UInt16>, Range<Int8>)>
            .None), (Class_1770288552946_117() as Array<UInt64>), Int16(Int8(45)), Option<Int8>.None, [((Int8(Int8(95)) &
        127)..=(Int8(Int8(-46)) & 127) : (Int64(-80) | 1)),
        ((Int8(Int8(21)) & 127)..=(Int8(Int8(113)) & 127) : (Int64(-5) | 1)),
        ((Int8(Int8(110)) & 127)..(Int8(Int8(5)) & 127) : (Int64(38) | 1)),
        ((Int8(Int8(-87)) & 127)..(Int8(Int8(66)) & 127) : (Int64(106) | 1)),
        ((Int8(Int8(-125)) & 127)..(Int8(Int8(-118)) & 127) : (Int64(20) | 1)),
        ((Int8(Int8(16)) & 127)..(Int8(Int8(57)) & 127) : (Int64(-55) | 1)),
        ((Int8(Int8(-8)) & 127)..(Int8(Int8(94)) & 127) : (Int64(107) | 1)),
        ((Int8(Int8(33)) & 127)..(Int8(Int8(-110)) & 127) : (Int64(-74) | 1)),
        ((Int8(Int8(-103)) & 127)..(Int8(Int8(119)) & 127) : (Int64(15) | 1)),
        ((Int8(Int8(79)) & 127)..=(Int8(Int8(42)) & 127) : (Int64(93) | 1))], ((Int32(Int32(94)) & 127)..(Int32(Int32(-56)) &
        127) : (Int64(79) | 1)))
@Deprecated
public var var_1770288552946_516: Interface_1770288552946_120 = Class_1770288552946_117()
public var var_1770288552946_573: Range<Int8> = ((Int8(Int8(15)) & 127)..(Int8(Int8(80)) & 127) : (Int64(43) | 1))
public const var_1770288552946_603: Int32 = 2
public var var_1770288552946_692: (UInt16, String, Bool) = (UInt16(Int16(117)), ###"E/vaO:W]IX"###, (UInt16(UInt16(UInt8(210))) is Array<Range<Int8>>))
public let var_1770288552946_776: ?Range<Int8> = (((Int32(Int32(-88)) & 127)..=(Int32(Int32(1)) & 127) : (Int64(-110) | 1)) as Range<Int8>)
public let var_1770288552946_822: UInt64 = UInt64(238)
public const var_1770288552946_828: Float64 = 48.0
var var_1770288552946_834: (Float64, (Float32, (UInt32, Array<Range<Int8>>), (Bool, UInt64, Float32, Option<(Option<Int8>, 
    Float32, Range<UInt16>, Range<Int8>)>), Option<Array<UInt64>>, Int16, Option<Int8>, Array<Range<Int8>>, Range<Int32>), 
    Range<UInt64>, Int32) = (Float64(-33.0), (Float32(-33.0), (UInt32(UInt8(92)), [((Int8(Int8(38)) & 127)..=(Int8(Int8(-126)) &
                127) : (Int64(-33) | 1)), ((Int8(Int8(-24)) & 127)..(Int8(Int8(-123)) & 127) : (Int64(52) | 1)),
                ((Int8(Int8(-8)) & 127)..=(Int8(Int8(83)) & 127) : (Int64(-84) | 1)),
                ((Int8(Int8(-123)) & 127)..=(Int8(Int8(80)) & 127) : (Int64(90) | 1)),
                ((Int8(Int8(5)) & 127)..=(Int8(Int8(-15)) & 127) : (Int64(-32) | 1)),
                ((Int8(Int8(-62)) & 127)..=(Int8(Int8(-112)) & 127) : (Int64(-102) | 1)),
                ((Int8(Int8(94)) & 127)..(Int8(Int8(75)) & 127) : (Int64(111) | 1)),
                ((Int8(Int8(-25)) & 127)..(Int8(Int8(-63)) & 127) : (Int64(119) | 1)),
                ((Int8(Int8(11)) & 127)..(Int8(Int8(14)) & 127) : (Int64(24) | 1)),
                ((Int8(Int8(104)) & 127)..(Int8(Int8(-1)) & 127) : (Int64(103) | 1))]), (false, UInt64(Int64(20)),
            Float32(Float32(34.0)), ((Float32(-32.0), "EY(KDeQr>`", [((Int8(Int8(114)) & 127)..=(Int8(Int8(-68)) & 127) : (Int64(118) |
                    1)), ((Int8(Int8(-76)) & 127)..(Int8(Int8(-54)) & 127) : (Int64(66) | 1)),
                    ((Int8(Int8(40)) & 127)..(Int8(Int8(24)) & 127) : (Int64(-24) | 1)),
                    ((Int8(Int8(24)) & 127)..=(Int8(Int8(41)) & 127) : (Int64(106) | 1)),
                    ((Int8(Int8(-5)) & 127)..(Int8(Int8(64)) & 127) : (Int64(-110) | 1)),
                    ((Int8(Int8(123)) & 127)..(Int8(Int8(88)) & 127) : (Int64(-113) | 1)),
                    ((Int8(Int8(57)) & 127)..(Int8(Int8(93)) & 127) : (Int64(-36) | 1)),
                    ((Int8(Int8(-66)) & 127)..(Int8(Int8(5)) & 127) : (Int64(105) | 1)),
                    ((Int8(Int8(-10)) & 127)..=(Int8(Int8(-118)) & 127) : (Int64(-7) | 1)),
                    ((Int8(Int8(-53)) & 127)..(Int8(Int8(9)) & 127) : (Int64(-128) | 1))], UInt8(165), ((Int16(Int16(-8)) &
                    127)..(Int16(Int16(-62)) & 127) : (Int64(121) | 1)), Option<Option<Array<Range<Int8>>>>.None) as (Option<Int8>, 
                Float32, Range<UInt16>, Range<Int8>))), (((Float32(-87.0), "9;(O}k+h3*", [((Int8(Int8(-4)) & 127)..=(Int8(Int8(-66)) &
                127) : (Int64(37) | 1)), ((Int8(Int8(112)) & 127)..(Int8(Int8(91)) & 127) : (Int64(125) | 1)),
                ((Int8(Int8(73)) & 127)..=(Int8(Int8(-97)) & 127) : (Int64(-80) | 1)),
                ((Int8(Int8(98)) & 127)..=(Int8(Int8(9)) & 127) : (Int64(108) | 1)),
                ((Int8(Int8(-90)) & 127)..=(Int8(Int8(126)) & 127) : (Int64(116) | 1)),
                ((Int8(Int8(-99)) & 127)..(Int8(Int8(113)) & 127) : (Int64(124) | 1)),
                ((Int8(Int8(-100)) & 127)..=(Int8(Int8(85)) & 127) : (Int64(-98) | 1)),
                ((Int8(Int8(-109)) & 127)..=(Int8(Int8(108)) & 127) : (Int64(57) | 1)),
                ((Int8(Int8(-58)) & 127)..(Int8(Int8(-33)) & 127) : (Int64(-67) | 1)),
                ((Int8(Int8(-22)) & 127)..(Int8(Int8(-50)) & 127) : (Int64(55) | 1))], UInt8(156), ((Int16(Int16(-53)) &
                127)..(Int16(Int16(-7)) & 127) : (Int64(-60) | 1)), Option<Option<Array<Range<Int8>>>>.None) as (Option<Int8>, 
            Float32, Range<UInt16>, Range<Int8>)) as Array<UInt64>), Int16(UInt8(UInt8(20))), (UInt64(200) as Int8), [((Int8(Int8(81)) &
            127)..(Int8(Int8(72)) & 127) : (Int64(90) | 1)),
            ((Int8(Int8(16)) & 127)..=(Int8(Int8(-31)) & 127) : (Int64(93) | 1)),
            ((Int8(Int8(64)) & 127)..=(Int8(Int8(90)) & 127) : (Int64(-42) | 1)),
            ((Int8(Int8(-97)) & 127)..(Int8(Int8(84)) & 127) : (Int64(78) | 1)),
            ((Int8(Int8(-50)) & 127)..=(Int8(Int8(-32)) & 127) : (Int64(-116) | 1)),
            ((Int8(Int8(-119)) & 127)..(Int8(Int8(57)) & 127) : (Int64(57) | 1)),
            ((Int8(Int8(-51)) & 127)..=(Int8(Int8(-17)) & 127) : (Int64(102) | 1)),
            ((Int8(Int8(-73)) & 127)..(Int8(Int8(71)) & 127) : (Int64(20) | 1)),
            ((Int8(Int8(-68)) & 127)..(Int8(Int8(68)) & 127) : (Int64(7) | 1)),
            ((Int8(Int8(-61)) & 127)..(Int8(Int8(-100)) & 127) : (Int64(73) | 1))], ((Int32(Int32(UInt32(106))) & 127)..(Int32(Int32(68)) &
            127) : (Int64(117) | 1))), ((UInt64(UInt64(100)) & 127)..=(UInt64(UInt64(230)) & 127) : (Int64(64) | 1)),
    Int32(Int16(-15)))
@Deprecated
public var var_1770288552946_961: UInt16 = UInt16(167)
public var var_1770288552946_973: ?Int8 = Option<Int8>.None
internal let var_1770288552946_1041: UInt8 = UInt8(162)
@Deprecated
internal var var_1770288552946_1048: Interface_1770288552946_123 = Class_1770288552946_117()
public let var_1770288552946_1072: Bool = (Option<Array<Range<Int8>>>.None is Range<UInt32>)
public var var_1770288552946_1139: Unit = ()
public let var_1770288552946_1198: Int64 = Int64(UInt64(Int16(Int16(Int8(-59)))))
public var var_1770288552946_1236: ?Bool = ([Int8(-51), Int8(71), Int8(-49), Int8(27), Int8(92), Int8(-114), Int8(-104),
    Int8(17), Int8(116), Int8(-51)] as Bool)
public let var_1770288552946_1249: Option<Int64> = Option<Int64>.None
public const var_1770288552946_1456: Int16 = -7
public var var_1770288552946_1466: UInt32 = UInt32(UInt8(94))
public let var_1770288552946_1476: ?(UInt32, Array<Range<Int8>>) = (((UInt64(UInt64(172)) & 127)..(UInt64(UInt64(115)) &
    127) : (Int64(-110) | 1)) as (UInt32, Array<Range<Int8>>))
public let var_1770288552946_1511: (VArray<UInt64, $7>, Option<Array<UInt64>>, (Option<(UInt32, Array<Range<Int8>>)>, 
    Option<Array<UInt64>>)) = (VArray<UInt64, $7>({i => UInt64(76)}), Option<Array<UInt64>>.None, (((Option<(UInt32, 
                    Array<Range<Int8>>)>.None, Option<Array<UInt64>>.None) as (UInt32, Array<Range<Int8>>)), Option<Array<UInt64>>
            .None))
let var_1770288552946_1549: Option<Option<Array<UInt64>>> = Option<Option<Array<UInt64>>>.None
public var var_1770288552946_1563: Option<Option<Bool>> = Option<Option<Bool>>.None
public var var_1770288552946_1606: Bool = (Option<Option<Array<UInt64>>>.None is (Int32, Option<(UInt32, Array<Range<Int8>>)>, 
    (Float32, String, Array<Range<Int8>>, UInt8, Range<Int16>, Option<Option<Array<Range<Int8>>>>), Option<Int8>, 
    Float64))
let var_1770288552946_1680: Int8 = Int8(UInt8(UInt8(207)))
public var var_1770288552946_1721: Option<Array<UInt64>> = ([((((Int8(Int8(67)) & 127)..(Int8(Int8(37)) & 127) : (Int64(66) |
    1)) as Array<UInt64>) as Int8), Option<Int8>.None, Option<Int8>.None,
    ([Option<Int8>.None, Option<Int8>.None, Option<Int8>.None, Option<Int8>.None, Option<Int8>.None, Option<Int8>.None,
    Option<Int8>.None, Option<Int8>.None, Option<Int8>.None, Option<Int8>.None] as Int8), Option<Int8>.None,
    Option<Int8>.None, Option<Int8>.None, Option<Int8>.None, Option<Int8>.None, Option<Int8>.None] as Array<UInt64>)
public var var_1770288552946_1755: Bool = true
public var var_1770288552946_1768: UInt8 = UInt8(94)

@Deprecated
public struct Struct_1770288552946_65 {
    @Frozen
    public init() { // block id: 67

    }

    @Frozen
    private mut prop var_1770288552946_95: Class_1770288552946_91 { // block id: 96
        get() { // block id: 98
            UInt16(57);
            Class_1770288552946_91()
        }
        set(Value) { // block id: 103

        }
    }

    @Frozen
    public static func func_1770288552946_266(param_1770288552946_267: Float64,
        optionalParam_1770288552946_268!: Int32 = Int32(Int16(Int8(-62))),
        optionalParam_1770288552946_272!: UInt8 = UInt8(204)): Option<Int8> { // block id: 274
        let var_1770288552946_310: Option<Float32> = (Class_1770288552946_117() as Float32);
        func func_1770288552946_293(): (Option<Int8>, Float32, Range<UInt16>, Range<Int8>) { // block id: 294
            var var_1770288552946_318: Range<UInt16> = ((UInt16(UInt16(64)) & 127)..=(UInt16(UInt16(75)) & 127) : (Int64(124) |
                1));
            ((var_1770288552946_125 as Int8), ((Option<Option<Float32>>.Some(var_1770288552946_310) ?? Option<Float32>
                    .None) ?? Float32(65.0) - Float32(-75.0)), var_1770288552946_318, func_1770288552946_321())
        };

        ((false, UInt64(230), Float32(-66.0), var_1770288552946_289)[3] ?? func_1770288552946_293())[0]
    };

    private let var_1770288552946_1057: Option<Interface_1770288552946_122> = Option<Interface_1770288552946_122>.None;

    @Frozen
    public static prop var_1770288552946_1097: UInt8 { // block id: 1098
        get() { // block id: 1100
            UInt8(215)
        }
    }
    public static let var_1770288552946_1103: UInt8 = UInt8(185);

    @Frozen
    func func_1770288552946_132(namedParam_1770288552946_133!: Option<Int8>,
        optionalParam_1770288552946_134!: Int16 = Int16(-26)): Range<UInt16> { // block id: 136
        let var_1770288552946_1060: Interface_1770288552946_122 = Class_1770288552946_117();
        func_1770288552946_321((var_1770288552946_1057 ?? var_1770288552946_1060));
        ((UInt16(var_1770288552946_961) & 127)..=(UInt16(if ((Option<Bool>.Some(var_1770288552946_1072) ?? false)) { // block id: 1076
            UInt16(234)
        } else { // block id: 1078
            UInt16(221)
        }) & 127) : (match (VArray<UInt64, $7>(repeat: var_1770288552946_822)[6]) {
            case _ =>
                var_1770288552946_1097 + var_1770288552946_1103;
                Int64(1)
        } | 1))
    };

    public static let var_1770288552946_1213: Range<Int16> = ((Int16(Int16(-83)) & 127)..=(Int16(Int16(9)) & 127) : (Int64(91) |
        1));

    @Frozen
    public func func_1770288552946_72(optionalParam_1770288552946_73!: Float64 = Float64(35.0),
        optionalParam_1770288552946_75!: UInt8 = UInt8(Int8(-11))): Int8 { // block id: 78
        if (try { // block id: 81
            var_1770288552946_83;
            true
        } finally { // block id: 86
            ();
            false
        }) { // block id: 89
            var_1770288552946_95.var_1770288552946_105;
            var_1770288552946_125.var_1770288552946_128
        } else { // block id: 130
            func_1770288552946_132(namedParam_1770288552946_133: var_1770288552946_40);
            var var_1770288552946_1119: Bool = true;
            match ((var_1770288552946_961, ###"5J:d  fR0'"###, false)) {
                case (_: Option<Array<UInt64>>, caseVar_1770288552946_1114: Range<UInt8>, caseVar_1770288552946_1115: Option<Option<Array<Range<Int8>>>>) =>
                    var_1770288552946_1119 ||= false
                    Int32(66)

                case (_, _, caseVar_1770288552946_1125) =>
                    var_1770288552946_83;
                    Int32(9)

                case (_, _, _: Range<Int64>) => Int32(61) ^ var_1770288552946_603

                case (_: Option<Float32>, _, _) =>
                    var_1770288552946_1139;
                    var_1770288552946_603

                case _ => Int32(-106)
            }
        };
        let var_1770288552946_1184: String = "g8HQ>W\\-z/";
        if (true) { // block id: 1148
            var var_1770288552946_1156: ?Option<Float32> = (Int8(2) as Option<Float32>);
            var var_1770288552946_1164: Unit = ();
            match (Option<Range<Int8>>.Some(var_1770288552946_573)) {
                case _: Range<UInt8> =>
                    var_1770288552946_1156;
                    ()

                case _ => var_1770288552946_1164

                case _: Array<UInt64> => var_1770288552946_1164

                case _ => ()

                case _ => var_1770288552946_1139
            };
            var_1770288552946_45
        } else { // block id: 1179
            var var_1770288552946_1209: Range<Int8> = ((Int8(Int8(-83)) & 127)..(Int8(Int8(29)) & 127) : (Int64(18) | 1));
            ((Float32(-8.0), var_1770288552946_1184, [((Int8(Int8(105)) & 127)..(Int8(Int8(0)) & 127) : (Int64(-36) | 1)),
                    ((Int8(Int8(67)) & 127)..=(Int8(Int8(-1)) & 127) : (Int64(1) | 1)),
                    ((Int8(Int8(-125)) & 127)..=(Int8(Int8(-36)) & 127) : (Int64(-69) | 1)),
                    ((Int8(Int8(-120)) & 127)..(Int8(Int8(126)) & 127) : (Int64(81) | 1)), var_1770288552946_573,
                    var_1770288552946_573, ((Int8(Int8(57)) & 127)..(Int8(Int8(28)) & 127) : (Int64(7) | 1)),
                    ((Int8(Int8(3)) & 127)..(Int8(var_1770288552946_45) & 127) : (var_1770288552946_1198 | 1)),
                    ((Int8(var_1770288552946_45) & 127)..=(Int8(Int8(-98)) & 127) : (Int64(-71) | 1)),
                    var_1770288552946_1209], var_1770288552946_1103, var_1770288552946_1213, Option<Option<Array<Range<Int8>>>>
                    .None) as Bool);
            [Int8(111), Int8(-120), Int8(-46), Int8(125), Int8(-46), Int8(30), Int8(-27), Int8(-123), Int8(-122),
                Int8(-30)][9]
        }
    }
}

public open class Class_1770288552946_91 <: Resource {
    @Frozen
    public init() { // block id: 93

    }

    @Frozen
    public mut prop var_1770288552946_105: Unit { // block id: 106
        get() { // block id: 108
            ();
            ();
            var_1770288552946_1406
        }
        set(Value) { // block id: 113
            r'V';
            ();
            var_1770288552946_1406 = Value
        }
    }
    public var var_1770288552946_128: Int32 = Int32(-33);

    @Frozen
    public static mut prop var_1770288552946_179: ?Int8 { // block id: 180
        get() { // block id: 182
            [UInt64(Int16(UInt16(57))), UInt64(64), UInt64(58), UInt64(UInt8(106)), UInt64(UInt8(Int8(116))),
                UInt64(Int8(68)), UInt64(Int8(81)), UInt64(UInt8(UInt8(11))), UInt64(226), UInt64(142)];
            (UInt32(140) as Int8)
        }
        set(Value) { // block id: 207

        }
    }
    public let var_1770288552946_474: Array<UInt64> = [UInt64(206), UInt64(223), UInt64(208), UInt64(229), UInt64(83),
        UInt64(201), UInt64(213), UInt64(191), UInt64(181), UInt64(57)];
    public var var_1770288552946_1299: ?(UInt32, Array<Range<Int8>>) = Option<(UInt32, Array<Range<Int8>>)>.None;
    private static var var_1770288552946_1352: Array<Range<Int8>> = [((Int8(Int8(-100)) & 127)..(Int8(Int8(-16)) & 127) : (Int64(-2) |
        1)), ((Int8(Int8(-49)) & 127)..(Int8(Int8(-106)) & 127) : (Int64(-114) | 1)),
        ((Int8(Int8(23)) & 127)..(Int8(Int8(57)) & 127) : (Int64(-5) | 1)),
        ((Int8(Int8(117)) & 127)..=(Int8(Int8(109)) & 127) : (Int64(-124) | 1)),
        ((Int8(Int8(-55)) & 127)..=(Int8(Int8(94)) & 127) : (Int64(-42) | 1)),
        ((Int8(Int8(3)) & 127)..(Int8(Int8(-101)) & 127) : (Int64(-13) | 1)),
        ((Int8(Int8(28)) & 127)..(Int8(Int8(-93)) & 127) : (Int64(19) | 1)),
        ((Int8(Int8(25)) & 127)..=(Int8(Int8(123)) & 127) : (Int64(-20) | 1)),
        ((Int8(Int8(-101)) & 127)..(Int8(Int8(-106)) & 127) : (Int64(51) | 1)),
        ((Int8(Int8(3)) & 127)..=(Int8(Int8(-106)) & 127) : (Int64(-1) | 1))];
    public mut prop var_1770288552946_1372: (UInt32, Array<Range<Int8>>) { // block id: 1373
        get() { // block id: 1375
            ((UInt16(Int16(40)), ###" P$l!cjPa3"###, true) as Option<Float32>);
            (UInt32(73), [((Int8(Int8(85)) & 127)..(Int8(Int8(-2)) & 127) : (Int64(44) | 1)),
                    ((Int8(Int8(90)) & 127)..(Int8(Int8(-8)) & 127) : (Int64(-83) | 1)),
                    ((Int8(Int8(58)) & 127)..=(Int8(Int8(34)) & 127) : (Int64(72) | 1)),
                    ((Int8(Int8(-74)) & 127)..(Int8(Int8(82)) & 127) : (Int64(10) | 1)),
                    ((Int8(Int8(-26)) & 127)..=(Int8(Int8(-93)) & 127) : (Int64(69) | 1)),
                    ((Int8(Int8(-42)) & 127)..=(Int8(Int8(77)) & 127) : (Int64(21) | 1)),
                    ((Int8(Int8(47)) & 127)..(Int8(Int8(126)) & 127) : (Int64(121) | 1)),
                    ((Int8(Int8(-15)) & 127)..=(Int8(Int8(120)) & 127) : (Int64(-49) | 1)),
                    ((Int8(Int8(-82)) & 127)..(Int8(Int8(70)) & 127) : (Int64(-41) | 1)),
                    ((Int8(Int8(0)) & 127)..(Int8(Int8(106)) & 127) : (Int64(111) | 1))])
        }
        set(Value) { // block id: 1403

        }
    }
    public open func func_1770288552946_328(): Array<Range<Int8>> { // block id: 1288
        const var_1770288552946_1305: UInt32 = 194;
        (if (var_1770288552946_1072) {
            Option<(UInt32, Array<Range<Int8>>)>.None
        } else {
            var_1770288552946_1299
        } ?? try { // block id: 1302
            var var_1770288552946_1308: Array<Range<Int8>> = [((Int8(Int8(Int8(UInt8(123)))) & 127)..=(Int8(Int8(Int8(Int8(-93)))) &
                127) : (Int64(UInt32(Int8(26))) | 1)),
                ((Int8(Int8(-26)) & 127)..=(Int8(Int8(Int8(31))) & 127) : (Int64(88) | 1)),
                ((Int8(Int8(-110)) & 127)..(Int8(Int8(-82)) & 127) : (Int64(-76) | 1)),
                ((Int8(Int8(-111)) & 127)..=(Int8(Int8(126)) & 127) : (Int64(-41) | 1)),
                ((Int8(Int8(-73)) & 127)..(Int8(Int8(-80)) & 127) : (Int64(UInt64(172)) | 1)),
                ((Int8(Int8(Int8(-74))) & 127)..(Int8(Int8(72)) & 127) : (Int64(UInt16(Int8(-94))) | 1)),
                ((Int8(Int8(-37)) & 127)..=(Int8(Int8(UInt8(UInt8(61)))) & 127) : (Int64(118) | 1)),
                ((Int8(Int8(55)) & 127)..(Int8(Int8(-60)) & 127) : (Int64(79) | 1)),
                ((Int8(Int8(-66)) & 127)..(Int8(Int8(-7)) & 127) : (Int64(35) | 1)),
                ((Int8(Int8(-46)) & 127)..=(Int8(Int8(-11)) & 127) : (Int64(109) | 1))];
            (var_1770288552946_1305, var_1770288552946_1308)
        } catch (e: Exception) { // block id: 1348
            (var_1770288552946_1305, var_1770288552946_1352)
        } finally { // block id: 1370
            var_1770288552946_1372
        })[1]
    };

    var var_1770288552946_1406: Unit = ()
    public func isClosed(): Bool {
        return true
    }
    public func close(): Unit {}
}

public interface Interface_1770288552946_123 {
    @Frozen
    static func func_1770288552946_359(namedParam_1770288552946_360!: Float64,
        namedParam_1770288552946_361!: Range<Int32>, namedParam_1770288552946_362!: Option<Float32>,
        namedParam_1770288552946_363!: Range<Int8>): Option<Array<UInt64>> { // block id: 364
        let var_1770288552946_428: UInt32 = UInt32(UInt8(UInt8(111)));
        try { // block id: 373
            var var_1770288552946_376: Int = Int64(UInt8(Int8(94)));
            var_1770288552946_376 = var_1770288552946_376
            var_1770288552946_382
        } catch (_) { // block id: 425
            (var_1770288552946_428, [((Int8(Int8(-70)) & 127)..(Int8(Int8(-74)) & 127) : (Int64(-115) | 1)),
                    ((Int8(Int8(-85)) & 127)..=(Int8(Int8(-59)) & 127) : (Int64(108) | 1)),
                    ((Int8(Int8(1)) & 127)..(Int8(Int8(20)) & 127) : (Int64(-92) | 1)),
                    ((Int8(Int8(43)) & 127)..=(Int8(Int8(-14)) & 127) : (Int64(126) | 1)),
                    ((Int8(Int8(-94)) & 127)..(Int8(Int8(105)) & 127) : (Int64(-52) | 1)),
                    ((Int8(Int8(-21)) & 127)..=(Int8(Int8(-44)) & 127) : (Int64(85) | 1)),
                    ((Int8(Int8(24)) & 127)..(Int8(Int8(-31)) & 127) : (Int64(48) | 1)),
                    ((Int8(Int8(97)) & 127)..=(Int8(Int8(55)) & 127) : (Int64(113) | 1)),
                    ((Int8(Int8(-105)) & 127)..(Int8(Int8(26)) & 127) : (Int64(-55) | 1)),
                    ((Int8(Int8(115)) & 127)..(Int8(Int8(-10)) & 127) : (Int64(-60) | 1))])
        } finally { // block id: 433
            var_1770288552946_436 + var_1770288552946_436;
            var_1770288552946_382
        }[0] |> func_1770288552946_366;
        var_1770288552946_444[3]
    }
}

public interface Interface_1770288552946_122 <: Interface_1770288552946_123 {
    static func func_1770288552946_359(namedParam_1770288552946_360!: Float64,
        namedParam_1770288552946_361!: Range<Int32>, namedParam_1770288552946_362!: Option<Float32>,
        namedParam_1770288552946_363!: Range<Int8>): Option<Array<UInt64>> { // block id: 1413
        var var_1770288552946_1425: Rune = r'h';
        match (if (var_1770288552946_1072) { // block id: 1417
            ((Int16(Int16(77)) & 127)..=(Int16(Int16(62)) & 127) : (var_1770288552946_1198 | 1));
            if (var_1770288552946_1072) {
                var_1770288552946_1425
            } else {
                var_1770288552946_1425
            }
        } else { // block id: 1428
            [var_1770288552946_45, var_1770288552946_45, Int8(-103), var_1770288552946_45, var_1770288552946_45,
                var_1770288552946_45, var_1770288552946_45, Int8(42), var_1770288552946_45, Int8(-33)];
            var_1770288552946_1425
        }) {
            case r'v' | r'f' | r's' => ()

            case _ =>
                if (var_1770288552946_1072) {
                    ((Int16(Int16(21)) & 127)..(Int16(Int16(-74)) & 127) : (var_1770288552946_1198 | 1))
                } else {
                    ((Int16(var_1770288552946_1456) & 127)..(Int16(var_1770288552946_1456) & 127) : (var_1770288552946_1198 |
                        1))
                };
                ()

            case _ => var_1770288552946_1466 >>= ((var_1770288552946_1466) & 7)
        };
        let var_1770288552946_1480: (Float32, String, Array<Range<Int8>>, UInt8, Range<Int16>, Option<Option<Array<Range<Int8>>>>) = (Float32(Float32(-95.0)),
            """
.5PTd
`'a{0W
""", [((Int8(Int8(94)) & 127)..=(Int8(Int8(-41)) & 127) : (Int64(-60) | 1)),
                ((Int8(Int8(-52)) & 127)..(Int8(Int8(-66)) & 127) : (Int64(26) | 1)),
                ((Int8(Int8(40)) & 127)..=(Int8(Int8(38)) & 127) : (Int64(49) | 1)),
                ((Int8(Int8(-26)) & 127)..=(Int8(Int8(-6)) & 127) : (Int64(35) | 1)),
                ((Int8(Int8(121)) & 127)..=(Int8(Int8(-117)) & 127) : (Int64(-66) | 1)),
                ((Int8(Int8(103)) & 127)..=(Int8(Int8(98)) & 127) : (Int64(106) | 1)),
                ((Int8(Int8(57)) & 127)..(Int8(Int8(4)) & 127) : (Int64(-112) | 1)),
                ((Int8(Int8(117)) & 127)..(Int8(Int8(116)) & 127) : (Int64(116) | 1)),
                ((Int8(Int8(44)) & 127)..(Int8(Int8(-7)) & 127) : (Int64(-100) | 1)),
                ((Int8(Int8(19)) & 127)..(Int8(Int8(-106)) & 127) : (Int64(63) | 1))], UInt8(Int8(49)), ((Int16(Int16(UInt8(UInt8(188)))) &
                127)..(Int16(Int16(45)) & 127) : (Int64(-112) | 1)), Option<Option<Array<Range<Int8>>>>.None);
        ((Int32(25), var_1770288552946_1476, var_1770288552946_1480, var_1770288552946_40, var_1770288552946_828)[3] as Array<UInt64>)
    }
}

public interface Interface_1770288552946_121 <: Interface_1770288552946_122 {
    static func func_1770288552946_359(namedParam_1770288552946_360!: Float64,
        namedParam_1770288552946_361!: Range<Int32>, namedParam_1770288552946_362!: Option<Float32>,
        namedParam_1770288552946_363!: Range<Int8>): Option<Array<UInt64>> { // block id: 1499
        (Option<(VArray<UInt64, $7>, Option<Array<UInt64>>, (Option<(UInt32, Array<Range<Int8>>)>, Option<Array<UInt64>>))>
            .Some(var_1770288552946_1511) ?? var_1770288552946_1511)[2][1]
    }
}

public sealed interface Interface_1770288552946_120 <: Interface_1770288552946_121 {
    @Frozen
    func func_1770288552946_519(namedParam_1770288552946_520!: Array<Range<Int8>>): Option<Array<Range<Int8>>> { // block id: 521
        var var_1770288552946_523: Option<Array<Range<Int8>>> = (((((UInt64(UInt64(56)) & 127)..(UInt64(UInt64(159)) &
            127) : (Int64(-69) | 1)) as Array<UInt64>) as Array<UInt64>) as Array<Range<Int8>>);
        var_1770288552946_523
    };

    func func_1770288552946_328(): Array<Range<Int8>>

    static func func_1770288552946_359(namedParam_1770288552946_360!: Float64,
        namedParam_1770288552946_361!: Range<Int32>, namedParam_1770288552946_362!: Option<Float32>,
        namedParam_1770288552946_363!: Range<Int8>): Option<Array<UInt64>> { // block id: 1555
        var var_1770288552946_1587: Float64 = Float64(Float32(Float32(Float32(-114.0))));
        ((var_1770288552946_1563 ?? match (var_1770288552946_692) {
            case (caseVar_1770288552946_1569, _: (Option<(UInt32, Array<Range<Int8>>)>, Option<Array<UInt64>>), _) =>
                var var_1770288552946_1573: UInt8 = UInt8(64);
                var_1770288552946_1573 /= ((var_1770288552946_1573) | 1)
                if (var_1770288552946_1072) {
                    var_1770288552946_1236
                } else {
                    Option<Bool>.None
                }

            case (caseVar_1770288552946_1582: Option<Option<Array<Range<Int8>>>>, caseVar_1770288552946_1583, _: Option<(VArray<UInt64, $7>, 
                        Option<Array<UInt64>>, (Option<(UInt32, Array<Range<Int8>>)>, Option<Array<UInt64>>))>) =>
                var_1770288552946_1587 *= Float64(51.0)
                Option<Bool>.Some(true)

            case (caseVar_1770288552946_1597: (Option<Int8>, Float32, Range<UInt16>, Range<Int8>), _: Option<Option<Float32>>, _) => Option<Bool>
                .Some(var_1770288552946_1072)

            case _ =>
                if (var_1770288552946_1606) {
                    Option<Bool>.None
                } else {
                    var_1770288552946_1236
                }

            case _ =>
                var_1770288552946_1139;
                Option<Bool>.Some(true)
        }) as Option<Array<Range<Int8>>>);
        let var_1770288552946_1631: (Float32, String, Array<Range<Int8>>, UInt8, Range<Int16>, Option<Option<Array<Range<Int8>>>>) = (Float32(-118.0),
            "t19.=& HzL", [((Int8(Int8(-108)) & 127)..(Int8(Int8(-10)) & 127) : (Int64(56) | 1)),
                ((Int8(Int8(58)) & 127)..(Int8(Int8(27)) & 127) : (Int64(-34) | 1)),
                ((Int8(Int8(Int8(-115))) & 127)..=(Int8(Int8(-33)) & 127) : (Int64(-106) | 1)),
                ((Int8(Int8(-86)) & 127)..(Int8(Int8(UInt8(222))) & 127) : (Int64(UInt16(186)) | 1)),
                ((Int8(Int8(90)) & 127)..(Int8(Int8(112)) & 127) : (Int64(106) | 1)),
                ((Int8(Int8(-74)) & 127)..(Int8(Int8(UInt8(55))) & 127) : (Int64(-104) | 1)),
                ((Int8(Int8(-12)) & 127)..=(Int8(Int8(77)) & 127) : (Int64(110) | 1)),
                ((Int8(Int8(-102)) & 127)..(Int8(Int8(-68)) & 127) : (Int64(108) | 1)),
                ((Int8(Int8(-101)) & 127)..(Int8(Int8(-43)) & 127) : (Int64(UInt32(117)) | 1)),
                ((Int8(Int8(-88)) & 127)..=(Int8(Int8(16)) & 127) : (Int64(35) | 1))], UInt8(19), ((Int16(Int16(2)) & 127)..=(Int16(Int16(101)) &
                127) : (Int64(-44) | 1)), ((Option<Option<Array<Range<Int8>>>>.Some(Option<Array<Range<Int8>>>.None) as Bool) as Option<Array<Range<Int8>>>));
        let var_1770288552946_1717: Array<UInt64> = [UInt64(11), UInt64(150), UInt64(45), UInt64(12), UInt64(194),
            UInt64(111), UInt64(41), UInt64(149), UInt64(117), UInt64(220)];
        try { // block id: 1618
            var var_1770288552946_1622: Option<Array<UInt64>> = (() as Array<UInt64>);
            (Option<Option<Array<UInt64>>>.Some(var_1770288552946_1622) ?? Option<Array<UInt64>>.None)
        } catch (e: Exception) { // block id: 1626
            var var_1770288552946_1674: String = ###";:GN5v\" Zy"###;
            try { // block id: 1628
                Struct_1770288552946_65();
                var_1770288552946_1631
            } catch (_) { // block id: 1669
                Int64(-56);
                (Float32(-13.0), var_1770288552946_1674, [((Int8(Int8(-70)) & 127)..=(Int8(Int8(85)) & 127) : (Int64(-19) |
                        1)), ((Int8(var_1770288552946_1680) & 127)..(Int8(var_1770288552946_45) & 127) : (Int64(56) | 1)),
                        ((Int8(Int8(-38)) & 127)..(Int8(Int8(105)) & 127) : (var_1770288552946_1198 | 1)),
                        ((Int8(Int8(92)) & 127)..=(Int8(Int8(46)) & 127) : (Int64(22) | 1)),
                        ((Int8(var_1770288552946_1680) & 127)..(Int8(Int8(-49)) & 127) : (Int64(-69) | 1)),
                        ((Int8(var_1770288552946_45) & 127)..=(Int8(Int8(-14)) & 127) : (Int64(-33) | 1)),
                        ((Int8(Int8(-112)) & 127)..(Int8(Int8(-122)) & 127) : (Int64(-75) | 1)), var_1770288552946_573,
                        ((Int8(var_1770288552946_45) & 127)..=(Int8(var_1770288552946_1680) & 127) : (Int64(53) | 1)),
                        ((Int8(Int8(37)) & 127)..(Int8(Int8(125)) & 127) : (Int64(29) | 1))], UInt8(97), ((Int16(var_1770288552946_1456) &
                        127)..=(Int16(Int16(-68)) & 127) : (var_1770288552946_1198 | 1)),
                    Option<Option<Array<Range<Int8>>>>.Some(Option<Array<Range<Int8>>>.None))
            };
            (var_1770288552946_1549 ?? Option<Array<UInt64>>.Some(var_1770288552946_1717))
        } finally { // block id: 1719
            var_1770288552946_1721
        }
    }
}

public open class Class_1770288552946_117 <: Class_1770288552946_91 & Interface_1770288552946_120 & Interface_1770288552946_122 {
    public init() { // block id: 119

    }

    @Frozen
    mut prop var_1770288552946_500: Bool { // block id: 501
        get() { // block id: 503
            (Option<Int8>.None is Array<Option<Int8>>)
        }
        set(Value) { // block id: 508
            ();
            ()
        }
    }
    public override func func_1770288552946_328(): Array<Range<Int8>> { // block id: 329
        for (iter in (Interface_1770288552946_123.func_1770288552946_359(namedParam_1770288552946_360: Float64(-59.0),
            namedParam_1770288552946_361: ((Int32(Int32(84)) & 127)..=(Int32(Int32(-1)) & 127) : (Int64(-117) | 1)),
            namedParam_1770288552946_362: Option<Float32>.None,
            namedParam_1770288552946_363: ((Int8(Int8(-63)) & 127)..(Int8(Int8(50)) & 127) : (Int64(-30) | 1))) ??
            var_1770288552946_474) where (Option<(Option<Int8>, Float32, Range<UInt16>, Range<Int8>)>.Some(
            var_1770288552946_334) is Range<Int8>)) {
        }
        let var_1770288552946_529: Array<Range<Int8>> = [((Int8(Int8(105)) & 127)..=(Int8(Int8(-100)) & 127) : (Int64(92) |
            1)), ((Int8(Int8(-7)) & 127)..(Int8(Int8(29)) & 127) : (Int64(13) | 1)),
            ((Int8(Int8(-81)) & 127)..(Int8(Int8(59)) & 127) : (Int64(87) | 1)),
            ((Int8(Int8(11)) & 127)..=(Int8(Int8(109)) & 127) : (Int64(21) | 1)),
            ((Int8(Int8(16)) & 127)..(Int8(Int8(-17)) & 127) : (Int64(8) | 1)),
            ((Int8(Int8(52)) & 127)..(Int8(Int8(81)) & 127) : (Int64(112) | 1)),
            ((Int8(Int8(-123)) & 127)..=(Int8(Int8(-54)) & 127) : (Int64(-16) | 1)),
            ((Int8(Int8(9)) & 127)..=(Int8(Int8(53)) & 127) : (Int64(-53) | 1)),
            ((Int8(Int8(-47)) & 127)..(Int8(Int8(-3)) & 127) : (Int64(-26) | 1)),
            ((Int8(Int8(-25)) & 127)..=(Int8(Int8(-7)) & 127) : (Int64(104) | 1))];
        let var_1770288552946_536: Struct_1770288552946_532 = Struct_1770288552946_532();
        ((((var_1770288552946_500, UInt64(213), Float32(-68.0), var_1770288552946_289) as Option<Array<Range<Int8>>>) ??
            var_1770288552946_516.func_1770288552946_519(namedParam_1770288552946_520: var_1770288552946_529)) ??
            var_1770288552946_536.func_1770288552946_539(namedParam_1770288552946_540: var_1770288552946_822))
    };

    public static func func_1770288552946_359(namedParam_1770288552946_360!: Float64,
        namedParam_1770288552946_361!: Range<Int32>, namedParam_1770288552946_362!: Option<Float32>,
        namedParam_1770288552946_363!: Range<Int8>): Option<Array<UInt64>> { // block id: 1539
        ();
        (try { // block id: 1547
            var_1770288552946_1549
        } catch (e: Exception) { // block id: 1551
            Option<Option<Array<UInt64>>>.None
        } ?? Option<Array<UInt64>>.None)
    };

    public open override func func_1770288552946_519(namedParam_1770288552946_520!: Array<Range<Int8>>): Option<Array<Range<Int8>>> { // block id: 1748
        (if (if (true) { // block id: 1753
            var_1770288552946_1755
        } else if (true) { // block id: 1758
            false
        } else { // block id: 1760
            false
        }) { // block id: 1762
            if (var_1770288552946_1606) {
                var_1770288552946_289
            } else {
                var_1770288552946_289
            };
            var_1770288552946_1768
        } else if (var_1770288552946_603 == Int32(18)) { // block id: 1773
            var_1770288552946_105;
            UInt8(176)
        } else { // block id: 1776
            var_1770288552946_1768++;
            var_1770288552946_1768
        } as Array<Range<Int8>>)
    }
}

@Deprecated
const func func_1770288552946_366(param_1770288552946_367: UInt32): Unit { // block id: 368

}

public struct Struct_1770288552946_532 {
    public init() { // block id: 534

    }

    @Frozen
    public prop var_1770288552946_592: Bool { // block id: 593
        get() { // block id: 595
            false
        }
    }
    static let var_1770288552946_615: Range<UInt16> = ((UInt16(UInt16(128)) & 127)..=(UInt16(UInt16(73)) & 127) : (Int64(14) |
        1));
    public let var_1770288552946_652: Option<Option<Array<Range<Int8>>>> = Option<Option<Array<Range<Int8>>>>.None;

    @Frozen
    public static prop var_1770288552946_735: (Bool, UInt64, Float32, Option<(Option<Int8>, Float32, Range<UInt16>, 
        Range<Int8>)>) { // block id: 736
        get() { // block id: 738
            ();
            (false, UInt64(164), Float32(4.0), ((UInt16(26), """
Q7a{i|
>Y\"=Z
""", false) as (Option<Int8>, Float32, 
                    Range<UInt16>, Range<Int8>)))
        }
    }

    @Frozen
    private mut prop var_1770288552946_799: Float64 { // block id: 800
        get() { // block id: 802
            Float64(Float32(Float32(11.0)))
        }
        set(Value) { // block id: 808
            UInt64(74);
            ()
        }
    }
    func func_1770288552946_539(namedParam_1770288552946_540!: UInt64): Array<Range<Int8>> { // block id: 541
        var var_1770288552946_550: Option<Range<Int64>> = Option<Range<Int64>>.Some(
            ((Int64(Int64(Int32(Int8(118)))) & 127)..(Int64(Int64(-106)) & 127) : (Int64(5) | 1)));
        let var_1770288552946_560: Int64 = Int64(UInt32(213));
        var var_1770288552946_586: Int16 = Int16(84);
        try (resource = Class_1770288552946_91()) { // block id: 543
            (var_1770288552946_550 ?? ((Int64(var_1770288552946_560) & 127)..(Int64(Int64(-63)) & 127) : (var_1770288552946_560 |
                1)));
            var_1770288552946_261
        } catch (_) { // block id: 566
            Option<Array<Range<Int8>>>.Some(
                [((Int8(Int8(-78)) & 127)..=(Int8(Int8(51)) & 127) : (Int64(115) | 1)),
                    ((Int8(Int8(94)) & 127)..(Int8(Int8(96)) & 127) : (Int64(45) | 1)),
                    ((Int8(Int8(-8)) & 127)..(Int8(Int8(82)) & 127) : (Int64(-64) | 1)), var_1770288552946_573,
                    ((Int8(Int8(90)) & 127)..(Int8(Int8(89)) & 127) : (Int64(-50) | 1)), var_1770288552946_573,
                    var_1770288552946_573, var_1770288552946_573,
                    ((Int8(Int8(-79)) & 127)..(Int8(Int8(-11)) & 127) : (Int64(101) | 1)),
                    ((Int8(Int8(71)) & 127)..(Int8(Int8(102)) & 127) : (Int64(37) | 1))]);
            ()
        } finally { // block id: 582
            Int16(-83) ^ var_1770288552946_586;
            if (true) { // block id: 590

            } else if (var_1770288552946_592) { // block id: 597
                Option<Option<Float32>>.None;
                ()
            }
        };
        let var_1770288552946_659: (Float32, String, Array<Range<Int8>>, UInt8, Range<Int16>, Option<Option<Array<Range<Int8>>>>) = (Float32(-5.0),
            """
UXHp0
Z0;&c
""", [((Int8(Int8(37)) & 127)..(Int8(Int8(-33)) & 127) : (Int64(52) | 1)),
                ((Int8(Int8(123)) & 127)..=(Int8(Int8(-63)) & 127) : (Int64(-104) | 1)),
                ((Int8(Int8(28)) & 127)..=(Int8(Int8(125)) & 127) : (Int64(35) | 1)),
                ((Int8(Int8(103)) & 127)..(Int8(Int8(-122)) & 127) : (Int64(-42) | 1)),
                ((Int8(Int8(49)) & 127)..(Int8(Int8(24)) & 127) : (Int64(101) | 1)),
                ((Int8(Int8(-36)) & 127)..(Int8(Int8(63)) & 127) : (Int64(68) | 1)),
                ((Int8(Int8(63)) & 127)..=(Int8(Int8(-32)) & 127) : (Int64(101) | 1)),
                ((Int8(Int8(87)) & 127)..(Int8(Int8(-21)) & 127) : (Int64(-4) | 1)),
                ((Int8(Int8(-21)) & 127)..(Int8(Int8(44)) & 127) : (Int64(70) | 1)),
                ((Int8(Int8(8)) & 127)..=(Int8(Int8(-37)) & 127) : (Int64(-48) | 1))], UInt8(167), ((Int16(Int16(0)) &
                127)..(Int16(Int16(-104)) & 127) : (Int64(-35) | 1)), (((UInt32(216), [((Int8(Int8(58)) & 127)..(Int8(Int8(95)) &
                    127) : (Int64(15) | 1)), ((Int8(Int8(-57)) & 127)..=(Int8(Int8(-91)) & 127) : (Int64(-44) | 1)),
                    ((Int8(Int8(101)) & 127)..(Int8(Int8(-95)) & 127) : (Int64(-96) | 1)),
                    ((Int8(Int8(-22)) & 127)..(Int8(Int8(39)) & 127) : (Int64(110) | 1)),
                    ((Int8(Int8(19)) & 127)..(Int8(Int8(-120)) & 127) : (Int64(123) | 1)),
                    ((Int8(Int8(90)) & 127)..(Int8(Int8(-3)) & 127) : (Int64(6) | 1)),
                    ((Int8(Int8(85)) & 127)..=(Int8(Int8(125)) & 127) : (Int64(-81) | 1)),
                    ((Int8(Int8(-102)) & 127)..(Int8(Int8(4)) & 127) : (Int64(25) | 1)),
                    ((Int8(Int8(27)) & 127)..=(Int8(Int8(38)) & 127) : (Int64(68) | 1)),
                    ((Int8(Int8(64)) & 127)..(Int8(Int8(-69)) & 127) : (Int64(56) | 1))]) as Int8) as Option<Array<Range<Int8>>>));
        var var_1770288552946_763: Float32 = Float32(Float32(55.0));
        [match (var_1770288552946_603) {
            case -122 => ((Int8(Int8(-3)) & 127)..=(Int8(Int8(20)) & 127) : (Int64(-85) | 1))

            case 65 | -82 =>
                if (false) {
                    var_1770288552946_615
                } else {
                    ((UInt16(UInt16(65)) & 127)..(UInt16(var_1770288552946_83) & 127) : (Int64(-108) | 1))
                };
                ((Int8(Int8(-114)) & 127)..=(Int8(Int8(73)) & 127) : (Int64(-57) | 1))

            case 96 =>
                var_1770288552946_261;
                ((Int8(var_1770288552946_45) & 127)..=(Int8(Int8(11)) & 127) : (var_1770288552946_560 | 1))

            case _ => ((Int8(Int8(10)) & 127)..=(Int8(Int8(-63)) & 127) : (Int64(-8) | 1))
        }, try { // block id: 638
            var_1770288552946_155;
            if (false) {
                ((Int8(Int8(40)) & 127)..(Int8(Int8(33)) & 127) : (Int64(51) | 1))
            } else {
                ((Int8(var_1770288552946_45) & 127)..=(Int8(Int8(-41)) & 127) : (var_1770288552946_560 | 1))
            }
        } finally { // block id: 650
            var_1770288552946_652;
            var_1770288552946_573
        }, match (var_1770288552946_659[3]) {
            case _ =>
                var var_1770288552946_683: Int8 = Int8(UInt8(170));
                if (var_1770288552946_592) {
                    ((Int8(var_1770288552946_45) & 127)..=(Int8(var_1770288552946_683) & 127) : (Int64(6) | 1))
                } else {
                    ((Int8(Int8(-79)) & 127)..=(Int8(Int8(-101)) & 127) : (Int64(68) | 1))
                }
        }, if (var_1770288552946_692[2]) {
            (if (true) {
                ((Int8(var_1770288552946_45) & 127)..=(Int8(Int8(-87)) & 127) : (Int64(124) | 1))
            } else {
                ((Int8(Int8(-86)) & 127)..=(Int8(Int8(-62)) & 127) : (Int64(120) | 1))
            })
        } else {
            (if (false) {
                ((Int8(Int8(24)) & 127)..(Int8(Int8(-126)) & 127) : (Int64(53) | 1))
            } else {
                ((Int8(Int8(-49)) & 127)..(Int8(Int8(115)) & 127) : (Int64(7) | 1))
            })
        }, var_1770288552946_573, try { // block id: 715
            ((Int8(Int8(42)) & 127)..(Int8(Int8(-25)) & 127) : (Int64(-32) | 1))
        } catch (e: Exception) { // block id: 717
            ((Int8(var_1770288552946_45) & 127)..(Int8(Int8(101)) & 127) : (Int64(63) | 1))
        },
            if (var_1770288552946_586 == var_1770288552946_586) { // block id: 726
            ((Int8(var_1770288552946_45) & 127)..(Int8(Int8(43)) & 127) : (Int64(-83) | 1))
        } else if (if (var_1770288552946_592) { // block id: 733
            var_1770288552946_735;
            true
        } else if (true) { // block id: 751
            var_1770288552946_592
        } else { // block id: 753
            false
        }) { // block id: 755
            var var_1770288552946_758: Float32 = Float32(Float32(Float32(-66.0)));
            var_1770288552946_758 /= Float32((Int32(var_1770288552946_763)) | 1)
            ((Int8(Int8(122)) & 127)..=(Int8(Int8(-55)) & 127) : (Int64(91) | 1))
        } else { // block id: 767
            Class_1770288552946_117();
            ((Int8(Int8(-31)) & 127)..(Int8(Int8(4)) & 127) : (Int64(32) | 1))
        }, (var_1770288552946_776 ?? match (Class_1770288552946_117()) {
            case _: Range<Int64> =>
                var_1770288552946_659;
                var_1770288552946_573

            case _ => ((Int8(Int8(-53)) & 127)..=(Int8(Int8(-110)) & 127) : (Int64(-5) | 1))
        }), try { // block id: 791
            ();
            ((Int8(Int8(118)) & 127)..(Int8(Int8(-78)) & 127) : (Int64(41) | 1))
        } catch (e: Exception) { // block id: 797
            var_1770288552946_799;
            if (var_1770288552946_592) {
                ((Int8(Int8(46)) & 127)..(Int8(Int8(-66)) & 127) : (Int64(24) | 1))
            } else {
                ((Int8(var_1770288552946_45) & 127)..(Int8(var_1770288552946_45) & 127) : (var_1770288552946_560 | 1))
            }
        },
            [((Int8(Int8(-101)) & 127)..=(Int8(Int8(-90)) & 127) : (Int64(-77) | 1)),
            ((Int8(Int8(-96)) & 127)..(Int8(Int8(124)) & 127) : (Int64(62) | 1)),
            ((Int8(Int8(39)) & 127)..=(Int8(Int8(61)) & 127) : (Int64(-79) | 1)),
            ((Int8(Int8(-33)) & 127)..(Int8(Int8(-79)) & 127) : (Int64(-65) | 1)),
            ((Int8(Int8(119)) & 127)..(Int8(Int8(64)) & 127) : (Int64(101) | 1)),
            ((Int8(Int8(-19)) & 127)..(Int8(Int8(-40)) & 127) : (Int64(-81) | 1)),
            ((Int8(Int8(-18)) & 127)..=(Int8(Int8(-118)) & 127) : (Int64(-55) | 1)),
            ((Int8(Int8(-87)) & 127)..(Int8(Int8(97)) & 127) : (Int64(26) | 1)),
            ((Int8(Int8(-64)) & 127)..=(Int8(Int8(69)) & 127) : (Int64(-96) | 1)),
            ((Int8(Int8(-16)) & 127)..(Int8(Int8(-83)) & 127) : (Int64(67) | 1))][1]]
    }
}

@Frozen
public func func_1770288552946_321(): Range<Int8> { // block id: 322
    var_1770288552946_125.func_1770288552946_328()[6]
}

public func func_1770288552946_257(param_1770288552946_258: UInt64): Option<Int8> { // block id: 259
    var_1770288552946_261;
    Struct_1770288552946_65.func_1770288552946_266(var_1770288552946_828 * Float64(118.0),
        optionalParam_1770288552946_268: var_1770288552946_834[3])
}

@Frozen
public func func_1770288552946_321(param_1770288552946_139: Interface_1770288552946_122): Range<UInt8> { // block id: 140
    var var_1770288552946_163: Bool = true;
    var var_1770288552946_918: Unit = ();
    let var_1770288552946_1011: UInt8 = UInt8(64);
    match ([match (var_1770288552946_40) {
        case _ =>
            UInt16(173);
            var_1770288552946_40

        case caseVar_1770288552946_152 =>
            var_1770288552946_155;
            Option<Int8>.None

        case _ =>
            var_1770288552946_163 &&= true
            var var_1770288552946_170: ?Int8 = Option<Int8>.Some(Int8(Int8(Int8(Int8(108)))));
            if (var_1770288552946_163) {
                Option<Int8>.None
            } else {
                var_1770288552946_170
            }
    }, Class_1770288552946_91.var_1770288552946_179, var_1770288552946_210[8], var_1770288552946_40,
        (var_1770288552946_822 |> func_1770288552946_257), try { // block id: 912
        var_1770288552946_155;
        Option<Int8>.Some(Int8(-69))
    } catch (e: Exception) { // block id: 916
        var_1770288552946_918;
        if (var_1770288552946_163) {
            var_1770288552946_40
        } else {
            var_1770288552946_40
        }
    } finally { // block id: 924
        if (var_1770288552946_163) {
            Option<Int8>.Some(Int8(-87))
        } else {
            Option<Int8>.None
        }
    }, match (((UInt8(UInt8(14)) & 127)..=(UInt8(UInt8(130)) & 127) : (Int64(-61) | 1))) {
        case caseVar_1770288552946_937 => var_1770288552946_40

        case caseVar_1770288552946_942: (Bool, UInt64, Float32, Option<(Option<Int8>, Float32, Range<UInt16>, Range<Int8>)>) =>
            var var_1770288552946_946: UInt8 = UInt8(UInt8(Int8(UInt8(48))));
            var var_1770288552946_952: Byte = UInt8(120);
            var_1770288552946_946 += var_1770288552946_952
            Option<Int8>.Some(var_1770288552946_45)

        case _ =>
            var_1770288552946_961 ^= UInt16(159)
            var_1770288552946_40
    },
        [var_1770288552946_40, Option<Int8>.None, Option<Int8>.Some(Int8(-17)), var_1770288552946_40,
        var_1770288552946_973, var_1770288552946_973, Option<Int8>.None, var_1770288552946_973, var_1770288552946_40,
        var_1770288552946_40][1], if (var_1770288552946_163) { // block id: 983
        var_1770288552946_69;
        Option<Int8>.None
    } else { // block id: 986
        Option<Int8>.Some(var_1770288552946_45)
    }, match (Struct_1770288552946_532()) {
        case caseVar_1770288552946_993: Range<Int32> => var_1770288552946_973

        case _ =>
            if (var_1770288552946_163) {
                var_1770288552946_40
            } else {
                var_1770288552946_40
            }
    }]) {
        case _ =>
            var_1770288552946_918;
            var var_1770288552946_1016: Range<UInt8> = ((UInt8(UInt8(35)) & 127)..(UInt8(UInt8(UInt8(UInt8(UInt8(20))))) &
                127) : (Int64(-45) | 1));
            if (false) {
                ((UInt8(var_1770288552946_1011) & 127)..(UInt8(var_1770288552946_1011) & 127) : (Int64(102) | 1))
            } else {
                var_1770288552946_1016
            }

        case caseVar_1770288552946_1026: Int64 =>
            if (true) {
                ((UInt8(UInt8(249)) & 127)..=(UInt8(UInt8(251)) & 127) : (Int64(-75) | 1))
            } else {
                ((UInt8(UInt8(163)) & 127)..=(UInt8(UInt8(202)) & 127) : (Int64(58) | 1))
            }

        case _ => ((UInt8(var_1770288552946_1011) & 127)..=(UInt8(var_1770288552946_1041) & 127) : (Int64(111) | 1))

        case _ =>
            var_1770288552946_1048;
            ((UInt8(UInt8(200)) & 127)..(UInt8(UInt8(243)) & 127) : (Int64(31) | 1))
    }
}

var _: Future<Unit> = {
    => spawn {
        while (true) {
            sleep(1000 * Duration.second)
            GC()
        }
    }
}()

main(): Int64 {
    let var_1770288552946_24: UInt16 = UInt16(163);
    var var_1770288552946_31: ?Int8 = Option<Int8>.Some(Int8(Int8(UInt8(UInt8(18)))));
    (try { // block id: 22
        var_1770288552946_24;
        [Option<Int8>.Some(Int8(30)), Option<Int8>.None, var_1770288552946_31, Option<Int8>.None, var_1770288552946_31,
            var_1770288552946_40, var_1770288552946_31, Option<Int8>.Some(var_1770288552946_45),
            Option<Int8>.Some(Int8(13)), Option<Int8>.None]
    } finally { // block id: 50
        [var_1770288552946_31, var_1770288552946_31, var_1770288552946_40, var_1770288552946_31, var_1770288552946_40,
            Option<Int8>.Some(Int8(0)), Option<Int8>.None, var_1770288552946_31, var_1770288552946_40, Option<Int8>.None]
    }[4] ?? var_1770288552946_69.func_1770288552946_72());
    const var_1770288552946_1245: String = """
'$Y6$
j7]'Q
""";
    var var_1770288552946_1252: Rune = r'c';
    var var_1770288552946_1256: Option<Interface_1770288552946_122> = Option<Interface_1770288552946_122>.None;
    var var_1770288552946_1259: Range<UInt16> = ((UInt16(UInt16(60)) & 127)..(UInt16(UInt16(234)) & 127) : (Int64(-34) |
        1));
    (if ((var_1770288552946_24, """
MNSgE
a{>I(\\
""", var_1770288552946_1072)[2]) {
        (var_1770288552946_1236, Option<Range<Int8>>.Some(
                ((Int8(Int8(48)) & 127)..=(Int8(Int8(7)) & 127) : (Int64(97) | 1))), var_1770288552946_334, (var_1770288552946_24,
                var_1770288552946_1245, var_1770288552946_1072), var_1770288552946_1249, var_1770288552946_1252, Int32(72),
            var_1770288552946_1256, var_1770288552946_1259)[4]
    } else {
        Option<Int64>.Some(Int64(-4))
    } ?? match (try { // block id: 1266
        var_1770288552946_1139;
        var_1770288552946_1048
    } finally { // block id: 1269
        var_1770288552946_1048
    }) {
        case _: Option<(Option<Int8>, Float32, Range<UInt16>, Range<Int8>)> =>
            Option<Array<Range<Int8>>>.Some(
                [((Int8(Int8(6)) & 127)..(Int8(Int8(123)) & 127) : (Int64(52) | 1)),
                    ((Int8(Int8(-41)) & 127)..(Int8(Int8(-110)) & 127) : (Int64(-112) | 1)),
                    ((Int8(Int8(26)) & 127)..=(Int8(Int8(45)) & 127) : (Int64(-9) | 1)),
                    ((Int8(Int8(-87)) & 127)..=(Int8(Int8(117)) & 127) : (Int64(-10) | 1)),
                    ((Int8(Int8(109)) & 127)..=(Int8(Int8(-101)) & 127) : (Int64(75) | 1)),
                    ((Int8(Int8(-38)) & 127)..(Int8(Int8(-1)) & 127) : (Int64(2) | 1)),
                    ((Int8(Int8(-105)) & 127)..=(Int8(Int8(-26)) & 127) : (Int64(54) | 1)),
                    ((Int8(Int8(45)) & 127)..(Int8(Int8(-92)) & 127) : (Int64(26) | 1)),
                    ((Int8(Int8(-123)) & 127)..=(Int8(Int8(17)) & 127) : (Int64(86) | 1)),
                    ((Int8(Int8(0)) & 127)..=(Int8(Int8(-50)) & 127) : (Int64(73) | 1))]);
            var_1770288552946_1198

        case caseVar_1770288552946_1279 => var_1770288552946_1198

        case _ => var_1770288552946_1198
    })
    // CRC Check All Variables
    CrcCheck.crc32(UInt64(var_1770288552946_24))
    CrcCheck.crc32(UInt64(var_1770288552946_603))
    CrcCheck.crc32(UInt64(var_1770288552946_822))
    CrcCheck.crc32(UInt64(var_1770288552946_1041))
    CrcCheck.crc32(UInt64(var_1770288552946_1456))
    println(CrcCheck.str)
    return 0
}

class CrcCheck {
    static var str: String = ""
    private static var crcTable = Array<UInt32>(
        256,
        {
            i =>
                var crc = UInt32(i)
                for (_ in 0..8) {
                    crc = (crc >> 1) ^ (if ((crc & 1) != 0) {
                        0xEDB88320u32
                    } else {
                        0u32
                    })
                }
                crc
        }
    )
    static func crc32(value: UInt64) {
        var crc = 0xFFFFFFFFu32
        var buffer = Array<UInt8>(8, {i => UInt8((value >> (7 - i) * 8) & 0xFF)})
        for (b in buffer) {
            var index = Int64((crc & 0xFF) ^ UInt32(b))
            crc = (crc >> 8) ^ crcTable[index]
        }
        str += (!crc).toString()
    }
}

func printMemInfo() {
    println("getMaxHeapSize = ${getMaxHeapSize()}")
    println("getAllocatedHeapSize = ${getAllocatedHeapSize()}")
    println("getUsedHeapSize = ${getUsedHeapSize()}")
    println("getGCCount = ${getGCCount()}")
    println("getGCFreedSize = ${getGCFreedSize()}")
    println("getGCTime = ${getGCTime()}")
}

extend Class_1770288552946_117 {}
