/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    if (global_func_04() + global_func_14(0) + global_func_24(a: 0) +
        global_func_34(a: 0) + global_func_34() + global_func_05() +
        global_func_15(0) + global_func_25(a: 0) + global_func_35(a: 0) +
        global_func_35() + global_func_06() + global_func_16() +
        global_func_26() + global_func_36() + global_func_44(0, 0) +
        global_func_45(0, 0) + global_func_46(0, 0) + global_func_54(a: 0, b: 0) +
        global_func_55(a: 0, b: 0) + global_func_56(a: 0, b: 0) == 0) {
        return 0
    }
    return 1
}


