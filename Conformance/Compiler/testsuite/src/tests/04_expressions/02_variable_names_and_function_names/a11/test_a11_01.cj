/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_02_a11_01

  @Level:         1

  @Assertion: 4.2(11) For example:
    
    func add(i: Int64, j: Int64): Int64 { 
        return i + j;
    }

    func add<T>(i: T, j: T): T where T <: Add { 
        return i + j;
    }

    main(): Int64 {
        var plus = add // error: ambiguous function 'add' 
        return 0
    }

  @Description: Checks example from the Spec.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 0006340

*/

interface Add {
    operator func +(add: Add): Add 
}

func add(i: Int64, j: Int64): Int64 { 
    return i + j;
}

func add<T>(i: T, j: T): T where T <: Add { 
    return i + j;
}

main(): Int64 {
    var plus = add // error: ambiguous function 'add' 
    return 0
}
