/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.9.2.2
  @Scene: modify
  @Visibility: public|non public|used in public @Frozen declare
  @Object: struct static prop
  @Behavior: modify annotation
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

// test struct: modify annotation
package test_stable_abi


@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public struct Rectangle {
    let width = 10
    static var a = 20

    public func getWidth(): Int64{
        return width
    }

    static mut prop geta: Int64 {
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

    @Version["1.2"]
    public static mut prop getb1: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    @Version["2.2"]
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

    @Version["3.2"]
    static mut prop getb2: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}


public struct S2{
    static var a = 20

    public static prop getb1: Int64 {
        get() {
            a
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

    static prop getb2: Int64 {
        get() {
            a
        }
    }
}

public func f(){
    if(S1.geta == 20 && S1.getb2 == 20){
        return 0
    }else{
        return 1
    }
}