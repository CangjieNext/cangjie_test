// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan BBB([(),(),()])
// ASSERT: scan CCC([(),(),()], S)
// ASSERT: scan DDD(((),()))

struct S <: ToString {
    public func toString() {
        return "S"
    }
}

enum E2 {
    BBB(VArray<Unit, $3>) | CCC(VArray<Unit, $3>, S) | DDD((Unit, Unit))
}

func matchEnum(e: E2) {
    match (e) {
        case BBB(varr) => println("BBB([${varr[0]},${varr[1]},${varr[2]}])")
        case CCC(varr, s) => println("CCC([${varr[0]},${varr[1]},${varr[2]}], ${s})")
        case DDD(tuple) => println("DDD((${tuple[0]},${tuple[1]}))")
    }
}

main() {
    var b = BBB([(), (), ()])
    matchEnum(b)
    var c = CCC([(), (), ()], S())
    matchEnum(c)
    var d = DDD(((), ()))
    matchEnum(d)
    return 0
}
