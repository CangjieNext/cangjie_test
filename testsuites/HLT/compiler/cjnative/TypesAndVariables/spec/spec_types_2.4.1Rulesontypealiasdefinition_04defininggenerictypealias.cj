/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



class GenericClassA<T, V>{
}
class GenericClassB<T, V>{
}
class GenericClassC<T, V>{
}
class MyTrait{}
type Class1<V> where V <: MyTrait = GenericClassA<Int64, V>
type Class2<V> = GenericClassB<Int64, V> where V <: MyTrait 
type Class3<V> = GenericClassC<Int64, V>

func foo<V> (p: Class3<V>) where V <: MyTrait {
}

class ClassWithLongName<T> where T<:MyTrait {
}
type Class<T> = ClassWithLongName<T>

main(){
    return 0
}
// ASSERT: scan parse_expected_assignment
// ASSERT: scan parse_expected_type
// ASSERT: scan parse_expected_character
