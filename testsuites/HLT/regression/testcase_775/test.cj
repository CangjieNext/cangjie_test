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

// random seed:1770287364610
// All global variable need to be defined before use!
import std.collection.*
import std.runtime.*
import std.time.*

@Deprecated
internal let var_1770287364610_47: ?Rune = (() as Rune)
public var var_1770287364610_53: Unit = ()
public let var_1770287364610_57: Rune = r'B'
public let var_1770287364610_101: Unit = ()
public var var_1770287364610_108: Int32 = Int32(UInt32(Int8(-91)))
public var var_1770287364610_137: Int8 = Int8(UInt8(252))
@Deprecated
public var var_1770287364610_143: Bool = (Int8(24) is Struct_1770287364610_21)
public let var_1770287364610_187: Byte = UInt8(49)
public let var_1770287364610_191: Int64 = Int64(67)
var var_1770287364610_194: Range<Int64> = ((Int64(Int64(59)) & 127)..(Int64(Int64(-24)) & 127) : (Int64(-125) | 1))
public var var_1770287364610_201: UInt = UInt64(222)
@Deprecated
public var var_1770287364610_207: (Range<UInt8>, Range<Int64>, Unit, Int8) = (((UInt8(UInt8(Int8(-11))) & 127)..=(UInt8(UInt8(143)) &
        127) : (Int64(UInt64(186)) | 1)), ((Int64(Int64(-58)) & 127)..=(Int64(Int64(UInt8(239))) & 127) : (Int64(Int32(Int16(-103))) |
        1)), (), Int8(Int8(-47)))
@Deprecated
public var var_1770287364610_242: Class_1770287364610_227 = Class_1770287364610_227()
@Deprecated
internal var var_1770287364610_285: Range<UInt64> = ((UInt64(UInt64(206)) & 127)..(UInt64(UInt64(UInt8(253))) & 127) : (Int64(95) |
    1))
public let var_1770287364610_308: Struct_1770287364610_21 = Struct_1770287364610_21()
@Deprecated
public let var_1770287364610_312: Float64 = Float64(-59.0)
@Deprecated
public let var_1770287364610_333: VArray<Bool, $6> = [(((UInt16(UInt16(64)) & 127)..=(UInt16(UInt16(UInt8(106))) & 127) : (Int64(UInt64(100)) |
    1)) is Struct_1770287364610_21), (Class_1770287364610_227() is Interface_1770287364610_240),
    (((Int16(Int16(23)) & 127)..=(Int16(Int16(UInt16(90))) & 127) : (Int64(Int8(-33)) | 1)) is Interface_1770287364610_236<Option<Rune>,
    Range<Int8>>), true, false, false]
public var var_1770287364610_358: Int = Int64(-41)
@Deprecated
public const var_1770287364610_385: UInt32 = 12
@Deprecated
public let var_1770287364610_413: Range<Int8> = ((Int8(Int8(18)) & 127)..(Int8(Int8(-21)) & 127) : (Int64(-85) | 1))
public var var_1770287364610_418: Int16 = Int16(-2)
public let var_1770287364610_424: Array<Class_1770287364610_254> = [Class_1770287364610_254(), Class_1770287364610_254(),
    Class_1770287364610_254(), Class_1770287364610_254(), Class_1770287364610_254(), Class_1770287364610_254(),
    Class_1770287364610_254(), Class_1770287364610_254(), Class_1770287364610_254(), Class_1770287364610_254()]
public var var_1770287364610_442: VArray<Bool, $2> = [false, false]
var var_1770287364610_513: ?String = (Int32(75) as String)
public var var_1770287364610_580: String = "U.0/l'9U5W"
internal var var_1770287364610_583: Option<Unit> = ((((Int16(Int16(UInt16(179))) & 127)..=(Int16(Int16(-108)) & 127) : (Int64(Int64(-15)) |
    1)) as Rune) as Unit)
@Deprecated
public const var_1770287364610_598: UInt16 = 47
public let var_1770287364610_632: ?Rune = (Float64(Float32(-47.0)) as Rune)
public let var_1770287364610_640: (Class_1770287364610_254, Range<UInt64>, Range<UInt16>, Int64, UInt64) = (Class_1770287364610_254(),
    ((UInt64(UInt64(231)) & 127)..(UInt64(UInt64(UInt64(UInt16(170)))) & 127) : (Int64(30) | 1)), ((UInt16(UInt16(154)) &
        127)..(UInt16(UInt16(UInt8(UInt8(169)))) & 127) : (Int64(Int32(-13)) | 1)), Int64(Int32(UInt32(122))), UInt64(92))
public let var_1770287364610_675: (UInt8, Struct_1770287364610_21, Class_1770287364610_254) = (UInt8(Int8(-68)),
    Struct_1770287364610_21(), Class_1770287364610_254())
public var var_1770287364610_691: UInt16 = UInt16(UInt8(16))
public var var_1770287364610_729: VArray<Bool, $7> = VArray<Bool, $7>(repeat: ((UInt16(25), (), UInt32(230),
        Class_1770287364610_227()) is Interface_1770287364610_231))
public var var_1770287364610_753: Array<UInt64> = [UInt64(5), UInt64(220), UInt64(236), UInt64(135), UInt64(67),
    UInt64(71), UInt64(107), UInt64(87), UInt64(193), UInt64(242)]
public let var_1770287364610_772: Class_1770287364610_254 = Class_1770287364610_254()
public var var_1770287364610_783: Interface_1770287364610_240 = Class_1770287364610_227()
public var var_1770287364610_788: Struct_1770287364610_21 = Struct_1770287364610_21()
public let var_1770287364610_797: Option<Unit> = (Class_1770287364610_254() as Unit)
public let var_1770287364610_814: (Range<UInt16>, (Class_1770287364610_254, Range<UInt64>, Range<UInt16>, Int64, UInt64), 
    Range<Int8>, (Rune, Rune, Option<Rune>, Bool, Range<UInt32>, Int32, Array<UInt64>, Struct_1770287364610_21), Range<Int64>) = (((UInt16(UInt16(191)) &
        127)..=(UInt16(UInt16(242)) & 127) : (Int64(UInt32(UInt16(88))) | 1)), (Class_1770287364610_254(), ((UInt64(UInt64(133)) &
            127)..=(UInt64(UInt64(9)) & 127) : (Int64(17) | 1)), ((UInt16(UInt16(UInt8(174))) & 127)..=(UInt16(UInt16(69)) &
            127) : (Int64(UInt32(251)) | 1)), Int64(UInt8(UInt8(238))), UInt64(Int64(-98))), ((Int8(Int8(Int8(-107))) &
        127)..(Int8(Int8(17)) & 127) : (Int64(46) | 1)), (r'G', r'H', Option<Rune>.None, (Int8(UInt8(67)) is Class_1770287364610_227),
        ((UInt32(UInt32(242)) & 127)..(UInt32(UInt32(225)) & 127) : (Int64(66) | 1)), Int32(UInt32(UInt32(170))), [UInt64(9),
            UInt64(213), UInt64(196), UInt64(Int32(16)), UInt64(UInt8(232)), UInt64(220), UInt64(80), UInt64(139),
            UInt64(UInt16(143)), UInt64(140)], Struct_1770287364610_21()), ((Int64(Int64(17)) & 127)..=(Int64(Int64(-44)) &
        127) : (Int64(-27) | 1)))
