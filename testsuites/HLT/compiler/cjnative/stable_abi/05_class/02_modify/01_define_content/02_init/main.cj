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
        Public_C().v1 == 1 && Public_C(2).v1 == 2 &&
        Protected_C().v1 == 1 && Internal_C().v1 == 1 &&
        Private_C().v1 == 1 && global1() is Rely_Frozen_C &&
        Deprecated_C1(1).v1 == 1 &&
        Frozen_C(1).v1 == 1 && Const_C(1).v1 == 1 &&
        Generics_C1<Int64, Int64, Son>(1, b:1, c:Son()) is Generics_C1<Int64, Int64, Son> &&
        Generics_C2<Int64, String, Father>(1, "", Father()) is Generics_C2<Int64, String, Father> &&
        Param_C1(1, b: 1) is Param_C1 && Param_C2(Son(), b: Son()) is Param_C2 &&
        Param_C3(Father(), b: Father()) is Param_C3
    ) {
        return 0
    }
    return 1
}


