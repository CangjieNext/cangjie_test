/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    let m = S1()
    let n = S3()
    assert(m.getX(), 0)
    assert(S1.geta1(), 0)
    assert(S1.geta2(), 0)
    assert(S1.geta3(), 0)
    assert(n.getX(), 0)
    assert(n.getY(), 0)
    checker(m, n)
}