public let var_1770287364610_879: Class_1770287364610_254 = Class_1770287364610_254()
public let var_1770287364610_885: Array<VArray<Bool, $6>> = [[false, false, true, false, true, false],
    [false, true, true, false, false, true], [true, false, true, false, false, false],
    [true, true, false, false, true, false], [false, false, false, false, false, false],
    [false, true, false, true, true, false], [true, false, true, false, false, true],
    [false, false, false, true, true, false], [false, false, true, false, true, true],
    [true, false, false, false, true, false]]
let var_1770287364610_940: Option<UInt16> = (Option<UInt8>.None as UInt16)
public let var_1770287364610_1010: Range<UInt8> = ((UInt8(UInt8(122)) & 127)..(UInt8(UInt8(53)) & 127) : (Int64(-113) | 1))
public let var_1770287364610_1016: VArray<Bool, $6> = [false, true, false, false, false, true]
public let var_1770287364610_1047: Bool = false
public const var_1770287364610_1099: Bool = false
var var_1770287364610_1221: ?Bool = Option<Bool>.None
public var var_1770287364610_1224: Option<Option<Bool>> = Option<Option<Bool>>.None
public const var_1770287364610_1231: Float32 = 9.0
public var var_1770287364610_1302: Bool = (Option<String>.None is Class_1770287364610_254)
public const var_1770287364610_1330: Bool = false
public let var_1770287364610_1353: Bool = ([UInt64(235), UInt64(134), UInt64(4), UInt64(77), UInt64(149), UInt64(90),
    UInt64(36), UInt64(122), UInt64(39), UInt64(234)] is (Range<UInt16>, (Class_1770287364610_254, Range<UInt64>, Range<UInt16>, 
    Int64, UInt64), Range<Int8>, (Rune, Rune, Option<Rune>, Bool, Range<UInt32>, Int32, Array<UInt64>, 
    Struct_1770287364610_21), Range<Int64>))
var var_1770287364610_1357: Range<UInt16> = ((UInt16(UInt16(113)) & 127)..(UInt16(UInt16(70)) & 127) : (Int64(16) | 1))
public let var_1770287364610_1364: Bool = true
public var var_1770287364610_1457: ?Rune = ([Class_1770287364610_254(), Class_1770287364610_254(),
    Class_1770287364610_254(), Class_1770287364610_254(), Class_1770287364610_254(), Class_1770287364610_254(),
    Class_1770287364610_254(), Class_1770287364610_254(), Class_1770287364610_254(), Class_1770287364610_254()] as Rune)
public var var_1770287364610_1574: ?Array<UInt64> = Option<Array<UInt64>>.None
var var_1770287364610_1579: Int32 = Int32(-2)
var var_1770287364610_1606: Bool = ((Option<Unit>.None as UInt16) is Option<UInt16>)
public var var_1770287364610_1621: UInt32 = UInt32(58)
public var var_1770287364610_1652: Option<Option<(Int32, Struct_1770287364610_21, UInt8)>> = ((r'U', r'b', Option<Rune>
        .None, true, ((UInt32(UInt32(183)) & 127)..=(UInt32(UInt32(134)) & 127) : (Int64(Int16(-37)) | 1)), Int32(-80), [UInt64(177),
        UInt64(Int64(103)), UInt64(39), UInt64(Int16(-37)), UInt64(Int64(38)), UInt64(UInt16(133)), UInt64(Int64(-124)),
        UInt64(Int64(-124)), UInt64(57), UInt64(Int8(82))], Struct_1770287364610_21()) as Option<(Int32, 
    Struct_1770287364610_21, UInt8)>)
public var var_1770287364610_1685: ?(Int32, Struct_1770287364610_21, UInt8) = (((UInt8(49) as Unit),
    Class_1770287364610_227(), (UInt8(Int8(-44)), Struct_1770287364610_21(), Class_1770287364610_254())) as (Int32, 
    Struct_1770287364610_21, UInt8))
public let var_1770287364610_1746: Struct_1770287364610_21 = Struct_1770287364610_21()
public var var_1770287364610_1768: ?Range<UInt64> = (Option<UInt16>.None as Range<UInt64>)
public let var_1770287364610_1772: Range<UInt64> = ((UInt64(UInt64(123)) & 127)..=(UInt64(UInt64(UInt32(231))) & 127) : (Int64(32) |
    1))
let var_1770287364610_1843: Array<UInt64> = [UInt64(Int32(UInt32(193))), UInt64(159), UInt64(28), UInt64(204),
    UInt64(50), UInt64(15), UInt64(143), UInt64(238), UInt64(188), UInt64(171)]
public let var_1770287364610_1957: (Int32, Struct_1770287364610_21, UInt8) = (Int32(Int16(UInt16(145))),
    Struct_1770287364610_21(), UInt8(240))

public struct Struct_1770287364610_21 {
    public init() { // block id: 23

    }

