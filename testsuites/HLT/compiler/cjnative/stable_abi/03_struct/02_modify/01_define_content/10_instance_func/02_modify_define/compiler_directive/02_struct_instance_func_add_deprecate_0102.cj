/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.10.2.2
  @Scene: add
  @Visibility: used in public @Frozen declare
  @Object: struct instance func
  @Behavior: add @Deprecated, strict: true
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
// ASSERT: scan-2 [API/ABI] Changed member function's annotation of struct visible outside the module. Deprecated strict added.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-2 [API/ABI]

// test struct: add @Deprecate with public member function: Unavailable
package test_stable_abi


public struct Rectangle {
    static let width = 10

    public func getWidth(): Int64{
        return width
    }

    @Deprecated["this function is deprecated", strict: true]
    func geta1() {
        return 0
    }

    public func geta2() {
        return 1
    }

    @Deprecated["this function is deprecated", strict: false]
    func geta3() {
        return 2
    }

    @Deprecated["this function is deprecated", strict: false]
    public func geta4() {
        return 3
    }

    @Deprecated["this function is deprecated", strict: true]
    public func geta5() {
        return 4
    }

    @Frozen
    @Deprecated["this function is deprecated", strict: true]
    public func get5() {
        let x = geta1()
        return x
    }

    @Frozen
    public func get6() {
        let x = geta3()
        return x
    }
}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    assert(Rectangle().geta3(), 2)
    assert(Rectangle().geta4(), 3)
    return 0
}

