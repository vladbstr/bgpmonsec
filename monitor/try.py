from pysnmp.hlapi import *

def snmp_get(ip, community, oid):
    errorIndication, errorStatus, errorIndex, varBinds = next(
        getCmd(SnmpEngine(),
               CommunityData(community),
               UdpTransportTarget((ip, 161)),
               ContextData(),
               ObjectType(ObjectIdentity(oid)))
    )

    if errorIndication:
        print(errorIndication)
    elif errorStatus:
        print('%s at %s' % (errorStatus.prettyPrint(), errorIndex and varBinds[int(errorIndex)-1] or '?'))
    else:
        for varBind in varBinds:
            print(' = '.join([x.prettyPrint() for x in varBind]))

# Exemplu de utilizare
snmp_get('1.1.1.4', 'public', '1.3.6.1.2.1.15.3.1')  # Schimbați 'ROUTER_IP' cu adresa IP reală a routerului
#snmp_get('1.1.1.4', 'public', '1.3.6.1.2.1.4.24.7')