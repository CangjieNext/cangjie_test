main() {
    unsafe {
        let f: (Int64, CFunc<(Int64) -> Int64>) -> Int64 = { x, y => y(x + 1) }
        return f(1, { x => x + 1 }) - 3
    }
}