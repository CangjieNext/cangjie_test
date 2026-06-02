/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %compile_lib_opt %f
// EXEC: %ls *%n.%middle

main(): Int64 {
    return run()
}

func run(): Int64 {
    var b: Base = Base()
    return 0
}

class Base {
    public var a: Int32 = 3
}
