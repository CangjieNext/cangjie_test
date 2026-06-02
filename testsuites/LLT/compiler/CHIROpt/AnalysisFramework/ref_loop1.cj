// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-0: %compiler %cmp_opt %f -o %output

internal import std.ast.*

enum NeedDes {
    MUST_DES | CANNOT_DES | OPTION_DES
}

class Field {
    let isVar: Bool = true
    let hasInitializer: Bool = true
    prop needDes: NeedDes {
        get() {
            if (!hasInitializer) {
                MUST_DES
            } else {
                if (isVar) {
                    OPTION_DES
                } else {
                    CANNOT_DES
                }
            }
        }
    }
}

func genInit(): Tokens {
    let fields: Array<Field> = Array<Field>(10, repeat: Field())

    var tokens = quote(,)

    var isFirstParam = true
    for (fil in fields) {
        match (fil.needDes) {
            case MUST_DES =>
                isFirstParam = false
                tokens += quote(,)
            case OPTION_DES =>
                isFirstParam = false
                tokens += quote(,)
            case CANNOT_DES => ()
        }
    }

    if (isFirstParam) {
        return Tokens()
    }

    for (fil in fields) {
        match (fil.needDes) {
            case MUST_DES => tokens = tokens + quote(,)
            case OPTION_DES => tokens = tokens + quote(,)
            case CANNOT_DES => ()
        }
    }

    tokens + Token(RCURL)
}

main() {
    0
}
