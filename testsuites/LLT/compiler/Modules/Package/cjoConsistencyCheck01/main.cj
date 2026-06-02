// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: M1
// (Linux) EXEC: %compiler %compile_lib_opt -p M1/p1 -o M1/pkg.%middle
// (Linux) EXEC: cp M1/M1.pkg.cjo M1/M1.Pkg.cjo
// (Linux) EXEC: cp M1/M1.pkg.cjo M1/M1.PkG.cjo
// (Linux) EXEC: cp M1/M1.pkg.cjo M1/M1.PKG.cjo
// (Linux) ERRCHECK: %compiler %noColor M1/pkg.%middle %f

import M1.Pkg.f1
import M1.Pkg.*

main() {
    return 0
}

/* SCAN
error: The imported cjo file failed verification, the package name is M1.pkg which is not 'M1.Pkg'
  ==> main.cj:14:8:
   | 
14 | import M1.Pkg.f1
   |        ^^^^^^ 
   | 

error: The imported cjo file failed verification, the package name is M1.pkg which is not 'M1.Pkg'
  ==> main.cj:15:8:
   | 
15 | import M1.Pkg.*
   |        ^^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/
