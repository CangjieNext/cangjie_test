/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package worktest

public import member_a.*
public import member_b.*

main(): Int64 {
    println("workspace root built")
    helloFromA()
    helloFromB()
    return 0
}
