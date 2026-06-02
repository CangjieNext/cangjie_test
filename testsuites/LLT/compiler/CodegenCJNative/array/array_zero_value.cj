// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %overflowOpt -g %enableO2 %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// All global variable need to be defined before use!
public var var_1719918039515_36: UInt64 = UInt64(Int64(-56))
public let var_1719918039515_61: Option<UInt64> = Option<UInt64>.None
public let var_1719918039515_76: Float32 = Float32(Float32(-15.0))
let var_1719918039515_136: Int = Int64(Int64(Int64(UInt16(162))))
var var_1719918039515_156: VArray<UInt32, $2> = [UInt32(232), UInt32(107)]
public var var_1719918039515_180: UInt32 = UInt32(UInt32(192))
public var var_1719918039515_199: Float64 = Float64(-70.0)
var var_1719918039515_206: Int32 = Int32(UInt32(51))
public var var_1719918039515_223: Enum_1719918039515_7 = Enum_1719918039515_7.enumValue_1719918039515_225(
    (r'i' as UInt64))
public const var_1719918039515_249: Int = 29
var var_1719918039515_294: Int8 = Int8(-24)
const var_1719918039515_306: Int32 = -3
const var_1719918039515_347: UInt32 = 74
const var_1719918039515_533: Float64 = 107.0
public const var_1719918039515_540: UInt16 = 31
public var var_1719918039515_643: ((Range<Int64>, Int32, Range<UInt8>, Int32), (Bool, Range<Int32>), Option<UInt64>, 
    Float64) = ((((Int64(Int64(-71)) & 127)..=(Int64(Int64(-29)) & 127) : (Int64(9) | 1)), Int32(UInt16(7)), ((UInt8(UInt8(Int8(124))) &
            127)..=(UInt8(UInt8(UInt8(34))) & 127) : (Int64(-57) | 1)), Int32(-46)), (true, ((Int32(Int32(Int16(-98))) &
            127)..=(Int32(Int32(UInt8(192))) & 127) : (Int64(49) | 1))), Option<UInt64>.None, Float64(-114.0))
let var_1719918039515_680: Unit = ()
public let var_1719918039515_704: Class_1719918039515_10 = Class_1719918039515_10()
public var var_1719918039515_753: Int32 = Int32(47)
public var var_1719918039515_760: (Range<UInt16>, Bool) = (((UInt16(UInt16(13)) & 127)..(UInt16(UInt16(42)) & 127) : (Int64(115) |
        1)), false)
public var var_1719918039515_765: Rune = r'6'
public var var_1719918039515_826: Byte = UInt8(215)
public var var_1719918039515_872: ?Unit = Option<Unit>.None
public var var_1719918039515_935: UInt16 = UInt16(Int16(UInt8(UInt8(UInt8(161)))))

public enum Enum_1719918039515_7 {
    defaultValue
    | enumValue_1719918039515_225(Option<UInt64>)
    | enumValue_1719918039515_502(UInt8, Int32, Float64, Int16)
    | enumValue_1719918039515_777(Array<VArray<UInt32, $2>>)
}

public open class Class_1719918039515_10 {
    public init() { // block id: 12

    }

    mut prop var_1719918039515_390: Bool { // block id: 391
        get() { // block id: 393
            (Int16(Int16(Int16(-75))) is UInt32);
            var_1719918039515_960
        }
        set(Value) { // block id: 400
            ();
            var_1719918039515_960 = Value
        }
    }
    public prop var_1719918039515_770: Enum_1719918039515_7 { // block id: 771
        get() { // block id: 773
            Int64(Int32(14));
            Enum_1719918039515_7.enumValue_1719918039515_777(
                [VArray<UInt32, $2>(repeat: UInt32(123)), VArray<UInt32, $2>({i => UInt32(173)}),
                    VArray<UInt32, $2>(repeat: UInt32(79)), VArray<UInt32, $2>({i => UInt32(105)}),
                    VArray<UInt32, $2>({i => UInt32(116)}), VArray<UInt32, $2>({i => UInt32(5)}),
                    VArray<UInt32, $2>({i => UInt32(131)}), VArray<UInt32, $2>({i => UInt32(248)}),
                    VArray<UInt32, $2>({i => UInt32(54)}), VArray<UInt32, $2>(repeat: UInt32(95))])
        }
    }
    var var_1719918039515_960: Bool = false
}

