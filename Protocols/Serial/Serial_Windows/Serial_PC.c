//wwww.ArunEworld.com
//20171222
//This example helps to find "Opening and Closing" a Serial Port in Windows 32 or 64 bit
// Credits : xanthium
// This was compiled using TDM-GCC 4.9.2 64-bit Release


#include<windows.h>
#include<stdio.h>
int main()
{
  HANDLE hComm;

  hComm = CreateFile("\\\\.\\COM7",                //port name (Change the correct port-refer : Device Manager)
                      GENERIC_READ | GENERIC_WRITE, //Read/Write
                      0,                            // No Sharing
                      NULL,                         // No Security
                      OPEN_EXISTING,// Open existing port only
                      0,            // Non Overlapped I/O
                      NULL);        // Null for Comm Devices

  if (hComm == INVALID_HANDLE_VALUE)
      printf("Error in opening serial port");
  else
      printf("opening serial port successfull");

  CloseHandle(hComm);//Closing the Serial Port

  getch();
  return 0;
  
}

/*Output : if serial port successfully open

opening serial port successfull

*/
