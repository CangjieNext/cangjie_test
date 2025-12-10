/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.8.3.1
  @Scene: add
  @Visibility: public
  @Object: struct static func
  @Behavior: modify static function order
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

// test struct: modify static function order


package test_stable_abi

public struct Rectangle {
    let width = 10
    static let a1 = 20

    public func getWidth(): Int64{
        return width
    }

    static func gete(): Int64 {
        return a1
    }
    

    public static func geta(): Int64{
        return a1
    }

    @Frozen
    public static func getd() {
        let c = getc()
        return c
    }

    static func getc(): Int64 {
        return 30
    }
}

public func f(){
    if(Rectangle.geta() == 20 && Rectangle.getc() == 30 && Rectangle.gete() == 20){
        return 0
    }else{
        return 1
    }
}