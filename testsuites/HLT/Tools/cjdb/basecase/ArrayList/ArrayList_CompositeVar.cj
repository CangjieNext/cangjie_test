/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class A {
    // ArrayList<String>
    var ss:String = """
                    Hello
                    CangJie!
                    """
    let Arrlist_str: ArrayList<String> = ArrayList<String>(["hello","Cangjie",ss])
    
    // ArrayList<Array<>>
    let Arrlist_Arr: ArrayList<Array<String>> = ArrayList<Array<String>>([["hello","Cangjie"],["hello","Cangjie"]])
    let Arrlist_Arrlist: ArrayList<ArrayList<String>> = ArrayList<ArrayList<String>>([ArrayList<String>(["hello","Cangjie"]),ArrayList<String>(["hello","Cangjie"])])
    let Arrlist_Hset: ArrayList<HashSet<Rune>> = ArrayList<HashSet<Rune>>([HashSet<Rune>([r'c',r'a']),HashSet<Rune>([r'n',r'g'])])
    let Arrlist_Hmap: ArrayList<HashMap<Bool,String>> = ArrayList<HashMap<Bool,String>>([HashMap<Bool,String>((true,"cangjie"))])
}

struct B {
    // ArrayList<String>
    var ss:String = """
                    Hello
                    CangJie!
                    """
    let Arrlist_str: ArrayList<String> = ArrayList<String>(["hello","Cangjie",ss])
    
    // ArrayList<Array<>>
    let Arrlist_Arr: ArrayList<Array<String>> = ArrayList<Array<String>>([["hello","Cangjie"],["hello","Cangjie"]])
    let Arrlist_Arrlist: ArrayList<ArrayList<String>> = ArrayList<ArrayList<String>>([ArrayList<String>(["hello","Cangjie"]),ArrayList<String>(["hello","Cangjie"])])
    let Arrlist_Hset: ArrayList<HashSet<Rune>> = ArrayList<HashSet<Rune>>([HashSet<Rune>([r'c',r'a']),HashSet<Rune>([r'n',r'g'])])
    let Arrlist_Hmap: ArrayList<HashMap<Bool,String>> = ArrayList<HashMap<Bool,String>>([HashMap<Bool,String>((true,"cangjie"))])
}

enum C {
    | C1(ArrayList<String>) | C2(ArrayList<Int64>) | C3(ArrayList<ArrayList<String>>) | C4(ArrayList<HashSet<Rune>>) | C5(ArrayList<HashMap<Bool,String>>) 
}


main() {
    // ArrayList<String>
    var ss:String = """
                    Hello
                    CangJie!
                    """
    let Arrlist_str: ArrayList<String> = ArrayList<String>(["hello","Cangjie",ss])
    
    // ArrayList<Array<>>
    let Arrlist_Arr: ArrayList<Array<String>> = ArrayList<Array<String>>([["hello","Cangjie"],["hello","Cangjie"]])
    let Arrlist_Arrlist: ArrayList<ArrayList<String>> = ArrayList<ArrayList<String>>([ArrayList<String>(["hello","Cangjie"]),ArrayList<String>(["hello","Cangjie"])])
    let Arrlist_Hset: ArrayList<HashSet<Rune>> = ArrayList<HashSet<Rune>>([HashSet<Rune>([r'c',r'a']),HashSet<Rune>([r'n',r'g'])])
    let Arrlist_Hmap: ArrayList<HashMap<Bool,String>> = ArrayList<HashMap<Bool,String>>([HashMap<Bool,String>((true,"cangjie"))])

    // ArrayList<class>
    var a: A = A() 
    let Arrlist_cls: ArrayList<A> = ArrayList<A>([a, a])
    
    // ArrayList<struct>
    var b: B = B()
    let Arrlist_struct: ArrayList<B> = ArrayList<B>([b, b])

    // ArrayList<enum>
    let c1 = C.C1(Arrlist_str)
    let c2 = C.C2(ArrayList<Int64>([1,2,3]))
    let c3 = C.C3(Arrlist_Arrlist)
    let c4 = C.C4(Arrlist_Hset)
    let c5 = C.C5(Arrlist_Hmap)

    let c : ArrayList<C> = ArrayList<C>([c1,c2,c3,c4,c5])


}
