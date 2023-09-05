#include "stdio.h"
#include "stdlib.h"
#include "sys/ipc.h"
#include "sys/shm.h"
#include "common.h"


#define LEN 80U

//Writer

int main(int argc, char * argv[])
{
	char * buff;
	int ret;

	int shm_id = shmget(SHM_KEY, 0, 0);

	if( shm_id == -1 )
	{
		exit(-1);
	}
	
	buff = shmat(shm_id,0,0);

	printf("%s\n",buff);

	ret = shmdt(buff);
	if( ret == 0)
	{
		printf("Memory dettached\n");
	}

	return 0;
}
