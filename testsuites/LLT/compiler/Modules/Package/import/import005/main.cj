// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: M1
// EXEC: %compiler %cmp_opt %mod_name_opt M1 %compile_lib_opt M1/A.cj -o M1/A.%middle
// DEPENDENCE: M2
// EXEC: %compiler %cmp_opt %mod_name_opt M2 %compile_lib_opt M2/B.cj -o M2/B.%middle
// (CJNATIVE) EXEC:%compiler %cmp_opt M2/B.%middle %n.cj M1/A.%middle -o %output
// (not CJNATIVE) EXEC:%compiler %cmp_opt M1/A.%middle M2/B.%middle %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

internal import M2.B.*

main() {
    var a: b<Rune> = 0
    var b = a + 1
    return 0
}
