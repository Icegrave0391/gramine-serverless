#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <asm/sgx.h>
#include <fcntl.h>
int main(int argc, char* argv[]) {
    int sgx_fd = open("/dev/sgx_enclave", O_RDWR|O_CLOEXEC, 0666);
    if (sgx_fd < 0) {
        printf("open sgx device failed\n");
        exit(1);
    }
    FILE* fptr = fopen(argv[1], "a+");
    // unsigned long t = 0;
    // ioctl(sgx_fd, SGX_IOC_ENCLAVE_GET_STAT, &t); 
    // printf("%d\n", t); 
    // fprintf(fptr, "req: %s, memory: %d\n", argv[2], t);
    // fflush(fptr);
    while(1) {
        unsigned long t = 0;
        ioctl(sgx_fd, SGX_IOC_ENCLAVE_GET_STAT, &t); 
        fprintf(fptr, "memory: %d\n", t);
        fflush(fptr);
        sleep(1);
    }
    close(sgx_fd);
    fclose(fptr);
    return 0;
}