public open class Class_1719918039515_113 {
    public init() { // block id: 115

    }

    static var var_1719918039515_118: ?UInt32
    public mut prop var_1719918039515_488: (VArray<UInt32, $2>, Option<Bool>, Enum_1719918039515_7, String, Option<Bool>, 
        Rune, Rune, VArray<UInt32, $2>) { // block id: 489
        get() { // block id: 491
            "[]a{j8Wwuc~";
            (VArray<UInt32, $2>(repeat: UInt32(UInt8(162))), (###"TlD\"wG RWD"### as Bool),
                Enum_1719918039515_7.enumValue_1719918039515_502(UInt8(92), Int32(UInt32(237)), Float64(18.0),
                    Int16(-75)), ###"t_E|p6d(9n"###, (((Int32(Int32(118)) & 127)..=(Int32(Int32(60)) & 127) : (Int64(63) |
                    1)) as Bool), r'F', r'D', VArray<UInt32, $2>(repeat: UInt32(Int8(73))))
        }
        set(Value) { // block id: 527
            (Option<Float64>.None as Bool);
            ()
        }
    }
    private static prop var_1719918039515_713: Class_1719918039515_10 { // block id: 714
        get() { // block id: 716
            ();
            ();
            Class_1719918039515_10()
        }
    }
    public static func func_1719918039515_564(param_1719918039515_565: () -> Int32,
        optionalParam_1719918039515_567!: (Range<UInt16>, Bool) = (((UInt16(UInt16(Int16(UInt16(226)))) & 127)..=(UInt16(UInt16(Int16(-21))) &
                127) : (Int64(26) | 1)), true), namedParam_1719918039515_577!: Rune,
        optionalParam_1719918039515_578!: Range<Int64> = ((Int64(Int64(UInt64(UInt16(UInt8(151))))) & 127)..(Int64(Int64(UInt16(91))) &
            127) : (Int64(-88) | 1))): Class_1719918039515_10 { // block id: 587
        let var_1719918039515_591: Array<VArray<UInt32, $2>> = [VArray<UInt32, $2>(repeat: UInt32(Int32(Int8(-21)))),
            VArray<UInt32, $2>(repeat: UInt32(Int32(UInt16(117)))), VArray<UInt32, $2>(repeat: UInt32(UInt16(24))),
            VArray<UInt32, $2>(repeat: UInt32(Int16(-37))), VArray<UInt32, $2>(repeat: UInt32(UInt32(Int32(-84)))),
            VArray<UInt32, $2>({i => UInt32(239)}), VArray<UInt32, $2>(repeat: UInt32(UInt8(37))),
            VArray<UInt32, $2>(repeat: UInt32(Int8(43))), VArray<UInt32, $2>(repeat: UInt32(29)),
            VArray<UInt32, $2>({i => UInt32(54)})];
        var_1719918039515_591[5];
        var var_1719918039515_709: Bool = false;
        try { // block id: 639
            var_1719918039515_643[1];
            var var_1719918039515_699: UInt16 = UInt16(17);
            match ((true, ((Int32(var_1719918039515_206) & 127)..(Int32(var_1719918039515_206) & 127) : (var_1719918039515_136 |
                    1)))) {
                case caseVar_1719918039515_676 =>
                    ();
                    var_1719918039515_680;
                    var_1719918039515_199 ** var_1719918039515_249

                case caseVar_1719918039515_687: UInt8 =>
                    -var_1719918039515_36
                    Float64(26.0) - Float64(118.0)

                case _ =>
                    var_1719918039515_699++;
                    var_1719918039515_36;
                    var_1719918039515_533
            };
            var_1719918039515_704
        } catch (e: Exception) { // block id: 706
            if (var_1719918039515_709) {
                var_1719918039515_704
            } else {
                var_1719918039515_713
            }
        } finally { // block id: 720
            Class_1719918039515_10()
        }
    }

    static init() {
        var_1719918039515_118 = Option<UInt32>.None
    }
}

