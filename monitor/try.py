import paramiko

def fetch_bgp_data():
    host = "192.168.0.1"
    port = 22
    username = "admin"
    password = "cisco"
    command = "show ip bgp summary"
    
    print("Connecting to the router...")
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(host, port, username, password)
    
    print("Executing command...")
    stdin, stdout, stderr = client.exec_command(command)
    output = stdout.read().decode()

    print("Command executed. Output:")
    print(output)
    
    client.close()
    
    print("Parsing output...")
    lines = output.splitlines()
    
    # Find the start of the neighbor table
    start_parsing = False
    for line in lines:
        if start_parsing:
            parts = line.split()
            if len(parts) < 10:
                print(f"Skipping line (not enough parts): {line}")
                continue
            
            neighbor_ip = parts[0]
            state = parts[9]  # Adjust if state column is different
            uptime = parts[8]  # Adjust if uptime column is different
            flaps = 0  # As per your output, there is no flaps info. Adjust if needed.
            
            print(f"Neighbor IP: {neighbor_ip}")
            print(f"State: {state}")
            print(f"Uptime: {uptime}")
            print(f"Flaps: {flaps}")
        
        
        if line.startswith("Neighbor"):
            start_parsing = True
    
    print("Data collection and storage complete.")

fetch_bgp_data()