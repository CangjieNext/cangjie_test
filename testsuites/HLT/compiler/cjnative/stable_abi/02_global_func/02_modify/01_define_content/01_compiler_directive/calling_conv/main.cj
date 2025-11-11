/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    unsafe {
<<<<<<< HEAD
        if (global_func_10() + global_func_11() + global_func_12() + global_func_13() + global_func_14() +
            global_func_15() + global_func_16() + global_func_17() + global_func_18() + global_func_19() + global_func_20() + global_func_21() == 0) {
=======
        if (global_func_10() + global_func_11() + global_func_12() +
            global_func_13() + global_func_14() + global_func_15() +
            global_func_16() + global_func_17() + global_func_18() == 0) {
>>>>>>> upstream/dev
            return 0
        }
    }
    return 1
}


