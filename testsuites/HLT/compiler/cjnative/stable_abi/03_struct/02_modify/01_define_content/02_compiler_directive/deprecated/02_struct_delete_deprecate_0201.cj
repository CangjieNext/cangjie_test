/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.2.2
  @Scene: delete
  @Visibility: non public
  @Object: struct
  @Behavior: delete @Deprecated
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

// test struct: delete @Deprecated

package test_stable_abi

// struct类型S1是public修饰，模块外可见，会参与下游模块的编译过程
public struct S1 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

// struct类型S2虽然无public修饰，模块外不可见，但也会参与下游模块的编译过程。原因在于S2用于定义S3中的x成员变量类型，产生依赖
@Deprecated["this struct is deprecated", strict: false]
struct S2 {
    let x: Int64 = 0
}


@Deprecated["this struct is deprecated", strict: false]
public struct S3 {
    let x: S2 = S2()

    public func getX(): Int64 {
        return x.x
    }
}

struct S4 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

@Deprecated["this struct is deprecated", strict: true]
public struct S5 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

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

struct S8 {
    let x: Int64 = 0
}

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
    let x: S10 = S10()

    public func getX(): Int64 {
        return x.x
    }
}

@Deprecated["this struct is deprecated", strict: false]
public struct S12 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

@Deprecated["this struct is deprecated", strict: false]
struct S13 {
    let x: Int64 = 0
}

@Deprecated["this struct is deprecated", strict: false]
public struct S14 {
    let x: S13 = S13()

    public func getX(): Int64 {
        return x.x
    }
}

@Deprecated["this struct is deprecated", strict: false]
struct S15 {
    let x: Int64 = 0
}

@Deprecated["this struct is deprecated", strict: false]
public struct S16 {
    let x: S15 = S15()

    public func getX(): Int64 {
        return x.x
    }
}

@Deprecated["this struct is deprecated", strict: true]
struct S17 {
    let x: Int64 = 0
} 

@Deprecated["this struct is deprecated", strict: true]
public struct S18 {
    let x: S17 = S17()

    public func getX(): Int64 {
        return x.x
    }
}


@Deprecated["this struct is deprecated", strict: true]
struct S19 {
    let x: Int64 = 0
} 

@Deprecated["this struct is deprecated", strict: true]
public struct S20 {
    let x: S19 = S19()
    
    @Frozen
    public func getX(): Int64 {
        return x.x
    }
}

@Deprecated["this struct is deprecated", strict: true]
struct S21 {
    public const init() {}
    let x: Int64 = 0
    
}

@Deprecated["this struct is deprecated", strict: true]
public struct S22 {

     public const init() {}
    public const func getX(): Int64 {
        let x = S21()
        return 0
    }
}

@Deprecated["this struct is deprecated", strict: false]
struct S23 {
    let x: Int64 = 0
    public const init() {}
}


public struct S24 {

     public const init() {}
    public const func getX(): Int64 {
        let x = S23()
        return 0
    }
}


struct S25 {
    let x: Int64 = 0
    public const init() {}
}


public struct S26 {

    public const init() {}
    public const func getX(): Int64 {
        let x = S25()
        return x.x
    }

}

@Deprecated["this struct is deprecated", strict: false]
struct S27 {
    let x: Int64 = 0
}
