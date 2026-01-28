// DEPENDENCE: main.cj
// EXEC: %compiler main.cj --compile-target=exe -o main.o --experimental
// ASSERT: scan --compile-target only takes effect when --output-type=obj, this option will be ignored in other scenarios