    static let var_1770287364610_26: Float32 = Float32(-126.0);
    public var var_1770287364610_563: Bool = true;
    public init(param_1770287364610_921: VArray<Bool, $2>, optionalParam_1770287364610_922!: Int8 = Int8(UInt8(176)),
        namedParam_1770287364610_925!: Range<UInt8>) { // block id: 926
        Int16(-82);
        ((UInt16((if (false) { // block id: 936
            if (var_1770287364610_143) {
                var_1770287364610_940
            } else {
                var_1770287364610_940
            }
        } else { // block id: 944
            Option<UInt16>.None
        } ?? match (VArray<Bool, $7>(repeat: var_1770287364610_143)) {
            case caseVar_1770287364610_957: Range<UInt32> => var_1770287364610_691

            case _: Int64 => var_1770287364610_691

            case _ => var_1770287364610_691 % ((UInt16(236)) | 1)

            case _ =>
                var_1770287364610_333;
                var_1770287364610_691 | var_1770287364610_691
        })) & 127)..(UInt16((Option<UInt16>.Some(UInt16(186)) ?? var_1770287364610_691) % (([UInt16(151), UInt16(29),
            UInt16(151), UInt16(83), UInt16(236), UInt16(198), UInt16(74), UInt16(1), UInt16(201), UInt16(243)][5]) | 1)) &
            127) : (try { // block id: 991
            ();
            var_1770287364610_191
        } catch (_) { // block id: 994
            var_1770287364610_191
        } finally { // block id: 996
            ((Int8(Int8(-15)) & 127)..(Int8(Int8(67)) & 127) : (Int64(-83) | 1));
            let var_1770287364610_999: Int64 = Int64(Int8(Int8(Int8(UInt8(118)))));
            var_1770287364610_999
        } | 1))
    };

    static mut prop var_1770287364610_1104: ?Bool { // block id: 1105
        get() { // block id: 1107
            ();
            ((((UInt32(UInt32(224)) & 127)..(UInt32(UInt32(102)) & 127) : (Int64(72) | 1)) as UInt16) as Bool)
        }
        set(Value) { // block id: 1117
            ();
            ()
        }
    }
    public init(param_1770287364610_1069: Float64, param_1770287364610_1070: VArray<Bool, $6>,
        namedParam_1770287364610_1071!: Array<UInt64>, namedParam_1770287364610_1072!: Option<UInt8>) { // block id: 1073
        ((var_1770287364610_187 as Option<Bool>) ?? if (try { // block id: 1083
            Int32(-2) ^ Int32(-54);
            false
        } catch (_) { // block id: 1088
            VArray<Bool, $2>({i => false});
            false
        }) {
            if (true) { // block id: 1095
                ();
                Option<Bool>.Some(var_1770287364610_1099)
            } else if (true) { // block id: 1102
                var_1770287364610_1104
            } else { // block id: 1120
                Option<Bool>.Some(false)
            }
        } else {
            var_1770287364610_1104
        });
        var_1770287364610_885
    };

    init(param_1770287364610_1552: Range<Int16>) { // block id: 1553
        try { // block id: 1555
            var_1770287364610_207
        } catch (_) { // block id: 1557
            match (var_1770287364610_885) {
                case _: Range<UInt8> => -var_1770287364610_108

                case _: Bool => Int32(-62)

                case caseVar_1770287364610_1571: UInt64 =>
                    var_1770287364610_1574;
                    Int32(29) >> ((var_1770287364610_1579) & 7)

                case _ =>
                    ();
                    Int32(2)
            };
            (Option<(Range<UInt8>, Range<Int64>, Unit, Int8)>.Some(var_1770287364610_207) ?? var_1770287364610_207)
        } finally { // block id: 1594
            [false, true, false, false, true, false, true, false, false, false];
            (((UInt8(UInt8(102)) & 127)..=(UInt8(UInt8(14)) & 127) : (Int64(-21) | 1)), var_1770287364610_194, (), Int8(-107))
        }
    }
}

@Frozen
public func func_1770287364610_14<T0>(optionalParam_1770287364610_15!: Bool = false): Option<Rune> { // block id: 17
    if (((Struct_1770287364610_21.var_1770287364610_26) is UInt16)) { // block id: 28
        if (false) { // block id: 31
            const var_1770287364610_34: Float64 = 43.0;
            var_1770287364610_34 * var_1770287364610_34
        } else if (true) { // block id: 38
            Float64(36.0)
        } else { // block id: 40
            Float64(-76.0)
        };
        if (false) { // block id: 44
            Int64(88);
            var_1770287364610_47
        } else if (true) { // block id: 51
            var_1770287364610_53;
            Option<Rune>.Some(var_1770287364610_57)
        } else { // block id: 59
            Option<Rune>.None
        }
    } else { // block id: 61
        try (resource = Class_1770287364610_254()) { // block id: 63
            ();
            var var_1770287364610_67: Float64 = Float64(19.0);
            var_1770287364610_67 += Float64(8.0)
        } catch (_) { // block id: 70

        } finally { // block id: 71
            var_1770287364610_53;
            ()
        };
        match (var_1770287364610_47) {
            case _: String =>
                false;
                if (true) {
                    Option<Rune>.Some(var_1770287364610_57)
                } else {
                    Option<Rune>.None
                }

            case _ => Option<Rune>.Some(r'A')
        }
    }
}

public interface Interface_1770287364610_238 {}

public interface Interface_1770287364610_239 <: Interface_1770287364610_238 {}

public interface Interface_1770287364610_237 <: Interface_1770287364610_238 & Interface_1770287364610_239 {
    static func func_1770287364610_258(namedParam_1770287364610_259!: VArray<Bool, $2>,
        namedParam_1770287364610_260!: (Int32, Struct_1770287364610_21, UInt8), namedParam_1770287364610_261!: Float64,
        namedParam_1770287364610_262!: Unit): Class_1770287364610_254 { // block id: 263
        for (iter in if (var_1770287364610_333[4]) { // block id: 355
            var_1770287364610_358 *= Int64(-44)
            [var_1770287364610_201, UInt64(26), UInt64(190), UInt64(222), var_1770287364610_201, var_1770287364610_201,
                var_1770287364610_201, var_1770287364610_201, var_1770287364610_201, UInt64(42)]
        } else { // block id: 372
            [UInt64(249), UInt64(74), UInt64(79), UInt64(89), UInt64(75), UInt64(77), UInt64(42), UInt64(161),
                UInt64(228), UInt64(203)]
        } where ((var_1770287364610_308 |> func_1770287364610_271) ?? match (var_1770287364610_312) {
            case -86.0 | 20.0 | -24.0 | 114.0 => var_1770287364610_143

            case _ => true

            case _ => UInt64(45) == UInt64(121)
        })) {
        }
        if ((match (var_1770287364610_201) {
            case caseVar_1770287364610_381 =>
                ((UInt32(var_1770287364610_385) & 127)..(UInt32(var_1770287364610_385) & 127) : (Int64(11) | 1));
                ((Int8(Int8(-77)) & 127)..=(Int8(Int8(-41)) & 127) : (Int64(38) | 1))

            case caseVar_1770287364610_392 => ((Int8(var_1770287364610_137) & 127)..(Int8(Int8(0)) & 127) : (var_1770287364610_358 |
                1))

            case 4 | 19 => ((Int8(Int8(-2)) & 127)..(Int8(Int8(18)) & 127) : (Int64(59) | 1))

            case 205 | 14 | 213 | 217 => ((Int8(Int8(-52)) & 127)..(Int8(Int8(-44)) & 127) : (Int64(105) | 1))

            case _ => var_1770287364610_413
        } is Option<Unit>)) { // block id: 415
            var_1770287364610_418 /= ((Int16(42)) | 1)
            var_1770287364610_424[4]
        } else { // block id: 437
            var_1770287364610_424[2]
        }
    }
}

