// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: use.cj
// EXEC: %compiler %compile_lib_opt %cmp_opt %f -o define.%middle
// EXEC: %compiler define.%middle use.cj -o %output
// EXEC: %run %run_opt %output %run_args

package define

public func test<T>() {}

var a = test<Int64>
