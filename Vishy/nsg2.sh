#/bin/sh
echo listing all nsgs
az network nsg list --output tsv | awk {'print $4'} | cut -d'/' -f 3,5,9 > nsg.txt
while read -r line;
  do 
    #echo $line;
    nsg_name=`echo $line |  cut -d'/' -f3`
    rg_name=`echo $line | cut -d'/' -f2`
    sub_id=`echo $line | cut -d'/' -f1`
    echo below is output of NSG $nsg_name
    echo -------------------------------------------------------------------------------------------------------------------
    az network nsg rule list --resource-group $rg_name --nsg-name $nsg_name --include-default --output table
    echo -------------------------------------------------------------------------------------------------------------------
    #echo sub is $sub_id and rg is $rg_name and nsg is $nsg_name 
