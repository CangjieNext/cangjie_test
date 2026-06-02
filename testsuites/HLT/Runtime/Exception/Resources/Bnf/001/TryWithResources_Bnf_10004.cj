/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A <: Resource {
    public func isClosed():Bool{false}
    public func close():Unit{print("A!")}
    public func test():Unit{print("I am A.\n")}
}

class B <: Resource {
    public func isClosed():Bool{false}
    public func close():Unit{print("B!")}
    public func test():Unit{print("I am B.\n")}
}

main() {
    try (a = A(),a = B()) 
    {a.test()}
    print("success!\n")
    return 0
}
// ASSERT: scan parse_redefined_resource_name
