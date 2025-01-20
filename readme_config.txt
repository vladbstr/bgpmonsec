py manage.py runsslserver 0.0.0.0:443 --certificate certs/bgpmonsec.crt --key certs/bgpmonsec.key

comand de rulare


route-map RPKI_POLICY deny 10
 match rpki invalid

route-map RPKI_POLICY deny 20
 match rpki not-found

route-map RPKI_POLICY permit 30
 match rpki valid
 set local-preference 200