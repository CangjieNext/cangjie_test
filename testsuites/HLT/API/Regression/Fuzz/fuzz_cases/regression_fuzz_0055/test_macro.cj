/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: test_macro_definition.cj
// EXEC: %compiler %cmp_macro test_macro_definition.cj
// ERRCHECK: %compiler %cmp_opt %f -o %output

import define.*

@echo
public var var_1659536903925_24: Bool = true

@echo
public let var_1659536903925_29: Bool = false

@echo
public let var_1659536903925_35: Float64 = 111.0

@echo
public var var_1659536903925_38: Bool = (Float64(Float32(Float32(-119.0))) is UInt16)

@echo
public var var_1659536903925_51: UInt32 = UInt32(UInt32(Int32(0)))

@echo
public let var_1659536903925_68: Class_1659536903925_59 = Class_1659536903925_59()

@echo
public let var_1659536903925_131: Int64 = Int64(81)

@echo
let var_1659536903925_140: Int64 = Int64((-29))

@echo
public var var_1659536903925_162: ?Int64 = Option<Int64>.None

@echo
public let var_1659536903925_167: Float32 = Float32(-14.0)

@echo
public let var_1659536903925_333: Range<Int16> = ((Int16(105) & 127)..(Int16(92) & 127) : (5 | 1))

@echo
public var var_1659536903925_337: Range<Int64> = ((6 & 127)..=((-107) & 127) : (4 | 1))

@echo
let var_1659536903925_367: Class_1659536903925_362 = Class_1659536903925_362()

@echo
var var_1659536903925_385: ??Range<UInt64> = ((-100) as Option<Range<UInt64>>)

@echo
public let var_1659536903925_449: (Range<UInt32>, Range<UInt32>, Option<Bool>) = (((UInt32(UInt8(194)) & 127)..=(UInt32(174) &
        127) : ((2 | 1))), ((UInt32(89) & 127)..=(UInt32(250) & 127) : (26 | 1)), Option<Bool>.None)

@echo
let var_1659536903925_493: Unit = ()

@echo
public let var_1659536903925_519: Option<(Bool, UInt16)> = Option<(Bool, UInt16)>.None

@echo
public var var_1659536903925_606: Int8 = Int8(50)

@echo
var var_1659536903925_692: String = """
Da|_l
@~x97
"""

@echo
public let var_1659536903925_783: (Bool, UInt16) = ((((((Int16(2) & 127)..(Int16(-86) & 127) : ((82 | 1))) as Bool) as Option<Range<UInt64>>) is Option<Int8>),
    UInt16(75))

@echo
public let var_1659536903925_902: ???Range<UInt64> = (Class_1659536903925_362() as Option<Option<Range<UInt64>>>)

@echo
public var var_1659536903925_922: Int32 = Int32(-112)

@echo
public var var_1659536903925_955: Range<UInt32> = ((UInt32(98) & 127)..=(UInt32(UInt8(UInt8(159))) & 127) : (((-53) | 1)))

@echo
var var_1659536903925_1068: Int64 = 30

@echo
let var_1659536903925_1151: ?Bool = (((UInt8(44) & 127)..=(UInt8(206) & 127) : (113 | 1)) as Bool)

@echo
let var_1659536903925_1350: (Array<Bool>, Range<UInt16>, Unit, (Range<UInt32>, Range<UInt32>, Option<Bool>), UInt32) = ([true,
        true, true, false, true, true, false, true, false, false], ((UInt16(237) & 127)..(UInt16(240) & 127) : (109 | 1)),
    (), (((UInt32(132) & 127)..=(UInt32(Int16(14)) & 127) : ((Int64(UInt16(66)) | 1))), ((UInt32(Int8(-76)) & 127)..(UInt32(UInt32(79)) &
            127) : (((-75) | 1))), Option<Bool>.None), UInt32(52))

@echo
public let var_1659536903925_1378: (Range<UInt32>, Range<UInt32>, Option<Bool>) = (((UInt32(Int8(-31)) & 127)..(UInt32(Int32(UInt32(195))) &
        127) : ((Int64(UInt32(157)) | 1))), ((UInt32(165) & 127)..(UInt32(137) & 127) : (111 | 1)), ((true, UInt16(UInt8(178))) as Bool))

@echo
public let var_1659536903925_1420: ?UInt16 = Option<UInt16>.None

@echo
public var var_1659536903925_1428: UInt16 = UInt16(247)

@echo
public let var_1659536903925_1454: (Range<UInt32>, Range<Int16>, (Float32, Int32, ((Int64, Float64, Range<UInt32>, Range<UInt64>, 
    UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16), Array<Bool>)) = (((UInt32(16) & 127)..=(UInt32(51) &
        127) : ((47 | 1))), ((Int16(UInt8(164)) & 127)..(Int16(124) & 127) : (((-105) | 1))), (Float32(14.0), Int32(UInt32(UInt8(163))),
        ((105, (-89.0), ((UInt32(143) & 127)..=(UInt32(199) & 127) : (118 | 1)), ((UInt64(194) & 127)..=(UInt64(210) &
                    127) : (85 | 1)), UInt8(54), ((Int16(77) & 127)..(Int16(-71) & 127) : (24 | 1))), UInt8(18), Int16(-32),
            ((UInt8(254) & 127)..=(UInt8(99) & 127) : (93 | 1)), ((83, 109.0, ((UInt32(141) & 127)..(UInt32(173) & 127) : (((-94) |
                    1))), ((UInt64(64) & 127)..(UInt64(221) & 127) : ((77 | 1))), UInt8(33), ((Int16(-51) & 127)..(Int16(84) &
                    127) : (((-107) | 1)))) as Int8), Int8(Int8(-12)), Int16(UInt16(241))), [true, true, true, false,
            false, true, true, false, true, false]))

@echo
public var var_1659536903925_1554: (Float32, Int32, ((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), 
    UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16), Array<Bool>) = (Float32(Float32(Float32(Float32(18.0)))),
    Int32(UInt16(UInt8(246))), ((Int64(UInt8(63)), Float64(81.0), ((UInt32(247) & 127)..(UInt32(71) & 127) : (86 | 1)), ((UInt64(37) &
                127)..(UInt64(64) & 127) : ((-52) | 1)), UInt8(UInt8(150)), ((Int16(-82) & 127)..(Int16(109) & 127) : ((-71) |
                1))), UInt8(UInt8(UInt8(15))), Int16(Int16(UInt16(108))), ((UInt8(229) & 127)..(UInt8(Int8(59)) & 127) : ((Int64(Int8(59)) |
            1))), (((UInt64(49) & 127)..=(UInt64(73) & 127) : (((-111) | 1))) as Int8), Int8(-108), Int16(45)), [true,
        false, true, true, false, false, true, true, false, false])

@echo
public let var_1659536903925_1686: Float64 = Float64(Float64(Float32(Float32(Float32(-70.0)))))

@echo
public var var_1659536903925_1706: Int16 = Int16(118)

@echo
let var_1659536903925_1710: ?Int8 = ([Class_1659536903925_362(), Class_1659536903925_59(), Class_1659536903925_59(),
    Class_1659536903925_59(), Class_1659536903925_59(), Class_1659536903925_362(), Class_1659536903925_59(),
    Class_1659536903925_362(), Class_1659536903925_362(), Class_1659536903925_362()] as Int8)

@echo
public let var_1659536903925_1725: Int16 = Int16(UInt16(Int16(-30)))

@echo
public let var_1659536903925_1735: UInt8 = UInt8(Int8(UInt8(124)))

@echo
public let var_1659536903925_1771: Bool = true

@echo
var var_1659536903925_1919: ?((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, 
    Option<Int8>, Int8, Int16) = Option<((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, 
        Int16, Range<UInt8>, Option<Int8>, Int8, Int16)>.None

@echo
var var_1659536903925_1951: Interface_1659536903925_62 = Class_1659536903925_59()

@echo
let var_1659536903925_2030: Unit = ()

@echo
let var_1659536903925_2038: Option<Int32> = Option<Int32>.None

@echo
public var var_1659536903925_2192: Option<Unit> = (111 as Unit)

@echo
public let var_1659536903925_2254: ?Range<UInt64> = (UInt64(UInt32(49)) as Range<UInt64>)

@echo
public let var_1659536903925_2275: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) = (Int64(UInt32(UInt8(69))), ((UInt8(Int8(UInt8(8))) &
        127)..=(UInt8(190) & 127) : ((Int64(UInt8(60)) | 1))), ((UInt32(59) & 127)..=(UInt32(141) & 127) : ((-71) | 1)),
    [15, (-54), (-61), 26, 17, 5, (-120), 116, 44, (-105)])

@echo
public var var_1659536903925_2295: Interface_1659536903925_365 = Class_1659536903925_362()

@echo
var var_1659536903925_2317: Interface_1659536903925_65 = Class_1659536903925_59()

@echo
public var var_1659536903925_2329: Interface_1659536903925_64 = Class_1659536903925_59()

@echo
var var_1659536903925_2512: UInt16 = UInt16(UInt8(UInt8(20)))

@echo
public var var_1659536903925_2519: Array<UInt16> = [UInt16(22), UInt16(223), UInt16(185), UInt16(50), UInt16(218),
    UInt16(203), UInt16(142), UInt16(54), UInt16(82), UInt16(101)]

@echo
let var_1659536903925_2628: ??Range<UInt64> = Option<Option<Range<UInt64>>>.None

@echo
let var_1659536903925_2662: (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>) = (Int64(Int16(-108)),
    9.0, ((UInt32(45) & 127)..(UInt32(128) & 127) : (119 | 1)), ((UInt64(180) & 127)..(UInt64(112) & 127) : (4 | 1)),
    UInt8(121), ((Int16(-38) & 127)..=(Int16(98) & 127) : ((-92) | 1)))

@echo
var var_1659536903925_2744: Range<UInt64> = ((UInt64(84) & 127)..(UInt64(243) & 127) : (107 | 1))

@echo
public let var_1659536903925_2840: Unit = ()

@echo
public let var_1659536903925_2934: Option<UInt8> = Option<UInt8>.None

@echo
var var_1659536903925_2989: Option<Option<Bool>> = Option<Option<Bool>>.None

@echo
public var var_1659536903925_3158: ((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, 
    Array<Unit>) = ((Int64((-87)), ((UInt8(UInt8(223)) & 127)..(UInt8(162) & 127) : ((Int64(UInt32(209)) | 1))), ((UInt32(114) &
            127)..=(UInt32(UInt16(250)) & 127) : ((Int64(Int32(-70)) | 1))), [44, 70, 0, (-73), (-87), 49, 53, 56,
            (-111), (-91)]), (), ((Int16(81) & 127)..(Int16(-96) & 127) : ((-3) | 1)), (),
    "S<Jhx${var_1659536903925_692}[,$eA", [(), (), (), (), (), (), (), (), (), ()])

@echo
let var_1659536903925_3261: Array<Unit> = [(), (), (), (), (), (), (), (), (), ()]

@echo
var var_1659536903925_3377: Interface_1659536903925_63 = Class_1659536903925_362()

@echo
public let var_1659536903925_3506: UInt8 = UInt8(220)

@echo
var var_1659536903925_3697: Int64 = 81

@echo
public let var_1659536903925_3724: Interface_1659536903925_66 = Class_1659536903925_362()

@echo
public let var_1659536903925_3737: Interface_1659536903925_66 = Class_1659536903925_59()

@echo
var var_1659536903925_3837: UInt32 = UInt32(Int8(UInt8(166)))

@echo
let var_1659536903925_3864: (Int64, Int64, Range<UInt16>, UInt64, Array<Option<Bool>>, (Int64, Float64, Range<UInt32>, 
    Range<UInt64>, UInt8, Range<Int16>), Range<UInt32>) = (Int64(UInt8(103)), Int64(UInt16(209)), ((UInt16(52) & 127)..=(UInt16(Int8(UInt8(130))) &
        127) : (((-72) | 1))), UInt64(70), [Option<Bool>.None, Option<Bool>.None, (() as Bool),
        (Option<Float64>.None as Bool), Option<Bool>.None, ((53.0 as Float64) as Bool),
        ([true, false, true, true, true, false, false, false, false, true] as Bool),
        ((((UInt32(135) & 127)..(UInt32(197) & 127) : (21 | 1)), ((Int16(113) & 127)..(Int16(-109) & 127) : ((-45) | 1)),
        (Float32(95.0), Int32(-107), (((-117), 114.0, ((UInt32(47) & 127)..(UInt32(56) & 127) : ((-50) | 1)), ((UInt64(251) &
                        127)..=(UInt64(86) & 127) : (((-44) | 1))), UInt8(218), ((Int16(-56) & 127)..(Int16(-89) & 127) : ((-77) |
                        1))), UInt8(27), Int16(43), ((UInt8(2) & 127)..=(UInt8(140) & 127) : ((112 | 1))), Option<Int8>
                    .None, Int8(-110), Int16(-49)), [true, true, false, false, true, false, false, true, true, true])) as Bool),
        Option<Bool>.None, Option<Bool>.None], ((-81), Float64((-65.0)), ((UInt32(193) & 127)..(UInt32(179) & 127) : ((68 |
            1))), ((UInt64(213) & 127)..(UInt64(70) & 127) : (114 | 1)), UInt8(UInt8(Int8(-128))), ((Int16(-9) & 127)..=(Int16(-121) &
            127) : (16 | 1))), ((UInt32(Int16(-111)) & 127)..=(UInt32(107) & 127) : ((Int64(Int8(UInt8(6))) | 1))))

@echo
public let var_1659536903925_4173: Unit = ()

@echo
var var_1659536903925_4223: UInt64 = UInt64(179)

@echo
public var var_1659536903925_4425: Range<UInt32> = ((UInt32(179) & 127)..(UInt32(60) & 127) : ((-120) | 1))

@echo
var var_1659536903925_4490: Rune = 'S'

@echo
var var_1659536903925_4588: Bool = (Class_1659536903925_362() is Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), 
    Unit, Range<Int16>, Unit, String, Array<Unit>)>)

@echo
let var_1659536903925_4634: ?Bool = ((Option<Array<Int64>>.None as Int32) as Bool)

@echo
public var var_1659536903925_4843: UInt32 = UInt32(7)

@echo
public let var_1659536903925_4857: ?((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, 
    String, Array<Unit>) = (Float32(83.0) as ((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, 
    Unit, String, Array<Unit>))

@echo
public var var_1659536903925_4943: Int64 = Int64(Int16(-6))

@echo
var var_1659536903925_4955: (Range<Int16>, Bool, (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), 
    UInt64, Class_1659536903925_362, String, Int16, UInt32, Array<Int64>) = (((Int16(111) & 127)..=(Int16(Int8(98)) & 127) : ((Int64(Int32(-92)) |
        1))), false, (5, Float64(Float32(Float32(-112.0))), ((UInt32(77) & 127)..=(UInt32(UInt8(231)) & 127) : ((Int64(82) |
            1))), ((UInt64(Int8(-113)) & 127)..=(UInt64(121) & 127) : ((Int64((-44)) | 1))), UInt8(Int8(Int8(71))), ((Int16(-117) &
            127)..=(Int16(Int16(-5)) & 127) : ((42 | 1)))), UInt64(169), Class_1659536903925_362(),
    "_u,we!:T${var_1659536903925_692}6${var_1659536903925_692}@", Int16(UInt16(Int8(-73))), UInt32(8), [59, (-10), (-3),
        (-75), (-52), 30, 21, 101, 3, (-28)])

@echo
let var_1659536903925_5115: Int64 = Int64(UInt32(Int8(UInt8(UInt8(243)))))

@echo
public var var_1659536903925_5213: Bool = (([(false, UInt16(182)), (true, UInt16(217)), (true, UInt16(97)),
    (true, UInt16(64)), (true, UInt16(28)), (true, UInt16(157)), (false, UInt16(114)), (true, UInt16(153)),
    (false, UInt16(54)), (true, UInt16(121))] as UInt8) is (Range<UInt32>, Range<Int16>, (Float32, Int32, ((Int64, 
    Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16), 
    Array<Bool>)))

@echo
public let var_1659536903925_5311: Array<Int64> = [31, 100, (-64), 30, 105, 51, 5, 72, (-102), (-101)]

@echo
var var_1659536903925_5362: Array<Range<UInt8>> = [((UInt8(222) & 127)..(UInt8(101) & 127) : (26 | 1)),
    ((UInt8(164) & 127)..(UInt8(15) & 127) : (68 | 1)), ((UInt8(253) & 127)..(UInt8(105) & 127) : ((-24) | 1)),
    ((UInt8(119) & 127)..=(UInt8(185) & 127) : ((-30) | 1)), ((UInt8(45) & 127)..(UInt8(195) & 127) : ((-32) | 1)),
    ((UInt8(208) & 127)..=(UInt8(77) & 127) : (121 | 1)), ((UInt8(13) & 127)..=(UInt8(15) & 127) : ((-11) | 1)),
    ((UInt8(215) & 127)..(UInt8(15) & 127) : ((-29) | 1)), ((UInt8(132) & 127)..(UInt8(121) & 127) : (55 | 1)),
    ((UInt8(45) & 127)..(UInt8(238) & 127) : (15 | 1))]

@echo
let var_1659536903925_5775: Bool = (84.0 is Option<Unit>)

@echo
public var var_1659536903925_5831: Option<Array<Int64>> = Option<Array<Int64>>.None

@echo
let var_1659536903925_5877: (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>) = (Int64(11), Float64(Float32(Float32(Float32(34.0)))),
    ((UInt32(UInt8(Int8(3))) & 127)..(UInt32(UInt16(157)) & 127) : (((-33) | 1))), ((UInt64(238) & 127)..(UInt64(217) &
        127) : ((Int64(UInt8(164)) | 1))), UInt8(192), ((Int16(UInt8(Int8(107))) & 127)..(Int16(UInt16(187)) & 127) : (((-71) |
        1))))

@echo
var var_1659536903925_5978: Int16 = Int16(Int16(Int16(Int16(UInt16(156)))))

@echo
var var_1659536903925_6023: (Range<UInt32>, Range<Int16>, (Float32, Int32, ((Int64, Float64, Range<UInt32>, Range<UInt64>, 
    UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16), Array<Bool>)) = (((UInt32(90) & 127)..=(UInt32(UInt16(34)) &
        127) : ((25 | 1))), ((Int16(-106) & 127)..=(Int16(15) & 127) : ((-19) | 1)), (Float32(Float32(121.0)), Int32(75),
        (((-13), (-76.0), ((UInt32(131) & 127)..=(UInt32(63) & 127) : (((-84) | 1))), ((UInt64(176) & 127)..(UInt64(31) &
                    127) : ((-49) | 1)), UInt8(150), ((Int16(76) & 127)..=(Int16(67) & 127) : (((-57) | 1)))), UInt8(213),
            Int16(Int16(120)), ((UInt8(210) & 127)..=(UInt8(60) & 127) : ((-80) | 1)), (((124 & 127)..=((-27) & 127) : (122 |
                1)) as Int8), Int8(-125), Int16(-9)), [false, true, false, false, false, false, true, false, false,
            false]))

@echo
public let var_1659536903925_6060: Range<UInt32> = ((UInt32(Int16(UInt8(UInt8(91)))) & 127)..=(UInt32(Int8(-95)) & 127) : ((Int64(UInt16(UInt16(235))) |
    1)))

@echo
public let var_1659536903925_6141: Int64 = 4

@echo
public interface Interface_1659536903925_63 {
    @echo
    static func func_1659536903925_116(): Int64 { // block id: 117
        @echo let var_1659536903925_127: Option<Array<Int64>> = Option<Array<Int64>>.None;
        if (var_1659536903925_38) {
            [(-99), 90, 117, 118, 34, 62, 81, 27, 8, 64]
        } else {
            (var_1659536903925_127 ?? [var_1659536903925_131, (-57), var_1659536903925_131, var_1659536903925_131,
                var_1659536903925_131, (-115), var_1659536903925_140, var_1659536903925_140, var_1659536903925_140,
                var_1659536903925_140])
        };
        @echo var var_1659536903925_179: Rune = 'e';
        @echo var var_1659536903925_183: Unit = ();
        @echo let var_1659536903925_214: Int16 = Int16(UInt16(Int8(Int8(25))));
        @echo let var_1659536903925_256: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) = (86, ((UInt8(246) & 127)..(UInt8(6) &
                127) : (35 | 1)), ((UInt32(Int16(-102)) & 127)..=(UInt32(46) & 127) : ((Int64(UInt8(128)) | 1))), [Int64(UInt8(158)),
                (-83), 49, (-92), Int64(Int32(UInt8(53))), 58, Int64(UInt32(172)), (-21), (-74), Int64(UInt16(129))]);
        @echo let var_1659536903925_344: (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>) = (98,
            Float64(Float32(Float32(-26.0))), ((UInt32(4) & 127)..=(UInt32(UInt16(Int8(-125))) & 127) : ((31 | 1))), ((UInt64(2) &
                127)..=(UInt64(135) & 127) : (16 | 1)), UInt8(UInt8(95)), ((Int16(106) & 127)..(Int16(-127) & 127) : ((-111) |
                1)));
        @echo func func_1659536903925_191(): Int64 { // block id: 192
            @echo var var_1659536903925_287: UInt64 = UInt64(UInt32(Int16(Int8(123))));
            if (match (var_1659536903925_51 % ((UInt32(199)) | 1)) {
                case _: Range<UInt32> => var_1659536903925_38

                case caseVar_1659536903925_204: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) =>
                    ();
                    var_1659536903925_24

                case caseVar_1659536903925_210 =>
                    var_1659536903925_214 < Int16(-41);
                    true

                case _ =>
                    [54, (-25), var_1659536903925_131, 47, var_1659536903925_131, var_1659536903925_140, (-24),
                        var_1659536903925_131, 74, var_1659536903925_131];
                    var_1659536903925_140;
                    var_1659536903925_38

                case _ =>
                    ();
                    ();
                    var_1659536903925_38
            }) {
                ((Option<Option<Range<UInt64>>>.None ?? Option<Range<UInt64>>.None) ?? match (var_1659536903925_256) {
                    case _: Int64 => ((var_1659536903925_287 & 127)..(UInt64(190) & 127) : (((-5) | 1)))

                    case (_: Float64, _: Interface_1659536903925_66, _: Option<Option<Range<UInt64>>>, _) =>
                        ();
                        @echo var var_1659536903925_299: Range<UInt64> = ((UInt64(70) & 127)..=(UInt64(UInt32(119)) & 127) : ((Int64(Int32(-53)) |
                            1)));
                        var_1659536903925_299

                    case _ => ((var_1659536903925_287 & 127)..(UInt64(77) & 127) : ((var_1659536903925_140 | 1)))
                })
            } else {
                try { // block id: 315
                    ((44 & 127)..=(81 & 127) : ((-70) | 1));
                    ();
                    @echo var var_1659536903925_322: Range<UInt32> = ((UInt32(54) & 127)..(UInt32(213) & 127) : ((-107) |
                        1));
                    @echo var var_1659536903925_329: UInt8 = UInt8(Int8(108));
                    (var_1659536903925_131, 99.0, var_1659536903925_322, ((UInt64(153) & 127)..=(var_1659536903925_287 &
                            127) : ((2 | 1))), var_1659536903925_329, var_1659536903925_333)
                } finally { // block id: 335
                    var_1659536903925_337;
                    if (var_1659536903925_38) {
                        ((UInt8(102) & 127)..=(UInt8(212) & 127) : (124 | 1))
                    } else {
                        ((UInt8(146) & 127)..=(UInt8(103) & 127) : (106 | 1))
                    };
                    var_1659536903925_344
                }[3]
            };
            var_1659536903925_367.func_1659536903925_370((),
                (Option<Range<UInt16>>.None ?? ((UInt16(115) & 127)..(UInt16(12) & 127) : (34 | 1))))
        };

        (try { // block id: 152
            if (false) {
                Option<Int64>.Some(var_1659536903925_140)
            } else {
                Option<Int64>.None
            };
            ();
            if (var_1659536903925_24) {
                var_1659536903925_162
            } else {
                var_1659536903925_162
            }
        } catch (_) { // block id: 165
            var_1659536903925_167;
            ((var_1659536903925_51 & 127)..=(UInt32(205) & 127) : (((-39) | 1)));
            Option<Int64>.Some(var_1659536903925_140)
        } finally { // block id: 175
            if (true) {
                var_1659536903925_179
            } else {
                var_1659536903925_179
            };
            var_1659536903925_183;
            if (false) {
                Option<Int64>.None
            } else {
                Option<Int64>.Some(12)
            }
        } ?? func_1659536903925_191())
    }
}

@echo
public interface Interface_1659536903925_66 {
    @echo
    func func_1659536903925_414(namedParam_1659536903925_415!: Range<Int16>, namedParam_1659536903925_416!: Range<Int8>,
        namedParam_1659536903925_417!: UInt8): Unit { // block id: 418
        @echo var var_1659536903925_5932: (Option<Array<Int64>>) -> Option<Bool> = func_1659536903925_426;
        @echo var loopTimeVar_1659536903925_5940: Int64 = 0;
        while ((((Option<Array<Int64>>.None |> var_1659536903925_5932) ?? var_1659536903925_1686 > var_1659536903925_1686)) &&
                loopTimeVar_1659536903925_5940 < 100) {
            loopTimeVar_1659536903925_5940++;
        }
    };

    @echo
    func func_1659536903925_370(param_1659536903925_371: Unit, param_1659536903925_372: Range<UInt16>): Int64 { // block id: 373
        @echo var var_1659536903925_409: Option<Unit> = (Option<Int64>.None as Unit);
        try (resource = Class_1659536903925_362()) { // block id: 375
            var_1659536903925_367.var_1659536903925_379;
            @echo var loopTimeVar_1659536903925_388: Range<UInt64> = ((UInt64(Int8(-5)) & 127)..=(UInt64(Int16(Int8(-117))) &
                127) : ((Int64(Int8(28)) | 1)));
            for (i in loopTimeVar_1659536903925_388 where true) {
                var_1659536903925_385
            }
        } finally { // block id: 397
            if (false) { // block id: 400
                ();
                ()
            };
            (var_1659536903925_409 ?? param_1659536903925_371);
            @echo var var_1659536903925_5943: Range<Int8> = ((Int8(32) & 127)..=(Int8(118) & 127) : (15 | 1));
            func_1659536903925_414(namedParam_1659536903925_415: var_1659536903925_333,
                namedParam_1659536903925_416: var_1659536903925_5943, namedParam_1659536903925_417: UInt8(102))
        };
        @echo var loopTimeVar_1659536903925_5967: Int64 = 0;
        (var_1659536903925_409 ?? while (((Option<Bool>.None ?? var_1659536903925_5775)) &&
                loopTimeVar_1659536903925_5967 < 100) {
            loopTimeVar_1659536903925_5967++;
            @echo var var_1659536903925_5962: Unit = ();
            [(), var_1659536903925_4173, var_1659536903925_2840, var_1659536903925_493, var_1659536903925_493, (), (),
                var_1659536903925_5962, (), ()]
        });
        (Option<Int64>.Some(Int64(UInt16(184))) ?? Int64(var_1659536903925_5978))
    }
}

@echo
public interface Interface_1659536903925_65 <: Interface_1659536903925_66 & Interface_1659536903925_63 {}

@echo
public interface Interface_1659536903925_64 <: Interface_1659536903925_63 & Interface_1659536903925_65 {
    @echo
    func func_1659536903925_71(): Int64 { // block id: 72
        @echo let var_1659536903925_87: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) = ((-60), ((UInt8(53) & 127)..=(UInt8(140) &
                127) : (42 | 1)), ((UInt32(251) & 127)..(UInt32(18) & 127) : ((-83) | 1)), [Int64(UInt32(35)),
                Int64(UInt64(Int8(-67))), 12, 60, Int64(UInt8(Int8(31))), Int64(Int8(Int8(-124))), 122,
                Int64(Int16(UInt8(149))), (-77), Int64(Int64(Int8(104)))]);
        @echo var var_1659536903925_6091: Array<Bool> = [true,
            (((Int32(113) & 127)..(Int32(64) & 127) : (5 | 1)) is Option<Unit>),
            ([(), (), (), (), (), (), (), (), (), ()] is Option<Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), 
            Unit, Range<Int16>, Unit, String, Array<Unit>)>>), true,
            (((UInt8(160) & 127)..=(UInt8(181) & 127) : ((-30) | 1)) is (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>)),
            false, true, false, true,
            ((((UInt32(175) & 127)..=(UInt32(227) & 127) : (84 | 1)), ((Int16(-120) & 127)..(Int16(-84) & 127) : (((-126) |
                1))), (Float32(-121.0), Int32(89), (((-40), (-39.0), ((UInt32(116) & 127)..(UInt32(96) & 127) : (122 | 1)),
                        ((UInt64(37) & 127)..=(UInt64(194) & 127) : (((-111) | 1))), UInt8(124), ((Int16(92) & 127)..(Int16(-4) &
                            127) : ((-60) | 1))), UInt8(238), Int16(-76), ((UInt8(166) & 127)..=(UInt8(88) & 127) : (((-67) |
                        1))), Option<Int8>.Some(Int8(122)), Int8(29), Int16(-92)), [false, false, true, false, false,
                    true, false, true, true, false])) is Option<Option<Bool>>)];
        [var_1659536903925_87[0], func_1659536903925_116(), 97 - 2, (Option<Int64>.None ?? (-32)),
            match (var_1659536903925_2317) {
            case _ =>
                var_1659536903925_4634;
                Option<Bool>.Some(var_1659536903925_1771);
                (-45)
        }, match (Option<Range<UInt8>>.None) {
            case _ => 116
        }, var_1659536903925_5115,
            try { // block id: 6013
            var_1659536903925_2030;
            74
        } catch (_) { // block id: 6016
            var_1659536903925_4943 *= var_1659536903925_131
            @echo var var_1659536903925_6074: Float32 = Float32(71.0);
            @echo var var_1659536903925_6085: Int64 = (-118);
            if (var_1659536903925_38) {
                var_1659536903925_6023
            } else {
                (var_1659536903925_6060, var_1659536903925_333, (var_1659536903925_6074, var_1659536903925_922, (var_1659536903925_2662,
                            var_1659536903925_1735, var_1659536903925_1706, ((UInt8(142) & 127)..=(var_1659536903925_3506 &
                                127) : ((var_1659536903925_6085 | 1))), var_1659536903925_1710, var_1659536903925_606,
                            var_1659536903925_5978), var_1659536903925_6091))
            };
            66
        }, Int64(Int32(-127)), var_1659536903925_6141][1]
    };

    @echo
    static func func_1659536903925_116(): Int64 { // block id: 117
        @echo let var_1659536903925_127: Option<Array<Int64>> = Option<Array<Int64>>.None;
        if (var_1659536903925_38) {
            [(-99), 90, 117, 118, 34, 62, 81, 27, 8, 64]
        } else {
            (var_1659536903925_127 ?? [var_1659536903925_131, (-57), var_1659536903925_131, var_1659536903925_131,
                var_1659536903925_131, (-115), var_1659536903925_140, var_1659536903925_140, var_1659536903925_140,
                var_1659536903925_140])
        };
        @echo var var_1659536903925_179: Rune = 'e';
        @echo var var_1659536903925_183: Unit = ();
        @echo let var_1659536903925_214: Int16 = Int16(UInt16(Int8(Int8(25))));
        @echo let var_1659536903925_256: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) = (86, ((UInt8(246) & 127)..(UInt8(6) &
                127) : (35 | 1)), ((UInt32(Int16(-102)) & 127)..=(UInt32(46) & 127) : ((Int64(UInt8(128)) | 1))), [Int64(UInt8(158)),
                (-83), 49, (-92), Int64(Int32(UInt8(53))), 58, Int64(UInt32(172)), (-21), (-74), Int64(UInt16(129))]);
        @echo let var_1659536903925_344: (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>) = (98,
            Float64(Float32(Float32(-26.0))), ((UInt32(4) & 127)..=(UInt32(UInt16(Int8(-125))) & 127) : ((31 | 1))), ((UInt64(2) &
                127)..=(UInt64(135) & 127) : (16 | 1)), UInt8(UInt8(95)), ((Int16(106) & 127)..(Int16(-127) & 127) : ((-111) |
                1)));
        @echo func func_1659536903925_191(): Int64 { // block id: 192
            @echo var var_1659536903925_287: UInt64 = UInt64(UInt32(Int16(Int8(123))));
            if (match (var_1659536903925_51 % ((UInt32(199)) | 1)) {
                case _: Range<UInt32> => var_1659536903925_38

                case caseVar_1659536903925_204: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) =>
                    ();
                    var_1659536903925_24

                case caseVar_1659536903925_210 =>
                    var_1659536903925_214 < Int16(-41);
                    true

                case _ =>
                    [54, (-25), var_1659536903925_131, 47, var_1659536903925_131, var_1659536903925_140, (-24),
                        var_1659536903925_131, 74, var_1659536903925_131];
                    var_1659536903925_140;
                    var_1659536903925_38

                case _ =>
                    ();
                    ();
                    var_1659536903925_38
            }) {
                ((Option<Option<Range<UInt64>>>.None ?? Option<Range<UInt64>>.None) ?? match (var_1659536903925_256) {
                    case _: Int64 => ((var_1659536903925_287 & 127)..(UInt64(190) & 127) : (((-5) | 1)))

                    case (_: Float64, _: Interface_1659536903925_66, _: Option<Option<Range<UInt64>>>, _) =>
                        ();
                        @echo var var_1659536903925_299: Range<UInt64> = ((UInt64(70) & 127)..=(UInt64(UInt32(119)) & 127) : ((Int64(Int32(-53)) |
                            1)));
                        var_1659536903925_299

                    case _ => ((var_1659536903925_287 & 127)..(UInt64(77) & 127) : ((var_1659536903925_140 | 1)))
                })
            } else {
                try { // block id: 315
                    ((44 & 127)..=(81 & 127) : ((-70) | 1));
                    ();
                    @echo var var_1659536903925_322: Range<UInt32> = ((UInt32(54) & 127)..(UInt32(213) & 127) : ((-107) |
                        1));
                    @echo var var_1659536903925_329: UInt8 = UInt8(Int8(108));
                    (var_1659536903925_131, 99.0, var_1659536903925_322, ((UInt64(153) & 127)..=(var_1659536903925_287 &
                            127) : ((2 | 1))), var_1659536903925_329, var_1659536903925_333)
                } finally { // block id: 335
                    var_1659536903925_337;
                    if (var_1659536903925_38) {
                        ((UInt8(102) & 127)..=(UInt8(212) & 127) : (124 | 1))
                    } else {
                        ((UInt8(146) & 127)..=(UInt8(103) & 127) : (106 | 1))
                    };
                    var_1659536903925_344
                }[3]
            };
            var_1659536903925_367.func_1659536903925_370((),
                (Option<Range<UInt16>>.None ?? ((UInt16(115) & 127)..(UInt16(12) & 127) : (34 | 1))))
        };

        (try { // block id: 152
            if (false) {
                Option<Int64>.Some(var_1659536903925_140)
            } else {
                Option<Int64>.None
            };
            ();
            if (var_1659536903925_24) {
                var_1659536903925_162
            } else {
                var_1659536903925_162
            }
        } catch (_) { // block id: 165
            var_1659536903925_167;
            ((var_1659536903925_51 & 127)..=(UInt32(205) & 127) : (((-39) | 1)));
            Option<Int64>.Some(var_1659536903925_140)
        } finally { // block id: 175
            if (true) {
                var_1659536903925_179
            } else {
                var_1659536903925_179
            };
            var_1659536903925_183;
            if (false) {
                Option<Int64>.None
            } else {
                Option<Int64>.Some(12)
            }
        } ?? func_1659536903925_191())
    }
}

