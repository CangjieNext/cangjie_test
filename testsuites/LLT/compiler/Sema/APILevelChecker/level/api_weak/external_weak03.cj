// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../apilevel.cj dep.cj dep1.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// EXEC: %compiler %cmp_opt %compile_shared_lib_opt dep.cj apilevel.%middle -o libdep.%dylib_suffix
// EXEC: %compiler -ldep -L. %f apilevel.%middle --cfg=APILevel_level=22 -o %output %dump-ir -j1
// EXEC: %rmfile libdep.%dylib_suffix
// EXEC: %compiler %cmp_opt %compile_shared_lib_opt dep1.cj apilevel.%middle -o libdep.%dylib_suffix
// EXEC: %cat external_weak03_IR/9_EraseUselessInstsAndDecls/0-default.ll 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args

import dep.*

class A <: C2 {}

main() {
    A().foo1()
    0
}

// ASSERT: scan declare extern_weak void @_CN3dep2C23fooHv
// ASSERT: scan declare void @_CN3dep2I14foo1Hv
