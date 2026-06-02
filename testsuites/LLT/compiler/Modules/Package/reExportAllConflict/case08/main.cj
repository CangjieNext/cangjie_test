// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1.cj pkg2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.%middle
// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f pkg2.%middle pkg1.%middle
// (not CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f pkg1.%middle pkg2.%middle

public import pkg2.*

public var packageName = "pkg3"

main() {}
