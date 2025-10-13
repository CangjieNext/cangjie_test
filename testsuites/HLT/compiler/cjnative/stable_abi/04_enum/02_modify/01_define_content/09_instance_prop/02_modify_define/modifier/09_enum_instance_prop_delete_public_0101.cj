/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 4.2.1.9.2.9
  @Scene: delete
  @Visibility: used in public @Frozen declare
  @Object: enum instance prop
  @Behavior: delete public
  @Expect: api incompatible & abi incompatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed member property's modifier of enum visible outside the module. public/mut/static deleted or mut/static added.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: modify access modifier: modify public
package test_stable_abi

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64 {
        return 11
    }

    public prop geta1: Int64 {
        get() {
            println("get")
            11
        }
    }

    prop geta2: Int64 {
        get() {
            println("get")
            11
        }
    }

    public prop geta3: Int64 {
        get() {
            println("get")
            11
        }
    }

    private prop geta4: Int64 {
        get() {
            println("get")
            11
        }
    }

    internal prop geta5: Int64 {
        get() {
            println("get")
            11
        }
    }

    prop geta6: Int64 {
        get() {
            println("get")
            11
        }
    }

    protected prop geta7: Int64 {
        get() {
            println("get")
            11
        }
    }

    public prop geta8: Int64 {
        get() {
            println("get")
            11
        }
    }

    prop geta9: Int64 {
        get() {
            println("get")
            11
        }
    }

    prop geta10: Int64 {
        get() {
            println("get")
            11
        }
    }
}

public enum S1 {
    AB

    public static prop geta: Int64 {
        get() {
            1
        }
    }

    static prop getb: Int64 {
        get() {
            1
        }
    }

    @Frozen
    public func f1() {
        getb
    }

    public prop getc: Int64 {
        get() {
            1
        }
    }

    internal prop getd: Int64 {
        get() {
            1
        }
    }

    @Frozen
    public func f2() {
        getd
    }
}
