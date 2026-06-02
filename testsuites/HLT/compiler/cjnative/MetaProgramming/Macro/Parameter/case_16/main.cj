/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_def.cj
// EXEC: %compiler %cmp_macro macro_def.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

import define.*

class Foo {
    private var a = 0
    public mut prop temp: Int64 {
        get() {
            a
        }
        set(@M(value)) {
            a = value
        }
    }
}

main() {
    var x = Foo()
    x.temp = 2
    return x.temp - 2
}
