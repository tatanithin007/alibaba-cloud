echo "Username: $1";
echo "{
    'apiUrl':'https://msbauthentication.com/autocontrol/api/getdevicecampaignuplfile.php?deviceid=$1',
    'apiKey':'',
'startupscript':'index.py',
    'scriptlocation':'/files',
    'lfolder':'/log',
    'lfile':'api.log',
    'searchstring':'Yes',
    'trackfolder':'/track',
    'pyjobtracklog':'pyjobtrack.log'
}"