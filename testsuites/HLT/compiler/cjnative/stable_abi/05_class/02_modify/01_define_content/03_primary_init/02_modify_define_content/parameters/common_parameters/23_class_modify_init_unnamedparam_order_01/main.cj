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
        Frozen_PC(1).v1 == 1 && Const_PC(1).v1 == 1 &&
        Generics_PC1<Int64, Int64, Son>(1, b:1, c:Son()) is Generics_PC1<Int64, Int64, Son> &&
        Generics_PC2<Int64, String, Father>(1, "", Father()) is Generics_PC2<Int64, String, Father> &&
        Param_PC1(1, b: 1, c: 2, d: 3, e: 4) is Param_PC1 && Param_PC2(1, 1) is Param_PC2
    ) {
        return 0
    }
    return 1
}


