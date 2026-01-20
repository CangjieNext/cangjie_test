// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    var arr = [1, 4, 5, 7, 10]
    var odd = 0
    var even = 0
    var i = 0
    while(i < arr.size) {
        let x = arr[i]
        if(x % 2 == 0) {
            even++
        } else {
            odd++
        }
        i++
    }
}