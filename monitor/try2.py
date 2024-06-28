import ipaddress

ip_network = '50.50.0.0/16'

# Parsează adresa IP și masca de subnetare
network = ipaddress.ip_network(ip_network, strict=False)

# Extrage clasa și masca
network_class = network.network_address
subnet_mask = network.prefixlen

print(f"Network: {network_class}")
print(f"Class: {network_class}/{subnet_mask}")
print(f"Subnet Mask: {subnet_mask}")