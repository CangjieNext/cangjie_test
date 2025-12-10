/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.9.2.8
  @Scene: delete
  @Visibility: used in public @Frozen declare
  @Object: struct static prop
  @Behavior: delete @Frozen
  @Expect: api compatible & abi incompatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Changed member property's annotation of struct visible outside the module. Frozen deleted.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]

// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: delete @Frozen
package test_stable_abi

public struct Rectangle {
    let width = 10
    static var a = 20

    public func getWidth(): Int64{
        return width
    }

    public static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    static mut prop getb: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}

public struct S1{
    static var a = 20
    @Frozen
    public static mut prop getb: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    @Frozen
    public func getgeta(){
        return geta
    }
}

public func f(){
    if(Rectangle.getb == 20 && S1.geta == 20){
        return 0
    }else{
        return 1
    }
}