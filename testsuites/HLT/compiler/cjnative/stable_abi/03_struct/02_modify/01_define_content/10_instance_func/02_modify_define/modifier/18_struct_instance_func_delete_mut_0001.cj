/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.10.2.18
  @Scene: delete
  @Visibility: public
  @Object: struct instance func
  @Behavior: modifier: delete mut
  @Expect: api compatible & abi incompatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Changed member function's modifier of struct visible outside the module. mut deleted.
// ASSERT: scan-1 [ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]

// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: delete access modifier with public: mut
package test_stable_abi

public struct Rectangle {
    static let width = 10
    let a = 20

    public const init() {}

    public func getWidth(): Int64{
        return width
    }

    public func geta1() {
        return a
    }

    func geta2() {
        return a
    }

    public func geta3() {
        return a
    }

    private func geta4() {
        return a
    }

    internal func geta5() {
        return a
    }

    func geta6() {
        return a
    }

    protected func geta7() {
        return a
    }

    public func geta8() {
        return a
    }

    func geta9() {
        return a
    }

    func geta10() {
        return a
    }

    unsafe public func geta11() {
        return a
    }

    public func geta12() {
        return a
    }

    @Frozen
    public func geta13() {
        let x = geta2()
        return x
    }

    const func geta14() {
        return a
    }

    public const func geta15() {
        let x = geta14()
        return x
    }

    mut func geta16() {
        return a
    }

    @Frozen
    public mut func geta17() {
        let x = geta16()
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
    return 0
}