@echo
public interface Interface_1659536903925_62 <: Interface_1659536903925_63 & Interface_1659536903925_64 {
    @echo
    static func func_1659536903925_116(): Int64 { // block id: 117
        @echo let var_1659536903925_127: Option<Array<Int64>> = Option<Array<Int64>>.None;
        if (var_1659536903925_38) {
            [(-99), 90, 117, 118, 34, 62, 81, 27, 8, 64]
        } else {
            (var_1659536903925_127 ?? [var_1659536903925_131, (-57), var_1659536903925_131, var_1659536903925_131,
                var_1659536903925_131, (-115), var_1659536903925_140, var_1659536903925_140, var_1659536903925_140,
                var_1659536903925_140])
        };
        @echo var var_1659536903925_179: Rune = 'e';
        @echo var var_1659536903925_183: Unit = ();
        @echo let var_1659536903925_214: Int16 = Int16(UInt16(Int8(Int8(25))));
        @echo let var_1659536903925_256: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) = (86, ((UInt8(246) & 127)..(UInt8(6) &
                127) : (35 | 1)), ((UInt32(Int16(-102)) & 127)..=(UInt32(46) & 127) : ((Int64(UInt8(128)) | 1))), [Int64(UInt8(158)),
                (-83), 49, (-92), Int64(Int32(UInt8(53))), 58, Int64(UInt32(172)), (-21), (-74), Int64(UInt16(129))]);
        @echo let var_1659536903925_344: (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>) = (98,
            Float64(Float32(Float32(-26.0))), ((UInt32(4) & 127)..=(UInt32(UInt16(Int8(-125))) & 127) : ((31 | 1))), ((UInt64(2) &
                127)..=(UInt64(135) & 127) : (16 | 1)), UInt8(UInt8(95)), ((Int16(106) & 127)..(Int16(-127) & 127) : ((-111) |
                1)));
        @echo func func_1659536903925_191(): Int64 { // block id: 192
            @echo var var_1659536903925_287: UInt64 = UInt64(UInt32(Int16(Int8(123))));
            if (match (var_1659536903925_51 % ((UInt32(199)) | 1)) {
                case _: Range<UInt32> => var_1659536903925_38

                case caseVar_1659536903925_204: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) =>
                    ();
                    var_1659536903925_24

                case caseVar_1659536903925_210 =>
                    var_1659536903925_214 < Int16(-41);
                    true

                case _ =>
                    [54, (-25), var_1659536903925_131, 47, var_1659536903925_131, var_1659536903925_140, (-24),
                        var_1659536903925_131, 74, var_1659536903925_131];
                    var_1659536903925_140;
                    var_1659536903925_38

                case _ =>
                    ();
                    ();
                    var_1659536903925_38
            }) {
                ((Option<Option<Range<UInt64>>>.None ?? Option<Range<UInt64>>.None) ?? match (var_1659536903925_256) {
                    case _: Int64 => ((var_1659536903925_287 & 127)..(UInt64(190) & 127) : (((-5) | 1)))

                    case (_: Float64, _: Interface_1659536903925_66, _: Option<Option<Range<UInt64>>>, _) =>
                        ();
                        @echo var var_1659536903925_299: Range<UInt64> = ((UInt64(70) & 127)..=(UInt64(UInt32(119)) & 127) : ((Int64(Int32(-53)) |
                            1)));
                        var_1659536903925_299

                    case _ => ((var_1659536903925_287 & 127)..(UInt64(77) & 127) : ((var_1659536903925_140 | 1)))
                })
            } else {
                try { // block id: 315
                    ((44 & 127)..=(81 & 127) : ((-70) | 1));
                    ();
                    @echo var var_1659536903925_322: Range<UInt32> = ((UInt32(54) & 127)..(UInt32(213) & 127) : ((-107) |
                        1));
                    @echo var var_1659536903925_329: UInt8 = UInt8(Int8(108));
                    (var_1659536903925_131, 99.0, var_1659536903925_322, ((UInt64(153) & 127)..=(var_1659536903925_287 &
                            127) : ((2 | 1))), var_1659536903925_329, var_1659536903925_333)
                } finally { // block id: 335
                    var_1659536903925_337;
                    if (var_1659536903925_38) {
                        ((UInt8(102) & 127)..=(UInt8(212) & 127) : (124 | 1))
                    } else {
                        ((UInt8(146) & 127)..=(UInt8(103) & 127) : (106 | 1))
                    };
                    var_1659536903925_344
                }[3]
            };
            var_1659536903925_367.func_1659536903925_370((),
                (Option<Range<UInt16>>.None ?? ((UInt16(115) & 127)..(UInt16(12) & 127) : (34 | 1))))
        };

        (try { // block id: 152
            if (false) {
                Option<Int64>.Some(var_1659536903925_140)
            } else {
                Option<Int64>.None
            };
            ();
            if (var_1659536903925_24) {
                var_1659536903925_162
            } else {
                var_1659536903925_162
            }
        } catch (_) { // block id: 165
            var_1659536903925_167;
            ((var_1659536903925_51 & 127)..=(UInt32(205) & 127) : (((-39) | 1)));
            Option<Int64>.Some(var_1659536903925_140)
        } finally { // block id: 175
            if (true) {
                var_1659536903925_179
            } else {
                var_1659536903925_179
            };
            var_1659536903925_183;
            if (false) {
                Option<Int64>.None
            } else {
                Option<Int64>.Some(12)
            }
        } ?? func_1659536903925_191())
    }
}

@echo
public open class Class_1659536903925_59 <: Interface_1659536903925_62 & Interface_1659536903925_64 {
    @echo
    public init() { // block id: 61

    }

