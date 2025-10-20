/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    return Red.getWidth() + Red.geta("test", b: -1) + Red.geta2() + Red.geta3(0, b: 0) + Red.geta5() + Red.geta6(0, 0.0) + Red.geta8() + Red.geta10(0, 0.0) - 17
}


