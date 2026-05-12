/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    check()
    assert(Rectangle().getWidth(), 10)
    assert(Rectangle().geta1(), 20)
    assert(Rectangle().geta3(), 20)
    assert(Rectangle().geta8(), 20)
    unsafe{ assert(Rectangle().geta11(), 20) }
    assert(Rectangle().geta15(), 20)
}


