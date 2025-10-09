/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.2.6
  @Scene: add
  @Visibility: non public
  @Object: struct
  @Behavior: add @C
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

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Added struct C attribute without unsafe compilation error.
// ASSERT: scan-1 [ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]

// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args


// test struct: add @C
package test_stable_abi

@C
public struct S1 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

struct S2 {
    let x: Int64 = 0
}


public struct S3 {
    let x: S2 = S2()

    public func getX(): Int64 {
        return x.x
    }
}

public struct S4 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

struct S5 {
    let x: Int64 = 0
}

public struct S6 {
    let x: S5 = S5()

    @Frozen
    public func getX(): Int64 {
        return x.x
    }
}

@C
struct S7 {
    let x: Int64 = 0
}

@C
public struct S8 {
    let x: S7 = S7()

    public func getX(): Int64 {
        return x.x
    }
}

@C
struct S9 {
    let x: Int64 = 0
}

@C
public struct S10 {
    let x: S9 = S9()

    @Frozen
    public func getX(): Int64 {
        return x.x
    }
}


@C
struct S11 {
    let x: Int64 = 0
}

@C
struct S12 {
    let x: Int64 = 0
}

public struct S13 {
    let x: Int64 = 0
}


@C
struct S14 {
    let x: Int64 = 0
    public const init() {}
}


public struct S15 {

    public const init() {}
    public const func getX(): Int64 {
        let x = S14()
        return x.x
    }

}


@C
struct S16 {
    let x: Int64 = 0
    public const init() {}
}


public struct S17 {

    public const init() {}
    public const func getX(): Int64 {
        let x = S16()
        return x.x
    }

}