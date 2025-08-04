/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.3.3
  @Scene: modify
  @Visibility: non public
  @Object: struct
  @Behavior: modifier: keep non public
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
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

// test struct: add access modifier: Invisible to Invisible
package test_stable_abi

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

private struct S4 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

internal struct S5 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

// add internal
internal struct S6 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

protected struct S7 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

public struct S8 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

// add private
private struct S9 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

// add protected
protected struct S10 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

public struct S11 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}
