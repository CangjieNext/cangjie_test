/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.7.2.1
  @Scene: modify
  @Visibility: public
  @Object: interface prop
  @Behavior: modify annotation
  @Expect: api compatible & abi compatible
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

package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
@Annotation
public class Version1 {
    let code: String
    const init(code: String) { this.code = code }
}
@Annotation
public class Version2 {
    let code: String
    const init(code: String) { this.code = code }
}
public interface I {
    @Version1["2"]
    static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    @Version2["2"]
    mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
    @Version2["2"]
    static mut prop p3: Int64
    @Version1["2"]
    mut prop p4: Int64
}
public class C <: I {
    public static mut prop p3: Int64 {
        get() {1}
        set(v) {v}
    }
    public mut prop p4: Int64 {
        get() {1}
        set(v) {v}
    }
}
