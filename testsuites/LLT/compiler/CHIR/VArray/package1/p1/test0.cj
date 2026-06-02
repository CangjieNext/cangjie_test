// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test0

public class A<T> {
    public static let a: VArray<Float32, $1>
    static init() {
        a = VArray<Float32, $1>(repeat: Float32(34.0))
    }
}
