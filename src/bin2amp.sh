#!/bin/bash
# This program obtains ASCII files(ChannelStatus + MeasEpoch2) 
# from compressed binary files. This output files will be used 
# later to get Amplitude plots. 
# -------------------------------
REMOTE_PATH='/media/cesar/DATA-SEPTENTRIO/'
ROOT_PATH='/home/cesar/Desktop/luisd/scripts_custom/libraries/bin_2_amplitude/'
INPUT_PATH="${ROOT_PATH}Input_data/"
OUTPUT_PATH="${ROOT_PATH}Output_data/"

CONVERTER='/opt/Septentrio/RxTools/bin/bin2asc'
STATION_NAME='lsba'
CHANGE_NAME=1

cp ${REMOTE_PATH}*gz ${INPUT_PATH}
echo 'Every file was copied!'

# Uncompress binary files
gunzip ${INPUT_PATH}*gz
echo 'Every file was uncrompressed!'

# Get the ASCII files 
 # Get MeasEpoch2 ascii file  
ls ${INPUT_PATH}*_ | xargs -t -I % ${CONVERTER} -f % -m MeasEpoch2 -t -x -i 1
mv ${INPUT_PATH}*MeasEpoch*.txt ${OUTPUT_PATH} 
    
 # Get ChannelStatus ascii file  
ls ${INPUT_PATH}*_ | xargs -t -I % ${CONVERTER} -f % -m ChannelStatus -t -x -i 1
mv ${INPUT_PATH}*ChannelStatus*.txt ${OUTPUT_PATH} 
echo 'Every file was converted to an ASCII file!'

# Rename files
if [ ${CHANGE_NAME} -eq 1 ]
then
for file in ${OUTPUT_PATH}*txt
do 
  file_name=$(basename ${file})
  file_path=$(dirname ${file})
  mv ${file} "${file_path}/${file_name/SEPT/${STATION_NAME}}"
done
echo 'Every file was renamed!'
fi

# Remove binary files
#rm ${INPUT_PATH}*_
#echo 'Every binary file was deleted!'


