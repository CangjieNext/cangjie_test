/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray

func mergeArray(a: VArray<Int64, $2>, b: VArray<Int64, $3>): VArray<Int64, $5> {
    return [1, 2, 3, 4, 5]
}

func test5() {
    var aa = mergeArray([1, 2], [1, 2, 3])
}
