/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.6.1.1
  @Scene: add
  @Visibility: public
  @Object: struct static var
  @Behavior: add static member variable
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: add static member variable
// 新增静态成员变量

package test_stable_abi


public struct Rectangle {
    let width = 10
    static let a1 = 20
    public static let height = 300

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle1 {
    let width = 10
    static let a1 = 20
    public static let height = 20

    public func getWidth(): Int64{
        return width
    }
}

public func f(){
    var a = Rectangle.height
    if(a == 300){
        return 0
    }else{
        return 1
    }

}