/** file leading comments
*/

func a()
// leading comment belong to block
{
// inner comment belong to block

// inner comment group2 belong to block
}

// leading comment belong to varDecl
let a = 1 /* comment belong to 1 */ +
// comment belong to 2
2


// leading comment belong to classDecl
class a {}


// leading comment belong to funcDecl
protected /* comment belong to protected*/ unsafe func a() {} // trail comment belong to funcDecl

protected
// comment belong to unsafe
unsafe func a() {}

class A {
    // leading comment of staticInit
    static init() {}

    // leading comment of var a
    var a = 1

    // leading comment of var b

    var b = 2

    // leading comment of propDecl
    prop a: Unit {
        get() {
            ()
        }
    }
}

class A { // leading comment of var a
    var a = 1

    // inner comment of body
}

func foo(/* h inner comment of parameterList*/) {}

// commentGroup1 belong to interface

// commentGroup2 belong to interface
interface A {}

func greet(
    name: string /* 用户名 */,
    age: int     // 用户年龄
) {}

func a() {

} // belong to func a

func b() {

}

/** file trailing comments
*/