    @echo
    public init(param_1659536903925_1832: (Range<UInt8>) -> UInt16, namedParam_1659536903925_1835!: Unit) { // block id: 1836
        @echo var var_1659536903925_1884: ((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, 
            Int16, Range<UInt8>, Option<Int8>, Int8, Int16) = (((-80), (-110.0), ((UInt32(152) & 127)..=(UInt32(179) &
                    127) : ((-93) | 1)), ((UInt64(UInt8(232)) & 127)..(UInt64((-67)) & 127) : ((78 | 1))), UInt8(25), ((Int16(99) &
                    127)..(Int16(UInt16(144)) & 127) : ((Int64(UInt8(31)) | 1)))), UInt8(220), Int16(UInt8(Int8(115))), ((UInt8(249) &
                127)..=(UInt8(164) & 127) : ((-117) | 1)), Option<Int8>.None, Int8(UInt8(114)), Int16(UInt16(152)));
        match ((try { // block id: 1844
            @echo var var_1659536903925_1849: Option<((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), 
                UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16)> = Option<((Int64, Float64, Range<UInt32>, Range<UInt64>, 
                    UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16)>.Some(
                ((Int64(Int32(7)), (-123.0), ((UInt32(26) & 127)..(UInt32(105) & 127) : ((-39) | 1)), ((UInt64(101) & 127)..(UInt64(177) &
                            127) : ((96 | 1))), UInt8(Int8(-9)), ((Int16(-65) & 127)..=(Int16(8) & 127) : (44 | 1))),
                    UInt8(225), Int16(UInt8(UInt8(172))), ((UInt8(UInt8(138)) & 127)..=(UInt8(74) & 127) : (((-40) | 1))),
                    (((Int32(79) & 127)..=(Int32(-23) & 127) : (34 | 1)) as Int8), Int8(30), Int16(Int16(20))));
            if (false) {
                Option<((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, 
                        Option<Int8>, Int8, Int16)>.None
            } else {
                var_1659536903925_1849
            }
        } finally { // block id: 1878
            if (var_1659536903925_1771) {
                Option<((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, 
                        Option<Int8>, Int8, Int16)>.None
            } else {
                Option<((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, 
                        Option<Int8>, Int8, Int16)>.Some(var_1659536903925_1884)
            }
        } ?? (var_1659536903925_1919 ?? var_1659536903925_1884))) {
            case _: String =>
                var_1659536903925_1884;
                UInt16(183)

            case (_: Range<UInt32>, caseVar_1659536903925_1929: Option<Int8>, _: Option<UInt16>, _, _: (Int64, Float64, 
                        Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), caseVar_1659536903925_1930, _) => var_1659536903925_1428

            case ((caseVar_1659536903925_1935, _: Array<Unit>, _: Int8, caseVar_1659536903925_1936, _: Range<UInt16>, caseVar_1659536903925_1937: Range<Int32>), _, caseVar_1659536903925_1938: Int32, _, _: Float64, caseVar_1659536903925_1939, caseVar_1659536903925_1940) => UInt16(150)

            case _ => UInt16(21) << ((UInt16(82)) & 7)
        };
        UInt8(Int8(117));
        var_1659536903925_1951
    };

    @echo
    public init(param_1659536903925_3754: Option<Int64>) { // block id: 3755
        ()
    };

    @echo
    public static func func_1659536903925_116(): Int64 { // block id: 117
        @echo let var_1659536903925_127: Option<Array<Int64>> = Option<Array<Int64>>.None;
        if (var_1659536903925_38) {
            [(-99), 90, 117, 118, 34, 62, 81, 27, 8, 64]
        } else {
            (var_1659536903925_127 ?? [var_1659536903925_131, (-57), var_1659536903925_131, var_1659536903925_131,
                var_1659536903925_131, (-115), var_1659536903925_140, var_1659536903925_140, var_1659536903925_140,
                var_1659536903925_140])
        };
        @echo var var_1659536903925_179: Rune = 'e';
        @echo var var_1659536903925_183: Unit = ();
        @echo let var_1659536903925_214: Int16 = Int16(UInt16(Int8(Int8(25))));
        @echo let var_1659536903925_256: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) = (86, ((UInt8(246) & 127)..(UInt8(6) &
                127) : (35 | 1)), ((UInt32(Int16(-102)) & 127)..=(UInt32(46) & 127) : ((Int64(UInt8(128)) | 1))), [Int64(UInt8(158)),
                (-83), 49, (-92), Int64(Int32(UInt8(53))), 58, Int64(UInt32(172)), (-21), (-74), Int64(UInt16(129))]);
        @echo let var_1659536903925_344: (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>) = (98,
            Float64(Float32(Float32(-26.0))), ((UInt32(4) & 127)..=(UInt32(UInt16(Int8(-125))) & 127) : ((31 | 1))), ((UInt64(2) &
                127)..=(UInt64(135) & 127) : (16 | 1)), UInt8(UInt8(95)), ((Int16(106) & 127)..(Int16(-127) & 127) : ((-111) |
                1)));
        @echo func func_1659536903925_191(): Int64 { // block id: 192
            @echo var var_1659536903925_287: UInt64 = UInt64(UInt32(Int16(Int8(123))));
            if (match (var_1659536903925_51 % ((UInt32(199)) | 1)) {
                case _: Range<UInt32> => var_1659536903925_38

                case caseVar_1659536903925_204: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) =>
                    ();
                    var_1659536903925_24

                case caseVar_1659536903925_210 =>
                    var_1659536903925_214 < Int16(-41);
                    true

                case _ =>
                    [54, (-25), var_1659536903925_131, 47, var_1659536903925_131, var_1659536903925_140, (-24),
                        var_1659536903925_131, 74, var_1659536903925_131];
                    var_1659536903925_140;
                    var_1659536903925_38

                case _ =>
                    ();
                    ();
                    var_1659536903925_38
            }) {
                ((Option<Option<Range<UInt64>>>.None ?? Option<Range<UInt64>>.None) ?? match (var_1659536903925_256) {
                    case _: Int64 => ((var_1659536903925_287 & 127)..(UInt64(190) & 127) : (((-5) | 1)))

                    case (_: Float64, _: Interface_1659536903925_66, _: Option<Option<Range<UInt64>>>, _) =>
                        ();
                        @echo var var_1659536903925_299: Range<UInt64> = ((UInt64(70) & 127)..=(UInt64(UInt32(119)) & 127) : ((Int64(Int32(-53)) |
                            1)));
                        var_1659536903925_299

                    case _ => ((var_1659536903925_287 & 127)..(UInt64(77) & 127) : ((var_1659536903925_140 | 1)))
                })
            } else {
                try { // block id: 315
                    ((44 & 127)..=(81 & 127) : ((-70) | 1));
                    ();
                    @echo var var_1659536903925_322: Range<UInt32> = ((UInt32(54) & 127)..(UInt32(213) & 127) : ((-107) |
                        1));
                    @echo var var_1659536903925_329: UInt8 = UInt8(Int8(108));
                    (var_1659536903925_131, 99.0, var_1659536903925_322, ((UInt64(153) & 127)..=(var_1659536903925_287 &
                            127) : ((2 | 1))), var_1659536903925_329, var_1659536903925_333)
                } finally { // block id: 335
                    var_1659536903925_337;
                    if (var_1659536903925_38) {
                        ((UInt8(102) & 127)..=(UInt8(212) & 127) : (124 | 1))
                    } else {
                        ((UInt8(146) & 127)..=(UInt8(103) & 127) : (106 | 1))
                    };
                    var_1659536903925_344
                }[3]
            };
            var_1659536903925_367.func_1659536903925_370((),
                (Option<Range<UInt16>>.None ?? ((UInt16(115) & 127)..(UInt16(12) & 127) : (34 | 1))))
        };

        (try { // block id: 152
            if (false) {
                Option<Int64>.Some(var_1659536903925_140)
            } else {
                Option<Int64>.None
            };
            ();
            if (var_1659536903925_24) {
                var_1659536903925_162
            } else {
                var_1659536903925_162
            }
        } catch (_) { // block id: 165
            var_1659536903925_167;
            ((var_1659536903925_51 & 127)..=(UInt32(205) & 127) : (((-39) | 1)));
            Option<Int64>.Some(var_1659536903925_140)
        } finally { // block id: 175
            if (true) {
                var_1659536903925_179
            } else {
                var_1659536903925_179
            };
            var_1659536903925_183;
            if (false) {
                Option<Int64>.None
            } else {
                Option<Int64>.Some(12)
            }
        } ?? func_1659536903925_191())
    };

    @echo
    public func func_1659536903925_414(namedParam_1659536903925_415!: Range<Int16>,
        namedParam_1659536903925_416!: Range<Int8>, namedParam_1659536903925_417!: UInt8): Unit { // block id: 418
        @echo var var_1659536903925_5932: (Option<Array<Int64>>) -> Option<Bool> = func_1659536903925_426;
        @echo var loopTimeVar_1659536903925_5940: Int64 = 0;
        while ((((Option<Array<Int64>>.None |> var_1659536903925_5932) ?? var_1659536903925_1686 > var_1659536903925_1686)) &&
                loopTimeVar_1659536903925_5940 < 100) {
            loopTimeVar_1659536903925_5940++;
        }
    };

    @echo
    public func func_1659536903925_370(param_1659536903925_371: Unit, param_1659536903925_372: Range<UInt16>): Int64 { // block id: 373
        @echo var var_1659536903925_409: Option<Unit> = (Option<Int64>.None as Unit);
        try (resource = Class_1659536903925_362()) { // block id: 375
            var_1659536903925_367.var_1659536903925_379;
            @echo var loopTimeVar_1659536903925_388: Range<UInt64> = ((UInt64(Int8(-5)) & 127)..=(UInt64(Int16(Int8(-117))) &
                127) : ((Int64(Int8(28)) | 1)));
            for (i in loopTimeVar_1659536903925_388 where true) {
                var_1659536903925_385
            }
        } finally { // block id: 397
            if (false) { // block id: 400
                ();
                ()
            };
            (var_1659536903925_409 ?? param_1659536903925_371);
            @echo var var_1659536903925_5943: Range<Int8> = ((Int8(32) & 127)..=(Int8(118) & 127) : (15 | 1));
            func_1659536903925_414(namedParam_1659536903925_415: var_1659536903925_333,
                namedParam_1659536903925_416: var_1659536903925_5943, namedParam_1659536903925_417: UInt8(102))
        };
        @echo var loopTimeVar_1659536903925_5967: Int64 = 0;
        (var_1659536903925_409 ?? while (((Option<Bool>.None ?? var_1659536903925_5775)) &&
                loopTimeVar_1659536903925_5967 < 100) {
            loopTimeVar_1659536903925_5967++;
            @echo var var_1659536903925_5962: Unit = ();
            [(), var_1659536903925_4173, var_1659536903925_2840, var_1659536903925_493, var_1659536903925_493, (), (),
                var_1659536903925_5962, (), ()]
        });
        (Option<Int64>.Some(Int64(UInt16(184))) ?? Int64(var_1659536903925_5978))
    };

    @echo
    public func func_1659536903925_71(): Int64 { // block id: 72
        @echo let var_1659536903925_87: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) = ((-60), ((UInt8(53) & 127)..=(UInt8(140) &
                127) : (42 | 1)), ((UInt32(251) & 127)..(UInt32(18) & 127) : ((-83) | 1)), [Int64(UInt32(35)),
                Int64(UInt64(Int8(-67))), 12, 60, Int64(UInt8(Int8(31))), Int64(Int8(Int8(-124))), 122,
                Int64(Int16(UInt8(149))), (-77), Int64(Int64(Int8(104)))]);
        @echo var var_1659536903925_6091: Array<Bool> = [true,
            (((Int32(113) & 127)..(Int32(64) & 127) : (5 | 1)) is Option<Unit>),
            ([(), (), (), (), (), (), (), (), (), ()] is Option<Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), 
            Unit, Range<Int16>, Unit, String, Array<Unit>)>>), true,
            (((UInt8(160) & 127)..=(UInt8(181) & 127) : ((-30) | 1)) is (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>)),
            false, true, false, true,
            ((((UInt32(175) & 127)..=(UInt32(227) & 127) : (84 | 1)), ((Int16(-120) & 127)..(Int16(-84) & 127) : (((-126) |
                1))), (Float32(-121.0), Int32(89), (((-40), (-39.0), ((UInt32(116) & 127)..(UInt32(96) & 127) : (122 | 1)),
                        ((UInt64(37) & 127)..=(UInt64(194) & 127) : (((-111) | 1))), UInt8(124), ((Int16(92) & 127)..(Int16(-4) &
                            127) : ((-60) | 1))), UInt8(238), Int16(-76), ((UInt8(166) & 127)..=(UInt8(88) & 127) : (((-67) |
                        1))), Option<Int8>.Some(Int8(122)), Int8(29), Int16(-92)), [false, false, true, false, false,
                    true, false, true, true, false])) is Option<Option<Bool>>)];
        [var_1659536903925_87[0], func_1659536903925_116(), 97 - 2, (Option<Int64>.None ?? (-32)),
            match (var_1659536903925_2317) {
            case _ =>
                var_1659536903925_4634;
                Option<Bool>.Some(var_1659536903925_1771);
                (-45)
        }, match (Option<Range<UInt8>>.None) {
            case _ => 116
        }, var_1659536903925_5115,
            try { // block id: 6013
            var_1659536903925_2030;
            74
        } catch (_) { // block id: 6016
            var_1659536903925_4943 *= var_1659536903925_131
            @echo var var_1659536903925_6074: Float32 = Float32(71.0);
            @echo var var_1659536903925_6085: Int64 = (-118);
            if (var_1659536903925_38) {
                var_1659536903925_6023
            } else {
                (var_1659536903925_6060, var_1659536903925_333, (var_1659536903925_6074, var_1659536903925_922, (var_1659536903925_2662,
                            var_1659536903925_1735, var_1659536903925_1706, ((UInt8(142) & 127)..=(var_1659536903925_3506 &
                                127) : ((var_1659536903925_6085 | 1))), var_1659536903925_1710, var_1659536903925_606,
                            var_1659536903925_5978), var_1659536903925_6091))
            };
            66
        }, Int64(Int32(-127)), var_1659536903925_6141][1]
    }
}

@echo
public interface Interface_1659536903925_365 <: Interface_1659536903925_64 & Interface_1659536903925_66 {
    @echo
    func func_1659536903925_414(namedParam_1659536903925_415!: Range<Int16>, namedParam_1659536903925_416!: Range<Int8>,
        namedParam_1659536903925_417!: UInt8): Unit { // block id: 418
        @echo var var_1659536903925_5932: (Option<Array<Int64>>) -> Option<Bool> = func_1659536903925_426;
        @echo var loopTimeVar_1659536903925_5940: Int64 = 0;
        while ((((Option<Array<Int64>>.None |> var_1659536903925_5932) ?? var_1659536903925_1686 > var_1659536903925_1686)) &&
                loopTimeVar_1659536903925_5940 < 100) {
            loopTimeVar_1659536903925_5940++;
        }
    };

    @echo
    func func_1659536903925_370(param_1659536903925_371: Unit, param_1659536903925_372: Range<UInt16>): Int64 { // block id: 373
        @echo var var_1659536903925_409: Option<Unit> = (Option<Int64>.None as Unit);
        try (resource = Class_1659536903925_362()) { // block id: 375
            var_1659536903925_367.var_1659536903925_379;
            @echo var loopTimeVar_1659536903925_388: Range<UInt64> = ((UInt64(Int8(-5)) & 127)..=(UInt64(Int16(Int8(-117))) &
                127) : ((Int64(Int8(28)) | 1)));
            for (i in loopTimeVar_1659536903925_388 where true) {
                var_1659536903925_385
            }
        } finally { // block id: 397
            if (false) { // block id: 400
                ();
                ()
            };
            (var_1659536903925_409 ?? param_1659536903925_371);
            @echo var var_1659536903925_5943: Range<Int8> = ((Int8(32) & 127)..=(Int8(118) & 127) : (15 | 1));
            func_1659536903925_414(namedParam_1659536903925_415: var_1659536903925_333,
                namedParam_1659536903925_416: var_1659536903925_5943, namedParam_1659536903925_417: UInt8(102))
        };
        @echo var loopTimeVar_1659536903925_5967: Int64 = 0;
        (var_1659536903925_409 ?? while (((Option<Bool>.None ?? var_1659536903925_5775)) &&
                loopTimeVar_1659536903925_5967 < 100) {
            loopTimeVar_1659536903925_5967++;
            @echo var var_1659536903925_5962: Unit = ();
            [(), var_1659536903925_4173, var_1659536903925_2840, var_1659536903925_493, var_1659536903925_493, (), (),
                var_1659536903925_5962, (), ()]
        });
        (Option<Int64>.Some(Int64(UInt16(184))) ?? Int64(var_1659536903925_5978))
    }
}

@echo
public open class Class_1659536903925_362 <: Interface_1659536903925_365 & Interface_1659536903925_66 & Resource {
    @echo
    public init() { // block id: 364

    }

    @echo
    public let var_1659536903925_379: Int8 = Int8(-127);
    @echo
    static var var_1659536903925_435: Bool = false;
    @echo
    public let var_1659536903925_508: Unit = ();
    @echo
    public init(namedParam_1659536903925_2455!: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>),
        optionalParam_1659536903925_2456!: Option<UInt16> = ((((UInt32(133) & 127)..=(UInt32(UInt32(114)) & 127) : ((10 |
                1))), ((Int16(Int16(34)) & 127)..=(Int16(44) & 127) : ((Int64(Int16(71)) | 1))), (Float32(-46.0), Int32(Int16(111)),
                (((-89), (-31.0), ((UInt32(3) & 127)..=(UInt32(227) & 127) : ((-68) | 1)), ((UInt64(172) & 127)..=(UInt64(51) &
                            127) : (((-92) | 1))), UInt8(87), ((Int16(-67) & 127)..(Int16(-125) & 127) : ((2 | 1)))),
                    UInt8(188), Int16(-37), ((UInt8(199) & 127)..(UInt8(224) & 127) : ((85 | 1))), Option<Int8>.None,
                    Int8(-118), Int16(-10)), [false, false, false, true, true, false, false, false, true, true])) as UInt16),
        optionalParam_1659536903925_2498!: UInt64 = UInt64(205)) { // block id: 2500
        var_1659536903925_606 |= var_1659536903925_606
        (Option<UInt16>.Some(var_1659536903925_1428) ?? UInt16(var_1659536903925_1725)) ^ (var_1659536903925_2512 % ((var_1659536903925_2519[8]) |
            1));
        ()
    };

    @echo
    public init(param_1659536903925_2563: Option<Bool>) { // block id: 2564
        @echo let var_1659536903925_2599: Option<Float64> = (Int8(Int8(-25)) as Float64);
        (match (if (var_1659536903925_38) {
            Option<Option<Range<UInt64>>>.None
        } else {
            var_1659536903925_385
        }) {
            case _ =>
                if (var_1659536903925_24) {
                    var_1659536903925_1454
                } else {
                    (((UInt32(42) & 127)..(UInt32(178) & 127) : (34 | 1)), ((Int16(-110) & 127)..(Int16(-105) & 127) : (105 |
                            1)), var_1659536903925_1554)
                };
                Class_1659536903925_59();
                Option<Float64>.Some(var_1659536903925_1686)

            case _: (Array<Bool>, Range<UInt16>, Unit, (Range<UInt32>, Range<UInt32>, Option<Bool>), UInt32) =>
                if (false) {
                    Option<Float64>.Some(39.0)
                } else {
                    Option<Float64>.Some(59.0)
                }

            case caseVar_1659536903925_2596 => var_1659536903925_2599

            case caseVar_1659536903925_2605 =>
                var_1659536903925_2030;
                (false, UInt16(90));
                var_1659536903925_2599

            case _ =>
                ();
                ();
                Option<Float64>.Some((-97.0))
        } ?? Float64(Float32(92.0)) - if (var_1659536903925_24) { // block id: 2623
            ();
            if (true) {
                var_1659536903925_2628
            } else {
                var_1659536903925_2628
            };
            var_1659536903925_1686
        } else if (var_1659536903925_1771) { // block id: 2633
            if (var_1659536903925_24) {
                Option<Float64>.Some(68.0)
            } else {
                Option<Float64>.Some(var_1659536903925_1686)
            };
            var_1659536903925_1686 / Float64((Int32(95.0)) | 1)
        } else { // block id: 2643
            @echo var var_1659536903925_2645: Range<UInt16> = ((UInt16(UInt8(UInt8(207))) & 127)..=(UInt16(188) & 127) : (((-8) |
                1)));
            var_1659536903925_2645;
            (-103.0) - (-34.0)
        });
        @echo var var_1659536903925_2675: Range<UInt16> = ((UInt16(100) & 127)..=(UInt16(149) & 127) : (6 | 1));
        @echo var var_1659536903925_2690: UInt64 = UInt64(Int8(-113));
        @echo var var_1659536903925_2701: Int16 = Int16(UInt16(Int16(UInt16(226))));
        @echo var var_1659536903925_2709: Range<UInt8> = ((UInt8(70) & 127)..=(UInt8(182) & 127) : (((-22) | 1)));
        @echo var var_1659536903925_2755: Array<Bool> = [true, true, false, false, false, false, false, true, false,
            false];
        @echo var var_1659536903925_2777: Interface_1659536903925_66 = Class_1659536903925_59(func_1659536903925_1405,
            namedParam_1659536903925_1835: ());
        match ((try { // block id: 2658
                var_1659536903925_2030;
                ();
                var_1659536903925_2662
            } finally { // block id: 2671
                if (false) {
                    var_1659536903925_2675
                } else {
                    ((UInt16(253) & 127)..(UInt16(80) & 127) : ((var_1659536903925_131 | 1)))
                };
                (-105) >> ((13) & 7);
                (var_1659536903925_140, 119.0, var_1659536903925_955, ((var_1659536903925_2690 & 127)..=(UInt64(176) &
                        127) : (((-41) | 1))), UInt8(28), ((Int16(-121) & 127)..(Int16(68) & 127) : (73 | 1)))
            }, (Option<UInt8>.None ?? var_1659536903925_1735), var_1659536903925_2701, if (false) {
                var_1659536903925_2709
            } else {
                ((UInt8(242) & 127)..(UInt8(198) & 127) : ((var_1659536903925_1068 | 1)))
            }, if (true) {
                Option<Int8>.None
            } else {
                var_1659536903925_1710
            }, Int8(Int8(92)), Int16(Int8(-26)))) {
            case _: Interface_1659536903925_66 =>
                if (var_1659536903925_38) {
                    var_1659536903925_1554
                } else {
                    (var_1659536903925_167, Int32(48), (((-46), 26.0, ((UInt32(206) & 127)..(UInt32(108) & 127) : ((var_1659536903925_140 |
                                    1))), var_1659536903925_2744, var_1659536903925_1735, var_1659536903925_333), UInt8(243),
                            var_1659536903925_2701, var_1659536903925_2709, var_1659536903925_1710, Int8(-46), Int16(-121)),
                        var_1659536903925_2755)
                };
                @echo var var_1659536903925_2762: Interface_1659536903925_66 = Class_1659536903925_59();
                @echo var var_1659536903925_2774: Interface_1659536903925_66 = Class_1659536903925_59();
                [Class_1659536903925_59(func_1659536903925_1405, namedParam_1659536903925_1835: ()),
                    var_1659536903925_2762,
                    Class_1659536903925_59(func_1659536903925_1405, namedParam_1659536903925_1835: ()),
                    Class_1659536903925_59(), Class_1659536903925_362(),
                    Class_1659536903925_362(namedParam_1659536903925_2455: var_1659536903925_2275),
                    var_1659536903925_2762, var_1659536903925_2762, var_1659536903925_2774, var_1659536903925_2777];
                false

            case caseVar_1659536903925_2784 =>
                ();
                var_1659536903925_606 >= var_1659536903925_606

            case _ => Int8(-107) >= var_1659536903925_606

            case caseVar_1659536903925_2798 =>
                Option<UInt16>.None;
                var_1659536903925_38

            case _ => var_1659536903925_38
        }
    };

    @echo
    public func func_1659536903925_414(namedParam_1659536903925_415!: Range<Int16>,
        namedParam_1659536903925_416!: Range<Int8>, namedParam_1659536903925_417!: UInt8): Unit { // block id: 418
        @echo var var_1659536903925_5932: (Option<Array<Int64>>) -> Option<Bool> = func_1659536903925_426;
        @echo var loopTimeVar_1659536903925_5940: Int64 = 0;
        while ((((Option<Array<Int64>>.None |> var_1659536903925_5932) ?? var_1659536903925_1686 > var_1659536903925_1686)) &&
                loopTimeVar_1659536903925_5940 < 100) {
            loopTimeVar_1659536903925_5940++;
        }
    };

    @echo
    public func func_1659536903925_370(param_1659536903925_371: Unit, param_1659536903925_372: Range<UInt16>): Int64 { // block id: 373
        @echo var var_1659536903925_409: Option<Unit> = (Option<Int64>.None as Unit);
        try (resource = Class_1659536903925_362()) { // block id: 375
            var_1659536903925_367.var_1659536903925_379;
            @echo var loopTimeVar_1659536903925_388: Range<UInt64> = ((UInt64(Int8(-5)) & 127)..=(UInt64(Int16(Int8(-117))) &
                127) : ((Int64(Int8(28)) | 1)));
            for (i in loopTimeVar_1659536903925_388 where true) {
                var_1659536903925_385
            }
        } finally { // block id: 397
            if (false) { // block id: 400
                ();
                ()
            };
            (var_1659536903925_409 ?? param_1659536903925_371);
            @echo var var_1659536903925_5943: Range<Int8> = ((Int8(32) & 127)..=(Int8(118) & 127) : (15 | 1));
            func_1659536903925_414(namedParam_1659536903925_415: var_1659536903925_333,
                namedParam_1659536903925_416: var_1659536903925_5943, namedParam_1659536903925_417: UInt8(102))
        };
        @echo var loopTimeVar_1659536903925_5967: Int64 = 0;
        (var_1659536903925_409 ?? while (((Option<Bool>.None ?? var_1659536903925_5775)) &&
                loopTimeVar_1659536903925_5967 < 100) {
            loopTimeVar_1659536903925_5967++;
            @echo var var_1659536903925_5962: Unit = ();
            [(), var_1659536903925_4173, var_1659536903925_2840, var_1659536903925_493, var_1659536903925_493, (), (),
                var_1659536903925_5962, (), ()]
        });
        (Option<Int64>.Some(Int64(UInt16(184))) ?? Int64(var_1659536903925_5978))
    }

    public func isClosed(): Bool {
        return true
    }
    public func close(): Unit {}
}

@echo
func func_1659536903925_886(namedParam_1659536903925_887!: Float32,
    optionalParam_1659536903925_888!: Range<Int32> = ((Int32(12) & 127)..=(Int32(-94) & 127) : (111 | 1))): Option<Option<Range<UInt64>>> { // block id: 890
    try { // block id: 892
        Option<Option<Option<Range<UInt64>>>>.None.getOrThrow()
    } finally { // block id: 899
        (var_1659536903925_902 ?? var_1659536903925_385)
    }
}

@echo
func func_1659536903925_926(param_1659536903925_927: Int64): Int32 { // block id: 928
    Int32(-55)
}

@echo
public func func_1659536903925_1405(param_1659536903925_1406: Range<UInt8>): UInt16 { // block id: 1407
    (try { // block id: 1414
        if (false) {
            Option<UInt16>.Some(UInt16(60))
        } else {
            var_1659536903925_1420
        }
    } catch (e: Exception) { // block id: 1422
        if (var_1659536903925_24) {
            var_1659536903925_1420
        } else {
            var_1659536903925_1420
        }
    } ?? var_1659536903925_1428)
}

@echo
func func_1659536903925_1441(param_1659536903925_1442: (Int64) -> Int32): Unit { // block id: 1445
    Option<Option<Option<Range<UInt64>>>>.None;
    var_1659536903925_1454[2][2][4];
    @echo var loopTimeVar_1659536903925_1525: Range<UInt64> = ((UInt64(23) & 127)..=(UInt64(147) & 127) : ((Int64(Int32(UInt16(68))) |
        1)));
    for (i in loopTimeVar_1659536903925_1525 where match ((Option<Int64>.None ?? var_1659536903925_1068)) {
        case -92 | -118 | -87 | 115 => false

        case _ =>
            ();
            false
    }) {
        @echo var loopTimeVar_1659536903925_1524: Int64 = 0;
        while ((var_1659536903925_24) && loopTimeVar_1659536903925_1524 < 100) {
            loopTimeVar_1659536903925_1524++;
        }
    }
}

@echo
public func func_1659536903925_1538(param_1659536903925_927: Int64): Int32 { // block id: 928
    Int32(-55)
}

@echo
public func func_1659536903925_2020(param_1659536903925_2021: Array<Unit>): Int32 { // block id: 2022
    (((if (var_1659536903925_38) {
        var_1659536903925_692
    } else {
        "nAs*LtI\"@G"
    }) as Unit) ?? var_1659536903925_2030);
    @echo let var_1659536903925_2069: (Int64, Int64, Range<UInt16>, UInt64, Array<Option<Bool>>, (Int64, Float64, Range<UInt32>, 
        Range<UInt64>, UInt8, Range<Int16>), Range<UInt32>) = (84, Int64(Int8(-79)), ((UInt16(72) & 127)..(UInt16(156) &
            127) : ((-37) | 1)), UInt64(UInt8(82)), [Option<Bool>.Some(false),
            (((-11), ((UInt8(70) & 127)..=(UInt8(127) & 127) : (((-79) | 1))), ((UInt32(166) & 127)..=(UInt32(165) & 127) : ((18 |
                1))), [(-114), (-104), 64, (-68), (-78), 67, (-120), (-6), 71, 102]) as Bool),
            (Option<Option<Option<Range<UInt64>>>>.Some(Option<Option<Range<UInt64>>>.None) as Bool),
            (Int8(UInt8(230)) as Bool), Option<Bool>.None,
            (((UInt32(75) & 127)..(UInt32(62) & 127) : (((-60) | 1))) as Bool), Option<Bool>.None,
            (Option<Option<Range<UInt64>>>.None as Bool), (Float32(-112.0) as Bool), (Class_1659536903925_362() as Bool)],
        (Int64(UInt8(111)), Float64(46.0), ((UInt32(Int8(47)) & 127)..(UInt32(UInt16(228)) & 127) : ((44 | 1))), ((UInt64(UInt8(191)) &
                127)..=(UInt64(127) & 127) : ((98 | 1))), UInt8(UInt8(UInt8(144))), ((Int16(23) & 127)..(Int16(-49) & 127) : (42 |
                1))), ((UInt32(92) & 127)..=(UInt32(28) & 127) : (((-33) | 1))));
    (var_1659536903925_2038 ?? match ((Option<Float64>.None ?? 115.0)) {
        case caseVar_1659536903925_2050 =>
            [(-44), 26, 52, 4, 49, 0, (-92), 39, (-77), (-16)];
            var_1659536903925_38 ||= true
            -Int32(41)

        case caseVar_1659536903925_2060: (Float32, Int32, ((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), 
                UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16), Array<Bool>) => var_1659536903925_922 >> ((Int32(-125)) &
            7)

        case _ =>
            (-114.0);
            var_1659536903925_2069;
            Int32(-119) - Int32(-85)
    })
}

