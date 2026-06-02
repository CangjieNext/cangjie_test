/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main() {
    let tlv1 = ThreadLocal<Int64>()
    let res1 = spawn {
        tlv1.set()
        println(tlv1.get())
    }
    res1.get()
    return 0
}
// ASSERT: scan sema_wrong_number_of_arguments
