/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func main1<T>() {
    var indexbreak: Int64 = 0
    while (indexbreak < 50) {
        indexbreak++
        if ((indexbreak % 4 == 0) && (indexbreak % 6 == 0)) {
            var vcarrc2: Array<Int64> = [2]
            break
        }
    }
    return indexbreak
}
main(): Int64 {
    main1<Int64>()
    return 0
}
