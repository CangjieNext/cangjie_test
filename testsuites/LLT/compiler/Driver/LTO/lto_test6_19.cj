// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

internal import std.random.*

main() {
    let r1: Random = Random(3)
    let r2: Random = Random(3)
    /* 创建 Random 对象并设置种子来获取随机对象 */
    let a: Int8 = r1.nextInt8()
    let b: Int8 = r2.nextInt8()
    if (a == b) {
        return 0
    }
    return 1
}
