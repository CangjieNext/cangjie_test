// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler --int-overflow=wrapping %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1| compare %f
// ASSERT: scan at default::Interface_1743341905737_48<...>::func_1743341905737_667(Tuple<...>, Tuple<...>)

public sealed interface Interface_1743341905737_48<T0> {
    @Frozen
    static func func_1743341905737_667(
        namedParam_1743341905737_668: ((UInt8, Bool), Int8, Array<Option<Int32>>, VArray<Unit, $3>, UInt8, (Array<UInt64>, 
            (Array<Option<Int32>>, Rune), UInt16)),
        namedParam_1743341905737_669: ((UInt8, Bool), Int8, Array<Option<Int32>>, VArray<Unit, $3>, UInt8, (Array<UInt64>, 
            (Array<Option<Int32>>, Rune), UInt16))
    ): Unit {
        throw Exception()
    }
}

main(): Int64 {
    let opNumber = Option<Int32>.None
    let arrInt32 = [opNumber]
    let arrUInt64 = [UInt64(1)]

    Interface_1743341905737_48<Int8>.func_1743341905737_667(
        ((UInt8(1), false), Int8(1), arrInt32, VArray<Unit, $3>({i => ()}), UInt8(1), (arrUInt64, (arrInt32, r'l'),
                UInt16(1))),
        ((UInt8(1), false), Int8(1), arrInt32, VArray<Unit, $3>({i => ()}), UInt8(1), (arrUInt64, (arrInt32, r'l'),
                UInt16(1)))
    )

    return 0
}
