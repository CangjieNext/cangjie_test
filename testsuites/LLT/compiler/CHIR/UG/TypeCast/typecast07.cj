// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | compare %f
// (not Windows) ASSERT: regex Tuple<UInt32,Class-_CN7default2CAIG_E<Generic-_CN7default3fooIG_G0_HNNY_3HHHICNY_2CAIG_EG0_EE1TE>&> = TypeCast\(%[0-9]+, Tuple<UInt32,Class-_CN7default2CAIG_E<Generic-_CN7default3fooIG_G0_HNNY_3HHHICNY_2CAIG_EG0_EE1TE>&>\)
// (not Windows) ASSERT: regex Tuple<UInt32,Generic-_CN7default3fooIG_G0_HNNY_3HHHICNY_2CAIG_EG0_EE1GE,Int8> = TypeCast\(%[0-9]+, Tuple<UInt32,Generic-_CN7default3fooIG_G0_HNNY_3HHHICNY_2CAIG_EG0_EE1GE,Int8>\)

enum HHH<T, G> {
    A(T) | B(G, Int8)
}

class CA<T> {
    public let data: T
    init(_x: T) {
        data = _x
    }
}

func foo<T, G>(param: HHH<CA<T>, G>) {
    match (param) {
        // TypeCast(param, Tuple<UInt64, Class-_CN7default2CAIG_E<Generic-_CN7default3fooIG_G0_1TS5a0c_aE>&>)
        case A(x) => var a = x.data
        // TypeCast(param, Tuple<UInt64, Generic-_CN7default3fooIG_G0_1GS5a0c_aE, Int8>)
        case B(x, y) => var b = y
    }
}

main() {
    var h2 = HHH<CA<Int64>, Int8>.B(10, 11)
    foo<Int64, Int8>(h2)
    return 0
}
