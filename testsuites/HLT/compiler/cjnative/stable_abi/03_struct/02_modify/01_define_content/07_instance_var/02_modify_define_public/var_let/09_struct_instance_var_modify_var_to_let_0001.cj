/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.7.2.8
  @Scene: modify
  @Visibility: public
  @Object: struct instance var
  @Behavior: modifier: let to var
  @Expect: api incompatible & abi incompatible
*/

// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-2 [API/ABI] Modified member variables' non-access modifier for struct visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-2 [API/ABI]

// test struct: modify access modifier: var to let

package test_stable_abi

public struct Rectangle {
    public let a1 = 20
    let a2 = 20
    let a3 = 20

    @Frozen
    public func getWidth1(): Int64{
        return a3
    }

    public let a4 = 20
    let a5 = 20
    let a6 = 20

    @Frozen
    public func getWidth2(): Int64{
        return a6
    }

}

public func f(){
    var a = Rectangle()
    if(a.a2 == 20 && a.a3 == 20 && a.a5 == 20 && a.a6 == 20){
        return 0
    }else{
        return 1
    }
}