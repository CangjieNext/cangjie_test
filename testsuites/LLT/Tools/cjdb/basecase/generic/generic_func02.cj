// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func f1<T>(a: T) {
    func f2<U>(a: U) {
        a
    }
    return f2<Int64>(1)
}

main() {
    f1<Int64>(1)
    return 0
}
