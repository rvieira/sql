# Source Code List Targets
if (len(sys.argv) <> 1 ):
    print "Usage: emcli @list_targets.py OSname"
    exit()
login( username="gouranga", password="password")
myDBs = list( resource="Targets", search="TARGET_TYPE='oracle_database'" )            
for DB in myDBs.out()['data']:
    # we get the host info for the oracle database target
    hostinfo = list( resource="Targets",
    search="TARGET_NAME='" + DB['HOST_NAME'] + "'" )
    # the above one should return only one item, so we use the first item
    OS = hostinfo.out()['data'][0]['TYPE_QUALIFIER1']
    # we print only the targets if their OS name equal to the first argument of script
    if ( OS.lower() == sys.argv[0].lower() ):
        print DB['TARGET_NAME'],hostinfo.out()['data'][0]['TYPE_QUALIFIER1']

# End of script list_targets.py