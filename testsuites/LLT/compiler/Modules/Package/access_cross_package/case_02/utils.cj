// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: prod
// EXEC: %compiler %compile_lib_opt %f -o libutils.%middle
// EXEC: %compiler %cmp_opt -p prod libutils.%middle

package justtest

protected func fileExists(): Bool {
    false
}
