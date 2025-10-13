// LEVEL: 0
// EXEC: %compiler %enableO2 %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// All global variable need to be defined before use!
var var_1691442830355_433 : UInt32 = UInt32(191)
public open class Class_1691442830355_7 {

    public init(namedParam_1691442830355_399 ! : Option<Int8>, namedParam_1691442830355_400 ! : String) { // block id: 401
        let var_1691442830355_418 : Option<Rune> = (Float64(Float64(-19.0)) as Rune);
        let var_1691442830355_471 : Unit = ();
    }
    ;
    public var var_1691442830355_771 : Int16 = Int16(125);
    func foo() {
        return 123
    }

    public let var_1691442830355_854 : (UInt8, UInt8, UInt64, Unit, (Unit, Int8, Float32, Rune, Float32, Rune, Int16, Rune, Int8), Int8) = (UInt8(40), UInt8(149), UInt64(172), (), ((), Int8(79), Float32(-97.0), r'Y', Float32(-80.0), r'D', Int16(-46), r'I', Int8(-45)), Int8(-99));

    public prop var_1691442830355_895 : Rune { // block id: 896
        get() { // block id: 898
            ((), r'R', ((Int64(Int64(UInt32(117)))&127)..(Int64(Int64(-79))&127):(Int64(Int16(-109))|1)), ((Int32(-93) as Int8) as Int8), UInt32(208), ((Int32(Int32(80))&127)..=(Int32(Int32(-76))&127):(Int64(-126)|1)), Int64(UInt8(67)), UInt16(253));
            r'0'
        }

    }

}

main(): Int64 {
    func func_1691442830355_22() : Class_1691442830355_7{ // block id: 23
        let var_1691442830355_521 : Range<Int64> = 1..=3

       func func_1691442830355_148() : Class_1691442830355_7 { // block id: 150
            let var_1691442830355_544 : ?Bool = None


            Class_1691442830355_7(namedParam_1691442830355_399 : (Option<(Range<Int64>, Option<Int8>, Range<Int32>)>.None ?? (var_1691442830355_521, Option<Int8>.None, Int32(-45)..Int32(-84)))[1], namedParam_1691442830355_400 :  if (var_1691442830355_544.getOrThrow()) { // block id: 547
                    ""
                    } else { // block id: 556
                    "hello bug"
                    })
        }

        func_1691442830355_148()
    }
    func_1691442830355_22().foo()

        return 0;
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
