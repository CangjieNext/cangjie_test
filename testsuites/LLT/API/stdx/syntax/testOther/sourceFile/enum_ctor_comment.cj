// leading comment belong to enumDecl
enum MixedStatus {
    /**
     * doc comment belong to Unhealthy
     */
    Unhealthy
    /**
     * doc comment belong to Degraded
     */
    | Degraded
    /**
     * doc comment belong to Healthy
     */
    | Healthy
}

// leading comment belong to enumDecl
enum AllPipeStatus {
    // comment belong to Unhealthy
    | Unhealthy
    // comment belong to Degraded
    | Degraded
    // comment belong to Healthy
    | Healthy
}