public func func_1719918039515_100(
    optionalParam_1719918039515_101!: Float32 = Float32(Float32(Float32(Float32(Float32(-63.0))))),
    namedParam_1719918039515_107!: UInt32,
    optionalParam_1719918039515_108!: Option<UInt32> = Option<UInt32>.Some(UInt32(101))): Option<UInt32> { // block id: 111
    Class_1719918039515_113.var_1719918039515_118
}

func func_1719918039515_91(param_1719918039515_92: Enum_1719918039515_7): UInt64 { // block id: 93
    var var_1719918039515_129: Int64 = Int64(Int64(UInt32(Int8(Int8(-16)))));
    (func_1719918039515_100(
        optionalParam_1719918039515_101: try { // block id: 121
            ();
            Float32(-125.0) * var_1719918039515_76
        } catch (e: Exception) { // block id: 126
            var_1719918039515_129 /= ((var_1719918039515_136) | 1)
            Float32(-105.0) + var_1719918039515_76
        }, namedParam_1719918039515_107: var_1719918039515_156[1]) ?? UInt32(164));
    let var_1719918039515_168: Range<UInt16> = ((UInt16(UInt16(133)) & 127)..(UInt16(UInt16(10)) & 127) : (Int64(Int16(34)) |
        1));
    try { // block id: 163
        Int64(-80) >> ((var_1719918039515_136) & 7);
        var_1719918039515_168;
        let var_1719918039515_188: Byte = UInt8(Int8(103));
        (((Int32(Int32(84)) & 127)..=(Int32(Int32(-64)) & 127) : (Int64(5) | 1)), Class_1719918039515_113(), r'R', VArray<UInt32, $2>(repeat: var_1719918039515_180),
            var_1719918039515_156, ((UInt8(UInt8(11)) & 127)..=(UInt8(var_1719918039515_188) & 127) : (var_1719918039515_136 |
                1)))
    } finally { // block id: 192
        ((UInt32(UInt32(108)) & 127)..(UInt32(UInt32(196)) & 127) : (Int64(96) | 1));
        var_1719918039515_199 += Float64(-98.0)
        (((Int32(Int32(61)) & 127)..=(Int32(var_1719918039515_206) & 127) : (Int64(-17) | 1)), Class_1719918039515_113(),
            r'U', VArray<UInt32, $2>({i => UInt32(65)}), var_1719918039515_156, ((UInt8(UInt8(94)) & 127)..(UInt8(UInt8(41)) &
                127) : (Int64(59) | 1)))
    }[3];
    UInt64(86)
}

public const func func_1719918039515_245(): Float32 { // block id: 246
    -48;
    var_1719918039515_249;
    const var_1719918039515_252: Float32 = 109.0;
    var_1719918039515_252
}

const func func_1719918039515_328(): Int32 { // block id: 329
    const func func_1719918039515_331(optionalParam_1719918039515_332!: UInt16 = 2): Int32 { // block id: 334
        45
    };

    func_1719918039515_331(optionalParam_1719918039515_332: 80)
}

public func func_1719918039515_323<T0>(param_1719918039515_324: Option<UInt64>): Bool { // block id: 325
    match (func_1719918039515_328()) {
        case -8 => true

        case _ =>
            var_1719918039515_294;
            VArray<UInt32, $2>(repeat: var_1719918039515_347);
            UInt16(110) != UInt16(51)
    }
}

