/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output



foreign class A{
    public class a{} 
    public class b{} 
    private class c{} 
    protected class d{} 
    public open class e{} 
}

foreign{
class B{
    public class a{} 
    public class b{} 
    private class c{} 
    protected class d{} 
    public open class e{} 
}
}

















// ASSERT: scan unexpected class declaration in class body

// ASSERT: scan unexpected class declaration in class body
// ASSERT: regex-not no position error occurred
// ASSERT: scan parse_unexpected_declaration_in_scope
