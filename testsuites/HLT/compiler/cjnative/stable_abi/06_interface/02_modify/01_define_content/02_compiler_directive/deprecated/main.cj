/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    if (I1.typename() == "interface I1" && I2.typename() == "interface I2" &&
        G1<Int64>.typename() == "interface G1<T>" && G2<String>.typename() == "interface G2<T>") {
        0
    } else {
        1
    }
}


