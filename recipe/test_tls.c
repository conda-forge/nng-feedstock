#include <stdio.h>
#include <nng/nng.h>
#include <nng/supplemental/tls/tls.h>

int main(void) {
    nng_tls_config *cfg;
    int rv = nng_tls_config_alloc(&cfg, NNG_TLS_MODE_CLIENT);
    if (rv != 0) {
        fprintf(stderr, "nng_tls_config_alloc: %s\n", nng_strerror(rv));
        return 1;
    }
    nng_tls_config_free(cfg);
    printf("nng TLS engine: %s\n", nng_tls_engine_name());
    return 0;
}
