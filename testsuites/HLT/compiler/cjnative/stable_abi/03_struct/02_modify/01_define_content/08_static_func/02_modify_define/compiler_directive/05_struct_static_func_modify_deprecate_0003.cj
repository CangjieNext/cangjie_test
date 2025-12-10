/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.8.2.5
  @Scene: modify
  @Visibility: used in public const declare
  @Object: struct static func
  @Behavior: modify @Deprecated, error -> warning
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

// test struct: modify @Deprecated
// modify operation: modify @Deprecated: error -> warning
package test_stable_abi


public struct Rectangle {
    static let width = 10

    public func getWidth(): Int64{
        return width
    }
    static const func geta1() {
        return 0
    }

    public static func geta2() {
        return 1
    }

    @Deprecated["this function is deprecated", strict: false]
    static func geta3() {
        return 2
    }

    @Deprecated["this function is deprecated", strict: false]
    public static func geta4() {
        return 3
    }

    @Deprecated["this function is deprecated", strict: true]
    public static func geta5() {
        return 4
    }

    public static const func geta6() {
        const a = geta1()
        return a
    }

    @Deprecated["this function is deprecated", strict: false]
    static const func geta7() {
        return 5
    }

    public func geta8() {
        const b = geta7()
        return b
    }

    static func geta9() {
        return 1
    }

    @Deprecated["this function is deprecated", strict: true]
    static func geta10() {
        return 4
    }

    @Deprecated["this function is deprecated", strict: false]
    static const func geta11() {
        return 5
    }

    @Deprecated["this function is deprecated", strict: false]
    public static const func geta12() {
        const b = geta11()
        return b
    }
}

public func f(){
    if(Rectangle.geta1() == 0 && Rectangle.geta9() == 1 && Rectangle.geta3() == 2 && Rectangle.geta11() == 5){
        return 0
    }else{
        return 1
    }
}