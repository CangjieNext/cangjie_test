/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 

/*
  @No: 3.2.1.9.2.16
  @Scene: modify
  @Visibility: public
  @Object: struct static prop
  @Behavior: modify properties type
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

//the instance property is not public
package test_stable_abi

public struct S{
    var a = 0
    public mut prop p:Int64{
        get(){a}
        set(value){value}
    }
}

public struct struct_public_1 {

    public static mut prop prop_public_1: Int64 {
        get() { 0 }
        set(value) { value }
    }

    static mut prop prop_frozen_1: Int64 {
        get() { 0 }
        set(value) { value }
    }

    static mut prop prop_nonpublic_1: String {
        get() { "0" }
        set(value) { value }
    }
    @Frozen
    public func foo_frozen_1(){
        prop_frozen_1
        0
    }
}

struct struct_2{
    public static mut prop prop_public_2: Int64{
        get(){
            0
        }
        set(value){ value }
    }

    static mut prop prop_frozen_2:Int64{
        get(){
            0
        }
        set(value){ value }
    }

    static mut prop prop_nonpublic_2:Int64{
        get(){
            0
        }
        set(value){ value }
    }
}
public class class_out{
    let x : struct_2 = struct_2()
}
@Frozen
public func foo_frozen_2(){
    let x = struct_2.prop_frozen_2
    0
}

struct struct_const_3{
    public const init(){}
    public static mut prop prop_public_3: Int64{
        get(){
            0
        }
        set(value){ value }
    }

    static mut prop prop_frozen_3:Int64{
        get(){
            0
        }
        set(value){ value }
    }

    static mut prop prop_nonpublic_3:Int64{
        get(){
            0
        }
        set(value){ value }
    }

    @Frozen
    public func foo_frozen_3(){
        let x = prop_frozen_3
    }
}
public const func foo_const_3(){
    const x = struct_const_3()
}

struct struct_frozen_4{
    public static mut prop prop_public_4: Int64{
        get(){
            0
        }
        set(value){ value }
    }

    static mut prop prop_frozen_4:Int64{
        get(){
            0
        }
        set(value){ value }
    }

    static mut prop prop_nonpublic_4:Int64{
        get(){
            0
        }
        set(value){ value }
    }
}
@Frozen
public func foo_frozen_4(){
    let x = struct_frozen_4()
    let x2 = struct_frozen_4.prop_frozen_4
    0
}

struct struct_nonpublic_5{
    public static mut prop prop_5: Int64{
        get(){
            0
        }
        set(value){ value }
    }
}