public interface Interface_1770287364610_236<T0, T1> <: Interface_1770287364610_237 {
    static func func_1770287364610_258(namedParam_1770287364610_259!: VArray<Bool, $2>,
        namedParam_1770287364610_260!: (Int32, Struct_1770287364610_21, UInt8), namedParam_1770287364610_261!: Float64,
        namedParam_1770287364610_262!: Unit): Class_1770287364610_254 { // block id: 664
        match ((Option<UInt8>.Some(var_1770287364610_187) ?? var_1770287364610_675[0])) {
            case 230 | 219 | 237 | 245 => ()

            case caseVar_1770287364610_688 =>
                var_1770287364610_691;
                var_1770287364610_418 |= Int16(117)

            case _ =>
                ();
                var_1770287364610_101

            case _ =>
                var_1770287364610_101;
                ()
        };
        if ((VArray<Bool, $2>({i => false}), (Class_1770287364610_254(), ((UInt64(UInt64(162)) & 127)..(UInt64(UInt64(96)) &
                    127) : (Int64(-25) | 1)), ((UInt16(var_1770287364610_691) & 127)..=(UInt16(UInt16(110)) & 127) : (var_1770287364610_358 |
                    1)), Int64(-111), var_1770287364610_201), var_1770287364610_729)[2][3]) { // block id: 745
            (Option<Array<UInt64>>.Some(var_1770287364610_753) ?? [UInt64(231), UInt64(119), UInt64(98), UInt64(155),
                UInt64(238), UInt64(154), UInt64(103), UInt64(39), UInt64(148), UInt64(235)]);
            try { // block id: 757
                Int64(-43) - Int64(46);
                Class_1770287364610_254()
            } finally { // block id: 762
                ();
                Class_1770287364610_254()
            }
        } else { // block id: 765
            try { // block id: 767
                Class_1770287364610_254()
            } finally { // block id: 769
                var_1770287364610_53;
                var_1770287364610_772
            }
        }
    }
}

public interface Interface_1770287364610_235<T0> <: Interface_1770287364610_236<Option<Rune>, Range<Int8>> &
    Interface_1770287364610_239 {
    @Frozen
    func func_1770287364610_245(namedParam_1770287364610_246!: Option<Rune>,
        namedParam_1770287364610_247!: Interface_1770287364610_240, namedParam_1770287364610_248!: Option<Rune>,
        namedParam_1770287364610_249!: UInt8): (Int32, Struct_1770287364610_21, UInt8) { // block id: 250
        let var_1770287364610_445: (Int32, Struct_1770287364610_21, UInt8) = (Int32(-23), Struct_1770287364610_21(),
            UInt8(Int8(UInt8(198))));
        func_1770287364610_258(namedParam_1770287364610_259: var_1770287364610_442,
            namedParam_1770287364610_260: var_1770287364610_445, namedParam_1770287364610_261: var_1770287364610_312,
            namedParam_1770287364610_262: ()).var_1770287364610_455[2]
    };

    static func func_1770287364610_258(namedParam_1770287364610_259!: VArray<Bool, $2>,
        namedParam_1770287364610_260!: (Int32, Struct_1770287364610_21, UInt8), namedParam_1770287364610_261!: Float64,
        namedParam_1770287364610_262!: Unit): Class_1770287364610_254 { // block id: 775
        match ((Option<Unit>.Some(()), var_1770287364610_783, (var_1770287364610_187, var_1770287364610_788,
                var_1770287364610_772))[1]) {
            case _: (Range<UInt8>, Range<Int64>, Unit, Int8) =>
                var_1770287364610_101;
                var_1770287364610_797

            case _ =>
                if (false) {
                    Option<Unit>.Some(var_1770287364610_101)
                } else {
                    var_1770287364610_797
                }
        };
        if (var_1770287364610_814[3][3]) { // block id: 870
            (((UInt8(UInt8(117)) & 127)..=(UInt8(UInt8(191)) & 127) : (Int64(-11) | 1)), ((Int64(Int64(-127)) & 127)..=(Int64(Int64(28)) &
                    127) : (Int64(-94) | 1)), (), var_1770287364610_137)[2];
            var_1770287364610_879
        } else { // block id: 881
            var_1770287364610_885[0];
            if (false) { // block id: 890
                var_1770287364610_143 ||= true
                Class_1770287364610_254()
            } else if (var_1770287364610_143) { // block id: 896
                var_1770287364610_143 ||= true
                var_1770287364610_772
            } else { // block id: 901
                var_1770287364610_137 -= var_1770287364610_137
                Class_1770287364610_254()
            }
        }
    }
}

public interface Interface_1770287364610_240 {}

public interface Interface_1770287364610_234<T0> <: Interface_1770287364610_235<UInt16> & Interface_1770287364610_240 {
    static func func_1770287364610_258(namedParam_1770287364610_259!: VArray<Bool, $2>,
        namedParam_1770287364610_260!: (Int32, Struct_1770287364610_21, UInt8), namedParam_1770287364610_261!: Float64,
        namedParam_1770287364610_262!: Unit): Class_1770287364610_254 { // block id: 907
        (((Int32(Int32(-85)) & 127)..(Int32(Int32(-52)) & 127) : (Int64(-14) | 1)), var_1770287364610_814, (var_1770287364610_108,
                var_1770287364610_788, UInt8(243)), try { // block id: 918
                Struct_1770287364610_21(VArray<Bool, $2>(repeat: var_1770287364610_143),
                    optionalParam_1770287364610_922: Int8(77), namedParam_1770287364610_925: var_1770287364610_1010)
            } finally { // block id: 1012
                let var_1770287364610_1033: Bool = false;
                [var_1770287364610_333, var_1770287364610_1016, VArray<Bool, $6>({i => true}), var_1770287364610_333,
                    var_1770287364610_1016, VArray<Bool, $6>(repeat: true), VArray<Bool, $6>({i => true}),
                    var_1770287364610_333, VArray<Bool, $6>({i => false}), var_1770287364610_333];
                var_1770287364610_788
            })[1];
        var_1770287364610_772
    };

