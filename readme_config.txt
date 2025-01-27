py manage.py runsslserver 0.0.0.0:443 --certificate certs/bgpmonsec.crt --key certs/bgpmonsec.key

comand de rulare


route-map RPKI_POLICY permit 40
 match rpki invalid

route-map RPKI_POLICY permit 1
 match rpki not-found

route-map RPKI_POLICY permit 30
 match rpki valid
 set local-preference 200



 SP1#srs prefix
ip prefix-list ALLOW_UNKNOWN seq 10 deny 1.29.153.0/24
ip prefix-list ALLOW_UNKNOWN seq 15 deny 50.50.50.128/25
 match ip address prefix-list ALLOW_UNKNOWN
SP1#srs route map
SP1#srs route-map
 neighbor 10.10.10.2 route-map RPKI_POLICY in
 neighbor 10.40.40.2 route-map RPKI_POLICY in
route-map RPKI_POLICY permit 5
 match ip address prefix-list ALLOW_UNKNOWN
 set local-preference 150
route-map RPKI_POLICY deny 20
 match rpki not-found
route-map RPKI_POLICY permit 30
 match rpki valid
 set local-preference 200
