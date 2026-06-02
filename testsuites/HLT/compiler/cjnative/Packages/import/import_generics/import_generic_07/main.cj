/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p
// EXEC: %compiler %cmp_opt %compile_lib_opt p/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 111

import a.*

main() {
    var a = Foo0()
    var b = Foo1()
    var c = Foo2.A
    print(a.bar<String>("1"))
    print(b.bar<String>("1"))
    print(c.bar<String>("1"))
    0
}
