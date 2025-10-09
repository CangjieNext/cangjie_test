/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.2.1
  @Scene: add
  @Visibility: public |used in public const declare | used in public struct/class instance var
  @Object: enum
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
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible!
// ASSERT: scan-3 [API/ABI] Added enum deprecated annotation with compilation error.
// ASSERT: scan-1 [API/ABI] Added class deprecated annotation with compilation error.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-4 [API/ABI]

// test enum: add @Deprecated
package test_stable_abi

public enum S1 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: false]
enum S2 {
    | Red | Green | Blue(UInt8)
}


@Deprecated["this enum is deprecated", strict: false]
public enum S3 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 10
    }
}

enum S4 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: true]
public enum S5 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: true]
enum S6 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: true]
public enum S7 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: true]
enum S8 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: true]
enum S9 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: true]
public class C1 {
    let v1 = S8.Red

    const init() {
        let v3 = 0
    }

    public const func f1() {
        let v2 = S9.Green
    }
}

@Deprecated["this enum is deprecated", strict: false]
public enum S10 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: false]
enum S11 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: false]
enum S12 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: false]
public class C2 {
    let v1 = S11.Red

    const init() {
        let v3 = 0
    }

    public const func f1() {
        let v2 = S12.Green
    }
}