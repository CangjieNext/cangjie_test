// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testa.cj, testb.cj
// EXEC: %compiler %import-cangjie-stdx testa.cj -o testa.%middle %compile_lib_opt
// EXEC: %compiler %import-cangjie-stdx testb.cj -o testb.%middle %compile_lib_opt
// (CJNATIVE) EXEC-0: %compiler  %f testa.%middle %import-cangjie-stdx testb.%middle
// (not CJNATIVE) EXEC-0: %compiler %f testb.%middle testa.%middle %import-cangjie-stdx

import pkg1.*
import pkg2.JsonSerializable

main() {
    var a: JsonSerializable
    0
}
