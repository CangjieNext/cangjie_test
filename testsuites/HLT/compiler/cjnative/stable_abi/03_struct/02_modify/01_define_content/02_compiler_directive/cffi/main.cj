/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    let m: S1 = S1()
    let n: S3 = S3()

    if (m.getX() != 0 || n.getX() !=0) {
        return 1
    }

    return 0
}


