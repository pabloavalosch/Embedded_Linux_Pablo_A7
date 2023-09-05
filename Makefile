CC ?= gcc

APP_NAME_SHM_WRITER = shm_write
OBJ_FILES_SHM_WRITER = shm_write.o

APP_NAME_SHM_READER = shm_reader
OBJ_FILES_SHM_READER = shm_reader.o

LIBS = .

all: $(APP_NAME_SHM_READER) $(APP_NAME_SHM_WRITER)

$APP_NAME_SHM_WRITER : $(APP_NAME_SHM_WRITER)
	$(CC) -O $@ $^ -L$(LIBS)

$APP_NAME_SHM_READER : $(APP_NAME_SHM_READER)
	$(CC) -O $@ $^ -L$(LIBS)



%.o: %.c
	$(CC) -o $@ -c $^ -g

clean:
	rm *.o $(APP_NAME_SHM_WRITER)
	rm *.o $(APP_NAME_SHM_READER)



fresh:
	make clean
	make all
