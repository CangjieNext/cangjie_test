// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// REGION: 6:6
func map<T, R>(source: Array<T>, f: (T) -> R): Array<R> {
    let x = Array( source.size) {
        i: Int64  =>  f(source[i])
    }
    return x
}
