/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.1.1
  @Scene: add
  @Visibility: non public
  @Object: struct
  @Behavior: add annotation
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


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: add annotation
package test_stable_abi

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}
// struct类型S1是public修饰，模块外可见，会参与下游模块的编译过程
public struct S1 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

// struct类型S2虽然无public修饰，模块外不可见，但也会参与下游模块的编译过程。原因在于S2用于定义S3中的x成员变量类型，产生依赖
struct S2 {
    let x: Int64 = 0
}


public struct S3 {
    let x: S2 = S2()

    public func getX(): Int64 {
        return x.x
    }
}

@Version["1.12"]
struct S4 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

@Version["1.1"]
public struct S5 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

@Version["1.2"]
struct S6 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

public struct S7 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

@Version["1.3"]
struct S8 {
    let x: Int64 = 0
}

@Version["1.3"]
public struct S9 {
    let x: S8 = S8()

    public func getX(): Int64 {
        return x.x
    }
}

struct S10 {
    let x: Int64 = 0
}


public struct S11 {
    
    @Frozen
    public func getX(): Int64 {
        let x = S10().x
        return 0
    }

}

struct S12 {
    let x: Int64 = 0
    public const init() {}
}


public struct S13 {

    public const init() {}

    static const x = S12()

}