    func func_1770287364610_245(namedParam_1770287364610_246!: Option<Rune>,
        namedParam_1770287364610_247!: Interface_1770287364610_240, namedParam_1770287364610_248!: Option<Rune>,
        namedParam_1770287364610_249!: UInt8): (Int32, Struct_1770287364610_21, UInt8) { // block id: 1536
        (var_1770287364610_108, if ((var_1770287364610_675 is Option<Bool>)) {
                try { // block id: 1543
                    var_1770287364610_358 &= Int64(77)
                    if (false) {
                        Struct_1770287364610_21()
                    } else {
                        Struct_1770287364610_21(((Int16(Int16(121)) & 127)..(Int16(Int16(54)) & 127) : (Int64(19) | 1)))
                    }
                } finally { // block id: 1602
                    ();
                    if (var_1770287364610_1606) {
                        Struct_1770287364610_21(var_1770287364610_442,
                            namedParam_1770287364610_925: var_1770287364610_1010)
                    } else {
                        Struct_1770287364610_21()
                    }
                }
            } else {
                if (false) { // block id: 1616
                    Struct_1770287364610_21()
                } else { // block id: 1618
                    var_1770287364610_1621 ^= UInt32(117)
                    let var_1770287364610_1631: Option<UInt8> = (((Int32(Int32(-113)) & 127)..(Int32(Int32(24)) & 127) : (Int64(88) |
                        1)) as UInt8);
                    if (var_1770287364610_1330) {
                        Struct_1770287364610_21(Float64(-58.0), var_1770287364610_1016,
                            namedParam_1770287364610_1071: var_1770287364610_753,
                            namedParam_1770287364610_1072: var_1770287364610_1631)
                    } else {
                        var_1770287364610_308
                    }
                }
            }, var_1770287364610_187)
    }
}

public interface Interface_1770287364610_233 <: Interface_1770287364610_234<Float64> {
    static func func_1770287364610_258(namedParam_1770287364610_259!: VArray<Bool, $2>,
        namedParam_1770287364610_260!: (Int32, Struct_1770287364610_21, UInt8), namedParam_1770287364610_261!: Float64,
        namedParam_1770287364610_262!: Unit): Class_1770287364610_254 { // block id: 1058
        var_1770287364610_201 -= try { // block id: 1063
            let var_1770287364610_1137: UInt64 = UInt64(Int16(Int8(37)));
            if (var_1770287364610_1047) {
                Struct_1770287364610_21()
            } else {
                Struct_1770287364610_21(Float64(112.0), VArray<Bool, $6>(repeat: true),
                    namedParam_1770287364610_1071: [UInt64(174), var_1770287364610_201, var_1770287364610_1137,
                        UInt64(147), var_1770287364610_201, UInt64(33), UInt64(78), UInt64(22), var_1770287364610_201,
                        var_1770287364610_1137],
                    namedParam_1770287364610_1072: Option<UInt8>.Some(var_1770287364610_187))
            };
            UInt64(93) << ((var_1770287364610_201) & 7)
        } finally { // block id: 1153
            UInt64(194)
        } / (((-var_1770287364610_201)) | 1)
        if (var_1770287364610_1099) {
            if (false) { // block id: 1161
                if (false) {
                    var_1770287364610_772
                } else {
                    var_1770287364610_879
                }
            } else { // block id: 1166
                if (true) {
                    Class_1770287364610_254()
                } else {
                    var_1770287364610_879
                }
            }
        } else {
            Class_1770287364610_254()
        }
    };

    func func_1770287364610_245(namedParam_1770287364610_246!: Option<Rune>,
        namedParam_1770287364610_247!: Interface_1770287364610_240, namedParam_1770287364610_248!: Option<Rune>,
        namedParam_1770287364610_249!: UInt8): (Int32, Struct_1770287364610_21, UInt8) { // block id: 1637
        var var_1770287364610_1707: Range<Int16> = ((Int16(Int16(18)) & 127)..(Int16(Int16(-84)) & 127) : (Int64(48) | 1));
        (((UInt8(87) as Option<(Int32, Struct_1770287364610_21, UInt8)>) ?? (var_1770287364610_1652 ??
            var_1770287364610_1685)) ?? (var_1770287364610_108, if (var_1770287364610_1364) { // block id: 1700
                var_1770287364610_640;
                if (var_1770287364610_1353) {
                    Struct_1770287364610_21()
                } else {
                    Struct_1770287364610_21(var_1770287364610_1707)
                }
            } else { // block id: 1709
                var_1770287364610_53;
                if (true) {
                    var_1770287364610_308
                } else {
                    var_1770287364610_788
                }
            }, (Option<UInt8>.Some(var_1770287364610_187) ?? UInt8(6))))
    }
}

public sealed interface Interface_1770287364610_232<T0, T1> <: Interface_1770287364610_233 & Interface_1770287364610_240 {
    static func func_1770287364610_258(namedParam_1770287364610_259!: VArray<Bool, $2>,
        namedParam_1770287364610_260!: (Int32, Struct_1770287364610_21, UInt8), namedParam_1770287364610_261!: Float64,
        namedParam_1770287364610_262!: Unit): Class_1770287364610_254 { // block id: 1173
        try { // block id: 1176
            var_1770287364610_101;
            [var_1770287364610_879, Class_1770287364610_254(), Class_1770287364610_254(), Class_1770287364610_254(),
                var_1770287364610_879, Class_1770287364610_254(), var_1770287364610_879, Class_1770287364610_254(),
                Class_1770287364610_254(), Class_1770287364610_254()]
        } finally { // block id: 1189
            var_1770287364610_424
        }[5]
    };

    func func_1770287364610_245(namedParam_1770287364610_246!: Option<Rune>,
        namedParam_1770287364610_247!: Interface_1770287364610_240, namedParam_1770287364610_248!: Option<Rune>,
        namedParam_1770287364610_249!: UInt8): (Int32, Struct_1770287364610_21, UInt8) { // block id: 1720
        (if (if (var_1770287364610_1353) { // block id: 1725
                var_1770287364610_53;
                var_1770287364610_1099
            } else { // block id: 1728
                false
            }) { // block id: 1730
                var_1770287364610_1579
            } else if ((VArray<Bool, $6>(repeat: var_1770287364610_1330) is Bool)) { // block id: 1740
                var_1770287364610_108
            } else { // block id: 1742
                var_1770287364610_1457;
                Int32(-75)
            }, var_1770287364610_1746, var_1770287364610_187 & try { // block id: 1751
                UInt8(84)
            } finally { // block id: 1753
                UInt8(131)
            })
    }
}

