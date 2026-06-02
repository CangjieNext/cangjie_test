// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: A B C

// EXEC:%compiler -p A %compile_lib_opt -o libA.%lib_extension
// EXEC:%compiler -p B %compile_lib_opt -o libB.%lib_extension
// EXEC:%compiler -p C %compile_lib_opt -o libC.%lib_extension
// EXEC:%compiler -p C %compile_lib_opt -o libC.%lib_extension
// (CJNATIVE)EXEC:%compiler main.cj libC.%lib_extension libB.%lib_extension libA.%lib_extension
// (not CJNATIVE)EXEC:%compiler main.cj libA.%lib_extension libB.%lib_extension libC.%lib_extension

internal import B.{a2 as a2b}
internal import C.{a2 as a2c}

main() {
    a2b()
    a2c()
    0
}
