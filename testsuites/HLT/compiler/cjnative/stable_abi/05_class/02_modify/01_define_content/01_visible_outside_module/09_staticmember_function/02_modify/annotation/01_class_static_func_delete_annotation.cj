/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.9.2.1
  @Scene: delete
  @Visibility: public
  @Object: class static func
  @Behavior: delete annotation
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

// test class: delete annotation
package test_stable_abi

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public class S1 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }

    static public func geta1() {
        return 0
    }

    static public func geta2() {
        return 0
    }

    static public func geta3() {
        return 0
    }
}

class S2 {
    let x: Int64 = 0
}


public class S3 {
    let x = S2()

    public func getX(): Int64 {
        return x.x
    }
        
    public func getY(): Int64 {
        return x.x
    }
}