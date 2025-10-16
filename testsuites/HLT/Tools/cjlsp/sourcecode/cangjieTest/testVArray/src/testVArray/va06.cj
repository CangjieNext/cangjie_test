/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray

func mergeArray2(a: Array<Int64>, b!: VArray<Int64, $3> = [1, 2, 3]) {
}

func test63() {
    var aa = mergeArray2([1, 2], b: [4, 5, 6])
}
