# IIS-domain-binding-batch-script
an IIS domain helper doing batch biding of URL listed on text file

#NOTE :: this batch file only works on window OS only

#::::::::::::::::::::::::::::
#:: batch_dns_binding file
#::::::::::::::::::::::::::::

#@REM appcmd set site /site.name:your_iis_site_name_here /+bindings.[protocol='http',bindingInformation='your_ip_here:your_port:your_dns(doman_name)_here']
#@REM parameters 
#@REM  /site.name:your_iis_site_name_here
#@REM  /+bindings.[protocol='http' just change to https or http 
#@REM bindingInformation='your_ip_here:your_port:your_dns(doman_name)_here'] 3 section that correspond to binding information in IIS 

#::::::::::::::::::::::::::::
#:: batch_dns_unbinding file
#::::::::::::::::::::::::::::

#@REM appcmd set site /site.name:your_iis_site_name_here /+bindings.[protocol='http',bindingInformation='your_ip_here:your_port:your_dns(doman_name)_here']
#@REM parameters 
#@REM  /site.name:your_iis_site_name_here
#@REM  /+bindings.[protocol='http' just change to https or http 
#@REM bindingInformation='your_ip_here:your_port:your_dns(doman_name)_here'] 3 section that correspond to binding information in IIS 

#::::::::::::::::::::::::::::
#:: domain_list file
#::::::::::::::::::::::::::::

# a list of your domain name

