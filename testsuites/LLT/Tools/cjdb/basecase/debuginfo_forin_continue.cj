// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    var a = 10
    for (i in 1..10) {
        if (i < 3) {
            continue
        }
        a += i
        continue
    }
    return 0
}