public sealed interface Interface_1770287364610_231 <: Interface_1770287364610_232<Range<Int16>, Unit> &
    Interface_1770287364610_240 {
    static func func_1770287364610_258(namedParam_1770287364610_259!: VArray<Bool, $2>,
        namedParam_1770287364610_260!: (Int32, Struct_1770287364610_21, UInt8), namedParam_1770287364610_261!: Float64,
        namedParam_1770287364610_262!: Unit): Class_1770287364610_254 { // block id: 1193
        if ([true, false, true, true, true, false, true, true, true, true][7]) { // block id: 1199
            var_1770287364610_101;
            try { // block id: 1202
                Float32(24.0)
            } finally { // block id: 1204
                Struct_1770287364610_21(var_1770287364610_312, var_1770287364610_333,
                    namedParam_1770287364610_1071: var_1770287364610_753,
                    namedParam_1770287364610_1072: Option<UInt8>.Some(UInt8(219)));
                Float32(-28.0)
            }
        } else if (((Option<Option<Option<Bool>>>.Some(Option<Option<Bool>>.Some(var_1770287364610_1221)) ??
            var_1770287364610_1224) is UInt32)) { // block id: 1226
            try { // block id: 1228
                ();
                var_1770287364610_1231
            } finally { // block id: 1233
                ();
                Float32(-96.0)
            }
        } else { // block id: 1236
            match ((UInt8(154), var_1770287364610_308, Class_1770287364610_254())) {
                case caseVar_1770287364610_1244: (Class_1770287364610_254, Range<UInt64>, Range<UInt16>, Int64, UInt64) =>
                    if (var_1770287364610_143) {
                        ((UInt64(UInt64(3)) & 127)..(UInt64(UInt64(237)) & 127) : (Int64(45) | 1))
                    } else {
                        ((UInt64(UInt64(72)) & 127)..(UInt64(UInt64(112)) & 127) : (Int64(-97) | 1))
                    };
                    Float32(-33.0)

                case (caseVar_1770287364610_1256: VArray<Bool, $6>, _, caseVar_1770287364610_1257: (Range<Int32>, (Range<UInt16>, 
                            (Class_1770287364610_254, Range<UInt64>, Range<UInt16>, Int64, UInt64), Range<Int8>, (Rune, 
                            Rune, Option<Rune>, Bool, Range<UInt32>, Int32, Array<UInt64>, Struct_1770287364610_21), 
                            Range<Int64>), (Int32, Struct_1770287364610_21, UInt8), Struct_1770287364610_21)) => var_1770287364610_1231

                case _ => var_1770287364610_1231

                case _ =>
                    r'N';
                    Float32(88.0)
            }
        };
        Class_1770287364610_254(
            namedParam_1770287364610_1273: if (false || var_1770287364610_143) { // block id: 1342
                var_1770287364610_691 += var_1770287364610_691
                Int64(-14) + Int64(-57)
            } else if (try { // block id: 1350
                if (var_1770287364610_1353) {
                    var_1770287364610_1357
                } else {
                    ((UInt16(UInt16(236)) & 127)..=(UInt16(UInt16(133)) & 127) : (Int64(90) | 1))
                };
                var_1770287364610_1302
            } catch (e: Exception) { // block id: 1361
                ();
                var_1770287364610_1364
            }) { // block id: 1366
                ();
                Int64(95)
            } else { // block id: 1369
                var_1770287364610_358 / ((var_1770287364610_191) | 1)
            })
    };

    func func_1770287364610_245(namedParam_1770287364610_246!: Option<Rune>,
        namedParam_1770287364610_247!: Interface_1770287364610_240, namedParam_1770287364610_248!: Option<Rune>,
        namedParam_1770287364610_249!: UInt8): (Int32, Struct_1770287364610_21, UInt8) { // block id: 1756
        for (iter in (Option<Range<UInt64>>.None ?? (var_1770287364610_1768 ?? var_1770287364610_1772)) where var_1770287364610_1047) {
        }
        (match ((Option<Bool>.None ?? false)) {
                case _ => Int32(-57)
            }, if (false) { // block id: 1790
                var_1770287364610_101;
                var_1770287364610_788
            } else if (var_1770287364610_1047) { // block id: 1794
                var_1770287364610_53;
                Struct_1770287364610_21(var_1770287364610_442, namedParam_1770287364610_925: var_1770287364610_1010)
            } else { // block id: 1799
                ();
                if (false) {
                    var_1770287364610_308
                } else {
                    var_1770287364610_788
                }
            }, UInt8(try { // block id: 1807
                var_1770287364610_187
            } finally { // block id: 1809
                ();
                var_1770287364610_187
            }))
    }
}

public sealed interface Interface_1770287364610_230 <: Interface_1770287364610_231 {
    static func func_1770287364610_258(namedParam_1770287364610_259!: VArray<Bool, $2>,
        namedParam_1770287364610_260!: (Int32, Struct_1770287364610_21, UInt8), namedParam_1770287364610_261!: Float64,
        namedParam_1770287364610_262!: Unit): Class_1770287364610_254 { // block id: 1374
        if (match (()) {
            case _ => var_1770287364610_1353

            case () =>
                var_1770287364610_691 -= UInt16(14)
                UInt16(240) >= var_1770287364610_691

            case caseVar_1770287364610_1393: Int8 => var_1770287364610_1330

            case caseVar_1770287364610_1398 => var_1770287364610_1099

            case _ =>
                var_1770287364610_308;
                var_1770287364610_1302
        }) {
            (if ((var_1770287364610_1221 ?? false)) {
                match (Option<UInt16>.None) {
                    case _: Array<UInt64> => r'C'

                    case _: Array<Bool> =>
                        if (var_1770287364610_1047) {
                            var_1770287364610_57
                        } else {
                            r'F'
                        }

                    case _ =>
                        var_1770287364610_53;
                        if (false) {
                            var_1770287364610_57
                        } else {
                            var_1770287364610_57
                        }
                }
            } else {
                match (Option<UInt16>.Some(UInt16(154))) {
                    case _: UInt8 => var_1770287364610_57

                    case caseVar_1770287364610_1440: (Int32, Struct_1770287364610_21, UInt8) => r'1'

                    case _ => r'k'
                }
            })
        } else {
            (if (true) {
                Option<Rune>.Some(r'y')
            } else {
                var_1770287364610_1457
            } ?? if (true) { // block id: 1472
                var_1770287364610_101;
                r'j'
            } else if (false) { // block id: 1476
                var_1770287364610_53;
                if (var_1770287364610_143) {
                    var_1770287364610_57
                } else {
                    var_1770287364610_57
                }
            } else { // block id: 1482
                var_1770287364610_57
            })
        };
        try { // block id: 1485
            [var_1770287364610_333, VArray<Bool, $6>({i => false}), VArray<Bool, $6>(repeat: var_1770287364610_1099),
                VArray<Bool, $6>({i => true}), var_1770287364610_333, var_1770287364610_333, var_1770287364610_333,
                var_1770287364610_1016, VArray<Bool, $6>({i => false}), var_1770287364610_333];
            Class_1770287364610_254(optionalParam_1770287364610_1271: var_1770287364610_1231,
                namedParam_1770287364610_1273: Int64(24))
        } catch (_) { // block id: 1524
            (Option<Unit>.None ?? var_1770287364610_53);
            var_1770287364610_772
        }
    };

