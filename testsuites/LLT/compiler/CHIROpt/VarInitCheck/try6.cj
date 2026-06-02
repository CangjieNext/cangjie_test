// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK: %compiler %disableSemaVic %cmp_opt -Woff unused %diag_json %n.cj
func xx_throw(): Unit {
    throw Exception("xx")
}

func xx_try_catch(): Unit {
    {
        =>
        let str: String
        try {
            xx_throw()
            str = "inner-throw-text"
        } catch (e: Exception) {
        }
        println(str)
    }()
}

main(): Unit {
    xx_try_catch()
}
// ASSERT: scan chir_used_before_initialization
