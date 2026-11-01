/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func wrapMatrix(): Array<Array<Int64>> {
    let matrix: Array<Array<Int64>>=[[1,2],[3,4]]
    return matrix
}

func deep(): Array<Array<Array<Int64>>> {
    let cube: Array<Array<Array<Int64>>>=[[[1,2]],[[3,4]]]
    return cube
}

var shifted=8>>2
var shifted2=1>>  2

main() {
    let m=wrapMatrix()
    println(m.size+deep().size+shifted+shifted2)
}
