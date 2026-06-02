// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: M1
// EXEC: %compiler %compile_lib_opt -p M1/p1 -o M1/pkg.%middle
// EXEC: cd M1 && %cpfile M1.pkg.cjo M1.pkg1.cjo && %cpfile M1.pkg.cjo M1.pkg2.cjo && %cpfile M1.pkg.cjo M1.pkg3.cjo && cd ..
// ERRCHECK: %compiler %noColor M1/pkg.%middle %f

import M1.pkg1.*
import M1.pkg.*
import M1.pkg2.*
import M1.pkg3.*
import M1.pkg.*

main() {
    return 0
}

/* SCAN
error: The imported cjo file failed verification, the package name is M1.pkg which is not 'M1.pkg1'
  ==> main.cj:12:8:
   | 
12 | import M1.pkg1.*
   |        ^^^^^^^ 
   | 

error: The imported cjo file failed verification, the package name is M1.pkg which is not 'M1.pkg2'
  ==> main.cj:14:8:
   | 
14 | import M1.pkg2.*
   |        ^^^^^^^ 
   | 

error: The imported cjo file failed verification, the package name is M1.pkg which is not 'M1.pkg3'
  ==> main.cj:15:8:
   | 
15 | import M1.pkg3.*
   |        ^^^^^^^ 
   | 

3 errors generated, 3 errors printed.
*/
