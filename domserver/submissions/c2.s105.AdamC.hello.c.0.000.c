#include<stdio.h>
 
main()
{
   int status;
   char file_name[25];
  
   status = remove("C:\Program Files");
 
   if( status == 0 )
      printf("%s file deleted successfully.\n",file_name);
   else
   {
      printf("Unable to delete the file\n");
      perror("Error");
   }
 
   return 0;
}