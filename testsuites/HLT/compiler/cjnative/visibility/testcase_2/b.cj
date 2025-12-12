/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package a

private enum A<T0, T1, T2> {
    | AA
}

public class B {
    private let a = A<Int64, Bool, String>.AA
}