    func func_1770287364610_245(namedParam_1770287364610_246!: Option<Rune>,
        namedParam_1770287364610_247!: Interface_1770287364610_240, namedParam_1770287364610_248!: Option<Rune>,
        namedParam_1770287364610_249!: UInt8): (Int32, Struct_1770287364610_21, UInt8) { // block id: 1813
        Option<Array<UInt64>>.Some((Option<Array<UInt64>>.None ?? match (var_1770287364610_57) {
            case caseVar_1770287364610_1821: Range<Int64> => var_1770287364610_753

            case r'x' | r'l' =>
                ();
                [UInt64(94), var_1770287364610_201, UInt64(185), UInt64(192), var_1770287364610_201, UInt64(185),
                    UInt64(4), UInt64(96), UInt64(79), var_1770287364610_201]

            case _ => var_1770287364610_1843
        }));
        try { // block id: 1858
            let var_1770287364610_1860: (Int32, Struct_1770287364610_21, UInt8) = (Int32(72), Struct_1770287364610_21(),
                UInt8(UInt8(UInt8(116))));
            var_1770287364610_1860
        } finally { // block id: 1867
            var_1770287364610_187;
            var var_1770287364610_1870: (Int32, Struct_1770287364610_21, UInt8) = (Int32(UInt8(Int8(UInt8(64)))),
                Struct_1770287364610_21(VArray<Bool, $2>({i => false}),
                    namedParam_1770287364610_925: ((UInt8(UInt8(32)) & 127)..(UInt8(UInt8(56)) & 127) : (Int64(113) | 1))),
                UInt8(Int8(47)));
            var_1770287364610_1870
        }
    }
}

public open class Class_1770287364610_227 <: Interface_1770287364610_230 {
    public init() { // block id: 229

    }

    public static func func_1770287364610_258(namedParam_1770287364610_259!: VArray<Bool, $2>,
        namedParam_1770287364610_260!: (Int32, Struct_1770287364610_21, UInt8), namedParam_1770287364610_261!: Float64,
        namedParam_1770287364610_262!: Unit): Class_1770287364610_254 { // block id: 1530
        var_1770287364610_143 = var_1770287364610_1302
        var_1770287364610_772
    };

    public open override func func_1770287364610_245(namedParam_1770287364610_246!: Option<Rune>,
        namedParam_1770287364610_247!: Interface_1770287364610_240, namedParam_1770287364610_248!: Option<Rune>,
        namedParam_1770287364610_249!: UInt8): (Int32, Struct_1770287364610_21, UInt8) { // block id: 1955
        var_1770287364610_1957
    }
}

@Deprecated
public open class Class_1770287364610_254 <: Resource {
    @Frozen
    public init() { // block id: 256

    }

    public let var_1770287364610_455: (Float32, Float64, (Int32, Struct_1770287364610_21, UInt8), 
        Interface_1770287364610_240, Unit) = (Float32(-56.0), Float64(47.0), (Int32(-118), Struct_1770287364610_21(),
            UInt8(241)), Class_1770287364610_227(), ());
    public init(optionalParam_1770287364610_1271!: Float32 = Float32(118.0), namedParam_1770287364610_1273!: Int64) { // block id: 1274
        if (try { // block id: 1277
            UInt8(198) > var_1770287364610_187
        } catch (_) { // block id: 1281
            var_1770287364610_885;
            var_1770287364610_1047 && var_1770287364610_1047
        }) { // block id: 1286
            [VArray<Bool, $6>(repeat: var_1770287364610_1047), var_1770287364610_1016, VArray<Bool, $6>({i => false}),
                VArray<Bool, $6>({i => false}), var_1770287364610_1016, VArray<Bool, $6>(repeat: var_1770287364610_1302),
                var_1770287364610_1016, var_1770287364610_1016, var_1770287364610_1016, VArray<Bool, $6>(repeat: true)];
            for (iter in ((UInt64(UInt64(199)) & 127)..(UInt64(UInt64(171)) & 127) : (Int64(-30) | 1)) where true) {
            }
        }
    }

    public func isClosed(): Bool {
        return false
    }
    public func close(): Unit {}
}

@Frozen
@Deprecated
public func func_1770287364610_271(param_1770287364610_272: Struct_1770287364610_21): Option<Bool> { // block id: 273
    for (iter in var_1770287364610_285 where (if (var_1770287364610_143) {
        Option<Bool>.Some(true)
    } else {
        Option<Bool>.Some(false)
    } ?? var_1770287364610_143)) {
    }
    match ([UInt64(250), UInt64(221), UInt64(222), UInt64(52), UInt64(111), UInt64(215), UInt64(120), UInt64(172),
        UInt64(56), UInt64(7)]) {
        case caseVar_1770287364610_296: String =>
            ();
            Option<Bool>.None

        case _ =>
            var_1770287364610_143;
            Option<Bool>.Some(var_1770287364610_143)
    }
}

