/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
<<<<<<< HEAD
    if (TestClass.f1() == 1 && TestClass.f_1() == 1 && global_func_01() && global_func_02()) {
=======
    if (
        TestClass.f1() == 1 && TestClass.f_1() == 1
    ) {
>>>>>>> upstream/dev
        return 0
    }
    return 1
}

