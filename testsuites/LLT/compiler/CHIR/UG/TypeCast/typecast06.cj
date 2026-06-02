// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | compare %f
// (not Windows) ASSERT: regex Tuple<UInt32,Generic-_CN7default3fooIG_G0_HNNY_3HHHIG_G0_EE1GE,Int8> = TypeCast\(%[0-9]+, Tuple<UInt32,Generic-_CN7default3fooIG_G0_HNNY_3HHHIG_G0_EE1GE,Int8>\)

enum HHH<T, G> {
    A(T) | B(G, Int8)
}

func foo<T, G>(param: HHH<T, G>) {
    match (param) {
        case A(x) => var a = x
        case B(x, y) => var b = y
    }
}

main() {
    var h2 = HHH<Int64, Int8>.B(10, 11)
    foo<Int64, Int8>(h2)
    return 0
}