func func_1719918039515_274(
    optionalParam_1719918039515_275!: Range<UInt64> = ((UInt64(UInt64(185)) & 127)..=(UInt64(UInt64(117)) & 127) : (Int64(122) |
        1)),
    optionalParam_1719918039515_277!: Range<UInt8> = ((UInt8(UInt8(139)) & 127)..(UInt8(UInt8(93)) & 127) : (Int64(-95) |
        1)),
    optionalParam_1719918039515_282!: Range<UInt64> = ((UInt64(UInt64(129)) & 127)..(UInt64(UInt64(8)) & 127) : (Int64(5) |
        1))): Class_1719918039515_10 { // block id: 284
    ();
    let var_1719918039515_315: Range<Int64> = ((Int64(Int64(-34)) & 127)..(Int64(Int64(23)) & 127) : (Int64(69) | 1));
    func func_1719918039515_287(optionalParam_1719918039515_288!: Float64 = Float64(Float32(8.0))): Range<UInt8> { // block id: 291
        var_1719918039515_294 |= try { // block id: 297
            ();
            Int8(33)
        } catch (e: Exception) { // block id: 300
            var_1719918039515_294 << ((var_1719918039515_294) & 7)
        } finally { // block id: 304
            var_1719918039515_306;
            Int8(-31)
        };
        const var_1719918039515_357: Bool = true;
        if (true) {
            (var_1719918039515_315, Int32(12), ((UInt8(UInt8(150)) & 127)..(UInt8(UInt8(49)) & 127) : (Int64(-29) | 1)),
                var_1719918039515_306)[2]
        } else {
            (if ((var_1719918039515_61 |> func_1719918039515_323<Float32>)) {
                if (var_1719918039515_357) { // block id: 359
                    var var_1719918039515_362: Int32 = Int32(UInt8(Int8(Int8(Int8(66)))));
                    var_1719918039515_362 &= var_1719918039515_306
                    ((UInt8(UInt8(208)) & 127)..=(UInt8(UInt8(72)) & 127) : (Int64(-22) | 1))
                } else { // block id: 370
                    ((UInt8(UInt8(129)) & 127)..(UInt8(UInt8(58)) & 127) : (Int64(18) | 1))
                }
            } else {
                [((UInt8(UInt8(243)) & 127)..=(UInt8(UInt8(59)) & 127) : (Int64(59) | 1)),
                    ((UInt8(UInt8(189)) & 127)..(UInt8(UInt8(9)) & 127) : (Int64(99) | 1)),
                    ((UInt8(UInt8(154)) & 127)..(UInt8(UInt8(28)) & 127) : (Int64(-56) | 1)),
                    ((UInt8(UInt8(106)) & 127)..=(UInt8(UInt8(59)) & 127) : (Int64(126) | 1)),
                    ((UInt8(UInt8(62)) & 127)..=(UInt8(UInt8(159)) & 127) : (Int64(-12) | 1)),
                    ((UInt8(UInt8(79)) & 127)..(UInt8(UInt8(23)) & 127) : (Int64(122) | 1)),
                    ((UInt8(UInt8(242)) & 127)..=(UInt8(UInt8(26)) & 127) : (Int64(-29) | 1)),
                    ((UInt8(UInt8(30)) & 127)..(UInt8(UInt8(156)) & 127) : (Int64(-62) | 1)),
                    ((UInt8(UInt8(227)) & 127)..=(UInt8(UInt8(254)) & 127) : (Int64(-22) | 1)),
                    ((UInt8(UInt8(176)) & 127)..(UInt8(UInt8(244)) & 127) : (Int64(-121) | 1))][9]
            })
        }
    };

    func_1719918039515_287(
        optionalParam_1719918039515_288: (Option<Float64>.Some(Float64(94.0)) ?? Float64(Float32(33.0))));
    Class_1719918039515_10()
}

