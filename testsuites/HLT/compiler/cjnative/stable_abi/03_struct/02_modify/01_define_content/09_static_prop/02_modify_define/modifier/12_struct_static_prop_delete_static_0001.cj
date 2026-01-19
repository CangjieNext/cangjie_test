/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.9.2.12
  @Scene: delete
  @Visibility: public
  @Object: struct static prop
  @Behavior: delete static
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
// ASSERT: scan-1 [API/ABI] Changed member property's modifier of struct visible outside the module. public/mut/static deleted or mut/static added.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: modify access modifier: Invisible to Invisible
package test_stable_abi

public struct Rectangle {
    static let width = 10
    static var a = 20

    public func getWidth(): Int64{
        return width
    }

    public static mut prop geta1: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    static mut prop geta2: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    public static mut prop geta3: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    private static mut prop geta4: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    internal static mut prop geta5: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    static mut prop geta6: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    protected static mut prop geta7: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    public static mut prop geta8: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    static mut prop geta9: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    static mut prop geta10: Int64 {
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
    static var b = 20
    static var c = 20
    static var d = 20
    static var e = 20
    static var f = 20

    public static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    public mut static prop getb: Int64 {
        get() {
            b
        }
        set(value) {
            b = value
        }
    }

    @Frozen
    public func f1(){
        getb
    }

    public static mut prop gete: Int64 {
        get() {
            e
        }
        set(value) {
            e = value
        }
    }

    static mut prop getf: Int64 {
        get() {
            f
        }
        set(value) {
            f = value
        }
    }

    @Frozen
    public func f3(){
        getf
    }


    public prop getc: Int64 {
        get() {
            c
        }
    }

    static prop getd: Int64 {
        get() {
            f
        }
    }

    @Frozen
    public func f4(){
        getd
    }
}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    assert(Rectangle.geta5, 20)
    assert(Rectangle.geta6, 20)
    assert(Rectangle.geta7, 20)
    assert(Rectangle.geta9, 20)
    assert(Rectangle.geta10, 20)
    return 0
}