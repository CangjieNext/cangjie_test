main() {
    quote((x))
    quote(quote(x))
    quote($(quote(x)))
    quote($(quote($t)))
    quote($x + 2)
    quote(1 + ($x + 1) * 2)
    quote(@PlusOne(x))
    quote(@PlusOne($x))
    quote(1 + @PlusOne(x) * 2)
}