// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler -p pkg %compile_lib_opt -o pkg.%middle
// EXEC: %compiler pkg.%middle main.cj -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg.Object as PObject

func a(): Object {
    return Object()
}

func b(): PObject {
    return PObject()
}

main() {
    a()
    b()
    return 0
}
