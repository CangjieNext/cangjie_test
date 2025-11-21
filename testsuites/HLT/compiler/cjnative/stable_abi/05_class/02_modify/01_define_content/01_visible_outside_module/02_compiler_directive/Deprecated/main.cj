/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    let b1 = B1()
    let bg1 = BG1<UInt64>()

    let c1 = C1()
    let cg1 = CG1<Int64>()
    checker(b1, bg1, c1, cg1)
}


