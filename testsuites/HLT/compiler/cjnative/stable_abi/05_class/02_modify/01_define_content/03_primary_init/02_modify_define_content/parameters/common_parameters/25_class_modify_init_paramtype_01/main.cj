/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    if (
        Public_PC(1).v1 == 1 && Public_PC(2).v1 == 2 &&
        Protected_PC().v1 == 1 && Internal_PC().v1 == 1 &&
        Private_PC().v1 == 1 && global2() is Rely_Frozen_PC &&
        Frozen_PC(1).v1 == 1 && Const_PC(1).v1 == 1
    ) {
        return 0
    }
    return 1
}