@echo
public func func_1659536903925_2151(param_1659536903925_2152: Int64): Array<Unit> { // block id: 2153
    if (true) {
        try { // block id: 2157
            Option<Unit>.None
        } catch (_) { // block id: 2159
            @echo let var_1659536903925_2161: Option<Unit> = (Class_1659536903925_362() as Unit);
            var_1659536903925_2161
        } finally { // block id: 2164
            if (false) {
                (((UInt32(163) & 127)..(UInt32(178) & 127) : (17 | 1)), ((UInt32(158) & 127)..=(UInt32(23) & 127) : ((param_1659536903925_2152 |
                        1))), var_1659536903925_1151)
            } else {
                (var_1659536903925_955, ((var_1659536903925_51 & 127)..=(UInt32(115) & 127) : (((-114) | 1))),
                    var_1659536903925_1151)
            };
            @echo let var_1659536903925_2184: Option<Unit> = ((UInt8(88) as UInt16) as Unit);
            if (var_1659536903925_24) {
                var_1659536903925_2184
            } else {
                var_1659536903925_2184
            }
        }
    } else {
        Option<Unit>.None
    };
    @echo var loopTimeVar_1659536903925_2199: Range<UInt64> = ((UInt64(Int8(UInt8(228))) & 127)..=(UInt64(Int8(-13)) &
        127) : ((Int64(UInt32(UInt8(UInt8(151)))) | 1)));
    (var_1659536903925_2192 ?? for (i in loopTimeVar_1659536903925_2199 where (var_1659536903925_1151 is ((Int64, 
        Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, 
        Int16))) {
    });
    @echo var var_1659536903925_2264: Array<Unit> = [(), (), (), (), (), (), (), (), (), ()];
    try { // block id: 2211
        @echo var loopTimeVar_1659536903925_2219: Range<UInt64> = ((UInt64(Int8(8)) & 127)..=(UInt64(50) & 127) : (((-97) |
            1)));
        for (i in loopTimeVar_1659536903925_2219 where var_1659536903925_1771) {
            Option<(Bool, UInt16)>.Some((var_1659536903925_1771, var_1659536903925_1428))
        };
        Option<Unit>.Some(()).getOrThrow();
        @echo var var_1659536903925_2229: Array<Unit> = [(), (), (), (), (), (), (), (), (), ()];
        var_1659536903925_2229
    } catch (_) { // block id: 2231
        try (resource = Class_1659536903925_362()) { // block id: 2233
            var_1659536903925_24 ||= var_1659536903925_38
        } catch (_) { // block id: 2237
            if (false) {
                Option<Float64>.None
            } else {
                Option<Float64>.Some(var_1659536903925_1686)
            };
            if (false) {
                ((Int32(0) & 127)..(Int32(-63) & 127) : ((94 | 1)))
            } else {
                ((Int32(-111) & 127)..=(Int32(-12) & 127) : (13 | 1))
            };
            ()
        };
        (var_1659536903925_385 ?? var_1659536903925_2254);
        @echo let var_1659536903925_2261: Array<Range<UInt8>> = [((UInt8(4) & 127)..(UInt8(197) & 127) : ((-67) | 1)),
            ((UInt8(242) & 127)..=(UInt8(92) & 127) : ((-114) | 1)), ((UInt8(66) & 127)..(UInt8(0) & 127) : (71 | 1)),
            ((UInt8(132) & 127)..(UInt8(187) & 127) : (68 | 1)), ((UInt8(159) & 127)..(UInt8(107) & 127) : ((-117) | 1)),
            ((UInt8(216) & 127)..(UInt8(213) & 127) : ((-40) | 1)), ((UInt8(113) & 127)..(UInt8(33) & 127) : ((-101) | 1)),
            ((UInt8(245) & 127)..(UInt8(170) & 127) : ((-87) | 1)), ((UInt8(78) & 127)..=(UInt8(8) & 127) : (75 | 1)),
            ((UInt8(164) & 127)..(UInt8(82) & 127) : ((-88) | 1))];
        try { // block id: 2259
            var_1659536903925_2261;
            var_1659536903925_2264
        } finally { // block id: 2266
            if (var_1659536903925_1771) {
                [(), (), (), (), (), (), (), (), (), ()]
            } else {
                [(), (), (), (), (), (), (), (), (), ()]
            }
        }
    }
}

@echo
func func_1659536903925_2015(param_1659536903925_2016: Bool): Bool { // block id: 2017
    @echo let var_1659536903925_2149: (Array<Unit>) -> Int32 = func_1659536903925_2020;
    func_1659536903925_1441((func_1659536903925_2151 ~> var_1659536903925_2149));
    @echo var loopTimeVar_1659536903925_2300: Int64 = 0;
    while ((match (var_1659536903925_2275) {
            case _ =>
                if (param_1659536903925_2016) {
                    Class_1659536903925_362()
                } else {
                    var_1659536903925_2295
                };
                false
        }) && loopTimeVar_1659536903925_2300 < 100) {
        loopTimeVar_1659536903925_2300++;
    };
    ((if (var_1659536903925_38) {
        if (var_1659536903925_1771) { // block id: 2306
            Int32(-32);
            if (true) {
                (false, var_1659536903925_1428)
            } else {
                var_1659536903925_783
            }
        } else if (false) { // block id: 2315
            var_1659536903925_2317;
            (true, UInt16(132))
        } else { // block id: 2322
            Int32(-46) >> ((var_1659536903925_922) & 7);
            var_1659536903925_783
        }
    } else {
        match (var_1659536903925_2329) {
            case _ =>
                @echo var var_1659536903925_2336: UInt8 = UInt8(108);
                var_1659536903925_2336++;
                var_1659536903925_24 ||= true
                (var_1659536903925_24, UInt16(177))

            case _ =>
                if (var_1659536903925_24) {
                    var_1659536903925_783
                } else {
                    (var_1659536903925_1771, var_1659536903925_1428)
                }
        }
    }) is (Int64, Int64, Range<UInt16>, UInt64, Array<Option<Bool>>, (Int64, Float64, Range<UInt32>, Range<UInt64>, 
        UInt8, Range<Int16>), Range<UInt32>))
}

@echo
public func func_1659536903925_1624(
    param_1659536903925_1766: ((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, 
        Array<Unit>)): Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, 
    Array<Unit>)> { // block id: 1767
    @echo let var_1659536903925_1827: Array<Option<Bool>> = [(Class_1659536903925_59(
        {lambdaParameter_1659536903925_1955: Range<UInt8> => UInt16(195)}, namedParam_1659536903925_1835: ()) as Bool),
        Option<Bool>.Some(false), (Float64((-101.0)) as Bool), Option<Bool>.None, (Class_1659536903925_59() as Bool),
        Option<Bool>.None,
        Option<Bool>.Some(
        (((14, ((UInt8(16) & 127)..(UInt8(207) & 127) : (39 | 1)), ((UInt32(20) & 127)..(UInt32(107) & 127) : ((6 | 1))),
                [77, 54, 101, (-29), (-68), (-90), (-33), (-59), 68, 53]), (), ((Int16(82) & 127)..(Int16(78) & 127) : (((-19) |
                1))), (), ###"M]K2SoEVcg"###, [(), (), (), (), (), (), (), (), (), ()]) is (Int64, Float64, Range<UInt32>, 
            Range<UInt64>, UInt8, Range<Int16>))), Option<Bool>.None, Option<Bool>.None, (UInt32(224) as Bool)];
    @echo let var_1659536903925_2353: (Bool) -> Bool = func_1659536903925_2015;
    @echo func func_1659536903925_1823(param_1659536903925_1824: Range<Int32>): Range<UInt8> { // block id: 1825
        var_1659536903925_1827;
        @echo var var_1659536903925_2010: Array<Range<UInt8>> = [((UInt8(246) & 127)..=(UInt8(19) & 127) : (68 | 1)),
            ((UInt8(217) & 127)..(UInt8(0) & 127) : ((-115) | 1)), ((UInt8(29) & 127)..=(UInt8(32) & 127) : ((-16) | 1)),
            ((UInt8(29) & 127)..(UInt8(132) & 127) : (97 | 1)), ((UInt8(40) & 127)..(UInt8(106) & 127) : ((-87) | 1)),
            ((UInt8(89) & 127)..=(UInt8(252) & 127) : (120 | 1)), ((UInt8(172) & 127)..=(UInt8(175) & 127) : (82 | 1)),
            ((UInt8(140) & 127)..(UInt8(84) & 127) : ((-33) | 1)), ((UInt8(122) & 127)..=(UInt8(173) & 127) : (105 | 1)),
            ((UInt8(214) & 127)..(UInt8(225) & 127) : ((-94) | 1))];
        @echo let var_1659536903925_2360: Range<UInt8> = ((UInt8(78) & 127)..=(UInt8(96) & 127) : ((-73) | 1));
        (Option<Range<UInt8>>.Some(var_1659536903925_2010[1]) ?? if ((var_1659536903925_1771 |> var_1659536903925_2353)) {
            [((UInt8(217) & 127)..=(UInt8(9) & 127) : ((-30) | 1)), ((UInt8(179) & 127)..(UInt8(4) & 127) : ((-34) | 1)),
                ((UInt8(93) & 127)..=(UInt8(249) & 127) : ((-108) | 1)),
                ((UInt8(137) & 127)..=(UInt8(52) & 127) : ((-94) | 1)), ((UInt8(58) & 127)..(UInt8(13) & 127) : (104 | 1)),
                ((UInt8(7) & 127)..=(UInt8(101) & 127) : ((-43) | 1)),
                ((UInt8(145) & 127)..=(UInt8(49) & 127) : ((-79) | 1)),
                ((UInt8(49) & 127)..(UInt8(227) & 127) : ((-54) | 1)), ((UInt8(84) & 127)..(UInt8(197) & 127) : (110 | 1)),
                ((UInt8(4) & 127)..(UInt8(238) & 127) : (111 | 1))][0]
        } else {
            var_1659536903925_2360
        })
    };

    @echo let var_1659536903925_2948: Array<Unit> = [(), (), (), (), (), (), (), (), (), ()];
    @echo func func_1659536903925_1785(param_1659536903925_1786: Int32, namedParam_1659536903925_1787!: Int8,
        namedParam_1659536903925_1788!: Range<Int8>,
        namedParam_1659536903925_1789!: (Float32, Range<Int32>) -> Option<Option<Range<UInt64>>>): Array<Unit> { // block id: 1793
        @echo let var_1659536903925_2376: UInt8 = UInt8(109);
        @echo func func_1659536903925_1807(param_1659536903925_1808: (Range<UInt8>) -> UInt16,
            param_1659536903925_1811: (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>),
            optionalParam_1659536903925_1812!: (Bool, UInt16) = (false, UInt16(UInt8(Int8(UInt8(115)))))): UInt64 { // block id: 1819
            @echo var var_1659536903925_2366: Int64 = (-84);
            func_1659536903925_1823(
                ((Int32(-54) & 127)..=(param_1659536903925_1786 & 127) : ((var_1659536903925_2366 | 1)))) |>
                func_1659536903925_1405;
            (((Option<UInt8>.None ?? var_1659536903925_2376) & 127)..=(try { // block id: 2379
                namedParam_1659536903925_1788;
                @echo var var_1659536903925_2383: Int16 = Int16(UInt16(Int8(-107)));
                var_1659536903925_2383 *= var_1659536903925_1725
                UInt8(168)
            } finally { // block id: 2389
                var_1659536903925_2376 - UInt8(84)
            } & 127) : (try { // block id: 2394
                @echo var var_1659536903925_2397: UInt8 = UInt8(244);
                var_1659536903925_2397 *= var_1659536903925_1735
                var_1659536903925_1068 + 91
            } catch (e: Exception) { // block id: 2403
                ();
                var_1659536903925_2366 / ((var_1659536903925_1068) | 1)
            } | 1));
            UInt64(20)
        };

        @echo var var_1659536903925_2424: UInt64 = UInt64(57);
        if (try { // block id: 1796
            @echo var var_1659536903925_1798: ?Range<UInt64> = Option<Range<UInt64>>.None;
            var_1659536903925_1798;
            var_1659536903925_493;
            var_1659536903925_24
        } finally { // block id: 1802
            !var_1659536903925_38
        }) { // block id: 1805
            func_1659536903925_1807(func_1659536903925_1405,
                (var_1659536903925_131, 87.0, var_1659536903925_955, ((UInt64(109) & 127)..=(UInt64(214) & 127) : (41 | 1)),
                    UInt8(43), var_1659536903925_333));
            ();
            try (resource = Class_1659536903925_362()) { // block id: 2419
                [(), (), (), (), (), (), (), (), (), ()];
                var_1659536903925_2030;
                var_1659536903925_2424 <<= ((var_1659536903925_2424) & 7)
            } finally { // block id: 2427
                var_1659536903925_1068 %= ((var_1659536903925_131) | 1)
                ()
            }
        };
        @echo let var_1659536903925_2441: Array<Bool> = [false,
            (Option<Option<Range<UInt64>>>.Some(Option<Range<UInt64>>.None) is Range<UInt16>), false, false,
            ([Class_1659536903925_59(), Class_1659536903925_59(),
            Class_1659536903925_362(
            namedParam_1659536903925_2455: (78, ((UInt8(147) & 127)..(UInt8(78) & 127) : ((-42) | 1)), ((UInt32(247) &
                    127)..(UInt32(229) & 127) : (((-101) | 1))), [82, (-36), (-5), (-67), 1, (-6), 60, (-27), (-122), 84])),
            Class_1659536903925_362(), Class_1659536903925_362(),
            Class_1659536903925_362(
            namedParam_1659536903925_2455: ((-11), ((UInt8(50) & 127)..=(UInt8(186) & 127) : (((-65) | 1))), ((UInt32(192) &
                    127)..(UInt32(61) & 127) : (((-70) | 1))), [(-123), 125, (-51), 77, (-86), 52, 74, (-87), (-70), 13])),
            Class_1659536903925_59(), Class_1659536903925_59(), Class_1659536903925_362(),
            Class_1659536903925_362(Option<Bool>.None)] is Option<Unit>),
            (("""
-rYK5
,x-c=
""" as Option<Option<Range<UInt64>>>) is Option<Option<Range<UInt64>>>),
            ((((UInt32(34) & 127)..=(UInt32(194) & 127) : ((-22) | 1)), ((UInt32(248) & 127)..=(UInt32(89) & 127) : (((-62) |
                1))), Option<Bool>.None) is (Range<Int16>, Bool, (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, 
            Range<Int16>), UInt64, Class_1659536903925_362, String, Int16, UInt32, Array<Int64>)),
            ([((UInt8(242) & 127)..(UInt8(53) & 127) : (61 | 1)), ((UInt8(253) & 127)..(UInt8(237) & 127) : ((-6) | 1)),
            ((UInt8(231) & 127)..=(UInt8(2) & 127) : (99 | 1)), ((UInt8(61) & 127)..(UInt8(46) & 127) : (121 | 1)),
            ((UInt8(100) & 127)..=(UInt8(124) & 127) : ((-51) | 1)), ((UInt8(141) & 127)..=(UInt8(218) & 127) : (123 | 1)),
            ((UInt8(33) & 127)..(UInt8(54) & 127) : (87 | 1)), ((UInt8(223) & 127)..=(UInt8(218) & 127) : ((-54) | 1)),
            ((UInt8(156) & 127)..=(UInt8(78) & 127) : (53 | 1)), ((UInt8(16) & 127)..=(UInt8(106) & 127) : ((-13) | 1))] is UInt32),
            ((((-98), ((UInt8(160) & 127)..(UInt8(99) & 127) : (((-66) | 1))), ((UInt32(73) & 127)..(UInt32(119) & 127) : (((-101) |
                1))), [108, 20, (-53), 11, (-42), (-45), 86, (-94), (-104), (-13)]) as Range<UInt8>) is Option<UInt8>),
            true];
        if ((if (false) {
            Option<Bool>.Some(var_1659536903925_24)
        } else {
            var_1659536903925_1151
        } ?? var_1659536903925_2441[6])) { // block id: 2834
            if (false) { // block id: 2837
                ();
                var_1659536903925_2840
            } else if (var_1659536903925_24) { // block id: 2843
                ();
                var_1659536903925_2030
            }
        };
        @echo let var_1659536903925_2853: Range<UInt8> = ((UInt8(141) & 127)..(UInt8(112) & 127) : (15 | 1));
        @echo var var_1659536903925_2889: Rune = 'j';
        @echo var var_1659536903925_2957: ?Bool = Option<Bool>.None;
        if ((match (((44, var_1659536903925_2853, ((var_1659536903925_51 & 127)..=(UInt32(14) & 127) : (((-57) | 1))), [var_1659536903925_140,
                    (-98), var_1659536903925_131, (-80), var_1659536903925_1068, var_1659536903925_131,
                    var_1659536903925_1068, 71, 59, 66]), var_1659536903925_493, ((Int16(91) & 127)..=(Int16(47) & 127) : ((-90) |
                1)), var_1659536903925_2840, "5D`O':e]!(", [(), (), (), var_1659536903925_493, var_1659536903925_2840,
                (), (), var_1659536903925_2030, (), ()])) {
            case _ =>
                var_1659536903925_2889;
                ((32 & 127)..((-107) & 127) : (90 | 1));
                if (true) {
                    Option<Bool>.Some(false)
                } else {
                    var_1659536903925_1151
                }

            case _ => Option<Bool>.Some(var_1659536903925_24)
        } ?? match (var_1659536903925_2424) {
            case 128 | 68 =>
                var_1659536903925_51--;
                var_1659536903925_38

            case 2 | 53 | 107 => UInt64(25) == var_1659536903925_2424

            case caseVar_1659536903925_2917 => false

            case _ =>
                var_1659536903925_51 |= UInt32(147)
                var_1659536903925_38

            case _ =>
                var_1659536903925_493;
                var_1659536903925_1771
        })) {
            (if ((var_1659536903925_2934 is (Range<UInt32>, Range<UInt32>, Option<Bool>))) {
                [(), (), (), var_1659536903925_2030, (), (), (), (), var_1659536903925_2030, var_1659536903925_2030]
            } else {
                var_1659536903925_2948
            })
        } else {
            (if ((var_1659536903925_2957 ?? var_1659536903925_38)) {
                match (var_1659536903925_2840) {
                    case _ => [(), var_1659536903925_2030, var_1659536903925_2840, var_1659536903925_2030, (),
                        var_1659536903925_493, var_1659536903925_2840, (), var_1659536903925_493, var_1659536903925_493]
                }
            } else {
                var_1659536903925_2948
            })
        }
    };

    if (var_1659536903925_1771) {
        [(), var_1659536903925_493, var_1659536903925_493, var_1659536903925_493, var_1659536903925_493,
            var_1659536903925_493, var_1659536903925_493, var_1659536903925_493, var_1659536903925_493,
            var_1659536903925_493]
    } else {
        func_1659536903925_1785(Int32(-101), namedParam_1659536903925_1787: Int8(83),
            namedParam_1659536903925_1788: ((Int8(-68) & 127)..=(Int8(19) & 127) : (42 | 1)),
            namedParam_1659536903925_1789: func_1659536903925_886)
    }[0];
    if (((var_1659536903925_2989 ?? Option<Bool>.None) ?? try { // block id: 2993
        var_1659536903925_1735;
        @echo var var_1659536903925_2996: (Range<Int16>, Bool, (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, 
            Range<Int16>), UInt64, Class_1659536903925_362, String, Int16, UInt32, Array<Int64>) = (((Int16(UInt8(204)) &
                127)..=(Int16(92) & 127) : ((71 | 1))), ((96, Float64(Float32(-117.0)), ((UInt32(134) & 127)..=(UInt32(105) &
                    127) : (((-89) | 1))), ((UInt64(214) & 127)..=(UInt64(193) & 127) : (76 | 1)), UInt8(152), ((Int16(42) &
                    127)..=(Int16(6) & 127) : (110 | 1))) is Interface_1659536903925_66), (Int64(UInt64(Int16(60))),
                Float64(Float32(Float32(14.0))), ((UInt32(209) & 127)..(UInt32(37) & 127) : (115 | 1)), ((UInt64(UInt8(172)) &
                    127)..=(UInt64(UInt64(89)) & 127) : (((-69) | 1))), UInt8(30), ((Int16(Int8(125)) & 127)..=(Int16(-8) &
                    127) : ((Int64(UInt16(37)) | 1)))), UInt64(139), Class_1659536903925_362(), """
CoE@U
`#B<0
""",
            Int16(UInt8(232)), UInt32(Int32(119)), [(-106), 77, 125, (-78), (-21), 10, Int64(UInt32(UInt16(232))), (-70),
                (-112), Int64(Int8(UInt8(76)))]);
        var_1659536903925_2996;
        true
    } catch (_) { // block id: 3059
        var_1659536903925_606--;
        var_1659536903925_337;
        @echo var var_1659536903925_3064: Bool = ((Int64(UInt64(87)), Int64(UInt8(Int8(18))), ((UInt16(139) & 127)..=(UInt16(241) &
                127) : ((-14) | 1)), UInt64((-69)), [Option<Bool>.None,
                (((UInt32(251) & 127)..=(UInt32(52) & 127) : (126 | 1)) as Bool),
                (((Int8(78) & 127)..=(Int8(53) & 127) : ((-84) | 1)) as Bool), Option<Bool>.Some(true),
                Option<Bool>.None, Option<Bool>.Some(true), Option<Bool>.Some(false), Option<Bool>.Some(true),
                ('p' as Bool), ("E8tMV2oaaS" as Bool)], (Int64(UInt64(8)), Float64((-91.0)), ((UInt32(240) & 127)..=(UInt32(156) &
                    127) : (46 | 1)), ((UInt64(222) & 127)..=(UInt64(221) & 127) : (((-32) | 1))), UInt8(130), ((Int16(-52) &
                    127)..=(Int16(-68) & 127) : ((-15) | 1))), ((UInt32(UInt32(84)) & 127)..=(UInt32(Int32(-127)) & 127) : ((Int64(Int32(-103)) |
                1)))) is Rune);
        var_1659536903925_3064
    })) {
        Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>)>
            .Some(
                if (false) { // block id: 3117
                    var_1659536903925_2295;
                    ();
                    param_1659536903925_1766
                } else if (true) { // block id: 3122
                    param_1659536903925_1766
                } else { // block id: 3124
                    if (var_1659536903925_1771) {
                        (var_1659536903925_2275, (), ((Int16(-71) & 127)..=(Int16(-91) & 127) : (26 | 1)), (),
                            var_1659536903925_692, [(), (), (), (), (), (), (), (), (), ()])
                    } else {
                        (((-1), ((UInt8(80) & 127)..(UInt8(45) & 127) : (((-125) | 1))), var_1659536903925_955, [(-66),
                                    (-49), (-114), (-94), (-48), (-94), (-124), 77, 95, (-46)]), (), ((Int16(1) & 127)..=(Int16(-40) &
                                127) : (((-92) | 1))), (), "hNMne\\wC4o", [(), (), (), (), (), (), (), (), (), ()])
                    }
                })
    } else {
        (var_1659536903925_367 as ((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, 
            Array<Unit>))
    }
}

@echo
public func func_1659536903925_1751(param_1659536903925_1752: Float64): ((Int64, Float64, Range<UInt32>, Range<UInt64>, 
    UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16) { // block id: 1753
    @echo func func_1659536903925_1757(param_1659536903925_1758: UInt8,
        namedParam_1659536903925_1759!: Interface_1659536903925_63, namedParam_1659536903925_1760!: Option<Int64>,
        namedParam_1659536903925_1761!: Option<Array<Int64>>): Interface_1659536903925_63 { // block id: 1762
        @echo var loopTimeVar_1659536903925_3223: Range<UInt64> = ((UInt64(Int32(UInt32(30))) & 127)..(UInt64(168) & 127) : ((109 |
            1)));
        @echo var var_1659536903925_3241: Range<Int16> = ((Int16(31) & 127)..(Int16(42) & 127) : ((-97) | 1));
        (func_1659536903925_1624(
            if (false) { // block id: 3155
                ();
                var_1659536903925_3158
            } else if (true) { // block id: 3182
                if (var_1659536903925_38) {
                    var_1659536903925_3158
                } else {
                    (var_1659536903925_2275, (), ((Int16(-49) & 127)..(Int16(13) & 127) : (80 | 1)),
                        var_1659536903925_2840, var_1659536903925_692, [(), (), (), var_1659536903925_2840,
                            var_1659536903925_2030, (), var_1659536903925_2840, var_1659536903925_493, (), ()])
                }
            } else { // block id: 3203
                var_1659536903925_3158
            }) ?? (try { // block id: 3207
                var_1659536903925_2030;
                Float32(28.0);
                (var_1659536903925_1068, ((UInt8(118) & 127)..=(UInt8(181) & 127) : (124 | 1)), var_1659536903925_955, [(-87),
                        (-68), (-30), (-12), (-7), 83, (-59), (-84), (-76), (-116)])
            } catch (e: Exception) { // block id: 3215
                var_1659536903925_2275
            } finally { // block id: 3217
                var_1659536903925_2840;
                var_1659536903925_2275
            }, for (i in loopTimeVar_1659536903925_3223 where var_1659536903925_38) {
            }, match (param_1659536903925_1752) {
                case 98.0 | -79.0 | -57.0 | 39.0 => var_1659536903925_333

                case _ =>
                    if (false) {
                        var_1659536903925_3241
                    } else {
                        ((Int16(-52) & 127)..=(Int16(74) & 127) : (42 | 1))
                    }
            }, match (UInt32(127)) {
                case 195 | 39 | 25 | 155 => ()

                case _ =>
                    if (var_1659536903925_1771) {
                        (var_1659536903925_2275, var_1659536903925_2030, var_1659536903925_3241, var_1659536903925_2030,
                            ###"\\=#XV_}[^K"###, var_1659536903925_3261)
                    } else {
                        (var_1659536903925_2275, (), var_1659536903925_333, (), var_1659536903925_692, [(), (), (), (),
                                (), (), (), (), (), ()])
                    };
                    ()
            }, "J,ur`*g1>J", try { // block id: 3283
                [(), (), (), (), (), (), (), (), (), ()]
            } finally { // block id: 3285
                ();
                var_1659536903925_1068 -= (-69)
                if (true) {
                    var_1659536903925_3261
                } else {
                    var_1659536903925_3261
                }
            }));
        @echo var loopTimeVar_1659536903925_3299: Range<UInt64> = ((UInt64(Int16(57)) & 127)..=(UInt64(247) & 127) : ((Int64(Int16(UInt8(UInt8(45)))) |
            1)));
        for (i in loopTimeVar_1659536903925_3299 where var_1659536903925_1771 && var_1659536903925_1771) {
        }
        (if ((param_1659536903925_1758 < UInt8(127))) {
            (Option<Option<Interface_1659536903925_63>>.None ?? Option<Interface_1659536903925_63>.None)
        } else {
            try { // block id: 3325
                var_1659536903925_2840;
                @echo var var_1659536903925_3330: Option<Interface_1659536903925_63> = (((((-68), ((UInt8(203) & 127)..(UInt8(134) &
                            127) : (((-52) | 1))), ((UInt32(252) & 127)..(UInt32(105) & 127) : ((-97) | 1)), [(-19),
                            (-41), (-85), 39, 72, 8, (-88), (-39), 60, 37]), (), ((Int16(91) & 127)..(Int16(33) & 127) : (((-117) |
                        1))), (), "IBtR/B+'%h", [(), (), (), (), (), (), (), (), (), ()]) as ((Int64, Range<UInt8>, 
                    Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>)) as Interface_1659536903925_63);
                if (var_1659536903925_38) {
                    var_1659536903925_3330
                } else {
                    Option<Interface_1659536903925_63>.Some(Class_1659536903925_362())
                }
            } finally { // block id: 3372
                Option<Interface_1659536903925_63>.None
            }
        } ?? Class_1659536903925_59())
    };

    @echo let var_1659536903925_3381: Option<Array<Int64>> = ((Float32(-35.0), Int32(-21), ((110, 19.0, ((UInt32(19) &
                    127)..(UInt32(215) & 127) : (43 | 1)), ((UInt64(61) & 127)..(UInt64(62) & 127) : ((110 | 1))), UInt8(191),
                ((Int16(111) & 127)..(Int16(-12) & 127) : (((-66) | 1)))), UInt8(51), Int16(UInt16(222)), ((UInt8(117) &
                127)..=(UInt8(135) & 127) : ((41 | 1))), Option<Int8>.Some(Int8(-113)), Int8(UInt8(230)), Int16(57)), [true,
            (Class_1659536903925_362() is Range<Int64>),
            ((false, UInt16(223)) is (((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, 
                String, Array<Unit>)) -> Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, 
            Unit, String, Array<Unit>)>),
            ((Float32(73.0), Int32(15), (((-106), 124.0, ((UInt32(189) & 127)..=(UInt32(173) & 127) : (((-25) | 1))), ((UInt64(80) &
                        127)..=(UInt64(21) & 127) : ((-35) | 1)), UInt8(158), ((Int16(31) & 127)..=(Int16(124) & 127) : ((102 |
                        1)))), UInt8(236), Int16(29), ((UInt8(204) & 127)..(UInt8(82) & 127) : ((77 | 1))), Option<Int8>
                    .None, Int8(119), Int16(88)), [false, false, false, true, true, true, true, false, false, false]) is Option<((Int64, 
            Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, 
            Int16)>),
            (Option<Array<Int64>>.None is ((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, 
            Int16, Range<UInt8>, Option<Int8>, Int8, Int16)), false, true, false, (UInt32(51) is (Bool) -> Bool),
            (Option<Float64>.Some((-9.0)) is Range<Int16>)]) as Array<Int64>);
    @echo var var_1659536903925_3490: UInt64 = UInt64(13);
    @echo let var_1659536903925_3528: UInt64 = UInt64(UInt64(184));
    @echo var var_1659536903925_3667: Bool = false;
    @echo let var_1659536903925_3670: Range<UInt8> = ((UInt8(UInt8(215)) & 127)..=(UInt8(UInt8(84)) & 127) : ((Int64(4) |
        1)));
    @echo var var_1659536903925_3705: ?Bool = Option<Bool>.Some((Class_1659536903925_59() is Int64));
    @echo let var_1659536903925_3719: Bool = (Class_1659536903925_362() is Int8);
    @echo var var_1659536903925_3806: (Range<UInt8>) -> UInt16 = func_1659536903925_1405;
    (match (func_1659536903925_1757(var_1659536903925_1735, namedParam_1659536903925_1759: var_1659536903925_3377,
            namedParam_1659536903925_1760: Option<Int64>.None, namedParam_1659536903925_1761: var_1659536903925_3381)) {
            case caseVar_1659536903925_3470 =>
                Class_1659536903925_59();
                var_1659536903925_606 *= Int8(-93)
                (var_1659536903925_131, 1.0, ((UInt32(27) & 127)..(UInt32(56) & 127) : ((-13) | 1)),
                    var_1659536903925_2744, var_1659536903925_1735, ((Int16(-74) & 127)..=(Int16(-10) & 127) : ((-104) |
                        1)))

            case caseVar_1659536903925_3485 =>
                var_1659536903925_2840;
                var_1659536903925_3490 ^= UInt64(125)
                @echo let var_1659536903925_3503: Range<UInt64> = ((UInt64(188) & 127)..=(UInt64(48) & 127) : ((-71) | 1));
                if (var_1659536903925_24) {
                    ((-82), param_1659536903925_1752, ((UInt32(174) & 127)..(var_1659536903925_51 & 127) : ((var_1659536903925_1068 |
                            1))), var_1659536903925_3503, var_1659536903925_3506, ((Int16(12) & 127)..(Int16(-82) & 127) : (110 |
                            1)))
                } else {
                    ((-44), param_1659536903925_1752, ((var_1659536903925_51 & 127)..(UInt32(211) & 127) : (((-75) | 1))),
                        var_1659536903925_3503, var_1659536903925_1735, ((Int16(-91) & 127)..=(Int16(61) & 127) : ((-95) |
                            1)))
                }

            case _ => (var_1659536903925_131, 112.0, ((UInt32(138) & 127)..(UInt32(95) & 127) : ((-61) | 1)), ((var_1659536903925_3528 &
                    127)..(var_1659536903925_3490 & 127) : (((-91) | 1))), var_1659536903925_3506, var_1659536903925_333)

            case _: Unit =>
                @echo let var_1659536903925_3541: Array<Option<Bool>> = [((Int64(Int32(-89)), 48, ((UInt16(15) & 127)..=(UInt16(132) &
                        127) : (((-121) | 1))), UInt64(39), [Option<Bool>.None, Option<Bool>.None,
                        Option<Bool>.Some(false), Option<Bool>.None, Option<Bool>.None, Option<Bool>.Some(false),
                        Option<Bool>.Some(true), Option<Bool>.Some(true), Option<Bool>.None, Option<Bool>.Some(false)], (24,
                        (-128.0), ((UInt32(51) & 127)..=(UInt32(2) & 127) : ((82 | 1))), ((UInt64(114) & 127)..(UInt64(115) &
                            127) : (118 | 1)), UInt8(195), ((Int16(-79) & 127)..=(Int16(-83) & 127) : (((-32) | 1)))), ((UInt32(208) &
                        127)..(UInt32(143) & 127) : (34 | 1))) as Bool), ('F' as Bool), (Option<Int64>.None as Bool),
                    Option<Bool>.Some(false), Option<Bool>.Some(true), Option<Bool>.None, Option<Bool>.None,
                    Option<Bool>.None, (Int8(-32) as Bool), Option<Bool>.None];
                if (false) {
                    var_1659536903925_3541
                } else {
                    var_1659536903925_3541
                };
                ();
                var_1659536903925_2662

            case _ =>
                @echo let var_1659536903925_3608: UInt8 = UInt8(UInt8(150));
                @echo let var_1659536903925_3615: Int64 = (-111);
                ((-1), var_1659536903925_1686, ((UInt32(208) & 127)..=(UInt32(83) & 127) : ((-101) | 1)), ((UInt64(41) &
                        127)..=(UInt64(252) & 127) : (7 | 1)), var_1659536903925_3608, ((Int16(31) & 127)..(Int16(89) &
                        127) : ((var_1659536903925_3615 | 1))))
        }, UInt8(if (var_1659536903925_24) { // block id: 3620
            var_1659536903925_606 | Int8(31);
            var_1659536903925_2512 |= var_1659536903925_1428
            UInt8(26) / ((var_1659536903925_1735) | 1)
        } else { // block id: 3630
            UInt8(163) | var_1659536903925_1735
        }), try { // block id: 3635
            ();
            var_1659536903925_449;
            -Int16(-18)
        } finally { // block id: 3640
            Int16(-45) / ((var_1659536903925_1725) | 1)
        }, ((var_1659536903925_162 as Range<UInt8>) ?? match (var_1659536903925_922) {
            case 8 =>
                ();
                var_1659536903925_922 *= var_1659536903925_922
                @echo var var_1659536903925_3657: Range<UInt8> = ((UInt8(123) & 127)..=(UInt8(19) & 127) : (1 | 1));
                var_1659536903925_3657

            case -85 | -126 | -74 =>
                43.0 / Float64((Int32((-43.0))) | 1);
                if (var_1659536903925_3667) {
                    var_1659536903925_3670
                } else {
                    ((UInt8(165) & 127)..(UInt8(177) & 127) : (46 | 1))
                }

            case _ => var_1659536903925_3670
        }), if (match (var_1659536903925_1151) {
            case _ =>
                if (false) {
                    ((117 & 127)..(17 & 127) : ((var_1659536903925_131 | 1)))
                } else {
                    ((var_1659536903925_131 & 127)..=(var_1659536903925_3697 & 127) : ((var_1659536903925_131 | 1)))
                };
                var_1659536903925_3667

            case _ =>
                Option<Option<Bool>>.Some(var_1659536903925_3705);
                Int16(-102) % ((var_1659536903925_1725) | 1);
                true
        }) {
            match (var_1659536903925_2038) {
                case _ =>
                    @echo var var_1659536903925_3729: Interface_1659536903925_66 = Class_1659536903925_59();
                    @echo var var_1659536903925_3745: (Range<UInt8>) -> UInt16 = func_1659536903925_1405;
                    @echo var var_1659536903925_3748: Unit = ();
                    if (var_1659536903925_3719) {
                        [var_1659536903925_3724, Class_1659536903925_59(), var_1659536903925_3724,
                            var_1659536903925_3729, var_1659536903925_3729, var_1659536903925_3724,
                            var_1659536903925_3729, Class_1659536903925_362(), Class_1659536903925_59(),
                            var_1659536903925_3737]
                    } else {
                        [Class_1659536903925_362(namedParam_1659536903925_2455: var_1659536903925_2275,
                            optionalParam_1659536903925_2498: var_1659536903925_3490),
                            Class_1659536903925_59(var_1659536903925_3745,
                            namedParam_1659536903925_1835: var_1659536903925_3748), var_1659536903925_3724,
                            var_1659536903925_3724, Class_1659536903925_59(Option<Int64>.Some(var_1659536903925_140)),
                            Class_1659536903925_59(var_1659536903925_3745, namedParam_1659536903925_1835: ()),
                            Class_1659536903925_59(Option<Int64>.Some(8)), var_1659536903925_3724,
                            Class_1659536903925_59(),
                            Class_1659536903925_59(var_1659536903925_3745, namedParam_1659536903925_1835: ())]
                    };
                    var_1659536903925_2295;
                    Option<Int8>.Some(var_1659536903925_606)
            }
        } else {
            var_1659536903925_1710
        }, (try { // block id: 3776
            Class_1659536903925_362();
            var_1659536903925_3490 &= var_1659536903925_3490
            if (var_1659536903925_3719) {
                var_1659536903925_1710
            } else {
                Option<Int8>.Some(var_1659536903925_606)
            }
        } catch (_) { // block id: 3786
            var_1659536903925_1428 += var_1659536903925_1428
            if (true) {
                Option<Range<UInt64>>.None
            } else {
                Option<Range<UInt64>>.None
            };
            Option<Int8>.Some(Int8(-120))
        } finally { // block id: 3796
            if (false) {
                Option<Range<UInt64>>.None
            } else {
                Option<Range<UInt64>>.None
            };
            if (var_1659536903925_1771) {
                var_1659536903925_2329
            } else {
                Class_1659536903925_59(var_1659536903925_3806, namedParam_1659536903925_1835: ())
            };
            Option<Int8>.Some(Int8(58))
        } ?? match (var_1659536903925_1454) {
            case (caseVar_1659536903925_3815, _, (_, _: UInt16, ((_, _, _, _, _: Interface_1659536903925_64, caseVar_1659536903925_3816: Range<Int64>), caseVar_1659536903925_3817: Option<Interface_1659536903925_63>, _, caseVar_1659536903925_3818, caseVar_1659536903925_3819, _: Option<UInt8>, caseVar_1659536903925_3820: Int16), _: (Range<UInt32>, 
                            Range<UInt32>, Option<Bool>))) =>
                ();
                ();
                Int8(2) + Int8(-87)

            case caseVar_1659536903925_3829: Option<(Bool, UInt16)> =>
                (var_1659536903925_3697, param_1659536903925_1752, ((UInt32(171) & 127)..(var_1659536903925_3837 & 127) : ((108 |
                        1))), ((UInt64(204) & 127)..=(UInt64(238) & 127) : (102 | 1)), UInt8(13), ((Int16(101) & 127)..(Int16(-55) &
                        127) : ((-100) | 1)));
                var_1659536903925_2030;
                Int8(101)

            case _ =>
                var_1659536903925_1710;
                ();
                var_1659536903925_606
        }), (Option<Int16>.None ?? Int16(UInt8(125))))
}

@echo
public func func_1659536903925_1624(param_1659536903925_1625: (Int64) -> Int32, namedParam_1659536903925_1628!: Rune): ((Int64, 
    Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16) { // block id: 1629
    @echo let var_1659536903925_1653: (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>) = ((-8),
        Float64((-73.0)), ((UInt32(234) & 127)..(UInt32(214) & 127) : ((85 | 1))), ((UInt64(109) & 127)..=(UInt64(85) &
            127) : ((-97) | 1)), UInt8(229), ((Int16(-118) & 127)..(Int16(-63) & 127) : (7 | 1)));
    @echo var var_1659536903925_1670: Range<UInt8> = ((UInt8(101) & 127)..=(UInt8(109) & 127) : (86 | 1));
    @echo var var_1659536903925_1695: UInt64 = UInt64(218);
    @echo let var_1659536903925_4087: ((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, 
        Int16, Range<UInt8>, Option<Int8>, Int8, Int16) = ((Int64(Int8(-116)), 83.0, ((UInt32(129) & 127)..=(UInt32(149) &
                127) : ((-84) | 1)), ((UInt64(40) & 127)..(UInt64(108) & 127) : ((-35) | 1)), UInt8(Int8(UInt8(88))), ((Int16(66) &
                127)..=(Int16(16) & 127) : ((-81) | 1))), UInt8(179), Int16(Int16(-110)), ((UInt8(Int8(42)) & 127)..(UInt8(Int8(UInt8(31))) &
            127) : ((Int64(UInt64(189)) | 1))), Option<Int8>.Some(Int8(UInt8(195))), Int8(UInt8(Int8(90))), Int16(UInt16(Int16(101))));
    @echo var var_1659536903925_4127: (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>) = (Int64(UInt64(248)),
        60.0, ((UInt32(14) & 127)..(UInt32(10) & 127) : (28 | 1)), ((UInt64(170) & 127)..=(UInt64(UInt32(25)) & 127) : ((43 |
            1))), UInt8(UInt8(Int8(UInt8(154)))), ((Int16(Int8(Int8(67))) & 127)..=(Int16(70) & 127) : ((21 | 1))));
    if (([var_1659536903925_1151, var_1659536903925_1151, Option<Bool>.Some(var_1659536903925_38),
        var_1659536903925_1151, Option<Bool>.Some(var_1659536903925_24), Option<Bool>.None, var_1659536903925_1151,
        Option<Bool>.Some(false), var_1659536903925_1151, var_1659536903925_1151][7] ?? var_1659536903925_24)) {
        try { // block id: 1650
            @echo let var_1659536903925_1666: UInt8 = UInt8(6);
            @echo let var_1659536903925_1673: ?Int8 = (Class_1659536903925_362() as Int8);
            (var_1659536903925_1653, var_1659536903925_1666, Int16(-15), var_1659536903925_1670, var_1659536903925_1673,
                Int8(35), Int16(-83))
        } finally { // block id: 1678
            var_1659536903925_493;
            @echo var var_1659536903925_1699: Int64 = Int64(Int32(125));
            @echo let var_1659536903925_1741: Int64 = (-44);
            if (var_1659536903925_24) {
                ((35, var_1659536903925_1686, ((UInt32(215) & 127)..=(UInt32(116) & 127) : (39 | 1)), ((var_1659536903925_1695 &
                            127)..(UInt64(105) & 127) : ((var_1659536903925_1699 | 1))), UInt8(33), var_1659536903925_333),
                    UInt8(247), var_1659536903925_1706, ((UInt8(251) & 127)..=(UInt8(105) & 127) : (96 | 1)),
                    var_1659536903925_1710, var_1659536903925_606, var_1659536903925_1725)
            } else {
                (var_1659536903925_1653, UInt8(239), var_1659536903925_1725, ((var_1659536903925_1735 & 127)..(UInt8(28) &
                        127) : ((var_1659536903925_1741 | 1))), Option<Int8>.None, Int8(-64), Int16(-55))
            }
        }
    } else {
        (if ((Option<Bool>.None ?? true)) {
            (var_1659536903925_1686 |> func_1659536903925_1751)
        } else {
            match (var_1659536903925_3864) {
                case caseVar_1659536903925_3952 =>
                    @echo var var_1659536903925_3955: ((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), 
                        UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16) = ((Int64(Int8(-119)), 122.0, ((UInt32(202) &
                                127)..(UInt32(14) & 127) : (((-125) | 1))), ((UInt64(24) & 127)..(UInt64(63) & 127) : ((Int64(UInt8(134)) |
                                1))), UInt8(214), ((Int16(-75) & 127)..=(Int16(78) & 127) : ((-84) | 1))), UInt8(84),
                        Int16(-42), ((UInt8(48) & 127)..=(UInt8(213) & 127) : ((-3) | 1)), Option<Int8>.Some(
                            Int8(UInt8(Int8(-75)))), Int8(Int8(-34)), Int16(4));
                    var_1659536903925_3955

                case caseVar_1659536903925_3984: Option<Float64> =>
                    @echo var var_1659536903925_3989: Array<(Bool, UInt16)> = [(true, UInt16(168)),
                        ((([true, false, false, false, true, false, false, false, true, true], ((UInt16(132) & 127)..(UInt16(90) &
                                127) : (((-3) | 1))), (), (((UInt32(5) & 127)..(UInt32(224) & 127) : (((-23) | 1))), ((UInt32(188) &
                                    127)..(UInt32(248) & 127) : ((-19) | 1)), Option<Bool>.None), UInt32(110)) is (Bool, 
                            UInt16)), UInt16(58)), (true, UInt16(UInt16(Int8(-7)))),
                        ((Class_1659536903925_362() is Interface_1659536903925_365), UInt16(221)),
                        (((Float32(72.0), Int32(14), (((-104), (-86.0), ((UInt32(82) & 127)..=(UInt32(230) & 127) : ((65 |
                                        1))), ((UInt64(120) & 127)..(UInt64(7) & 127) : (((-113) | 1))), UInt8(186), ((Int16(-78) &
                                        127)..=(Int16(-117) & 127) : ((-15) | 1))), UInt8(2), Int16(10), ((UInt8(54) &
                                    127)..=(UInt8(216) & 127) : ((35 | 1))), Option<Int8>.Some(Int8(116)), Int8(-71),
                                Int16(5)), [false, false, false, false, false, true, false, false, true, false]) is (Float64) -> ((Int64, 
                            Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, 
                            Option<Int8>, Int8, Int16)), UInt16(UInt8(UInt8(240)))),
                        ((Option<Interface_1659536903925_63>.Some(Class_1659536903925_362()) is Array<Range<UInt8>>),
                        UInt16(86)), (false, UInt16(Int8(13))), (true, UInt16(UInt8(UInt8(145)))), (false, UInt16(105)),
                        (false, UInt16(UInt8(210)))];
                    if (var_1659536903925_24) {
                        var_1659536903925_3989
                    } else {
                        var_1659536903925_3989
                    };
                    @echo let var_1659536903925_4079: Array<Bool> = [false, true, true, true, false, false, false, false,
                        false, true];
                    if (false) {
                        var_1659536903925_4079
                    } else {
                        var_1659536903925_4079
                    };
                    @echo let var_1659536903925_4084: Bool = true;
                    if (var_1659536903925_4084) {
                        var_1659536903925_4087
                    } else {
                        var_1659536903925_4087
                    }

                case _ =>
                    if (var_1659536903925_24) {
                        var_1659536903925_4087
                    } else {
                        (var_1659536903925_4127, UInt8(200), Int16(-9), ((UInt8(196) & 127)..(var_1659536903925_3506 &
                                127) : ((var_1659536903925_3697 | 1))), Option<Int8>.Some(var_1659536903925_606), Int8(-110),
                            Int16(-74))
                    }
            }
        })
    }
}

@echo
func func_1659536903925_1431(
    param_1659536903925_1432: ((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, 
        Array<Unit>)): UInt16 { // block id: 1433
    Option<UInt16>.None;
    @echo let var_1659536903925_1533: ((Int64) -> Int32) -> Unit = {
        lambdaParameter_1659536903925_1536: (Int64) -> Int32 =>
    };
    @echo var var_1659536903925_1541: (Int64) -> Int32 = {lambdaParameter_1659536903925_1544: Int64 => Int32(-58)};
    try (resource = Class_1659536903925_362()) { // block id: 1436
        [(), (), (), (), (), (), (), (), (), ()][3];
        var_1659536903925_1541 |> var_1659536903925_1533
    } catch (e: Exception) { // block id: 1547
        if (var_1659536903925_24) {
            (((UInt32(70) & 127)..=(UInt32(88) & 127) : ((-89) | 1)), var_1659536903925_333, var_1659536903925_1554)
        } else {
            var_1659536903925_1454
        };
        var_1659536903925_493
    };
    @echo let var_1659536903925_1612: (Int64) -> Int32 = func_1659536903925_926;
    @echo func func_1659536903925_1620(param_1659536903925_1621: Range<Int16>): ((Int64, Float64, Range<UInt32>, Range<UInt64>, 
        UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16) { // block id: 1622
        @echo var var_1659536903925_4160: Rune = '5';
        func_1659536903925_1624(func_1659536903925_926, namedParam_1659536903925_1628: var_1659536903925_4160)
    };

    @echo func func_1659536903925_1598(): ((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, 
        Int16, Range<UInt8>, Option<Int8>, Int8, Int16) { // block id: 1599
        try (resource = Class_1659536903925_362()) { // block id: 1601
            if (var_1659536903925_24) {
                Option<Int64>.Some((-127))
            } else {
                var_1659536903925_162
            };
            @echo var var_1659536903925_1608: Unit = ();
            var_1659536903925_1608;
            func_1659536903925_1441(var_1659536903925_1612)
        } catch (e: Exception) { // block id: 1614
            var_1659536903925_1428 *= UInt16(149)
        } finally { // block id: 1618

        }
        func_1659536903925_1620(
            if (false) {
                try { // block id: 4165
                    var_1659536903925_493;
                    if (var_1659536903925_24) {
                        ((Int16(-59) & 127)..=(Int16(114) & 127) : ((-17) | 1))
                    } else {
                        var_1659536903925_333
                    }
                } catch (_) { // block id: 4171
                    var_1659536903925_4173;
                    var_1659536903925_4173;
                    var_1659536903925_333
                }
            } else {
                try { // block id: 4178
                    var_1659536903925_2512;
                    var_1659536903925_367;
                    if (true) {
                        ((Int16(75) & 127)..(var_1659536903925_1706 & 127) : (((-80) | 1)))
                    } else {
                        var_1659536903925_333
                    }
                } catch (_) { // block id: 4188
                    @echo var var_1659536903925_4191: UInt64 = UInt64(UInt32(UInt16(104)));
                    var_1659536903925_4191 = UInt64(38)
                    ();
                    ((var_1659536903925_1706 & 127)..=(Int16(67) & 127) : ((var_1659536903925_131 | 1)))
                }
            })
    };

    match (func_1659536903925_1598()) {
        case ((caseVar_1659536903925_4203: Int8, caseVar_1659536903925_4204, _, _, caseVar_1659536903925_4205: Option<Int16>, _: Option<Range<UInt8>>), caseVar_1659536903925_4206, caseVar_1659536903925_4207: (Int64, 
                    Range<UInt8>, Range<UInt32>, Array<Int64>), _: Array<Bool>, caseVar_1659536903925_4208, _, caseVar_1659536903925_4209: Option<Float64>) =>
            var_1659536903925_2030;
            var_1659536903925_2512

        case (_: Array<UInt16>, caseVar_1659536903925_4215, _: Option<UInt16>, caseVar_1659536903925_4216: UInt64, caseVar_1659536903925_4217, caseVar_1659536903925_4218, caseVar_1659536903925_4219) =>
            var_1659536903925_4223--;
            -var_1659536903925_2512

        case (_, _, caseVar_1659536903925_4229: Interface_1659536903925_65, caseVar_1659536903925_4230: (Range<Int16>, 
                    Bool, (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt64, 
                    Class_1659536903925_362, String, Int16, UInt32, Array<Int64>), _, _: Option<Int64>, _) =>
            var_1659536903925_3261;
            UInt16(205)

        case _ =>
            if (var_1659536903925_38) {
                Option<Option<Range<UInt64>>>.None
            } else {
                var_1659536903925_2628
            };
            var_1659536903925_2512 * UInt16(107)
    }
}

@echo
func func_1659536903925_4246(param_1659536903925_4247: Range<UInt8>): ((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), 
    Unit, Range<Int16>, Unit, String, Array<Unit>) { // block id: 4248
    Int16(35);
    @echo var loopTimeVar_1659536903925_4295: Int64 = 0;
    while ((match (match (Int32(95)) {
            case _ =>
                if (var_1659536903925_24) {
                    Option<Range<UInt8>>.None
                } else {
                    Option<Range<UInt8>>.None
                }
        }) {
            case caseVar_1659536903925_4262 => var_1659536903925_1706 > var_1659536903925_1725

            case caseVar_1659536903925_4269 =>
                ();
                false

            case _ =>
                @echo let var_1659536903925_4276: Rune = 'L';
                var_1659536903925_4276;
                var_1659536903925_3697 != 70
        }) && loopTimeVar_1659536903925_4295 < 100) {
        loopTimeVar_1659536903925_4295++;
        var_1659536903925_3697 &= 52
        @echo var var_1659536903925_4290: Option<Array<Int64>> = Option<Array<Int64>>.None;
        @echo var loopTimeVar_1659536903925_4293: Int64 = 0;
        do {
            loopTimeVar_1659536903925_4293++;
            var_1659536903925_493;
            var_1659536903925_4290
        } while ((var_1659536903925_38) && loopTimeVar_1659536903925_4293 < 100)
    };
    @echo var var_1659536903925_4360: Float32 = Float32(-97.0);
    @echo var var_1659536903925_4372: UInt32 = UInt32(65);
    try { // block id: 4297
        @echo var var_1659536903925_4305: UInt8 = UInt8(Int8(Int8(UInt8(242))));
        try { // block id: 4299
            ((9, ((var_1659536903925_4305 & 127)..(UInt8(119) & 127) : (((-108) | 1))), var_1659536903925_955, [(-71),
                        66, (-43), (-53), var_1659536903925_140, var_1659536903925_131, var_1659536903925_131,
                        var_1659536903925_140, var_1659536903925_3697, var_1659536903925_1068]), var_1659536903925_2840,
                ((Int16(9) & 127)..(var_1659536903925_1725 & 127) : (((-11) | 1))), var_1659536903925_4173,
                var_1659536903925_692, [(), (), (), (), (), (), (), (), (), ()])
        } finally { // block id: 4332
            var_1659536903925_3158
        }
    } finally { // block id: 4334
        @echo var var_1659536903925_4337: Option<Float64> = Option<Float64>.None;
        match (var_1659536903925_4337) {
            case caseVar_1659536903925_4341: Bool => Int16(30) & Int16(-58)

            case caseVar_1659536903925_4348 =>
                var_1659536903925_4173;
                Int16(-14)

            case _ =>
                if (false) {
                    var_1659536903925_2934
                } else {
                    var_1659536903925_2934
                };
                var_1659536903925_4360 = var_1659536903925_167
                Int16(-42) >> ((Int16(-100)) & 7)
        };
        @echo var var_1659536903925_4375: UInt32 = UInt32(37);
        @echo var var_1659536903925_4379: Array<Int64> = [44, (-125), (-80), 93, 10, 42, (-1), 56, (-78), 34];
        (((-105), param_1659536903925_4247, ((var_1659536903925_4372 & 127)..=(var_1659536903925_4375 & 127) : ((var_1659536903925_1068 |
                    1))), var_1659536903925_4379), var_1659536903925_4173, var_1659536903925_333, (),
            var_1659536903925_692, [(), (), (), (), (), (), (), (), (), ()])
    }
}

@echo
func func_1659536903925_1401(param_1659536903925_1402: Range<UInt8>): UInt16 { // block id: 1403
    @echo let var_1659536903925_4244: (((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, 
            String, Array<Unit>)) -> UInt16 = func_1659536903925_1431;
    @echo var var_1659536903925_4387: (Range<UInt8>) -> ((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, 
        Unit, String, Array<Unit>) = func_1659536903925_4246;
    ((UInt8(135) & 127)..(UInt8(191) & 127) : ((-102) | 1)) |> (var_1659536903925_4387 ~> var_1659536903925_4244)
}

@echo
func func_1659536903925_1305(): Bool { // block id: 1306
    @echo var var_1659536903925_1309: UInt16 = UInt16(Int16(UInt16(Int16(-7))));
    @echo let var_1659536903925_1324: UInt16 = UInt16(139);
    @echo func func_1659536903925_1315(): UInt16 { // block id: 1316
        try { // block id: 1318
            if (true) {
                ((UInt16(160) & 127)..(var_1659536903925_1324 & 127) : ((47 | 1)))
            } else {
                ((var_1659536903925_1324 & 127)..(UInt16(235) & 127) : ((89 | 1)))
            };
            @echo let var_1659536903925_1334: Array<Interface_1659536903925_66> = [Class_1659536903925_59(),
                Class_1659536903925_59(), Class_1659536903925_59(), Class_1659536903925_362(), Class_1659536903925_362(),
                Class_1659536903925_59(), Class_1659536903925_59(), Class_1659536903925_362(), Class_1659536903925_362(),
                Class_1659536903925_362()];
            var_1659536903925_1334[7];
            var_1659536903925_1350[3]
        } finally { // block id: 1371
            try { // block id: 1373
                var_1659536903925_922 += var_1659536903925_922
                var_1659536903925_1378
            } finally { // block id: 1394
                ();
                var_1659536903925_51 &= var_1659536903925_51
                var_1659536903925_449
            }
        };
        @echo let var_1659536903925_4391: (Range<UInt8>) -> UInt16 = func_1659536903925_1401;
        try { // block id: 4394
            var_1659536903925_2840;
            ((UInt8(249) & 127)..(UInt8(48) & 127) : (74 | 1))
        } catch (_) { // block id: 4397
            ();
            ();
            ((UInt8(31) & 127)..=(UInt8(184) & 127) : ((-56) | 1))
        } |> var_1659536903925_4391
    };

    var_1659536903925_1309 ^= func_1659536903925_1315()
    @echo let var_1659536903925_4417: Option<Array<Int64>> = Option<Array<Int64>>.None;
    ((if (try { // block id: 4404
        var_1659536903925_493;
        var_1659536903925_24
    } catch (_) { // block id: 4407
        var_1659536903925_4223 += UInt64(181)
        !false
    }) {
        try { // block id: 4414
            ();
            var_1659536903925_4417
        } finally { // block id: 4419
            var_1659536903925_493;
            (var_1659536903925_140, 68.0, var_1659536903925_4425, ((UInt64(227) & 127)..(UInt64(184) & 127) : ((-80) | 1)),
                var_1659536903925_1735, var_1659536903925_333);
            var_1659536903925_4417
        }
    } else {
        match (var_1659536903925_4417) {
            case _ =>
                var_1659536903925_4223 -= UInt64(18)
                if (true) {
                    Option<Array<Int64>>.Some([(-44), 26, (-114), (-42), 105, 67, 118, (-13), (-32), (-109)])
                } else {
                    var_1659536903925_4417
                }
        }
    }) is (Array<Unit>) -> Int32)
}

@echo
func func_1659536903925_1296(param_1659536903925_1297: Int8): Bool { // block id: 1298
    @echo var loopTimeVar_1659536903925_4445: Int64 = 0;
    do {
        loopTimeVar_1659536903925_4445++;
    } while (((var_1659536903925_449[2] ?? func_1659536903925_1305())) && loopTimeVar_1659536903925_4445 < 100);
    false
}

@echo
public func func_1659536903925_1286(param_1659536903925_1287: Range<Int64>): Option<((Int64, Range<UInt8>, Range<UInt32>, 
    Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>)> { // block id: 1288
    @echo let var_1659536903925_4507: ((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, 
        Int16, Range<UInt8>, Option<Int8>, Int8, Int16) = (((-24), 103.0, ((UInt32(Int16(-114)) & 127)..(UInt32(Int32(-25)) &
                127) : ((0 | 1))), ((UInt64(83) & 127)..=(UInt64(74) & 127) : ((-102) | 1)), UInt8(232), ((Int16(Int8(33)) &
                127)..=(Int16(48) & 127) : (((-106) | 1)))), UInt8(Int8(97)), Int16(13), ((UInt8(Int8(94)) & 127)..=(UInt8(14) &
            127) : ((Int64(UInt16(Int16(46))) | 1))), Option<Int8>.Some(Int8(Int8(Int8(56)))), Int8(3), Int16(-95));
    @echo func func_1659536903925_1292(): (Int64, Int64, Range<UInt16>, UInt64, Array<Option<Bool>>, (Int64, Float64, 
        Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), Range<UInt32>) { // block id: 1293
        @echo var loopTimeVar_1659536903925_4453: Int64 = 0;
        do {
            loopTimeVar_1659536903925_4453++;
        } while (((Int8(-24) - Int8(-53) |> func_1659536903925_1296)) && loopTimeVar_1659536903925_4453 < 100);
        @echo var var_1659536903925_4470: Bool = true;
        ((Int16(Int16(-111)) + Int16(var_1659536903925_606) & 127)..(try { // block id):( 4461
            UInt32(165);
            var_1659536903925_1706
        } catch (e: Exception) { // block id: 4464
            ();
            Int16(-25)
        } & 127) : (match (if (var_1659536903925_4470) {
            Option<Option<Range<UInt64>>>.Some(Option<Range<UInt64>>.None)
        } else {
            var_1659536903925_385
        }) {
            case _ => -(-113)

            case _: Float64 => var_1659536903925_131

            case caseVar_1659536903925_4486: (Int64, Int64, Range<UInt16>, UInt64, Array<Option<Bool>>, (Int64, Float64, 
                    Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), Range<UInt32>) =>
                var_1659536903925_4490 = var_1659536903925_4490
                var_1659536903925_1068;
                var_1659536903925_131 % ((var_1659536903925_131) | 1)

            case _ => var_1659536903925_1068
        } | 1));
        @echo let var_1659536903925_4542: Array<Bool> = [true, true, false, false, false, true, true, true, true, false];
        @echo var var_1659536903925_4575: UInt8 = UInt8(140);
        @echo let var_1659536903925_4677: (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>) = (Int64(Int8(Int8(-73))),
            Float64(Float64((-53.0))), ((UInt32(245) & 127)..(UInt32(138) & 127) : ((-42) | 1)), ((UInt64(UInt32(181)) &
                127)..(UInt64(251) & 127) : ((Int64(UInt8(UInt8(63))) | 1))), UInt8(239), ((Int16(-68) & 127)..=(Int16(-55) &
                127) : (45 | 1)));
        @echo let var_1659536903925_4722: Float64 = 108.0;
        if ((match ((Float32(111.0), var_1659536903925_922, var_1659536903925_4507, var_1659536903925_4542)) {
            case _: Option<(Bool, UInt16)> => var_1659536903925_1686

            case caseVar_1659536903925_4550: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) =>
                Option<Bool>.None;
                Int16(-21);
                (-115.0)

            case _ =>
                var_1659536903925_1554;
                var_1659536903925_1686 - var_1659536903925_1686
        } is Interface_1659536903925_63)) { // block id: 4561
            var_1659536903925_606 ^= Int8(12)
            var_1659536903925_3864
        } else if (var_1659536903925_4470) { // block id: 4567
            var_1659536903925_2662;
            try (resource = Class_1659536903925_362()) { // block id: 4570
                var_1659536903925_2512;
                ();
                var_1659536903925_4575 %= ((var_1659536903925_3506) | 1)
            } catch (e: Exception) { // block id: 4578

            }
            @echo let var_1659536903925_4717: Bool = false;
            try { // block id: 4580
                (var_1659536903925_1068, ((UInt8(152) & 127)..=(UInt8(212) & 127) : ((-58) | 1)), var_1659536903925_4425,
                    [14, 103, (-13), 32, (-13), (-99), 105, 56, (-108), (-109)]);
                if (var_1659536903925_4588) {
                    (var_1659536903925_140, var_1659536903925_3697, ((UInt16(46) & 127)..(UInt16(69) & 127) : ((-80) | 1)),
                        UInt64(170), [Option<Bool>.Some(var_1659536903925_38), var_1659536903925_1151,
                            var_1659536903925_1151, var_1659536903925_1151, Option<Bool>.Some(false),
                            Option<Bool>.Some(true), var_1659536903925_1151, var_1659536903925_1151,
                            var_1659536903925_1151, var_1659536903925_1151], var_1659536903925_2662, ((var_1659536903925_3837 &
                            127)..(UInt32(185) & 127) : ((var_1659536903925_3697 | 1))))
                } else {
                    (var_1659536903925_140, var_1659536903925_140, ((UInt16(1) & 127)..=(UInt16(47) & 127) : ((var_1659536903925_3697 |
                            1))), var_1659536903925_4223, [Option<Bool>.Some(false), Option<Bool>.Some(false),
                            Option<Bool>.None, Option<Bool>.None, Option<Bool>.None, Option<Bool>.Some(false),
                            var_1659536903925_4634, Option<Bool>.Some(true), Option<Bool>.None, var_1659536903925_1151],
                        ((-124), (-72.0), ((UInt32(137) & 127)..(UInt32(173) & 127) : ((-41) | 1)), ((UInt64(96) & 127)..(UInt64(69) &
                                127) : ((-93) | 1)), var_1659536903925_1735, var_1659536903925_333), ((UInt32(91) & 127)..=(UInt32(151) &
                            127) : ((-85) | 1)))
                }
            } finally { // block id: 4650
                [false, true, false, false, true, false, false, false, true, false];
                if (false) {
                    Option<UInt16>.None
                } else {
                    Option<UInt16>.None
                };
                if (var_1659536903925_4588) {
                    (var_1659536903925_1068, var_1659536903925_3697, ((UInt16(141) & 127)..(UInt16(147) & 127) : (15 | 1)),
                        UInt64(150), [Option<Bool>.None, var_1659536903925_1151, Option<Bool>.None,
                            Option<Bool>.Some(var_1659536903925_24), Option<Bool>.Some(var_1659536903925_4470),
                            var_1659536903925_4634, Option<Bool>.None, var_1659536903925_4634, var_1659536903925_4634,
                            Option<Bool>.None], var_1659536903925_4677, ((UInt32(160) & 127)..=(var_1659536903925_3837 &
                            127) : ((var_1659536903925_3697 | 1))))
                } else {
                    (var_1659536903925_3697, 31, ((UInt16(253) & 127)..(UInt16(173) & 127) : ((-122) | 1)), UInt64(134),
                        [var_1659536903925_4634, Option<Bool>.None, Option<Bool>.None, Option<Bool>.None,
                            Option<Bool>.Some(var_1659536903925_1771), var_1659536903925_4634, var_1659536903925_1151,
                            Option<Bool>.None, var_1659536903925_4634, Option<Bool>.Some(var_1659536903925_4717)], (32,
                            var_1659536903925_4722, ((UInt32(102) & 127)..(UInt32(162) & 127) : (63 | 1)),
                            var_1659536903925_2744, UInt8(248), ((Int16(102) & 127)..=(Int16(-85) & 127) : ((-80) | 1))),
                        ((UInt32(54) & 127)..=(UInt32(64) & 127) : ((var_1659536903925_1068 | 1))))
                }
            }
        } else { // block id: 4732
            Option<Array<Int64>>.None;
            @echo let var_1659536903925_4767: Range<UInt8> = ((UInt8(3) & 127)..(UInt8(28) & 127) : ((43 | 1)));
            match ([78, (-58), 59, (-119), 117, (-7), 50, (-48), (-64), (-92)]) {
                case _ => (var_1659536903925_955, ((Int16(-52) & 127)..(var_1659536903925_1706 & 127) : ((var_1659536903925_1068 |
                        1))), (var_1659536903925_167, var_1659536903925_922, ((126, var_1659536903925_4722, ((var_1659536903925_3837 &
                                    127)..=(UInt32(154) & 127) : ((95 | 1))), ((var_1659536903925_4223 & 127)..=(var_1659536903925_4223 &
                                    127) : (((-39) | 1))), UInt8(163), ((Int16(125) & 127)..=(Int16(-49) & 127) : ((23 |
                                    1)))), UInt8(103), var_1659536903925_1725, var_1659536903925_4767,
                            Option<Int8>.Some(var_1659536903925_606), Int8(-30), var_1659536903925_1725), [true, true,
                            false, true, false, true, false, true, true, true]))
            };
            var_1659536903925_3864
        }
    };

    func_1659536903925_1292()[4];
    @echo var var_1659536903925_4861: ?((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, 
        String, Array<Unit>) = ((((UInt32(112) & 127)..=(UInt32(251) & 127) : (120 | 1)), ((UInt32(UInt16(85)) & 127)..(UInt32(Int8(-95)) &
            127) : ((Int64(UInt16(78)) | 1))), Option<Bool>.None) as ((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), 
        Unit, Range<Int16>, Unit, String, Array<Unit>));
    if (if (var_1659536903925_3837 >= var_1659536903925_3837) { // block id: 4784
        var_1659536903925_4173;
        false
    } else if (var_1659536903925_24) { // block id: 4788
        var_1659536903925_24
    } else { // block id: 4790
        UInt64(204);
        var_1659536903925_2840;
        false
    }) {
        try { // block id: 4795
            @echo let var_1659536903925_4797: ?((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, 
                Unit, String, Array<Unit>) = ((Option<Option<Range<UInt64>>>.Some(Option<Range<UInt64>>.None) as Interface_1659536903925_63) as ((Int64, 
                Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>));
            var_1659536903925_4797
        } catch (_) { // block id: 4802
            @echo let var_1659536903925_4804: ?((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, 
                Unit, String, Array<Unit>) = Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, 
                    Unit, String, Array<Unit>)>.Some(
                ((26, ((UInt8(168) & 127)..=(UInt8(20) & 127) : ((-100) | 1)), ((UInt32(109) & 127)..=(UInt32(188) & 127) : ((121 |
                            1))), [100, (-25), (-77), 92, 17, 95, 107, 47, 17, 47]), (), ((Int16(UInt16(232)) & 127)..=(Int16(4) &
                        127) : (((-62) | 1))), (), "Y?(7ON9_c7", [(), (), (), (), (), (), (), (), (), ()]));
            var_1659536903925_4804
        }
    } else {
        (try { // block id: 4840
            var_1659536903925_4843 = var_1659536903925_51
            Option<Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>)>>
                .Some(
                    Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>)>
                        .None)
        } finally { // block id: 4848
            Option<Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>)>>
                .None
        } ?? match (Class_1659536903925_362()) {
            case _ =>
                if (var_1659536903925_24) {
                    var_1659536903925_4857
                } else {
                    var_1659536903925_4861
                }
        })
    }
}

@echo
public func func_1659536903925_1277(param_1659536903925_1278: Interface_1659536903925_64): ((Int64, Range<UInt8>, Range<UInt32>, 
    Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>) { // block id: 1279
    @echo var var_1659536903925_4882: Range<UInt8> = ((UInt8(Int8(42)) & 127)..(UInt8(226) & 127) : ((Int64(UInt16(Int16(Int8(-77)))) |
        1)));
    @echo var var_1659536903925_5048: String = ".H\\+LNp=yV";
    ((((79 & 127)..(50 & 127) : ((-19) | 1)) |> func_1659536903925_1286) ?? (if (false) { // block id: 4878
            (var_1659536903925_140, var_1659536903925_4882, ((UInt32(212) & 127)..=(UInt32(42) & 127) : ((var_1659536903925_3697 |
                    1))), [var_1659536903925_3697, var_1659536903925_131, 10, var_1659536903925_3697,
                    var_1659536903925_140, (-120), var_1659536903925_131, var_1659536903925_140, 36, (-73)])
        } else { // block id: 4906
            var_1659536903925_606 *= Int8(33)
            @echo let var_1659536903925_4914: Option<Option<Interface_1659536903925_63>> = Option<Option<Interface_1659536903925_63>>
                .Some(
                    ([((UInt8(158) & 127)..=(UInt8(115) & 127) : ((-75) | 1)),
                        ((UInt8(146) & 127)..=(UInt8(25) & 127) : ((-58) | 1)),
                        ((UInt8(250) & 127)..(UInt8(150) & 127) : ((-113) | 1)),
                        ((UInt8(191) & 127)..(UInt8(240) & 127) : ((-53) | 1)),
                        ((UInt8(108) & 127)..=(UInt8(26) & 127) : ((-72) | 1)),
                        ((UInt8(232) & 127)..=(UInt8(99) & 127) : (53 | 1)),
                        ((UInt8(183) & 127)..=(UInt8(107) & 127) : ((72 | 1))),
                        ((UInt8(27) & 127)..(UInt8(15) & 127) : ((-16) | 1)),
                        ((UInt8(3) & 127)..(UInt8(222) & 127) : (((-98) | 1))),
                        ((UInt8(8) & 127)..(UInt8(19) & 127) : (22 | 1))] as Interface_1659536903925_63));
            if (var_1659536903925_38) {
                Option<Option<Interface_1659536903925_63>>.None
            } else {
                var_1659536903925_4914
            };
            if (var_1659536903925_38) {
                var_1659536903925_2275
            } else {
                var_1659536903925_2275
            }
        }, var_1659536903925_2030, ((var_1659536903925_1725 & 127)..=(Int16(87) & 127) : ((var_1659536903925_4943 | 1))),
        try (resource = Class_1659536903925_362()) { // block id: 4947

        } catch (_) { // block id: 4948
            var_1659536903925_902;
            var_1659536903925_2840
        } finally { // block id: 4951
            ()
        }, match (var_1659536903925_4955) {
            case caseVar_1659536903925_4999 =>
                ();
                ();
                @echo let var_1659536903925_5004: String = "bQ1W3mb)U ";
                var_1659536903925_5004

            case caseVar_1659536903925_5008 =>
                (var_1659536903925_2662, var_1659536903925_3506, var_1659536903925_1706, var_1659536903925_4882,
                    Option<Int8>.Some(var_1659536903925_606), Int8(-114), Int16(-78));
                ();
                var_1659536903925_692

            case (caseVar_1659536903925_5023, caseVar_1659536903925_5024, (caseVar_1659536903925_5025, _: Array<Interface_1659536903925_66>, caseVar_1659536903925_5026, caseVar_1659536903925_5027: (Int64, 
                            Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), caseVar_1659536903925_5028: UInt8, _), caseVar_1659536903925_5029: Option<Option<((Int64, 
                        Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>)>>, caseVar_1659536903925_5030: Option<Int8>, caseVar_1659536903925_5031: UInt8, _: (Range<UInt32>, 
                        Range<UInt32>, Option<Bool>), caseVar_1659536903925_5032: Array<Interface_1659536903925_66>, _) =>
                ((-29), ((UInt8(114) & 127)..(UInt8(164) & 127) : (((-68) | 1))), ((UInt32(187) & 127)..(UInt32(45) & 127) : (93 |
                        1)), [(-114), 71, 20, 9, (-61), (-108), 111, (-112), (-48), 8]);
                """
?.)6m
iIx&:
"""

            case _ =>
                if (var_1659536903925_1771) {
                    var_1659536903925_5048
                } else {
                    var_1659536903925_5048
                }
        }, [var_1659536903925_4173, (), (), (), var_1659536903925_2030, (), (), var_1659536903925_493, (), ()]))
}

@echo
func func_1659536903925_1132(param_1659536903925_1133: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>)): ((Int64, 
    Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>) { // block id: 1134
    @echo var var_1659536903925_1137: UInt8 = UInt8(99);
    var_1659536903925_1137 -= UInt8(33)
    @echo var var_1659536903925_1167: UInt16 = UInt16(UInt8(213));
    @echo let var_1659536903925_1181: Interface_1659536903925_365 = Class_1659536903925_362();
    @echo let var_1659536903925_1196: Array<Int64> = [(-35), Int64(UInt64(164)), 25, (-74), Int64(UInt32(77)),
        Int64(UInt32(Int8(-13))), (-127), (-73), (-42), Int64(5)];
    match (try { // block id: 1142
        var_1659536903925_51 *= var_1659536903925_51
        if (true) {
            Option<Bool>.Some(var_1659536903925_24)
        } else {
            var_1659536903925_1151
        }
    } catch (_) { // block id: 1154
        var_1659536903925_783;
        if (false) {
            Option<Bool>.Some(var_1659536903925_38)
        } else {
            var_1659536903925_1151
        }
    }) {
        case caseVar_1659536903925_1163 => var_1659536903925_1167 = UInt16(240)

        case _ => var_1659536903925_1137++

        case caseVar_1659536903925_1178: Interface_1659536903925_63 =>
            var_1659536903925_1181;
            var_1659536903925_167;
            @echo var var_1659536903925_1186: Float32 = Float32(-36.0);
            var_1659536903925_1186 /= Float32((Int32(var_1659536903925_1186)) | 1)

        case _ =>
            var_1659536903925_493;
            if (var_1659536903925_24) {
                Option<Array<Int64>>.Some(var_1659536903925_1196)
            } else {
                Option<Array<Int64>>.Some([(-19), (-122), 73, 59, (-11), 75, (-32), 54, (-60), 36])
            };
            ()
    };
    @echo let var_1659536903925_5126: Int64 = 68;
    @echo var var_1659536903925_5137: Unit = ();
    if (if ((Option<Bool>.Some(var_1659536903925_38) ?? false)) { // block id: 1222
        [var_1659536903925_1068, (-55), var_1659536903925_1068, var_1659536903925_131, var_1659536903925_131,
            var_1659536903925_1068, (-69), (-27), var_1659536903925_131, var_1659536903925_1068];
        true && var_1659536903925_24
    } else if (var_1659536903925_24) { // block id: 1238
        @echo var var_1659536903925_1241: Float64 = Float64(8.0);
        var_1659536903925_1241 %= Float64((Int32((-51.0))) | 1)
        var_1659536903925_606 /= ((Int8(6)) | 1)
        @echo var var_1659536903925_1249: Bool = true;
        var_1659536903925_1249
    } else { // block id: 1251
        var_1659536903925_51--;
        ((-101), ((UInt8(124) & 127)..=(UInt8(60) & 127) : ((-34) | 1)), var_1659536903925_955, [var_1659536903925_1068,
                (-24), 123, 116, (-89), (-115), var_1659536903925_140, var_1659536903925_131, var_1659536903925_1068,
                var_1659536903925_140]);
        var_1659536903925_24
    }) { // block id: 1270
        @echo var loopTimeVar_1659536903925_1275: Int64 = 0;
        do {
            loopTimeVar_1659536903925_1275++;
        } while ((var_1659536903925_38) && loopTimeVar_1659536903925_1275 < 100);
        Class_1659536903925_362() |> func_1659536903925_1277
    } else if (try { // block id: 5065
        var_1659536903925_493;
        UInt64(215) != UInt64(251)
    } catch (e: Exception) { // block id: 5070
        true
    } finally { // block id: 5072
        var_1659536903925_1181;
        true
    }) { // block id: 5075
        @echo var loopTimeVar_1659536903925_5082: Int64 = 0;
        do {
            loopTimeVar_1659536903925_5082++;
            var_1659536903925_2840;
            var_1659536903925_1137
        } while ((false) && loopTimeVar_1659536903925_5082 < 100);
        @echo var loopTimeVar_1659536903925_5088: Int64 = 0;
        while ((var_1659536903925_24) && loopTimeVar_1659536903925_5088 < 100) {
            loopTimeVar_1659536903925_5088++;
            Option<((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>)>
                .None
        };
        var_1659536903925_3158
    } else { // block id: 5090
        ([false, var_1659536903925_38, true, var_1659536903925_1771, false, var_1659536903925_1771, false, false, false,
            true] as Option<Option<Range<UInt64>>>);
        ();
        ((94, ((var_1659536903925_3506 & 127)..=(var_1659536903925_3506 & 127) : ((var_1659536903925_3697 | 1))), ((UInt32(152) &
                    127)..(var_1659536903925_4843 & 127) : ((var_1659536903925_5115 | 1))), [50, (-34),
                    var_1659536903925_1068, var_1659536903925_5126, var_1659536903925_5126, var_1659536903925_140,
                    (-125), (-113), 25, var_1659536903925_1068]), (), ((Int16(-76) & 127)..=(Int16(116) & 127) : (57 | 1)),
            var_1659536903925_5137, var_1659536903925_692, [(), (), (), (), (), (), (), (), (), ()])
    }
}

@echo
func func_1659536903925_1086(param_1659536903925_1087: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>)): (Range<Int16>, 
    Bool, (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt64, Class_1659536903925_362, String, 
    Int16, UInt32, Array<Int64>) { // block id: 1088
    if ([var_1659536903925_24, var_1659536903925_38, true, true, var_1659536903925_24, false, false,
        var_1659536903925_24, var_1659536903925_38, true][3]) { // block id: 1104
        UInt64(166)
    } else { // block id: 1106
        @echo let var_1659536903925_1109: UInt64 = UInt64(UInt16(UInt8(Int8(Int8(-11)))));
        var_1659536903925_1109 ^ var_1659536903925_1109
    };
    @echo let var_1659536903925_5146: Option<Range<UInt8>> = Option<Range<UInt8>>.None;
    @echo let var_1659536903925_5386: Int64 = Int64((-35));
    @echo let var_1659536903925_5492: ((Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt8, 
        Int16, Range<UInt8>, Option<Int8>, Int8, Int16) = ((Int64((-82)), 62.0, ((UInt32(UInt16(233)) & 127)..(UInt32(UInt8(104)) &
                127) : ((Int64(UInt64(10)) | 1))), ((UInt64(176) & 127)..=(UInt64(6) & 127) : ((65 | 1))), UInt8(UInt8(226)),
            ((Int16(UInt8(50)) & 127)..(Int16(46) & 127) : ((30 | 1)))), UInt8(UInt8(Int8(9))), Int16(UInt16(UInt8(145))),
        ((UInt8(46) & 127)..=(UInt8(19) & 127) : ((Int64(UInt64(142)) | 1))), (() as Int8), Int8(UInt8(UInt8(UInt8(235)))),
        Int16(122));
    @echo func func_1659536903925_1117(optionalParam_1659536903925_1118!: Int8 = Int8(UInt8(134)),
        optionalParam_1659536903925_1121!: UInt64 = UInt64(UInt16(Int8(34))),
        optionalParam_1659536903925_1125!: Range<Int32> = ((Int32(125) & 127)..=(Int32(11) & 127) : (119 | 1))): (Range<Int16>, 
        Bool, (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt64, Class_1659536903925_362, 
        String, Int16, UInt32, Array<Int64>) { // block id: 1127
        ();
        @echo var var_1659536903925_5142: ((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>)) -> ((Int64, Range<UInt8>, 
            Range<UInt32>, Array<Int64>), Unit, Range<Int16>, Unit, String, Array<Unit>) = func_1659536903925_1132;
        @echo var var_1659536903925_5285: Range<UInt8> = ((UInt8(242) & 127)..(UInt8(251) & 127) : (111 | 1));
        (match (var_1659536903925_5146) {
            case _: Interface_1659536903925_66 =>
                var_1659536903925_4843 += var_1659536903925_4843
                @echo var var_1659536903925_5155: Array<(Bool, UInt16)> = [(true, UInt16(1)),
                    (('m' is Option<Option<Interface_1659536903925_63>>), UInt16(228)),
                    ((((UInt8(147) & 127)..=(UInt8(69) & 127) : (126 | 1)) is Option<Bool>), UInt16(165)),
                    (true, UInt16(29)), (true, UInt16(102)), (false, UInt16(102)), (true, UInt16(UInt16(5))),
                    ((UInt64(188) is Array<Unit>), UInt16(230)), (false, UInt16(Int16(63))),
                    ((Class_1659536903925_59() is (Range<Int16>) -> ((Int64, Float64, Range<UInt32>, Range<UInt64>, 
                        UInt8, Range<Int16>), UInt8, Int16, Range<UInt8>, Option<Int8>, Int8, Int16)), UInt16(UInt8(Int8(2))))];
                var_1659536903925_5155;
                if (var_1659536903925_4588) {
                    param_1659536903925_1087
                } else {
                    ((-24), ((UInt8(222) & 127)..(UInt8(158) & 127) : (((-71) | 1))), ((UInt32(14) & 127)..=(UInt32(1) &
                            127) : ((-44) | 1)), [(-72), 78, 20, (-17), 86, 14, 53, 57, (-67), 25])
                }

            case caseVar_1659536903925_5208 =>
                var_1659536903925_2840;
                @echo let var_1659536903925_5249: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) = ((-99), ((UInt8(11) &
                        127)..=(UInt8(81) & 127) : (42 | 1)), ((UInt32(31) & 127)..=(UInt32(46) & 127) : ((-111) | 1)), [Int64(UInt64(151)),
                        Int64(UInt32(Int16(-51))), (-8), (-55), Int64(Int64(Int32(65))), (-77), Int64(UInt8(18)),
                        Int64(Int64(UInt32(101))), 103, Int64(Int8(83))]);
                if (var_1659536903925_5213) {
                    var_1659536903925_2275
                } else {
                    var_1659536903925_5249
                }

            case caseVar_1659536903925_5276 =>
                UInt64(154);
                if (false) {
                    var_1659536903925_2275
                } else {
                    (85, var_1659536903925_5285, ((UInt32(236) & 127)..=(var_1659536903925_4843 & 127) : (((-29) | 1))),
                        [var_1659536903925_1068, var_1659536903925_131, var_1659536903925_131, 36,
                            var_1659536903925_3697, 106, (-81), var_1659536903925_4943, 5, var_1659536903925_4943])
                }

            case caseVar_1659536903925_5304 => (var_1659536903925_1068, ((UInt8(200) & 127)..=(UInt8(176) & 127) : ((-74) |
                    1)), var_1659536903925_4425, var_1659536903925_5311)

            case _ =>
                [61, (-9), (-95), 17, (-92), (-7), (-35), 109, (-45), (-112)];
                (104, var_1659536903925_5285, var_1659536903925_4425, var_1659536903925_5311)
        } |> var_1659536903925_5142)[3];
        @echo let var_1659536903925_5332: Bool = true;
        @echo let var_1659536903925_5354: UInt8 = UInt8(94);
        (try { // block id: 5328
            ();
            if (var_1659536903925_5332) {
                Option<(Range<Int16>, Bool, (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt64, 
                        Class_1659536903925_362, String, Int16, UInt32, Array<Int64>)>.Some(var_1659536903925_4955)
            } else {
                Option<(Range<Int16>, Bool, (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt64, 
                        Class_1659536903925_362, String, Int16, UInt32, Array<Int64>)>.Some(var_1659536903925_4955)
            }
        } finally { // block id: 5338
            var_1659536903925_2662;
            if (var_1659536903925_5332) {
                [var_1659536903925_5285, ((var_1659536903925_3506 & 127)..(var_1659536903925_3506 & 127) : (((-36) | 1))),
                    ((UInt8(142) & 127)..=(UInt8(155) & 127) : ((-126) | 1)),
                    ((UInt8(89) & 127)..=(UInt8(173) & 127) : ((-53) | 1)), var_1659536903925_5285,
                    ((UInt8(129) & 127)..(var_1659536903925_5354 & 127) : (((-79) | 1))),
                    ((UInt8(24) & 127)..=(UInt8(134) & 127) : (95 | 1)),
                    ((UInt8(84) & 127)..=(UInt8(76) & 127) : ((-55) | 1)),
                    ((UInt8(116) & 127)..=(UInt8(46) & 127) : (126 | 1)),
                    ((UInt8(179) & 127)..=(UInt8(119) & 127) : ((-26) | 1))]
            } else {
                var_1659536903925_5362
            };
            if (true) {
                Option<(Range<Int16>, Bool, (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt64, 
                        Class_1659536903925_362, String, Int16, UInt32, Array<Int64>)>.Some(
                    (((Int16(-121) & 127)..(var_1659536903925_1725 & 127) : ((var_1659536903925_3697 | 1))),
                        var_1659536903925_24, var_1659536903925_2662, UInt64(209), Class_1659536903925_362(),
                        var_1659536903925_692, Int16(45), var_1659536903925_51, [(-29), 101, (-50), 116, (-72), 53, 58,
                            (-104), 5, (-115)]))
            } else {
                Option<(Range<Int16>, Bool, (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt64, 
                        Class_1659536903925_362, String, Int16, UInt32, Array<Int64>)>.Some(
                    (((Int16(-123) & 127)..(Int16(-10) & 127) : (95 | 1)), true, (var_1659536903925_5386, 73.0, ((UInt32(109) &
                                127)..(UInt32(64) & 127) : (27 | 1)), ((UInt64(74) & 127)..=(var_1659536903925_4223 & 127) : ((75 |
                                1))), UInt8(214), var_1659536903925_333), UInt64(10), var_1659536903925_367,
                        ###"i}.0zd#7RT"###, Int16(-2), UInt32(84), [var_1659536903925_1068, var_1659536903925_131,
                            var_1659536903925_5386, (-86), var_1659536903925_4943, var_1659536903925_4943, 20,
                            var_1659536903925_131, var_1659536903925_4943, var_1659536903925_1068]))
            }
        } ?? (try { // block id: 5415
                var_1659536903925_2030;
                if (var_1659536903925_24) {
                    var_1659536903925_333
                } else {
                    var_1659536903925_333
                }
            } finally { // block id: 5421
                var_1659536903925_2030;
                ((Int16(54) & 127)..(Int16(68) & 127) : ((48 | 1)))
            }, try { // block id: 5428
                -var_1659536903925_606
                var_1659536903925_51 != var_1659536903925_4843
            } catch (_) { // block id: 5434
                optionalParam_1659536903925_1125;
                if (var_1659536903925_38) {
                    var_1659536903925_4955
                } else {
                    (((Int16(-63) & 127)..=(Int16(-19) & 127) : (13 | 1)), var_1659536903925_4588, (var_1659536903925_1068,
                            65.0, ((UInt32(44) & 127)..(UInt32(50) & 127) : (23 | 1)), var_1659536903925_2744, UInt8(248),
                            var_1659536903925_333), var_1659536903925_4223, Class_1659536903925_362(),
                        var_1659536903925_692, var_1659536903925_1706, UInt32(88), [63, 78, 21, 87, (-35), (-95), 31,
                            (-89), 98, 95])
                };
                true
            } finally { // block id: 5456
                ((Int16(-50) & 127)..=(Int16(-55) & 127) : (46 | 1));
                var_1659536903925_2840;
                var_1659536903925_3837 != var_1659536903925_51
            }, (50, (-112.0), ((var_1659536903925_4843 & 127)..(var_1659536903925_3837 & 127) : ((var_1659536903925_1068 |
                    1))), var_1659536903925_2744, var_1659536903925_1735, ((var_1659536903925_1706 & 127)..=(Int16(-95) &
                    127) : ((32 | 1)))), UInt64(UInt16(113)), if (var_1659536903925_4588) {
                var_1659536903925_367
            } else {
                var_1659536903925_367
            }, try { // block id: 5482
                var_1659536903925_5354 * var_1659536903925_3506;
                """
 Pt6&
'2gK\"
"""
            } finally { // block id: 5487
                ###"Os==,-o|d "###
            }, try { // block id: 5490
                var_1659536903925_5492;
                var_1659536903925_4173;
                var_1659536903925_1725
            } finally { // block id: 5536
                Option<Range<UInt8>>.None;
                Int16(-43) ^ var_1659536903925_1706
            }, UInt32(64), match (UInt32(114)) {
                case _ =>
                    var_1659536903925_922 -= var_1659536903925_922
                    if (true) {
                        Class_1659536903925_362()
                    } else {
                        var_1659536903925_2317
                    };
                    [var_1659536903925_5115, 52, (-4), (-22), 71, var_1659536903925_140, (-67), 44,
                        var_1659536903925_5115, 82]

                case _: (Bool, UInt16) =>
                    if (var_1659536903925_5332) {
                        [var_1659536903925_4943, (-47), 102, 78, 42, var_1659536903925_4943, 101, 80, (-61), 10]
                    } else {
                        [var_1659536903925_1068, (-42), var_1659536903925_3697, 12, 20, (-61), var_1659536903925_131,
                            (-3), var_1659536903925_4943, 87]
                    }

                case 88 =>
                    var_1659536903925_5354;
                    var_1659536903925_5311

                case _ => [(-39), 13, (-22), 87, 48, (-108), (-19), (-119), 114, (-58)]
            }))
    };

    func_1659536903925_1117(
        optionalParam_1659536903925_1118: if (var_1659536903925_4588 && false) { // block id: 5604
            Int8(-60)
        } else { // block id: 5606
            ();
            @echo var var_1659536903925_5610: UInt8 = UInt8(22);
            var_1659536903925_5610 |= UInt8(205)
            Int8(99)
        }, optionalParam_1659536903925_1121: var_1659536903925_4223,
        optionalParam_1659536903925_1125: try { // block id: 5616
            @echo var var_1659536903925_5618: Range<Int32> = ((Int32(23) & 127)..(Int32(-20) & 127) : (((-57) | 1)));
            var_1659536903925_5618
        } finally { // block id: 5623
            var_1659536903925_1686;
            ();
            ((var_1659536903925_922 & 127)..=(Int32(32) & 127) : ((var_1659536903925_140 | 1)))
        })
}

@echo
public func func_1659536903925_970(param_1659536903925_971: UInt8): (Range<Int16>, Bool, (Int64, Float64, Range<UInt32>, 
    Range<UInt64>, UInt8, Range<Int16>), UInt64, Class_1659536903925_362, String, Int16, UInt32, Array<Int64>) { // block id: 972
    @echo let var_1659536903925_989: UInt16 = UInt16(206);
    @echo let var_1659536903925_1003: Array<(Bool, UInt16)> = [(((UInt16(82) as Int64) is Float32), UInt16(UInt16(105))),
        ((Option<Int64>.None is String), UInt16(180)),
        ((((90 & 127)..(42 & 127) : ((-59) | 1)) is Array<Option<Bool>>), UInt16(212)), (false, UInt16(UInt16(95))),
        (false, UInt16(UInt16(UInt8(110)))), (true, UInt16(Int16(-101))),
        (([(-7), (-104), (-95), 78, (-18), (-57), 27, 39, (-8), 106] is (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>)),
        UInt16(108)), ((UInt32(139) is Interface_1659536903925_65), UInt16(9)), (true, UInt16(UInt16(UInt16(188)))),
        (false, UInt16(Int8(UInt8(246))))];
    @echo var var_1659536903925_1054: Int16 = Int16(UInt16(UInt8(Int8(UInt8(126)))));
    if (try { // block id: 975
        var_1659536903925_51 | var_1659536903925_51;
        if (var_1659536903925_24) {
            [(var_1659536903925_38, UInt16(197)), var_1659536903925_783, (var_1659536903925_38, var_1659536903925_989),
                var_1659536903925_783, var_1659536903925_783, var_1659536903925_783,
                (var_1659536903925_38, var_1659536903925_989), var_1659536903925_783, var_1659536903925_783,
                (false, UInt16(108))]
        } else {
            var_1659536903925_1003
        };
        false
    } finally { // block id: 1051
        var_1659536903925_1054--;
        var_1659536903925_38
    }) { // block id: 1061
        try (resource = Class_1659536903925_362()) { // block id: 1063

        } catch (e: Exception) { // block id: 1064
            var_1659536903925_493
        };
        var_1659536903925_1068 >>= ((var_1659536903925_131) & 7)
        [(), var_1659536903925_493, var_1659536903925_493, var_1659536903925_493, var_1659536903925_493,
            var_1659536903925_493, (), (), (), var_1659536903925_493][4]
    };
    @echo var var_1659536903925_5631: ((Int64, Range<UInt8>, Range<UInt32>, Array<Int64>)) -> (Range<Int16>, Bool, (Int64, 
        Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>), UInt64, Class_1659536903925_362, String, Int16, 
        UInt32, Array<Int64>) = func_1659536903925_1086;
    var_1659536903925_2275 |> var_1659536903925_5631
}

@echo
func func_1659536903925_907(param_1659536903925_908: Option<Bool>): Float32 { // block id: 909
    @echo let var_1659536903925_931: (Int64) -> Int32 = {lambdaParameter_1659536903925_934: Int64 => Int32(90)};
    @echo var var_1659536903925_947: UInt8 = UInt8(Int8(UInt8(Int8(117))));
    if ((try { // block id: 913
        var_1659536903925_783;
        Int32(-11)
    } catch (e: Exception) { // block id: 916
        (false, UInt16(243));
        var_1659536903925_922 * Int32(-96)
    } > (58 |> var_1659536903925_931))) {
        try { // block id: 939
            Class_1659536903925_362()
        } finally { // block id: 941
            var_1659536903925_493;
            (26, ((var_1659536903925_947 & 127)..(UInt8(242) & 127) : (((-52) | 1))), var_1659536903925_955, [(-89),
                    (-102), 107, (-114), (-84), 56, 118, (-47), 41, (-119)]);
            if (true) {
                var_1659536903925_367
            } else {
                Class_1659536903925_362()
            }
        }
    } else {
        (UInt8(130) |> func_1659536903925_970)[4]
    };
    ();
    Float32(Float32(-126.0))
}

@echo
func func_1659536903925_646(param_1659536903925_647: Interface_1659536903925_66): Option<Range<UInt64>> { // block id: 648
    @echo let var_1659536903925_658: ??Range<UInt64> = Option<Option<Range<UInt64>>>.None;
    @echo var var_1659536903925_669: Float64 = Float64(Float32(Float32(Float32(Float32(116.0)))));
    @echo let var_1659536903925_696: ?Bool = Option<Bool>.None;
    @echo let var_1659536903925_710: Array<(Bool, UInt16)> = [(((Option<Option<Range<UInt64>>>.Some(
            Option<Range<UInt64>>.None) is Option<Int64>) is (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>)), UInt16(UInt16(UInt16(117)))),
        (((59, ((UInt8(191) & 127)..=(UInt8(142) & 127) : ((-117) | 1)), ((UInt32(106) & 127)..(UInt32(48) & 127) : ((-32) |
                1)), [3, (-22), 49, (-11), 105, 70, 76, (-15), (-26), 118]) is Array<(Bool, UInt16)>), UInt16(Int16(UInt8(29)))),
        ((Class_1659536903925_362() is Range<Int64>), UInt16(UInt8(133))),
        ((((Int8(-26) & 127)..=(Int8(79) & 127) : (((-3) | 1))) is Bool), UInt16(UInt8(220))), (false, UInt16(209)),
        ((UInt32(Int32(107)) is Range<Int8>), UInt16(182)), (true, UInt16(150)),
        ((UInt64(UInt16(160)) is (Int64, Float64, Range<UInt32>, Range<UInt64>, UInt8, Range<Int16>)), UInt16(144)),
        ((((92, ((UInt8(22) & 127)..=(UInt8(95) & 127) : (99 | 1)), ((UInt32(226) & 127)..=(UInt32(71) & 127) : ((118 | 1))),
            [10, (-39), (-7), 58, (-83), 9, 120, (-98), (-82), (-42)]) as (Bool, UInt16)) is Range<UInt8>), UInt16(Int8(118))),
        ((UInt16(220) is Range<UInt8>), UInt16(199))];
    @echo let var_1659536903925_780: UInt16 = UInt16(92);
    @echo var var_1659536903925_815: UInt16 = UInt16(Int8(UInt8(10)));
    @echo let var_1659536903925_825: ?Int64 = Option<Int64>.None;
    @echo let var_1659536903925_870: Bool = ((() as Int64) is Class_1659536903925_362);
    match (try { // block id: 653
        if (false) {
            var_1659536903925_385
        } else {
            var_1659536903925_658
        }
    } catch (_) { // block id: 660
        @echo let var_1659536903925_663: UInt16 = UInt16(Int8(-84));
        var_1659536903925_663 / ((UInt16(119)) | 1);
        var_1659536903925_669 /= Float64((Int32(12.0)) | 1)
        var_1659536903925_658
    } finally { // block id: 677
        @echo let var_1659536903925_682: ?Range<UInt64> = Option<Range<UInt64>>.None;
        if (false) {
            Option<Option<Range<UInt64>>>.Some(var_1659536903925_682)
        } else {
            var_1659536903925_658
        }
    }) {
        case _: Option<Option<Range<UInt64>>> =>
            if (true) {
                "rcM8`bRuOB"
            } else {
                var_1659536903925_692
            };
            [var_1659536903925_696, var_1659536903925_696, Option<Bool>.None, var_1659536903925_696,
                var_1659536903925_696, var_1659536903925_696, var_1659536903925_696, Option<Bool>.None,
                var_1659536903925_696, var_1659536903925_696];
            @echo var var_1659536903925_796: Bool = true;
            if (false) {
                var_1659536903925_710
            } else {
                [(true, var_1659536903925_780), var_1659536903925_783, var_1659536903925_783,
                    (var_1659536903925_796, var_1659536903925_780), (true, UInt16(177)), var_1659536903925_783,
                    (var_1659536903925_24, var_1659536903925_780), (var_1659536903925_796, UInt16(69)),
                    (var_1659536903925_796, var_1659536903925_780), (var_1659536903925_24, var_1659536903925_815)]
            }

        case _ =>
            if (true) {
                var_1659536903925_162
            } else {
                var_1659536903925_825
            };
            @echo var var_1659536903925_838: (Bool, UInt16) = ((Float64(Float32(-47.0)) is Range<UInt8>), UInt16(148));
            @echo var var_1659536903925_846: Bool = true;
            if (false) {
                [var_1659536903925_783, var_1659536903925_783, (false, UInt16(90)), var_1659536903925_783,
                    var_1659536903925_783, var_1659536903925_838, (var_1659536903925_846, UInt16(160)),
                    (true, var_1659536903925_815), (var_1659536903925_846, UInt16(53)), var_1659536903925_838]
            } else {
                [var_1659536903925_838, (false, UInt16(27)), var_1659536903925_783, (true, var_1659536903925_815),
                    (var_1659536903925_24, UInt16(108)), (var_1659536903925_870, UInt16(62)), var_1659536903925_838,
                    var_1659536903925_838, (var_1659536903925_846, UInt16(186)),
                    (var_1659536903925_870, var_1659536903925_780)]
            }
    }[2];
    @echo var var_1659536903925_5641: (Option<Bool>) -> Float32 = func_1659536903925_907;
    @echo let var_1659536903925_5645: Range<Int32> = ((Int32(Int8(Int8(62))) & 127)..(Int32(-14) & 127) : ((Int64(UInt8(Int8(UInt8(97)))) |
        1)));
    @echo var var_1659536903925_5663: ?Range<UInt64> = Option<Range<UInt64>>.Some(
        ((UInt64(211) & 127)..(UInt64(216) & 127) : (46 | 1)));
    (func_1659536903925_886(namedParam_1659536903925_887: (var_1659536903925_1151 |> var_1659536903925_5641),
        optionalParam_1659536903925_888: var_1659536903925_5645) ?? try { // block id: 5656
        ();
        if (false) {
            var_1659536903925_4857
        } else {
            var_1659536903925_4857
        };
        var_1659536903925_5663
    } catch (e: Exception) { // block id: 5666
        UInt32(159);
        ();
        var_1659536903925_2254
    })
}

@echo
func func_1659536903925_630(param_1659536903925_631: Interface_1659536903925_65): UInt64 { // block id: 632
    @echo let var_1659536903925_5680: Range<UInt64> = ((UInt64(249) & 127)..=(UInt64(143) & 127) : ((-2) | 1));
    @echo func func_1659536903925_637(): Int64 { // block id: 638
        @echo var var_1659536903925_5671: (Interface_1659536903925_66) -> Option<Range<UInt64>> = func_1659536903925_646;
        (Option<Option<Range<UInt64>>>.Some((var_1659536903925_3737 |> var_1659536903925_5671)) ?? if (var_1659536903925_38) {
            (if (false) {
                Option<Range<UInt64>>.Some(var_1659536903925_5680)
            } else {
                var_1659536903925_2254
            })
        } else {
            (Option<Option<Range<UInt64>>>.Some(var_1659536903925_2254) ?? var_1659536903925_2254)
        });
        Int64(try { // block id: 5689
            [var_1659536903925_38, var_1659536903925_1771, false, false, true, var_1659536903925_38, false,
                var_1659536903925_1771, true, true];
            var_1659536903925_4843
        } catch (e: Exception) { // block id: 5702
            ();
            var_1659536903925_2030;
            UInt32(48) << ((var_1659536903925_3837) & 7)
        } finally { // block id: 5708
            UInt32(91) - var_1659536903925_51
        })
    };

    @echo func func_1659536903925_634(): Int64 { // block id: 635
        func_1659536903925_637()
    };

    func_1659536903925_634();
    @echo var var_1659536903925_5717: Option<Array<Int64>> = (((Int64(Int16(91)), ((UInt8(114) & 127)..(UInt8(161) & 127) : ((-106) |
                1)), ((UInt32(165) & 127)..(UInt32(248) & 127) : (((-83) | 1))), [95, 40, 123, 91, 13, 65, 63, (-72),
                (-126), (-43)]), (), ((Int16(Int8(-34)) & 127)..=(Int16(Int16(-104)) & 127) : (((-91) | 1))), (),
        "%cXm\"+`c-,", [(), (), (), (), (), (), (), (), (), ()]) as Array<Int64>);
    @echo var var_1659536903925_5785: UInt8 = UInt8(UInt8(182));
    if (var_1659536903925_38) { // block id: 5714
        match (var_1659536903925_5717) {
            case caseVar_1659536903925_5751 => ()

            case _ =>
                var_1659536903925_2840;
                var_1659536903925_606 += Int8(9)

            case caseVar_1659536903925_5763: UInt8 => var_1659536903925_4588 ||= var_1659536903925_1771

            case caseVar_1659536903925_5770: Int64 =>
                var_1659536903925_4588 &&= var_1659536903925_5775
                var_1659536903925_1428 *= var_1659536903925_1428

            case _ => var_1659536903925_5785 ^= var_1659536903925_5785
        };
        if (var_1659536903925_1771) { // block id: 5791
            var_1659536903925_4634;
            ();
            UInt64(221)
        } else { // block id: 5795
            UInt64(5)
        }
    } else { // block id: 5797
        @echo var var_1659536903925_5804: ?UInt64 = Option<UInt64>.None;
        (var_1659536903925_5804 ?? UInt64(177))
    }
}

@echo
func func_1659536903925_460(): Option<Bool> { // block id: 461
    @echo var var_1659536903925_490: Interface_1659536903925_365 = Class_1659536903925_362();
    @echo let var_1659536903925_502: Array<Int64> = [(-58), 22, 45, 99, 78, 71, (-20), (-87), (-35), (-42)];
    try (resource = Class_1659536903925_362()) { // block id: 463
        ();
        @echo let var_1659536903925_469: Unit = ();
        @echo var loopTimeVar_1659536903925_471: Range<UInt64> = ((UInt64(UInt64(119)) & 127)..=(UInt64(UInt64(UInt16(122))) &
            127) : ((90 | 1)));
        for (i in loopTimeVar_1659536903925_471 where var_1659536903925_24) {
            var_1659536903925_469
        }
    } finally { // block id: 479
        @echo var var_1659536903925_496: Int16 = Int16(Int16(UInt16(169)));
        match (UInt32(216)) {
            case 150 =>
                62.0;
                Int16(-92)

            case _ =>
                var_1659536903925_490;
                var_1659536903925_493;
                var_1659536903925_496
        };
        var_1659536903925_502[1];
        var_1659536903925_367.var_1659536903925_508
    };
    @echo let var_1659536903925_522: (Bool, UInt16) = (([(-118), 29, Int64(UInt32(243)), Int64(UInt32(246)), 9,
            Int64(Int8(-100)), Int64(Int32(87)), 41, (-80), Int64(UInt8(253))] is Option<Range<UInt64>>), UInt16(Int16(Int8(UInt8(187)))));
    @echo var var_1659536903925_582: UInt16 = UInt16(Int16(Int16(-27)));
    @echo var var_1659536903925_612: ?Int8 = (Class_1659536903925_362() as Int8);
    if ((var_1659536903925_519 ?? var_1659536903925_522)[0]) { // block id: 546
        @echo var loopTimeVar_1659536903925_562: Int64 = 0;
        while ((true) && loopTimeVar_1659536903925_562 < 100) {
            loopTimeVar_1659536903925_562++;
            @echo let var_1659536903925_551: Range<UInt16> = ((UInt16(Int8(-79)) & 127)..=(UInt16(UInt8(112)) & 127) : ((Int64(UInt16(UInt8(181))) |
                1)));
            var_1659536903925_551;
            UInt8(72)
        };
        (Option<Int8>.Some(Int8(34)) ?? Int8(-82));
        match (((var_1659536903925_51 & 127)..=(UInt32(70) & 127) : ((94 | 1)))) {
            case caseVar_1659536903925_578: (Range<UInt32>, Range<UInt32>, Option<Bool>) => var_1659536903925_582 &= var_1659536903925_582

            case caseVar_1659536903925_589: (Int64, Range<UInt8>, Range<UInt32>, Array<Int64>) =>
                var_1659536903925_24 ||= var_1659536903925_24
                var_1659536903925_38 ||= var_1659536903925_38

            case _ => var_1659536903925_493
        }
    } else if (match (try { // block id: 602
        false;
        Option<Int8>.Some(var_1659536903925_606)
    } finally { // block id: 608
        ();
        ();
        var_1659536903925_612
    }) {
        case caseVar_1659536903925_617: Range<Int16> => false

        case _ => !false

        case _ => var_1659536903925_24
    }) { // block id: 628
        Class_1659536903925_59() |> func_1659536903925_630;
        if (var_1659536903925_38) { // block id: 5811
            if (true) {
                var_1659536903925_4490
            } else {
                'b'
            }
        } else if (true) { // block id: 5817
            Class_1659536903925_59();
            var_1659536903925_4490
        } else { // block id: 5820
            if (var_1659536903925_5213) {
                Option<Option<Bool>>.None
            } else {
                var_1659536903925_2989
            };
            var_1659536903925_2840;
            var_1659536903925_4490
        };
        @echo var loopTimeVar_1659536903925_5834: Range<UInt64> = ((UInt64(UInt8(UInt8(UInt8(23)))) & 127)..(UInt64(UInt8(82)) &
            127) : (((-45) | 1)));
        for (i in loopTimeVar_1659536903925_5834 where var_1659536903925_1771) {
            var_1659536903925_5831;
            ()
        }
    };
    match (((Option<Option<UInt8>>.Some(var_1659536903925_2934) ?? var_1659536903925_2934) ?? UInt8(173) >> ((UInt8(194)) &
        7))) {
        case _ =>
            var_1659536903925_51++;
            var_1659536903925_922 &= var_1659536903925_922
            Option<Bool>.Some(true)
    }
}

@echo
public func func_1659536903925_426(param_1659536903925_427: Option<Array<Int64>>): Option<Bool> { // block id: 428
    @echo var var_1659536903925_439: ?Bool = Option<Bool>.None;
    @echo var loopTimeVar_1659536903925_442: Int64 = 0;
    do {
        loopTimeVar_1659536903925_442++;
        var_1659536903925_439
    } while ((var_1659536903925_38 || (Class_1659536903925_362.var_1659536903925_435)) &&
        loopTimeVar_1659536903925_442 < 100);
    [var_1659536903925_449[2], func_1659536903925_460(), var_1659536903925_1151, ('V' as Bool), var_1659536903925_4634,
        ((((Int16(-54) & 127)..=(Int16(-48) & 127) : ((8 | 1))), var_1659536903925_4588, var_1659536903925_5877, UInt64(174),
        var_1659536903925_367, "$gEa_N5 gM", var_1659536903925_1706, UInt32(204), [87, var_1659536903925_3697,
            var_1659536903925_140, 97, var_1659536903925_140, var_1659536903925_5115, var_1659536903925_3697, 118, 70,
            var_1659536903925_3697]) as Bool), Option<Bool>.None, Option<Bool>.None,
        (((-35), ((UInt8(117) & 127)..=(UInt8(85) & 127) : (35 | 1)), var_1659536903925_4425, var_1659536903925_5311) as Bool),
        var_1659536903925_1151][9]
}

main(): Int64 {
    try {
        @echo var var_1659536903925_8: Bool = false;
        @echo var var_1659536903925_47: Unit = ();
        if (var_1659536903925_8) { // block id: 10
            @echo var var_1659536903925_12: Unit = ();
            var_1659536903925_12;
            ();
            @echo let var_1659536903925_17: Float64 = (-95.0);
            var_1659536903925_17 ** var_1659536903925_17
        } else if (try { // block id: 21
            Int32(108);
            var_1659536903925_24
        } catch (_) { // block id: 26
            var_1659536903925_29 && var_1659536903925_8
        } finally { // block id: 32
            Float32(-35.0);
            var_1659536903925_35;
            var_1659536903925_38
        }) { // block id: 43
            102.0
        } else { // block id: 45
            var_1659536903925_47;
            var_1659536903925_51 = UInt32(198)
            -var_1659536903925_35
        };
        var_1659536903925_68.func_1659536903925_71();
        @echo var var_1659536903925_6155: ?Option<Int64> = Option<Option<Int64>>.Some(
            ([Class_1659536903925_362(
                namedParam_1659536903925_2455: ((-118), ((UInt8(105) & 127)..=(UInt8(113) & 127) : ((-27) | 1)), ((UInt32(132) &
                        127)..=(UInt32(154) & 127) : ((-33) | 1)), [(-44), 25, (-98), 8, 62, 53, 20, (-60), 81, (-98)])),
                Class_1659536903925_362(), Class_1659536903925_59(Option<Int64>.None), Class_1659536903925_59(),
                Class_1659536903925_362(
                namedParam_1659536903925_2455: ((-106), ((UInt8(78) & 127)..(UInt8(2) & 127) : (83 | 1)), ((UInt32(243) &
                        127)..=(UInt32(209) & 127) : ((-73) | 1)), [(-113), (-37), 28, (-78), 75, (-110), 30, (-56), 49,
                        (-112)])), Class_1659536903925_59(func_1659536903925_1405, namedParam_1659536903925_1835: ()),
                Class_1659536903925_59(Option<Int64>.None), Class_1659536903925_362(),
                Class_1659536903925_59(func_1659536903925_1405, namedParam_1659536903925_1835: ()),
                Class_1659536903925_59()] as Int64));
        @echo let var_1659536903925_6196: Option<Int64> = (Class_1659536903925_59() as Int64);
        ((var_1659536903925_6155 ?? var_1659536903925_6196) ?? (-122) / (((-56)) | 1))
        // CRC Check All Variables
        var crccheck = CrcCheck(5000, 32)
        crccheck.crcCheck()
        crccheck.getCrcOutput()
        ()
    } catch (e: NoneValueException) {
        println("Exception: NoneValueException")
    }

    return 0;
}

class CrcCheck {
    var buffer: Array<Int64>
    var poly: Array<Int64>
    var crc_output: Array<Int64>
    var poly_n: Int64
    var buffer_index: Int64
    var crc_output_n: Int64

    init(buffer_n: Int64, crc_n: Int64) {
        buffer_index = 0
        crc_output_n = 0
        crc_output = Array<Int64>(crc_output_n, {i => 0})
        buffer = Array<Int64>(buffer_n, {i => 0})
        poly_n = crc_n + 1
        if (crc_n == 32) {
            poly = [1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1]
        } else if (crc_n == 16) {
            poly = [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1]
        } else if (crc_n == 8) {
            poly = [1, 0, 0, 0, 0, 0, 1, 1, 1]
        } else {
            poly = [1, 1, 0, 0, 1]
        }
    }

    func updateBuffer(input: UInt64, byte_n: Int64): Unit {
        var value = input
        if (byte_n == 64) {
            value = value & 0xffffffffffffffff
        } else if (byte_n == 32) {
            value = value & 0xffffffff
        } else if (byte_n == 16) {
            value = value & 0xffff
        } else {
            value = value & 0xff
        }
        var byteArray = Array<Int64>(byte_n, {i => 0})
        var byte_c = 1
        var byte_index = 0
        while (value != 0) {
            if (value % 2 == 1) {
                byte_index = byte_n - byte_c
                byteArray[byte_index] = 1
            }
            byte_c++
            value = value >> 1
        }
        var i = 0
        while (i + byte_index < byte_n) {
            buffer[i + buffer_index] = byteArray[i + byte_index]
            i++
        }
        buffer_index = buffer_index + i
    }

    func crcCheck(): Unit {
        crc_output_n = buffer_index + poly_n - 1
        var crc_buffer = Array<Int64>(crc_output_n, {i => 0})
        var i = 0
        while (i < buffer_index) {
            crc_buffer[i] = buffer[i]
            i++
        }
        i = 0
        while (i < buffer_index) {
            if (crc_buffer[i] == 1) {
                var j = 0
                while (j < poly_n) {
                    crc_buffer[j + i] = crc_buffer[j + i] ^ poly[j]
                    j++
                }
            }
            i++
        }
        let check_code = crc_buffer[buffer_index..]
        var byte_add = 3 - crc_output_n % 3
        crc_output_n = byte_add + crc_output_n
        crc_output = Array<Int64>(crc_output_n, {i => 0})
        i = 0
        while (i < crc_output_n - byte_add) {
            if (i < buffer_index) {
                crc_output[i + byte_add] = buffer[i]
            } else {
                crc_output[i + byte_add] = check_code[i - buffer_index]
            }
            i++
        }
    }

    func getCrcOutput(): Unit {
        var i = 0
        while (i < crc_output_n) {
            var hex_value = 2 ** 2 * crc_output[i] + 2 ** 1 * crc_output[i + 1] + 1 * crc_output[i + 2]
            print(hex_value.toString())
            i = i + 3
        }
        print("\n")
    }
}
// ASSERT: scan sema_inconsistency_elemType
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_type_incompatible
