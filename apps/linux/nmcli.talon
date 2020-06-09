os: linux
tag: terminal
-

net man running: "nmcli -t -f RUNNING general\n"
net man status: "nmcli general\n"
net man connect :
    insert("nmcli con up ")
    key(tab)
net man disconnect :
    insert("nmcli con down ")
    key(tab)
#net man connect work vpn: "nmcli con up work_vpn\n"
#net man disconnect work vpn: "nmcli con down work_vpn\n"
