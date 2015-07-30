#include "mbed.h"
AnalogIn ain(p19);
Serial blue(p9,p10);         // TX,RX

int main()
{
    blue.baud(9600);
    float val[40],sum;
    
    while(1){
        sum=0;
    for(int i=0;i<5;i++)
    {val[i]=ain.read();
    sum+=val[i];
    wait(0.025); 
    }
    if(sum/5>0.02){                        //average threshold value for input
        for(int i=0;i<5;i++)
           blue.printf("%f",val[i]);        //printing next 35 inputs
        for(int i=0;i<35;i++){

         blue.printf("%f",ain.read());
         wait(0.025);
         }
        
        }
    }
}    