public func func_1719918039515_268(param_1719918039515_269: Bool): (Bool, Range<Int32>) { // block id: 270
    var var_1719918039515_405: Int = Int64(Int64(-60));
    var loopTimeVar_1719918039515_410: Int = 0;
    while ((func_1719918039515_274(
            optionalParam_1719918039515_275: ((UInt64(UInt64(23)) & 127)..=(UInt64(UInt64(63)) & 127) : (Int64(-97) | 1)),
            optionalParam_1719918039515_277: ((UInt8(UInt8(158)) & 127)..(UInt8(UInt8(117)) & 127) : (Int64(-56) | 1)),
            optionalParam_1719918039515_282: ((UInt64(UInt64(182)) & 127)..=(UInt64(UInt64(219)) & 127) : (Int64(-76) | 1)))
            .var_1719918039515_390) && loopTimeVar_1719918039515_410 < 100) {
        loopTimeVar_1719918039515_410++;
        var_1719918039515_405 %= ((Int64(104)) | 1)
    };
    var var_1719918039515_412: (Bool, Range<Int32>) = ((Int8(Int8(-123)) is Option<Float64>), ((Int32(Int32(-11)) & 127)..=(Int32(Int32(UInt32(Int16(0)))) &
            127) : (Int64(Int16(-51)) | 1)));
    var_1719918039515_412
}

public struct Struct_1719918039515_729<T0, T1> {
    public init() { // block id: 731

    }

    public mut prop var_1719918039515_736: Bool { // block id: 737
        get() { // block id: 739
            false
        }
        set(Value) { // block id: 743
            ();
            ()
        }
    }
    public static let var_1719918039515_925: ?Int64 = Option<Int64>.None
}

