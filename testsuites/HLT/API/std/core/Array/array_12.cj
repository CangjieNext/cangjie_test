/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class ClassA {}

open class ClassB <: ClassA {}

class ClassC <: ClassA {}

class ClassD <: ClassB {}

main(): Int64 {
    var b = ClassB()
    var c = ClassC()
    var d = ClassD()
    let arr: Array<ClassA> = [b, c, d, ClassA()]
    return 0
}
