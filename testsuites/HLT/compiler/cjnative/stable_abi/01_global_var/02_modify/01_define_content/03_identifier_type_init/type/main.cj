/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    if (global_var_04.test() + global_var_14.test() == 0 &&
        global_var_05 && global_var_15 && global_func_01() && global_func_11()) {
        return 0
    }
    return 1
}


