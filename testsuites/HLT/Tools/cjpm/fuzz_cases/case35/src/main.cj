/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

internal import test.a.*
internal import test.b.*

main() {
    let a: A = A()
    let b: A = B()
    let c: A = C()
    b.test()
}
