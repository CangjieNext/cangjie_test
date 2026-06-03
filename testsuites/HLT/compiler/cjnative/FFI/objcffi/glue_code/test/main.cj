package objc.foundation

main(): Unit {
    let string = "hello!"
    let ns_string = NSString(string)
    println(ns_string.toString())
}
