// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public func test<T>() {
    let a: ?Int64 = 1
    if (false) {
        return 1
    } else if (let Some(v) <- a) {
        return v - 1
    }
    return 2
}
