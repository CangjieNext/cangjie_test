// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../MainReturnUIntNative
// EXEC: %compiler %cmp_opt %pkg_opt ./MainReturnUIntNative/src/p1 -o ./libp1.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt ./MainReturnUIntNative/src ./libp1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package d

internal import p1.*

main() {
    var a = a1
    var b = a
    UIntNative(32) - b
}
