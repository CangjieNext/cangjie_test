/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 4.2.1.10.2
  @Scene: add
  @Visibility: public | non publuc | used in public const declare
  @Object: enum
  @Behavior: add constructor for non-exhausitive enum
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

// 给⼀个 non-exhausitive 的enum 类型新增⼀个构造器

package test_stable_abi

public enum RGBColor {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

enum Testb {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

public enum Testc {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

public enum S7 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S8 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S9 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

public class C1 {
    let v1 = S8.Red

    const init() {
        let v3 = 0
    }

    public const func f1() {
        let v2 = S9.Green
    }
}

public enum SS7 {
    | Red | Green | Blue | yellow | ...

    public func getX(): Int64 {
        return 11
    }
}

enum SS8 {
    | Red | Green | Blue | yellow | ...

    public func getX(): Int64 {
        return 11
    }
}

enum SS9 {
    | Red | Green | Blue | yellow | ...

    public func getX(): Int64 {
        return 11
    }
}

public class CC1 {
    let v1 = SS8.Red

    const init() {
        let v3 = 0
    }

    public const func f1() {
        let v2 = SS9.Green
    }
}