main(): Int64 {
    try {
        let var_1719918039515_85: Bool = (r'j' is Int32);
        let var_1719918039515_220: (Enum_1719918039515_7) -> UInt64 = func_1719918039515_91;
        let var_1719918039515_553: Range<Int32> = ((Int32(Int32(95)) & 127)..(Int32(Int32(-4)) & 127) : (Int64(-88) | 1));
        func func_1719918039515_14(namedParam_1719918039515_15!: Float32): Class_1719918039515_10 { // block id: 16
            let var_1719918039515_18: Unit = ();
            var_1719918039515_18;
            const var_1719918039515_255: Float64 = -36.0;
            let var_1719918039515_261: Int8 = Int8(-125);
            let var_1719918039515_485: Class_1719918039515_113 = Class_1719918039515_113();
            func func_1719918039515_27<T0, T1>(optionalParam_1719918039515_28!: UInt32 = UInt32(Int16(UInt16(164))),
                namedParam_1719918039515_32!: Float64): Option<Bool> { // block id: 33
                let var_1719918039515_81: Rune = r'p';
                var_1719918039515_36 &= (match (###"q\"*7,wN3eS"###) {
                    case _ => Option<UInt64>.Some(var_1719918039515_36)

                    case caseVar_1719918039515_53 =>
                        var var_1719918039515_57: Int32 = Int32(-87);
                        var_1719918039515_57 - var_1719918039515_57;
                        var_1719918039515_61

                    case "$0|2f>%x@=" | "ae;]~o%qw$" =>
                        if (true) {
                            var_1719918039515_61
                        } else {
                            Option<UInt64>.Some(var_1719918039515_36)
                        }

                    case _ =>
                        var_1719918039515_76 - var_1719918039515_76;
                        var_1719918039515_81;
                        if (var_1719918039515_85) {
                            var_1719918039515_61
                        } else {
                            var_1719918039515_61
                        }
                } ?? (var_1719918039515_223 |> var_1719918039515_220))
                const func func_1719918039515_234(param_1719918039515_235: Float64, param_1719918039515_236: Int32): Rune { // block id: 237
                    r'V'
                };

                const func func_1719918039515_240(param_1719918039515_241: Float32, namedParam_1719918039515_242!: Int16): Float64 { // block id: 243
                    func_1719918039515_245();
                    var_1719918039515_255
                };

                if ((Float64(-97.0) <= var_1719918039515_199)) {
                    func_1719918039515_234(
                        func_1719918039515_240(var_1719918039515_76, namedParam_1719918039515_242: Int16(41)),
                        Int32(var_1719918039515_261))
                } else {
                    r'F'
                };
                var var_1719918039515_441: UInt8 = UInt8(UInt8(UInt8(86)));
                var var_1719918039515_449: ?Bool = Option<Bool>.Some(
                    (((UInt64(UInt64(224)) & 127)..(UInt64(UInt64(12)) & 127) : (Int64(-75) | 1)) is Option<UInt32>));
                var var_1719918039515_477: Class_1719918039515_10 = Class_1719918039515_10();
                if ((true |> func_1719918039515_268)[0]) {
                    match (((UInt64(UInt64(242)) & 127)..(UInt64(UInt64(128)) & 127) : (var_1719918039515_136 | 1))) {
                        case _: Float64 =>
                            if (var_1719918039515_85) {
                                ((UInt8(UInt8(67)) & 127)..=(UInt8(UInt8(43)) & 127) : (Int64(42) | 1))
                            } else {
                                ((UInt8(UInt8(100)) & 127)..(UInt8(var_1719918039515_441) & 127) : (Int64(-100) | 1))
                            };
                            if (true) {
                                var_1719918039515_449
                            } else {
                                Option<Bool>.None
                            }

                        case caseVar_1719918039515_456 =>
                            if (var_1719918039515_85) {
                                Option<Bool>.None
                            } else {
                                Option<Bool>.Some(false)
                            }

                        case caseVar_1719918039515_465 =>
                            var_1719918039515_180 += var_1719918039515_180
                            var_1719918039515_449

                        case _ =>
                            if (false) {
                                var_1719918039515_477
                            } else {
                                var_1719918039515_477
                            };
                            var_1719918039515_449
                    }
                } else {
                    var_1719918039515_485.var_1719918039515_488[4]
                }
            };

            var var_1719918039515_558: Class_1719918039515_10 = Class_1719918039515_10();
            if ((func_1719918039515_27<Range<Int8>, Range<UInt16>>(namedParam_1719918039515_32: var_1719918039515_533) ??
                (((UInt16(var_1719918039515_540) & 127)..(UInt16(var_1719918039515_540) & 127) : (Int64(-93) | 1)), true)[1])) {
                try { // block id: 547
                    Class_1719918039515_10()
                } finally { // block id: 549
                    (var_1719918039515_85, var_1719918039515_553);
                    if (var_1719918039515_85) {
                        var_1719918039515_558
                    } else {
                        var_1719918039515_558
                    }
                }
            } else {
                (Class_1719918039515_113.func_1719918039515_564(
                    {
                        =>
                        var var_1719918039515_733: Struct_1719918039515_729<Range<Int64>, Array<VArray<UInt32, $2>>> = Struct_1719918039515_729<Range<Int64>, Array<VArray<UInt32, $2>>>();
                        var var_1719918039515_747: VArray<Int32, $6> = [Int32(32), Int32(-76), Int32(59), Int32(80),
                            Int32(44), Int32(66)];
                        if ((var_1719918039515_733.var_1719918039515_736)) {
                            var_1719918039515_747
                        } else {
                            VArray<Int32, $6>({i => Int32(55)})
                        }[2]
                    },
                    optionalParam_1719918039515_567: var_1719918039515_760,
                    namedParam_1719918039515_577: var_1719918039515_765,
                    optionalParam_1719918039515_578: ((Int64(Int64(-125)) & 127)..(Int64(Int64(55)) & 127) : (Int64(117) |
                        1))
                ))
            }
        };

        var var_1719918039515_818: Unit = ();
        match (func_1719918039515_14(namedParam_1719918039515_15: var_1719918039515_76).var_1719918039515_770) {
            case caseVar_1719918039515_812 =>
                var_1719918039515_36 >>= ((UInt64(148)) & 7)
                var_1719918039515_818

            case enumValue_1719918039515_225(_) =>
                [UInt64(128), UInt64(86), UInt64(228), UInt64(47), UInt64(171), UInt64(236), UInt64(49), UInt64(217),
                    UInt64(110), UInt64(203)];
                var_1719918039515_826 &= UInt8(9)
                ()

            case enumValue_1719918039515_777(caseVar_1719918039515_832: Range<UInt8>) =>
                var_1719918039515_136;
                ();
                var_1719918039515_818

            case caseVar_1719918039515_839: Range<Int8> =>
                var var_1719918039515_842: Array<VArray<UInt32, $2>> = [[UInt32(150), UInt32(100)],
                    [UInt32(148), UInt32(229)], [UInt32(16), UInt32(31)], [UInt32(184), UInt32(162)],
                    [UInt32(154), UInt32(138)], [UInt32(174), UInt32(56)], [UInt32(46), UInt32(182)],
                    [UInt32(138), UInt32(69)], [UInt32(146), UInt32(111)], [UInt32(232), UInt32(26)]];
                var_1719918039515_842;
                ()

            case _ => var_1719918039515_180 |= var_1719918039515_180
        };
        var var_1719918039515_885: Range<UInt8> = ((UInt8(UInt8(99)) & 127)..=(UInt8(UInt8(209)) & 127) : (Int64(UInt64(UInt64(163))) |
            1));
        var loopTimeVar_1719918039515_916: Int = 0;
        while ((match (VArray<Rune, $1>({i => r'Z'})[0]) {
                case _ =>
                    ((UInt64(UInt64(139)) & 127)..=(UInt64(UInt64(92)) & 127) : (Int64(-39) | 1));
                    UInt64(246) > var_1719918039515_36
            }) && loopTimeVar_1719918039515_916 < 100) {
            loopTimeVar_1719918039515_916++;
            (var_1719918039515_872 ?? var_1719918039515_818);
            try { // block id: 876
                let var_1719918039515_880: Byte = UInt8(11);
                [((UInt8(var_1719918039515_880) & 127)..(UInt8(UInt8(112)) & 127) : (var_1719918039515_136 | 1)),
                    var_1719918039515_885,
                    ((UInt8(var_1719918039515_880) & 127)..(UInt8(var_1719918039515_880) & 127) : (var_1719918039515_136 |
                    1)), var_1719918039515_885,
                    ((UInt8(UInt8(191)) & 127)..(UInt8(UInt8(68)) & 127) : (var_1719918039515_136 | 1)),
                    ((UInt8(UInt8(68)) & 127)..=(UInt8(UInt8(17)) & 127) : (Int64(46) | 1)),
                    ((UInt8(UInt8(159)) & 127)..(UInt8(UInt8(195)) & 127) : (var_1719918039515_249 | 1)),
                    ((UInt8(UInt8(178)) & 127)..=(UInt8(UInt8(108)) & 127) : (Int64(-107) | 1)),
                    ((UInt8(UInt8(23)) & 127)..=(UInt8(UInt8(180)) & 127) : (Int64(-34) | 1)), var_1719918039515_885]
            } finally { // block id: 912
                var_1719918039515_680;
                [((UInt8(UInt8(171)) & 127)..(UInt8(UInt8(168)) & 127) : (Int64(-90) | 1)),
                    ((UInt8(UInt8(160)) & 127)..(UInt8(UInt8(32)) & 127) : (Int64(-54) | 1)),
                    ((UInt8(UInt8(10)) & 127)..(UInt8(UInt8(126)) & 127) : (Int64(85) | 1)),
                    ((UInt8(UInt8(94)) & 127)..(UInt8(UInt8(104)) & 127) : (Int64(-90) | 1)),
                    ((UInt8(UInt8(143)) & 127)..(UInt8(UInt8(144)) & 127) : (Int64(-77) | 1)),
                    ((UInt8(UInt8(185)) & 127)..(UInt8(UInt8(57)) & 127) : (Int64(-11) | 1)),
                    ((UInt8(UInt8(196)) & 127)..(UInt8(UInt8(186)) & 127) : (Int64(24) | 1)),
                    ((UInt8(UInt8(37)) & 127)..=(UInt8(UInt8(56)) & 127) : (Int64(-63) | 1)),
                    ((UInt8(UInt8(178)) & 127)..(UInt8(UInt8(23)) & 127) : (Int64(52) | 1)),
                    ((UInt8(UInt8(116)) & 127)..=(UInt8(UInt8(104)) & 127) : (Int64(47) | 1))]
            }
        };
        let var_1719918039515_943: (Range<Int16>, Range<Int64>, Int64) = (((Int16(Int16(67)) & 127)..(Int16(Int16(-94)) &
                127) : (Int64(124) | 1)), ((Int64(Int64(UInt32(UInt16(158)))) & 127)..=(Int64(Int64(16)) & 127) : (Int64(UInt64(146)) |
                1)), Int64(5));
        (Struct_1719918039515_729<Range<Int64>, Array<VArray<UInt32, $2>>>.var_1719918039515_925 ?? try { // block id: 930
            VArray<Rune, $1>(repeat: var_1719918039515_765);
            var_1719918039515_935 <<= ((UInt16(221)) & 7)
            var_1719918039515_943
        } finally { // block id: 957
            var_1719918039515_943
        }[2])
        // CRC Check All Variables
        var crcCheck = CrcCheck(5000, 32)
        crcCheck.updateBuffer(UInt64(var_1719918039515_36 * var_1719918039515_36), 64)
        crcCheck.updateBuffer(UInt64(var_1719918039515_136 * var_1719918039515_136), 64)
        crcCheck.updateBuffer(UInt64(var_1719918039515_180 * var_1719918039515_180), 64)
        crcCheck.updateBuffer(UInt64(var_1719918039515_206 * var_1719918039515_206), 64)
        crcCheck.updateBuffer(UInt64(var_1719918039515_540 * var_1719918039515_540), 64)
        crcCheck.crcCheck()
        crcCheck.getCrcOutput()
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
            buffer[(i + buffer_index) % buffer.size] = byteArray[i + byte_index]
            i++
        }
        buffer_index = (buffer_index + i) % buffer.size
    }

    func updateBuffer(input: Bool, byte_n: Int64): Unit {
        if (input == true) {
            updateBuffer(1, byte_n)
        } else {
            updateBuffer(0, byte_n)
        }
    }

    func updateBuffer(input: Rune, byte_n: Int64): Unit {
        updateBuffer(UInt64(UInt32(input)), byte_n)
    }

    func updateBuffer(input: String, byte_n: Int64): Unit {
        for (c in input) {
            updateBuffer(c, byte_n)
        }
    }

    func updateBuffer(input: Unit, byte_n: Int64): Unit {
        updateBuffer(input.toString(), byte_n)
    }

    func updateBuffer(input: Any, byte_n: Int64): Unit {
        if (input is Hashable) {
            match (input as Hashable) {
                case Some(v) => updateBuffer(UInt64(v.hashCode()), byte_n)
                case _ => updateBuffer(1, byte_n)
            }
        } else if (input is ToString) {
            match (input as ToString) {
                case Some(v) => updateBuffer(v.toString(), byte_n)
                case _ => updateBuffer(1, byte_n)
            }
        } else {
            updateBuffer(1, byte_n)
        }
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