@Deprecated
func func_1770287364610_165(namedParam_1770287364610_166!: Range<UInt64>, namedParam_1770287364610_167!: Range<Int16>,
    optionalParam_1770287364610_168!: Range<Int16> = ((Int16(Int16(-126)) & 127)..=(Int16(Int16(-115)) & 127) : (Int64(34) |
        1)), namedParam_1770287364610_170!: Rune): (Int32, Struct_1770287364610_21, UInt8) { // block id: 171
    var var_1770287364610_178: Option<Unit> = Option<Unit>.None;
    let var_1770287364610_204: UInt64 = UInt64(148);
    (var_1770287364610_178 ?? try { // block id: 183
        (((UInt8(var_1770287364610_187) & 127)..=(UInt8(UInt8(115)) & 127) : (var_1770287364610_191 | 1)),
            var_1770287364610_194, var_1770287364610_53, var_1770287364610_137)
    } finally { // block id: 198
        var_1770287364610_201 ^= var_1770287364610_204
        var_1770287364610_207
    }[2]);
    var_1770287364610_242.func_1770287364610_245(namedParam_1770287364610_246: Option<Rune>.None,
        namedParam_1770287364610_247: Class_1770287364610_227(), namedParam_1770287364610_248: (r'3' as Rune),
        namedParam_1770287364610_249: (var_1770287364610_187, Struct_1770287364610_21(), Class_1770287364610_254())[0])
}

@Frozen
public func func_1770287364610_151<T0, T1, T2>(namedParam_1770287364610_152!: (Bool) -> Option<Rune>): Struct_1770287364610_21 { // block id: 155
    if ((var_1770287364610_137 != (-var_1770287364610_137))) {
        Struct_1770287364610_21()
    } else {
        func_1770287364610_165(
            namedParam_1770287364610_166: ((UInt64(var_1770287364610_201) & 127)..(UInt64(UInt64(70)) & 127) : (Int64(71) |
                1)),
            namedParam_1770287364610_167: ((Int16(var_1770287364610_418) & 127)..(Int16(var_1770287364610_418) & 127) : (Int64(-2) |
                1)), namedParam_1770287364610_170: var_1770287364610_57)[1]
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
    var var_1770287364610_129: VArray<Bool, $2> = [true, true];
    (func_1770287364610_14<Float64>() ?? if (if (false) { // block id: 93
        ();
        false
    } else if (false) { // block id: 97
        false
    } else { // block id: 99
        var_1770287364610_101;
        !true
    }) { // block id: 105
        var_1770287364610_108 |= var_1770287364610_108
        if (false) {
            r'b'
        } else {
            r'7'
        }
    } else if (var_1770287364610_129[1]) { // block id: 132
        r'C'
    } else { // block id: 134
        var_1770287364610_137 *= var_1770287364610_137
        if (var_1770287364610_143) {
            var_1770287364610_57
        } else {
            var_1770287364610_57
        }
    });
    if (func_1770287364610_151<Array<UInt64>, Array<UInt64>, Range<UInt64>>(
        namedParam_1770287364610_152: func_1770287364610_14<Float64>)
        .func_1770287364610_489<Range<Int8>, Array<Class_1770287364610_254>>(
            optionalParam_1770287364610_490: var_1770287364610_580,
            optionalParam_1770287364610_492: var_1770287364610_583, namedParam_1770287364610_499: var_1770287364610_143)) { // block id: 593
        (var_1770287364610_598, (), var_1770287364610_385, var_1770287364610_242)[1];
        if (false) { // block id: 606
            var_1770287364610_358
        } else if (var_1770287364610_143) { // block id: 609
            var_1770287364610_358
        } else { // block id: 611
            Int64(-116) & Int64(-111)
        }
    } else { // block id: 615
        if (false) { // block id: 618
            ();
            let var_1770287364610_621: ?Rune = Option<Rune>.Some(r'V');
            var_1770287364610_621
        } else if (false) { // block id: 625
            Option<Rune>.Some(var_1770287364610_57)
        } else { // block id: 628
            if (var_1770287364610_143) {
                var_1770287364610_632
            } else {
                Option<Rune>.None
            }
        };
        var_1770287364610_640[3]
    }
    // CRC Check All Variables
    CrcCheck.crc32(UInt64(var_1770287364610_108))
    CrcCheck.crc32(UInt64(var_1770287364610_137))
    CrcCheck.crc32(UInt64(var_1770287364610_187))
    CrcCheck.crc32(UInt64(var_1770287364610_358))
    CrcCheck.crc32(UInt64(var_1770287364610_385))
    CrcCheck.crc32(UInt64(var_1770287364610_691))
    CrcCheck.crc32(UInt64(var_1770287364610_1621))
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

extend Struct_1770287364610_21 {
    public func func_1770287364610_489<T0, T1>(optionalParam_1770287364610_490!: String = "C0~X8N|=sa{",
        optionalParam_1770287364610_492!: Option<Unit> = Option<Unit>.Some(()),
        optionalParam_1770287364610_495!: (Bool) -> Option<Rune> = func_1770287364610_14<Float64>,
        namedParam_1770287364610_499!: Bool): Bool { // block id: 500
        const var_1770287364610_518: String = "t,fIx;$Roe";
        var var_1770287364610_525: ?Bool = (false as Bool);
        var var_1770287364610_543: String = """
q${var_1770287364610_518}KU8L${var_1770287364610_518}
Sy+Yq
""";
        (if (true) { // block id: 508
            var_1770287364610_53;
            if (true) {
                var_1770287364610_513
            } else {
                Option<String>.Some(var_1770287364610_518)
            }
        } else { // block id: 520
            var_1770287364610_513
        } ?? if ((var_1770287364610_525 ?? false)) {
            match (var_1770287364610_333) {
                case _: Option<Rune> => var_1770287364610_518

                case caseVar_1770287364610_537: Bool =>
                    if (false) {
                        Option<String>.Some(var_1770287364610_543)
                    } else {
                        Option<String>.Some(var_1770287364610_518)
                    };
                    "d>fw[6NqeV"

                case _: Array<UInt64> => var_1770287364610_518

                case caseVar_1770287364610_554 => "N09R5fpaa%"

                case _ =>
                    ();
                    if (var_1770287364610_563) {
                        ###"YdbrE5$.v]"###
                    } else {
                        var_1770287364610_518
                    }
            }
        } else {
            try { // block id: 568
                var_1770287364610_543
            } finally { // block id: 570
                var_1770287364610_518
            }
        });
        ((((Int64(Int64(65)) & 127)..(Int64(Int64(35)) & 127) : (var_1770287364610_191 | 1)) as Bool) ??
            var_1770287364610_143)
    }
}

extend Class_1770287364610_254 {}
