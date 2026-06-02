// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../a ../b
// EXEC: %compiler -p %compile_lib_opt a
// EXEC: %compiler -p %compile_lib_opt b
// EXEC: %compiler -p %compile_lib_opt .

package c

internal import b.*

main() {
    var a = A()
    return 0
}
