/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common class C<X> where X <: C<X> {
    public common func foo() {}
    public common init(input: X) {
        let a: Unit = input.foo()
    }
}
