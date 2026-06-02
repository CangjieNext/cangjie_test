// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %frontendCompiler %disableCodegen %cmp_opt %f

open class CA {
    public let member: Int32 = 111
}

func foo<T>(a: T) where T <: CA {
    var b: Int32 = a.member
    return b
}

class CB <: CA {}

main() {
    var a: Int32 = foo<CB>(CB())
    return 0
}
