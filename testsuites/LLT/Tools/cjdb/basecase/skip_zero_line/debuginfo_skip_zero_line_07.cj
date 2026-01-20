// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(){
    var sum = 0
    for (i in 1..3) {
        var j = 0
        while (j < 2) {
            j++
            if (i == 2 && j == 2) {
                continue
            }
            var k = 0
            do {
                sum++
                k++
            } while (k < i)
        }
    }
    0
}