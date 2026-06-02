// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test setting of CANGJIE_HOME works.
// We create a fake CANGJIE_HOME which contains core.cjo only, and then we import any other std
// package (in the testcase, package collection is chosen). If CANGJIE_HOME is set correctly,
// an error should be raised since .cjo of collection package should not be found.

// (Linux) EXEC: CANGJIE_HOME=cjhome; mkdir -p %libdir/std
// (Linux) EXEC: CANGJIE_HOME=$(dirname `which cjc`)/..; REAL_LIBDIR=%libdir; CANGJIE_HOME=cjhome; cp -f $REAL_LIBDIR/std/std.core.cjo %libdir/std
// (Linux) EXEC: echo $CANGJIE_PATH
// (Linux) EXEC: export CANGJIE_HOME=cjhome; export CANGJIE_PATH=; %compiler %f 2>&1 | compare %f

// (Windows) EXEC: mkdir cjhome\modules\%libversion\std\
// (Windows) EXEC: for /f "delims=" %i in ('where.exe cjc') do copy %libdir\std\std.core.cjo cjhome\modules\%libversion\std\
// (Windows) EXEC: set CANGJIE_HOME=.\cjhome&&set CANGJIE_PATH=&&%compiler %f 2>&1 | compare %f

import std.collection.*

main() {
    return 0
}

/* SCAN
[31merror[0m: can not find package 'std.collection'
  [36m==>[0m test.cj:21:8:
   [36m| [0m
[36m21[0m [36m| [0mimport std.collection.*[0m
   [36m| [0m       [31m^^^^^^^^^^^^^^ [0m
   [36m| [0m
   [36m#[0m [0mhelp[0m: check if the .cjo file of the package exists in CANGJIE_PATH or CANGJIE_HOME, or use '--import-path' to specify the .cjo file path

1 error generated, 1 error printed.
*/
