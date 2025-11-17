/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    assert(E11.Red.g(), 1)
    assert(E11.Green.g(), 1)
    assert(E11.Blue(1).g(), 1)
    assert(E21.Red.g(), 1)
    assert(E21.Green.g(), 1)
    assert(E21.Blue.g(), 1)
    check()
}
