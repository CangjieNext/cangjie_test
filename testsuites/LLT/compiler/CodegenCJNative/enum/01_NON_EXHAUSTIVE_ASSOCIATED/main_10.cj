// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan value is ToString:E.A

class CCC <: ToString {
    public func toString() {
        return "CCCC"
    }
}

enum E {
    | A
    | B(Int64)
    | C(CCC)
}

extend E <: ToString {
    public func toString() {
        let stringBuilder = StringBuilder()
        stringBuilder.append("E")
        match (this) {
            case A => stringBuilder.append(".A")
            case B(i64) => stringBuilder.append(".B(${i64})")
            case C(ccc) => stringBuilder.append(".C(${ccc})")
        }
        return stringBuilder.toString()
    }
}

func foo<T>(value: T) {
    if (value is ToString) {
        var toStringValue = (value as ToString).getOrThrow()
        println("value is ToString:${toStringValue}");
    } else {
        println("value is not ToString")
    }
}

main() {
    var e = E.A
    foo(e)
    return 0
}
