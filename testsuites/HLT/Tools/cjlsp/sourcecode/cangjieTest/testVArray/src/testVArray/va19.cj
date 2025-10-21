/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray

func test19() {
    let arr5: VArray<Int64, $5> = VArray<Int64, $5>({i => i}) // [0, 1, 2, 3, 4]
    let arr6: VArray<Int64, $5> = VArray<Int64, $5>(repeat: 0) // [0, 0, 0, 0, 0]
    let arr7: VArray<Int64, $5> = arr6
    let arr8 = arr7 // arr8 类型为  VArray<Int64, $5>

    let arr4 = VArray<Int64, $5>(repeat: 0)
}
