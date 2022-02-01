#include<stdio.h>
#include<mpi.h>
int main(int argc, char **argv)
  {
     char in[4];  // Send 4 characters
     int  out;    // Interprete as an integer
  
     int numprocs;
     int myid;
     int i;
  
     MPI_Init(&argc,&argv);
     MPI_Comm_size(MPI_COMM_WORLD,&numprocs);
     MPI_Comm_rank(MPI_COMM_WORLD,&myid);
  
     if(myid == 0)
     {
        //cout << "We have " << numprocs << " processors" << endl;
        printf("We have %d processors \n", numprocs);
        MPI_Recv(&out, 1, MPI_INT, 1, 0, MPI_COMM_WORLD, NULL);
        //cout << "Received this number from proc 1: " << out << endl;   
        printf("Received this number from proc 1: %d", out);
     }
     else  if ( myid == 1 )
     { 
        in[0] = '2'; in[1] = 1; in[2] = 0; in[3] = 0;
  
        MPI_Send(in, 4, MPI_CHAR, 0, 0, MPI_COMM_WORLD);     
     }
  
     MPI_Finalize();
  }