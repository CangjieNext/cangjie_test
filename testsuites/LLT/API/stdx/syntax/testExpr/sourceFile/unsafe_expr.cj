func testFunc(): Unit {
    unsafe {}
    unsafe { data.rawData() }[1..]
    let (a, b) = (unsafe { data.rawData() }, 1)
}