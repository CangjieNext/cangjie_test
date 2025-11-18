/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func mergeArray(a: VArray<Int64, $2>, b: VArray<Int64, $3>): VArray<Int64, $5> {
    return [1, 2, 3, 4, 5]
}

main() {
    var aa = mergeArray([1, 2], [1, 2, 3]) //expr mergeArray([1, 2], [1, 2, 3])
    let b1: VArray<Int64, $2> = [1, 2]
    let b2: VArray<VArray<Int64, $2>, $1> = [b1] //expr b2[0]
    var b4: VArray<VArray<Int64, $2>, $2> = [[1, 2], [3, 4]] //expr b4[0]
    let element1 = b4[1][0]
    0
}
