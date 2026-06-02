// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg1.cj pkg2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.a
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.a
// EXEC: %compiler %f pkg2.a pkg1.a -o %n.%suffix

import pkg2.*

main() {
}
