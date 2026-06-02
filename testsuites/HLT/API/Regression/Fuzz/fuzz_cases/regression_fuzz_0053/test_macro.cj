/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_definition.cj
// EXEC: %compiler %cmp_macro macro_definition.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt  %run_args

import define.*

@echo
public var var85: Bool = (((UInt16(119) & 127)..=(UInt16(223) & 127) : (85 | 1)) is (Float32, UInt16, Range<UInt64>, 
    Array<Unit>, Int32))

@echo
public let var93: Aggregate89 = Aggregate89()

@echo
public var var146: ?Array<UInt64> = Option<Array<UInt64>>.None

@echo
public var var149: Array<UInt64> = [UInt64(42), UInt64(247), UInt64(142), UInt64(168), UInt64(175), UInt64(17),
    UInt64(150), UInt64(18), UInt64(68), UInt64(225)]

@echo
var var161: Float64 = Float64(Float32(-8.0))

@echo
public var var182: Int64 = 66

@echo
public struct Aggregate89 {
    @echo
    public init() {}
    @echo
    public let var96: Bool = true
}

@echo
public func func80<T0, T1, T2>(param81: Range<UInt8>): Unit { // block id: 82
    var85 &&= var93.var96
    @echo let var189: Unit = ();
    ((if (true) {
        var93
    } else {
        var93
    } |> {
        lambdaParameter135: Aggregate89 =>
        @echo var var167: UInt8 = UInt8(Int8(100));
        @echo let var174: Option<Unit> = Option<Unit>.None;
        @echo var var185: Int64 = Int64(Int8(-83));
        match ((var146 ?? var149)[0]) {
            case _ => Option<Unit>.None
            case 73 | 238 =>
                var161 / Float64((Int32(108.0)) | 1);
                var167 &= var167
                if (var85) {
                    var174
                } else {
                    var174
                }
            case 39 =>
                var182 *= var185
                var189;
                if (false) {
                    var174
                } else {
                    var174
                }
            case caseVar197: Unit =>
                var189;
                ((UInt32(41) & 127)..(UInt32(39) & 127) : (98 | 1));
                var174
            case _ =>
                @echo var var206: Int32 = Int32(UInt16(Int16(-14)));
                var206 += var206
                @echo var var212: UInt64 = UInt64(93);
                var212;
                if (var85) {
                    var174
                } else {
                    Option<Unit>.Some(())
                }
        }
    }) ?? ())
}

main(): Int64 {
    try {
        @echo let var225: (Range<UInt8>) -> Unit = func80<Array<UInt64>, UInt64, Aggregate89>;
    } catch (e: NoneValueException) {
        println("Exception: NoneValueException")
    }

    return 0;
}
