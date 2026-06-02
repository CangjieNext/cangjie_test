/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class Foo {}

extend Foo {
    protected const func f() {
        return 0
    }
}

main() {
    var a = Foo()
    return a.f()
}
// ASSERT: scan sema_no_const_init
