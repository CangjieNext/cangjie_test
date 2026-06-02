// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test.memory

main(): Int64 {
    var hundred = 0
    while (hundred < 100) { // until hundred < 100
        hundred++
    }

    while (hundred < 100) { // until hundred < 100
        hundred++
        // 发送成功跳出
        break
    }

    while (hundred < 100) { // until hundred < 100
        hundred++
        continue
    }
    return 0
}
