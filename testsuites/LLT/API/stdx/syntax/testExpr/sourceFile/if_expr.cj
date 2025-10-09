func test(): Unit {
    if (true) {}
    if (x == 1) {} else {}
    if (x && y + 1 > 2) {
        println()
    } else if (let Some(f) <- d && f > 3) {
        println()
    } else if (let Some(_) <- a || let Some(_) <- d) {
        return
    } else {
        return
    }
    if (true) {
        while(true) {
            do {
                println()
            } while(true)
        }
    }
    if (a == 1 || b > 3 && (c < 1 && let Some(d) <- f)) {}
    if (let a <- d || let a <- d) {}
}