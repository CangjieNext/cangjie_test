// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    var data = [2, 3, 0]
    var idx = 0
    var res = 0
    while (idx < 3) {
        var n = data[idx]
        idx++
        if (n == 0) {
            break
        }
        for (j in 0..n) {
            if (j == 1) {
                continue
            }
            var k = 0
            do {
                res++
                k++
            } while (k < 2)
        }
    }
    0
}