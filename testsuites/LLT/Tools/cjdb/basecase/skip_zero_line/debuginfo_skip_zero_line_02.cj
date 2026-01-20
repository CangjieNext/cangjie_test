// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    var res = 0
    for (i in 1..6) {
        if (i % 2 == 0 && res < 10) {
            res += i * 2
            continue
        }
        if (res > 15) {
            break
        }
        res += i
    }
}