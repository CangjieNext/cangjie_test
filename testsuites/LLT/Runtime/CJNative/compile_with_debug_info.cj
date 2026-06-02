// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0: %compiler --int-overflow=wrapping %f -o %output
// EXEC-0: %run %run_opt %output %run_args

public let var_1710170113819_306: Option<Unit> = (r'c' as Unit)
let var_1710170113819_1037: Array<VArray<Unit, $8>> = [[(), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), ()],
    [(), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), ()],
    [(), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), ()],
    [(), (), (), (), (), (), (), ()], [(), (), (), (), (), (), (), ()]]

public func func_1710170113819_11(): Option<Bool> { // block id: 13
    throw Exception()
}

public open class Class_1710170113819_72 <: Resource {
    public init() { // block id: 74

    }

    public static let var_1710170113819_1028: (UInt16, Int16, Float32, Int64, String, Rune)
    public func func_1710170113819_216(): Unit { // block id: 893
        var var_1710170113819_901: (Unit, String, UInt64, (UInt16, Int16, Float32, Int64, String, Rune), Int64, String) = ((),
            """
@JL\"Q
-4r}j
""", UInt64(123), (UInt16(UInt8(214)), Int16(Int16(Int16(-123))), Float32(Float32(Float32(-124.0))),
                Int64(-7), "bB:>(iXGr8", r'z'), Int64(Int8(-59)), "p,bnKa{Zvx)");
        const var_1710170113819_1048: UInt32 = 123;
        var var_1710170113819_1074: Int32 = Int32(34);
        match (try { // block id: 896
            ();
            let var_1710170113819_929: Array<VArray<Unit, $8>> = [VArray<Unit, $8>({i => ()}),
                VArray<Unit, $8>({i => ()}), VArray<Unit, $8>({i => ()}), VArray<Unit, $8>({i => ()}),
                VArray<Unit, $8>({i => ()}), VArray<Unit, $8>({i => ()}), VArray<Unit, $8>({i => ()}),
                VArray<Unit, $8>({i => ()}), VArray<Unit, $8>({i => ()}), VArray<Unit, $8>({i => ()})];
            (var_1710170113819_306, var_1710170113819_901, (205, 121, Float32(-105.0), Int64(6), "8;_<MKQzBN", r'0'),
                var_1710170113819_929)
        } finally { // block id: 1021
            let var_1710170113819_1024: Option<Unit> = Option<Unit>.None;
            (var_1710170113819_1024, var_1710170113819_901, var_1710170113819_1028, var_1710170113819_1037)
        }) {
            case (caseVar_1710170113819_1041, (_, _, caseVar_1710170113819_1042: Option<Bool>, (_: Array<VArray<Unit, $8>>, _, _: UInt32, _, _: Array<Unit>, caseVar_1710170113819_1043: Int32), _, _: Option<Unit>), caseVar_1710170113819_1044: (UInt16, 
                        (Int8, Unit, (UInt16, Int16, Float32, Int64, String, Rune)), Rune, Float64, Unit), _: (Option<Unit>, 
                        Option<Bool>, (Int8, UInt32), (Int8, Unit, (UInt16, Int16, Float32, Int64, String, Rune)), 
                        Float64)) =>
                var_1710170113819_1048 ^ var_1710170113819_1048;
                ();

            case (caseVar_1710170113819_1061, caseVar_1710170113819_1062: Option<Unit>, caseVar_1710170113819_1063: Array<UInt64>, caseVar_1710170113819_1064) => var_1710170113819_1074 /= ((var_1710170113819_1074) |
                1)

            case _ => ()
        };
        ()
    };

    static init() {
        var_1710170113819_1028 = (UInt16(172), Int16(116), Float32(101.0), Int64(-49), "MElRP]ugFQ", r'E')
    }
    public func isClosed(): Bool {
        return false
    }
    public func close(): Unit {}
}

public sealed interface Interface_1710170113819_227 {}

public interface Interface_1710170113819_226 <: Interface_1710170113819_227 {}

main(): Int64 {
    return 0;
}
