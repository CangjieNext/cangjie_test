// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public class AAA<T> {
    let value: T
    public init(para: T) {
        this.value = para
    }
}

main() {
    var aa = AAA<Int8>(1)
    0
}
