// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK: %compiler %disableSemaVic %cmp_opt -Woff unused %diag_json %n.cj

class CA {
    var x = 1
}

func xx_throw(): Unit {
    throw Exception("xx")
}

func xx_try_catch(): Unit {
    {
        =>
        let a: CA
        try {
            a = CA()
            throw Exception()
        } finally {
            a = CA()
        }
        a = CA()
    }()
}

main(): Unit {
    xx_try_catch()
}
// ASSERT: scan chir_cannot_assign_initialized_let_variable
