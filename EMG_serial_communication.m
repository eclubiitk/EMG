function Mbed()


try
    %create serial object to represent connection to mbed
    mbed = Bluetooth('HC-05', 1); 
         
    fopen(mbed);        %open serial connection

    
  
    x=zeros(40);
    for i=1:40
        
        x(i) = fscanf(mbed, '%f');    %to take 40 continuous inputs
              
    end
    y=sim(net,x');  %net is the trained network which will help in pattern recognition
    disp(y);    
    fclose(mbed);   %close connection (this should never be reached when using while(1), but included for completeness)
    
catch
    %in case of error or mbed being disconnected
    disp('Failed!');
    fclose(mbed);   %close connection to prevent COM port being lokced open
end 