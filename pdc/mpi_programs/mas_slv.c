#include "mpi.h" 
#include<stdio.h>
#include<string.h>
  
  int main(int argc, char **argv) 
  { 
     char reply[100]; 
     char buff[128]; 
  
     int numprocs; 
     int myid; 
     int i; 
  
     MPI_Status stat; 

     MPI_Init(&argc,&argv); 

     MPI_Comm_size(MPI_COMM_WORLD,&numprocs); 
     MPI_Comm_rank(MPI_COMM_WORLD,&myid); 
  

     /* -----------------------------------------
        Master process
        ----------------------------------------- */
     if(myid == 0) 
     { 
        printf("WE have %d processors\n", numprocs); 
  
        /* -----------------------------------------
           Master process: send msg with tag 1234
           ----------------------------------------- */
        for(i=1;i < numprocs;i++) 
        { 
           sprintf(buff, "Hello %d", i); 

           MPI_Send(buff, 128, MPI_CHAR, i, 1234, MPI_COMM_WORLD); 
        } 
  
        /* ---------------------------------------------
           Master process: wait for msg with tag 4444
           --------------------------------------------- */
        for(i=1;i < numprocs;i++) 
        { 
           MPI_Recv(buff, 128, MPI_CHAR, i, 4444, MPI_COMM_WORLD, &stat); 
           //cout << buff << endl;
           printf("%s\n", buff);
        } 
     } 
     else 
     /* -----------------------------------------
        Slave process: receive msg with tag 1234
        ----------------------------------------- */
     { 
        /* -----------------------------------------
           Slave process: receive msg with tag 1234
           ----------------------------------------- */
        MPI_Recv(buff, 128, MPI_CHAR, 0, 1234, MPI_COMM_WORLD, &stat); 
  
        sprintf(reply, 
                " |--> Hello 0, Processor %d is present and accounted for !", 
                myid); 
        strcat(buff, reply);

        /* --------------------------------------------
           Slave process: send back msg with tag 4444
           -------------------------------------------- */
        MPI_Send(buff, 128, MPI_CHAR, 0, 4444, MPI_COMM_WORLD); 
     } 
  
     MPI_Finalize(); 
  }