README 
-------
-------
This script converts binary files into ASCCII files:
MeasEpoch2 and ChannelStatus

INPUT FILES:
       ~/Input_data/*22_.gz

OUTPUT FILES:
       ~/Output_data/*MeasEpoch2.txt
       ~/Output_data/*ChannelStatus.txt

How does it work?
-----------------
   1) Place the input files in the folder:
      ~/Input_data/
   2) Run the script:
      bin2amp.sh
   3) The output files will be saved in the folder:
      ~/Output_data/

OJO: In order to process many binary files more
     efficiently, follow the following steps:
   1) Change the REMOTE_PATH
   2) Run the script:
      bin2amp_aux.sh
   3) The output files will be saved in the folder:
      ~/Output_data/

----------------------------------enjoy using it! :)       
