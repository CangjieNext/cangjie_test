/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    assert(Rectangle.geta() is I, true)
    assert(Rectangle.getb() is I, true)
    assert(Rectangle.getc() is Addable, true)
    assert(Rectangle.getd() is Subtractable, true)
    assert(Rectangle.gete() is Subtractable, true)
}
