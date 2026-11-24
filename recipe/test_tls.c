#include <stdio.h>
#include <string.h>
#include <nng/nng.h>

int main(void) {
    nng_tls_config *cfg;
    const char *engine;
    int rv = nng_tls_config_alloc(&cfg, NNG_TLS_MODE_CLIENT);
    if (rv != 0) {
        fprintf(stderr, "nng_tls_config_alloc: %s\n", nng_strerror(rv));
        return 1;
    }
    nng_tls_config_free(cfg);
    engine = nng_tls_engine_name();
    printf("nng TLS engine: %s\n", engine);
    if (strcmp(engine, "mbed") != 0) {
        fprintf(stderr, "expected the Mbed TLS engine\n");
        return 1;
    }
    return 0;
}
