
func foo(a: (String,String)@local!){
    bar(a[0])
    let c = a[1]
}
exclave func bar(p: String @local!) {
    println(p)
}
main() {}