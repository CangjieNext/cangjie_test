/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.6.2.1
  @Scene: add
  @Visibility: used in public const declare
  @Object: struct static var
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


public struct Rectangle {
    static let width = 10

     @Version["1.1"]
    static let a1 = 20

    @Version["1.2"]
    static public let a2 = 20

    public func getWidth(): Int64{
        return width
    }
}


public struct Rectangle1 {
    static let width = 10

    @Version["1.3"]
    static const a7 = 20

    static const init() {
        let degree = 180
    }

    public const func getWidth(): Int64{
        return a7
    }
}

public struct Rectangle2 {
    static let width = 10
    static public let a8 = 20
    static let a9 = 200
    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle3 {
    static let width = 10

    @Version["1.4"]
    static const a9 = 20

    static const init() {
        let degree = 180
    }

    public const func getWidth(): Int64{
        return a9
    }
}

public func f(){
    var a = Rectangle2.a9
    var b = Rectangle3.a9
    if(a == 200 && b == 20){
        return 0
    }else{
        return 1
    }
}