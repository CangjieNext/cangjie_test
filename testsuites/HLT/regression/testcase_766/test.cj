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

// random seed:1768062990242
// All global variable need to be defined before use!
public const var_1768062990242_61: Bool = false
@Deprecated
public const var_1768062990242_93: Int8 = 112
@Deprecated
let var_1768062990242_253: Unit = ()
const var_1768062990242_269: Unit = ()
public let var_1768062990242_331: UInt16 = UInt16(247)
@Deprecated
public let var_1768062990242_336: UInt32 = UInt32(75)
@Deprecated
public var var_1768062990242_420: Float32 = Float32(Float32(58.0))
@Deprecated
public var var_1768062990242_435: Bool = false
public let var_1768062990242_443: VArray<Bool, $9> = [true, (Int8(Int8(-119)) is Array<Float64>),
    (r'q' is Array<Range<Int64>>), false, true, (Float64(-76.0) is Array<Unit>), true,
    ([[(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (), (), ()],
    [(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (),
    (), ()], [(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (), (), ()],
    [(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (),
    (), ()]] is Bool), false]
var var_1768062990242_466: Bool = false
public var var_1768062990242_508: Float64 = Float64(92.0)
public var var_1768062990242_530: Range<UInt32> = ((UInt32(UInt32(252)) & 127)..=(UInt32(UInt32(198)) & 127) : (Int64(48) |
    1))
public const var_1768062990242_585: Float64 = 33.0
public const var_1768062990242_601: UInt8 = 206
internal var var_1768062990242_617: ?(UInt8, Float32, Float64, Range<Int32>) = Option<(UInt8, Float32, Float64, Range<Int32>)>
    .None
public var var_1768062990242_626: Range<Int32> = ((Int32(Int32(-124)) & 127)..(Int32(Int32(Int8(UInt8(154)))) & 127) : (Int64(Int16(40)) |
    1))
internal var var_1768062990242_644: (UInt64, Int16, Int64, Float32, Int16) = (UInt64(UInt32(UInt16(47))), Int16(3),
    Int64(UInt8(247)), Float32(Float32(113.0)), Int16(-117))
internal var var_1768062990242_717: Class_1768062990242_713 = Class_1768062990242_713()
@Deprecated
public var var_1768062990242_745: Rune = r'0'
internal let var_1768062990242_785: UInt = UInt64(Int64(-23))
public let var_1768062990242_790: Int = Int64(Int8(43))
@Deprecated
public var var_1768062990242_795: Int16 = Int16(25)
@Deprecated
internal let var_1768062990242_894: Option<Option<VArray<Bool, $7>>> = (Int8(-119) as Option<VArray<Bool, $7>>)
@Deprecated
public var var_1768062990242_977: Byte = UInt8(UInt8(159))
public const var_1768062990242_1051: UInt64 = 167

public enum Enum_1768062990242_13 {
    defaultValue
    | enumValue_1768062990242_74(Float64)
}

@Deprecated
public open class Class_1768062990242_20 {
    @Frozen
    public init() { // block id: 22

    }

    @Frozen
    private static prop var_1768062990242_39: (UInt64, Int16, Int64, Float32, Int16) { // block id: 40
        get() { // block id: 42
            UInt8(76);
            Float32(-41.0);
            (UInt64(82), Int16(Int8(Int8(-37))), Int64(41), Float32(-32.0), Int16(-116))
        }
    }

    @Frozen
    func func_1768062990242_27(namedParam_1768062990242_28!: Int8,
        optionalParam_1768062990242_29!: Int64 = Int64(Int64(111)),
        optionalParam_1768062990242_32!: UInt16 = UInt16(UInt8(66))): Float32 { // block id: 35
        var_1768062990242_39[3]
    }
}

@Deprecated
public struct Struct_1768062990242_67<T0, T1> {
    public init() { // block id: 69

    }

    static var var_1768062990242_72: Enum_1768062990242_13 = Enum_1768062990242_13.enumValue_1768062990242_74(
        Float64(64.0))
}

@Frozen
public func func_1768062990242_16(param_1768062990242_17: Unit): Enum_1768062990242_13 { // block id: 18
    var var_1768062990242_24: Class_1768062990242_20 = Class_1768062990242_20();
    var_1768062990242_24.func_1768062990242_27(namedParam_1768062990242_28: match (UInt64(166)) {
        case _ =>
            if (var_1768062990242_61) {
                Class_1768062990242_20()
            } else {
                var_1768062990242_24
            };
            Int8(6)
    });
    Struct_1768062990242_67<String, Int16>.var_1768062990242_72
}

@Frozen
public func func_1768062990242_8(param_1768062990242_9: Int16): Bool { // block id: 10
    ();
    match ((if (true) { // block id: 80
        ();
        var var_1768062990242_83: UInt = UInt64(93);
        var_1768062990242_83;
        let var_1768062990242_86: Unit = ();
        var_1768062990242_86
    } |> func_1768062990242_16)) {
        case _ => var_1768062990242_93 < var_1768062990242_93
    }
}

public interface Interface_1768062990242_383<T0> {
    @Frozen
    static func func_1768062990242_637(param_1768062990242_638: UInt64): Option<VArray<Bool, $7>> { // block id: 639
        var var_1768062990242_659: Range<UInt16> = ((UInt16(UInt16(215)) & 127)..(UInt16(UInt16(86)) & 127) : (Int64(-6) |
            1));
        var var_1768062990242_664: Int8 = Int8(Int8(UInt8(Int8(-106))));
        try { // block id: 642
            var_1768062990242_644
        } catch (e: Exception) { // block id: 655
            if (var_1768062990242_466) {
                var_1768062990242_659
            } else {
                ((UInt16(UInt16(60)) & 127)..(UInt16(UInt16(171)) & 127) : (Int64(-34) | 1))
            };
            var_1768062990242_664 |= Int8(-117)
            var var_1768062990242_672: UInt = UInt64(Int16(UInt16(Int8(Int8(4)))));
            (var_1768062990242_672, Int16(109), Int64(-24), Float32(-65.0), Int16(40))
        } finally { // block id: 682
            var_1768062990242_644
        }[3];
        try (resource = Class_1768062990242_380<Range<UInt8>>()) { // block id: 686
            var_1768062990242_269
        } finally { // block id: 688
            var loopTimeVar_1768062990242_695: Int = 0;
            do {
                loopTimeVar_1768062990242_695++;
                ();
                ()
            } while ((false) && loopTimeVar_1768062990242_695 < 100);
            var var_1768062990242_704: UInt64 = UInt64(124);
            try (resource = Class_1768062990242_380<Range<UInt8>>()) { // block id: 697
                var_1768062990242_664 %= ((var_1768062990242_664) | 1)
            } catch (_) { // block id: 701
                ((UInt64(var_1768062990242_704) & 127)..=(UInt64(var_1768062990242_704) & 127) : (Int64(18) | 1));
                var_1768062990242_253
            } finally { // block id: 709
                var_1768062990242_253;
                ()
            }
        };
        var_1768062990242_717.var_1768062990242_388
    }
}

public open class Class_1768062990242_380<T0> <: Interface_1768062990242_383<Array<UInt64>> & Resource {
    public init() { // block id: 382

    }

    @Frozen
    public mut prop var_1768062990242_388: ?VArray<Bool, $7> { // block id: 389
        get() { // block id: 391
            Option<VArray<Bool, $7>>.None;
            ();
            ([Float64(Float32(-11.0)), Float64(80.0), Float64(34.0), Float64(-60.0), Float64(Float64(1.0)),
                Float64(19.0), Float64(Float64(96.0)), Float64(Float32(-103.0)), Float64(-85.0), Float64(69.0)] as VArray<Bool, $7>);
            var_1768062990242_1009
        }
        set(Value) { // block id: 412
            ();
            ();
            var_1768062990242_1009 = Value
        }
    }
    static const var_1768062990242_901: Unit = ();
    private static var var_1768062990242_911: Int = Int64(44);
    private static let var_1768062990242_935: ?VArray<Bool, $7> = Option<VArray<Bool, $7>>.None;

    @Frozen
    public static func func_1768062990242_812(param_1768062990242_813: Array<Unit>,
        param_1768062990242_814: Range<UInt8>, param_1768062990242_815: (UInt64, Int16, Int64, Float32, Int16)): Option<VArray<Bool, $7>> { // block id: 816
        match (((Int8(Int8(-105)) & 127)..=(Int8(Int8(-11)) & 127) : (Int64(-42) | 1))) {
            case caseVar_1768062990242_821 => Float32(1.0)

            case _ =>
                ();
                var_1768062990242_420

            case _ => var_1768062990242_420 - Float32(-7.0)

            case _ => Float32(123.0)
        };
        let var_1768062990242_843: Array<Range<Int64>> = [((Int64(Int64(-116)) & 127)..=(Int64(Int64(118)) & 127) : (Int64(71) |
            1)), ((Int64(Int64(108)) & 127)..=(Int64(Int64(78)) & 127) : (Int64(116) | 1)),
            ((Int64(Int64(71)) & 127)..=(Int64(Int64(-105)) & 127) : (Int64(-60) | 1)),
            ((Int64(Int64(85)) & 127)..=(Int64(Int64(17)) & 127) : (Int64(Int32(1)) | 1)),
            ((Int64(Int64(111)) & 127)..=(Int64(Int64(105)) & 127) : (Int64(91) | 1)),
            ((Int64(Int64(Int32(107))) & 127)..=(Int64(Int64(UInt8(Int8(-52)))) & 127) : (Int64(Int64(62)) | 1)),
            ((Int64(Int64(UInt16(220))) & 127)..=(Int64(Int64(Int8(Int8(-102)))) & 127) : (Int64(-32) | 1)),
            ((Int64(Int64(-23)) & 127)..(Int64(Int64(-94)) & 127) : (Int64(Int32(Int32(8))) | 1)),
            ((Int64(Int64(UInt8(106))) & 127)..(Int64(Int64(UInt64(UInt32(191)))) & 127) : (Int64(UInt64(241)) | 1)),
            ((Int64(Int64(-37)) & 127)..(Int64(Int64(36)) & 127) : (Int64(53) | 1))];
        var loopTimeVar_1768062990242_885: Int64 = 0;
        do {
            loopTimeVar_1768062990242_885++;
            var_1768062990242_843
        } while ((var_1768062990242_466) && loopTimeVar_1768062990242_885 < 100);
        var var_1768062990242_918: UInt32 = UInt32(Int32(-126));
        ((match (var_1768062990242_894) {
            case _ =>
                var_1768062990242_901;
                if (true) {
                    ((Int32(Int32(-1)) & 127)..(Int32(Int32(-120)) & 127) : (Int64(107) | 1))
                } else {
                    ((Int32(Int32(54)) & 127)..=(Int32(Int32(-128)) & 127) : (Int64(113) | 1))
                };
                ((UInt16(UInt16(213)) & 127)..(UInt16(var_1768062990242_331) & 127) : (var_1768062990242_911 | 1))

            case _ =>
                var_1768062990242_918--;
                var_1768062990242_508 += var_1768062990242_508
                ((UInt16(var_1768062990242_331) & 127)..(UInt16(UInt16(204)) & 127) : (Int64(60) | 1))
        } as Option<VArray<Bool, $7>>) ?? (Option<Option<VArray<Bool, $7>>>.Some(var_1768062990242_935) ?? try { // block id: 938
            var_1768062990242_935
        } catch (_) { // block id: 940
            var_1768062990242_918 -= UInt32(46)
            var var_1768062990242_945: (UInt8, Float32, Float64, Range<Int32>) = (UInt8(176), Float32(Float32(Float32(-128.0))),
                Float64(Float32(26.0)), ((Int32(Int32(87)) & 127)..=(Int32(Int32(94)) & 127) : (Int64(89) | 1)));
            var_1768062990242_945;
            var_1768062990242_935
        } finally { // block id: 955
            Option<VArray<Bool, $7>>.Some(VArray<Bool, $7>(repeat: var_1768062990242_435))
        }))
    };

    var var_1768062990242_1009: ?VArray<Bool, $7> = Option<VArray<Bool, $7>>.None;
    public static var var_1768062990242_1019: ?(UInt8, Float32, Float64, Range<Int32>) = Option<(UInt8, Float32, Float64, 
            Range<Int32>)>.None;
    public static func func_1768062990242_637(param_1768062990242_638: UInt64): Option<VArray<Bool, $7>> { // block id: 1016
        match (var_1768062990242_1019) {
            case caseVar_1768062990242_1023 =>
                if (var_1768062990242_466) {
                    r'a'
                } else {
                    r'u'
                };
                ()

            case _ =>
                ":6Ocr%bx`0";
                var_1768062990242_253

            case _ =>
                ((Int16(var_1768062990242_795) & 127)..(Int16(Int16(-49)) & 127) : (Int64(66) | 1));
                var_1768062990242_253
        };
        Interface_1768062990242_383<Array<UInt64>>.func_1768062990242_637(VArray<UInt64, $5>({i => UInt64(120)})[2])
    }

    public func isClosed(): Bool {
        return true
    }
    public func close(): Unit {}
}

public struct Struct_1768062990242_489 {
    @Frozen
    public init() { // block id: 491

    }

    public static const var_1768062990242_494: String = ###"gIHa(K66Zk"###
}

@Frozen
const func func_1768062990242_596(param_1768062990242_597: UInt8): Bool { // block id: 598
    false
}

public const func func_1768062990242_588(namedParam_1768062990242_589!: Bool,
    optionalParam_1768062990242_590!: Float32 = -104.0, namedParam_1768062990242_592!: Int32): String { // block id: 593
    true;
    func_1768062990242_596(var_1768062990242_601);
    "8L^m$D]t+("
}

public const func func_1768062990242_581<T0, T1>(param_1768062990242_582: UInt64): String { // block id: 583
    var_1768062990242_585;
    const var_1768062990242_606: Float32 = -91.0;
    func_1768062990242_588(namedParam_1768062990242_589: var_1768062990242_61,
        optionalParam_1768062990242_590: var_1768062990242_606, namedParam_1768062990242_592: 87)
}

public open class Class_1768062990242_713 <: Class_1768062990242_380<Range<UInt8>> {
    @Frozen
    public init() { // block id: 715

    }

    @Frozen
    prop var_1768062990242_761: Rune { // block id: 762
        get() { // block id: 764
            r'a'
        }
    }
    public static func func_1768062990242_637(param_1768062990242_638: UInt64): Option<VArray<Bool, $7>> { // block id: 1058
        Option<VArray<Bool, $7>>.None
    }

    static init() {
    }
}

@Frozen
@Deprecated
public func func_1768062990242_117<T0>(param_1768062990242_118: Range<Int32>): Option<VArray<Bool, $7>> { // block id: 119
    let var_1768062990242_128: (UInt8, Float32, Float64, Range<Int32>) = (UInt8(236), Float32(Float32(Float32(Float32(106.0)))),
        Float64(-51.0), ((Int32(Int32(UInt8(UInt8(230)))) & 127)..(Int32(Int32(Int8(-125))) & 127) : (Int64(UInt64(UInt32(198))) |
            1)));
    const var_1768062990242_300: Unit = ();
    let var_1768062990242_345: String = ###";a,tZo30X("###;
    let var_1768062990242_356: Array<Float64> = [Float64(46.0), Float64(-72.0), Float64(-110.0),
        Float64(Float32(Float32(68.0))), Float64(Float64(13.0)), Float64(Float64(17.0)),
        Float64(Float32(Float32(Float32(-15.0)))), Float64(Float32(-75.0)), Float64(68.0), Float64(-96.0)];
    func func_1768062990242_123(): Array<Float64> { // block id: 124
        var_1768062990242_128[0];
        const var_1768062990242_162: Bool = true;
        let var_1768062990242_174: Array<Range<Int64>> = [((Int64(Int64(Int64(UInt64(189)))) & 127)..=(Int64(Int64(UInt16(197))) &
            127) : (Int64(-60) | 1)),
            ((Int64(Int64(108)) & 127)..(Int64(Int64(UInt16(UInt16(81)))) & 127) : (Int64(-49) | 1)),
            ((Int64(Int64(88)) & 127)..=(Int64(Int64(77)) & 127) : (Int64(6) | 1)),
            ((Int64(Int64(65)) & 127)..=(Int64(Int64(87)) & 127) : (Int64(-62) | 1)),
            ((Int64(Int64(0)) & 127)..=(Int64(Int64(Int32(-37))) & 127) : (Int64(Int32(-58)) | 1)),
            ((Int64(Int64(99)) & 127)..=(Int64(Int64(-128)) & 127) : (Int64(87) | 1)),
            ((Int64(Int64(48)) & 127)..(Int64(Int64(60)) & 127) : (Int64(-116) | 1)),
            ((Int64(Int64(116)) & 127)..(Int64(Int64(50)) & 127) : (Int64(-70) | 1)),
            ((Int64(Int64(79)) & 127)..(Int64(Int64(24)) & 127) : (Int64(30) | 1)),
            ((Int64(Int64(-37)) & 127)..=(Int64(Int64(118)) & 127) : (Int64(-36) | 1))];
        func func_1768062990242_149<T0>(param_1768062990242_150: Range<UInt32>): Array<Unit> { // block id: 151
            const var_1768062990242_157: Bool = true;
            var loopTimeVar_1768062990242_240: Int = 0;
            do {
                loopTimeVar_1768062990242_240++;
                var_1768062990242_174[9];
                let var_1768062990242_209: (Int16, Range<Int32>, Bool, Range<Int8>, Array<Float64>, Array<Float64>, 
                    Bool, Float32) = (Int16(UInt16(UInt8(71))), ((Int32(Int32(-5)) & 127)..(Int32(Int32(49)) & 127) : (Int64(9) |
                        1)), true, ((Int8(Int8(-27)) & 127)..(Int8(Int8(13)) & 127) : (Int64(5) | 1)), [Float64(-92.0),
                        Float64(-13.0), Float64(18.0), Float64(68.0), Float64(-6.0), Float64(-100.0), Float64(-5.0),
                        Float64(50.0), Float64(10.0), Float64(-80.0)], [Float64(Float64(110.0)), Float64(Float32(-97.0)),
                        Float64(65.0), Float64(-47.0), Float64(Float32(-73.0)), Float64(106.0),
                        Float64(Float64(Float32(-62.0))), Float64(-7.0), Float64(-106.0),
                        Float64(Float64(Float32(121.0)))], false, Float32(112.0));
                var_1768062990242_209[3]
            } while ((VArray<Bool, $9>(repeat: var_1768062990242_157)[4]) && loopTimeVar_1768062990242_240 < 100);
            const var_1768062990242_277: Unit = ();
            try { // block id: 244
                [[(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (), (), ()],
                    [(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (), (), ()],
                    [(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (), (), ()],
                    [(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (), (), ()],
                    [(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (), (), ()]]
            } catch (e: Exception) { // block id: 246
                [[(), (), (), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), (), (), ()],
                    [(), (), (), (), (), (), (), (), (), ()],
                    [var_1768062990242_253, (), (), (), var_1768062990242_253, var_1768062990242_253, (),
                    var_1768062990242_253, (), ()],
                    [var_1768062990242_253, (), (), var_1768062990242_269, var_1768062990242_253, var_1768062990242_253,
                    var_1768062990242_269, var_1768062990242_253, var_1768062990242_253, var_1768062990242_277],
                    [(), (), (), var_1768062990242_277, (), var_1768062990242_269, (), var_1768062990242_253, (), ()],
                    [(), (), var_1768062990242_253, (), (), (), var_1768062990242_277, (), var_1768062990242_300, ()],
                    [(), (), (), (), (), var_1768062990242_253, (), var_1768062990242_300, var_1768062990242_300,
                    var_1768062990242_253],
                    [(), var_1768062990242_300, (), var_1768062990242_300, (), var_1768062990242_253,
                    var_1768062990242_300, var_1768062990242_253, (), ()], [(), (), (), (), (), (), (), (), (), ()]]
            }[2]
        };

        var var_1768062990242_340: Int = Int64(Int16(74));
        func_1768062990242_149<UInt16>(try { // block id: 328
            var_1768062990242_331 + UInt16(219);
            ((UInt32(var_1768062990242_336) & 127)..=(UInt32(UInt32(197)) & 127) : (var_1768062990242_340 | 1))
        } finally { // block id: 343
            var_1768062990242_345;
            if (true) {
                ((UInt32(UInt32(99)) & 127)..(UInt32(var_1768062990242_336) & 127) : (Int64(113) | 1))
            } else {
                ((UInt32(UInt32(38)) & 127)..=(UInt32(UInt32(188)) & 127) : (Int64(75) | 1))
            }
        })[3];
        var_1768062990242_356
    };

    func_1768062990242_123()[2];
    let var_1768062990242_385: Class_1768062990242_380<Range<UInt8>> = Class_1768062990242_380<Range<UInt8>>();
    let var_1768062990242_502: Struct_1768062990242_489 = Struct_1768062990242_489();
    if (match (var_1768062990242_385.var_1768062990242_388) {
        case caseVar_1768062990242_417 =>
            var_1768062990242_420;
            var_1768062990242_269;
            var var_1768062990242_426: Int16 = Int16(Int16(UInt16(10)));
            var_1768062990242_426 != Int16(122)

        case _ => var_1768062990242_435

        case _ =>
            if (false) {
                var_1768062990242_443
            } else {
                VArray<Bool, $9>(repeat: var_1768062990242_435)
            };
            var_1768062990242_466
    }) { // block id: 472
        var var_1768062990242_479: UInt64 = UInt64(Int64(Int8(Int8(Int8(75)))));
        var loopTimeVar_1768062990242_487: Int = 0;
        while ((var_1768062990242_466) && loopTimeVar_1768062990242_487 < 100) {
            loopTimeVar_1768062990242_487++;
            [UInt64(233), UInt64(210), UInt64(245), UInt64(21), UInt64(7), UInt64(49), UInt64(20), UInt64(160),
                UInt64(12), UInt64(60)];
            var_1768062990242_479 /= ((UInt64(44)) | 1)
        };
        Struct_1768062990242_489.var_1768062990242_494
    } else { // block id: 496
        (UInt64(194), var_1768062990242_502, "%P\"E#/i#8 ", """
83a%^
3) C#
""", var_1768062990242_435,
            var_1768062990242_508)[3]
    };
    var var_1768062990242_520: ?Range<UInt32> = (((Int64(Int64(Int32(Int16(126)))) & 127)..(Int64(Int64(Int16(91))) & 127) : (Int64(-13) |
        1)) as Range<UInt32>);
    let var_1768062990242_534: Array<Range<Int64>> = [((Int64(Int64(UInt64(218))) & 127)..=(Int64(Int64(Int32(-16))) &
        127) : (Int64(125) | 1)),
        ((Int64(Int64(UInt8(UInt8(194)))) & 127)..=(Int64(Int64(Int16(-102))) & 127) : (Int64(UInt32(174)) | 1)),
        ((Int64(Int64(-110)) & 127)..=(Int64(Int64(-85)) & 127) : (Int64(-125) | 1)),
        ((Int64(Int64(UInt64(12))) & 127)..(Int64(Int64(-25)) & 127) : (Int64(Int8(UInt8(175))) | 1)),
        ((Int64(Int64(76)) & 127)..=(Int64(Int64(Int32(10))) & 127) : (Int64(UInt16(147)) | 1)),
        ((Int64(Int64(112)) & 127)..(Int64(Int64(13)) & 127) : (Int64(-28) | 1)),
        ((Int64(Int64(107)) & 127)..=(Int64(Int64(-37)) & 127) : (Int64(55) | 1)),
        ((Int64(Int64(101)) & 127)..(Int64(Int64(88)) & 127) : (Int64(-17) | 1)),
        ((Int64(Int64(-108)) & 127)..(Int64(Int64(-108)) & 127) : (Int64(-53) | 1)),
        ((Int64(Int64(-21)) & 127)..=(Int64(Int64(Int64(26))) & 127) : (Int64(61) | 1))];
    const var_1768062990242_621: Byte = 64;
    var var_1768062990242_733: Range<UInt8> = ((UInt8(UInt8(108)) & 127)..=(UInt8(UInt8(135)) & 127) : (Int64(-76) | 1));
    let var_1768062990242_752: Int16 = Int16(-81);
    ((var_1768062990242_520 ?? var_1768062990242_530), var_1768062990242_534[5], (UInt64(49) |> func_1768062990242_581<Float32, Unit>),
        (var_1768062990242_617 ?? (var_1768062990242_621, Float32(52.0), var_1768062990242_508, var_1768062990242_626)),
        Interface_1768062990242_383<Array<UInt64>>.func_1768062990242_637(UInt64(77)), match (var_1768062990242_621) {
            case _ =>
                UInt64(73) / ((UInt64(62)) | 1);
                [UInt64(242), UInt64(151), UInt64(186), UInt64(8), UInt64(116), UInt64(225), UInt64(149), UInt64(142),
                    UInt64(173), UInt64(27)];
                if (false) {
                    var_1768062990242_733
                } else {
                    var_1768062990242_733
                }

            case _ =>
                var_1768062990242_269;
                var_1768062990242_733
        }, if (true) {
            r'1'
        } else {
            var_1768062990242_745
        }, try { // block id: 748
            ();
            var_1768062990242_752 / ((var_1768062990242_752) | 1)
        } finally { // block id: 755
            ((UInt64(UInt64(100)) & 127)..(UInt64(UInt64(8)) & 127) : (Int64(-5) | 1));
            Int16(-118)
        }, var_1768062990242_717.var_1768062990242_761)[4]
}

main(): Int64 {
    let var_1768062990242_768: (Range<Int32>) -> Option<VArray<Bool, $7>> = func_1768062990242_117<Range<Int16>>;
    var loopTimeVar_1768062990242_807: Int = 0;
    while (((if (var_1768062990242_466) { // block id: 782
            (var_1768062990242_785, Int16(122), var_1768062990242_790, Float32(48.0), var_1768062990242_795);
            ();
            Int16(68)
        } else if (var_1768062990242_466) { // block id: 800
            var_1768062990242_253;
            var_1768062990242_795
        } else { // block id: 803
            var_1768062990242_795
        } |> {
            lambdaParameter_1768062990242_98: Int16 => ((var_1768062990242_626 |> var_1768062990242_768) ?? VArray<Bool, $7>({
                i => true
            }))[1]
        })) && loopTimeVar_1768062990242_807 < 100) {
        loopTimeVar_1768062990242_807++;
    };
    match (Class_1768062990242_380<Range<UInt8>>.func_1768062990242_812([(), (), (), (), (), (), (), (), (), ()],
        ((UInt8(UInt8(24)) & 127)..(UInt8(UInt8(148)) & 127) : (Int64(75) | 1)), var_1768062990242_644)) {
        case caseVar_1768062990242_973 =>
            var_1768062990242_977++;
            Int64(11)

        case _ => Int64(-11)

        case caseVar_1768062990242_987: Unit => var_1768062990242_790

        case caseVar_1768062990242_992: Option<Option<VArray<Bool, $7>>> =>
            ();
            var_1768062990242_790

        case _ =>
            var_1768062990242_977;
            (var_1768062990242_785, Int16(120), Int64(6), Float32(15.0), var_1768062990242_795);
            Int64(-15) * var_1768062990242_790
    }
    // CRC Check All Variables
    CrcCheck.crc32(UInt64(var_1768062990242_785))
    CrcCheck.crc32(UInt64(var_1768062990242_795))
    CrcCheck.crc32(UInt64(var_1768062990242_977))
    println(CrcCheck.str);
    return 0;
}

class CrcCheck {
    public static var str: String = ""
    private static let crcTable: Array<UInt32> = Array<UInt32>(
        256,
        {
            i =>
                var crc: UInt32 = UInt32(i)
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
        var crc: UInt32 = 0xFFFFFFFF;
        var buffer: Array<UInt8> = Array<UInt8>(8, {i => UInt8((value >> (7 - i) * 8) & 0xFF)})
        for (b in buffer) {
            var index: Int64 = Int64((crc & 0xFF) ^ UInt32(b))
            crc = (crc >> 8) ^ crcTable[index]
        }
        str += (!crc).toString()
    }
}
